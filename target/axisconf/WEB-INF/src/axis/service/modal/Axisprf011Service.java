package axis.service.modal;

import java.math.BigDecimal;
import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.jdbc.PAC_IAX_LISTVALORES_SIN;
import axis.jdbc.PAC_IAX_PROF;
import axis.mvc.control.modal.Axisprf011Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AjaxContainerService;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

public class Axisprf011Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	public void m_init(HttpServletRequest request, Axisprf011Action thisAction) {
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		try {
			// this.cargaListaRamos(request);
		} catch (Exception e) {
			thisAction.guardarMensaje(request, "1000060", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}

	public void m_form(HttpServletRequest request, Axisprf011Action thisAction) {
		logger.debug("Axisprf011Service m_form");
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		// Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		try {
			PAC_IAX_PROF pac_iax_prof = new PAC_IAX_PROF(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			BigDecimal psprofes = this.getCampoNumerico(request, "pCodiProf");
			Map map = pac_iax_prof.ejecutaPAC_IAX_PROF__F_GET_CTIPPROF(psprofes);
			logger.debug("++++map tipos profesional " + map);
			List TIPOSPROF = (List) tratarRETURNyMENSAJES(request, map, false);
			formdata.put("TIPOSPROF", TIPOSPROF);

			map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES__F_GET_PRODUCTOS(getCampoTextual(request, "tipo"), null, null);
			logger.debug("++++map productos " + map);
			List PRODUCTOS = (List) tratarRETURNyMENSAJES(request, map, false);
			formdata.put("PRODUCTOS", PRODUCTOS);

			map = new PAC_IAX_LISTVALORES_SIN((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES_SIN__F_GET_LSTCTCAUSIN();
			logger.debug("++++map causas " + map);
			List CAUSAS = (List) tratarRETURNyMENSAJES(request, map, false);
			formdata.put("CAUSAS", CAUSAS);

			String MODO = this.getCampoTextual(request, "MODO");
			formdata.put("MODO", MODO);

			if (MODO != null) {
				if (MODO.equalsIgnoreCase("modificar")) {
					BigDecimal pCTIPPRO = this.getCampoNumerico(request, "CTIPPRO");
					BigDecimal pCSUBPRO = this.getCampoNumerico(request, "CSUBPRO");
					BigDecimal pSPRODUC = this.getCampoNumerico(request, "SPRODUC");
					BigDecimal pCCAUSIN = this.getCampoNumerico(request, "CCAUSIN");
					if (this.getCampoTextual(request, "FDESDE") != null) {
						Date pFDESDE = Date.valueOf(this.getCampoTextual(request, "FDESDE").substring(0, 10));
						formdata.put("FDESDE", pFDESDE);
					}
					if (this.getCampoTextual(request, "FHASTA") != null) {
						Date pFHASTA = Date.valueOf(this.getCampoTextual(request, "FHASTA").substring(0, 10));
						formdata.put("FHASTA", pFHASTA);
					}
					formdata.put("pCodiProf", psprofes);
					formdata.put("CTIPPRO", pCTIPPRO);
					formdata.put("CSUBPRO", pCSUBPRO);
					formdata.put("SPRODUC", pSPRODUC);
					formdata.put("CCAUSIN", pCCAUSIN);
				}
			}

			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		} catch (Exception e) {
			logger.error("Error en el servicio Axisprf011Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000060", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {

		}
	}

	public void guardar(HttpServletRequest request, Axisprf011Action thisAction) {
		logger.debug("Axisprf011Service guardar");
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map map = new HashMap();

		try {
			PAC_IAX_PROF pac_iax_prof = new PAC_IAX_PROF(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			BigDecimal pSPROFES = this.getCampoNumerico(request, "pCodiProf");
			BigDecimal pCTIPPRO = this.getCampoNumerico(request, "CTIPPRO");
			BigDecimal pCSUBPRO = this.getCampoNumerico(request, "CSUBPRO");
			BigDecimal pSPRODUC = this.getCampoNumerico(request, "SPRODUC");
			BigDecimal pCCAUSIN = this.getCampoNumerico(request, "CCAUSIN");
			Date pFDESDE = this.stringToSqlDate(this.getCampoTextual(request, "FDESDE"));
			Date pFHASTA = this.stringToSqlDate(this.getCampoTextual(request, "FHASTA"));

			String MODO = this.getCampoTextual(request, "MODO");

			if (MODO != null && MODO.equals("modificar")) {
				BigDecimal ppCTIPPRO = this.getCampoNumerico(request, "pCTIPPRO");
				BigDecimal ppCSUBPRO = this.getCampoNumerico(request, "pCSUBPRO");
				Date ppFDESDE = this.stringToSqlDate(this.getCampoTextual(request, "FDESDE"));
				map = pac_iax_prof.ejecutaPAC_IAX_PROF__F_MOD_DESCARTADOS(pSPROFES, ppCTIPPRO, ppCSUBPRO, pSPRODUC,
						pCCAUSIN, ppFDESDE, pFHASTA);

				logger.debug("$$$$$$$$$$$$ fin pac_iax_prof: " + map);

			} else {
				map = pac_iax_prof.ejecutaPAC_IAX_PROF__F_SET_DESCARTADO(pSPROFES, pCTIPPRO, pCSUBPRO, pSPRODUC,
						pCCAUSIN, pFDESDE, pFHASTA);

				logger.debug("$$$$$$$$$$$$ fin pac_iax_prof: " + map);
			}

			if (((BigDecimal) tratarRETURNyMENSAJES(request, map)).intValue() == 0) {
				formdata.put("guardat", "0");
			} else {
				formdata.put("guardat", "1");
				this.cargarListas(request);
			}

			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		} catch (Exception e) {
			logger.error("Error en el servicio Axisprf011Service - m�todo guardar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

	public void m_ajax_busqueda_subtipos(HttpServletRequest request) {
		logger.debug("Axisprf011Service m_ajax_busqueda_subtipos");
		AjaxContainerService ajax = new AjaxContainerService();
		try {
			ajax.guardarContenidoFinalAContenedorAjax(this.buscaSubtipos(request));
		} catch (Exception e) {
			logger.error("Error en el servicio Axisprf011Service - m�todo m_ajax_busqueda_subtipos", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	private List buscaSubtipos(HttpServletRequest request) throws Exception {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();

		BigDecimal pSPROFES = this.getCampoNumerico(request, "SPROFES");
		BigDecimal pCTIPPRO = this.getCampoNumerico(request, "CTIPPRO");

		PAC_IAX_PROF pac_iax_prof = new PAC_IAX_PROF((java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

		Map map = pac_iax_prof.ejecutaPAC_IAX_PROF__F_GET_CSUBPROF(pSPROFES, pCTIPPRO);
		logger.debug("++++map subtipos profesional " + map);
		List listaSubtipos = (List) ajax.rellenarPlAContenedorAjax(map);

		return listaSubtipos;
	}

	private void cargarListas(HttpServletRequest request) throws Exception {
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		PAC_IAX_PROF pac_iax_prof = new PAC_IAX_PROF((java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

		BigDecimal psprofes = this.getCampoNumerico(request, "pCodiProf");
		Map map = pac_iax_prof.ejecutaPAC_IAX_PROF__F_GET_CTIPPROF(psprofes);
		logger.debug("++++map tipos profesional " + map);
		List TIPOSPROF = (List) tratarRETURNyMENSAJES(request, map, false);
		formdata.put("TIPOSPROF", TIPOSPROF);

		map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_LISTVALORES__F_GET_PRODUCTOS(getCampoTextual(request, "tipo"), null, null);
		logger.debug("++++map productos " + map);
		List PRODUCTOS = (List) tratarRETURNyMENSAJES(request, map, false);
		formdata.put("PRODUCTOS", PRODUCTOS);
	}

}
