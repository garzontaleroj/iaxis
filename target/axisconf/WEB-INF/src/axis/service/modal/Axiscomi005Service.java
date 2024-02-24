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
import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.mvc.control.modal.Axiscomi005Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AjaxContainerService;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

public class Axiscomi005Service extends AxisBaseService {
	static Log logger = LogFactory.getLog(Axiscomi005Service.class);

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

	private void dbBuscarProductos(HttpServletRequest request, UsuarioBean usuario) throws Exception {

		BigDecimal SPRODUC = getCampoNumerico(request, "SPRODUC");
		BigDecimal NIVEL = getCampoNumerico(request, "NIVEL");
		BigDecimal CGARANT = getCampoNumerico(request, "CGARANT");
		BigDecimal CACTIVI = getCampoNumerico(request, "CACTIVI");
		BigDecimal CCOMISI = getCampoNumerico(request, "CCOMISI");

		HashMap m = new PAC_IAX_COMISIONES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_COMISIONES__F_GET_DETALLE_NIVEL(SPRODUC, CACTIVI, CGARANT, new BigDecimal("1"),
						CCOMISI);
		logger.debug(m);
		BigDecimal plReturn = (BigDecimal) tratarRETURNyMENSAJES(request, m, false);

		ArrayList lista = (ArrayList) m.get("PT_COMISION");

		/* ********************************************************************* */
		/* ********************************************************************* */
		/* ********************************************************************* */
		/* ********************************************************************* */
		/*
		 * ArrayList lista_falsa = new ArrayList();
		 * 
		 * HashMap registro = new HashMap();
		 * 
		 * 
		 * registro.put("PRODUCTO","Comunidades"); // registro.put("NPOLIZA",new
		 * BigDecimal(1)); // registro.put("MODALIDAD","Directo Nueva Producci�n");
		 * registro.put("PORCENTAJE",new BigDecimal(8)); lista_falsa.add(registro);
		 * 
		 * HashMap registro1 = new HashMap();
		 * 
		 * registro1.put("PRODUCTO","Comunidades"); // registro1.put("NPOLIZA",new
		 * BigDecimal(2)); // registro1.put("MODALIDAD","Directo Carteras sucesivas");
		 * registro1.put("PORCENTAJE",new BigDecimal(8)); lista_falsa.add(registro1);
		 * 
		 * HashMap registro2 = new HashMap();
		 * 
		 * registro2.put("PRODUCTO","Hogar"); // registro2.put("NPOLIZA",new
		 * BigDecimal(3)); // registro2.put("MODALIDAD","Directo Nueva Producci�n");
		 * registro2.put("PORCENTAJE",new BigDecimal(7)); lista_falsa.add(registro2);
		 * 
		 * HashMap registro3 = new HashMap();
		 * 
		 * registro3.put("PRODUCTO","Hogar"); // registro3.put("NPOLIZA",new
		 * BigDecimal(4)); // registro3.put("MODALIDAD","Directo Carteras sucesivas");
		 * registro3.put("PORCENTAJE",new BigDecimal(7)); lista_falsa.add(registro3);
		 */

		/* ********************************************************************* */
		/* ********************************************************************* */
		/* ********************************************************************* */

		request.getSession().setAttribute("axisctr_listaProductos", lista);

		// request.getSession().setAttribute("axisctr_listaProductos",
		// lista_falsa);

	}

