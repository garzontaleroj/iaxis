package axis.service.axis;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.jdbc.PAC_IAX_LISTVALORES_SIN;
import axis.jdbc.PAC_IAX_PERSONA;
import axis.jdbc.PAC_IAX_SINIESTROS;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.control.axis.Axissin061Action;
import axis.mvc.model.UsuarioBean;
import axis.util.Constantes;

/**
 * Axissin061Service.java
 * 
 * @since Java 5.0
 */
public class Axissin061Service extends AxisBaseService {
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
		logger.debug("Axissin061Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {
			cargarListas(request);

		} catch (Exception e) {
			logger.error("Error en el servicio Axissin061Service - m�todo m_form", e);
			AbstractDispatchAction.guardarMensaje(request,
					"verbatim:<b>" + e.getClass().getName() + ":</b> " + e.getLocalizedMessage(),
					new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}

	public void m_init(HttpServletRequest request) {
		logger.debug("Axissin061Service m_aceptar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {
			BigDecimal CAGENTE = usuario.getCagente();
			BigDecimal SPERSON = getCampoNumerico(request, "SPERSON");
			formdata.put("CAGENTE", CAGENTE);
			logger.debug("CAGENTE-- :" + CAGENTE);

			if (!isEmpty(SPERSON)) {

				String PMODE = new String("POL");
				Map map = new PAC_IAX_PERSONA((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_PERSONA__F_GET_PERSONA_AGENTE(SPERSON, CAGENTE, PMODE);

				logger.debug("get PERSONA()" + map);
				Map OB_PERSONA = (Map) map.get("OBPERSONA");
				formdata.putAll(OB_PERSONA);

				String nomComplet = !isEmpty(OB_PERSONA.get("TNOMBRE")) ? (String) OB_PERSONA.get("TNOMBRE") + " "
						: " ";
				nomComplet += !isEmpty(OB_PERSONA.get("TAPELLI1")) ? (String) OB_PERSONA.get("TAPELLI1") + " " : " ";
				nomComplet += !isEmpty(OB_PERSONA.get("TAPELLI2")) ? (String) OB_PERSONA.get("TAPELLI2") + " " : " ";

				formdata.put("NOMBRE", nomComplet);
			}
		} catch (Exception e) {
			logger.error("Error en el servicio Axissin061Service - m�todo m_init", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);

		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}

	public void m_actualizar_pago(HttpServletRequest request) {
		logger.debug("Axissin061Service m_aceptar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		try {

			String PSTBLPAG = getCampoTextual(request, "TBLPAG");
			BigDecimal PCESPAG = getCampoNumerico(request, "CESTPAG");
			BigDecimal PCESTPAG2 = getCampoNumerico(request, "new_CESTPAG");
			BigDecimal PCESTVAL2 = getCampoNumerico(request, "new_CESTVAL");

			if (isEmpty(PCESTPAG2) && !isEmpty(PCESPAG)) {
				PCESTPAG2 = PCESPAG;
			}

			Map m = new PAC_IAX_SINIESTROS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_SINIESTROS__F_TRATAR_PAGOS(PSTBLPAG, PCESTVAL2, PCESTPAG2, PCESPAG);

			logger.debug("----> siniestros:" + m);
			tratarRETURNyMENSAJES(request, m);

		} catch (Exception e) {
			logger.error("Error en el servicio Axissin061Service - m�todo m_aceptar", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);

		} finally {
			formdata.put("CESTVAL_FIL", null);
			formdata.put("CESTPAG_FIL", null);
			formdata.put("TBLPAG", null);
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
			m_buscar(request);
		}
	}

	private void cargarListas(HttpServletRequest request) throws Exception {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {
			BigDecimal CRAMO = getCampoNumerico(request, "CRAMO");
			BigDecimal SPRODUC = getCampoNumerico(request, "_SPRODUC");
			BigDecimal PESTVALANT = getCampoNumerico(request, "CESTVAL");
			BigDecimal PESTPAGANT = getCampoNumerico(request, "CESTPAG");
			BigDecimal PESTVAL = getCampoNumerico(request, "new_CESTVAL");

			PAC_IAX_LISTVALORES_SIN pac_axis_listvalores_sin = new PAC_IAX_LISTVALORES_SIN(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			PAC_IAX_LISTVALORES pac_iax_listavalores = new PAC_IAX_LISTVALORES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			logger.debug("CRAMO-->" + CRAMO);

			this.cargaListaRamos(request);

			if ((!isEmpty(request.getAttribute("axisctr_listaRamos"))) && (CRAMO == null)) {
				ArrayList lista = (ArrayList) request.getAttribute("axisctr_listaRamos");
				if (lista.size() == 1)
					CRAMO = (BigDecimal) (((HashMap) lista.get(0)).get("CRAMO"));
			}
			formdata.put("CRAMO", CRAMO);
			List productos = new ArrayList();
			if (isEmpty(CRAMO)) {
				productos = dbGetProductos(request, usuario);
			} else {
				productos = dbGetRamProductos(request);
			}

			if (!isEmpty(productos)) {
				if ((productos.size() == 1) && (SPRODUC == null)) {
					formdata.put("_SPRODUC", (BigDecimal) (((HashMap) productos.get(0)).get("SPRODUC")));
				} else {
					formdata.put("_SPRODUC", SPRODUC);
				}
				formdata.put("productos", ((productos == null) ? new ArrayList() : productos));
			}
			Map listValores = new HashMap();
			Map map = pac_iax_listavalores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(803));
			listValores.put("lstcconpag", (List) tratarRETURNyMENSAJES(request, map, false));

			map = pac_axis_listvalores_sin.ejecutaPAC_IAX_LISTVALORES_SIN__F_GET_LSTCESTVAL();
			listValores.put("lstestval", (List) tratarRETURNyMENSAJES(request, map, false));

			map = pac_iax_listavalores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(3));
			listValores.put("lstestpagdef", (List) tratarRETURNyMENSAJES(request, map, false));

			if (!isEmpty(PESTVAL)) {
				map = pac_axis_listvalores_sin.ejecutaPAC_IAX_LISTVALORES_SIN__F_GET_LSCTESTMOV(PESTVALANT, PESTPAGANT,
						PESTVAL);
				listValores.put("lcestpag", (List) tratarRETURNyMENSAJES(request, map, false));
			}

			formdata.put("listvalores", listValores);

		} catch (Exception e) {
			logger.error("Error en el servicio Axissin061Service - m�todo m_form", e);
			AbstractDispatchAction.guardarMensaje(request, "1000050", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
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
		logger.debug("----Buscamos productos TIPO:" + getCampoTextual(request, "tipo") + "------------");
		Map m = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_LISTVALORES__F_GET_RAMPRODUCTOS(getCampoTextual(request, "tipo"),
						getCampoNumerico(request, "CRAMO"), new BigDecimal(0));
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
		logger.debug("----Buscamos productos TIPO:" + getCampoTextual(request, "tipo") + "------------");
		Map m = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_LISTVALORES__F_GET_PRODUCTOS(getCampoTextual(request, "tipo"), null, null);
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
		String tipo = this.getCampoTextual(request, "tipo");
		// Carga de ramos de la BD
		Map map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_LISTVALORES__F_GET_RAMOS(tipo, null);
		List listaRamos = (List) tratarRETURNyMENSAJES(request, map, false);
		request.setAttribute("axisctr_listaRamos", listaRamos != null ? listaRamos : new ArrayList());
		listaRamos = null;
	}

	public void m_buscar(HttpServletRequest request) {
		logger.debug("Axissin061Service m_buscar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		try {

			BigDecimal PSPRODUC = getCampoNumerico(request, "_SPRODUC");
			BigDecimal PCESPAG = getCampoNumerico(request, "CESTPAG");
			String PNSINIES = getCampoTextual(request, "_NSINIES");
			BigDecimal PCCONPAG = getCampoNumerico(request, "CCONPAG");
			BigDecimal PCESTVAL = getCampoNumerico(request, "CESTVAL");
			BigDecimal PCRAMO = getCampoNumerico(request, "CRAMO");
			BigDecimal PIMPMIN = getCampoNumerico(request, "ISINRET");
			BigDecimal PSPERSON = getCampoNumerico(request, "SPERSON");
			BigDecimal PSIDEPAG = getCampoNumerico(request, "SIDEPAG");

			Map m = new PAC_IAX_SINIESTROS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_SINIESTROS__F_GET_LST_PAGOS(PCRAMO, PSPRODUC, PNSINIES, PSIDEPAG, PCCONPAG, PIMPMIN,
							PCESTVAL, PCESPAG, PSPERSON);

			logger.debug("----> siniestros:" + m);
			formdata.put("CESTPAG_FIL", PCESPAG);
			formdata.put("CESTVAL_FIL", PCESTVAL);
			formdata.put("lista_sin", tratarRETURNyMENSAJES(request, m));

		} catch (Exception e) {
			logger.error("Error en el servicio Axissin061Service - m�todo m_buscar", e);
			if (e.getMessage().contains("ORA-01003"))
				AbstractDispatchAction.guardarMensaje(request, "9901229", new Object[] { e.toString() },
						Constantes.MENSAJE_ERROR);
			else
				AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
						Constantes.MENSAJE_ERROR);

		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
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
		logger.debug("Axissin019Service m_ajax_busqueda_productos");
		AjaxContainerService ajax = new AjaxContainerService();
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {
			if (!isEmpty(this.getCampoNumerico(request, "CRAMO"))) {

				ajax.guardarContenidoFinalAContenedorAjax(this.dbGetRamProductos(request));

			} else
				ajax.guardarContenidoFinalAContenedorAjax(this.dbGetProductos(request, usuario));
		} catch (Exception e) {
			logger.error("Error en el servicio Axissin019Service - m�todo m_ajax_busqueda_productos", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	public void m_ajax_concepto_pago(HttpServletRequest request) {
		logger.debug("Axissin019Service m_ajax_concepto_pago");
		AjaxContainerService ajax = new AjaxContainerService();
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {
			BigDecimal SPRODUC = this.getCampoNumerico(request, "_SPRODUC");
			if (!isEmpty(SPRODUC)) {
				Map map = new PAC_IAX_LISTVALORES_SIN((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_LISTVALORES_SIN__F_GET_LSTCCONPAG(null);
				if (!isEmpty(map)) {
					List listaGarantias = (List) tratarRETURNyMENSAJES(request, map);
					ajax.guardarContenidoFinalAContenedorAjax(listaGarantias);
				}
			}
		} catch (Exception e) {
			logger.error("Error en el servicio Axissin019Service - m�todo m_ajax_busqueda_productos", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	public void m_ajax_pago(HttpServletRequest request) {
		logger.debug("Axissin061Service m_ajax_pago");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		AjaxContainerService ajax = new AjaxContainerService();
		try {
			java.sql.Connection con = (java.sql.Connection) request.getAttribute(Constantes.DB01CONN);
			PAC_IAX_LISTVALORES_SIN pac_iax_listvalores_sin = new PAC_IAX_LISTVALORES_SIN(con);

			BigDecimal PESTVALANT = getCampoNumerico(request, "ESTVALANT");
			BigDecimal PESTPAGANT = getCampoNumerico(request, "ESTPAGANT");
			BigDecimal PESTVAL = getCampoNumerico(request, "ESTVAL");

			Map map = pac_iax_listvalores_sin.ejecutaPAC_IAX_LISTVALORES_SIN__F_GET_LSCTESTMOV(PESTVALANT, PESTPAGANT,
					PESTVAL);

			logger.debug("----->" + map);

			if (!isEmpty(map)) {
				List listaGarantias = (List) tratarRETURNyMENSAJES(request, map);
				ajax.guardarContenidoFinalAContenedorAjax(listaGarantias);
			}
		} catch (Exception e) {
			logger.error("Error en el servicio Axissin013Service - m�todo m_ajax_pago", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	public void m_traspasar(HttpServletRequest request, Axissin061Action thisAction) {

		logger.debug("Axissin061Service m_recargar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {
			BigDecimal CAGENTE_VISIO = getCampoNumerico(request, "CAGENTE_VISIO");
			BigDecimal SPERSON = getCampoNumerico(request, "SPERSON");
			BigDecimal CAGENTE_PROD = usuario.getCagente();
			logger.debug("CAGENTE_PROD ---> " + CAGENTE_PROD);
			logger.debug("CAGENTE_VISIO ---> " + CAGENTE_VISIO);

			formdata.put("CAG_AUX", CAGENTE_PROD);

			PAC_IAX_PERSONA pac_axis_persona = new PAC_IAX_PERSONA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			Map m = pac_axis_persona.ejecutaPAC_IAX_PERSONA__F_INSERTA_DETALLE_PER(SPERSON, CAGENTE_VISIO,
					CAGENTE_PROD);
			this.tratarRETURNyMENSAJES(request, m);
			logger.debug(m);

			this.cargarListas(request);
			this.m_init(request);
		} catch (Exception e) {
			logger.error("Error en el servicio Axissin061Service - m�todo m_recargar", e);
			thisAction.guardarMensaje(request, "1000052", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	public void m_consultarSiniestro(HttpServletRequest request, Axissin061Action thisAction) {
		logger.debug("Axissin061Service m_consultarSiniestro");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {

			// Push de los datos necesarios a la pila
			BigDecimal SSEGURO = null;
			if (!isEmpty(request.getParameter("SSEGURO"))) {
				SSEGURO = new BigDecimal(request.getParameter("SSEGURO"));
			}
			logger.debug("++++SSEGURO" + SSEGURO);
			String NSINIES = null;
			if (!isEmpty(request.getParameter("NSINIES"))) {
				NSINIES = request.getParameter("NSINIES");
			}
			logger.debug("++++NSINIES" + NSINIES);
			String NSINIESselected = NSINIES;
			BigDecimal SPRODUC = null;
			if (!isEmpty(request.getParameter("SPRODUC"))) {
				SPRODUC = new BigDecimal(request.getParameter("SPRODUC"));
			}
			logger.debug("++++SPRODUC" + SPRODUC);
			BigDecimal CACTIVI = null;
			if (!isEmpty(request.getParameter("CACTIVI"))) {
				CACTIVI = new BigDecimal(request.getParameter("CACTIVI"));
			}
			logger.debug("++++CACTIVI" + CACTIVI);

			BigDecimal PSPRODUC = getCampoNumerico(request, "_SPRODUC");
			BigDecimal PCESPAG = getCampoNumerico(request, "CESTPAG");
			String PNSINIES = getCampoTextual(request, "_NSINIES");
			BigDecimal PCCONPAG = getCampoNumerico(request, "CCONPAG");
			BigDecimal PCESTVAL = getCampoNumerico(request, "CESTVAL");
			BigDecimal PCRAMO = getCampoNumerico(request, "CRAMO");
			BigDecimal PIMPMIN = getCampoNumerico(request, "ISINRET");
			BigDecimal PSPERSON = getCampoNumerico(request, "SPERSON");
			BigDecimal PSIDEPAG = getCampoNumerico(request, "SIDEPAG");

			thisAction.topPila(request, "SSEGURO", SSEGURO);
			thisAction.topPila(request, "NSINIES", NSINIES);
			thisAction.topPila(request, "NSINIESselected", NSINIESselected);
			thisAction.topPila(request, "SPRODUC", SPRODUC);
			thisAction.topPila(request, "CACTIVI", CACTIVI);
			thisAction.topPila(request, "_SPRODUC", PSPRODUC);
			thisAction.topPila(request, "CESTPAG", PCESPAG);
			thisAction.topPila(request, "_NSINIES", PNSINIES);
			thisAction.topPila(request, "CCONPAG", PCCONPAG);
			thisAction.topPila(request, "CESTVAL", PCESTVAL);
			thisAction.topPila(request, "CRAMO", PCRAMO);
			thisAction.topPila(request, "ISINRET", PIMPMIN);
			thisAction.topPila(request, "SPERSON", PSPERSON);
			thisAction.topPila(request, "SIDEPAG", PSIDEPAG);

			thisAction.topPila(request, "formdata_axissin061", formdata);
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));

		} catch (Exception e) {
			logger.error("Error en el servicio Axissin061Service - m�todo m_consultarSiniestro", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	public void m_volver(HttpServletRequest request, Axissin061Action thisAction) {
		logger.debug("Axissin061Service m_volver");
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {
			formdata.put("NSINIES", (String) thisAction.removeTopPila(request, "NSINIES"));
			formdata.put("SSEGURO", bigDecimalToString((BigDecimal) thisAction.removeTopPila(request, "SSEGURO")));
			formdata.put("SPRODUC", bigDecimalToString((BigDecimal) thisAction.removeTopPila(request, "SPRODUC")));
			formdata.put("CACTIVI", bigDecimalToString((BigDecimal) thisAction.removeTopPila(request, "CACTIVI")));
			formdata.put("_SPRODUC", bigDecimalToString((BigDecimal) thisAction.removeTopPila(request, "_SPRODUC")));
			formdata.put("CESTPAG", bigDecimalToString((BigDecimal) thisAction.removeTopPila(request, "CESTPAG")));
			formdata.put("_NSINIES", (String) thisAction.removeTopPila(request, "_NSINIES"));
			formdata.put("CCONPAG", bigDecimalToString((BigDecimal) thisAction.removeTopPila(request, "CCONPAG")));
			formdata.put("CESTVAL", bigDecimalToString((BigDecimal) thisAction.removeTopPila(request, "CESTVAL")));
			formdata.put("CRAMO", bigDecimalToString((BigDecimal) thisAction.removeTopPila(request, "CRAMO")));
			formdata.put("ISINRET", bigDecimalToString((BigDecimal) thisAction.removeTopPila(request, "ISINRET")));
			formdata.put("SPERSON", bigDecimalToString((BigDecimal) thisAction.removeTopPila(request, "SPERSON")));
			formdata.put("SIDEPAG", bigDecimalToString((BigDecimal) thisAction.removeTopPila(request, "SIDEPAG")));

			m_form(request);
			// renovarLista( request, thisAction); // por si las moscas
		} catch (Exception e) {
			logger.error("Error en el servicio Axissin061Service - m�todo m_volver", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}
}
