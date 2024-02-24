package axis.service.axis;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_IMPAGA;
import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.mvc.control.axis.Axisadm063Action;
import axis.mvc.model.UsuarioBean;
import axis.util.Constantes;

public class Axisadm063Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

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
	public void m_init(HttpServletRequest request, Axisadm063Action thisAction) {
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {

		} catch (Exception e) {
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}

	}

	/**
	 * 
	 * @param request
	 */
	@SuppressWarnings("all")
	public void m_form(HttpServletRequest request, Axisadm063Action thisAction) {
		logger.debug("Axisadm063Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		// Metode que ens formatejar� tots els imports, Sistema europeo o americ�
		// En el cas que no hi hagi cap import per pantalla millor treure aquesta crida
		this.formattingNumericValues(request);

		try {

			this.m_cargarCombos(request, thisAction);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm063Service - m�todo m_form", e);
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
	private void m_cargarCombos(HttpServletRequest request, Axisadm063Action thisAction) {
		logger.debug("Axisadm063Service m_cargarCombos");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		HashMap listValores = new HashMap();
		try {

			PAC_IAX_LISTVALORES pac_axis_listValores = new PAC_IAX_LISTVALORES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			// Lista Tipos Recibo
			Map map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(212));
			logger.debug(map);
			listValores.put("lsttipos", tratarRETURNyMENSAJES(request, map));

			this.cargaListaRamos(request);

			BigDecimal CRAMO = this.getCampoNumerico(request, "CRAMO");
			List productos = new ArrayList();
			if (!isEmpty(CRAMO)) {
				productos = this.dbGetRamProductos(request);
			} else {
				productos = this.dbGetProductos(request, usuario);
			}

			formdata.put("productos", productos);
			formdata.put("listValores", listValores);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm063Service - m�todo m_cargarCombos", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE PRUEBA(Borrar al pasar pantalla a VSS)
	 *******************************************/
	/*********************************************************************************************************************/

	/**
	 * Realiza una b�squeda de productos por Ajax.
	 * 
	 * @see buscaProductos
	 * @param request El HttpServletRequest que contiene la petici�n del cliente
	 *                web.
	 */
	public void m_ajax_busqueda_productos(HttpServletRequest request) {
		logger.debug("Axisadm063Service m_ajax_busqueda_productos");
		AjaxContainerService ajax = new AjaxContainerService();
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {
			if (!isEmpty(this.getCampoNumerico(request, "CRAMO"))) {
				ajax.guardarContenidoFinalAContenedorAjax(this.dbGetRamProductos(request));
			} else
				ajax.guardarContenidoFinalAContenedorAjax(this.dbGetProductos(request, usuario));
		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm063Service - m�todo m_ajax_busqueda_productos", e);
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
		Map m = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_LISTVALORES__F_GET_PRODUCTOS(getCampoTextual(request, "tipo"), null, null);
		logger.debug(m);
		List productos = (List) tratarRETURNyMENSAJES(request, m, false);

		return productos;
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
	private List dbGetRamProductos(HttpServletRequest request) throws Exception {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

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
	 * @param request El HttpServletRequest que contiene la petici�n del cliente
	 *                web.
	 */
	private void cargaListaRamos(HttpServletRequest request) throws Exception {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		String tipo = this.getHiddenCampoTextual(request, "tipo");
		// Carga de ramos de la BD
		Map map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_LISTVALORES__F_GET_RAMOS(tipo, null);
		List listaRamos = (List) tratarRETURNyMENSAJES(request, map, false);
		request.setAttribute("listaRamos", listaRamos != null ? listaRamos : new ArrayList());
		listaRamos = null;
	}

	public void m_buscar(HttpServletRequest request, Axisadm063Action thisAction) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {

			BigDecimal SPRODUC = getHiddenCampoNumerico(request, "SPRODUC");
			BigDecimal CTIPOIMP = getCampoNumerico(request, "CTIPOIMP");
			BigDecimal SIDPRODP = getHiddenCampoNumerico(request, "SIDPRODP");
			BigDecimal CMOTIVO = getHiddenCampoNumerico(request, "CMOTIVO");
			BigDecimal NIMPAGD = getHiddenCampoNumerico(request, "NIMPAGD");
			BigDecimal CAGENTE = getHiddenCampoNumerico(request, "CAGENTE");

			Map m = new PAC_IAX_IMPAGA((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_IMPAGA__F_GET_PRODREPREC(null, SPRODUC, CTIPOIMP, CAGENTE);
			logger.debug(m);

			List lista = (List) this.tratarRETURNyMENSAJES(request, m);
			formdata.put("llistaImp", lista);
			formdata.remove("SIDPRODP");
			if (!isEmpty(lista)) {
				Map mlist = (Map) lista.get(0);
				SIDPRODP = new BigDecimal(String.valueOf(mlist.get("SIDPRODP")));
				formdata.put("SIDPRODP", SIDPRODP);

				m = new PAC_IAX_IMPAGA((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_IMPAGA__F_GET_DETPRODREPREC(SIDPRODP, CMOTIVO, NIMPAGD);
				logger.debug(m);
				formdata.put("llista", this.tratarRETURNyMENSAJES(request, m));

			}
		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm063Service - m�todo m_buscar", e);

		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	public void m_buscar_detalle(HttpServletRequest request, Axisadm063Action thisAction) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {

			BigDecimal SPRODUC = getHiddenCampoNumerico(request, "SPRODUC");
			BigDecimal CTIPOIMP = getHiddenCampoNumerico(request, "CTIPOIMP");
			BigDecimal SIDPRODP = getHiddenCampoNumerico(request, "SIDPRODP");
			BigDecimal CMOTIVO = getHiddenCampoNumerico(request, "CMOTIVO");
			BigDecimal NIMPAGD = getHiddenCampoNumerico(request, "NIMPAGD");
			BigDecimal CAGENTE = getHiddenCampoNumerico(request, "CAGENTE");

			Map m = new PAC_IAX_IMPAGA((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_IMPAGA__F_GET_DETPRODREPREC(SIDPRODP, CMOTIVO, NIMPAGD);
			logger.debug(m);
			formdata.put("llista", this.tratarRETURNyMENSAJES(request, m));

			m = new PAC_IAX_IMPAGA((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_IMPAGA__F_GET_PRODREPREC(null, SPRODUC, CTIPOIMP, CAGENTE);
			logger.debug(m);

			List lista = (List) this.tratarRETURNyMENSAJES(request, m);
			formdata.put("llistaImp", lista);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm063Service - m�todo m_buscar", e);

		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	public void m_borrar_detalle(HttpServletRequest request, Axisadm063Action thisAction) {
		logger.debug("Axisadm063Service m_borrar_detalle");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {

			PAC_IAX_IMPAGA pac_axis_impagados = new PAC_IAX_IMPAGA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			BigDecimal SIDPRODP = this.getCampoNumerico(request, "SIDPRODP");
			BigDecimal CMOTIVO = this.getCampoNumerico(request, "CMOTIVO");
			BigDecimal NIMPAGAD = this.getCampoNumerico(request, "NIMPAGAD");

			Map m = pac_axis_impagados.ejecutaPAC_IAX_IMPAGA__F_ELIMINA_DETPRODREPREC(SIDPRODP, CMOTIVO, NIMPAGAD);
			logger.debug(m);
			this.tratarRETURNyMENSAJES(request, m);

			request.removeAttribute("CMOTIVO");
			request.removeAttribute("NIMPAGAD");
			formdata.remove("NIMPAGAD");
			formdata.remove("CMOTIVO");

		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm063Service - m�todo m_borrar_detalle", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	public void m_borrar(HttpServletRequest request, Axisadm063Action thisAction) {
		logger.debug("Axisadm063Service m_borrar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {

			PAC_IAX_IMPAGA pac_axis_impagados = new PAC_IAX_IMPAGA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			BigDecimal SIDPRODP = this.getCampoNumerico(request, "SIDPRODP");

			Map m = pac_axis_impagados.ejecutaPAC_IAX_IMPAGA__F_ELIMINA_PRODREPREC(SIDPRODP);
			logger.debug(m);
			this.tratarRETURNyMENSAJES(request, m);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm063Service - m�todo m_borrar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	/*********************************************************************************************************************/
	/***********************************************
	 * FIN M�TODOS DE PRUEBA(Borrar al pasar patch)
	 *******************************************/
	/*********************************************************************************************************************/

	/**
	 * Realiza una b�squeda de productos por Ajax.
	 * 
	 * @see Axisctr001Service#buscaProductos
	 * @param request El HttpServletRequest que contiene la petici�n del cliente
	 *                web.
	 */
	public void m_ajax_actualizar_agente(HttpServletRequest request) {
		logger.debug("Axisadm063Service m_ajax_busqueda_productos");
		AjaxContainerService ajax = new AjaxContainerService();

		try {
			String CAGENTE = getCampoTextual(request, "CAGENTE");
			Map m = (Map) this.ActualizaAgente(request, CAGENTE);
			ajax.rellenarPlAContenedorAjax(m);
			ajax.guardarContenidoFinalAContenedorAjax(m);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm063Service - m�todo m_ajax_actualizar_agente", e);
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
