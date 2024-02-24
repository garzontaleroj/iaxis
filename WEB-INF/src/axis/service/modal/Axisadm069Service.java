package axis.service.modal;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.jdbc.PAC_IAX_PERSONA;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AjaxContainerService;
import axis.service.axis.AxisBaseService;
import axis.service.axis.Axisctr001Service;
import axis.util.Constantes;

/**
 * Axisadm069Service.java 04/06/2008
 * 
 * @author <a href="rkirchner@csi-ti.com">Roger Kirchner</a>
 * @since Java 5.0
 */
public class Axisadm069Service extends AxisBaseService {
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
	public void m_form(HttpServletRequest request) {
		logger.debug("Axisadm069Service m_form");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		try {
			/* LISTVALORES */
			PAC_IAX_LISTVALORES pac_iax_listvalores = new PAC_IAX_LISTVALORES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map LISTVALORES = new HashMap();

			Map map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTEMPRESAS();
			logger.debug(map);
			LISTVALORES.put("LSTEMPRESAS", (List<Map>) tratarRETURNyMENSAJES(request, map, false));

			formdata.put("LISTVALORES", LISTVALORES);

			map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(1064));
			logger.debug(map);
			LISTVALORES.put("LSTAGRUPADOR", tratarRETURNyMENSAJES(request, map, false));

			// BigDecimal pCOMPANI = ;

			BigDecimal CEMPRES = isEmpty(this.getCampoNumerico(request, "CEMPRES"))
					? (isEmpty((String) AbstractDispatchAction.topPila(request, "CEMPRES")) ? null
							: new BigDecimal((String) AbstractDispatchAction.topPila(request, "CEMPRES")))
					: this.getCampoNumerico(request, "CEMPRES");

			if (isEmpty(CEMPRES))
				formdata.put("CEMPRES", usuario.getCempres());
			else
				formdata.put("CEMPRES", CEMPRES);

			formdata.put("CAGENTE", usuario.getCagente());
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
			// this.cargaComboCompania(request);
		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm069Service - m�todo m_form", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
	}

	/*********************************************************************************************************************/
	/************************************************
	 * M�TODOS DE ACTUALIZACI�N
	 *******************************************/
	/*********************************************************************************************************************/

