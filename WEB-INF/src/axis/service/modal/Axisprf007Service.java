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
import axis.jdbc.PAC_IAX_PARAM;
import axis.jdbc.PAC_IAX_PROF;
import axis.mvc.control.modal.Axisprf007Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AjaxContainerService;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

public class Axisprf007Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	public void m_init(HttpServletRequest request, Axisprf007Action thisAction) {
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

	public void m_form(HttpServletRequest request, Axisprf007Action thisAction) {
		logger.debug("Axisprf007Service m_form");
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		// Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		try {
			PAC_IAX_LISTVALORES pac_iax_listvalores = new PAC_IAX_LISTVALORES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(728));
			logger.debug(map);

			List TIPOSZONA = (List) tratarRETURNyMENSAJES(request, map, false);
			formdata.put("TIPOSZONA", TIPOSZONA);

			map = new PAC_IAX_PARAM((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_PARAM__F_PARINSTALACION_NN("PAIS_DEF");
			BigDecimal pais = (BigDecimal) map.get("RETURN");

			map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES__F_GET_CONSULTA("LISTA_PROVINCIA", pais.toString() + "|");
			logger.debug("---- provincias:" + map);
			List PROVINCIAS = (List) tratarRETURNyMENSAJES(request, map, false);
			formdata.put("PROVINCIAS", PROVINCIAS);

			String MODO = this.getCampoTextual(request, "MODO");

			if (MODO != null) {
				if (MODO.equalsIgnoreCase("modificar")) {
					BigDecimal pPsprofes = this.getCampoNumerico(request, "pCodiProf");
					BigDecimal pCTPZONA = this.getCampoNumerico(request, "CTPZONA");
					BigDecimal pCNORDZN = this.getCampoNumerico(request, "CNORDZN");
					BigDecimal pCPROVIN = this.getCampoNumerico(request, "CPROVIN");
					if (pCPROVIN.equals(new BigDecimal(0))) {
						pCPROVIN = new BigDecimal(-1);
					}
					BigDecimal pCPOBLAC = this.getCampoNumerico(request, "CPOBLAC");
					String pCPOSINI = this.getCampoTextual(request, "CPOSINI");
					String pCPOSFIN = this.getCampoTextual(request, "CPOSFIN");

					if (this.getCampoTextual(request, "FDESDE") != null) {
						Date pFDESDE = Date.valueOf(this.getCampoTextual(request, "FDESDE").substring(0, 10));
						logger.debug("FDESDE" + pFDESDE);
						formdata.put("FDESDE", pFDESDE);
					}
					if (this.getCampoTextual(request, "FHASTA") != null) {
						Date pFHASTA = Date.valueOf(this.getCampoTextual(request, "FHASTA").substring(0, 10));
						logger.debug("FHASTA" + pFHASTA);
						formdata.put("FHASTA", pFHASTA);
					}

					logger.debug("pCodiProf" + pPsprofes);
					logger.debug("CTPZONA" + pCTPZONA);
					logger.debug("CPROVIN" + pCPROVIN);
					logger.debug("CPOBLAC" + pCPOBLAC);
					logger.debug("CPOSINI" + pCPOSINI);
					logger.debug("CPOSFIN" + pCPOSFIN);
					logger.debug("pCNORDZN" + pCNORDZN);

					formdata.put("pCodiProf", pPsprofes);
					formdata.put("CTPZONA", pCTPZONA);
					formdata.put("CPROVIN", pCPROVIN);
					formdata.put("CPOBLAC", pCPOBLAC);
					formdata.put("CPOSINI", pCPOSINI);
					formdata.put("CPOSFIN", pCPOSFIN);
					formdata.put("CNORDZN", pCNORDZN);

					formdata.put("MODO", MODO);

					if (pCPROVIN != null) {
						map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
								.ejecutaPAC_IAX_LISTVALORES__F_GET_CONSULTA("LISTA_POBLACION", pCPROVIN + "|||");
						logger.debug("---- poblaciones:" + map);
						List POBLACIONES = (List) tratarRETURNyMENSAJES(request, map, false);
						formdata.put("POBLACIONES", POBLACIONES);
					}
				}
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisprf007Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000060", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}

	public void guardar(HttpServletRequest request, Axisprf007Action thisAction) {
		logger.debug("Axisprf007Service guardar");
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		// Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map map;

		try {
			BigDecimal pPsprofes = this.getCampoNumerico(request, "pCodiProf");
			BigDecimal pCTPZONA = this.getCampoNumerico(request, "CTPZONA");
			BigDecimal pCPROVIN = this.getCampoNumerico(request, "CPROVIN");
			BigDecimal pCPOBLAC = this.getCampoNumerico(request, "CPOBLAC");
			BigDecimal pCNORDZN = this.getCampoNumerico(request, "CNORDZN");
			String pCPOSINI = this.getCampoTextual(request, "CPOSINI");
			String pCPOSFIN = this.getCampoTextual(request, "CPOSFIN");
			Date pFDESDE = this.stringToSqlDate(this.getCampoTextual(request, "FDESDE"));
			Date pFHASTA = this.stringToSqlDate(this.getCampoTextual(request, "FHASTA"));
			Map mpais = new PAC_IAX_PARAM((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_PARAM__F_PARINSTALACION_NN("PAIS_DEF");
			BigDecimal pais = (BigDecimal) mpais.get("RETURN");
			String MODO = this.getCampoTextual(request, "MODO");

			if (MODO != null && MODO.equals("modificar")) {
				map = new PAC_IAX_PROF((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_PROF__F_MOD_ZONA(pPsprofes, pCNORDZN, (Date) pFHASTA);
			} else {
				map = new PAC_IAX_PROF((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_PROF__F_SET_ZONA(pPsprofes, pCTPZONA, pais, pCPROVIN, pCPOBLAC, pCPOSINI,
								pCPOSFIN, (Date) pFDESDE, (Date) pFHASTA);
			}

			if (((BigDecimal) tratarRETURNyMENSAJES(request, map)).intValue() == 0) {
				formdata.put("guardat", "0");
			} else {
				formdata.put("guardat", "1");
				cargarListas(request);
			}

			logger.debug("$$$$$$$$$$$$ fin pac_iax_prof: " + map);
		} catch (Exception e) {
			logger.error("Error en el servicio Axisprf007Service - m�todo guardar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));

	}

	private void cargarListas(HttpServletRequest request) throws Exception {
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);

		PAC_IAX_LISTVALORES pac_iax_listvalores = new PAC_IAX_LISTVALORES(
				(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
		Map map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(728));
		logger.debug(map);

		List TIPOSZONA = (List) tratarRETURNyMENSAJES(request, map, false);
		formdata.put("TIPOSZONA", TIPOSZONA);

		map = new PAC_IAX_PARAM((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_PARAM__F_PARINSTALACION_NN("PAIS_DEF");
		BigDecimal pais = (BigDecimal) map.get("RETURN");

		map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_LISTVALORES__F_GET_CONSULTA("LISTA_PROVINCIA", pais.toString() + "|");
		logger.debug("---- provincias:" + map);
		List PROVINCIAS = (List) tratarRETURNyMENSAJES(request, map, false);
		formdata.put("PROVINCIAS", PROVINCIAS);

		BigDecimal pCPROVIN = this.getCampoNumerico(request, "CPROVIN");
		if (pCPROVIN != null) {
			map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES__F_GET_CONSULTA("LISTA_POBLACION", pCPROVIN + "|||");
			logger.debug("---- poblaciones:" + map);
			List POBLACIONES = (List) tratarRETURNyMENSAJES(request, map, false);
			formdata.put("POBLACIONES", POBLACIONES);
		}
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
