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

import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.jdbc.PAC_IAX_PROF;
import axis.jdbc.PAC_IAX_SIN_ANEXO;
import axis.mvc.control.axis.Axissin072Action;
import axis.mvc.model.UsuarioBean;
import axis.util.Constantes;

public class Axissin072Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	public void m_init(HttpServletRequest request, Axissin072Action thisAction) {
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

	public void m_form(HttpServletRequest request, Axissin072Action thisAction) {
		logger.debug("Axissin072Service m_form");

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
			logger.error("Error en el servicio Axissin072Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000060", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {

		}
	}

	public void guardar(HttpServletRequest request, Axissin072Action thisAction) {
		logger.debug("Axissin072Service guardar");
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map map = new HashMap();

		try {
			PAC_IAX_PROF pac_iax_prof = new PAC_IAX_PROF(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			BigDecimal pSPROFES = this.getCampoNumerico(request, "pCodiProf");
			// BigDecimal pCTIPPRO = this.getCampoNumerico(request, "CTIPPRO");
			// BigDecimal pCSUBPRO = this.getCampoNumerico(request, "CSUBPRO");
			BigDecimal pSPRODUC = this.getCampoNumerico(request, "SPRODUC");
			BigDecimal pCCAUSIN = this.getCampoNumerico(request, "CCAUSIN");
			Date pFDESDE = this.stringToSqlDate(this.getCampoTextual(request, "FDESDE"));
			Date pFHASTA = this.stringToSqlDate(this.getCampoTextual(request, "FHASTA"));

			String MODO = this.getCampoTextual(request, "MODO");

			if (MODO != null && MODO.equals("modificar")) {

			}

			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		} catch (Exception e) {
			logger.error("Error en el servicio Axissin072Service - m�todo guardar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
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

	public void m_busqueda_profesional(HttpServletRequest request, Axissin072Action thisAction) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);

		try {

			BigDecimal CPROFES = getCampoNumerico(request, "CPROFES");
			String NNUMIDE = getCampoTextual(request, "NNUMIDE");
			String SPROFES = getCampoTextual(request, "SPROFES");
			BigDecimal NSINIES = getCampoNumerico(request, "NSINIES");

			if (formdata.get("paginar") == null) {

				request.getSession().removeAttribute("Axissin072_listaProfesionales");
				PAC_IAX_SIN_ANEXO PAC_IAX_SIN_ANEXO = new PAC_IAX_SIN_ANEXO(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
				logger.error("prueba " + CPROFES);
				Map map = new HashMap();
				map = PAC_IAX_SIN_ANEXO.ejecutaPAC_IAX_SIN_ANEXO__F_GET_DATOS_SIN(CPROFES, NNUMIDE, SPROFES, NSINIES);

				logger.debug(map);

				request.getSession().setAttribute("axissin072_listaProfesionales",
						(ArrayList) tratarRETURNyMENSAJES(request, map, false));

				this.cargarListas(request);
			}
		} catch (Exception e) {
			logger.error("Error", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}

		this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
	}

	public void m_traspaso_profesional(HttpServletRequest request, Axissin072Action thisAction) {
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

	public void m_ajax_ver_profesional(HttpServletRequest request) {
		AjaxContainerService ajax = new AjaxContainerService();
		try {
			String CODI = getCampoTextual(request, "CODI");

			if (request.getSession().getAttribute("axisprf017_listaProfesionales") != null) {
				List listaProfesionales = (List) request.getSession().getAttribute("axisprf017_listaProfesionales");
				Map profesional = getObjetoDeLista(listaProfesionales, CODI, "SPROFES");

				if (!isEmpty(profesional)) {
					ajax.guardarContenidoFinalAContenedorAjax(profesional);
					request.getSession().setAttribute("axisctr_profesional", profesional);
				}
				listaProfesionales = null;
			}
		} catch (Exception e) {
			logger.error("Error", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

}
