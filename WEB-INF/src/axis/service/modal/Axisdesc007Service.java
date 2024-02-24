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

import axis.jdbc.PAC_IAX_DESCUENTOS;
import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.mvc.control.modal.Axisdesc007Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AjaxContainerService;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

public class Axisdesc007Service extends AxisBaseService {
	static Log logger = LogFactory.getLog(Axisdesc007Service.class);

	/*
	 * **************************** ***************************************
	 * ******************************
	 */
	/*
	 * **************************** DB OBTENER DATOS ******************************
	 */
	/*
	 * **************************** ***************************************
	 * ******************************
	 */

	/**
	 * M�todo que llama a la funci�n pl correspondiente a guardar los porcentajes de
	 * la pantalla
	 * 
	 * @param request
	 * @param usuario
	 * @return
	 * @throws Exception
	 */
	private BigDecimal dbGuardarPorcentaje(HttpServletRequest request) throws Exception {
		// TODO: PCTERMFIN a hard-code
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		logger.debug("----Buscamos productos TIPO:" + getCampoTextual(request, "tipo") + "------------");

		BigDecimal CDESC = getCampoNumerico(request, "CDESC");
		BigDecimal SPRODUC = getCampoNumerico(request, "SPRODUC");
		BigDecimal CACTIVI = getCampoNumerico(request, "CACTIVI");
		BigDecimal CGARANT = getCampoNumerico(request, "CGARANT");
		BigDecimal NIVEL = getCampoNumerico(request, "NIVEL");
		BigDecimal MODALIDAD = getCampoNumerico(request, "MODALIDAD");
		BigDecimal PORCENTAJE = getCampoNumerico(request, "PORCENTAJE");
		Date FINIVIG = stringToSqlDate(getCampoTextual(request, "FINIVIG"));
		BigDecimal NINIALT = getCampoNumerico(request, "NINIALT");
		BigDecimal NFINALT = getCampoNumerico(request, "NFINALT");
		BigDecimal NINDICE = getCampoNumerico(request, "NINDICE");

		Map m = new PAC_IAX_DESCUENTOS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_DESCUENTOS__F_SET_DETALLE_DESCUENTO(CDESC, SPRODUC, CACTIVI, CGARANT, NIVEL, MODALIDAD,
						FINIVIG, PORCENTAJE, NINIALT, NFINALT, NINDICE);
		logger.debug(m);
		BigDecimal resultado = (BigDecimal) tratarRETURNyMENSAJES(request, m, false);

		return resultado;

	}

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
	 * M�todo que llama a la funci�n pl correspondiente a la carga de productos para
	 * seleccionar una p�liza.
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

	private List dbGetActividades(HttpServletRequest request) throws Exception {
		// TODO: PCTERMFIN a hard-code
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		logger.debug("----Buscamos productos TIPO:" + getCampoTextual(request, "tipo") + "------------");
		HashMap map = new HashMap();
		// con SPRODUC y CRAMO = null
		BigDecimal SPRODUC = (BigDecimal) getCampoNumerico(request, "SPRODUC");
		BigDecimal CRAMO = (BigDecimal) getCampoNumerico(request, "CRAMO");

		map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_LISTVALORES__F_GET_CACTIVI(SPRODUC, CRAMO);
		logger.debug(map);
		List actividades = (List) tratarRETURNyMENSAJES(request, map, false);
		request.getSession().setAttribute("axisctr_listaActividades", actividades);

		return actividades;
	}

	private List dbGetGarantias(HttpServletRequest request) throws Exception {
		// TODO: PCTERMFIN a hard-code
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		logger.debug("----Buscamos productos TIPO:" + getCampoTextual(request, "tipo") + "------------");
		HashMap map = new HashMap();
		// con SPRODUC y CRAMO = null
		BigDecimal SPRODUC = (BigDecimal) getCampoNumerico(request, "SPRODUC");
		BigDecimal CRAMO = (BigDecimal) getCampoNumerico(request, "CRAMO");
		BigDecimal CACTIVI = (BigDecimal) getCampoNumerico(request, "CACTIVI");

		// SPRODUC,CRAMO,CACTIVI
		map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_LISTVALORES__F_GET_CGARANT(SPRODUC, CRAMO, CACTIVI);
		logger.debug(map);
		List garantias = (List) tratarRETURNyMENSAJES(request, map, false);
		request.getSession().setAttribute("axisctr_listaGarantias", garantias);

		return garantias;
	}

	/*
	 * *******************************
	 * ************************************************
	 * *******************************
	 */
	/*
	 * ***************************** CARGA VALORES *******************************
	 */
	/*
	 * *******************************
	 * ************************************************
	 * *******************************
	 */

