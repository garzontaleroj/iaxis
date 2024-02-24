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
import axis.jdbc.PAC_IAX_PROF;
import axis.mvc.control.modal.Axisprf005Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AjaxContainerService;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

public class Axisprf005Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	public void m_init(HttpServletRequest request, Axisprf005Action thisAction) {
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		try {
			this.cargaListaRamos(request);
			this.cargaCuentasCorrientes(request);
		} catch (Exception e) {
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}

	public void m_form(HttpServletRequest request, Axisprf005Action thisAction) {
		logger.debug("Axisprf005Service m_form");
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		// Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {

		} catch (Exception e) {
			logger.error("Error en el servicio axisprf005Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}

	public void guardar(HttpServletRequest request, Axisprf005Action thisAction) {
		logger.debug("Axisprf005Service m_form");
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		// Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {
			BigDecimal pPsrofes = this.getCampoNumerico(request, "pCodiProf");
			BigDecimal pCramo = this.getCampoNumerico(request, "CRAMO");
			BigDecimal pSproduc = this.getCampoNumerico(request, "SPRODUC");
			BigDecimal pPcactivi = this.getCampoNumerico(request, "CACTIVIDAD");
			BigDecimal pPcnordban = this.getCampoNumerico(request, "CNORDBAN");
			logger.debug("$$$$$$$$$$$$    pPsrofes :: " + pPsrofes);
			logger.debug("$$$$$$$$$$$$    pCramo   :: " + pCramo);
			logger.debug("$$$$$$$$$$$$    pSproduc :: " + pSproduc);
			logger.debug("$$$$$$$$$$$$    pPcactivi :: " + pPcactivi);
			logger.debug("$$$$$$$$$$$$    pPcnordban :: " + pPcnordban);

			Map map = new PAC_IAX_PROF((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_PROF__F_SET_CCC(pPsrofes, pCramo, pSproduc, pPcactivi, pPcnordban);

			if (((BigDecimal) tratarRETURNyMENSAJES(request, map)).intValue() == 0) {
				formdata.put("guardat", "0");
			} else {
				formdata.put("guardat", "1");

				this.cargaListaRamos(request);
				this.cargaCuentasCorrientes(request);
			}

			logger.debug("$$$$$$$$$$$$ fin pac_iax_prof: " + map);
		} catch (Exception e) {
			logger.error("Error en el servicio axisprf005Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}

	private void cargaListaRamos(HttpServletRequest request) throws Exception {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		// Carga de ramos de la BD
		String tipo = this.getCampoTextual(request, "tipo");
		logger.debug("tipo-->" + tipo);
		try {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
			if (!isEmpty(request.getAttribute("VALOR_POR_DEFECTO"))
					&& (isEmpty(request.getAttribute("tipo")) || request.getAttribute("tipo").equals("null"))) {
				logger.debug("in");
				int valores_defecto_size = ((java.util.List) request.getAttribute("VALOR_POR_DEFECTO")).size();
				logger.debug("valores_defecto_size:" + valores_defecto_size);
				for (int i = 0; i < valores_defecto_size; i++) {
					String campoid = (String) ((java.util.Map) ((java.util.List) request
							.getAttribute("VALOR_POR_DEFECTO")).get(i)).get("CAMPOID");
					String valor = (String) ((java.util.Map) ((java.util.List) request
							.getAttribute("VALOR_POR_DEFECTO")).get(i)).get("VALOR");
					logger.debug("campoid:" + campoid);
					logger.debug("valor:" + valor);
					if (campoid.equals("tipo")) {
						tipo = valor;
						formdata.put("tipo", tipo);
					}
				}
			}
		} catch (Exception e) {
			logger.debug("Exception :" + e.getMessage());
		}
		Map map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_LISTVALORES__F_GET_RAMOSAGENTE(null, tipo, null);
		logger.debug("++++map ramos-->" + map);

		List listaRamos = (List) tratarRETURNyMENSAJES(request, map);
		request.getSession().setAttribute("axisprf_listaRamos", listaRamos != null ? listaRamos : new ArrayList());
		listaRamos = null;
	}

	public void m_ajax_busqueda_productos(HttpServletRequest request) {
		logger.debug("Axisprf005Service m_ajax_busqueda_productos");
		AjaxContainerService ajax = new AjaxContainerService();
		try {
			ajax.guardarContenidoFinalAContenedorAjax(this.buscaProductos(request));
		} catch (Exception e) {
			logger.error("Error en el servicio Axisprf005Service - m�todo m_ajax_busqueda_productos", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	private List buscaProductos(HttpServletRequest request) throws Exception {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();

		String CRAMO = getCampoTextual(request, "CRAMO");
		String TRAMO = getCampoTextual(request, "TRAMO");
		String CTERMFIN = "1";
		// Poner ramo seleccionado en session
		Map selectedRamo = new HashMap();
		selectedRamo.put("CRAMO", CRAMO);
		selectedRamo.put("TRAMO", TRAMO);
		request.getSession().setAttribute("axisprf_selectedRamo", selectedRamo);

		// Nos cargamos los productos por si hubiera un query anterior
		// request.getSession().removeAttribute("axisprf_listaProductos");
		// Cargamos productos
		if (!isEmpty(CRAMO)) {
			String tipo = this.getCampoTextual(request, "tipo");
			Map map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES__F_GET_RAMPRODUCTOS(tipo, new BigDecimal(CRAMO), new BigDecimal("0"));
			logger.debug("++++map Ramproductos-->" + map);

			List plListaProductos = (List) ajax.rellenarPlAContenedorAjax(map);
			// request.getSession().setAttribute("axisprf_listaProductos",
			// plListaProductos);
			// logger.debug((List)request.getSession().getAttribute("axisprf_listaProductos"));
			return plListaProductos;
		} else {
			Map map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES__F_GET_PRODUCTOS(null, null, null);
			logger.debug("++++map productos-->" + map);

			List plListaProductos = (List) ajax.rellenarPlAContenedorAjax(map);
			// request.getSession().setAttribute("axisprf_listaProductos",
			// plListaProductos);
			// logger.debug((List)request.getSession().getAttribute("axisprf_listaProductos"));
			return plListaProductos;
		}
	}

	public void m_ajax_busqueda_actividades(HttpServletRequest request) {
		logger.debug("Axisprf005Service m_ajax_busqueda_actividades");
		AjaxContainerService ajax = new AjaxContainerService();
		try {
			ajax.guardarContenidoFinalAContenedorAjax(this.buscaActividades(request));
		} catch (Exception e) {
			logger.error("Error en el servicio Axisprf005Service - m�todo m_ajax_busqueda_actividades", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	private List buscaActividades(HttpServletRequest request) throws Exception {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();

		BigDecimal CRAMO = new BigDecimal(String.valueOf(getCampoTextual(request, "CRAMO")));
		BigDecimal SPRODUC = new BigDecimal(String.valueOf(getCampoTextual(request, "SPRODUC")));

		PAC_IAX_LISTVALORES pac_iax_listvalores = new PAC_IAX_LISTVALORES(
				(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
		Map map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_CACTIVI(SPRODUC, CRAMO);

		logger.debug("++++map actividades " + map);
		List plListaActividades = (List) ajax.rellenarPlAContenedorAjax(map);
		return plListaActividades;
	}

	public void cargaCuentasCorrientes(HttpServletRequest request) throws Exception {
		logger.debug("Axisprf005Service cargaCuentasCorrientes");

		Map map = new PAC_IAX_PROF((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_PROF__F_GET_LSTCCC(this.getCampoNumerico(request, "pCodiProf"));
		logger.debug("++++map cuentas " + map);

		List listaCuentasCC = (List) tratarRETURNyMENSAJES(request, map);
		request.setAttribute("listaCuentasCC", listaCuentasCC);
		listaCuentasCC = null;
	}
}
