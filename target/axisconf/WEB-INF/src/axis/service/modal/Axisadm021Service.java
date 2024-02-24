package axis.service.modal;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_ADM;
import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AjaxContainerService;
import axis.service.axis.AxisBaseService;
import axis.service.axis.Axisctr001Service;
import axis.util.Constantes;

public class Axisadm021Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE INICIALIZACION
	 *******************************************/
	/*********************************************************************************************************************/

	/**
	 * 
	 * @param request
	 */
	@SuppressWarnings("all")
	public void m_init(HttpServletRequest request) {
		logger.debug("Axisadm021Service m_form");

		try {
			request.getSession().setAttribute("MODIFICADO_OK", true);
			// Al cargar la pantalla borramos, si existe, la var T_IAX_RECIBOS si ha sido
			// creada anteriormente
			if (request.getSession() != null && request.getSession().getAttribute("T_IAX_RECIBOS") != null)
				request.getSession().removeAttribute("T_IAX_RECIBOS");
		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm021Service - m�todo m_init", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, whoami(this));

	}

	/**
	 * 
	 * @param request
	 */
	@SuppressWarnings("all")
	public void m_form(HttpServletRequest request) {
		logger.debug("Axisadm021Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {
			// PESTREC: Proviene de la pantalla que lo genera
			BigDecimal PESTREC = getCampoNumerico(request, "PESTREC");
			BigDecimal NPOLIZA = getCampoNumerico(request, "NPOLIZA");
			BigDecimal CEMPRES = getCampoNumerico(request, "list_CEMPRES");
			BigDecimal CEMPRES_DEFAULT = ((!isEmpty(usuario) && !isEmpty(usuario.getCempres())) ? usuario.getCempres()
					: null);

			// NCERTIF: Si es null, por defecto su valor es 0
			BigDecimal NCERTIF = getCampoNumerico(request, "NCERTIF");
			NCERTIF = ((!isEmpty(NCERTIF)) ? NCERTIF : BigDecimal.ZERO);

			PAC_IAX_LISTVALORES pac_iax_listvalores = new PAC_IAX_LISTVALORES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			// Carga de empresa
			Map map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTEMPRESAS();
			List T_IAX_EMPRESAS = (List) tratarRETURNyMENSAJES(request, map);
			logger.debug(T_IAX_EMPRESAS);

			request.setAttribute("T_IAX_EMPRESAS", !isEmpty(T_IAX_EMPRESAS) ? T_IAX_EMPRESAS : new ArrayList());

			request.setAttribute("PESTREC", !isEmpty(PESTREC) ? PESTREC : null);
			request.setAttribute("NPOLIZA", !isEmpty(NPOLIZA) ? NPOLIZA : null);

			request.setAttribute("selected_CEMPRES", !isEmpty(CEMPRES) ? CEMPRES : CEMPRES_DEFAULT);

			request.setAttribute("NCERTIF", !isEmpty(NCERTIF) ? NCERTIF : null);

			// Bug 18908/90150 - 03/08/2011 - AMC
			BigDecimal CIDIOMA = usuario.getCidioma();
			map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_AGENTESTIPO(new BigDecimal(2), CIDIOMA, null);
			logger.debug(map);
			formdata.put("LSAGENTESTIPO", (List<Map>) tratarRETURNyMENSAJES(request, map, false));

			map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTAGENTES(null, null, null, new BigDecimal(1));
			logger.debug(map);
			formdata.put("LSAGENTE", (List<Map>) tratarRETURNyMENSAJES(request, map, false));

		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm021Service - m�todo m_form", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
	}

	/**
	 * M�todo que se encarga de buscar los recibos en funci�n de los criterios de
	 * b�squeda
	 * 
	 * @param request
	 */
	public void m_busqueda_recibo(HttpServletRequest request) {
		logger.debug("Axisadm021Service m_buscar_recibo");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {
			BigDecimal PESTREC = getCampoNumerico(request, "PESTREC");
			BigDecimal CEMPRES = getCampoNumerico(request, "list_CEMPRES");
			BigDecimal NPOLIZA = getCampoNumerico(request, "NPOLIZA");
			BigDecimal NRECIBO = getCampoNumerico(request, "NRECIBO");
			BigDecimal NCERTIF = getCampoNumerico(request, "NCERTIF");
			String CRECCIA = getCampoTextual(request, "CRECCIA");
			String CPOLCIA = getCampoTextual(request, "CPOLCIA");

			// Bug 18908/90150 - 30/08/2011 - AMC
			BigDecimal CRAMO = getCampoNumerico(request, "CRAMO");
			BigDecimal LSAGENTESTIPO = getCampoNumerico(request, "AGENTETIPO");
			BigDecimal LSAGENTE = getCampoNumerico(request, "LSAGENTES");
			BigDecimal CAGENTE = getCampoNumerico(request, "CAGENTE");
			if (isEmpty(LSAGENTE)) {
				LSAGENTE = CAGENTE;
			}
			BigDecimal SPERSON = getCampoNumerico(request, "SPERSON");
			BigDecimal TIPOPERSONA = getCampoNumerico(request, "TIPOPERSONA");

			BigDecimal PCTIPCOB = getHiddenCampoNumerico(request, "PCTIPCOB");

			String CCONDICION = getHiddenCampoTextual(request, "TCONDICION");
			BigDecimal SPRODUC = getCampoNumerico(request, "SPRODUC");

			PAC_IAX_ADM pac_iax_adm = new PAC_IAX_ADM((java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map map = pac_iax_adm.ejecutaPAC_IAX_ADM__F_GET_CONSULTARECIBOS(NRECIBO, CEMPRES, SPRODUC, NPOLIZA, NCERTIF,
					null, PESTREC, null, null, null, null, TIPOPERSONA, SPERSON, CRECCIA, CPOLCIA, CRAMO, LSAGENTESTIPO,
					LSAGENTE, PCTIPCOB, CCONDICION);
			List<Map> T_IAX_RECIBOS = (List<Map>) tratarRETURNyMENSAJES(request, map);
			logger.debug(T_IAX_RECIBOS);

			request.getSession().setAttribute("T_IAX_RECIBOS",
					!isEmpty(T_IAX_RECIBOS) ? T_IAX_RECIBOS : new ArrayList());

		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm021Service - m�todo m_buscar_recibo", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, whoami(this));

	}

	/**
	 * 
	 * @param request
	 */
	@SuppressWarnings("all")
	public void m_ajax_cargarDatosPersona(HttpServletRequest request) {
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		logger.debug("Axispro018Service m_cargarDatosPersona");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();

		try {
			String NNUMIDE = getCampoTextual(request, "NNUMIDE");
			String TNOMBRE = getCampoTextual(request, "TNOMBRE");

			if (NNUMIDE == null)
				NNUMIDE = "";
			if (TNOMBRE == null)
				TNOMBRE = "";

			String CODIGO = "DATOSPERSONA";
			String CONDICION = NNUMIDE + "|" + TNOMBRE;

			Map map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES__F_GET_CONSULTA(CODIGO, CONDICION);
			logger.debug(map);

			List DATOSPERSONA = (List) ajax.rellenarPlAContenedorAjax(map);
			ajax.guardarContenidoFinalAContenedorAjax(DATOSPERSONA);
			request.getSession().removeAttribute("REC_LSTRECIBOS");
			formdata.put("TIPORECIBO", getCampoTextual(request, "TIPORECIBO"));
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
			this.cargaComboCompania(request);

		} catch (Exception e) {
			logger.error("Error en el servicio Axispro022Service - m�todo m_cargarDatosPersona", e);
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
		logger.debug("---> Axisadm001Service m_ajax_busqueda_ramos");
		AjaxContainerService ajax = new AjaxContainerService();
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {
			if (!isEmpty(this.getCampoNumerico(request, "CEMPRES"))) {
				ajax.guardarContenidoFinalAContenedorAjax(this.dbGetCompaniRams(request));
			}
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr001Service - m�todo m_ajax_busqueda_ramos", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
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

	private List dbGetCompaniRams(HttpServletRequest request) throws Exception {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		String tipo = this.getCampoTextual(request, "tipo");
		BigDecimal pCOMPANI = this.getCampoNumerico(request, "CEMPRES");
		// Carga de ramos de la BD
		Map map = null;
		if ((pCOMPANI != null) && (pCOMPANI.intValue() > 0)) {
			map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES__F_GET_RAMOS(tipo, null);
		}

		logger.debug("----Buscamos ramos empresa:" + pCOMPANI + " map:" + map);
		List listaRamos = (List) tratarRETURNyMENSAJES(request, map, false);

		return listaRamos;
	}

	/**
	 * Realiza una b�squeda de productos por Ajax.
	 * 
	 * @see buscaProductos
	 * @param request El HttpServletRequest que contiene la petici�n del cliente
	 *                web.
	 */
	public void m_ajax_busqueda_productos(HttpServletRequest request) {
		logger.debug("Axisctr019Service m_ajax_busqueda_productos");
		AjaxContainerService ajax = new AjaxContainerService();
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {
			if ((!isEmpty(this.getCampoNumerico(request, "CRAMO")))
					|| (!isEmpty(this.getCampoNumerico(request, "CCOMPANI")))) {
				ajax.guardarContenidoFinalAContenedorAjax(this.dbGetRamProductos(request));
			} else
				ajax.guardarContenidoFinalAContenedorAjax(this.dbGetProductos(request, usuario));
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr001Service - m�todo m_ajax_busqueda_productos", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());

		}
	}

	/**
	 * M�todo que llama a la funci�n pl correspondiente a la carga de productos para
	 * seleccionar una p�liza.
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

	private List dbGetRamProductos(HttpServletRequest request) throws Exception {
		// TODO: PCTERMFIN a hard-code
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		logger.debug("----Buscamos productos TIPO:" + getCampoTextual(request, "tipo") + "------------");
		BigDecimal pCOMPANI = this.getCampoNumerico(request, "CCOMPANI");
		logger.debug("---- pCOMPANI:" + pCOMPANI + " ------------");
		Map m;
		PAC_IAX_LISTVALORES pac_iax_listvalores = new PAC_IAX_LISTVALORES(
				(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
		if ((pCOMPANI != null) && (pCOMPANI.intValue() > 0)) {
			// m = new
			// PAC_IAX_LISTVALORES((java.sql.Connection)request.getAttribute(Constantes.DB01CONN)).ejecutaPAC_IAX_LISTVALORES__F_GET_PRODUCTOSCOMPANIA(pCOMPANI,
			// getCampoNumerico(request,"CRAMO"));
			m = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_PRODUCTOS(null, pCOMPANI,
					getCampoNumerico(request, "CRAMO"));
		} else {
			m = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES__F_GET_RAMPRODUCTOS(getCampoTextual(request, "tipo"),
							getCampoNumerico(request, "CRAMO"), new BigDecimal(0));
		}

		logger.debug(m);
		List productos = (List) tratarRETURNyMENSAJES(request, m, false);

		return productos;
	}

	/**
	 * Realiza una b�squeda de productos por Ajax.
	 * 
	 * @see Axisctr001Service#buscaProductos
	 * @param request El HttpServletRequest que contiene la petici�n del cliente
	 *                web.
	 */
	public void m_ajax_actualizar_agente(HttpServletRequest request) {
		AjaxContainerService ajax = new AjaxContainerService();

		try {
			String CAGENTE = getCampoTextual(request, "CAGENTE");
			Map m = (Map) this.ActualizaAgente(request, CAGENTE);
			ajax.rellenarPlAContenedorAjax(m);
			ajax.guardarContenidoFinalAContenedorAjax(m);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm021Service - m�todo m_ajax_actualizar_agente", e);
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

}