	/**
	 * 
	 * @param request
	 */
	@SuppressWarnings("all")
	private List dbGetCompaniRams(HttpServletRequest request) throws Exception {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		String tipo = this.getCampoTextual(request, "tipo");
		BigDecimal pCOMPANI = this.getCampoNumerico(request, "CEMPRES");
		// Carga de ramos de la BD
		Map map = null;
		if ((pCOMPANI != null) && (pCOMPANI.intValue() > 0)) {
			map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES__F_GET_RAMOS(tipo, pCOMPANI);
		} else {
			map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES__F_GET_RAMOS(tipo, null);
		}

		logger.debug("----Buscamos ramos empresa:" + pCOMPANI + " map:" + map);
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

	private List dbGetRamProductos(HttpServletRequest request) throws Exception {
		// TODO: PCTERMFIN a hard-code
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		logger.debug("----Buscamos productos TIPO:" + getCampoTextual(request, "tipo") + "------------");
		BigDecimal pCOMPANI = this.getCampoNumerico(request, "CEMPRES");
		Map m;
		if ((pCOMPANI != null) && (pCOMPANI.intValue() > 0)) {
			m = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES__F_GET_PRODUCTOS(null, pCOMPANI, null);
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
	 * @see buscaProductos
	 * @param request El HttpServletRequest que contiene la petici�n del cliente
	 *                web.
	 */
	public void m_ajax_busqueda_ramos(HttpServletRequest request) {
		logger.debug("---> Axisadm069Service m_ajax_busqueda_ramos");
		AjaxContainerService ajax = new AjaxContainerService();
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {
			if (!isEmpty(this.getCampoNumerico(request, "CEMPRES"))) {
				ajax.guardarContenidoFinalAContenedorAjax(this.dbGetCompaniRams(request));
			}
		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm069Service - m�todo m_ajax_busqueda_ramos", e);
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
	public void m_ajax_busqueda_productos(HttpServletRequest request) {
		logger.debug("Axisctr019Service m_ajax_busqueda_productos");
		AjaxContainerService ajax = new AjaxContainerService();
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {
			if ((!isEmpty(this.getCampoNumerico(request, "CRAMO")))
					|| (!isEmpty(this.getCampoNumerico(request, "CEMPRES")))) {
				ajax.guardarContenidoFinalAContenedorAjax(this.dbGetRamProductos(request));
			} /*
				 * else
				 * ajax.guardarContenidoFinalAContenedorAjax(this.dbGetProductos(request,usuario
				 * ));
				 */
		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm069Service - m�todo m_ajax_busqueda_productos", e);
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
	 *
	 *                   private List dbGetProductos(HttpServletRequest request,
	 *                   UsuarioBean usuario) throws Exception{ // TODO: PCTERMFIN a
	 *                   hard-code logger.debug("----Buscamos productos
	 *                   TIPO:"+getCampoTextual(request,"tipo")+"------------"); Map
	 *                   m = new
	 *                   PAC_IAX_LISTVALORES((java.sql.Connection)request.getAttribute(Constantes.DB01CONN)).ejecutaPAC_IAX_LISTVALORES__F_GET_PRODUCTOS(null,null,null);
	 *                   logger.debug(m); List primas = (List)tratarRETURNyMENSAJES
	 *                   (request, m,false); return primas; }
	 */

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

	public void m_ajax_cargarDatosPersona(HttpServletRequest request) {
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		logger.debug("Axisadm069Service m_cargarDatosPersona");
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
			// this.cargaComboCompania(request);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm069Service - m�todo m_cargarDatosPersona", e);
			ajax.rellenarExcepcionAContenedorAjax(e);

		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	public void m_ajax_existe_persona(HttpServletRequest request) {
		logger.debug("Axissin017Service AJAX m_ajax_existe_persona");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {
			PAC_IAX_PERSONA pac_axis_persona = new PAC_IAX_PERSONA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			String NNUMIDE = getCampoTextual(request, "NNUMIDE");
			String SNIP = null;
			BigDecimal CSEXPER = null;
			BigDecimal SPERREAL = null;

			BigDecimal CAGENTE = isEmpty(getCampoNumerico(request, "CAGENTE"))
					? new BigDecimal(request.getParameter("CAGENTE"))
					: getCampoNumerico(request, "CAGENTE");
			java.sql.Date FNACIMI = null;

			Map plReturn = pac_axis_persona.ejecutaPAC_IAX_PERSONA__F_EXISTE_PERSONA(NNUMIDE, CSEXPER, FNACIMI, SNIP,
					SPERREAL, CAGENTE);
			logger.debug(plReturn);
			ajax.rellenarPlAContenedorAjax(plReturn);
			ajax.guardarContenidoFinalAContenedorAjax(plReturn);

		} catch (Exception e) {
			logger.error("Axissin017Service m_ajax_existe_persona - Excepcion", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	public void m_ajax_actualiza_persona(HttpServletRequest request) {
		logger.debug("Axisadm069Service m_ajax_actualiza_persona");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {

			BigDecimal SPERSON = this.getCampoNumerico(request, "SPERSON"); // (BigDecimal)
																			// AbstractDispatchAction.topPila(request,
																			// "SSEGURO");
			BigDecimal CAGENTE = this.getCampoNumerico(request, "CAGENTE"); // (BigDecimal)
																			// AbstractDispatchAction.topPila(request,
																			// "SSEGURO");

			String PMODE = new String("POL");
			Map map = new PAC_IAX_PERSONA((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_PERSONA__F_GET_PERSONA_AGENTE(SPERSON, CAGENTE, PMODE);

			logger.debug("get PERSONA()" + map);
			BigDecimal RETURN = (BigDecimal) tratarRETURNyMENSAJES(request, map);
			if (!isEmpty(map) && new BigDecimal(0).equals(RETURN)) {
				// ajax.rellenarPlAContenedorAjax((Map)map.get("OBPERSONA"));
				Map OB_PERSONA = (Map) map.get("OBPERSONA");
				logger.debug(OB_PERSONA);
				ajax.rellenarPlAContenedorAjax(map);
				ajax.guardarContenidoFinalAContenedorAjax(OB_PERSONA);
			}
		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm069Service - m�todo m_ajax_actualiza_persona", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
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
		logger.debug("Axisadm069Service m_ajax_busqueda_productos");
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
}
