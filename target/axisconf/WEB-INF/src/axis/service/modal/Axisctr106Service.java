package axis.service.modal;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_ASEGURADORAS;
import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.mvc.control.modal.Axisctr106Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AjaxContainerService;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

public class Axisctr106Service extends AxisBaseService {
	static Log logger = LogFactory.getLog(Axisctr106Service.class);

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
	private List dbConsultaAsegura(HttpServletRequest request, UsuarioBean usuario, String CCODDGS, String TNOMBRE)
			throws Exception {
		// BigDecimal CEMPRES, BigDecimal CCODASEG,
		// BigDecimal CCODIGO, BigDecimal CCODDEP, BigDecimal CCODDGS);

		Map m = new PAC_IAX_ASEGURADORAS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_ASEGURADORAS__F_GET_ASEGURADORAS(null, null, null, null, CCODDGS, TNOMBRE, null);
		logger.debug(m);
		this.tratarRETURNyMENSAJES(request, m);
		ArrayList m2 = (ArrayList) m.get("ASEGURADORAS");
		logger.debug(m2);

		/*
		 * 
		 * map =
		 * pacIaxPensiones.ejecutaPAC_IAX_PENSIONES__F_GET_OB_PLANPENSIONES((BigDecimal)
		 * m2.get("CCODPLA")); logger.debug(map);
		 * 
		 * HashMap m3=(HashMap)map.get("PLANPENSIONES"); logger.debug(m3); //if
		 * (!isEmpty(tratarRETURNyMENSAJES(request, m3, false))) if (new
		 * BigDecimal(0).equals(map.get("RETURN"))) { logger.debug("LLEGO LLEGO: "+
		 * m3.get("CCODFON")); formdata.put("CCODPLA_TRASPAS", m3.get("CODDGS"));
		 * //formdata.put("TCODPLA_TRASPAS", m3.get("TNOMPLA"));
		 * formdata.put("CCODFON_TRASPAS", m3.get("CCODFON"));
		 * formdata.put("TCODFON_TRASPAS", m3.get("TFONDO"));
		 * formdata.put("CCODGES_TRASPAS", m3.get("CCODGES"));
		 * formdata.put("TCODGES_TRASPAS", m3.get("TNOMGES")); }
		 * 
		 */

		return m2;

	}

	/**
	 * M�todo inicial al llamar a �ste flujo.
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_init(HttpServletRequest request, Axisctr106Action thisAction) {
		logger.debug("Axisctr106Service m_init");
		try {
			request.getSession().removeAttribute("axisctr_listaAegura");
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr106Service - m�todo m_init", e);
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
	public void m_form(HttpServletRequest request, Axisctr106Action thisAction) {
		logger.debug("Axisctr106Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {
			request.getSession().removeAttribute("axisctr_listaAegura");

			this.m_cargarValors(request, thisAction);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr106Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.configForm(request, whoami(this));
	}

	private void m_cargarValors(HttpServletRequest request, Axisctr106Action thisAction) {
		logger.debug("Axisctr106Service m_cargarValors");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {
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
			logger.error("Error en el servicio Axisctr106Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

	/**
	 * M�todo que se encarga de procesar la b�squeda de una p�liza.
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_buscar(HttpServletRequest request, Axisctr106Action thisAction) {
		logger.debug("Axisctr106Service m_buscar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {
			if (formdata.get("paginar") == null) {
				request.getSession().removeAttribute("axisctr_listaAegura");

				String CCODDGS = getCampoTextual(request, "CODDGS");
				String TNOMBRE = getCampoTextual(request, "NOMBRE");

				BigDecimal TIPOPERSONA = getCampoNumerico(request, "TIPOPERSONA");

				String CMODO = getCampoTextual(request, "tipo");
				logger.debug("----" + CMODO + "------------");
				logger.debug("----Buscamos XVM TIPO:" + getCampoTextual(request, "tipo") + "------------");

				List consultaAseguraReturn = this.dbConsultaAsegura(request, usuario, CCODDGS, TNOMBRE);
				logger.debug(consultaAseguraReturn);
				request.getSession().setAttribute("axisctr_listaAegura", consultaAseguraReturn);
			} else {
				// Qu� importa esto! No llenaremos el log de debugs por paginaci�n!
				// logger.debug("axisctr106 paginando");
			}

		} catch (Exception e) {

			logger.error("Error en el servicio Axisctr106Service - m�todo m_buscar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			m_cargarValors(request, thisAction);
			this.configForm(request, whoami(this));
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
	public void m_aceptar(HttpServletRequest request, Axisctr106Action thisAction) {
		logger.debug("Axisctr106Service m_aceptar");
		try {
			List listaAegura = (List) request.getSession().getAttribute("axisctr_listaAegura");
			String SPOLIZA = getCampoTextual(request, "SPOLIZA");

			if (!isEmpty(listaAegura) && !isEmpty(SPOLIZA)) {
				Map poliza = getObjetoDeLista(listaAegura, SPOLIZA, "idPoliza");
				if (!isEmpty(poliza))
					request.getSession().setAttribute("axisctr_poliza", poliza);
			}
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr106Service - m�todo m_aceptar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			m_cargarValors(request, thisAction);
			this.configForm(request, whoami(this));
		}
	}

	/**
	 * M�todo que se llama al cerrar el modal.
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_cerrar(HttpServletRequest request, Axisctr106Action thisAction) {
		logger.debug("Axisctr106Service m_cerrar");
		try {
			request.getSession().removeAttribute("axisctr_listaAegura");
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr106Service - m�todo m_cerrar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			m_cargarValors(request, thisAction);
			this.configForm(request, whoami(this));
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
		logger.debug("Axisctr106Service m_ajax_busqueda_productos");
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
}
