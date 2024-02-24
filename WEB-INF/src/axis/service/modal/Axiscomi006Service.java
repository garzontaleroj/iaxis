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
import axis.mvc.control.modal.Axiscomi006Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AjaxContainerService;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

public class Axiscomi006Service extends AxisBaseService {
	static Log logger = LogFactory.getLog(Axiscomi006Service.class);

	/**
	 * M�todo inicial al llamar a �ste flujo.
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_init(HttpServletRequest request, Axiscomi006Action thisAction) {
		logger.debug("Axiscomi006Service m_init");
		try {

		} catch (Exception e) {
			logger.error("Error en el servicio Axiscomi006Service - m�todo m_init", e);
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
	public void m_form(HttpServletRequest request, Axiscomi006Action thisAction) {
		logger.debug("Axiscomi006Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);

		try {
			/*
			 * request.setAttribute("selectedProducto",null);
			 * request.setAttribute("selectedActividad",null);
			 * request.setAttribute("selectedGarantia",null);
			 * 
			 * request.setAttribute("axisctr_listaGarantias",null);
			 * request.setAttribute("axisctr_listaActividades",null);
			 */

			BigDecimal PSPRODUC = getCampoNumerico(request, "SPRODUC");
			BigDecimal TIPO = getCampoNumerico(request, "TIPO");
			String TSPRODUC = getCampoTextual(request, "TSPRODUC");
			String MODO = getCampoTextual(request, "MODO");
			String FINIVIG = getCampoTextual(request, "FINIVIG");
			request.setAttribute("TSPRODUC", TSPRODUC);
			request.setAttribute("SPRODUC", PSPRODUC);
			request.setAttribute("selectedProducto", PSPRODUC);
			request.setAttribute("CNIVEL", new BigDecimal(1));
			formdata.put("MODO", MODO);
			formdata.put("FINIVIG", FINIVIG);
			formdata.put("TIPO", TIPO);

			request.setAttribute("M_BUSCA", "PROD");
			this.m_buscar_productos(request, thisAction);
			this.m_buscar_actividades(request, thisAction, PSPRODUC);

			BigDecimal PCACTIVI = getCampoNumerico(request, "selectedActividad");
			PCACTIVI = getCampoNumerico(request, "selectedActividad");
			List activitats = null;
			if (isEmpty(PCACTIVI)) {
				if (!isEmpty(request.getAttribute("axisctr_listaActividades"))) {
					activitats = (List) request.getAttribute("axisctr_listaActividades");
					if (activitats.size() > 0) {
						if (((Map) activitats.get(0)).get("CACTIVI") != null) {
							PCACTIVI = (BigDecimal) ((Map) activitats.get(0)).get("CACTIVI");
						}
					}
				}

			}
			if (isEmpty(PCACTIVI)) {
				PCACTIVI = new BigDecimal(0);
			}
			request.setAttribute("selectedActividad", PCACTIVI);
			request.setAttribute("CNIVEL", new BigDecimal(2));
			request.setAttribute("selectedActividad", PCACTIVI);

			request.setAttribute("M_BUSCA", "ACT");
			this.m_buscar_productos(request, thisAction);

			request.setAttribute("CNIVEL", new BigDecimal(3));
			this.m_buscar_garantias(request, thisAction, PSPRODUC, PCACTIVI);
			BigDecimal PCGARANT = isEmpty((BigDecimal) request.getAttribute("selectedGarantia"))
					? getCampoNumerico(request, "selectedGarantia")
					: (BigDecimal) request.getAttribute("selectedGarantia");

			List garanties = null;
			if (isEmpty(PCGARANT)) {
				if (!isEmpty(request.getAttribute("axisctr_listaGarantias"))) {
					garanties = (List) request.getAttribute("axisctr_listaGarantias");
					if (garanties.size() > 0) {
						if (((Map) garanties.get(0)).get("CACTIVI") != null) {
							PCGARANT = (BigDecimal) ((Map) garanties.get(0)).get("CGARANT");
						}
					}
				}
			}

