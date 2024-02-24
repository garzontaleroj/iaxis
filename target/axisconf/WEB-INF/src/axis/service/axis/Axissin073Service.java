//Revision:# SCTYitL4gg1zIhdep2zTyQ== #
package axis.service.axis;

import java.math.BigDecimal;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_PARAM;
import axis.jdbc.PAC_IAX_PERSONA;
import axis.jdbc.PAC_IAX_SINIESTROS;
import axis.jdbc.PAC_IAX_SIN_IMP_SAP;
import axis.mvc.control.axis.Axissin073Action;
import axis.mvc.model.UsuarioBean;
import axis.util.Constantes;

public class Axissin073Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	public void m_init(HttpServletRequest request, Axissin073Action thisAction) {
		logger.debug("Axissin073Service m_init");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		this.m_form(request, thisAction);
	}

	public void m_form(HttpServletRequest request, Axissin073Action thisAction) {
		logger.debug("Axissin073Service m_form");

		logger.error("entre m_form Axissin073Service");
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);

		try {
			String PNSINIES = getCampoTextual(request, "NSINIES");
			if (PNSINIES != null) {
				this.cargaListasTramitaciones(request);
			}

			BigDecimal CCODIMP = new BigDecimal("1");

			Map m1 = new PAC_IAX_SIN_IMP_SAP((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_SIN_IMP_SAP__F_GET_TIPOS_INDICADOR(CCODIMP, new BigDecimal(3));

			logger.debug("ejecutaPAC_IAX_SIN_IMP_SAP__F_GET_INDICADOR_PROF devuelve:" + m1);
			List lstPIVA = (List<Map>) tratarRETURNyMENSAJES(request, m1);
			if (lstPIVA == null) {
				formdata.put("ERROR_IMPUESTOS", new BigDecimal(1));
			} else {
				formdata.put("lstPIVA", lstPIVA);
			}
			PAC_IAX_SIN_IMP_SAP pac_axis_sin_impuestos = new PAC_IAX_SIN_IMP_SAP(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map map = pac_axis_sin_impuestos.ejecutaPAC_IAX_SIN_IMP_SAP__F_GET_CONCEP_PAGO();
			logger.debug("++++ CONCEPTO:" + map);
			formdata.put("LSTCCONPAG", tratarRETURNyMENSAJES(request, map));

		} catch (Exception e) {
			logger.error("Error en el servicio Axissin073Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	public void cargaListasTramitaciones(HttpServletRequest request) throws Exception {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		PAC_IAX_SIN_IMP_SAP pac_axis_sin_imp_sap = new PAC_IAX_SIN_IMP_SAP(
				(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

		String PNSINIES = getCampoTextual(request, "NSINIES");

		HashMap mapTramitaciones = null;
		HashMap mapReservas = null;

		mapTramitaciones = new PAC_IAX_SINIESTROS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_SINIESTROS__F_GET_TRAMITACIONES(PNSINIES);

		mapReservas = new PAC_IAX_SINIESTROS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_SINIESTROS__F_GET_RESERVAS(PNSINIES);

		List listaTramites = (List) tratarRETURNyMENSAJES(request, mapTramitaciones);
		List listaReservas = (List) tratarRETURNyMENSAJES(request, mapReservas);

		request.getSession().setAttribute("listaTramites", listaTramites);
		request.getSession().setAttribute("listaReservas", listaReservas);
		request.getSession().setAttribute("NSINIES", PNSINIES);

		Map paramEmpresaMap = new PAC_IAX_PARAM((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_PARAM__F_PAREMPRESA_T("SIN_AERO_NNUMIDE_AV", usuario.getCempres());
		tratarRETURNyMENSAJES(request, paramEmpresaMap);
		String nnumideAero = (String) paramEmpresaMap.get("RETURN");

		String[] arreglo = nnumideAero.split(";");

		String NNUMIDE_AERO = arreglo[0];
		String NOMBRE_AERO = arreglo[1];

		if (NNUMIDE_AERO != null) {

			Map m = (Map) this.ActualizaPersona(request, NNUMIDE_AERO);

			List agencia = (List) tratarRETURNyMENSAJES(request, m);

			if (agencia != null) {
				Map magencia = (Map) agencia.get(0);
				formdata.put("SPERSON_AERO", magencia.get("CODI"));
				formdata.put("NNUMIDE_AERO", NNUMIDE_AERO);
				formdata.put("NOMBRE_AERO", NOMBRE_AERO);
			}

		}

		BigDecimal CCODIMP = new BigDecimal("1");

		Map m1 = new PAC_IAX_SIN_IMP_SAP((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_SIN_IMP_SAP__F_GET_TIPOS_INDICADOR(CCODIMP, new BigDecimal(3));

		logger.debug("ejecutaPAC_IAX_SIN_IMP_SAP__F_GET_INDICADOR_PROF devuelve:" + m1);
		List lstPIVA = (List<Map>) tratarRETURNyMENSAJES(request, m1);
		if (lstPIVA == null) {
			formdata.put("ERROR_IMPUESTOS", new BigDecimal(1));
		} else {
			formdata.put("lstPIVA", lstPIVA);
		}
		PAC_IAX_SIN_IMP_SAP pac_axis_sin_impuestos = new PAC_IAX_SIN_IMP_SAP(
				(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
		Map map = pac_axis_sin_impuestos.ejecutaPAC_IAX_SIN_IMP_SAP__F_GET_CONCEP_PAGO();
		logger.debug("++++ CONCEPTO:" + map);
		formdata.put("LSTCCONPAG", tratarRETURNyMENSAJES(request, map));

		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	public void ajax_documentos(HttpServletRequest request, Axissin073Action thisAction) {
		logger.debug("Axissin073Service ajax_documentos");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {
			BigDecimal selectedPerson = this.getCampoNumerico(request, "selectedPerson");
			BigDecimal selectedAgente = this.getCampoNumerico(request, "selectedAgente");

			PAC_IAX_PERSONA pac_axis_persona = new PAC_IAX_PERSONA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			if (!isEmpty(selectedPerson)) {

				Map map = pac_axis_persona.ejecutaPAC_IAX_PERSONA__F_GET_PERSONA(selectedPerson, selectedAgente);
				logger.debug(map);
				ajax.rellenarPlAContenedorAjax(map);
				ajax.guardarContenidoFinalAContenedorAjax(map);

			} else {
				ajax.guardarContenidoFinalAContenedorAjax(Constantes.OPERACION_AJAX_ERROR);
			}
		} catch (Exception e) {
			logger.error("Error en el servicio Axisfic002Service - m�todo m_ajax_ciiu", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	public void crear_pagos(HttpServletRequest request) {
		logger.debug("Axissin073Service crear_pagos");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {

			String NSINIES = getCampoTextual(request, "NSINIES");
			BigDecimal NTRAMIT = getCampoNumerico(request, "radioSelectTramit");
			String RESERVA = getCampoTextual(request, "radioSelectReserva");
			String[] arreglo = RESERVA.split(";");
			BigDecimal NMOVRES = new BigDecimal(arreglo[0]);
			BigDecimal CTIPRES = new BigDecimal(arreglo[1]);
			BigDecimal CGARANT = new BigDecimal(arreglo[2]);
			String CMONRES = arreglo[3];
			BigDecimal CTIPGAS = new BigDecimal("2");
			String NNUMIDE_AGENCIA = getCampoTextual(request, "NNUMIDE_AGENCIA");
			BigDecimal SPERSON_AGENCIA = getCampoNumerico(request, "SPERSON_AGENCIA");
			String NNUMIDE_AERO = getCampoTextual(request, "NNUMIDE_AGENCIA");
			BigDecimal SPERSON_AERO = getCampoNumerico(request, "SPERSON_AERO");
			String NFACREF = getCampoTextual(request, "NFACREF");

			SimpleDateFormat formatoDelTexto = new SimpleDateFormat("dd/MM/yyyy");
			String strFecha = getCampoTextual(request, "FFACREF");
			java.util.Date FFACREF1 = formatoDelTexto.parse(strFecha);
			Date FFACREF = new java.sql.Date(FFACREF1.getTime());
			BigDecimal CCONPAG = getCampoNumerico(request, "PCCONPAG");
			String TOBSERVA = getCampoTextual(request, "TSOBSERVA");
			BigDecimal ISINRET_AERO = getCampoNumerico(request, "ISINRET_AERO");
			BigDecimal PIVA_AERO = getCampoNumerico(request, "PIVA_AERO");
			if (PIVA_AERO == null) {
				PIVA_AERO = new BigDecimal("0");
			}
			BigDecimal IIVA_AERO = getCampoNumerico(request, "IIVA_AERO");
			BigDecimal IOTROSGAS_AERO = getCampoNumerico(request, "IOTROSGAS_AERO");
			BigDecimal INETO_AERO = getCampoNumerico(request, "INETO_AERO");
			BigDecimal ISINRET_AGENCIA = getCampoNumerico(request, "ISINRET_AGENCIA");
			BigDecimal PIVA_AGENCIA = getCampoNumerico(request, "PIVA_AGENCIA");
			if (PIVA_AGENCIA == null) {
				PIVA_AGENCIA = new BigDecimal("0");
			}
			BigDecimal IIVA_AGENCIA = getCampoNumerico(request, "IIVA_AGENCIA");
			BigDecimal INETO_AGENCIA = getCampoNumerico(request, "INETO_AGENCIA");

			PAC_IAX_SINIESTROS pac_iax_siniestros = new PAC_IAX_SINIESTROS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			Map map = pac_iax_siniestros.ejecutaPAC_IAX_SINIESTROS__F_PAGOS_AVION(NSINIES, NTRAMIT, NMOVRES, CTIPRES,
					CTIPGAS, CGARANT, CMONRES, NNUMIDE_AGENCIA, SPERSON_AGENCIA, NNUMIDE_AERO, SPERSON_AERO, NFACREF,
					FFACREF, TOBSERVA, ISINRET_AERO, PIVA_AERO, IIVA_AERO, IOTROSGAS_AERO, INETO_AERO, ISINRET_AGENCIA,
					PIVA_AGENCIA, IIVA_AGENCIA, INETO_AGENCIA, CCONPAG);

			tratarRETURNyMENSAJES(request, map);

			BigDecimal CCODIMP = new BigDecimal("1");

			Map m1 = new PAC_IAX_SIN_IMP_SAP((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_SIN_IMP_SAP__F_GET_TIPOS_INDICADOR(CCODIMP, new BigDecimal(3));

			logger.debug("ejecutaPAC_IAX_SIN_IMP_SAP__F_GET_INDICADOR_PROF devuelve:" + m1);
			List lstPIVA = (List<Map>) tratarRETURNyMENSAJES(request, m1);
			if (lstPIVA == null) {
				formdata.put("ERROR_IMPUESTOS", new BigDecimal(1));
			} else {
				formdata.put("lstPIVA", lstPIVA);
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axissin073Service - m�todo crear_pagos", e);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}

	public void m_ajax_actualizar_persona(HttpServletRequest request) {

		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		logger.debug("Axissin073Service m_ajax_actualizar_persona");
		AjaxContainerService ajax = new AjaxContainerService();

		try {

			if (formdata.get("paginar") == null) {

				String NNUMIDE = getCampoTextual(request, "NNUMIDE");
				Map m = (Map) this.ActualizaPersona(request, NNUMIDE);

				ajax.rellenarPlAContenedorAjax(m);
				ajax.guardarContenidoFinalAContenedorAjax(m);
			}
		} catch (Exception e) {
			logger.error("Error en el servicio Axissin073Service - m�todo m_ajax_actualizar_persona", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			this.formattingNumericValues(request);
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	private Map ActualizaPersona(HttpServletRequest request, String NNUMIDE) throws Exception {

		Map mapPersonas = new HashMap();

		if (!isEmpty(NNUMIDE)) {
			String MODO_SWPUBLI = "PERSONAS_PUBPRIV";

			mapPersonas = new PAC_IAX_PERSONA((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_PERSONA__F_GET_PERSONAS_GENERICA_COND(NNUMIDE, null, null, null, null, null, null,
							null, MODO_SWPUBLI, null);

			logger.debug("actualizar_personas:" + mapPersonas);

		}

		return mapPersonas;
	}

}