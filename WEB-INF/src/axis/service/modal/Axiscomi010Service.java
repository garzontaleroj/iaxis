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

import axis.jdbc.PAC_IAX_COMISIONES;
import axis.jdbc.PAC_IAX_COMMON;
import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.mvc.control.modal.Axiscomi010Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AjaxContainerService;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

public class Axiscomi010Service extends AxisBaseService {
	static Log logger = LogFactory.getLog(Axiscomi010Service.class);

	private List dbGetActividades(HttpServletRequest request) throws Exception {
		// TODO: PCTERMFIN a hard-code
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		logger.debug("----Buscamos productos TIPO:" + getCampoTextual(request, "tipo") + "------------");
		HashMap map = new HashMap();
		// con SPRODUC y CRAMO = null
		BigDecimal SPRODUC = (BigDecimal) getCampoNumerico(request, "SPRODUC");
		BigDecimal CRAMO = (BigDecimal) getCampoNumerico(request, "CRAMO");

		map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_LISTVALORES__F_GET_CACTIVI(SPRODUC, CRAMO); // CRAMO=null
		logger.debug(map);
		List actividades = (List) tratarRETURNyMENSAJES(request, map, false);
		request.getSession().setAttribute("actividades", actividades);
		return actividades;

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
	private void dbGetRamProductos(HttpServletRequest request) throws Exception {
		// TODO: PCTERMFIN a hard-code
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		logger.debug("----Buscamos productos TIPO:" + getCampoTextual(request, "tipo") + "------------");
		Map m = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_LISTVALORES__F_GET_PRODUCTOS(null, null, null);
		logger.debug(m);
		List productos = (List) tratarRETURNyMENSAJES(request, m, false);

		request.getSession().setAttribute("productos", productos);

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
	private List dbGetGarantias(HttpServletRequest request) throws Exception {
		// TODO: PCTERMFIN a hard-code
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		logger.debug("----Buscamos productos TIPO:" + getCampoTextual(request, "tipo") + "------------");

		BigDecimal SPRODUC = (BigDecimal) getCampoNumerico(request, "SPRODUC");
		BigDecimal CACTIVI = (BigDecimal) getCampoNumerico(request, "CACTIVI");

		Map m = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_LISTVALORES__F_GET_CGARANT(SPRODUC, null, CACTIVI);
		logger.debug(m);
		List garantias = (List) tratarRETURNyMENSAJES(request, m, false);

		request.getSession().setAttribute("garantias", garantias);
		return garantias;
	}

	/**
	 * M�todo que llama a la funci�n pl correspondiente a la carga de criterios.
	 * 
	 * @param request
	 * @param usuario
	 * @return
	 * @throws Exception
	 */
	private List dbGetCriterios(HttpServletRequest request) throws Exception {

		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		logger.debug("----Buscamos criterios:" + getCampoTextual(request, "CCRITERIO") + "------------");
		Map m = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(1200));
		logger.debug(m);
		List criterios = (List) tratarRETURNyMENSAJES(request, m, false);

		request.getSession().setAttribute("criterios", criterios);
		return criterios;
	}

	/**
	 * M�todo que, pasando unos parametros, permite la carga de todas las p�lizas
	 * posibles a partir de esta b�squeda.
	 * 
	 * @param request
	 * @param usuario
	 * @param SPRODUC
	 * @param NPOLIZA
	 * @param NCERT
	 * @param NNUMIDE
	 * @param SNIP
	 * @param BUSCAR
	 * @param TIPOPERSONA
	 * @return
	 * @throws Exception
	 */
	private List dbConsultaPoliza(HttpServletRequest request, UsuarioBean usuario, BigDecimal CRAMO, BigDecimal SPRODUC,
			BigDecimal NPOLIZA, BigDecimal NCERT, String NNUMIDE, String SNIP, String BUSCAR, BigDecimal TIPOPERSONA,
			String PMODO, String PCONTRATOINT) throws Exception {

		// Bug 11308 - Si informan el n� de comtrato interno extraemos el n� de poliza y
		// se lo pasamos como tal a la busqueda
		if (PCONTRATOINT != null) {
			Map map = new PAC_IAX_COMMON((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_COMMON__F_EXTRAE_NPOLIZA(PCONTRATOINT);
			BigDecimal NPOLIZA2 = (BigDecimal) map.get("RETURN");
			NPOLIZA = NPOLIZA2;
		}

		/*
		 * HashMap m = new
		 * PAC_IAX_PRODUCCION((java.sql.Connection)request.getAttribute(Constantes.
		 * DB01CONN)).ejecutaPAC_IAX_PRODUCCION__F_CONSULTAPOLIZA(CRAMO, SPRODUC,
		 * NPOLIZA, NCERT, NNUMIDE, SNIP, BUSCAR, TIPOPERSONA, PMODO); logger.debug(m);
		 * List plReturn = (List)tratarRETURNyMENSAJES(request, m);
		 */
		ArrayList plReturn = new ArrayList();
		return plReturn;
	}

	/**
	 * M�todo inicial al llamar a �ste flujo.
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_init(HttpServletRequest request, Axiscomi010Action thisAction) {
		logger.debug("Axiscomi010Service m_init");
		try {
			request.getSession().removeAttribute("axisctr_listaComisiones");
		} catch (Exception e) {
			logger.error("Error en el servicio Axiscomi010Service - m�todo m_init", e);
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
	public void m_form(HttpServletRequest request, Axiscomi010Action thisAction) {
		logger.debug("Axiscomi010Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);

		try {
			request.getSession().removeAttribute("axisctr_listaComisiones");

			this.m_cargarValors(request, thisAction);

			BigDecimal CCOMISI = getCampoNumerico(request, "CCOMISI");

			// Par�metros de b�squeda
			BigDecimal CRAMO = getCampoNumerico(request, "CRAMO");
			BigDecimal CGARANT = getCampoNumerico(request, "CGARANT");
			BigDecimal CACTIVI = getCampoNumerico(request, "CACTIVI");
			BigDecimal SPRODUC = getCampoNumerico(request, "SPRODUC");
			Date FINIVIG = stringToSqlDate(getCampoTextual(request, "FINIVIG"));
			Date FFINVIG = stringToSqlDate(getCampoTextual(request, "FFINVIG"));

			formdata.clear();

			HashMap map = new HashMap();
			map = new PAC_IAX_COMISIONES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_COMISIONES__F_GET_CUADROCOMISION(CCOMISI, FINIVIG, FFINVIG);

			if (map != null) {
				HashMap PCUADROCOMISION = (HashMap) map.get("PCUADROCOMISION");
				logger.debug(PCUADROCOMISION);
				formdata.putAll(PCUADROCOMISION);
			}

			// Retomamos los campos de b�squeda seleccionados en la pantalla anterior
			formdata.put("CRAMO", CRAMO);
			formdata.put("CGARANT", CGARANT);
			formdata.put("CACTIVI", CACTIVI);
			formdata.put("SPRODUC", SPRODUC);

			formdata.put("FINIVIG", FINIVIG);
			formdata.put("FFINVIG", FFINVIG);

		} catch (Exception e) {
			logger.error("Error en el servicio Axiscomi010Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, whoami(this));

	}

	private void m_cargarValors(HttpServletRequest request, Axiscomi010Action thisAction) {
		logger.debug("Axiscomi010Service m_cargarValors");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {

			this.dbGetRamProductos(request);
			this.dbGetActividades(request);
			this.dbGetGarantias(request);
			this.dbGetCriterios(request);
			/* Cargar lista modalidades . 67 */

			HashMap map = new HashMap();
			map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(67));
			ArrayList lista_mod = (ArrayList) tratarRETURNyMENSAJES(request, map, false);
			request.setAttribute("lista_mod", lista_mod);

		} catch (Exception e) {
			logger.error("Error en el servicio Axiscomi010Service - m�todo m_form", e);
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
	public void m_aceptar(HttpServletRequest request, Axiscomi010Action thisAction) {
		logger.debug("Axiscomi010Service m_aceptar");
		try {

			BigDecimal CAMPOS = getCampoNumerico(request, "CAMPOS");
			BigDecimal NIVEL = getCampoNumerico(request, "NIVEL");

			BigDecimal CCOMISI = getCampoNumerico(request, "CCOMISI");
			BigDecimal SPRODUC = getCampoNumerico(request, "SPRODUC");
			BigDecimal CACTIVI = getCampoNumerico(request, "CACTIVI");
			BigDecimal CGARANT = getCampoNumerico(request, "CGARANT");
			Date FINIVIG = stringToSqlDate(getCampoTextual(request, "FINIVIG"));

			for (int i = 1; i <= CAMPOS.intValue(); i++) {
				BigDecimal NDESDE = getCampoNumerico(request, "NDESDE" + i);
				BigDecimal NHASTA = getCampoNumerico(request, "NHASTA" + i);
				BigDecimal CCRITERIO = getCampoNumerico(request, "CCRITERIOCmb" + i);

				BigDecimal PORCENTAJE = getCampoNumerico(request, "PORCENTAJE_" + i);
				if (PORCENTAJE != null && PORCENTAJE.intValue() > 0) {
					BigDecimal MODALIDAD = getCampoNumerico(request, "MODALIDAD_" + i);

					dbGuardarPorcentaje(request, CCOMISI, SPRODUC, CACTIVI, CGARANT, FINIVIG, null, MODALIDAD,
							PORCENTAJE, CCRITERIO, NDESDE, NHASTA);
				}
			}

			request.setAttribute("respuestaOK", "OK");

		} catch (Exception e) {
			logger.error("Error en el servicio Axiscomi010Service - m�todo m_aceptar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			m_cargarValors(request, thisAction);
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	/**
	 * M�todo que se llama al cerrar el modal.
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_cerrar(HttpServletRequest request, Axiscomi010Action thisAction) {
		logger.debug("Axiscomi010Service m_cerrar");
		try {
			request.getSession().removeAttribute("axisctr_listaPolizas");
		} catch (Exception e) {
			logger.error("Error en el servicio Axiscomi010Service - m�todo m_cerrar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			m_cargarValors(request, thisAction);
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	/*
	 * *****************************************************************************
	 * *****************************************
	 */
	/*
	 * ******************************************* METODOS AJAX
	 * ************************************************************
	 */
	/*
	 * *****************************************************************************
	 * *****************************************
	 */

	public void m_ajax_busqueda_actividades(HttpServletRequest request) {
		logger.debug("Axiscomi007Service m_ajax_busqueda_productos");
		AjaxContainerService ajax = new AjaxContainerService();
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {

			ajax.guardarContenidoFinalAContenedorAjax(this.dbGetActividades(request));

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr001Service - m�todo m_ajax_busqueda_productos", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	public void m_ajax_busqueda_garantias(HttpServletRequest request) {
		logger.debug("Axiscomi007Service m_ajax_busqueda_productos");
		AjaxContainerService ajax = new AjaxContainerService();
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {

			ajax.guardarContenidoFinalAContenedorAjax(this.dbGetGarantias(request));

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr001Service - m�todo m_ajax_busqueda_productos", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	public void m_ajax_busqueda_criterios(HttpServletRequest request) {
		logger.debug("Axiscomi007Service m_ajax_busqueda_productos");
		AjaxContainerService ajax = new AjaxContainerService();
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {

			ajax.guardarContenidoFinalAContenedorAjax(this.dbGetCriterios(request));

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr001Service - m�todo m_ajax_busqueda_criterios", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}

	}

	/**
	 * M�todo que llama a la funci�n pl correspondiente a guardar los porcentajes de
	 * la pantalla
	 * 
	 * @param request
	 * @param usuario
	 * @return
	 * @throws Exception
	 */
	private BigDecimal dbGuardarPorcentaje(HttpServletRequest request, BigDecimal CCOMISI, BigDecimal SPRODUC,
			BigDecimal CACTIVI, BigDecimal CGARANT, Date FINIVIG, BigDecimal NIVEL, BigDecimal MODALIDAD,
			BigDecimal PORCENTAJE, BigDecimal CCRITERIO, BigDecimal NDESDE, BigDecimal NHASTA) throws Exception {
		// TODO: PCTERMFIN a hard-code
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		logger.debug("----Buscamos productos TIPO:" + getCampoTextual(request, "tipo") + "------------");

		BigDecimal NINIALT = null;
		BigDecimal NFINALT = null;

		Map m = new PAC_IAX_COMISIONES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_COMISIONES__F_SET_DETALLE_COMISION(CCOMISI, SPRODUC, CACTIVI, CGARANT, null, MODALIDAD,
						FINIVIG, PORCENTAJE, NINIALT, NFINALT, CCRITERIO, NDESDE, NHASTA, null);
		logger.debug(m);
		BigDecimal resultado = (BigDecimal) tratarRETURNyMENSAJES(request, m, false);

		return resultado;

	}

	/**
	 * Realiza una b�squeda de productos por Ajax.
	 * 
	 * @see buscaProductos
	 * @param request El HttpServletRequest que contiene la petici�n del cliente
	 *                web.
	 */
	public void m_ajax_guardar_porcentaje(HttpServletRequest request) {
		logger.debug("Axiscomi010Service m_ajax_guardar_procentaje");
		AjaxContainerService ajax = new AjaxContainerService();
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {
			// ajax.guardarContenidoFinalAContenedorAjax(this.dbGuardarPorcentaje(request));

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr010Service - m�todo m_ajax_busqueda_productos", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

}
