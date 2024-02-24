package axis.service.modal;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAXPAR_PRODUCTOS;
import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.jdbc.PAC_IAX_MNTPROD;
import axis.jdbc.PAC_IAX_REDCOMERCIAL;
import axis.jdbc.PAC_IAX_REHABILITA;
import axis.mvc.control.modal.Axisctr071Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AjaxContainerService;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

public class Axisctr071Service extends AxisBaseService {
	static Log logger = LogFactory.getLog(Axisctr071Service.class);

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE INICIALIZACION
	 *******************************************/
	/*********************************************************************************************************************/
	/**
	 * M�todo que se llama al principio del flujo. Se encarga de realizar la carga
	 * de productos para realizar la b�squeda de una p�liza.
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_form(HttpServletRequest request, Axisctr071Action thisAction) {
		logger.debug("Axisctr071Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();

		try {
			String PTIPO = getCampoTextual(request, "PTIPO");
			List actividades = this.dbGetActividades(request);
			request.setAttribute("actividades", ((actividades == null) ? new ArrayList() : actividades));
			this.cargaListaRamos(request);
			this.cargaComboCompania(request);
			this.cargaComboTRiesgo(request);
			Map m = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES__F_GET_RAMOS(PTIPO, null);
			logger.debug(m);
			request.setAttribute("listaRamos", tratarRETURNyMENSAJES(request, m, false));

			// Cargamos productos
			if (!isEmpty(getCampoNumerico(request, "CRAMO"))) {
				request.getSession().removeAttribute("LST_PRODUCTOS");
				Map map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_LISTVALORES__F_GET_RAMPRODUCTOS(PTIPO, getCampoNumerico(request, "CRAMO"),
								BigDecimal.ZERO); // ,new BigDecimal(CTERMFIN));
				logger.debug(map);
				request.setAttribute("LST_PRODUCTOS", tratarRETURNyMENSAJES(request, map, false));
				// List plListaProductos = (List)ajax.rellenarPlAContenedorAjax(map);
				// request.getSession().setAttribute("LST_PRODUCTOS", plListaProductos);
				// logger.debug((List)request.getSession().getAttribute("LST_PRODUCTOS"));
			} else {
				request.getSession().removeAttribute("LST_PRODUCTOS");
				m = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_LISTVALORES__F_GET_PRODUCTOS(PTIPO, null, null);
				logger.debug(m);
				request.setAttribute("LST_PRODUCTOS", tratarRETURNyMENSAJES(request, m, false));
			}

			PAC_IAX_REDCOMERCIAL pac_iax_redcomercial = new PAC_IAX_REDCOMERCIAL(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map map = pac_iax_redcomercial.ejecutaPAC_IAX_REDCOMERCIAL__F_GET_NIVELES(null, null);
			logger.debug(map);

			request.getSession().setAttribute("AGENIVELES", tratarRETURNyMENSAJES(request, map, false));

			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr071Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}

	}

	/**
	 * M�todo que se encarga de procesar la b�squeda de una p�liza.
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_buscar(HttpServletRequest request, Axisctr071Action thisAction) {
		logger.debug("Axisctr071Service m_buscar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);

		try {
			List actividades = this.dbGetActividades(request);
			request.setAttribute("actividades", ((actividades == null) ? new ArrayList() : actividades));
			this.cargaListaRamos(request);
			this.cargaComboCompania(request);
			if (formdata.get("paginar") == null) {

				BigDecimal SPRODUC = getCampoNumerico(request, "SPRODUC");
				BigDecimal NPOLIZA = getCampoNumerico(request, "NPOLIZA");
				BigDecimal NCERTIF = getCampoNumerico(request, "NCERTIF");
				String NNUMIDE = getCampoTextual(request, "NNUMIDE");
				String SNIP = getCampoTextual(request, "SNIP");
				String BUSCAR = getCampoTextual(request, "BUSCAR");
				BigDecimal TIPOPERSONA = getCampoNumerico(request, "TIPOPERSONA");
				BigDecimal CAGENTE = getCampoNumerico(request, "CAGENTE");
				BigDecimal CRAMO = getCampoNumerico(request, "CRAMO");
				String CMATRIC = getCampoTextual(request, "CMATRICULA");
				// BUG 25177_0132998 - JLTS - 20121219 - ini
				String CMOTOR = getCampoTextual(request, "CMOTOR");
				String CCHASIS = getCampoTextual(request, "CCHASIS");
				String NBASTID = getCampoTextual(request, "NBASTID");
				// BUG 25177_0132998 - JLTS - 20121219 - Fin
				String CPOSTAL = getCampoTextual(request, "CPOSTAL");
				String TNATRIE = getCampoTextual(request, "DESCRIPCION");
				String TDOMICI = getCampoTextual(request, "TDOMICI");
				BigDecimal CCOMPANI = getCampoNumerico(request, "CCOMPANI");
				BigDecimal CACTIVI = getCampoNumerico(request, "CACTIVI");
				String CPOLCIA = getCampoTextual(request, "CPOLCIA");
				BigDecimal filtro = this.getFiltro(request);

				BigDecimal pcsucursal = getHiddenCampoNumerico(request, "CAGENTE_2");
				BigDecimal pcadn = getHiddenCampoNumerico(request, "CAGENTE_3");
				BigDecimal pcinter = getHiddenCampoNumerico(request, "CAGENTE_4");
				logger.debug("----> pcsucursal:" + pcsucursal + " pcadn:" + pcadn + " pcinter:" + pcinter);

				CAGENTE = isEmpty(CAGENTE) ? pcinter : CAGENTE;
				// BUG 25177_0132998 - JLTS - 20121219 - Se incluyend los nuevos campos
				// CMOTOR,CCHASIS,NBASTID
				Map map = new PAC_IAX_REHABILITA((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_REHABILITA__F_GET_POLIZASANUL(SPRODUC, NPOLIZA, NCERTIF, NNUMIDE, BUSCAR, SNIP,
								TIPOPERSONA, CMATRIC, CPOSTAL, TDOMICI, TNATRIE, CAGENTE, CRAMO, CPOLCIA, CCOMPANI,
								CACTIVI, filtro, pcsucursal, pcadn, CMOTOR, CCHASIS, NBASTID);
				logger.debug(map);
				request.getSession().setAttribute("LST_POLIZAS", tratarRETURNyMENSAJES(request, map));
			}

			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr071Service - m�todo m_buscar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}

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
	 * Realiza una b�squeda de productos por Ajax.
	 * 
	 * @see Axisctr071Service#buscaProductos
	 * @param request El HttpServletRequest que contiene la petici�n del cliente
	 *                web.
	 */
	public void m_ajax_actualizar_agente(HttpServletRequest request) {
		logger.debug("Axisctr071Service m_ajax_busqueda_productos");
		AjaxContainerService ajax = new AjaxContainerService();

		try {
			String CAGENTE = getCampoTextual(request, "CAGENTE_COD");
			Map m = (Map) this.ActualizaAgente(request, CAGENTE);
			ajax.rellenarPlAContenedorAjax(m);
			ajax.guardarContenidoFinalAContenedorAjax(m);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr071Service - m�todo m_ajax_actualizar_agente", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	/**
	 * Realiza una b�squeda de productos en la BD en funci�n del ramo seleccionado
	 * (CRAMO).
	 * 
	 * @param request El HttpServletRequest que contiene la petici�n del cliente
	 *                web.
	 * @return
	 * @throws Exception
	 */
	private List buscaProductos(HttpServletRequest request) throws Exception {
		// Recuperar Productos segun ramo seleccionado
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();

		String CRAMO = getCampoTextual(request, "CRAMO");
		String TRAMO = getCampoTextual(request, "TRAMO");
		String CTERMFIN = "1"; // a scao: debido al analisis "AN121_..." getCampoTextual(request, "CTERMFIN");

		// Poner ramo seleccionado en session
		Map selectedRamo = new HashMap();
		selectedRamo.put("CRAMO", CRAMO);
		selectedRamo.put("TRAMO", TRAMO);
		request.getSession().setAttribute("axisctr_selectedRamo", selectedRamo);

		// Nos cargamos los productos por si hubiera un query anterior
		request.getSession().removeAttribute("LST_PRODUCTOS");

		String tipo = getCampoTextual(request, "PTIPO");

		// Cargamos productos
		if (!isEmpty(getCampoNumerico(request, "CRAMO"))) {
			Map map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES__F_GET_RAMPRODUCTOS(tipo, getCampoNumerico(request, "CRAMO"),
							BigDecimal.ZERO); // ,new BigDecimal(CTERMFIN));
			List plListaProductos = (List) ajax.rellenarPlAContenedorAjax(map);
			request.getSession().setAttribute("LST_PRODUCTOS", plListaProductos);
			logger.debug((List) request.getSession().getAttribute("LST_PRODUCTOS"));

			return plListaProductos;
		} else {
			Map m = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES__F_GET_PRODUCTOS(tipo, null, null);
			logger.debug(m);

			List plListaProductos = (List) ajax.rellenarPlAContenedorAjax(m);
			request.getSession().setAttribute("LST_PRODUCTOS", plListaProductos);
			logger.debug((List) request.getSession().getAttribute("LST_PRODUCTOS"));

			return plListaProductos;
		}
	}

	/**
	 * Realiza una b�squeda de cobjase seleccionado (SPRODUC).
	 * 
	 * @param request El HttpServletRequest que contiene la petici�n del cliente
	 *                web.
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

	/**
	 * Realiza una b�squeda de productos por Ajax.
	 * 
	 * @see buscaProductos
	 * @param request El HttpServletRequest que contiene la petici�n del cliente
	 *                web.
	 */
	public void m_ajax_busqueda_productos(HttpServletRequest request) {
		logger.debug("Axisctr071Service m_ajax_busqueda_productos");
		AjaxContainerService ajax = new AjaxContainerService();

		try {
			ajax.guardarContenidoFinalAContenedorAjax(this.buscaProductos(request));
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr071Service - m�todo m_ajax_busqueda_productos", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	/**
	 * Realiza una b�squeda de productos por Ajax.
	 * 
	 * @see buscaProductos
	 * @param request El HttpServletRequest que contiene la petici�n del cliente
	 *                web.
	 */
	public void m_ajax_busqueda_cobjase(HttpServletRequest request) {
		logger.debug("Axisctr071Service m_ajax_busqueda_cobjase");
		AjaxContainerService ajax = new AjaxContainerService();

		try {
			ajax.guardarContenidoFinalAContenedorAjax(this.buscaCobjase(request));
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr071Service - m�todo m_ajax_busqueda_cobjase", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	public void m_ajax_validar_rehabilita(HttpServletRequest request) {
		logger.debug("Axisctr071Service m_ajax_busqueda_cobjase");
		AjaxContainerService ajax = new AjaxContainerService();

		try {
			List actividades = this.dbGetActividades(request);
			request.setAttribute("actividades", ((actividades == null) ? new ArrayList() : actividades));
			UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
			BigDecimal SSEGURO = getCampoNumerico(request, "SSEGURO");
			Map map = new PAC_IAX_REHABILITA((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_REHABILITA__F_VALIDA_REHABILITA(SSEGURO);
			logger.debug("ejecutaPAC_IAX_REHABILITA__F_VALIDA_REHABILITA deuvelve: " + map);
			Map retorn = (HashMap) ajax.rellenarPlAContenedorAjax(map);
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr071Service - m�todo m_ajax_busqueda_cobjase", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	/**
	 * M�todo que llama a la funci�n pl correspondiente a la carga de actividades
	 * 
	 * @param request
	 * @param usuario
	 * @return
	 * @throws Exception
	 */
	private List dbGetActividades(HttpServletRequest request) throws Exception {
		// TODO: PCTERMFIN a hard-code
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		BigDecimal pPSPRODUC = this.getCampoNumerico(request, "SPRODUC");
		BigDecimal pPCRAMO = this.getCampoNumerico(request, "CRAMO");
		List productos;
		Map m = new PAC_IAX_MNTPROD((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_MNTPROD__F_GET_ACTIVID(pPSPRODUC);
		logger.debug(m);
		productos = (List) tratarRETURNyMENSAJES(request, m, false);

		return productos;
	}

	/**
	 * Realiza una b�squeda de productos por Ajax.
	 * 
	 * @see buscaProductos
	 * @param request El HttpServletRequest que contiene la petici�n del cliente
	 *                web.
	 */
	public void m_ajax_busqueda_actividades(HttpServletRequest request) {
		logger.debug("Axisctr071Service m_ajax_busqueda_actividades");
		AjaxContainerService ajax = new AjaxContainerService();
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		try {
			ajax.guardarContenidoFinalAContenedorAjax(this.dbGetActividades(request));
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr001Service - m�todo m_ajax_busqueda_actividades", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());

		}
	}

	/**
	 * Realiza una b�squeda de productos por Ajax.
	 * 
	 * @see buscaProductos
	 * @param request El HttpServletRequest que contiene la petici�n del cliente
	 *                web.
	 */
	public void m_ajax_busqueda_ramos(HttpServletRequest request) {
		logger.debug("Axisctr019Service m_ajax_busqueda_ramos");
		AjaxContainerService ajax = new AjaxContainerService();
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {
			if (!isEmpty(this.getCampoNumerico(request, "CCOMPANI"))) {
				ajax.guardarContenidoFinalAContenedorAjax(this.dbGetCompaniRams(request));
			}
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr001Service - m�todo m_ajax_busqueda_ramos", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	private List dbGetCompaniRams(HttpServletRequest request) throws Exception {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		String tipo = this.getCampoTextual(request, "tipo");
		BigDecimal pCOMPANI = this.getCampoNumerico(request, "CCOMPANI");
		// Carga de ramos de la BD
		Map map;
		if ((pCOMPANI != null) && (pCOMPANI.intValue() > 0)) {
			map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES__F_GET_RAMOSCOMPANIA(pCOMPANI);
		} else {
			map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES__F_GET_RAMOS(tipo, null);
		}
		List listaRamos = (List) tratarRETURNyMENSAJES(request, map, false);

		return listaRamos;
	}

	/**
	 * Carga la lista inicial de ramos en la pantalla.
	 * 
	 * @param request El HttpServletRequest que contiene la petici�n del cliente
	 *                web.
	 */
	private void cargaListaRamos(HttpServletRequest request) throws Exception {
		List listaRamos = dbGetCompaniRams(request);
		request.setAttribute("axisctr_listaRamos", listaRamos != null ? listaRamos : new ArrayList());
	}

	private void cargaComboCompania(HttpServletRequest request) throws Exception {
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map cias = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_LISTVALORES__F_GET_CIAPRODUCTOS();
		logger.debug("ejecutaPAC_IAX_LISTVALORES__F_GET_CIAPRODUCTOS: devuelve" + cias);
		List listacias = (List) tratarRETURNyMENSAJES(request, cias, false);
		formdata.put("CIAS", listacias);
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

}