	private void m_cargarValors(HttpServletRequest request, Axisdesc007Action thisAction) {
		logger.debug("Axisdesc007Service m_cargarValors");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {

			this.cargaListaAgrupaciones(request);
			this.cargaListaActividades(request); // Valores iniciales
			this.cargaListaGarantias(request); // Valores iniciales

			/* Datos ramo - producto */

			BigDecimal CRAMO = getCampoNumerico(request, "CRAMO");
			logger.debug("CRAM-->" + CRAMO);

			this.cargaListaRamos(request);
			if (!isEmpty(request.getAttribute("axisctr_listaRamos"))) {
				ArrayList lista = (ArrayList) request.getAttribute("axisctr_listaRamos");
				if (lista.size() == 1)
					CRAMO = (BigDecimal) (((HashMap) lista.get(0)).get("CRAMO"));
			}
			formdata.put("CRAMO", CRAMO);
			List productos = new ArrayList();
			if (isEmpty(CRAMO))
				productos = dbGetProductos(request, usuario);
			else
				productos = dbGetRamProductos(request);

			if (!isEmpty(productos)) {
				if (productos.size() == 1)
					formdata.put("SPRODUC", (BigDecimal) (((HashMap) productos.get(0)).get("SPRODUC")));
			}

			request.getSession().setAttribute("productos", ((productos == null) ? new ArrayList() : productos));

			/* Fin datos ramo-producto */

		} catch (Exception e) {
			logger.error("Error en el servicio Axisdesc007Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
	}

	/**
	 * Carga la lista inicial de ramos en la pantalla.
	 * 
	 * @param request El HttpServletRequest que contiene la petici�n del cliente
	 *                web.
	 */
	private void cargaListaAgrupaciones(HttpServletRequest request) throws Exception {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		String tipo = this.getCampoTextual(request, "tipo");
		// Carga de ramos de la BD
		HashMap map = new HashMap();
		map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTAGRUPPROD();

		List listaAgrupacion = (List) tratarRETURNyMENSAJES(request, map, false);
		request.getSession().setAttribute("axisctr_listaAgrupacion",
				listaAgrupacion != null ? listaAgrupacion : new ArrayList());
		listaAgrupacion = null;
	}

	/**
	 * Carga la lista inicial de ramos en la pantalla.
	 * 
	 * @param request El HttpServletRequest que contiene la petici�n del cliente
	 *                web.
	 */
	private void cargaListaProductos(HttpServletRequest request) throws Exception {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		String tipo = this.getCampoTextual(request, "tipo");
		// Carga de ramos de la BD
		Map map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_LISTVALORES__F_GET_RAMOS(tipo, null);
		List listaRamos = (List) tratarRETURNyMENSAJES(request, map, false);
		request.getSession().setAttribute("axisctr_listaProducto", listaRamos != null ? listaRamos : new ArrayList());
		listaRamos = null;
	}

	/**
	 * Carga la lista inicial de ramos en la pantalla.
	 * 
	 * @param request El HttpServletRequest que contiene la petici�n del cliente
	 *                web.
	 */
	private void cargaListaActividades(HttpServletRequest request) throws Exception {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		String tipo = this.getCampoTextual(request, "tipo");
		// Carga de ramos de la BD
		HashMap map = new HashMap();
		// con SPRODUC y CRAMO = null
		map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_LISTVALORES__F_GET_CACTIVI(null, null);

		List listaActividades = (List) tratarRETURNyMENSAJES(request, map, false);
		request.getSession().setAttribute("axisctr_listaActividades",
				listaActividades != null ? listaActividades : new ArrayList());
		listaActividades = null;
	}

	/**
	 * Carga la lista inicial de ramos en la pantalla.
	 * 
	 * @param request El HttpServletRequest que contiene la petici�n del cliente
	 *                web.
	 */
	private void cargaListaGarantias(HttpServletRequest request) throws Exception {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		String tipo = this.getCampoTextual(request, "tipo");
		// Carga de ramos de la BD
		HashMap map = new HashMap();
		// SPRODUC,CRAMO,CACTIVI
		map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_LISTVALORES__F_GET_CGARANT(null, null, null);

		List listaGarantias = (List) tratarRETURNyMENSAJES(request, map, false);
		request.getSession().setAttribute("axisctr_listaGarantias",
				listaGarantias != null ? listaGarantias : new ArrayList());
		listaGarantias = null;
	}

	private void guardarListaCom(HttpServletRequest request) throws Exception {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		String tipo = this.getCampoTextual(request, "tipo");
		// Carga de ramos de la BD
		HashMap map = new HashMap();

		map = new PAC_IAX_DESCUENTOS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_DESCUENTOS__F_SET_TRASPASO_DETALLE_OBJ_BD();
		BigDecimal resultado = (BigDecimal) tratarRETURNyMENSAJES(request, map);

		if (resultado.intValue() == 0)
			request.setAttribute("resultadoOK", "OK");
		else
			request.setAttribute("resultadoOK", "KO");

	}

	/**
	 * Carga la lista inicial de ramos en la pantalla.
	 * 
	 * @param request El HttpServletRequest que contiene la petici�n del cliente
	 *                web.
	 */
	private void cargaListaRamos(HttpServletRequest request) throws Exception {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		String tipo = this.getCampoTextual(request, "tipo");
		// Carga de ramos de la BD
		Map map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_LISTVALORES__F_GET_RAMOS(tipo, null);
		List listaRamos = (List) tratarRETURNyMENSAJES(request, map);
		request.getSession().setAttribute("axisctr_listaRamos", listaRamos != null ? listaRamos : new ArrayList());
		listaRamos = null;
	}

	/**
	 * M�todo inicial al llamar a �ste flujo.
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_init(HttpServletRequest request, Axisdesc007Action thisAction) {
		logger.debug("Axisdesc007Service m_init");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {
			request.getSession().removeAttribute("axisctr_listaDescuentos");

		} catch (Exception e) {
			logger.error("Error en el servicio Axisdesc007Service - m�todo m_init", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

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
	public void m_form(HttpServletRequest request, Axisdesc007Action thisAction) {
		logger.debug("Axisdesc007Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);

		try {
			request.getSession().removeAttribute("axisctr_listaDescuentos");

			this.m_cargarValors(request, thisAction);

			BigDecimal CDESC = getCampoNumerico(request, "CDESC");
			Date FINIVIG = stringToSqlDate(getCampoTextual(request, "FINIVIG"));
			Date FFINVIG = stringToSqlDate(getCampoTextual(request, "FFINVIG"));
			String CONSULTA = getCampoTextual(request, "CONSULTA");
			formdata.clear();

			HashMap map = new HashMap();
			map = new PAC_IAX_DESCUENTOS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_DESCUENTOS__F_GET_CUADRODESCUENTO(CDESC, FINIVIG, FFINVIG);

			if (map != null) {
				HashMap PCUADRODESCUENTO = (HashMap) map.get("PCUADRODESCUENTO");
				logger.debug(PCUADRODESCUENTO);
				formdata.putAll(PCUADRODESCUENTO);
			}
			formdata.put("CONSULTA", CONSULTA);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisdesc007Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
	}

	/**
	 * M�todo que se encarga de procesar la b�squeda de una p�liza.
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_buscar(HttpServletRequest request, Axisdesc007Action thisAction) {
		logger.debug("Axisdesc007Service m_buscar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		BigDecimal PCESTADO = this.getHiddenCampoNumerico(request, "PCESTADO");
		try {
			if (formdata.get("paginar") == null) {
				request.getSession().removeAttribute("axisctr_listaPolizas");

				BigDecimal CDESC = getCampoNumerico(request, "CDESC");
				BigDecimal CAGRUPA = getCampoNumerico(request, "CAGRUPA");
				BigDecimal CRAMO = getCampoNumerico(request, "ramoProducto");
				BigDecimal SPRODUC = getCampoNumerico(request, "SPRODUC");
				BigDecimal CACTIVI = getCampoNumerico(request, "CACTIVI");
				BigDecimal CGARANT = getCampoNumerico(request, "CGARANT");
				Date FINIVIG = stringToSqlDate(getCampoTextual(request, "FINIVIG"));
				Date FFINVIG = stringToSqlDate(getCampoTextual(request, "FFINVIG"));
				PCESTADO = (BigDecimal) ((FFINVIG == null) ? PCESTADO : new BigDecimal(2));

				HashMap map = new HashMap();

				map = new PAC_IAX_DESCUENTOS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_DESCUENTOS__F_GET_DETALLE_DESCUENTO(CDESC, CAGRUPA, CRAMO, SPRODUC, CACTIVI,
								CGARANT, new BigDecimal(0), FINIVIG, FFINVIG);

				BigDecimal lista = (BigDecimal) tratarRETURNyMENSAJES(request, map, false);

				if (map != null) {
					ArrayList PCUADROS = (ArrayList) map.get("PT_DESCUENTO");
					logger.debug(PCUADROS);
					request.getSession().setAttribute("axisctr_listaDescuentos", PCUADROS);

				}

				request.setAttribute("BUSQUEDA", "OK");
			}

		} catch (Exception e) {

			logger.error("Error en el servicio Axisdesc007Service - m�todo m_buscar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			// m_cargarValors(request, thisAction);

			if (!isEmpty(PCESTADO))
				formdata.put("CESTADO", PCESTADO);

			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	/**
	 * M�todo que se encarga de procesar la b�squeda de una p�liza.
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_recargar(HttpServletRequest request, Axisdesc007Action thisAction) {
		logger.debug("Axisdesc007Service m_recargar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {
			if (formdata.get("paginar") == null) {
				request.getSession().removeAttribute("axisctr_listaPolizas");

				HashMap map = new HashMap();

				map = new PAC_IAX_DESCUENTOS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_DESCUENTOS__F_GET_OBJ_DETALLE_DESCUENTO();

				logger.debug(map);

				BigDecimal lista = (BigDecimal) tratarRETURNyMENSAJES(request, map, false);

				if (map != null) {
					ArrayList PCUADROS = (ArrayList) map.get("PDETALLEDESCUENTO");
					logger.debug(PCUADROS);
					request.getSession().setAttribute("axisctr_listaDescuento", PCUADROS);
				}

				request.setAttribute("BUSQUEDA", "OK");

			}

		} catch (Exception e) {

			logger.error("Error en el servicio Axisdesc007Service - m�todo m_recargar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE ACTUALIZACION
	 ********************************************/
	/*********************************************************************************************************************/

	/**
	 * M�todo que se llama cuando se selecciona una p�liza.
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_aceptar(HttpServletRequest request, Axisdesc007Action thisAction) {
		logger.debug("Axisdesc007Service m_aceptar");
		try {
			this.guardarListaCom(request);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisdesc007Service - m�todo m_aceptar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			// m_cargarValors(request, thisAction);
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	/**
	 * M�todo que se llama al cerrar el modal.
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_cerrar(HttpServletRequest request, Axisdesc007Action thisAction) {
		logger.debug("Axisdesc007Service m_cerrar");
		try {
			request.getSession().removeAttribute("axisctr_listaPolizas");
		} catch (Exception e) {
			logger.error("Error en el servicio Axisdesc007Service - m�todo m_cerrar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			m_cargarValors(request, thisAction);
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	/*
	 * ***************************
	 * ***************************************************
	 * *******************************
	 */
	/* *************************** METODOS AJAX ******************************* */
	/*
	 * ***************************
	 * ***************************************************
	 * *******************************
	 */

	/**
	 * Realiza una b�squeda de productos por Ajax.
	 * 
	 * @see buscaProductos
	 * @param request El HttpServletRequest que contiene la petici�n del cliente
	 *                web.
	 */
	public void m_ajax_guardar_porcentaje(HttpServletRequest request) {
		logger.debug("Axisdesc007Service m_ajax_guardar_procentaje");
		AjaxContainerService ajax = new AjaxContainerService();
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {

			ajax.guardarContenidoFinalAContenedorAjax(this.dbGuardarPorcentaje(request));

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr001Service - m�todo m_ajax_busqueda_productos", e);
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
		logger.debug("Axisdesc007Service m_ajax_busqueda_productos");
		AjaxContainerService ajax = new AjaxContainerService();
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {
			if (!isEmpty(this.getCampoNumerico(request, "CRAMO"))) {

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

	public void m_ajax_busqueda_actividades(HttpServletRequest request) {
		logger.debug("Axisdesc007Service m_ajax_busqueda_productos");
		AjaxContainerService ajax = new AjaxContainerService();
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {
			if (!isEmpty(this.getCampoNumerico(request, "CRAMO"))) {

				ajax.guardarContenidoFinalAContenedorAjax(this.dbGetActividades(request));

			} else
				ajax.guardarContenidoFinalAContenedorAjax(this.dbGetActividades(request));
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr001Service - m�todo m_ajax_busqueda_productos", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	public void m_ajax_busqueda_garantias(HttpServletRequest request) {
		logger.debug("Axisdesc007Service m_ajax_busqueda_productos");
		AjaxContainerService ajax = new AjaxContainerService();
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {
			if (!isEmpty(this.getCampoNumerico(request, "CRAMO"))) {

				ajax.guardarContenidoFinalAContenedorAjax(this.dbGetGarantias(request));

			} else
				ajax.guardarContenidoFinalAContenedorAjax(this.dbGetGarantias(request));
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr001Service - m�todo m_ajax_busqueda_productos", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

}
