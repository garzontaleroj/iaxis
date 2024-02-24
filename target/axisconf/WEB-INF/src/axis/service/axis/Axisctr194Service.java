package axis.service.axis;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_COMMON;
import axis.jdbc.PAC_IAX_DINCARTERA;
import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.control.axis.Axisctr194Action;
import axis.mvc.model.UsuarioBean;
import axis.util.Constantes;

public class Axisctr194Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE INICIALIZACION
	 *******************************************/
	/*********************************************************************************************************************/
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
			String CMATRIC, String CPOSTAL, String TNATRIE, String TDOMICI, String PMODO, BigDecimal CSITUAC,
			String PCONTRATOINT, BigDecimal CAGENTE, BigDecimal NSOLICI, String CPOLCIA, BigDecimal CCOMPANI,
			BigDecimal CACTIVI, BigDecimal CESTSUPL, BigDecimal filtro, String NPOLINI, java.sql.Date FEMISIONINI,
			java.sql.Date FEMISIONFIN, String SUCUROFI, String MODO) throws Exception {

		// Bug 11308 - Si informan el n� de comtrato interno extraemos el n� de poliza y
		// se lo pasamos como tal a la busqueda
		if (PCONTRATOINT != null) {
			Map map = new PAC_IAX_COMMON((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_COMMON__F_EXTRAE_NPOLIZA(PCONTRATOINT);
			BigDecimal NPOLIZA2 = (BigDecimal) map.get("RETURN");
			NPOLIZA = NPOLIZA2;
		}
		HashMap m = new PAC_IAX_DINCARTERA((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_DINCARTERA__F_CONSULTA_GESTRENOVA(CRAMO, SPRODUC, NPOLIZA, NCERT, NNUMIDE, SNIP, BUSCAR,
						NSOLICI, TIPOPERSONA, CAGENTE, CMATRIC, CPOSTAL, TDOMICI, TNATRIE, CSITUAC, PMODO, CPOLCIA,
						CCOMPANI, CACTIVI, CESTSUPL, NPOLINI, filtro, FEMISIONINI, FEMISIONINI, SUCUROFI, MODO);
		logger.debug(m);
		List plReturn = (List) tratarRETURNyMENSAJES(request, m);

		return plReturn;
	}

	/**
	 * M�todo que se llama al inicio de este flujo. Puede servirnos para inicializar
	 * variables.
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_init(HttpServletRequest request, Axisctr194Action thisAction) {
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
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
	public void m_form(HttpServletRequest request, Axisctr194Action thisAction) {
		logger.debug("Axisctr194Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		// Metode que ens formatejar� tots els imports, Sistema europeo o americ�
		// En el cas que no hi hagi cap import per pantalla millor treure aquesta crida
		this.formattingNumericValues(request);

		try {

			this.m_cargarCombos(request, thisAction);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr194Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	/**
	 * Metodo que cargar� la lista de valores de la pantalla. XPL 03052010 BUG XXX
	 * 
	 * @param request
	 */
	private void m_cargarCombos(HttpServletRequest request, Axisctr194Action thisAction) {
		logger.debug("Axisctr194Service m_cargarCombos");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		HashMap listValores = new HashMap();
		try {

			PAC_IAX_LISTVALORES pac_axis_listValores = new PAC_IAX_LISTVALORES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			Map map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(1111));
			logger.debug(map);
			listValores.put("lstbloqueo", (List) tratarRETURNyMENSAJES(request, map));

			formdata.put("listValores", listValores);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr194Service - m�todo m_cargarCombos", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

	/**
	 * M�todo que se encarga de procesar la b�squeda de una p�liza.
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_buscar(HttpServletRequest request, Axisctr194Action thisAction) {
		logger.debug("Axisctr194Service m_buscar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {
			if (formdata.get("paginar") == null) {
				request.getSession().removeAttribute("axisctr_listaPolizas");

				BigDecimal SPRODUC = getCampoNumerico(request, "SPRODUC_BUSCA");
				BigDecimal NPOLIZA = getCampoNumerico(request, "NPOLIZA_BUSCA");
				BigDecimal NCERT = getCampoNumerico(request, "NCERT_BUSCA");
				BigDecimal CRAMO = getCampoNumerico(request, "CRAMO_BUSCA");
				String NNUMIDE = getCampoTextual(request, "NNUMIDE_BUSCA");
				String SNIP = getCampoTextual(request, "SNIP_BUSCA");
				String BUSCAR = getCampoTextual(request, "BUSCAR_BUSCA");
				String CONTRATOINT = getCampoTextual(request, "CONTRATOINT_BUSCA");
				BigDecimal CAGENTE = getCampoNumerico(request, "CAGENTE_BUSCA");
				String CMATRIC = getCampoTextual(request, "CMATRICULA_BUSCA");
				String CPOSTAL = getCampoTextual(request, "CPOSTAL_BUSCA");
				String TNATRIE = getCampoTextual(request, "DESCRIPCION_BUSCA");
				String TDOMICI = getCampoTextual(request, "TDOMICI_BUSCA");
				BigDecimal NSOLICI = getCampoNumerico(request, "NSOLICI_BUSCA");
				BigDecimal CSITUAC = getHiddenCampoNumerico(request, "CSITUAC_BUSCA");
				BigDecimal CCOMPANI = getCampoNumerico(request, "CCOMPANI_BUSCA");
				BigDecimal CACTIVI = getCampoNumerico(request, "CACTIVI_BUSCA");
				BigDecimal CESTSUPL = getCampoNumerico(request, "CESTSUPL_BUSCA");

				BigDecimal TIPOPERSONA = getCampoNumerico(request, "TIPOPERSONA_BUSCA");
				String CPOLCIA = getCampoTextual(request, "CPOLCIA_BUSCA");

				String CMODO = getCampoTextual(request, "tipo_BUSCA");
				String NPOLINI = getCampoTextual(request, "NPOLINI_BUSCA");

				java.sql.Date FEMISIONINI = this.stringToSqlDate(this.getCampoTextual(request, "FEMISIONINI"));
				java.sql.Date FEMISIONFIN = this.stringToSqlDate(this.getCampoTextual(request, "FEMISIONFIN"));
				String SUCUROFI = getCampoTextual(request, "SUCUROFI_BUSCA");
				String MODO = getCampoTextual(request, "MODO_BUSCA");

				BigDecimal filtro = this.getFiltro(request);
				List consultaPolizaReturn = this.dbConsultaPoliza(request, usuario, CRAMO, SPRODUC, NPOLIZA, NCERT,
						NNUMIDE, SNIP, BUSCAR, TIPOPERSONA, CMATRIC, CPOSTAL, TNATRIE, TDOMICI, CMODO, CSITUAC,
						CONTRATOINT, CAGENTE, NSOLICI, CPOLCIA, CCOMPANI, CACTIVI, CESTSUPL, filtro, NPOLINI,
						FEMISIONINI, FEMISIONFIN, SUCUROFI, MODO);
				request.getSession().setAttribute("axisctr_listaPolizas", consultaPolizaReturn);
			}

		} catch (Exception e) {

			logger.error("Error en el servicio Axisctr194Service - m�todo m_buscar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));

		}
	}

	public void m_modificarbloqueo(HttpServletRequest request) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		AjaxContainerService ajax = new AjaxContainerService();
		try {
			HashMap miDataObject = new HashMap();

			BigDecimal SSEGURO = getCampoNumerico(request, "SSEGURO");
			BigDecimal CBLOQUEO = getCampoNumerico(request, "CBLOQUEO");

			Map m = new PAC_IAX_DINCARTERA((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_DINCARTERA__F_ACT_CBLOQUEOCOL(SSEGURO, CBLOQUEO);
			logger.debug("ejecutaPAC_IAX_DINCARTERA__F_ACT_CBLOQUEO---------------------------------------->" + m);

			BigDecimal RETURN = (BigDecimal) tratarRETURNyMENSAJES(request, m);

			if (RETURN.equals(new BigDecimal("0"))) {
				miDataObject.put("hayCambios", "true");

			} else {
				miDataObject.put("hayCambios", "false");
				miDataObject.put("resultado", m);
			}

			request.setAttribute(Constantes.AJAXCONTAINER, miDataObject);
		} catch (Exception e) {
			logger.error("Error.", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	public void m_marcar_json(HttpServletRequest request) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		AjaxContainerService ajax = new AjaxContainerService();
		try {
			HashMap miDataObject = new HashMap();

			BigDecimal CBLOQUEO = getCampoNumerico(request, "CBLOQUEO");
			ArrayList tinfo = (ArrayList) request.getSession().getAttribute("axisctr_listaPolizas");
			BigDecimal RETURN = new BigDecimal(0);
			Map m = new HashMap();
			for (int i = 0; i < tinfo.size(); i++) {
				HashMap mm = (HashMap) tinfo.get(i);

				BigDecimal SSEGUROx = (BigDecimal) mm.get("SSEGURO");

				if (!isEmpty(SSEGUROx)) {
					m = new PAC_IAX_DINCARTERA((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
							.ejecutaPAC_IAX_DINCARTERA__F_ACT_CBLOQUEOCOL(SSEGUROx, CBLOQUEO);
					logger.debug(
							"ejecutaPAC_IAX_DINCARTERA__F_ACT_CBLOQUEO---------------------------------------->" + m);
					RETURN = (BigDecimal) tratarRETURNyMENSAJES(request, m);
				}

			}

			if (RETURN.equals(new BigDecimal("0"))) {

				request.getSession().setAttribute("hayCambios", "true");
				miDataObject.put("hayCambios", "true");

			} else {
				miDataObject.put("hayCambios", "false");
				miDataObject.put("resultado", m);
				ajax.rellenarPlAContenedorAjax(m);

			}

			request.setAttribute(Constantes.AJAXCONTAINER, miDataObject);
		} catch (Exception e) {
			logger.error("Error.", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	public void m_suplementos(HttpServletRequest request, Axisctr194Action thisAction) {
		logger.debug("Axisctr194Service m_suplementos");
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);

		try {
			UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
			BigDecimal NCERTIF = this.getCampoNumerico(request, "NCERTIF_WIZARD");
			String NPOLIZA = this.getCampoTextual(request, "NPOLIZA_WIZARD");
			BigDecimal SSEGURO = this.getCampoNumerico(request, "SSEGURO");
			thisAction.topPila(request, "formdata_axisctr194", formdata);
			thisAction.topPila(request, "SSEGURO", SSEGURO);
			thisAction.topPila(request, "NPOLIZA", NPOLIZA);
			thisAction.topPila(request, "NCERTIF", NCERTIF);
			thisAction.topPila(request, "CMODO_AUX", (String) AbstractDispatchAction.topPila(request, "CMODO"));
			// AbstractDispatchAction.topPila(request, "CMODO", "CONSULTA");
			request.setAttribute(Constantes.PASSTOPPILA, thisAction.topPila(request));

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr194Service - m�todo m_suplementos", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	public void m_emitir(HttpServletRequest request, Axisctr194Action thisAction) {
		logger.debug("Axisctr194Service m_emitir");
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);

		try {
			UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

			BigDecimal SSEGURO = this.getCampoNumerico(request, "SSEGURO");
			BigDecimal NCERTIF = this.getCampoNumerico(request, "NCERTIF_WIZARD");
			String NPOLIZA = this.getCampoTextual(request, "NPOLIZA_WIZARD");
			thisAction.topPila(request, "formdata_axisctr194", formdata);
			thisAction.topPila(request, "SSEGURO", SSEGURO);
			thisAction.topPila(request, "NPOLIZA", NPOLIZA);
			thisAction.topPila(request, "NCERTIF", NCERTIF);

			thisAction.topPila(request, "CMODO_AUX", (String) AbstractDispatchAction.topPila(request, "CMODO"));
			// AbstractDispatchAction.topPila(request, "CMODO", "CONSULTA");
			request.setAttribute(Constantes.PASSTOPPILA, thisAction.topPila(request));

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr194Service - m�todo m_emitir", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	public void m_retenidas(HttpServletRequest request, Axisctr194Action thisAction) {
		logger.debug("Axisctr194Service m_retenidas");
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);

		try {
			UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
			BigDecimal NCERTIF = this.getCampoNumerico(request, "NCERTIF_WIZARD");
			String NPOLIZA = this.getCampoTextual(request, "NPOLIZA_WIZARD");
			BigDecimal SSEGURO = this.getCampoNumerico(request, "SSEGURO");
			thisAction.topPila(request, "formdata_axisctr194", formdata);
			thisAction.topPila(request, "SSEGURO", SSEGURO);
			thisAction.topPila(request, "NPOLIZA", NPOLIZA);
			thisAction.topPila(request, "NCERTIF", NCERTIF);
			thisAction.topPila(request, "CMODO_AUX", (String) AbstractDispatchAction.topPila(request, "CMODO"));
			// AbstractDispatchAction.topPila(request, "CMODO", "CONSULTA");
			request.setAttribute(Constantes.PASSTOPPILA, thisAction.topPila(request));

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr194Service - m�todo m_retenidas", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	public void m_cartera(HttpServletRequest request, Axisctr194Action thisAction) {
		logger.debug("Axisctr194Service m_cartera");
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);

		try {
			UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
			BigDecimal NCERTIF = this.getCampoNumerico(request, "NCERTIF_WIZARD");
			String NPOLIZA = this.getCampoTextual(request, "NPOLIZA_WIZARD");
			BigDecimal SSEGURO = this.getCampoNumerico(request, "SSEGURO");
			thisAction.topPila(request, "formdata_axisctr194", formdata);
			thisAction.topPila(request, "SSEGURO", SSEGURO);
			thisAction.topPila(request, "NPOLIZA", NPOLIZA);
			thisAction.topPila(request, "NCERTIF", NCERTIF);
			thisAction.topPila(request, "CMODO_AUX", (String) AbstractDispatchAction.topPila(request, "CMODO"));
			AbstractDispatchAction.topPila(request, "CMODO", "CARTERA");
			thisAction.topPila(request, "SHOW_RADIO_PROD", 1);
			request.setAttribute(Constantes.PASSTOPPILA, thisAction.topPila(request));

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr194Service - m�todo m_cartera", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	public void m_volver(HttpServletRequest request, Axisctr194Action thisAction) {
		logger.debug("Axisctr194Service m_volver");
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {
			Map formdata_axisctr194 = (Map) thisAction.removeTopPila(request, "formdata_axisctr194");
			if (!isEmpty(formdata_axisctr194)) {
				formdata.putAll(formdata_axisctr194);
			}
			if (!isEmpty(AbstractDispatchAction.topPila(request, "CMODO_AUX")))
				thisAction.topPila(request, "CMODO", (String) AbstractDispatchAction.topPila(request, "CMODO_AUX"));

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr194Service - m�todo m_volver", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	public void m_haysuplementos_json(HttpServletRequest request) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		AjaxContainerService ajax = new AjaxContainerService();
		try {
			HashMap miDataObject = new HashMap();

			// nueva funcion que nos devolver� si hay modificaciones.
			BigDecimal SSEGURO = this.getCampoNumerico(request, "SSEGURO");

			Map m = new PAC_IAX_DINCARTERA((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_DINCARTERA__F_SUPLEMENTO_RENOVACION(SSEGURO);
			logger.debug(m);

			request.getSession().setAttribute("hayCambios", "true");
			miDataObject.put("hayCambios", "true");
			miDataObject.put("resultado", m);
			ajax.rellenarPlAContenedorAjax(m);

			request.setAttribute(Constantes.AJAXCONTAINER, miDataObject);
		} catch (Exception e) {
			logger.error("Error.", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	public void m_activarBotones_json(HttpServletRequest request) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		AjaxContainerService ajax = new AjaxContainerService();
		try {
			HashMap miDataObject = new HashMap();

			BigDecimal SSEGURO = this.getCampoNumerico(request, "SSEGURO");

			// nueva funcion que nos dir� que botones activar
			Map m = new PAC_IAX_DINCARTERA((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_DINCARTERA__F_BOTONES_GESTRENOVA(SSEGURO);
			logger.debug(m);

			request.getSession().setAttribute("hayCambios", "true");
			miDataObject.put("hayCambios", "true");
			miDataObject.put("resultado", m);
			miDataObject.put("OPERMITESUPLEMENTO", m.get("OPERMITESUPLEMENTO"));
			miDataObject.put("OPERMITEPROPRET", m.get("OPERMITEPROPRET"));
			miDataObject.put("OPERMITEEMITIR", m.get("OPERMITEEMITIR"));
			miDataObject.put("OPERMITERENOVAR", m.get("OPERMITERENOVAR"));
			ajax.rellenarPlAContenedorAjax(m);

			request.setAttribute(Constantes.AJAXCONTAINER, miDataObject);
		} catch (Exception e) {
			logger.error("Error.", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	public void m_cartera_cero(HttpServletRequest request, Axisctr194Action thisAction) {
		logger.debug("Axisctr194Service m_cartera_cero");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		AjaxContainerService ajax = new AjaxContainerService();
		try {

			BigDecimal pPNPOLIZA = getCampoNumerico(request, "NPOLIZA_WIZARD");
			BigDecimal pPNCERTIF = getCampoNumerico(request, "NCERTIF_WIZARD");

			// nueva funcion que nos dir� que botones activar
			Map m = new PAC_IAX_DINCARTERA((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_DINCARTERA__F_LANZA_CARTERA_CERO(pPNPOLIZA, pPNCERTIF);
			logger.debug(m);

			BigDecimal RETURN = (BigDecimal) tratarRETURNyMENSAJES(request, m);

			HashMap miDataObject = new HashMap();
			miDataObject.put("SPROCES", m.get("PSPROCES"));
			if (!RETURN.equals(new BigDecimal("0"))) {
				miDataObject.put("resultado", m);
			}

			request.setAttribute(Constantes.AJAXCONTAINER, miDataObject);

		} catch (Exception e) {

			logger.error("Error en el servicio Axisctr194Service - m�todo m_cartera_cero", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));

		}
	}

}
