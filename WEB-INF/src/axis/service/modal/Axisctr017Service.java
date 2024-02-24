package axis.service.modal;

import java.math.BigDecimal;
import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAXPAR_PRODUCTOS;
import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.jdbc.PAC_IAX_PRODUCCION;
import axis.jdbc.PAC_IAX_REDCOMERCIAL;
import axis.mvc.control.modal.Axisctr017Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AjaxContainerService;
import axis.service.axis.AxisBaseService;
import axis.service.axis.Axisctr001Service;
import axis.util.Constantes;

public class Axisctr017Service extends AxisBaseService {
	static Log logger = LogFactory.getLog(Axisctr017Service.class);

	public void m_init(HttpServletRequest request, Axisctr017Action thisAction) {
		logger.debug("Axisctr017Service m_init");
		try {
			request.getSession().removeAttribute("axisctr017_lisa");
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr017Service - mtodo m_init", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	public void m_form(HttpServletRequest request, Axisctr017Action thisAction) {
		logger.debug("Axisctr017Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {
			PAC_IAX_LISTVALORES pacIaxListvalores = new PAC_IAX_LISTVALORES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			HashMap m = null;

			// TODO: PCTERMFIN a hard-code
			/*
			 * m=pacIaxListvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_PRODUCTOS(null,null,
			 * null); logger.debug("m:"+m); tratarRETURNyMENSAJES(request, m,false);
			 * request.setAttribute("productos", m.get("RETURN"));
			 */

			m = pacIaxListvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_SITPOLIZA();
			logger.debug("m:" + m);
			tratarRETURNyMENSAJES(request, m);
			request.setAttribute("sitpoliza", m.get("RETURN"));

			m = pacIaxListvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTCRETENI();
			logger.debug("m:" + m);
			tratarRETURNyMENSAJES(request, m);
			request.setAttribute("estproposta", m.get("RETURN"));

			logger.debug("--" + this.getCampoNumerico(request, "SSEGURO"));

			request.setAttribute("SSEGURO", null);

			logger.debug("--" + this.getCampoNumerico(request, "SSEGURO"));

			logger.debug("--" + formdata.get("SSEGURO"));

			formdata.put("SSEGURO", null);

			m_cargarValors(request, thisAction);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr017Service - mtodo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	public void m_buscar(HttpServletRequest request, Axisctr017Action thisAction) {
		logger.debug("Axisctr017Service m_buscar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {
			PAC_IAX_PRODUCCION pacIaxProduccion = new PAC_IAX_PRODUCCION(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			HashMap m = null;

			if (formdata.get("paginar") == null) {
				request.getSession().removeAttribute("axisctr017_lista");
				BigDecimal CAGENTE = getCampoNumerico(request, "CAGENTE_TEXT");
				String NOMBRE_TEXT = getCampoTextual(request, "NOMBRE_TEXT");
				BigDecimal CRAMO = getCampoNumerico(request, "CRAMO");
				BigDecimal SPRODUC = getCampoNumerico(request, "SPRODUC");
				// INI IAXIS-3194 CJMR 18/03/2019
				BigDecimal CACTIVI = getCampoNumerico(request, "CACTIVI");
				// FIN IAXIS-3194 CJMR 18/03/2019
				BigDecimal NPOLIZA = getCampoNumerico(request, "NPOLIZA");
				BigDecimal NCERTIF = getCampoNumerico(request, "NCERTIF");
				BigDecimal NSOLICI = getCampoNumerico(request, "NSOLICI");
				String NUMIDE = getCampoTextual(request, "NUMIDE");
				String SNIP = getCampoTextual(request, "SNIP");
				String NOMBRE = getCampoTextual(request, "NOMBRE");
				// INI IAXIS-3194 CJMR 18/03/2019
				String NUMIDEASE = getCampoTextual(request, "NUMIDEASE");
				String NOMBREASE = getCampoTextual(request, "NOMBREASE");
				// FIN IAXIS-3194 CJMR 18/03/2019
				BigDecimal CSITUAC = getCampoNumerico(request, "CRETENI");// getCampoNumerico (request, "CSITUAC");
				BigDecimal CRETENI = getCampoNumerico(request, "CRETENI");

				String CMATRIC = getCampoTextual(request, "CMATRICULA");
				String CPOSTAL = getCampoTextual(request, "CPOSTAL");
				String TNATRIE = getCampoTextual(request, "DESCRIPCION");
				String TDOMICI = getCampoTextual(request, "TDOMICI");
				String PCPOLCIA = (String) getCampoTextual(request, "PCPOLCIA");
				Date PFRETTEND = (Date) stringToSqlDate(getCampoTextual(request, "PFRETTEND"));
				Date PFRETTENH = (Date) stringToSqlDate(getCampoTextual(request, "PFRETTENH"));

				String tipo = getCampoTextual(request, "tipo");
				// BUG 27048/160931 - RCL - 10/12/2013
				String CMODO = (String) request.getSession().getAttribute("CMODO");
				if (CMODO != null && "EMISION_MASIVA".equals(CMODO)) {
					tipo = CMODO;
				}

				BigDecimal pcsucursal = getHiddenCampoNumerico(request, "CAGENTE_2");
				BigDecimal pcadn = getHiddenCampoNumerico(request, "CAGENTE_3");
				BigDecimal pcinter = getHiddenCampoNumerico(request, "CAGENTE_4");
				logger.debug("----> pcsucursal:" + pcsucursal + " pcadn:" + pcadn + " pcinter:" + pcinter);

				CAGENTE = isEmpty(CAGENTE) ? pcinter : CAGENTE;

				String CMOTOR = getCampoTextual(request, "CMOTOR");
				String CCHASIS = getCampoTextual(request, "CCHASIS");
				String NBASTID = getCampoTextual(request, "NBASTID");

				// se guardan esos parametros de busqueda para cuando se regcarga la pantalla
				// despues de hacer una operacion de anulacion o emision
				HashMap axisctr017_filtro = new HashMap();

				axisctr017_filtro.put("CAGENTE_TEXT", CAGENTE);
				axisctr017_filtro.put("NOMBRE_TEXT", NOMBRE_TEXT);

				axisctr017_filtro.put("CAGENTE", CAGENTE);
				axisctr017_filtro.put("CRAMO", CRAMO);
				axisctr017_filtro.put("SPRODUC", SPRODUC);
				axisctr017_filtro.put("NPOLIZA", NPOLIZA);
				axisctr017_filtro.put("NCERTIF", NCERTIF);
				axisctr017_filtro.put("NSOLICI", NSOLICI);
				axisctr017_filtro.put("NUMIDE", NUMIDE);
				axisctr017_filtro.put("SNIP", SNIP);
				axisctr017_filtro.put("NOMBRE", NOMBRE);
				axisctr017_filtro.put("CSITUAC", CSITUAC);
				axisctr017_filtro.put("CRETENI", CRETENI);
				axisctr017_filtro.put("CMATRIC", CMATRIC);
				axisctr017_filtro.put("CPOSTAL", CPOSTAL);
				axisctr017_filtro.put("TNATRIE", TNATRIE);
				axisctr017_filtro.put("TDOMICI", TDOMICI);
				axisctr017_filtro.put("tipo", tipo);
				axisctr017_filtro.put("csucursal", pcsucursal);
				axisctr017_filtro.put("cadn", pcadn);
				axisctr017_filtro.put("CMOTOR", CMOTOR);
				axisctr017_filtro.put("CCHASIS", CCHASIS);
				axisctr017_filtro.put("NBASTID", NBASTID);
				axisctr017_filtro.put("PCPOLCIA", getCampoTextual(request, "PCPOLCIA"));
				axisctr017_filtro.put("PFRETTEND", stringToSqlDate(getCampoTextual(request, "PFRETTEND")));
				axisctr017_filtro.put("PFRETTENH", stringToSqlDate(getCampoTextual(request, "PFRETTENH")));
				// INI IAXIS-3194 CJMR 18/03/2019
				axisctr017_filtro.put("CACTIVI", CACTIVI);
				axisctr017_filtro.put("NUMIDEASE", NUMIDEASE);
				axisctr017_filtro.put("NOMBREASE", NOMBREASE);
				// FIN IAXIS-3194 CJMR 18/03/2019

				thisAction.topPila(request, "axisctr017_filtro", axisctr017_filtro);
				request.getSession().setAttribute("axisctr017_filtro", axisctr017_filtro);
				m = pacIaxProduccion.ejecutaPAC_IAX_PRODUCCION__F_GET_POLIZASRETEN(CAGENTE, CRAMO, SPRODUC, NPOLIZA,
						NSOLICI, NCERTIF, NUMIDE, SNIP, NOMBRE, CSITUAC, CMATRIC, CPOSTAL, TDOMICI, TNATRIE, tipo,
						pcsucursal, pcadn, CMOTOR, CCHASIS, NBASTID, PCPOLCIA, PFRETTEND, PFRETTENH, CACTIVI, NUMIDEASE,
						NOMBREASE);

				logger.debug("m:" + m);
				tratarRETURNyMENSAJES(request, m);
				ArrayList axisctr017_lista = (ArrayList) m.get("RETURN");
				request.getSession().setAttribute("axisctr017_lista", axisctr017_lista);
				if (axisctr017_lista.size() > 0) {

					logger.debug(axisctr017_lista.get(0));
					logger.debug(
							((HashMap) ((HashMap) axisctr017_lista.get(0)).get("OB_IAX_POLIZASRETEN")).get("SSEGURO"));
					request.getSession().setAttribute("SSEGURO_CONS",
							((HashMap) ((HashMap) axisctr017_lista.get(0)).get("OB_IAX_POLIZASRETEN")).get("SSEGURO"));
					request.setAttribute("SSEGURO",
							((HashMap) ((HashMap) axisctr017_lista.get(0)).get("OB_IAX_POLIZASRETEN")).get("SSEGURO"));
					formdata.put("SSEGURO",
							((HashMap) ((HashMap) axisctr017_lista.get(0)).get("OB_IAX_POLIZASRETEN")).get("SSEGURO"));
				}

			} else {
				logger.debug("axisctr017 paginando");
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr017Service - mtodo m_buscar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	/**
	 * Realiza una bsqueda de productos por Ajax.
	 * 
	 * @see Axisctr001Service#buscaProductos
	 * @param request El HttpServletRequest que contiene la peticin del cliente web.
	 */
	public void m_ajax_actualizar_agente(HttpServletRequest request) {
		logger.debug("Axisctr001Service m_ajax_busqueda_productos");
		AjaxContainerService ajax = new AjaxContainerService();

		try {
			String CAGENTE = getCampoTextual(request, "CAGENTE");
			Map m = (Map) this.ActualizaAgente(request, CAGENTE);
			ajax.rellenarPlAContenedorAjax(m);
			ajax.guardarContenidoFinalAContenedorAjax(m);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr001Service - mtodo m_ajax_actualizar_agente", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());

			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));

		}
	}

	/**
	 * Carga el agente inicial de la pantalla.
	 * 
	 * @param request El HttpServletRequest que contiene la peticin del cliente web.
	 */
	private Map ActualizaAgente(HttpServletRequest request, String CAGENTE) throws Exception {
		Map mapAgentes = new HashMap();
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
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
		formdata.putAll(agente);

		return mapAgentes;
	}

	/**
	 * Dado un agente seleccionado en el modal de seleccin de agentes (axisctr014),
	 * ste mtodo recibe el atributo CODI del agente y lo pone en el parmetro de
	 * sesin axisctr_agente.
	 * 
	 * @param request El HttpServletRequest que contiene la peticin del cliente web.
	 */
	public void m_ajax_ver_agente(HttpServletRequest request) {
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		AjaxContainerService ajax = new AjaxContainerService();
		try {
			String CODI = getCampoTextual(request, "CODI");

			if (request.getSession().getAttribute("axisctr014_listaAgentes") != null) {
				List listaAgentes = (List) request.getSession().getAttribute("axisctr014_listaAgentes");
				Map agente = getObjetoDeLista(listaAgentes, CODI, "CODI");

				if (!isEmpty(agente)) {
					ajax.guardarContenidoFinalAContenedorAjax(agente);
					formdata.putAll(agente);
					/*
					 * request.getSession().setAttribute("axisctr_agente", agente);
					 */
				}
				listaAgentes = null;
			}
		} catch (Exception e) {
			logger.error("Error", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());

			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));

		}
	}

	private void m_cargarValors(HttpServletRequest request, Axisctr017Action thisAction) {
		logger.debug("Axisctr019Service m_cargarValors");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		try {
			BigDecimal CRAMO = getCampoNumerico(request, "CRAMO");
			logger.debug("CRAM-->" + CRAMO);

			this.cargaListaRamos(request);
			this.cargaComboTRiesgo(request);

			List productos = new ArrayList();
			if (isEmpty(CRAMO))
				productos = dbGetProductos(request, usuario);
			else
				productos = dbGetRamProductos(request);

			request.setAttribute("productos", ((productos == null) ? new ArrayList() : productos));

			List actividades = new ArrayList();
			BigDecimal SPRODUC = getCampoNumerico(request, "SPRODUC");
			// IAXIS-10611 CJMR 2020/01/23
			// if (isEmpty(SPRODUC)) {
			if (!this.isEmpty(SPRODUC)) {
				Map map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_LISTVALORES__F_GET_CACTIVI(SPRODUC, null);
				actividades = (List) tratarRETURNyMENSAJES(request, map, false);
			}

			request.setAttribute("actividades", ((actividades == null) ? new ArrayList() : actividades));

			PAC_IAX_REDCOMERCIAL pac_iax_redcomercial = new PAC_IAX_REDCOMERCIAL(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map map = pac_iax_redcomercial.ejecutaPAC_IAX_REDCOMERCIAL__F_GET_NIVELES(null, null);
			logger.debug(map);

			request.getSession().setAttribute("AGENIVELES", tratarRETURNyMENSAJES(request, map, false));

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr019Service - mtodo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}

	/**
	 * Mtodo que llama a la funcin pl correspondiente a la carga de productos para
	 * seleccionar una pliza.
	 * 
	 * @param request
	 * @param usuario
	 * @return
	 * @throws Exception
	 */
	private List dbGetProductos(HttpServletRequest request, UsuarioBean usuario) throws Exception {
		// TODO: PCTERMFIN a hard-code
		logger.debug("----Buscamos productos TIPO:" + getCampoTextual(request, "tipo") + "------------");
		Map m = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_LISTVALORES__F_GET_PRODUCTOS(getCampoTextual(request, "tipo"), null, null);
		logger.debug(m);
		List primas = (List) tratarRETURNyMENSAJES(request, m, false);

		return primas;
	}

	/**
	 * Mtodo que llama a la funcin pl correspondiente a la carga de productos para
	 * seleccionar una pliza.
	 * 
	 * @param request
	 * @param usuario
	 * @return
	 * @throws Exception
	 */
	private List dbGetRamProductos(HttpServletRequest request) throws Exception {
		// TODO: PCTERMFIN a hard-code
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		logger.debug("----Buscamos productos TIPO:" + getCampoTextual(request, "tipo") + "------------");
		Map m = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_LISTVALORES__F_GET_RAMPRODUCTOS(getCampoTextual(request, "tipo"),
						getCampoNumerico(request, "CRAMO"), new BigDecimal(0));
		logger.debug(m);
		List productos = (List) tratarRETURNyMENSAJES(request, m, false);

		return productos;
	}

	/**
	 * Carga la lista inicial de ramos en la pantalla.
	 * 
	 * @param request El HttpServletRequest que contiene la peticin del cliente web.
	 */
	private void cargaListaRamos(HttpServletRequest request) throws Exception {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		String tipo = this.getCampoTextual(request, "tipo");
		// Carga de ramos de la BD
		Map map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_LISTVALORES__F_GET_RAMOS(tipo, null);
		List listaRamos = (List) tratarRETURNyMENSAJES(request, map);
		request.setAttribute("axisctr_listaRamos", listaRamos != null ? listaRamos : new ArrayList());
		listaRamos = null;
	}

	/**
	 * Realiza una bsqueda de productos por Ajax.
	 * 
	 * @see buscaProductos
	 * @param request El HttpServletRequest que contiene la peticin del cliente web.
	 */
	public void m_ajax_busqueda_productos(HttpServletRequest request) {
		logger.debug("Axisctr017Service m_ajax_busqueda_productos");
		AjaxContainerService ajax = new AjaxContainerService();
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {
			if (!isEmpty(this.getCampoNumerico(request, "CRAMO"))) {

				ajax.guardarContenidoFinalAContenedorAjax(this.dbGetRamProductos(request));

			} else
				ajax.guardarContenidoFinalAContenedorAjax(this.dbGetProductos(request, usuario));
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr017Service - mtodo m_ajax_busqueda_productos", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));

		}
	}

	/**
	 * Realiza una bsqueda de productos por Ajax.
	 * 
	 * @see buscaProductos
	 * @param request El HttpServletRequest que contiene la peticin del cliente web.
	 */
	public void m_ajax_busqueda_cobjase(HttpServletRequest request) {
		logger.debug("Axisctr017Service m_ajax_busqueda_cobjase");
		AjaxContainerService ajax = new AjaxContainerService();

		try {
			ajax.guardarContenidoFinalAContenedorAjax(this.buscaCobjase(request));
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr017Service - mtodo m_ajax_busqueda_cobjase", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}

	/**
	 * Realiza una bsqueda de cobjase seleccionado (SPRODUC).
	 * 
	 * @param request El HttpServletRequest que contiene la peticin del cliente web.
	 * @return
	 * @throws Exception
	 */
	private Map buscaCobjase(HttpServletRequest request) throws Exception {
		// Recuperar Productos segun ramo seleccionado
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();

		BigDecimal SPRODUC = getCampoNumerico(request, "SPRODUC");

		Map map = new PAC_IAXPAR_PRODUCTOS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAXPAR_PRODUCTOS__F_GET_DEFPRODUCTO(SPRODUC);
		Map plCOBJASE = (HashMap) ajax.rellenarPlAContenedorAjax(map);
		// request.getSession().setAttribute("LST_PRODUCTOS",
		// plListaProductos);
		logger.debug((List) request.getSession().getAttribute("LST_PRODUCTOS"));

		return plCOBJASE;

	}

	private void cargaComboTRiesgo(HttpServletRequest request) throws Exception {
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		PAC_IAX_LISTVALORES pac_iax_listvalores = new PAC_IAX_LISTVALORES(
				(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
		Map tipriesg = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_TIPORIESGO();
		logger.debug(tipriesg);
		request.setAttribute("LST_TIPRIESGO", (List) tratarRETURNyMENSAJES(request, tipriesg, false));

	}

	// INI IAXIS-3194 CJMR 18/03/2019
	public void m_ajax_busqueda_actividades(HttpServletRequest request) {
		logger.debug("Axisctr017Service m_ajax_busqueda_actividades");
		AjaxContainerService ajax = new AjaxContainerService();
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {
			BigDecimal SPRODUC = getCampoNumerico(request, "SPRODUC");
			// IAXIS-10611 CJMR 2020/01/23
			Map map = new HashMap();
			if (!this.isEmpty(SPRODUC)) {
				map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_LISTVALORES__F_GET_CACTIVI(SPRODUC, null);
			}

			logger.debug(map);
			ajax.guardarContenidoFinalAContenedorAjax((List) tratarRETURNyMENSAJES(request, map, false));

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr017Service - mtodo m_ajax_busqueda_actividades", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}
	// FIN IAXIS-3194 CJMR 18/03/2019

}
