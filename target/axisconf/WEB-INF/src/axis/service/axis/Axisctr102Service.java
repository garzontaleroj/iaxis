//Revision:# 6Lg1fjFFTc1A4ehrVi6c5A== #
package axis.service.axis;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.struts.action.ActionForward;

import axis.jdbc.PAC_IAXPAR_PRODUCTOS;
import axis.jdbc.PAC_IAX_COMMON;
import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.jdbc.PAC_IAX_SIMULACIONES;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.control.axis.Axisctr102Action;
import axis.mvc.model.UsuarioBean;
import axis.util.Constantes;

public class Axisctr102Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	public void m_init(HttpServletRequest request, Axisctr102Action thisAction) {
		logger.debug("Axisctr102Service m_init");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		try {
			///////////////////////////////////////////////////////////////
			///// Iniciar si el producto permite multiriesgos o no ////////

			Map map = new PAC_IAXPAR_PRODUCTOS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAXPAR_PRODUCTOS__F_PERMITIRMULTIASEG();
			BigDecimal codigoLlamada = (BigDecimal) tratarRETURNyMENSAJES(request, map);
			logger.debug("MULTIREGISTROS?(1->si/0->no) ->" + codigoLlamada);
			if (codigoLlamada != null) {
				request.getSession().setAttribute("axisctr_multi_registro_asegurados",
						new Integer(codigoLlamada.intValue()));

			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr102Service - m�todo m_init", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	public void m_form(HttpServletRequest request, Axisctr102Action thisAction) {
		logger.debug("Axisctr102Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {
			/*
			 * Map map = new
			 * PAC_IAX_LISTVALORES((java.sql.Connection)request.getAttribute(Constantes.
			 * DB01CONN)).ejecutaPAC_IAX_LISTVALORES__F_GET_PRODUCTOS("SIMUL",null,null);
			 * List axisctr102_comboProductos = (List) tratarRETURNyMENSAJES (request, map);
			 * request.getSession().setAttribute("axisctr102_comboProductos",
			 * axisctr102_comboProductos); logger.debug(axisctr102_comboProductos);
			 */
			this.m_cargarValors(request, thisAction);
			this.cargaAgente(request);
			this.cargaListaRamos(request);

			AbstractDispatchAction.removeTopPila(request, "TTITULO");

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr102Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	public ActionForward m_buscar_simulacion(HttpServletRequest request, Axisctr102Action thisAction) {

		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);

		try {
			this.m_cargarValors(request, thisAction);
			HashMap m = null;

			String SSEGURO = getCampoTextual(request, "SSEGURO");
			String TTITULO = getCampoTextual(request, "TTITULO");

			formdata.put("TTITULO", TTITULO);

			if (SSEGURO.trim().equals("")) {
				SSEGURO = "0";
			}

			PAC_IAX_SIMULACIONES pacIaxSimulacion = new PAC_IAX_SIMULACIONES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			m = pacIaxSimulacion.ejecutaPAC_IAX_SIMULACIONES__F_RECUPERASIMUL(new BigDecimal(SSEGURO));
			logger.debug(m);
			BigDecimal resultado = (BigDecimal) tratarRETURNyMENSAJES(request, m);

			if (resultado.intValue() == 0) {

				request.getSession().setAttribute("simuOK", "KO");
				BigDecimal axisctr102_OSPRODUC = (BigDecimal) m.get("OSPRODUC");
				request.getSession().setAttribute("SPRODUC", axisctr102_OSPRODUC);

				////////////
				AbstractDispatchAction.topPila(request, "SPRODUC", axisctr102_OSPRODUC);
				AbstractDispatchAction.topPila(request, "TTITULO", TTITULO);
				AbstractDispatchAction.topPila(request, "SSEGURO", new BigDecimal(SSEGURO));
				logger.debug("SPRODUC ::" + AbstractDispatchAction.topPila(request, "SPRODUC"));
				logger.debug("CMODO :: " + AbstractDispatchAction.topPila(request, "CMODO"));
				logger.debug("TTITULO :: " + AbstractDispatchAction.topPila(request, "TTITULO"));
				logger.debug("SPRODUC 2::" + axisctr102_OSPRODUC);

				////////////
				BigDecimal axisctr102_SSEGURO = (BigDecimal) tratarRETURNyMENSAJES(request, m);
				logger.debug(axisctr102_SSEGURO);

				// BUG9427-13032009-XVM
				// return new ActionForward
				// ("/axis_axisctr100.do?operation=form&SPROD="+axisctr102_OSPRODUC+"&CMOD="+AbstractDispatchAction.topPila(request,
				// "CMODO"));
				this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
				return new ActionForward("/axis_axisctr100.do?operation=init&SPROD=" + axisctr102_OSPRODUC + "&SEGURO="
						+ new BigDecimal(SSEGURO) + "&CMOD=" + AbstractDispatchAction.topPila(request, "CMODO")
						+ "&TTITUL=" + AbstractDispatchAction.topPila(request, "TTITULO"));

			} else {
				this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
				return null;// new ActionForward
							// ("/axis_axisctr102.do?operation=form&CMODO="+AbstractDispatchAction.topPila(request,
							// "CMODO"));

			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr102Service - m�todo m_buscar_simulacion", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
			return new ActionForward("/axis_axisctr100.do?operation=form");
		}
	}

	/*
	 * M�todo ajax para acceder a la consulta de simulaciones Se accede a trav�s del
	 * bot�n buscar u la modificaci�n de las opciones de filtro de la pantalla
	 * Axisctr102
	 * 
	 */
	public void m_ajax_busqueda_simulaciones(HttpServletRequest request) {
		logger.debug("Axisctr001Service m_ajax_busqueda_simulaciones");
		AjaxContainerService ajax = new AjaxContainerService();
		try {
			ajax.guardarContenidoFinalAContenedorAjax(this.buscaSimulaciones(request));
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr102Service - m�todo m_ajax_busqueda_simulaciones", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {

			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	/*
	 * M�todo que realiza la b�squeda de simulaciones una vez se establecen los
	 * par�metros de b�squeda: producto - simulaci�n descripci�n riesgo. En caso de
	 * que los par�metros sean nulos, se devuelven todas las simulaciones.
	 */
	private List buscaSimulaciones(HttpServletRequest request) throws Exception {
		// Recuperar Productos segun ramo seleccionado
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();

		BigDecimal SPRODUC = getCampoNumerico(request, "SPRODUC");
		BigDecimal SOLICIT = getCampoNumerico(request, "SOLICIT");
		BigDecimal NPOLIZA = getCampoNumerico(request, "NPOLIZA");
		String TRIESGO = getCampoTextual(request, "TRIESGO");
		BigDecimal RAMO = getCampoNumerico(request, "CRAMO");

		if (isEmpty(RAMO) && !isEmpty(request.getParameter("CRAMO"))) {
			RAMO = new BigDecimal(String.valueOf(request.getParameter("CRAMO")));
		}

		String PNNUMIDE = getCampoTextual(request, "NNUMIDE");
		String PBUSCAR = getCampoTextual(request, "BUSCAR");
		java.sql.Date PFCOTIZA = this.stringToSqlDate(getCampoTextual(request, "FCOTIZACION"));

		// Poner ramo seleccionado en session
		Map selectedProducto = new HashMap();
		selectedProducto.put("SPRODUC", SPRODUC);
		selectedProducto.put("SOLICIT", SOLICIT);
		selectedProducto.put("TRIESGO", TRIESGO);
		selectedProducto.put("CRAMO", RAMO);
		request.getSession().setAttribute("selectedProducto", selectedProducto);

		// Nos cargamos los productos por si hubiera un query anterior
		request.getSession().removeAttribute("axisctr102_listaSimulaciones");

		// Cargamos productos
		Map map = new PAC_IAX_SIMULACIONES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_SIMULACIONES__F_CONSULTASIMUL(SPRODUC, SOLICIT, TRIESGO, RAMO, "SIMUL", PNNUMIDE,
						PBUSCAR, PFCOTIZA, NPOLIZA);
		List plListaSimulaciones = (List) ajax.rellenarPlAContenedorAjax(map);

		// request.getSession().setAttribute("axisctr102_listaSimulaciones",
		// plListaSimulaciones);
		request.setAttribute("axisctr102_listaSimulaciones", plListaSimulaciones);
		// m_cargarValors(request,thisAction);
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		return plListaSimulaciones;
	}

	public void m_cargaSimulaciones(HttpServletRequest request, Axisctr102Action thisAction) {
		// Recuperar Productos segun ramo seleccionado
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {
			BigDecimal SPRODUC = getCampoNumerico(request, "SPRODUC");
			BigDecimal SOLICIT = getCampoNumerico(request, "SOLICIT");
			BigDecimal NPOLIZA = getCampoNumerico(request, "NPOLIZA");
			String TTITULO = getCampoTextual(request, "TTITULO");
			String TRIESGO = getCampoTextual(request, "TRIESGO");
			BigDecimal RAMO = getCampoNumerico(request, "CRAMO");

			String PNNUMIDE = getCampoTextual(request, "NNUMIDE");
			String PBUSCAR = getCampoTextual(request, "BUSCAR");
			java.sql.Date PFCOTIZA = this.stringToSqlDate(getCampoTextual(request, "FCOTIZACION"));

			// Poner ramo seleccionado en session
			Map selectedProducto = new HashMap();
			selectedProducto.put("SPRODUC", SPRODUC);
			selectedProducto.put("SOLICIT", SOLICIT);
			selectedProducto.put("TRIESGO", TRIESGO);
			selectedProducto.put("TTITULO", TTITULO);
			selectedProducto.put("CRAMO", RAMO);
			request.getSession().setAttribute("selectedProducto", selectedProducto);

			// Cargamos productos
			Map map = new PAC_IAX_SIMULACIONES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_SIMULACIONES__F_CONSULTASIMUL(SPRODUC, SOLICIT, TRIESGO, RAMO, "SIMUL", PNNUMIDE,
							PBUSCAR, PFCOTIZA, NPOLIZA);
			logger.debug(map);
			// List plListaSimulaciones = (List)ajax.rellenarPlAContenedorAjax (map);
			List plListaSimulaciones = (List) tratarRETURNyMENSAJES(request, map);

			request.setAttribute("axisctr102_listaSimulaciones", plListaSimulaciones);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr102Service - m�todo m_buscar_simulacion", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			m_cargarValors(request, thisAction);
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}

	}

	public ActionForward m_nuevo(HttpServletRequest request, Axisctr102Action thisAction) {
		logger.debug("Axisctr102Service m_nuevo");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		ActionForward siguiente = null;
		try {
			// Push de los datos necesarios a la pila
			thisAction.topPila(request, "formdata_axisctr102", formdata);

			BigDecimal CAGENTECXT = this.getCampoNumerico(request, "CAGENTECXT");

			// Passformdata: Map "destinado" a convertirse en el "nuevo" formdata
			Map passformdata = new HashMap();
			passformdata.put("SPRODUC", formdata.get("SPRODUC"));
			passformdata.put("TTITULO", formdata.get("TTITULO"));
			passformdata.put("CMODO", "SIMULACION");
			passformdata.put("CMODOCOT", "NUEVO");
			passformdata.put("CAGENTE", CAGENTECXT);
			request.removeAttribute("CAGENTECXT");
			formdata.remove("CAGENTECXT");
			logger.debug("axisctr102 passformdata:" + passformdata);
			request.setAttribute(Constantes.PASSFORMDATA, passformdata);

			BigDecimal SPRODUC = getCampoNumerico(request, "SPRODUC");
			String TTITULO = getCampoTextual(request, "TTITULO");

			HashMap aviso = this.f_Get_Avisos(request, this.whoami(this));
			BigDecimal pRETURN = (BigDecimal) this.tratarRETURNyMENSAJES(request, aviso);
			request.setAttribute("PLSTAVISOS", aviso.get("PLSTAVISOS"));

			if (pRETURN != null && pRETURN.intValue() != 1) {
				// siguiente = isEmpty(SPRODUC) ? new
				// ActionForward("/axis_axisctr001.do?operation=form") : new ActionForward
				// ("/axis_axisctr001.do?operation=siguiente");
				// siguiente = new ActionForward
				// ("/axis_axisctr100.do?operation=init?SPRODUC="+SPRODUC);
				siguiente = new ActionForward("/axis_axisctr001.do?operation=siguiente");
				return siguiente;
			} else {
				return null;
			}
		} catch (Exception e) {
			logger.error("Error en el servicio axisctr018Service - m�todo m_editar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
			return null;
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));

		}
	}

	public void m_volver(HttpServletRequest request, Axisctr102Action thisAction) {
		logger.debug("Axisctr102Action m_volver");
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {
			Map formdata_axisctr102 = (Map) thisAction.removeTopPila(request, "formdata_axisctr102");
			if (!isEmpty(formdata_axisctr102))
				formdata.putAll(formdata_axisctr102);

		} catch (Exception e) {
			logger.error("Error en el servicio axisctr102Service - m�todo m_volver", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	/**
	 * Realiza una b�squeda de productos por Ajax.
	 * 
	 * @see buscaProductos
	 * @param request El HttpServletRequest que contiene la petici�n del cliente
	 *                web.
	 */
	public void m_ajax_busqueda_productos(HttpServletRequest request) {
		logger.debug("Axisctr102Service m_ajax_busqueda_productos");
		AjaxContainerService ajax = new AjaxContainerService();
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {
			if (!isEmpty(this.getCampoNumerico(request, "CRAMO"))) {
				// getCampoNumerico(request,"CRAMO")
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
	private List dbGetRamProductos(HttpServletRequest request) throws Exception {
		// TODO: PCTERMFIN a hard-code
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		logger.debug("----Buscamos productos TIPO:SIMUL------------");
		BigDecimal CAGENTE = getCampoNumerico(request, "CAGENTE");
		Map m = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_LISTVALORES__F_GET_RAMPRODUCTOSAGENTE("SIMUL", getCampoNumerico(request, "CRAMO"),
						new BigDecimal(0), CAGENTE, null);
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
	private List dbGetProductos(HttpServletRequest request, UsuarioBean usuario) throws Exception {
		// TODO: PCTERMFIN a hard-code
		logger.debug("----Buscamos productos TIPO: SIMUL------------");
		BigDecimal CAGENTE = getCampoNumerico(request, "CAGENTE");
		Map m = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_LISTVALORES__F_GET_PRODUCTOSAGENTE("SIMUL", null, null, CAGENTE);
		logger.debug(m);
		List primas = (List) tratarRETURNyMENSAJES(request, m, false);

		return primas;
	}

	/**
	 * Carga la lista inicial de ramos en la pantalla.
	 * 
	 * @param request El HttpServletRequest que contiene la petici�n del cliente
	 *                web.
	 */
	private void cargaListaRamos(HttpServletRequest request) throws Exception {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		// Carga de ramos de la BD
		BigDecimal CAGENTE = getCampoNumerico(request, "CAGENTE");

		if (CAGENTE == null && request.getSession().getAttribute("axisctr_agente") != null) {
			CAGENTE = (BigDecimal) ((Map) request.getSession().getAttribute("axisctr_agente")).get("CODI");
		}

		/*
		 * ********************************* TRATAMIENTO AGENTE LCF *
		 * *****************************
		 */
		Map map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_LISTVALORES__F_GET_RAMOSAGENTE(CAGENTE, "SIMUL", null);
		List listaRamos = (List) tratarRETURNyMENSAJES(request, map);
		request.setAttribute("axisctr_listaRamos", listaRamos != null ? listaRamos : new ArrayList());
		listaRamos = null;
	}

	private void m_cargarValors(HttpServletRequest request, Axisctr102Action thisAction) {
		logger.debug("Axisctr102Service m_cargarValors");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {
			BigDecimal CRAMO = getCampoNumerico(request, "CRAMO");
			BigDecimal SPRODUC = getCampoNumerico(request, "SPRODUC");
			request.setAttribute("SPRODUC", SPRODUC);
			// BigDecimal SPRODUC = getCampoNumerico(request, "SPRODUC");
			logger.debug("CRAM-->" + CRAMO);

			this.cargaListaRamos(request);
			if (!isEmpty(request.getAttribute("axisctr_listaRamos"))) {
				ArrayList lista = (ArrayList) request.getAttribute("axisctr_listaRamos");
				if (lista.size() == 1)
					CRAMO = (BigDecimal) (((HashMap) lista.get(0)).get("CRAMO"));
			}
			formdata.put("CRAMO", CRAMO);
			// formdata.put("SPRODUC",2);
			List productos = new ArrayList();
			if (isEmpty(CRAMO))
				productos = dbGetProductos(request, usuario);
			else
				productos = dbGetRamProductos(request);

			if (!isEmpty(productos)) {
				if (productos.size() == 1)
					formdata.put("SPRODUC", (BigDecimal) (((HashMap) productos.get(0)).get("SPRODUC")));
			}

			request.getSession().setAttribute("axisctr102_comboProductos",
					((productos == null) ? new ArrayList() : productos));
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr019Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

	/*
	 * ********************************* TRATAMIENTO AGENTE LCF *
	 * *****************************
	 */
	/**
	 * Realiza una b�squeda de productos por Ajax.
	 * 
	 * @see Axisctr001Service#buscaProductos
	 * @param request El HttpServletRequest que contiene la petici�n del cliente
	 *                web.
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

			String CONDICION = "SIMULACION";

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
	 * Carga el agente inicial de la pantalla.
	 * 
	 * @param request El HttpServletRequest que contiene la petici�n del cliente
	 *                web.
	 */
	private void cargaAgente(HttpServletRequest request) throws Exception {
		if (isEmpty(request.getSession().getAttribute("axisctr_agente"))) {
			// Cargar Agente de la BD

			String CONDICION = "SIMULACION";
			UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
			Map mapCX = new PAC_IAX_COMMON((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_COMMON__F_GET_CXTAGENTE();

			// Bug 21132/105482
			BigDecimal CAGENTE = (BigDecimal) mapCX.get("RETURN");
			Map mapAgentes = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTAGENTES_COND(null, null, CAGENTE, new BigDecimal(1),
							CONDICION);
			// Fi Bug 21132/105482

			Map agente = new HashMap();
			logger.debug("agentes --> " + mapAgentes);
			if (!isEmpty(tratarRETURNyMENSAJES(request, mapAgentes))) {
				List listaAgentes = (List) tratarRETURNyMENSAJES(request, mapAgentes);
				agente = getObjetoDeLista(listaAgentes, String.valueOf(mapCX.get("RETURN")), "CODI");
			}
			request.getSession().setAttribute("axisctr_agente", agente);

		}
	}
}