			request.setAttribute("selectedGarantia", PCGARANT);
			if (isEmpty(PCGARANT)) {
				List map = (List) request.getAttribute("axisctr_listaGarantias");
				logger.debug("------> garantias map:" + map);
				if (!isEmpty(map)) {
					Map map2 = (Map) map.get(0);
					logger.debug("------> OB_IAX_DETCOMISION:" + map2);
					request.setAttribute("selectedGarantia", map2.get("CGARANT"));

				}
			}

			request.setAttribute("M_BUSCA", "GAR");
			this.m_buscar_productos(request, thisAction);

		} catch (Exception e) {
			logger.error("Error en el servicio Axiscomi006Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, whoami(this));

	}

	private void m_cargarValors(HttpServletRequest request, Axiscomi006Action thisAction) {
		logger.debug("Axiscomi006Service m_cargarValors");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {
			BigDecimal CRAMO = getCampoNumerico(request, "CRAMO");
			logger.debug("CRAM-->" + CRAMO);

			// this.cargaListaRamos(request);
			if (!isEmpty(request.getAttribute("axisctr_listaRamos"))) {
				ArrayList lista = (ArrayList) request.getAttribute("axisctr_listaRamos");
				if (lista.size() == 1)
					CRAMO = (BigDecimal) (((HashMap) lista.get(0)).get("CRAMO"));
			}
			formdata.put("CRAMO", CRAMO);
			List productos = new ArrayList();
			/*
			 * if (isEmpty(CRAMO)) productos = dbGetProductos(request, usuario); else
			 * productos = dbGetRamProductos(request);
			 * 
			 * if (!isEmpty(productos)) { if (productos.size() == 1) formdata.put("SPRODUC",
			 * (BigDecimal)(((HashMap)productos.get(0)).get("SPRODUC"))); }
			 */

			/*
			 * request.getSession(). setAttribute("productos", ((productos == null) ? new
			 * ArrayList() : productos));
			 */
		} catch (Exception e) {
			logger.error("Error en el servicio Axiscomi006Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000060", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
	}

	public void m_buscar_productos(HttpServletRequest request, Axiscomi006Action thisAction) {
		logger.debug("Axiscomi006Service m_buscar_productos");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {

			BigDecimal PSPRODUC = null;
			BigDecimal PCACTIVI = null;
			BigDecimal PCGARANT = null;
			if (request.getAttribute("M_BUSCA") == "PROD") {
				PSPRODUC = isEmpty((BigDecimal) request.getAttribute("selectedProducto"))
						? getCampoNumerico(request, "selectedProducto")
						: (BigDecimal) request.getAttribute("selectedProducto");
			}
			if (request.getAttribute("M_BUSCA") == "ACT") {
				PSPRODUC = isEmpty((BigDecimal) request.getAttribute("selectedProducto"))
						? getCampoNumerico(request, "selectedProducto")
						: (BigDecimal) request.getAttribute("selectedProducto");
				PCACTIVI = isEmpty((BigDecimal) request.getAttribute("selectedActividad"))
						? getCampoNumerico(request, "selectedActividad")
						: (BigDecimal) request.getAttribute("selectedActividad");
			}
			if (request.getAttribute("M_BUSCA") == "GAR") {
				PSPRODUC = isEmpty((BigDecimal) request.getAttribute("selectedProducto"))
						? getCampoNumerico(request, "selectedProducto")
						: (BigDecimal) request.getAttribute("selectedProducto");
				PCACTIVI = isEmpty((BigDecimal) request.getAttribute("selectedActividad"))
						? getCampoNumerico(request, "selectedActividad")
						: (BigDecimal) request.getAttribute("selectedActividad");
				PCGARANT = isEmpty((BigDecimal) request.getAttribute("selectedGarantia"))
						? getCampoNumerico(request, "selectedGarantia")
						: (BigDecimal) request.getAttribute("selectedGarantia");
			}

			BigDecimal PCNIVEL = isEmpty((BigDecimal) request.getAttribute("CNIVEL"))
					? getCampoNumerico(request, "CNIVEL")
					: (BigDecimal) request.getAttribute("CNIVEL");
			java.sql.Date PCFINIVIG = stringToSqlDate(
					isEmpty((String) request.getAttribute("FINIVIG")) ? (String) getCampoTextual(request, "FINIVIG")
							: (String) request.getAttribute("FINIVIG"));
			this.dbBuscarProductos(request, usuario, PSPRODUC, PCACTIVI, PCGARANT, PCNIVEL, PCFINIVIG);

		} catch (Exception e) {

			logger.error("Error en el servicio Axiscomi006Service - m�todo m_buscar_productos", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			// m_cargarValors(request, thisAction);
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	private void m_buscar_actividades(HttpServletRequest request, Axiscomi006Action thisAction, BigDecimal PSPRODUC) {
		logger.debug("Axiscomi00Service m_buscar_actividades");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {

			this.dbBuscarActividades(request, usuario, PSPRODUC);

		} catch (Exception e) {

			logger.error("Error en el servicio Axiscomi006Service - m�todo m_buscar_actividades", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			// m_cargarValors(request, thisAction);
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	private void m_buscar_garantias(HttpServletRequest request, Axiscomi006Action thisAction, BigDecimal PSPRODUC,
			BigDecimal PCACTIVI) {
		logger.debug("Axiscomi006Service m_buscar_actividades");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {

			this.dbBuscarGarantias(request, usuario, PSPRODUC, PCACTIVI);

		} catch (Exception e) {

			logger.error("Error en el servicio Axiscomi006Service - m�todo m_buscar_actividades", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			// m_cargarValors(request, thisAction);
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
	public void m_aceptar(HttpServletRequest request, Axiscomi006Action thisAction) {
		logger.debug("Axiscomi006Service m_aceptar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);

		try {

			Map map = new PAC_IAX_COMISIONES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_COMISIONES__F_SET_TRASPASO_DETALLE_OBJ_BD();
			tratarRETURNyMENSAJES(request, map);
			formdata.put("OK", map.get("RETURN"));

		} catch (Exception e) {
			logger.error("Error en el servicio Axiscomi006Service - m�todo m_aceptar", e);
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
	public void m_cerrar(HttpServletRequest request, Axiscomi006Action thisAction) {
		logger.debug("Axiscomi006Service m_cerrar");
		try {
			request.getSession().removeAttribute("axisctr_listaPolizas");
		} catch (Exception e) {
			logger.error("Error en el servicio Axiscomi006Service - m�todo m_cerrar", e);
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
		logger.debug("Axiscomi006Service m_ajax_busqueda_productos");
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

	public void m_ajax_guardar_porcentaje(HttpServletRequest request) {
		logger.debug("Axiscomi007Service m_ajax_guardar_procentaje");
		AjaxContainerService ajax = new AjaxContainerService();
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {

			BigDecimal CCOMISI = getCampoNumerico(request, "CCOMISI");
			BigDecimal SPRODUC = getCampoNumerico(request, "SPRODUC");
			BigDecimal CACTIVI = getCampoNumerico(request, "CACTIVI");
			BigDecimal CGARANT = getCampoNumerico(request, "CGARANT");
			BigDecimal NIVEL = getCampoNumerico(request, "CNIVEL");
			BigDecimal MODALIDAD = getCampoNumerico(request, "CCODMOD");
			BigDecimal PORCENTAJE = getCampoNumerico(request, "PCOMISI");
			Date FINIVIG = stringToSqlDate(getCampoTextual(request, "FINIVIG"));

			// TODOC: Se deberian diferenciar entre actividad- etcc...
			BigDecimal CCRITERIO = getCampoNumerico(request, "CCRITERIO");
			BigDecimal NDESDE = getCampoNumerico(request, "NDESDE");
			BigDecimal NHASTA = getCampoNumerico(request, "NHASTA");
			Map m = new PAC_IAX_COMISIONES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_COMISIONES__F_SET_DETALLE_COMISION(CCOMISI, SPRODUC, CACTIVI, CGARANT, NIVEL,
							MODALIDAD, FINIVIG, PORCENTAJE, null, null, CCRITERIO, NDESDE, NHASTA, null);
			logger.debug(m);

			ajax.guardarContenidoFinalAContenedorAjax(tratarRETURNyMENSAJES(request, m));

		} catch (Exception e) {
			logger.error("Error en el servicio Axiscomi007Service m_ajax_guardar_procentaje", e);
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

	private void dbBuscarProductos(HttpServletRequest request, UsuarioBean usuario, BigDecimal PSPRODUC,
			BigDecimal PCACTIVI, BigDecimal PCGARANT, BigDecimal PCNIVEL, Date PCFINIVIG) throws Exception {

		// Map map = new
		// PAC_IAX_COMISIONES((java.sql.Connection)request.getAttribute(Constantes.DB01CONN)).ejecutaPAC_IAX_COMISIONES__F_GET_DETALLE_NIVEL(PSPRODUC,PCACTIVI,PCGARANT,PCNIVEL,null);

		Map map = new PAC_IAX_COMISIONES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_COMISIONES__F_GET_PORPRODUCTO(PSPRODUC, PCACTIVI, PCGARANT, PCNIVEL, PCFINIVIG);

		if (PCNIVEL.equals(new BigDecimal(1)))
			request.setAttribute("axisctr_listaProductos", map.get("PT_COMISION"));
		if (PCNIVEL.equals(new BigDecimal(2)))
			request.setAttribute("axisctr_listaProdActividades", map.get("PT_COMISION"));
		if (PCNIVEL.equals(new BigDecimal(3)))
			request.setAttribute("axisctr_listaProdGarantias", map.get("PT_COMISION"));

		logger.debug("ejecutaPAC_IAX_COMISIONES__F_GET_PORPRODUCTO: " + map.get("PT_COMISION"));
	}

	private void dbBuscarActividades(HttpServletRequest request, UsuarioBean usuario, BigDecimal PSPRODUC)
			throws Exception {

		Map map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_LISTVALORES__F_GET_CACTIVI(PSPRODUC, null);
		logger.debug("---> actividades:" + map);
		request.setAttribute("axisctr_listaActividades", tratarRETURNyMENSAJES(request, map));

	}

	private void dbBuscarGarantias(HttpServletRequest request, UsuarioBean usuario, BigDecimal PSPRODUC,
			BigDecimal PCACTIVI) throws Exception {

		Map map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_LISTVALORES__F_GET_CGARANT(PSPRODUC, null, PCACTIVI);
		logger.debug("----> garantias:" + map);
		request.setAttribute("axisctr_listaGarantias", tratarRETURNyMENSAJES(request, map));
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

	public void m_act_fecha(HttpServletRequest request, Axiscomi006Action thisAction) {
		logger.debug("Axiscomi006Service m_aceptar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);

		try {
			BigDecimal PSPRODUC = getCampoNumerico(request, "SPRODUC");
			String FINIVIG = getCampoTextual(request, "FINIVIG");
			formdata.put("FINIVIG", FINIVIG);
			java.sql.Date FFINIVIG = stringToSqlDate(FINIVIG);
			Map map = new PAC_IAX_COMISIONES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_COMISIONES__F_DUPLICAR_CUADRO_PROD(PSPRODUC, FFINIVIG);
			Object oerror = this.tratarRETURNyMENSAJES(request, map);
			formdata.put("MODO", "MODIFICAR");
		} catch (Exception e) {
			logger.error("Error en el servicio Axiscomi006Service - m�todo m_act_fecha", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			m_cargarValors(request, thisAction);
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	public void m_borrar_desglose(HttpServletRequest request, Axiscomi006Action thisAction) {
		logger.debug("Axiscomi006Service m_borrar");
		try {

			UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
			Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

			BigDecimal CACTIVI = getCampoNumerico(request, "CACTIVISELE");
			BigDecimal CGARANT = getCampoNumerico(request, "CGARANTSELE");
			BigDecimal CCOMISI = getHiddenCampoNumerico(request, "CCOMISISELE");
			BigDecimal CMODCOM = getCampoNumerico(request, "CMODCOMSELE");
			java.sql.Date FINIVIG = this.stringToSqlDate(getHiddenCampoTextual(request, "FINIVIGSELE"));
			BigDecimal NINIALT = getCampoNumerico(request, "NINIALTSELE");
			BigDecimal SPRODUC = getCampoNumerico(request, "SPRODUCSELE");
			BigDecimal NFINALT = getCampoNumerico(request, "NFINALTSELE");

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
			logger.error("Error en el servicio Axiscomi006Service - m�todo m_borrar_desglose", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}

	}

}