	private void dbBuscarActividades(HttpServletRequest request, UsuarioBean usuario, BigDecimal selectedProducto)
			throws Exception {

		BigDecimal SPRODUC = selectedProducto;// getCampoNumerico(request, "SPRODUC");
		BigDecimal NIVEL = getCampoNumerico(request, "NIVEL");
		BigDecimal CGARANT = getCampoNumerico(request, "CGARANT");
		BigDecimal CACTIVI = getCampoNumerico(request, "CACTIVI");
		BigDecimal CCOMISI = getCampoNumerico(request, "CCOMISI");

		HashMap m = new PAC_IAX_COMISIONES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_COMISIONES__F_GET_DETALLE_NIVEL(SPRODUC, CACTIVI, CGARANT, new BigDecimal("2"),
						CCOMISI);
		logger.debug(m);
		ArrayList consultaActividadesReturn = (ArrayList) m.get("PT_COMISION");

		/* ********************************************************************* */
		/* ********************************************************************* */
		/* ********************************************************************* */
		/* ********************************************************************* */
		/*
		 * ArrayList lista_falsa = new ArrayList();
		 * 
		 * HashMap registro = new HashMap();
		 * 
		 * 
		 * registro.put("ACTIVIDAD","Comunidad"); // registro.put("NPOLIZA",new
		 * BigDecimal(1)); // registro.put("MODALIDAD","Directo Nueva Producci�n");
		 * registro.put("PORCENTAJE",new BigDecimal(0)); lista_falsa.add(registro);
		 * 
		 * HashMap registro1 = new HashMap();
		 * 
		 * registro1.put("ACTIVIDAD","Comunidad"); // registro1.put("NPOLIZA",new
		 * BigDecimal(2)); // registro1.put("MODALIDAD","Directo Carteras sucesivas");
		 * registro1.put("PORCENTAJE",new BigDecimal(0)); lista_falsa.add(registro1);
		 */

		/* ********************************************************************* */
		/* ********************************************************************* */
		/* ********************************************************************* */

		request.getSession().setAttribute("axisctr_listaActividades", consultaActividadesReturn);

	}

	private void dbBuscarGarantias(HttpServletRequest request, UsuarioBean usuario, BigDecimal selectedProducto,
			BigDecimal selectedActividad) throws Exception {

		BigDecimal SPRODUC = selectedProducto; // getCampoNumerico(request, "SPRODUC");
		BigDecimal NIVEL = getCampoNumerico(request, "NIVEL");
		BigDecimal CGARANT = getCampoNumerico(request, "CGARANT");
		BigDecimal CACTIVI = selectedActividad; // getCampoNumerico(request, "CACTIVI");
		BigDecimal CCOMISI = getCampoNumerico(request, "CCOMISI");

		HashMap m = new PAC_IAX_COMISIONES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_COMISIONES__F_GET_DETALLE_NIVEL(SPRODUC, CACTIVI, CGARANT, new BigDecimal("3"),
						CCOMISI);
		logger.debug(m);

		ArrayList consultaGarantiasReturn = (ArrayList) m.get("PT_COMISION");

		request.getSession().setAttribute("axisctr_listaGarantias", consultaGarantiasReturn);

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
		request.setAttribute("axisctr_listaRamos", listaRamos != null ? listaRamos : new ArrayList());
		listaRamos = null;
	}

	/**
	 * M�todo inicial al llamar a �ste flujo.
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_init(HttpServletRequest request, Axiscomi005Action thisAction) {
		logger.debug("Axiscomi005Service m_init");
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {

			// Inicializaci�n de valores campos
			request.getSession().removeAttribute("axisctr_listaComisiones");
			this.m_cargarValors(request, thisAction);
			BigDecimal CCOMISI = getCampoNumerico(request, "CCOMISI");
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

			/* Inicialar los registros */
			HashMap m = new HashMap();

			m = new PAC_IAX_COMISIONES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_COMISIONES__F_GET_DETALLE_COMISION(CCOMISI, null, null, null, null, null,
							new BigDecimal(1), FINIVIG, null);
			logger.debug("HALO");
			// m = new
			// PAC_IAX_COMISIONES((java.sql.Connection)request.getAttribute(Constantes.DB01CONN)).ejecutaPAC_IAX_COMISIONES__F_GET_DETALLE_COMISION(CCOMISI,null,null,null,null,null);
			logger.debug("PAC_IAX_COMISIONES__F_GET_DETALLE_COMISION :" + m); // CRAMO,SPRODUC,CACTIVI,CGARANT
			tratarRETURNyMENSAJES(request, m, false);

