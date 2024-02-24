package axis.service.modal;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.jdbc.PAC_IAX_MNTPROD;
import axis.mvc.control.modal.Axispro019Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AjaxContainerService;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

/**
 * Axispro019Service.java 27/07/2010
 * 
 * @author <a href="pfeliu@csi-ti.com">Pablo Feliu</a>
 * @since Java 5.0
 */
public class Axispro019Service extends AxisBaseService {
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
	public void m_init(HttpServletRequest request, Axispro019Action thisAction) {
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
	public void m_form(HttpServletRequest request, Axispro019Action thisAction) {
		logger.debug("Axispro019Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		try {

			this.m_cargarCombos(request, thisAction);

		} catch (Exception e) {
			logger.error("Error en el servicio Axispro019Service - m�todo m_form", e);
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
	public void m_guardar(HttpServletRequest request, Axispro019Action thisAction) {
		logger.debug("Axispro019Service m_guardar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {
			PAC_IAX_MNTPROD pac_iax_mntprod = new PAC_IAX_MNTPROD(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			BigDecimal CRAMO = getCampoNumerico(request, "RAMO");
			BigDecimal CMODALI = getCampoNumerico(request, "CMODALI");
			BigDecimal CTIPSEG = getCampoNumerico(request, "CTIPSEG");
			BigDecimal CCOLECT = getCampoNumerico(request, "CCOLECT");
			BigDecimal CAGRPRO = getCampoNumerico(request, "CAGRPRO");
			String TTITULO = getCampoTextual(request, "TTITULO");
			String TROTULO = getCampoTextual(request, "TROTULO");
			BigDecimal CSUBPRO = getCampoNumerico(request, "CSUBPRO");
			BigDecimal CTIPREB = getCampoNumerico(request, "CTIPREB");
			BigDecimal CTIPGES = getCampoNumerico(request, "CTIPGES");
			BigDecimal CTIPPAG = getCampoNumerico(request, "CTIPPAG");
			BigDecimal CDURACI = getCampoNumerico(request, "CDURACI");
			BigDecimal CTARMAN = getCampoNumerico(request, "CTARMAN");
			BigDecimal CTIPEFE = getCampoNumerico(request, "CTIPEFE");
			BigDecimal PPARPRODUCTO = getCampoNumerico(request, "PPARPRODUCTO");
			logger.debug("PPARPRODUCTO:" + PPARPRODUCTO);
			BigDecimal SPRODUC_COPY = getCampoNumerico(request, "SPRODUC_COPY");

			if (isEmpty(PPARPRODUCTO))
				PPARPRODUCTO = new BigDecimal(1);

			Map map = pac_iax_mntprod.ejecutaPAC_IAX_MNTPROD__F_ALTA_PRODUCTO(CRAMO, CMODALI, CTIPSEG, CCOLECT, CAGRPRO,
					TTITULO, TROTULO, CSUBPRO, CTIPREB, CTIPGES, CTIPPAG, CDURACI, CTARMAN, CTIPEFE, SPRODUC_COPY,
					PPARPRODUCTO);
			logger.debug(map);
			tratarRETURNyMENSAJES(request, map);
			formdata.put("SPRODUC", map.get("PSPRODUC_OUT"));
		} catch (Exception e) {
			logger.error("Error en el servicio Axispro019Service - m�todo m_guardar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			m_cargarCombos(request, thisAction);
			m_ajax_busqueda_ramos(request);
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}

	/**
	 * Metodo que cargar� la lista de valores de la pantalla.
	 * 
	 * @param request
	 */
	private void m_cargarCombos(HttpServletRequest request, Axispro019Action thisAction) {
		logger.debug("Axispro019Service m_cargarCombos");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		HashMap listValores = new HashMap();
		try {

			PAC_IAX_LISTVALORES pac_axis_listValores = new PAC_IAX_LISTVALORES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			Map map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTEMPRESAS();
			logger.debug(map);
			List empresas = (List) tratarRETURNyMENSAJES(request, map);
			listValores.put("lstEMP", empresas);

			if (empresas.size() == 1) {
				formdata.put("CEMPRES", ((HashMap) empresas.get(0)).get("CEMPRES"));
				String tipo = this.getCampoTextual(request, "tipo");
				map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_LISTVALORES__F_GET_RAMOS(tipo,
								new BigDecimal(String.valueOf(formdata.get("CEMPRES"))));
				logger.debug(map);
				formdata.put("RAMOS", (List) tratarRETURNyMENSAJES(request, map));
			}

			map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTAGRUPPROD();
			logger.debug(map);
			listValores.put("lstGRUPPROD", (List) tratarRETURNyMENSAJES(request, map));

			map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTCSUBPRO();
			logger.debug(map);
			listValores.put("lstSUBPRO", (List) tratarRETURNyMENSAJES(request, map));

			map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTCTIPREB();
			logger.debug(map);
			listValores.put("lstTIPREB", (List) tratarRETURNyMENSAJES(request, map));

			map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTCTIPGES();
			logger.debug(map);
			listValores.put("lstTIPGES", (List) tratarRETURNyMENSAJES(request, map));

			map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTCTIPPAG();
			logger.debug(map);
			listValores.put("lstTIPPAG", (List) tratarRETURNyMENSAJES(request, map));

			map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTCDURACI();
			logger.debug(map);
			listValores.put("lstDURACI", (List) tratarRETURNyMENSAJES(request, map));

			map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTCTARMAN();
			logger.debug(map);
			listValores.put("lstTARMAN", (List) tratarRETURNyMENSAJES(request, map));

			map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTCTIPEFE();
			logger.debug(map);
			listValores.put("lstTIPEFE", (List) tratarRETURNyMENSAJES(request, map));

			formdata.put("listValores", listValores);

		} catch (Exception e) {
			logger.error("Error en el servicio Axispro019Service - m�todo m_cargarCombos", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
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
		BigDecimal pCOMPANI = this.getCampoNumerico(request, "CCOMPANI");
		Map m;
		if ((pCOMPANI != null) && (pCOMPANI.intValue() > 0)) {
			m = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES__F_GET_PRODUCTOSCOMPANIA(pCOMPANI, getCampoNumerico(request, "CRAMO"));
		} else {
			m = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES__F_GET_RAMPRODUCTOS(getCampoTextual(request, "tipo"),
							getCampoNumerico(request, "CRAMO"), new BigDecimal(0));
		}

		logger.debug(m);
		List productos = (List) tratarRETURNyMENSAJES(request, m, false);

		return productos;
	}

	/**
	 * Realiza una b�squeda de productos por Ajax.
	 * 
	 * @see buscaProductos
	 * @param request El HttpServletRequest que contiene la petici�n del cliente
	 *                web.
	 */
	public void m_ajax_busqueda_productos(HttpServletRequest request) {
		logger.debug("Axisctr019Service m_ajax_busqueda_productos");
		AjaxContainerService ajax = new AjaxContainerService();
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {
			if ((!isEmpty(this.getCampoNumerico(request, "CRAMO")))
					|| (!isEmpty(this.getCampoNumerico(request, "CCOMPANI")))) {
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
	 * Funcion que recupera la lista de los ramos de una empresa
	 * 
	 * @param request El HttpServletRequest que contiene la petici�n del cliente
	 *                web.
	 */
	public void m_ajax_busqueda_ramos(HttpServletRequest request) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		AjaxContainerService ajax = new AjaxContainerService();
		try {
			BigDecimal CEMPRES = getCampoNumerico(request, "CEMPRES");
			logger.debug("---------- VALOR empresa  :" + CEMPRES);
			if (!isEmpty(CEMPRES)) {
				String tipo = this.getCampoTextual(request, "tipo");
				Map map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_LISTVALORES__F_GET_RAMOS(tipo, CEMPRES);
				logger.debug(map);
				if (!isEmpty(map)) {
					List ramos = (List) ajax.rellenarPlAContenedorAjax(map);
					formdata.put("RAMOS", ramos);
					ajax.guardarContenidoFinalAContenedorAjax(ramos);
				}
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr148Service - m�todo m_ajax_recuperar_modelo", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}
}
