package axis.service.axis;

import java.math.BigDecimal;
import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_LIQUIDACOR;
import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.control.axis.Axisctr079Action;
import axis.mvc.model.UsuarioBean;
import axis.util.Constantes;

/**
 * Axisctr079Service.java
 * 
 * @author <a href="rkirchner@csi-ti.com">Roger Kirchner</a>
 * @since Java 5.0
 */
public class Axisctr079Service extends AxisBaseService {
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

	public void m_init(HttpServletRequest request) {
		logger.debug("Axisctr079Service m_init");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		List LSTRECIBOS = null;
		try {
			// formdata.put("SPROLIQ_", null);
			BigDecimal CEMPRES = getCampoNumerico(request, "CEMPRES");
			if (isEmpty(CEMPRES) && !isEmpty(request.getAttribute("CEMPRES")))
				CEMPRES = new BigDecimal(String.valueOf(request.getAttribute("CEMPRES")));
			BigDecimal SPRODUC = getCampoNumerico(request, "SPRODUC");
			BigDecimal SPROCES = getCampoNumerico(request, "SPROLIQ_SEL");
			BigDecimal NMES = getCampoNumerico(request, "NMES");
			BigDecimal NANO = getCampoNumerico(request, "NANO");
			BigDecimal CESTADO = getCampoNumerico(request, "CESTADO");
			BigDecimal CCOMPANI = getCampoNumerico(request, "CCOMPANI");
			BigDecimal NRECIBO = getCampoNumerico(request, "NRECIBO");
			String NRECIBOCIA = getCampoTextual(request, "NRECIBOCIA");
			BigDecimal NPOLIZA = getCampoNumerico(request, "NPOLIZA");
			String NPOLIZACIA = getCampoTextual(request, "NPOLIZACIA");
			Date FEMISIOINI = stringToSqlDate(getCampoTextual(request, "FEMISIOINI"));
			Date FEMISIOFIN = stringToSqlDate(getCampoTextual(request, "FEMISIOFIN"));
			Date FEFEINI = stringToSqlDate(getCampoTextual(request, "FEFEINI"));
			Date FEFEFIN = stringToSqlDate(getCampoTextual(request, "FEFEFIN"));
			Date FCOBINI = stringToSqlDate(getCampoTextual(request, "FCOBINI"));
			Date FCOBFIN = stringToSqlDate(getCampoTextual(request, "FCOBFIN"));
			BigDecimal CAGENTE = getCampoNumerico(request, "CAGENTE");

			PAC_IAX_LIQUIDACOR pac_iax_liquidacor = new PAC_IAX_LIQUIDACOR(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			if (!isEmpty(CEMPRES) && !isEmpty(SPROCES)) {
				Map map = pac_iax_liquidacor.ejecutaPAC_IAX_LIQUIDACOR__F_GET_LIQUIDA(CEMPRES, SPRODUC, SPROCES, NMES,
						NANO, CESTADO, NPOLIZA, NPOLIZACIA, NRECIBO, NRECIBOCIA, CCOMPANI, CAGENTE, FEMISIOINI,
						FEMISIOFIN, FEFEINI, FEFEFIN, FCOBINI, FCOBFIN);
				// logger.debug("ejecutaPAC_IAX_LIQUIDACOR__F_GET_LIQUIDA devuelve: "+map);
				if (((BigDecimal) tratarRETURNyMENSAJES(request, map)).intValue() == 0) {
					if (!this.isEmpty(map.get("PT_LIQUIDA"))) {
						LSTRECIBOS = (List<Map>) map.get("PT_LIQUIDA");
					}
				}
				if (isEmpty(LSTRECIBOS)) {
					// No se han encontrado datos
					AbstractDispatchAction.guardarMensaje(request, "120135", null, Constantes.MENSAJE_INFO);
				} else {
					formdata.put("LSTLIQUIDACIONES", isEmpty(LSTRECIBOS) ? new ArrayList() : LSTRECIBOS);
				}
			}
			this.cargarCombos(request);
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr079Service - m�todo m_init", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
	}

	public void m_form(HttpServletRequest request) {
		logger.debug("Axisctr079Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		HashMap POB_LIQUIDA = null;
		List LSTLIQUIDACIONES = new ArrayList<HashMap>();
		BigDecimal CCOMPANI = null;
		try {
			BigDecimal SPROLIQ_SEL = getCampoNumerico(request, "SPROLIQ_SEL");
			if (!this.isEmpty(SPROLIQ_SEL)) {
				PAC_IAX_LIQUIDACOR pac_iax_liquidacor = new PAC_IAX_LIQUIDACOR(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
				Map map = pac_iax_liquidacor.ejecutaPAC_IAX_LIQUIDACOR__F_GET_LIQUIDA_OB(SPROLIQ_SEL);
				logger.debug("ejecutaPAC_IAX_LIQUIDACOR__F_GET_LIQUIDA_OB devuelve: " + map);
				if (((BigDecimal) tratarRETURNyMENSAJES(request, map)).intValue() == 0) {
					if (!this.isEmpty(map.get("POB_LIQUIDA"))) {
						POB_LIQUIDA = (HashMap) map.get("POB_LIQUIDA");
						LSTLIQUIDACIONES.add(POB_LIQUIDA);
						CCOMPANI = (BigDecimal) POB_LIQUIDA.get("CCOMPANI");
						formdata.put("CCOMPANI", CCOMPANI);
					}
				}
				formdata.put("LSTLIQUIDACIONES", isEmpty(LSTLIQUIDACIONES) ? new ArrayList() : LSTLIQUIDACIONES);
			}
			this.cargarCombos(request);
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr079Service - m�todo m_form", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
	}

	public void m_aceptar(HttpServletRequest request) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {
			BigDecimal SPROCES = getCampoNumerico(request, "SPROCES");
			PAC_IAX_LIQUIDACOR pac_iax_liquidacor = new PAC_IAX_LIQUIDACOR(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map map = pac_iax_liquidacor.ejecutaPAC_IAX_LIQUIDACOR__F_SET_RECLIQUI(SPROCES);
			tratarRETURNyMENSAJES(request, map);
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
			this.cargarCombos(request);
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr079Service - m�todo m_form", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
	}

	private void cargarCombos(HttpServletRequest request) throws Exception {
		BigDecimal INDEX_SPROLIQ = getCampoNumerico(request, "INDEX_SPROLIQ");
		BigDecimal INDEX_NMOVLIQ = getCampoNumerico(request, "INDEX_NMOVLIQ");
		BigDecimal SPROLIQ_SEL = getCampoNumerico(request, "SPROLIQ_SEL");
		BigDecimal NEW = getCampoNumerico(request, "NEW");
		BigDecimal CCOMPANI = getCampoNumerico(request, "CCOMPANI");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		if ((NEW != null) && (NEW.intValue() == 1)) {
			UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

			// Recuperamos las empresas
			Map cias = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES__F_GET_RAMOSCOMPANIA(CCOMPANI);
			logger.debug("ejecutaPAC_IAX_LISTVALORES__F_GET_RAMOSCOMPANIA: devuelve" + cias);
			List listacias = (List) tratarRETURNyMENSAJES(request, cias);
			formdata.put("CIAS", listacias);
			cargaListaProductos(request);
			BigDecimal CRAMO = getCampoNumerico(request, "CRAMO");
			logger.debug("CRAM-->" + CRAMO);
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
			formdata.put("productos", ((productos == null) ? new ArrayList() : productos));
		}
		formdata.put("INDEX_SPROLIQ", isEmpty(INDEX_SPROLIQ) ? new BigDecimal("0") : INDEX_SPROLIQ);
		formdata.put("INDEX_NMOVLIQ", isEmpty(INDEX_NMOVLIQ) ? new BigDecimal("0") : INDEX_NMOVLIQ);
		formdata.put("INDEX_NMOVLIQ", isEmpty(SPROLIQ_SEL) ? new BigDecimal("-1") : SPROLIQ_SEL);
		formdata.put("NEW", isEmpty(NEW) ? new BigDecimal("0") : NEW);
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
	 * 
	 * @param request
	 */
	@SuppressWarnings("all")
	public void m_ajax_recliqui(HttpServletRequest request, Axisctr079Action thisAction) {
		logger.debug("Axisctr079Service m_recliqui");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {
			BigDecimal pP_SPROLIQ = getCampoNumerico(request, "SPROLIQ");
			BigDecimal pP_SELEC = getCampoNumerico(request, "SELEC");
			BigDecimal pP_SIGNO = getCampoNumerico(request, "SIGNO");
			BigDecimal pP_MODIF = getCampoNumerico(request, "MODIF");
			String NRECIBOS = getCampoTextual(request, "NRECIBO");
			PAC_IAX_LIQUIDACOR pac_iax_liquidacor = new PAC_IAX_LIQUIDACOR(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			while ((NRECIBOS != null) && (NRECIBOS.length() > 0)
					&& (NRECIBOS.lastIndexOf(",") + 1 == NRECIBOS.length())) {
				NRECIBOS = NRECIBOS.substring(0, NRECIBOS.lastIndexOf(","));
			}
			Map map = pac_iax_liquidacor.ejecutaPAC_IAX_LIQUIDACOR__F_SETOBJETORECLIQUI(NRECIBOS, pP_SPROLIQ, pP_SELEC,
					pP_SIGNO, pP_MODIF);
			logger.debug("ejecutaPAC_IAX_LIQUIDACOR__F_SETOBJETORECLIQUI devuelve: " + map);
			tratarRETURNyMENSAJES(request, map);
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr079Service - m�todo m_recliqui", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

	public void m_ajax_recliquiAll(HttpServletRequest request, Axisctr079Action thisAction) {
		logger.debug("Axisctr079Service m_recliqui");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {
			BigDecimal pP_SPROLIQ = getCampoNumerico(request, "SPROLIQ");
			BigDecimal pP_SELEC = getCampoNumerico(request, "SELEC");
			PAC_IAX_LIQUIDACOR pac_iax_liquidacor = new PAC_IAX_LIQUIDACOR(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map map = pac_iax_liquidacor.ejecutaPAC_IAX_LIQUIDACOR__F_SETOBJETORECLIQUIALL(pP_SPROLIQ, pP_SELEC);
			logger.debug("ejecutaPAC_IAX_LIQUIDACOR__F_SETOBJETORECLIQUIALL devuelve: " + map);
			tratarRETURNyMENSAJES(request, map);
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr079Service - m�todo m_recliqui", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

	public void set_movliqui(HttpServletRequest request, Axisctr079Action thisAction) {
		logger.debug("Axisctr079Service m_recliqui");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {
			BigDecimal pP_CESTADO = getCampoNumerico(request, "CESTADO");
			BigDecimal pP_SPROLIQ = getCampoNumerico(request, "SPROLIQ");

			PAC_IAX_LIQUIDACOR pac_iax_liquidacor = new PAC_IAX_LIQUIDACOR(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map map = pac_iax_liquidacor.ejecutaPAC_IAX_LIQUIDACOR__F_SET_MOVLIQUI(pP_SPROLIQ, pP_CESTADO);
			logger.debug("ejecutaPAC_IAX_LIQUIDACOR__F_SET_MOVLIQUI devuelve: " + map);

			tratarRETURNyMENSAJES(request, map);
			this.cargarCombos(request);
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr079Service - m�todo m_recliqui", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

	public void m_buscar_rec(HttpServletRequest request, Axisctr079Action thisAction) {
		logger.debug("Axisctr079Service m_recliqui");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {
			BigDecimal pP_SPROLIQ = getCampoNumerico(request, "SPROLIQ_SEL");
			BigDecimal pP_NRECIBO = getCampoNumerico(request, "NRECIBO");
			BigDecimal pP_CCOMPANI = getCampoNumerico(request, "CCOMPANI");
			BigDecimal pP_CAGENTE = getCampoNumerico(request, "CAGENTE");
			String pP_CMONSEG = getCampoTextual(request, "CMONSEG");
			String pP_CMONLIQ = getCampoTextual(request, "CMONLIQ");
			BigDecimal pP_CGESCOB = getCampoNumerico(request, "CGESCOB");
			BigDecimal pP_CRAMO = getCampoNumerico(request, "ramoProducto");
			String pP_SPRODUC = getCampoTextual(request, "LSSELPRODUCTS");
			while ((pP_SPRODUC != null) && (pP_SPRODUC.length() > 0)
					&& (pP_SPRODUC.lastIndexOf(",") + 1 == pP_SPRODUC.length())) {
				pP_SPRODUC = pP_SPRODUC.substring(0, pP_SPRODUC.lastIndexOf(","));
			}
			Date FEFECTOINI = stringToSqlDate(getCampoTextual(request, "FEFECTODESDE"));
			Date FEFECTOFIN = stringToSqlDate(getCampoTextual(request, "FEFECTOHASTA"));
			PAC_IAX_LIQUIDACOR pac_iax_liquidacor = new PAC_IAX_LIQUIDACOR(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map map = pac_iax_liquidacor.ejecutaPAC_IAX_LIQUIDACOR__F_GET_RECIBOS_PROPUESTOS(pP_SPROLIQ, pP_NRECIBO,
					pP_CCOMPANI, pP_CAGENTE, pP_CMONSEG, pP_CMONLIQ, pP_CGESCOB, pP_CRAMO, pP_SPRODUC, FEFECTOINI,
					FEFECTOFIN);
			logger.debug("ejecutaPAC_IAX_LIQUIDACOR__F_GET_RECIBOS_PROPUESTOS devuelve: " + map);

			tratarRETURNyMENSAJES(request, map);
			this.cargarCombos(request);
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr079Service - m�todo m_recliqui", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

	//
	/**
	 * Carga la lista inicial de ramos en la pantalla.
	 * 
	 * @param request El HttpServletRequest que contiene la petici�n del cliente
	 *                web.
	 */
	private void cargaListaProductos(HttpServletRequest request) throws Exception {
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		// Carga de ramos de la BD
		BigDecimal CCOMPANI = getCampoNumerico(request, "CCOMPANI");
		BigDecimal CRAMO = getCampoNumerico(request, "ramoProducto");
		Map map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_LISTVALORES__F_GET_PRODUCTOSCOMPANIA(CCOMPANI, CRAMO);
		List listaRamos = (List) tratarRETURNyMENSAJES(request, map);
		formdata.put("axisctr_listaProductos", listaRamos != null ? listaRamos : new ArrayList());
		listaRamos = null;
	}

}
