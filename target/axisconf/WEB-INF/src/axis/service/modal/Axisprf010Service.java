package axis.service.modal;

import java.math.BigDecimal;
import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_PROF;
import axis.mvc.control.modal.Axisprf010Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AjaxContainerService;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

public class Axisprf010Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	public void m_init(HttpServletRequest request, Axisprf010Action thisAction) {
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

	public void m_form(HttpServletRequest request, Axisprf010Action thisAction) {
		logger.debug("Axisprf010Service m_form");
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		// Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		try {
			PAC_IAX_PROF pac_iax_prof = new PAC_IAX_PROF(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			BigDecimal psprofes = this.getCampoNumerico(request, "pCodiProf");
			Map map = pac_iax_prof.ejecutaPAC_IAX_PROF__F_GET_CTIPPROF_CARGA_REAL(psprofes);
			logger.debug("++++map tipos profesional " + map);
			List TIPOSPROF = (List) tratarRETURNyMENSAJES(request, map, false);
			formdata.put("TIPOSPROF", TIPOSPROF);

			String MODO = this.getCampoTextual(request, "MODO");

			if (MODO != null) {
				if (MODO.equalsIgnoreCase("modificar")) {

				}
			}

			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		} catch (Exception e) {
			logger.error("Error en el servicio Axisprf010Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000060", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {

		}
	}

	public void guardar(HttpServletRequest request, Axisprf010Action thisAction) {
		logger.debug("Axisprf010Service guardar");
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map map = new HashMap();

		try {
			PAC_IAX_PROF pac_iax_prof = new PAC_IAX_PROF(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			BigDecimal pSPROFES = this.getCampoNumerico(request, "pCodiProf");
			BigDecimal pCTIPPRO = this.getCampoNumerico(request, "CTIPPRO");
			BigDecimal pCSUBPRO = this.getCampoNumerico(request, "CSUBPRO");
			BigDecimal pNCAPACI = this.getCampoNumerico(request, "NCAPACI");
			BigDecimal pNCARDIA = this.getCampoNumerico(request, "NCARDIA");
			BigDecimal pNCARSEM = this.getCampoNumerico(request, "NCARSEM");
			Date pFDESDE = this.stringToSqlDate(this.getCampoTextual(request, "FDESDE"));
			String MODO = this.getCampoTextual(request, "MODO");

			if (MODO != null && MODO.equals("modificar")) {

			} else {
				map = pac_iax_prof.ejecutaPAC_IAX_PROF__F_SET_CARGA_REAL(pSPROFES, pCTIPPRO, pCSUBPRO, pNCAPACI,
						pNCARDIA, pNCARSEM, pFDESDE);

				logger.debug("$$$$$$$$$$$$ fin pac_iax_prof: " + map);
			}

			if (((BigDecimal) tratarRETURNyMENSAJES(request, map)).intValue() == 0) {
				formdata.put("guardat", "0");
			} else {
				formdata.put("guardat", "1");
				map = pac_iax_prof.ejecutaPAC_IAX_PROF__F_GET_CTIPPROF(pSPROFES);
				logger.debug("++++map tipos profesional " + map);
				List TIPOSPROF = (List) tratarRETURNyMENSAJES(request, map, false);
				formdata.put("TIPOSPROF", TIPOSPROF);

				map = pac_iax_prof.ejecutaPAC_IAX_PROF__F_GET_CSUBPROF_CARGA_REAL(pSPROFES, pCTIPPRO);
				logger.debug("++++map subtipos profesional " + map);
				List SUBTIPOSPROF = (List) tratarRETURNyMENSAJES(request, map, false);
				formdata.put("SUBTIPOSPROF", SUBTIPOSPROF);
			}

			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		} catch (Exception e) {
			logger.error("Error en el servicio Axisprf010Service - m�todo guardar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

	public void m_ajax_busqueda_subtipos(HttpServletRequest request) {
		logger.debug("Axisprf010Service m_ajax_busqueda_subtipos");
		AjaxContainerService ajax = new AjaxContainerService();
		try {
			ajax.guardarContenidoFinalAContenedorAjax(this.buscaSubtipos(request));
		} catch (Exception e) {
			logger.error("Error en el servicio Axisprf010Service - m�todo m_ajax_busqueda_subtipos", e);
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

		Map map = pac_iax_prof.ejecutaPAC_IAX_PROF__F_GET_CSUBPROF_CARGA_REAL(pSPROFES, pCTIPPRO);
		logger.debug("++++map subtipos profesional " + map);
		List listaSubtipos = (List) ajax.rellenarPlAContenedorAjax(map);

		return listaSubtipos;
	}

	public void m_ajax_busqueda_cargaDiaSem(HttpServletRequest request) {
		logger.debug("Axisprf010Service m_ajax_busqueda_cargaDiaSem");
		AjaxContainerService ajax = new AjaxContainerService();
		try {
			ajax.guardarContenidoFinalAContenedorAjax(this.buscaCargaDiaSem(request));
		} catch (Exception e) {
			logger.error("Error en el servicio Axisprf010Service - m�todo m_ajax_busqueda_cargaDiaSem", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	private List buscaCargaDiaSem(HttpServletRequest request) throws Exception {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();

		BigDecimal pSPROFES = this.getCampoNumerico(request, "SPROFES");
		BigDecimal pCTIPPRO = this.getCampoNumerico(request, "CTIPPRO");
		BigDecimal pCSUBPRO = this.getCampoNumerico(request, "CSUBPRO");
		BigDecimal pNCAPACI = this.getCampoNumerico(request, "NCAPACI");
		Date pFDESDE = this.stringToSqlDate(this.getCampoTextual(request, "FDESDE"));

		PAC_IAX_PROF pac_iax_prof = new PAC_IAX_PROF((java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

		Map map = pac_iax_prof.ejecutaPAC_IAX_PROF__F_CALC_CARGA(pSPROFES, pCTIPPRO, pCSUBPRO, pNCAPACI, pFDESDE);
		logger.debug("++++map carga semanal diaria " + map);

		List listaCarga = (List) ajax.rellenarPlAContenedorAjax(map);

		return listaCarga;
	}
}
