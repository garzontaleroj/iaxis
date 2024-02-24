package axis.service.modal;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_COBRADOR;
import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.mvc.control.modal.Axisadm061Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AjaxContainerService;
import axis.service.axis.AxisBaseService;
import axis.service.axis.Axisctr001Service;
import axis.util.Constantes;

/**
 * Axisadm061Service.java
 * 
 * @author <a href="mailto:icanada@csi-ti.com">Ivan Canada</a>
 */
public class Axisadm061Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE INICIALIZACION
	 *******************************************/
	/*********************************************************************************************************************/

	public void m_init(HttpServletRequest request, Axisadm061Action thisAction) {
		logger.debug("Axisadm061Service m_init");
		try {
			// this.cargaListas(request);
		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm061Service - m�todo m_init", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));

	}

	public void m_form(HttpServletRequest request, Axisadm061Action thisAction) {
		logger.debug("Axisadm061Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {

			Map LISTVALORES = new HashMap();

			PAC_IAX_LISTVALORES pacIaxListValores = new PAC_IAX_LISTVALORES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map map = pacIaxListValores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTEMPRESAS();
			logger.debug(map);
			LISTVALORES.put("LSTEMPRESAS", tratarRETURNyMENSAJES(request, map));
			formdata.put("LISTVALORES", LISTVALORES);

			BigDecimal CRAMO = this.getCampoNumerico(request, "CRAMO");
			BigDecimal CEMPRES = this.getCampoNumerico(request, "CEMPRES");
			BigDecimal AuxCempres;

			logger.debug("CRAMO --->" + CRAMO);

			if (isEmpty(CEMPRES))
				AuxCempres = usuario.getCempres();
			else
				AuxCempres = CEMPRES;

			formdata.put("CEMPRES", AuxCempres);
			Map ramos = pacIaxListValores.ejecutaPAC_IAX_LISTVALORES__F_GET_CRAMO_EMP(AuxCempres);
			logger.debug(ramos);
			request.setAttribute("DOM_LSTRAMOS", tratarRETURNyMENSAJES(request, ramos, false));
			logger.debug(CEMPRES + "m_form CEMPRES");

			if (isEmpty(CRAMO)) {
				Map m = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_LISTVALORES__F_GET_PRODUCTOS(getCampoTextual(request, "tipo"), AuxCempres,
								null);
				logger.debug(m);
				request.setAttribute("DOM_LSTPRODUCTOS", tratarRETURNyMENSAJES(request, m, false));
			} else {
				BigDecimal CTERMFIN = BigDecimal.ZERO; // TODO: Hard-coded CTERMFIN
				Map m = pacIaxListValores.ejecutaPAC_IAX_LISTVALORES__F_GET_RAMPRODUCTOS(null, CRAMO, CTERMFIN);
				logger.debug(m);
				request.setAttribute("DOM_LSTPRODUCTOS", tratarRETURNyMENSAJES(request, m, false));
			}

			this.m_cargar_listas(request, thisAction);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm054Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		this.gestionarOrdenacionTablas(request);
	}

	public void m_cargar_listas(HttpServletRequest request, Axisadm061Action thisAction) {
		logger.debug("Axisadm061Service m_cargar_listas");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {
			Map map_tipcuen = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTTIPOCUENTA();
			List listaCuenta = (List) tratarRETURNyMENSAJES(request, map_tipcuen);
			formdata.put("listaCuenta", listaCuenta);
			listaCuenta = null;

		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm061Service - m�todo m_cargar_listas", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));

	}

	/**
	 * 
	 * @param request
	 */
	@SuppressWarnings("all")
	public void m_ajax_actualizar_combos(HttpServletRequest request) {
		logger.debug("Axisadm061Service m_actualizar_combos");
		AjaxContainerService ajax = new AjaxContainerService();
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map<String, Map> ajaxResponse = new HashMap<String, Map>();

		try {
			char comboOrigen = getCampoTextual(request, "comboOrigen").charAt(0);
			BigDecimal CEMPRES = getCampoNumerico(request, "CEMPRES");
			BigDecimal CRAMO = getCampoNumerico(request, "CRAMO");

			logger.debug("CEMPRES  ---------> " + CEMPRES);
			logger.debug("comboOrigen  ---------> " + comboOrigen);

			Map ramos = new HashMap();
			Map productos = new HashMap();

			PAC_IAX_LISTVALORES pacIaxListValores = new PAC_IAX_LISTVALORES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			switch (comboOrigen) {
			case 'E': // Cargar Ramos
				if (!isEmpty(CEMPRES)) {
					ramos = pacIaxListValores.ejecutaPAC_IAX_LISTVALORES__F_GET_CRAMO_EMP(CEMPRES);
					logger.debug("CARGO RAMOS ---------> " + ramos);
					ajax.rellenarPlAContenedorAjax(ramos);
					ajaxResponse.put("CRAMO", ramos);
					request.setAttribute("DOM_LSTRAMOS", tratarRETURNyMENSAJES(request, ramos));

					if (isEmpty(CRAMO)) {
						Map m = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
								.ejecutaPAC_IAX_LISTVALORES__F_GET_PRODUCTOS(getCampoTextual(request, "tipo"),
										this.getCampoNumerico(request, "CEMPRES"), null);
						logger.debug("CARGO PRODUCTOOOOOOS ---------> " + m);
						ajax.rellenarPlAContenedorAjax(m);
						ajaxResponse.put("SPRODUC", m);
						request.setAttribute("DOM_LSTPRODUCTOS", tratarRETURNyMENSAJES(request, m, false));
					}
				}
				break;

			case 'R': // Cargar Productos
				if (!isEmpty(CRAMO)) {
					BigDecimal CTERMFIN = BigDecimal.ZERO; // TODO: Hard-coded CTERMFIN
					productos = pacIaxListValores.ejecutaPAC_IAX_LISTVALORES__F_GET_RAMPRODUCTOS(null, CRAMO, CTERMFIN);
					logger.debug(productos);
					ajax.rellenarPlAContenedorAjax(productos);
					ajaxResponse.put("SPRODUC", productos);
					request.setAttribute("DOM_LSTPRODUCTOS", tratarRETURNyMENSAJES(request, productos));
				} else {
					Map m = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
							.ejecutaPAC_IAX_LISTVALORES__F_GET_PRODUCTOS(getCampoTextual(request, "tipo"),
									this.getCampoNumerico(request, "CEMPRES"), null);
					logger.debug("CARGO PRODUCTOOOOOOS ---------> " + m);
					ajax.rellenarPlAContenedorAjax(m);
					ajaxResponse.put("SPRODUC", m);
					request.setAttribute("DOM_LSTPRODUCTOS", tratarRETURNyMENSAJES(request, m, false));
				}
				break;
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm036Service - m�todo m_actualizar_combos", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			logger.debug("FINALLY");
			ajax.guardarContenidoFinalAContenedorAjax(ajaxResponse);
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	/**
	 * Realiza una b�squeda de productos por Ajax.
	 * 
	 * @see Axisctr001Service#buscaProductos
	 * @param request El HttpServletRequest que contiene la petici�n del cliente
	 *                web.
	 */
	public void m_ajax_actualizar_agente(HttpServletRequest request) {
		logger.debug("Axisadm061Service m_ajax_busqueda_productos");
		AjaxContainerService ajax = new AjaxContainerService();

		try {
			String CAGENTE = getCampoTextual(request, "CAGENTE");
			Map m = (Map) this.ActualizaAgente(request, CAGENTE);
			ajax.rellenarPlAContenedorAjax(m);
			ajax.guardarContenidoFinalAContenedorAjax(m);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr001Service - m�todo m_ajax_actualizar_agente", e);
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
	private Map ActualizaAgente(HttpServletRequest request, String CAGENTE) throws Exception {
		Map mapAgentes = new HashMap();

		// Cargar Agente de la BD
		Map agente = new HashMap();
		if (!isEmpty(CAGENTE)) {
			UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
			String CONDICION = this.getCampoTextual(request, "CONDICION");
			mapAgentes = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTAGENTES_COND(null, null, new BigDecimal(CAGENTE),
							new BigDecimal(1), CONDICION);
			logger.debug(mapAgentes);
			List agentes = (List) mapAgentes.get("RETURN");

			if (!isEmpty(mapAgentes.get("RETURN")))
				agente = (Map) agentes.get(0);
		}

		request.getSession().setAttribute("axisctr_agente", agente);

		return mapAgentes;
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
			logger.error("Error", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	public void m_buscar(HttpServletRequest request, Axisadm061Action thisAction) {
		logger.debug("Axisadm061Service m_buscar");
		try {

			UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
			Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

			BigDecimal CEMPRES = getCampoNumerico(request, "CEMPRES");
			BigDecimal CCOBBAN = getCampoNumerico(request, "CCOBBAN");
			BigDecimal CTIPBAN = getCampoNumerico(request, "CTIPBAN");
			BigDecimal CDOMENT = getCampoNumerico(request, "CDOMENT");
			String TSUFIJO = getCampoTextual(request, "TSUFIJO");
			BigDecimal CDOMSUC = getCampoNumerico(request, "CDOMSUC");
			BigDecimal CRAMO = getCampoNumerico(request, "CRAMO");
			BigDecimal SPRODUC = getCampoNumerico(request, "SPRODUC");
			BigDecimal CAGENTE = getCampoNumerico(request, "CAGENTE");
			BigDecimal CBANCO = getCampoNumerico(request, "CBANCO");
			String NCUENTA = getCampoTextual(request, "NCUENTA");

			Map map = new PAC_IAX_COBRADOR((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_COBRADOR__F_GET_COBRADOR(CEMPRES, CCOBBAN, CTIPBAN, CDOMENT, TSUFIJO, CDOMSUC,
							CRAMO, SPRODUC, CAGENTE, CBANCO, NCUENTA);
			logger.debug("Lista de Cobradores ---> " + map);

			BigDecimal num = (BigDecimal) tratarRETURNyMENSAJES(request, map, false);
			request.setAttribute("listaCobradores", map.get("PCOBRADOR"));
			BigDecimal INDICE = getCampoNumerico(request, "INDICE");
			logger.debug("INDICE------------>" + INDICE);
			if (isEmpty(INDICE))
				formdata.put("INDICE", 0);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm061Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));

	}

	/**
	 * Realiza una b�squeda de bancos
	 * 
	 * @see Axisadm061Service#bancos
	 * @param request El HttpServletRequest que contiene la petici�n del cliente
	 *                web.
	 */
	public void m_ajax_actualizar_banco(HttpServletRequest request) {
		logger.debug("Axisadm061Service m_ajax_actualizar_banco");
		AjaxContainerService ajax = new AjaxContainerService();

		try {
			BigDecimal CBANCO = getCampoNumerico(request, "CBANCO");
			Map m = (Map) this.ActualizaBanco(request, CBANCO);
			ajax.rellenarPlAContenedorAjax(m);
			ajax.guardarContenidoFinalAContenedorAjax(m);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm061Service - m�todo m_ajax_actualizar_banco", e);
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
			logger.debug(mapBancos);
			List bancos = (List) mapBancos.get("RETURN");
			if (!isEmpty(mapBancos.get("RETURN")))
				banco = (Map) bancos.get(0);
		}

		request.setAttribute("axisctr_banco", banco);
		return mapBancos;
	}

	public void m_ajax_ver_banco(HttpServletRequest request) {
		AjaxContainerService ajax = new AjaxContainerService();
		try {
			BigDecimal CBANCO = getCampoNumerico(request, "CBANCO");

			if (!isEmpty(CBANCO)) {
				UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
				Map map = new PAC_IAX_COBRADOR((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_COBRADOR__F_GET_DESBANCO(CBANCO);
				logger.debug("----> TBANCO axisadm060:" + map.get("PTBANCO"));
				tratarRETURNyMENSAJES(request, map, false);
				ajax.guardarContenidoFinalAContenedorAjax(map);
			}

		} catch (Exception e) {
			logger.error("Error", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

}