			request.getSession().setAttribute("axisctr_detallecomi", m);

		} catch (Exception e) {
			logger.error("Error en el servicio Axiscomi005Service - m�todo m_init", e);
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
	public void m_form(HttpServletRequest request, Axiscomi005Action thisAction) {
		logger.debug("Axiscomi005Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {

			request.getSession().removeAttribute("axisctr_listaPolizas");
			request.getSession().removeAttribute("axisctr_listaProductos");
			request.getSession().removeAttribute("axisctr_listaActividades");
			request.getSession().removeAttribute("axisctr_listaGarantias");
			request.getSession().removeAttribute("selectedProducto");
			request.getSession().removeAttribute("selectedActividad");
			request.getSession().removeAttribute("selectedModProducto");
			request.getSession().removeAttribute("selectedModActividad");

			this.m_buscar_productos(request, thisAction);

		} catch (Exception e) {
			logger.error("Error en el servicio Axiscomi005Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
	}

	/**
	 * M�todo que se llama al principio del flujo. Se encarga de realizar la carga
	 * de productos para realizar la b�squeda de una p�liza.
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_actualizar(HttpServletRequest request, Axiscomi005Action thisAction) {
		logger.debug("Axiscomi005Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {

			BigDecimal selectedProducto = getCampoNumerico(request, "selectedProducto");
			BigDecimal selectedModProducto = getCampoNumerico(request, "selectedModProducto");
			BigDecimal selectedActividad = getCampoNumerico(request, "selectedActividad");
			BigDecimal selectedModActividad = getCampoNumerico(request, "selectedModActividad");
			request.setAttribute("selectedProducto", selectedProducto);
			request.setAttribute("selectedModProducto", selectedModProducto);
			request.setAttribute("selectedActividad", selectedActividad);
			request.setAttribute("selectedModActividad", selectedModActividad);

			this.m_buscar_productos(request, thisAction);

		} catch (Exception e) {
			logger.error("Error en el servicio Axiscomi005Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
	}

	private void m_cargarValors(HttpServletRequest request, Axiscomi005Action thisAction) {
		logger.debug("Axiscomi005Service m_cargarValors");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {

			/* ************************************ */

			BigDecimal CCOMISI = getCampoNumerico(request, "CCOMISI");
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

			/* ************************************ */
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
		} catch (Exception e) {
			logger.error("Error en el servicio Axiscomi005Service - m�todo m_form", e);
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
	public void m_buscar(HttpServletRequest request, Axiscomi005Action thisAction) {
		logger.debug("Axiscomi005Service m_buscar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {

		} catch (Exception e) {

			logger.error("Error en el servicio Axiscomi005Service - m�todo m_buscar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			m_cargarValors(request, thisAction);
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	public void m_buscar_productos(HttpServletRequest request, Axiscomi005Action thisAction) {
		logger.debug("Axiscomi005Service m_buscar_productos");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {

			BigDecimal selectedProducto = getCampoNumerico(request, "selectedProducto");
			// request.setAttribute("selectedproducto",selectedProducto);
			request.setAttribute("selectedProducto", selectedProducto);

			this.dbBuscarProductos(request, usuario);

			ArrayList listaProductos = (ArrayList) request.getSession().getAttribute("axisctr_listaProductos");

			if (listaProductos != null && selectedProducto == null && listaProductos.size() > 0) {
				HashMap mapa = (HashMap) listaProductos.get(0);
				HashMap mapa_ob = (HashMap) mapa.get("OB_IAX_DETCOMISION");
				BigDecimal SPRODUC = (BigDecimal) mapa_ob.get("SPRODUC");
				BigDecimal CMODCOM = (BigDecimal) mapa_ob.get("CMODCOM");
				// request.setAttribute("selectedProducto",NPOLIZA);
				formdata.put("selectedProducto", SPRODUC);
				formdata.put("selectedModProducto", CMODCOM);
			}

			m_buscar_actividades(request, thisAction);

		} catch (Exception e) {

			logger.error("Error en el servicio Axiscomi005Service - m�todo m_buscar_productos", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			m_cargarValors(request, thisAction);
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	public void m_buscar_actividades(HttpServletRequest request, Axiscomi005Action thisAction) {
		logger.debug("Axiscomi005Service m_buscar_actividades");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {

			BigDecimal selectedProducto = getCampoNumerico(request, "selectedProducto");
			BigDecimal selectedModProducto = getCampoNumerico(request, "selectedModProducto");
			BigDecimal selectedActividad = getCampoNumerico(request, "selectedActividad");
			BigDecimal selectedModActividad = getCampoNumerico(request, "selectedModActividad");
			request.setAttribute("selectedProducto", selectedProducto);
			request.setAttribute("selectedModProducto", selectedModProducto);
			request.setAttribute("selectedActividad", selectedActividad);
			request.setAttribute("selectedModActividad", selectedModActividad);

			if (selectedProducto != null) {
				this.dbBuscarActividades(request, usuario, selectedProducto);
			}

			ArrayList lista_actividades = (ArrayList) request.getSession().getAttribute("axisctr_listaActividades");

			if (lista_actividades != null && selectedActividad == null && lista_actividades.size() > 0) {

				HashMap mapa = (HashMap) lista_actividades.get(0);
				HashMap mapa_ob = (HashMap) mapa.get("OB_IAX_DETCOMISION");
				BigDecimal CACTIVI = (BigDecimal) mapa_ob.get("CACTIVI");
				BigDecimal CMODACT = (BigDecimal) mapa_ob.get("CMODCOM");

				formdata.remove("selectedActividad");
				formdata.remove("selectedModActividad");
				formdata.put("selectedActividad", CACTIVI);
				formdata.put("selectedModActividad", CMODACT);
			}

			m_buscar_garantias(request, thisAction);

		} catch (Exception e) {

			logger.error("Error en el servicio Axiscomi005Service - m�todo m_buscar_actividades", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			m_cargarValors(request, thisAction);
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	public void m_buscar_garantias(HttpServletRequest request, Axiscomi005Action thisAction) {
		logger.debug("Axiscomi005Service m_buscar_actividades");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {

			BigDecimal selectedActividad = getCampoNumerico(request, "selectedActividad");
			BigDecimal selectedModActividad = getCampoNumerico(request, "selectedModActividad");
			BigDecimal selectedProducto = getCampoNumerico(request, "selectedProducto");
			request.setAttribute("selectedActividad", selectedActividad);
			request.setAttribute("selectedModActividad", selectedModActividad);
			request.setAttribute("selectedProducto", selectedProducto);
			// formdata.put("selectedProducto",selectedProducto);
			// formdata.put("selectedActividad",selectedActividad);

			// if(selectedActividad!=null){

			this.dbBuscarGarantias(request, usuario, selectedProducto, selectedActividad);
			// ArrayList lista_garantias =
			// (ArrayList)request.getSession().getAttribute("axisctr_listaGarantias");
			// }

		} catch (Exception e) {

			logger.error("Error en el servicio Axiscomi005Service - m�todo m_buscar_actividades", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			m_cargarValors(request, thisAction);
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE ACTUALIZACION
	 ********************************************/
	/*********************************************************************************************************************/

	/**
	 * M�todo que se llama al cerrar el modal.
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_cerrar(HttpServletRequest request, Axiscomi005Action thisAction) {
		logger.debug("Axiscomi005Service m_cerrar");
		try {
			request.getSession().removeAttribute("axisctr_listaPolizas");
		} catch (Exception e) {
			logger.error("Error en el servicio Axiscomi005Service - m�todo m_cerrar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			m_cargarValors(request, thisAction);
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	/**
	 * Realiza una b�squeda de productos por Ajax.
	 * 
	 * @see buscaProductos
	 * @param request El HttpServletRequest que contiene la petici�n del cliente
	 *                web.
	 */
	public void m_ajax_busqueda_comisiones(HttpServletRequest request) {
		logger.debug("Axiscomi005Service m_ajax_busqueda_productos");
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

	/**
	 * Realiza una b�squeda de productos por Ajax.
	 * 
	 * @see buscaProductos
	 * @param request El HttpServletRequest que contiene la petici�n del cliente
	 *                web.
	 */
	public void m_ajax_guardar_porcentaje(HttpServletRequest request) {
		logger.debug("Axiscomi007Service m_ajax_guardar_procentaje");
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

	private BigDecimal dbGuardarPorcentaje(HttpServletRequest request) throws Exception {
		// TODO: PCTERMFIN a hard-code
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		logger.debug("----Buscamos productos TIPO:" + getCampoTextual(request, "tipo") + "------------");

		BigDecimal CCOMISI = getCampoNumerico(request, "CCOMISI");
		BigDecimal SPRODUC = getCampoNumerico(request, "SPRODUC");
		BigDecimal CACTIVI = getCampoNumerico(request, "CACTIVI");
		BigDecimal CGARANT = getCampoNumerico(request, "CGARANT");
		BigDecimal NIVEL = getCampoNumerico(request, "NIVEL");
		BigDecimal MODALIDAD = getCampoNumerico(request, "MODALIDAD");
		BigDecimal PORCENTAJE = getCampoNumerico(request, "PORCENTAJE");
		Date FINIVIG = stringToSqlDate(getCampoTextual(request, "FINIVIG"));
		BigDecimal NINIALT = getCampoNumerico(request, "NINIALT");
		BigDecimal NFINALT = getCampoNumerico(request, "NFINALT");
		BigDecimal CCRITERIO = getCampoNumerico(request, "CCRITERIO");
		BigDecimal NDESDE = getCampoNumerico(request, "NDESDE");
		BigDecimal NHASTA = getCampoNumerico(request, "NHASTA");

		Map m = new PAC_IAX_COMISIONES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_COMISIONES__F_SET_DETALLE_COMISION(CCOMISI, SPRODUC, CACTIVI, CGARANT, NIVEL, MODALIDAD,
						FINIVIG, PORCENTAJE, NINIALT, NFINALT, CCRITERIO, NDESDE, NHASTA, null);
		logger.debug(m);
		BigDecimal resultado = (BigDecimal) tratarRETURNyMENSAJES(request, m, false);

		return resultado;

	}

	private void guardarListaCom(HttpServletRequest request) throws Exception {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		String tipo = this.getCampoTextual(request, "tipo");
		// Carga de ramos de la BD
		HashMap map = new HashMap();

		map = new PAC_IAX_COMISIONES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_COMISIONES__F_SET_TRASPASO_DETALLE_OBJ_BD();
		BigDecimal resultado = (BigDecimal) tratarRETURNyMENSAJES(request, map);

		if (resultado.intValue() == 0)
			request.setAttribute("resultadoOK", "OK");
		else
			request.setAttribute("resultadoOK", "KO");

	}

	/**
	 * M�todo que se llama cuando se selecciona una p�liza.
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_aceptar(HttpServletRequest request, Axiscomi005Action thisAction) {
		logger.debug("Axiscomi005Service m_aceptar");
		try {
			this.guardarListaCom(request);

		} catch (Exception e) {
			logger.error("Error en el servicio Axiscomi005Service - m�todo m_aceptar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			// m_cargarValors(request, thisAction);
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	public void m_borrar_desglose(HttpServletRequest request, Axiscomi005Action thisAction) {
		logger.debug("Axiscomi005Service m_borrar");
		try {

			UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
			Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

			BigDecimal CACTIVI = getCampoNumerico(request, "CACTIVISEL");
			BigDecimal CGARANT = getCampoNumerico(request, "CGARANTSEL");
			BigDecimal CCOMISI = getHiddenCampoNumerico(request, "CCOMISI");
			BigDecimal CMODCOM = getCampoNumerico(request, "CMODCOM");
			java.sql.Date FINIVIG = this.stringToSqlDate(getHiddenCampoTextual(request, "FINIVIGSEL"));
			BigDecimal NINIALT = getCampoNumerico(request, "NINIALT");
			BigDecimal SPRODUC = getCampoNumerico(request, "SPRODUCSEL");
			BigDecimal NFINALT = getCampoNumerico(request, "NFINALT");

			formdata.put("CACTIVI", CACTIVI);
			formdata.put("CGARANT", CGARANT);
			formdata.put("CCOMISI", CCOMISI);
			formdata.put("CMODCOM", CMODCOM);
			formdata.put("FINIVIG", FINIVIG);
			formdata.put("NINIALT", NINIALT);
			// formdata.put("SPRODUC",SPRODUC);
			formdata.put("NFINALT", NFINALT);

			logger.debug("--> CACTIVI:" + CACTIVI + " CGARANT:" + CGARANT + " CCOMISI:" + CCOMISI + " CMODCOM:"
					+ CMODCOM + " FINIVIG" + FINIVIG + " NINIALT:" + NINIALT + " SPRODUC:" + SPRODUC + " NFINALT:"
					+ NFINALT);

			Map map = new PAC_IAX_COMISIONES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_COMISIONES__F_DEL_COMISIONDESGLOSE(CACTIVI, CGARANT, CCOMISI, CMODCOM, FINIVIG,
							NINIALT, SPRODUC, NFINALT);

			logger.debug(map);
			tratarRETURNyMENSAJES(request, map);

			request.getSession().removeAttribute("axisctr_listaPolizas");
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));

		} catch (Exception e) {
			logger.error("Error en el servicio Axiscomi007Service - m�todo m_aceptar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}

	}
}
