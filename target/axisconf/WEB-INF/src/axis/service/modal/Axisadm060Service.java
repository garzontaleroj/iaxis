package axis.service.modal;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_COBRADOR;
import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.mvc.control.modal.Axisadm060Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AjaxContainerService;
import axis.service.axis.AxisBaseService;
import axis.service.axis.Axisctr001Service;
import axis.util.Constantes;

/**
 * Axisadm060Service.java
 * 
 * @author <a href="mailto:icanada@csi-ti.com">Ivan Canada</a>
 */
public class Axisadm060Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE INICIALIZACION
	 *******************************************/
	/*********************************************************************************************************************/

	public void m_init(HttpServletRequest request, Axisadm060Action thisAction) {
		logger.debug("Axisadm060Service m_init");
		try {
			// this.cargaListas(request);
		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm060Service - m�todo m_init", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));

	}

	public void m_form(HttpServletRequest request, Axisadm060Action thisAction) {
		logger.debug("Axisadm060Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {

			BigDecimal CEMPRES2 = this.getCampoNumerico(request, "CEMPRES");
			BigDecimal CRAMO2 = this.getCampoNumerico(request, "CRAMO");
			logger.debug("CRAMO-----------------> " + CRAMO2);

			if (isEmpty(CEMPRES2)) {
				Map LISTVALORES = new HashMap();

				PAC_IAX_LISTVALORES pacIaxListValores = new PAC_IAX_LISTVALORES(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
				Map map = pacIaxListValores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTEMPRESAS();
				logger.debug(map);
				LISTVALORES.put("LSTEMPRESAS", tratarRETURNyMENSAJES(request, map));
				formdata.put("LISTVALORES", LISTVALORES);
				formdata.put("CEMPRES", usuario.getCempres());

				BigDecimal CRAMO = this.getCampoNumerico(request, "CRAMO");
				BigDecimal CEMPRES = this.getCampoNumerico(request, "CEMPRES");

				if (!isEmpty(CEMPRES)) {
					Map ramos = pacIaxListValores.ejecutaPAC_IAX_LISTVALORES__F_GET_CRAMO_EMP(usuario.getCempres());
					logger.debug(ramos);
					request.setAttribute("DOM_LSTRAMOS", tratarRETURNyMENSAJES(request, ramos, false));
				}
				logger.debug(CEMPRES + "m_form CEMPRES");

				if (isEmpty(CRAMO)) {
					Map m = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
							.ejecutaPAC_IAX_LISTVALORES__F_GET_PRODUCTOS(getCampoTextual(request, "tipo"), CEMPRES,
									null);
					logger.debug(m);
					request.setAttribute("DOM_LSTPRODUCTOS", tratarRETURNyMENSAJES(request, m, false));
				}
			} else {
				Map LISTVALORES = new HashMap();
				PAC_IAX_LISTVALORES pacIaxListValores = new PAC_IAX_LISTVALORES(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
				Map map = pacIaxListValores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTEMPRESAS();
				logger.debug(map);
				LISTVALORES.put("LSTEMPRESAS", tratarRETURNyMENSAJES(request, map));
				formdata.put("LISTVALORES", LISTVALORES);
				formdata.put("CEMPRES", CEMPRES2);
			}

			// Cargamos los datos.
			BigDecimal CCOBAN_BUS = getCampoNumerico(request, "CCOBAN_BUS");
			BigDecimal NORDEN_BUS = getCampoNumerico(request, "NORDEN_BUS");

			if (!isEmpty(NORDEN_BUS)) {
				Map map = new PAC_IAX_COBRADOR((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_COBRADOR__F_GET_COBRADOR_SEL(CCOBAN_BUS, NORDEN_BUS);
				logger.debug("----> Cobradores axisadm060:" + map.get("PCCOBBANSEL"));
				tratarRETURNyMENSAJES(request, map, false);
				if (!isEmpty(map.get("PCCOBBANSEL"))) {
					ArrayList cob = (ArrayList) map.get("PCCOBBANSEL");
					Map co = (Map) cob.get(0);
					formdata.putAll((Map) co.get("OB_IAX_COBBANCARIOSEL"));

					if (!isEmpty(formdata.get("CAGENTE"))) {
						// Cargamos la descripci�n del AGENTE
						String CAGENTE = ((BigDecimal) formdata.get("CAGENTE")).toString();
						Map m = (Map) this.ActualizaAgente(request, CAGENTE);
						ArrayList lcage = (ArrayList) m.get("RETURN");
						if (!isEmpty(lcage)) {
							Map m_cage = (Map) lcage.get(0);
							formdata.put("CAGENTE_TEXT", m_cage.get("CODI"));
							formdata.put("NOMBRE_TEXT", m_cage.get("NOMBRE"));
						}
					}

					if (!isEmpty(formdata.get("CBANCO"))) {
						// Cargamos la descripci�n del BANCO
						BigDecimal CBANCO = (BigDecimal) formdata.get("CBANCO");
						Map m2 = (Map) this.ActualizaBanco(request, CBANCO);
						ArrayList lban = (ArrayList) m2.get("RETURN");

						if (!isEmpty(lban)) {
							Map m_ban = (Map) lban.get(0);
							formdata.put("CBANCO", m_ban.get("CBANCO"));
							formdata.put("TBANCO", m_ban.get("TBANCO"));
						}
					}

					formdata.put("CMODO", "MODIF");
				}
			} else {
				formdata.put("CMODO", "NUEVO");
			}

			// this.m_cargar_listas(request, thisAction);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm054Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		this.gestionarOrdenacionTablas(request);
	}

	/**
	 * 
	 * @param request
	 */
	@SuppressWarnings("all")
	public void m_ajax_actualizar_combos(HttpServletRequest request) {
		logger.debug("Axisadm060Service m_actualizar_combos");
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

	public void m_aceptar(HttpServletRequest request, Axisadm060Action thisAction) {
		logger.debug("Axisadm059Service m_aceptar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {

			BigDecimal CCOBBAN = getCampoNumerico(request, "CCOBAN_BUS");
			BigDecimal NORDEN = getCampoNumerico(request, "NORDEN");
			BigDecimal CRAMO = getCampoNumerico(request, "CRAMO");
			BigDecimal SPRODUC = getCampoNumerico(request, "SPRODUC");
			BigDecimal CEMPRES = getCampoNumerico(request, "CEMPRES") == null ? getCampoNumerico(request, "CEMPRES_ONE")
					: getCampoNumerico(request, "CEMPRES");
			BigDecimal CBANCO = getCampoNumerico(request, "CBANCO");
			BigDecimal CAGENTE = getCampoNumerico(request, "CAGENTE");
			BigDecimal CTIPAGE = getCampoNumerico(request, "CTIPAGE");
			String CMODO = getCampoTextual(request, "CMODO");

			Map map = new PAC_IAX_COBRADOR((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_COBRADOR__F_SET_COBRADOR_SEL(CCOBBAN, NORDEN, CRAMO, SPRODUC, CEMPRES, CBANCO,
							CAGENTE, CTIPAGE, CMODO);
			logger.debug("Guardar ---> " + map);
			tratarRETURNyMENSAJES(request, map, false);
			if (map.get("RETURN").equals(new BigDecimal(0))) {
				formdata.put("OK", new BigDecimal(1));
			} else {
				formdata.put("OK", new BigDecimal(0));
			}

			// this.m_cargar_listas(request, thisAction);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm059Service - m�todo m_aceptar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		this.gestionarOrdenacionTablas(request);
	}

	/**
	 * Realiza una b�squeda de bancos
	 * 
	 * @see Axisadm060Service#bancos
	 * @param request El HttpServletRequest que contiene la petici�n del cliente
	 *                web.
	 */
	public void m_ajax_actualizar_banco(HttpServletRequest request) {
		logger.debug("Axisadm060Service m_ajax_actualizar_banco");
		AjaxContainerService ajax = new AjaxContainerService();

		try {
			BigDecimal CBANCO = getCampoNumerico(request, "CBANCO");
			Map m = (Map) this.ActualizaBanco(request, CBANCO);
			ajax.rellenarPlAContenedorAjax(m);
			ajax.guardarContenidoFinalAContenedorAjax(m);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm060Service - m�todo m_ajax_actualizar_banco", e);
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
