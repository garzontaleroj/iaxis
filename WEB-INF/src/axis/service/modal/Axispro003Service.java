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
import axis.mvc.control.modal.Axispro003Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AjaxContainerService;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

public class Axispro003Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE INICIALIZACION
	 *******************************************/
	/*********************************************************************************************************************/

	/**
	 * M�todo que se llama al inicio de este flujo. Realiza la carga inicial de los
	 * importes de las garantia seleccionada.
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_form(HttpServletRequest request, Axispro003Action thisAction) {
		logger.debug("Axispro003Service m_form");
		Map formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map OB_IAX_PRODUCTO = new HashMap();
		try {
			// BigDecimal CSUBPRO =new
			// BigDecimal(String.valueOf(mntproducto.get("CSUBPRO")));

			if (!isEmpty(request.getParameter("CSUBPRO_MODI"))
					|| (!isEmpty(formdata.get("OK")) && String.valueOf(formdata.get("OK")).equals("1"))) {

				Map mntproducto = (Map) request.getSession().getAttribute("mntproducto");

				/* Obtenemos el objeto mediante el SPRODUC */
				BigDecimal SPRODUC = (BigDecimal) request.getAttribute("SPRODUCKEY");
				if (!isEmpty(SPRODUC)) {
					Map map = new PAC_IAX_MNTPROD((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
							.ejecutaPAC_IAX_MNTPROD__F_GET_PRODUCTO(SPRODUC);
					logger.debug(map);
					OB_IAX_PRODUCTO = (Map) tratarRETURNyMENSAJES(request, map);
				}

				mntproducto.put("CSUBPRO", request.getParameter("CSUBPRO_MODI"));
				formdata.put("TITULO", mntproducto.get("TITULO"));
				m_cargar_companiyas(request);

			} else
				m_cargar_datos_generales(request);

			cargarDatosCombos(request);

		} catch (Exception e) {
			logger.error("Error en el servicio Axispro003Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}

	public void m_cargar_datos_generales(HttpServletRequest request) {
		logger.debug("Axispro001Service m_cargar_datos_generales");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		Map OB_IAX_PRODUCTO = new HashMap();
		try {
			BigDecimal SPRODUC = getCampoNumerico(request, "SPRODUC");

			if (!isEmpty(SPRODUC)) {
				Map map = new PAC_IAX_MNTPROD((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_MNTPROD__F_GET_PRODUCTO(SPRODUC);
				logger.debug(map);
				OB_IAX_PRODUCTO = (Map) tratarRETURNyMENSAJES(request, map);
			}

		} catch (Exception e) {
			logger.error("Error en el servicio axispro001Service - m�todo m_form", e);
		} finally {
			formdata.putAll(OB_IAX_PRODUCTO);

			request.setAttribute("COMPANIASSesion", OB_IAX_PRODUCTO.get("COMPANIAS"));
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}

	public void m_setDatosGenerales(HttpServletRequest request, Axispro003Action thisAction) {
		logger.debug("Axispro003Service m_setDatosGenerales");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {
			// TODO: Recuperar TACTIVO de modal

			BigDecimal SPRODUC = getCampoNumerico(request, "SPRODUC");
			BigDecimal CRAMO = getCampoNumerico(request, "CRAMO");
			BigDecimal CMODALI = getCampoNumerico(request, "CMODALI");
			BigDecimal CTIPSEG = getCampoNumerico(request, "CTIPSEG");
			BigDecimal CCOLECT = getCampoNumerico(request, "CCOLECT");

			BigDecimal CACTIVO = getCampoNumerico(request, "CACTIVO");
			BigDecimal CTERMFIN = getCampoNumerico(request, "CTERMFIN");
			BigDecimal CTIPRIE = getCampoNumerico(request, "CTIPRIE");
			BigDecimal COBJASE = getCampoNumerico(request, "COBJASE");
			BigDecimal CSUBPRO = getCampoNumerico(request, "CSUBPRO");
			BigDecimal NMAXRIE = getCampoNumerico(request, "NMAXRIE");
			BigDecimal C2CABEZAS = getCampoNumerico(request, "C2CABEZAS");
			BigDecimal CAGRPRO = getCampoNumerico(request, "CAGRPRO");
			BigDecimal CDIVISA = getCampoNumerico(request, "CDIVISA");
			BigDecimal CPRPROD = getCampoNumerico(request, "CPRPROD");
			BigDecimal CCOMPANI = getCampoNumerico(request, "CCOMPANI");
			// String TPRPROD = getCampoTextual(request,"TPRPROD");
			formdata.put("OK", "1");

			Map map = new PAC_IAX_MNTPROD((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_MNTPROD__F_SET_DATOSGENERALES(SPRODUC, CRAMO, CMODALI, CTIPSEG, CCOLECT, CACTIVO,
							CTERMFIN, CTIPRIE, COBJASE, CSUBPRO, NMAXRIE, C2CABEZAS, CAGRPRO, CDIVISA, CPRPROD,
							CCOMPANI);
			logger.debug(map);
			// BigDecimal resultado = (BigDecimal) tratarRETURNyMENSAJES(request, map);
			if (!isEmpty(tratarRETURNyMENSAJES(request, map))
					&& ((BigDecimal) tratarRETURNyMENSAJES(request, map)).intValue() == 0) {

				if (SPRODUC == null)
					SPRODUC = new BigDecimal(String.valueOf(map.get("SPRODUC_NOU")));

				formdata.put("OK", "0");
				formdata.put("SPRODUC", String.valueOf(map.get("SPRODUC_NOU")));
				request.setAttribute("SPRODUC", String.valueOf(map.get("SPRODUC_NOU")));
			}

		} catch (Exception e) {
			logger.error("Error en el servicio axispro003Service - m�todo m_setDatosGenerales", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);

		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}

	private void cargarDatosCombos(HttpServletRequest request) throws Exception {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap combos = new HashMap();
		Map map = null;

		// ACTIVO
		map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTACTIVO();
		logger.debug(map);
		combos.put("ACTIVO", (List) tratarRETURNyMENSAJES(request, map));

		// TERMINAL FINANCIERO
		map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTTERFINANCIERO();
		logger.debug(map);
		combos.put("TERMINAL", (List) tratarRETURNyMENSAJES(request, map));

		// TIPO RIESGO
		map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTTIPRIESGO();
		logger.debug(map);
		combos.put("TIPORIESGO", (List) tratarRETURNyMENSAJES(request, map));

		// RIESGO ASEGURADO
		map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTCOBJASE();
		logger.debug(map);
		combos.put("RIESGO", (List) tratarRETURNyMENSAJES(request, map));

		// TIPO PRODUCTO
		map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTCSUBPRO();
		logger.debug(map);
		combos.put("PRODUCTO", (List) tratarRETURNyMENSAJES(request, map));

		// PRESTACION
		map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTCPRPROD();
		logger.debug(map);
		combos.put("PRESTACION", (List) tratarRETURNyMENSAJES(request, map));

		// AGRUPACION
		map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTAGRUPPROD();
		logger.debug(map);
		combos.put("AGRUPACION", (List) tratarRETURNyMENSAJES(request, map));

		// MONEDA
		map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTDIVISA();
		logger.debug(map);
		combos.put("MONEDA", (List) tratarRETURNyMENSAJES(request, map));

		// IDIOMAS
		map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTIDIOMAS();
		logger.debug(map);
		combos.put("IDIOMA", (List) tratarRETURNyMENSAJES(request, map));

		String tipo = this.getCampoTextual(request, "tipo");
		map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_LISTVALORES__F_GET_RAMOS(tipo, null);
		logger.debug(map);
		combos.put("RAMOS", (List) tratarRETURNyMENSAJES(request, map));

		// BigDecimal ctipcia = (BigDecimal)3;
		/*
		 * TODO: Map cias = new
		 * PAC_IAX_LISTVALORES((java.sql.Connection)request.getAttribute(Constantes.
		 * DB01CONN)).ejecutaPAC_IAX_LISTVALORES__F_GET_CIAPRODUCTOS(new BigDecimal
		 * (3));
		 */
		Map cias = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_LISTVALORES__F_GET_CIAPRODUCTOS();
		logger.debug(cias);
		combos.put("CIAS", (List) tratarRETURNyMENSAJES(request, cias));

		Map prods = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_LISTVALORES__F_GET_PRODUCTOS(getCampoTextual(request, "tipo"), null, null);
		logger.debug(prods);
		combos.put("PRODS", (List) tratarRETURNyMENSAJES(request, prods, false));

		request.setAttribute("axispro003_datos_generales", combos);

	}

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE ACTUALIZACION
	 ********************************************/
	/*********************************************************************************************************************/

	/**
	 * M�todo que realiza la b�squeda de productos en funci�n de los par�metros de
	 * filtro seleccionados.
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_buscar(HttpServletRequest request, Axispro003Action thisAction) {
		logger.debug("Axispro003Service m_buscar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		try {
			BigDecimal CEMPRESA = getCampoNumerico(request, "EMPRESA");
			BigDecimal CRAMO = getCampoNumerico(request, "RAMO");
			BigDecimal CAGRPRO = getCampoNumerico(request, "AGRUPACION");
			BigDecimal CACTIVO = getCampoNumerico(request, "ACTIVO");
			Map map = new PAC_IAX_MNTPROD((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_MNTPROD__F_GET_CONSULTA(CEMPRESA, CRAMO, CAGRPRO, CACTIVO, null);
			logger.debug(map);

		} catch (Exception e) {
			logger.error("Error en el servicio Axispro003Service - m�todo m_buscar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}

	/**
	 * M�todo que realiza la b�squeda de productos en funci�n de los par�metros de
	 * filtro seleccionados.
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_ajax_guardar_lista(HttpServletRequest request, Axispro003Action thisAction) {
		logger.debug("Axispro003Service m_ajax_guardar_lista");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		// HashMap map= new HashMap();
		Map ajaxcontainer = new HashMap();
		AjaxContainerService ajax = new AjaxContainerService();
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {
			BigDecimal CIDIOMA = getCampoNumerico(request, "CIDIOMA");
			String TIDIOMA = getCampoTextual(request, "TIDIOMA");
			String TTITULO = getCampoTextual(request, "TTITULO");
			String TROTULO = getCampoTextual(request, "TROTULO");
			BigDecimal SPRODUC = getCampoNumerico(request, "SPRODUC");
			Map mntproducto = new HashMap();

			Map map = new PAC_IAX_MNTPROD((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_MNTPROD__F_SET_PRODTITULO(CIDIOMA, TTITULO, TROTULO);
			logger.debug(map);

			if (!isEmpty(map.get("MENSAJES"))) {

				List MENSAJES = (List) map.get("MENSAJES");

				HashMap mensaje = (HashMap) MENSAJES.get(0);
				HashMap OB_IAX_MENSAJES = (HashMap) mensaje.get("OB_IAX_MENSAJES");
				BigDecimal TIPERROR = (BigDecimal) OB_IAX_MENSAJES.get("TIPERROR");
				BigDecimal CERROR = (BigDecimal) OB_IAX_MENSAJES.get("CERROR");
				String TERROR = (String) OB_IAX_MENSAJES.get("TERROR");

				ajaxcontainer.put("ERROR", "1");
				ajaxcontainer.put("smserror", TERROR);

			} else {

				if (!isEmpty(SPRODUC)) {
					Map map_producto = new PAC_IAX_MNTPROD(
							(java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
							.ejecutaPAC_IAX_MNTPROD__F_GET_PRODUCTO(SPRODUC);
					logger.debug(map_producto);
					mntproducto = (Map) tratarRETURNyMENSAJES(request, map_producto);
				}

				ArrayList listaTitulo = (ArrayList) mntproducto.get("TITULO");
				for (int i = 0; i < listaTitulo.size(); i++) {
					Map OB_IAX_PRODTITULO = (Map) ((Map) listaTitulo.get(i)).get("OB_IAX_PRODTITULO");

					if (stringToBigDecimal(String.valueOf(OB_IAX_PRODTITULO.get("CIDIOMA"))).equals(CIDIOMA)) {
						// if (new
						// BigDecimal(Integer.parseInt(String.valueOf(OB_IAX_PRODTITULO.get("CIDIOMA")))).equals(CIDIOMA)){
						OB_IAX_PRODTITULO.put("TROTULO", TROTULO);
						OB_IAX_PRODTITULO.put("TTITULO", TTITULO);
					}
				}
				ajaxcontainer.put("ERROR", "0");
				ajaxcontainer.put("smserror", "");
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axispro003Service - m�todo m_buscar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

	//

	/**
	 * M�todo que a�ade una compa�ia.
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_ajax_guardar_companyia(HttpServletRequest request, Axispro003Action thisAction) {
		logger.debug("Axispro003Service m_ajax_guardar_companyia");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		// HashMap map= new HashMap();
		Map ajaxcontainer = new HashMap();
		AjaxContainerService ajax = new AjaxContainerService();
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {
			BigDecimal COMPANYIA = getCampoNumerico(request, "COMPANY");
			String AGENTE = getCampoTextual(request, "AGENTE");
			BigDecimal PRODUCTOESP = getCampoNumerico(request, "PROD");
			BigDecimal PRODUCTO = getCampoNumerico(request, "PRODUCTO");

			Map map = new PAC_IAX_MNTPROD((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_MNTPROD__F_INSERT_COMPANIPRO(PRODUCTO, COMPANYIA, AGENTE, PRODUCTOESP);
			logger.debug(map);

			if (!isEmpty(map.get("MENSAJES"))) {

				List MENSAJES = (List) map.get("MENSAJES");

				HashMap mensaje = (HashMap) MENSAJES.get(0);
				HashMap OB_IAX_MENSAJES = (HashMap) mensaje.get("OB_IAX_MENSAJES");
				String TERROR = (String) OB_IAX_MENSAJES.get("TERROR");
				ajaxcontainer.put("ERROR", "1");
				ajaxcontainer.put("smserror", TERROR);

			} else {
				ajaxcontainer.put("ERROR", "0");
				ajaxcontainer.put("smserror", "");
				// m_cargar_companiyas(request);
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axispro003Service - m�todo m_ajax_guardar_companyia", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

	/**
	 * M�todo que ELIMINA la companyia
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_ajax_eliminar_companyia(HttpServletRequest request, Axispro003Action thisAction) {
		logger.debug("Axispro003Service m_ajax_eliminar_companyia");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		// HashMap map= new HashMap();
		Map ajaxcontainer = new HashMap();
		AjaxContainerService ajax = new AjaxContainerService();
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {
			BigDecimal COMPANYIA = getCampoNumerico(request, "COMPANY");
			BigDecimal PRODUCTO = getCampoNumerico(request, "PRODUCTO");
			BigDecimal PRODESP = getCampoNumerico(request, "PRODESP");

			Map map = new PAC_IAX_MNTPROD((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_MNTPROD__F_DELETE_COMPANIPRO(PRODUCTO, COMPANYIA, PRODESP);
			logger.debug(map);

			if (!isEmpty(map.get("MENSAJES"))) {

				List MENSAJES = (List) map.get("MENSAJES");

				HashMap mensaje = (HashMap) MENSAJES.get(0);
				HashMap OB_IAX_MENSAJES = (HashMap) mensaje.get("OB_IAX_MENSAJES");
				String TERROR = (String) OB_IAX_MENSAJES.get("TERROR");

				ajaxcontainer.put("ERROR", "1");
				ajaxcontainer.put("smserror", TERROR);

			} else {
				ajaxcontainer.put("ERROR", "0");
				ajaxcontainer.put("smserror", "");
				// m_cargar_companiyas(request);
			}
			// {TTITULO=Dkv Colectivos, SPRODUC=816}
		} catch (Exception e) {
			logger.error("Error en el servicio Axispro003Service - m�todo m_ajax_eliminar_companyia", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

	public void m_ajax_cargar_prod(HttpServletRequest request, Axispro003Action thisAction) {
		logger.debug("Axispro003Service m_ajax_cargar_prod");
		AjaxContainerService ajax = new AjaxContainerService();
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		try {

			BigDecimal COMPANY = this.getCampoNumerico(request, "COMPANY");
			BigDecimal CRAMO = this.getCampoNumerico(request, "CRAMO");
			Map map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES__F_GET_PRODUCTOSCOMPANIA(COMPANY, CRAMO);
			logger.debug(map);

			ajax.guardarContenidoFinalAContenedorAjax(this.tratarRETURNyMENSAJES(request, map));

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr001Service - m�todo m_ajax_busqueda_productos", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());

		}
	}

	public void m_cargar_companiyas(HttpServletRequest request) {
		logger.debug("Axispro001Service m_cargar_datos_generales");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		Map OB_IAX_PRODUCTO = new HashMap();
		try {
			BigDecimal SPRODUC = getCampoNumerico(request, "SPRODUC");
			Map map = new PAC_IAX_MNTPROD((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_MNTPROD__F_GET_PRODUCTO(SPRODUC);
			logger.debug(map);
			OB_IAX_PRODUCTO = (Map) tratarRETURNyMENSAJES(request, map);

		} catch (Exception e) {
			logger.error("Error en el servicio axispro001Service - m�todo m_form", e);
		} finally {

			request.setAttribute("COMPANIASSesion", OB_IAX_PRODUCTO.get("COMPANIAS"));
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}

}
