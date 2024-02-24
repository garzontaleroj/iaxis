//Revision:# 6Lg1fjFFTc1A4ehrVi6c5A== #
package axis.service.modal;

import java.math.BigDecimal;
import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.jdbc.PAC_IAX_PARAM;
import axis.jdbc.PAC_IAX_PROF;
import axis.mvc.control.modal.Axisprf000Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AjaxContainerService;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

public class Axisprf000Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	public void m_init(HttpServletRequest request, Axisprf000Action thisAction) {
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

	public void m_form(HttpServletRequest request, Axisprf000Action thisAction) {
		logger.debug("Axisprf000Service m_form");
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		// Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		try {
			this.cargarListas(request);

			String MODO = this.getCampoTextual(request, "MODO");
			formdata.put("MODO", MODO);

			String pantalla = this.getCampoTextual(request, "pantalla");
			logger.debug("++++pantalla" + pantalla);
			formdata.put("pantalla", pantalla);

			if (MODO != null) {
				if (MODO.equalsIgnoreCase("modificar")) {

				}
			}

			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		} catch (Exception e) {
			logger.error("Error en el servicio Axisprf000Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000060", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {

		}
	}

	public void guardar(HttpServletRequest request, Axisprf000Action thisAction) {
		logger.debug("Axisprf000Service guardar");
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

			} else {
				map = pac_iax_prof.ejecutaPAC_IAX_PROF__F_SET_ROL(pSPROFES, pCTIPPRO, pCSUBPRO);

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
			logger.error("Error en el servicio Axisprf000Service - m�todo guardar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

	public void m_ajax_busqueda_subtipos(HttpServletRequest request) {
		logger.debug("Axisprf000Service m_ajax_busqueda_subtipos");
		AjaxContainerService ajax = new AjaxContainerService();
		try {
			ajax.guardarContenidoFinalAContenedorAjax(this.buscaSubtipos(request));
		} catch (Exception e) {
			logger.error("Error en el servicio Axisprf000Service - m�todo m_ajax_busqueda_subtipos", e);
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
		PAC_IAX_LISTVALORES pac_iax_listvalores = new PAC_IAX_LISTVALORES(
				(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

		Map map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(724));
		logger.debug("++++map tipos profesional " + map);
		List TIPOSPROF = (List) tratarRETURNyMENSAJES(request, map, false);
		formdata.put("TIPOSPROF", TIPOSPROF);

		map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(725));
		logger.debug("++++map subtipos profesional " + map);
		List TIPOSSUBPROF = (List) tratarRETURNyMENSAJES(request, map, false);
		formdata.put("TIPOSSUBPROF", TIPOSSUBPROF);

		// Tipo de persona
		map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_TIPPERSON();
		logger.debug(map);
		formdata.put("tipPerson", (List) tratarRETURNyMENSAJES(request, map));

		// Tipo de documento
		BigDecimal CTIPPER = getCampoNumerico(request, "TIDENTIcerca");
		if (isEmpty(CTIPPER))
			CTIPPER = getCampoNumerico(request, "CTIPPER");
		if (isEmpty(CTIPPER))
			CTIPPER = new BigDecimal(1);
		map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_TIPDOCUM_TIPPER(CTIPPER);
		logger.debug(map);
		formdata.put("tipDocum", (List) tratarRETURNyMENSAJES(request, map));
		map = new PAC_IAX_PARAM((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_PARAM__F_PARINSTALACION_NN("PAIS_DEF");
		BigDecimal pais = (BigDecimal) map.get("RETURN");
		map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_LISTVALORES__F_GET_CONSULTA("LISTA_PROVINCIA", pais.toString() + "|");
		logger.debug("---- provincias:" + map);
		List PROVINCIAS = (List) tratarRETURNyMENSAJES(request, map, false);
		formdata.put("PROVINCIAS", PROVINCIAS);
	}

	public void m_ajax_busqueda_sprofes(HttpServletRequest request) {
		logger.debug("Axisprf000Service m_ajax_busqueda_sprofes");
		AjaxContainerService ajax = new AjaxContainerService();
		try {
			ajax.guardarContenidoFinalAContenedorAjax(this.buscaSprofes(request));
		} catch (Exception e) {
			logger.error("Error en el servicio Axisprf000Service - m�todo m_ajax_busqueda_sprofes", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	private List buscaSprofes(HttpServletRequest request) throws Exception {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		AjaxContainerService ajax = new AjaxContainerService();

		PAC_IAX_PROF pac_iax_prof = new PAC_IAX_PROF((java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

		Map map = pac_iax_prof.ejecutaPAC_IAX_PROF__F_GET_SPROFES();
		logger.debug("++++map sprofes " + map);

		List listaSprofes = (List) ajax.rellenarPlAContenedorAjax(map);
		String sprofes = listaSprofes.get(0).toString().replace('{', ' ');
		sprofes = listaSprofes.get(0).toString().replace('}', ' ');
		formdata.put("SPROFES", sprofes.substring(9));
		logger.debug("++++SPROFES " + sprofes.substring(9));
		return listaSprofes;
	}

	public void m_busqueda_profesional(HttpServletRequest request, Axisprf000Action thisAction) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);

		try {

			BigDecimal pSPROFES = getCampoNumerico(request, "pSPROFES");
			BigDecimal pCTIPPER = getCampoNumerico(request, "CTIPPER");
			BigDecimal pCTIPIDE = getCampoNumerico(request, "CTIPIDE");
			String pNNUMIDE = getCampoTextual(request, "NNUMIDE");
			String pTNOMBRE = getCampoTextual(request, "TNOMBRE");
			BigDecimal pCTIPPRO = getCampoNumerico(request, "CTIPPRO");
			BigDecimal pCSUBPRO = getCampoNumerico(request, "CSUBPRO");
			BigDecimal PCPROVIN = getCampoNumerico(request, "CPROVIN");
			BigDecimal PCPOBLAC = getCampoNumerico(request, "CPOBLAC");

			if (formdata.get("paginar") == null) {
				request.getSession().removeAttribute("Axisprf000_listaProfesionales");
				PAC_IAX_PROF PAC_IAX_PROF = new PAC_IAX_PROF(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

				Map map = new HashMap();

				map = PAC_IAX_PROF.ejecutaPAC_IAX_PROF__F_GET_PROFESIONALES(pCTIPIDE, pNNUMIDE, pTNOMBRE, pCTIPPRO,
						pCSUBPRO, pSPROFES, PCPROVIN, PCPOBLAC);

				logger.debug(map);

				request.getSession().setAttribute("axisprf000_listaProfesionales",
						(ArrayList) tratarRETURNyMENSAJES(request, map, false));

				this.cargarListas(request);
			}
		} catch (Exception e) {
			logger.error("Error", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}

		this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
	}

	public void m_traspaso_profesional(HttpServletRequest request, Axisprf000Action thisAction) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);

		try {
			// Recuperar profesional a buscar
			BigDecimal SPROFES = getCampoNumerico(request, "SPROFES");

			request.setAttribute("SPROFES_OUT", SPROFES);
		} catch (Exception e) {
			logger.error("Error", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
	}

	public void m_ajax_cargarPoblaciones(HttpServletRequest request) {
		logger.debug("Axisprf007Service m_ajax_cargarPoblaciones");
		AjaxContainerService ajax = new AjaxContainerService();
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		try {

			String CPROVIN = this.getCampoTextual(request, "CPROVIN");
			logger.debug(CPROVIN);

			Map map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES__F_GET_CONSULTA("LISTA_POBLACION", CPROVIN + "|||");
			logger.debug(map);
			ajax.guardarContenidoFinalAContenedorAjax((List) tratarRETURNyMENSAJES(request, map, false));
		} catch (Exception e) {
			logger.error("Error en el servicio Axisprf007Service - m�todo m_ajax_cargarPoblaciones", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}
}
