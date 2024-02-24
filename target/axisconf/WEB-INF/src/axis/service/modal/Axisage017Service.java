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
import axis.jdbc.PAC_IAX_MNTPROD;
import axis.jdbc.PAC_IAX_REDCOMERCIAL;
import axis.mvc.control.modal.Axisage017Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AjaxContainerService;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

/**
 * Axisage017Service.java 24/10/2011
 * 
 * @author <a href="joan_torres@csi-ti.com">Joan Torres</a>
 * @since Java 5.0
 */
public class Axisage017Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	// f_get_detallegarantia
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
	public void m_init(HttpServletRequest request, Axisage017Action thisAction) {
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		try {

		} catch (Exception e) {
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}

	}

	/**
	 * 
	 * @param request
	 */
	@SuppressWarnings("all")
	public void m_form(HttpServletRequest request, Axisage017Action thisAction) {
		logger.debug("Axisage017Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {
			BigDecimal PCAGENTE = isEmpty(getCampoNumerico(request, "PARCAGENTE"))
					? getCampoNumerico(request, "CAGENTE")
					: getCampoNumerico(request, "PARCAGENTE");
			String NOMBRE = getCampoTextual(request, "NOMBRE");
			String NNUMIDE = getCampoTextual(request, "NNUMIDE");

			logger.debug("Params ----> " + PCAGENTE);

			formdata.put("CAGENTE", PCAGENTE);

			/*
			 * HashMap map = new
			 * PAC_IAX_LISTVALORES((java.sql.Connection)request.getAttribute(Constantes.
			 * DB01CONN)).ejecutaPAC_IAX_LISTVALORES__F_GET_LSTAGENTES(NOMBRE,
			 * NNUMIDE,PCAGENTE,new BigDecimal(1) ); logger.debug (map); List listaAgentes =
			 * (List) tratarRETURNyMENSAJES(request, map); String TAGENTE =
			 * (String)((HashMap)listaAgentes.get(0)).get("NOMBRE");
			 * 
			 * formdata.put("TAGENTE",TAGENTE);
			 */

			HashMap map = new PAC_IAX_REDCOMERCIAL((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_REDCOMERCIAL__FF_DESAGENTE(PCAGENTE, new BigDecimal(1));
			logger.debug(map);
			if (tratarRETURNyMENSAJES(request, map) != null) {
				String TAGENTE = (String) tratarRETURNyMENSAJES(request, map);
				formdata.put("TAGENTE", TAGENTE);
			}

			this.cargaListaRamos(request);
			BigDecimal CRAMO = null;
			if (!isEmpty(request.getAttribute("axisctr_listaRamos"))) {
				ArrayList lista = (ArrayList) request.getAttribute("axisctr_listaRamos");
				if (lista.size() == 1)
					CRAMO = (BigDecimal) (((HashMap) lista.get(0)).get("CRAMO"));
			}
			formdata.put("CRAMO", CRAMO);

			List productos = dbGetProductos(request);

			if (!isEmpty(productos)) {
				if (productos.size() == 1)
					formdata.put("SPRODUC", (BigDecimal) (((HashMap) productos.get(0)).get("SPRODUC")));
			}

			request.setAttribute("productos", productos != null ? productos : new ArrayList());

			List actividades = this.dbGetActividades(request);
			request.setAttribute("actividades", ((actividades == null) ? new ArrayList() : actividades));

			String EDIT = getCampoTextual(request, "EDIT");
			formdata.put("EDIT", EDIT);

			if (EDIT.equals(new String("EDIT"))) {
				BigDecimal PSPRODUC = getCampoNumerico(request, "PARSPRODUC");
				BigDecimal PCACTIVI = getCampoNumerico(request, "PARCACTIVI");
				map = new PAC_IAX_REDCOMERCIAL((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_REDCOMERCIAL__F_GET_DETSUBVENCION(PCAGENTE, PSPRODUC, PCACTIVI);
				logger.debug(map);
				Map detsub = (Map) tratarRETURNyMENSAJES(request, map);

				formdata.put("SPRODUC", PSPRODUC);
				formdata.put("CACTIVI", PCACTIVI);
				formdata.put("IIMPORTE", (BigDecimal) detsub.get("IIMPORTE"));
				formdata.put("ramoProducto", (BigDecimal) detsub.get("CRAMO"));
				formdata.put("EDICION", "TRUE");
			} else
				formdata.put("EDICION", "FALSE");

		} catch (Exception e) {
			logger.error("Error en el servicio Axisage017Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {

			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));

		}
	}

	public void m_aceptar(HttpServletRequest request, Axisage017Action thisAction) {
		logger.debug("Axisage017Service m_aceptar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		String tipo = this.getCampoTextual(request, "tipo");
		try {
			BigDecimal PSPRODUC = getHiddenCampoNumerico(request, "SPRODUC");
			BigDecimal PCACTIVI = getHiddenCampoNumerico(request, "CACTIVI");
			BigDecimal PCAGENTE = getHiddenCampoNumerico(request, "CAGENTE");
			BigDecimal PIIMPORTE = getHiddenCampoNumerico(request, "IIMPORTE");
			String EDIT = getHiddenCampoTextual(request, "EDIT");
			BigDecimal PMODO = null;
			if (EDIT.equals("NEW"))
				PMODO = new BigDecimal(1);
			else
				PMODO = new BigDecimal(2);

			HashMap map = new PAC_IAX_REDCOMERCIAL((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_REDCOMERCIAL__F_SET_SUBVENCION(PMODO, PCAGENTE, PSPRODUC, PCACTIVI, PIIMPORTE);
			BigDecimal resultado = (BigDecimal) tratarRETURNyMENSAJES(request, map);

			if (resultado.intValue() == 0)
				request.setAttribute("resultadoOK", "OK");
			else
				request.setAttribute("resultadoOK", "KO");

		} catch (Exception e) {
			logger.error("Error en el servicio Axisage017Service - m�todo m_aceptar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			// m_cargarValors(request, thisAction);
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	private List dbGetCompaniRams(HttpServletRequest request) throws Exception {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		// Carga de ramos de la BD
		Map map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_LISTVALORES__F_GET_RAMOS(null, null);
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

	/**
	 * M�todo que llama a la funci�n pl correspondiente a la carga de productos para
	 * seleccionar una p�liza.
	 * 
	 * @param request
	 * @param usuario
	 * @return
	 * @throws Exception
	 */
	private List dbGetProductos(HttpServletRequest request) throws Exception {
		// TODO: PCTERMFIN a hard-code
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map m = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_LISTVALORES__F_GET_PRODUCTOS(null, null, null);
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
		// TODO: PCTERMFIN a hard-code
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map m = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_LISTVALORES__F_GET_RAMPRODUCTOS(null, getCampoNumerico(request, "CRAMO"),
						new BigDecimal(0));

		logger.debug(m);
		List productos = (List) tratarRETURNyMENSAJES(request, m, false);

		return productos;
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
		List actividades;
		if (!this.isEmpty(pPSPRODUC)) {
			Map m = new PAC_IAX_MNTPROD((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_MNTPROD__F_GET_ACTIVID(pPSPRODUC);
			logger.debug(m);
			actividades = (List) tratarRETURNyMENSAJES(request, m, false);
		} else {
			BigDecimal PSPRODUC = this.getCampoNumerico(request, "PARSPRODUC");
			if (!this.isEmpty(PSPRODUC)) {
				Map m = new PAC_IAX_MNTPROD((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_MNTPROD__F_GET_ACTIVID(PSPRODUC);
				logger.debug(m);
				actividades = (List) tratarRETURNyMENSAJES(request, m, false);
			} else {
				actividades = new ArrayList();
			}
		}

		return actividades;
	}

	/**
	 * Realiza una b�squeda de productos por Ajax.
	 * 
	 * @see buscaProductos
	 * @param request El HttpServletRequest que contiene la petici�n del cliente
	 *                web.
	 */
	public void m_ajax_busqueda_productos(HttpServletRequest request, Axisage017Action thisAction) {
		logger.debug("Axisage017Service m_ajax_busqueda_productos");
		AjaxContainerService ajax = new AjaxContainerService();
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {
			logger.debug("ABANS IF");
			if (!isEmpty(this.getCampoNumerico(request, "CRAMO")))
				ajax.guardarContenidoFinalAContenedorAjax(this.dbGetRamProductos(request));
			else
				ajax.guardarContenidoFinalAContenedorAjax(this.dbGetProductos(request));
			logger.debug("DESPRES IF");
		} catch (Exception e) {
			logger.debug("CATCH");
			logger.error("Error en el servicio Axisage017ervice - m�todo m_ajax_busqueda_productos", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			logger.debug("FINALLY");
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
	public void m_ajax_busqueda_actividades(HttpServletRequest request, Axisage017Action thisAction) {
		logger.debug("Axisage017Service m_ajax_busqueda_actividades");
		AjaxContainerService ajax = new AjaxContainerService();
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		try {
			ajax.guardarContenidoFinalAContenedorAjax(this.dbGetActividades(request));
		} catch (Exception e) {
			logger.error("Error en el servicio Axisage017Service - m�todo m_ajax_busqueda_actividades", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());

		}
	}
}
