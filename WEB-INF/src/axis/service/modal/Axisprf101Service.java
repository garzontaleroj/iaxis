package axis.service.modal;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_GESTIONES;
import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.jdbc.PAC_IAX_PROF;
import axis.mvc.control.modal.Axisprf101Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AjaxContainerService;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

public class Axisprf101Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	public void m_init(HttpServletRequest request, Axisprf101Action thisAction) {
		try {
		} catch (Exception e) {
			thisAction.guardarMensaje(request, "1000060", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}

	public void m_form(HttpServletRequest request, Axisprf101Action thisAction) {
		logger.debug("Axisprf101Service m_form");
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {
			PAC_IAX_LISTVALORES pac_iax_listvalores = new PAC_IAX_LISTVALORES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			PAC_IAX_GESTIONES pac_iax_gestiones = new PAC_IAX_GESTIONES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			PAC_IAX_PROF pac_iax_prof = new PAC_IAX_PROF(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			BigDecimal SPROFES = new BigDecimal(request.getParameter("pSPROFES"));

			Map map = pac_iax_gestiones.ejecutaPAC_IAX_GESTIONES__F_GET_LSTSEDES(SPROFES);
			logger.debug("++++SEDES: " + map);
			List SEDES = (List) tratarRETURNyMENSAJES(request, map, false);
			formdata.put("SEDES", SEDES);

			map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(730));
			logger.debug("++++NIVEL: " + map);
			List NIVEL = (List) tratarRETURNyMENSAJES(request, map, false);
			formdata.put("NIVEL", NIVEL);

			map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(731));
			logger.debug("++++PRIORIDAD: " + map);
			List PRIORIDAD = (List) tratarRETURNyMENSAJES(request, map, false);
			formdata.put("PRIORIDAD", PRIORIDAD);

			map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(737));
			logger.debug(map);
			List VALORES = (List) tratarRETURNyMENSAJES(request, map, false);
			formdata.put("VALORES", VALORES);

			map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(738));
			logger.debug(map);
			List TIPO = (List) tratarRETURNyMENSAJES(request, map, false);
			formdata.put("TIPO", TIPO);

			map = pac_iax_prof.ejecutaPAC_IAX_PROF__F_LSTTERMINOS();
			logger.debug(map);
			List TERMINO = (List) tratarRETURNyMENSAJES(request, map, false);
			formdata.put("TERMINO", TERMINO);

			formdata.put("SPROFES", SPROFES);

			String MODO = this.getCampoTextual(request, "MODO");

			if (request.getParameter("SCONVEN") != null) {
				BigDecimal SCONVEN = new BigDecimal(request.getParameter("SCONVEN"));
				logger.debug("++++SCONVEN: " + SCONVEN);
				formdata.put("SCONVEN", SCONVEN);

				if (MODO != null && MODO.equals("modificar")) {
					map = pac_iax_prof.ejecutaPAC_IAX_PROF__F_GET_CONVENIO(SCONVEN);
					logger.debug("++++CONVENIO: " + map);
					formdata.put("OBIAXCONVEN", map.get("CONVENIO"));
				}
			}

		} catch (Exception e) {
			logger.error("Error en el servicio axisprf101Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000060", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}

	public void guardar(HttpServletRequest request, Axisprf101Action thisAction) {
		logger.debug("Axisprf101Service guardar");
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);

		try {
			BigDecimal pSCONVEN = this.getCampoNumerico(request, "pSCONVEN");
			BigDecimal pSPROFES = this.getCampoNumerico(request, "pSPROFES");
			BigDecimal pSPERSED = this.getCampoNumerico(request, "SPERSED");
			BigDecimal pSTARIFA = this.getCampoNumerico(request, "STARIFA");
			String pTDESCRI = this.getCampoTextual(request, "TDESCRI");
			BigDecimal pNCOMPLE = this.getCampoNumerico(request, "NCOMPLE");
			BigDecimal pNPRIORM = this.getCampoNumerico(request, "NPRIORM");
			BigDecimal pCVALOR = this.getCampoNumerico(request, "CVALOR");
			BigDecimal pCTIPO = this.getCampoNumerico(request, "CTIPO");
			BigDecimal pNIMPORTE = null;
			BigDecimal pNPORCENT = null;
			if (pCTIPO != null) {
				if (pCTIPO.equals(new BigDecimal(1))) {
					pNIMPORTE = this.getCampoNumerico(request, "NIMPORTE");
				} else if (pCTIPO.equals(new BigDecimal(2))) {
					pNPORCENT = this.getCampoNumerico(request, "NPORCENT");
				}
			}

			String pTERMINO = this.getCampoTextual(request, "TERMINO");

			PAC_IAX_PROF pac_iax_prof = new PAC_IAX_PROF(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			Map map = pac_iax_prof.ejecutaPAC_IAX_PROF__F_SET_CONVENIO(pSCONVEN, pSPROFES, pSTARIFA, pSPERSED, pNCOMPLE,
					pNPRIORM, pTDESCRI, pCVALOR, pCTIPO, pNIMPORTE, pNPORCENT, pTERMINO);

			if (((BigDecimal) tratarRETURNyMENSAJES(request, map)).intValue() == 0) {
				formdata.put("guardat", "0");
				formdata.put("SPROFES", pSPROFES);
			} else {
				formdata.put("guardat", "1");
				cargarListas(request);
			}

			logger.debug("$$$$$$$$$$$$ fin guardar convenio pac_iax_prof: " + map);
		} catch (Exception e) {
			logger.error("Error en el servicio axisprf101Service - m�todo guardar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));

	}

	private void cargarListas(HttpServletRequest request) throws Exception {
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);

		PAC_IAX_LISTVALORES pac_iax_listvalores = new PAC_IAX_LISTVALORES(
				(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

		Map map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(742));
		logger.debug(map);
		List ESTADOSCONVENIO = (List) tratarRETURNyMENSAJES(request, map, false);
		formdata.put("ESTADOSCONVENIO", ESTADOSCONVENIO);
	}

	public void m_ajax_buscar_tarifa(HttpServletRequest request) {
		logger.debug("Axisprf101Service m_ajax_buscar_tarifa");
		AjaxContainerService ajax = new AjaxContainerService();

		try {
			ajax.guardarContenidoFinalAContenedorAjax(this.buscaTarifa(request));
		} catch (Exception e) {
			logger.error("Error en el servicio Axisprf101Service - m�todo m_ajax_buscar_tarifa", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	private List buscaTarifa(HttpServletRequest request) throws Exception {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		AjaxContainerService ajax = new AjaxContainerService();

		PAC_IAX_PROF pac_iax_prof = new PAC_IAX_PROF((java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

		BigDecimal STARIFA = getCampoNumerico(request, "STARIFA");
		logger.debug("---------- VALOR tarifa  :" + STARIFA);

		Map map = pac_iax_prof.ejecutaPAC_IAX_PROF__F_GET_TDESCRI_TARIFA(STARIFA);
		logger.debug("++++map starifa " + map);

		List listaTarifa = (List) ajax.rellenarPlAContenedorAjax(map);

		logger.debug("++++TARIFA " + listaTarifa);
		return listaTarifa;
	}

}
