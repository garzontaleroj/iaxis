package axis.service.modal;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_PROF;
import axis.mvc.control.modal.Axisprf102Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AjaxContainerService;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

public class Axisprf102Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	public void m_init(HttpServletRequest request, Axisprf102Action thisAction) {
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		try {
		} catch (Exception e) {
			thisAction.guardarMensaje(request, "1000060", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}

	public void m_form(HttpServletRequest request, Axisprf102Action thisAction) {
		logger.debug("Axisprf102Service m_form");
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		// Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		try {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
			logger.debug("++++MODO" + request.getParameter("MODO"));
			if (this.getCampoTextual(request, "MODO") != null
					&& this.getCampoTextual(request, "MODO").equals("altaConvenio")) {
				formdata.put("MODO", "altaConvenio");
			}
		} catch (Exception e) {
			logger.error("Error en el servicio Axisprf102Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000060", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {

		}
	}

	public void m_ajax_busqueda_starifa(HttpServletRequest request) {
		logger.debug("Axisprf102Service m_ajax_busqueda_starifa");
		AjaxContainerService ajax = new AjaxContainerService();

		try {
			ajax.guardarContenidoFinalAContenedorAjax(this.buscaStarifa(request));
		} catch (Exception e) {
			logger.error("Error en el servicio Axisprf102Service - m�todo m_ajax_busqueda_starifa", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	private List buscaStarifa(HttpServletRequest request) throws Exception {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		AjaxContainerService ajax = new AjaxContainerService();

		PAC_IAX_PROF pac_iax_prof = new PAC_IAX_PROF((java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

		Map map = pac_iax_prof.ejecutaPAC_IAX_PROF__F_GET_STARIFA();
		logger.debug("++++map starifa " + map);

		List listaStarifa = (List) ajax.rellenarPlAContenedorAjax(map);
		String starifa = listaStarifa.get(0).toString().replace('{', ' ');
		starifa = listaStarifa.get(0).toString().replace('}', ' ');
		formdata.put("STARIFA", starifa.substring(9));
		logger.debug("++++STARIFA " + starifa.substring(9));
		return listaStarifa;
	}

	public void m_busqueda_tarifa(HttpServletRequest request, Axisprf102Action thisAction) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);

		try {

			BigDecimal pSTARIFA = getCampoNumerico(request, "STARIFA");
			String pTDESCRI = getCampoTextual(request, "TDESCRI");

			if (formdata.get("paginar") == null) {
				request.getSession().removeAttribute("Axisprf102_listaTarifas");
				PAC_IAX_PROF PAC_IAX_PROF = new PAC_IAX_PROF(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
				if (formdata.get("MODO") != null && formdata.get("MODO").equals("altaConvenio")) {
					formdata.put("MODO", "");
				}
				if (this.getCampoTextual(request, "pantalla") != null
						&& this.getCampoTextual(request, "pantalla").equals("altaConvenio")) {
					formdata.put("pantalla", "altaConvenio");
				}

				Map map = new HashMap();

				map = PAC_IAX_PROF.ejecutaPAC_IAX_PROF__F_GET_TARIFAS(pSTARIFA, pTDESCRI);

				logger.debug(map);

				request.getSession().setAttribute("axisprf102_listaTarifas",
						(ArrayList) tratarRETURNyMENSAJES(request, map, false));
			}
		} catch (Exception e) {
			logger.error("Error", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}

		this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
	}

	public void m_traspaso_tarifa(HttpServletRequest request, Axisprf102Action thisAction) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);

		try {
			// Recuperar tarifa a buscar
			BigDecimal STARIFA = getCampoNumerico(request, "pSTARIFA");
			logger.debug("++++STARIFA" + STARIFA);
			formdata.put("STARIFA_OUT", STARIFA);
		} catch (Exception e) {
			logger.error("Error", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
	}

	public void m_ajax_copiar_tarifa(HttpServletRequest request, Axisprf102Action this1) {
		logger.debug("Axisprf102Service m_ajax_copiar_tarifa");
		AjaxContainerService ajax = new AjaxContainerService();
		PAC_IAX_PROF pac_iax_prof = new PAC_IAX_PROF((java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

		try {
			BigDecimal starifa_new = this.getCampoNumerico(request, "STARIFA_new");
			BigDecimal starifa_sel = this.getCampoNumerico(request, "STARIFA_sel");

			Map map = pac_iax_prof.ejecutaPAC_IAX_PROF__F_COPIAR_TARIFA(starifa_new, starifa_sel);

			logger.debug("++++copiar " + map);

			BigDecimal retorn = (BigDecimal) ajax.rellenarPlAContenedorAjax(map);

			ajax.guardarContenidoFinalAContenedorAjax(retorn);
		} catch (Exception e) {
			logger.error("Error en el servicio Axisprf102Service - m�todo m_ajax_copiar_tarifa", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}
}
