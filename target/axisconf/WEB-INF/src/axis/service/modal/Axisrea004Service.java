//Revision:# 2kIwK4PUOtygk5rlrGajDw== #
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
import axis.jdbc.PAC_IAX_LISTVALORES_REA;
import axis.jdbc.PAC_IAX_REA;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.control.modal.Axisrea004Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AjaxContainerService;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

public class Axisrea004Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	/*********************************************************************************************************************/
	/************************************************
	 * M�TODOS DE INICIALIZACI�N
	 *******************************************/
	/*********************************************************************************************************************/

	/**
	 * Realiza la carga inicial de la pantalla.
	 * 
	 * @param request El HttpServletRequest que contiene la petici�n del cliente
	 *                web.
	 */
	public void m_form(HttpServletRequest request) {
		logger.debug("Axisrea004Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		formdata.put("deletedTramos", getCampoTextual(request, "deletedTramos"));
		// Desplegables
		try {

			PAC_IAX_REA pac_iax_rea = new PAC_IAX_REA((java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			Map map2 = pac_iax_rea.ejecutaPAC_IAX_REA__F_GET_OBJETO_TRAMOS();
			BigDecimal SCONTRA = getCampoNumerico(request, "SCONTRA");

			BigDecimal NVERSIO = getCampoNumerico(request, "NVERSIO");
			BigDecimal CTRAMO = getCampoNumerico(request, "CTRAMO");

			if (CTRAMO == null) {
				CTRAMO = getCampoNumerico(request, "CTRAMO_MOD");
			}

			/*
			 * Cargar valores del tramo que se consulta en caso de consulta CTRAMO != null
			 * (C�digo de tramo)
			 */
			if (CTRAMO != null && SCONTRA != null && NVERSIO != null) { // Se trata de una edici�n o de una recarga
																		// despu�s de 'GRABAR'

				formdata.put("SCONTRA", SCONTRA);
				formdata.put("NVERSIO", NVERSIO);
				formdata.put("CTRAMO", CTRAMO);
				HashMap detalle_tramo = pac_iax_rea.ejecutaPAC_IAX_REA__F_GET_DETTRAMO_REA(SCONTRA, NVERSIO, CTRAMO);
				Map datos_tramo = (Map) tratarRETURNyMENSAJES(request, detalle_tramo);

				// INI - AXIS 4085 - 24/5/2019 - AABG - SE PROCEDE A CONSULTAR EL DATO EN CREPOS
				// Y PASARLO AL FORMULARIO
				BigDecimal CREPOS = (BigDecimal) datos_tramo.get("CREPOS") != null
						? (BigDecimal) datos_tramo.get("CREPOS")
						: getCampoNumerico(request, "CREPOS");
				formdata.put("CREPOS", CREPOS);
				datos_tramo.remove("CREPOS");
				datos_tramo.put("CREPOS", CREPOS);
				// FIN - AXIS 4085 - 24/5/2019 - AABG - SE PROCEDE A CONSULTAR EL DATO EN CREPOS
				// Y PASARLO AL FORMULARIO

				if (!isEmpty(CREPOS)) {
					Map mapa_repos = pac_iax_rea.ejecutaPAC_IAX_REA__F_GET_REPOSICIONES(CREPOS, usuario.getCidioma());
					List datos_repos = (List) tratarRETURNyMENSAJES(request, mapa_repos);

					if (datos_repos != null) {
						Map maparesultado = (HashMap) datos_repos.get(0);
						formdata.put("REPODESCRIP", maparesultado.get("TDESCRIPCION"));
					}

				}

				formdata.remove("OB_IAX_TRAMO");
				formdata.put("OB_IAX_TRAMO", datos_tramo); // Cargamos en el formdata los datos recuperados de la
															// consulta
			}

			cargarValoresDesplegables(request, usuario, formdata);

		} catch (Exception e) {
			logger.error("Error en el m�todo Axisrea004Service.m_form", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}

	}

	/**
	 * Realiza una carga de BD de los valores est�ticos que contiene cada
	 * desplegable de la pantalla.
	 * 
	 * @param request    El HttpServletRequest que contiene la petici�n del cliente
	 *                   web.
	 * @param thisAction Una Action abstracta desde donde se ha invocado el servicio
	 *                   (necesaria para el log).
	 * @param usuario    El UsuarioBean activo.
	 * @param formdata   HashMap que contiene los valores de los request parameters.
	 * @throws Exception
	 */

	private void cargarValoresDesplegables(HttpServletRequest request, UsuarioBean usuario, Map formdata)
			throws Exception {
		// Carga de valores de los desplegables
		Map listValores = new HashMap();
		try {
			PAC_IAX_LISTVALORES pac_axis_listValores = new PAC_IAX_LISTVALORES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			PAC_IAX_LISTVALORES_REA pac_axis_listValores_rea = new PAC_IAX_LISTVALORES_REA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			// Lista tramos
			BigDecimal CVALOR_T = new BigDecimal(105);
			BigDecimal CVALOR_B = new BigDecimal(113);

			Map map_tramo = new PAC_IAX_LISTVALORES_REA((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES_REA__F_GET_TIPOSTRAMOS_NOPROP();
			List ListaTramos = (List) tratarRETURNyMENSAJES(request, map_tramo);
			formdata.put("ListaTramos", ListaTramos);
			ListaTramos = null;

			Map map_cprebor = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(CVALOR_B);
			List ListaPrebor = (List) tratarRETURNyMENSAJES(request, map_cprebor);
			formdata.put("ListaPrebor", ListaPrebor);
			formdata.put("ListaFPago", ListaPrebor); // Rellenamos tambi�n las formas de pago, para diferenciar origen
														// datos
			ListaPrebor = null;

			Map map_tipoprima = new PAC_IAX_LISTVALORES_REA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES_REA__F_GET_TIPOPRIMAXL();
			List ListaTipoprima = (List) tratarRETURNyMENSAJES(request, map_tipoprima);
			formdata.put("ListaTipoprima", ListaTipoprima);
			ListaTipoprima = null;

			Map map_aplictasa = new PAC_IAX_LISTVALORES_REA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES_REA__F_GET_APLICTASA();
			List ListAplicTasa = (List) tratarRETURNyMENSAJES(request, map_aplictasa);
			formdata.put("ListAplicTasa", ListAplicTasa);
			ListAplicTasa = null;

			Map map_tipotasa = new PAC_IAX_LISTVALORES_REA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES_REA__F_GET_TIPOTASA();
			List ListaTipotasa = (List) tratarRETURNyMENSAJES(request, map_tipotasa);
			formdata.put("ListaTipotasa", ListaTipotasa);
			ListaTipotasa = null;

			Map map_tasavariable = new PAC_IAX_LISTVALORES_REA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES_REA__F_GET_TRAMOSREA(new BigDecimal("3"));
			List ListaTasaVariable = (List) tratarRETURNyMENSAJES(request, map_tasavariable);
			formdata.put("ListaTasaVariable", ListaTasaVariable);
			ListaTasaVariable = null;

			Map map_reposiciones = new PAC_IAX_LISTVALORES_REA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES_REA__F_GET_REPOSICIONES();
			List ListaReposiciones = (List) tratarRETURNyMENSAJES(request, map_reposiciones);
			formdata.put("ListaReposiciones", ListaReposiciones);
			ListaReposiciones = null;

			Map map_loss = new PAC_IAX_LISTVALORES_REA((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES_REA__F_GET_TRAMOSREA(new BigDecimal("1"));
			List ListaLoss = (List) tratarRETURNyMENSAJES(request, map_loss);
			formdata.put("ListaLoss", ListaLoss);
			ListaLoss = null;

			Map map_capped = new PAC_IAX_LISTVALORES_REA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES_REA__F_GET_TRAMOSREA(new BigDecimal("2"));
			List ListaCapped = (List) tratarRETURNyMENSAJES(request, map_capped);
			formdata.put("ListaCapped", ListaCapped);
			ListaCapped = null;

			Map map_frec = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal("17"));
			List ListaFrecPago = (List) tratarRETURNyMENSAJES(request, map_frec);
			formdata.put("ListaFrecPago", ListaFrecPago);
			ListaFrecPago = null;

		} catch (Exception e) {
			logger.error("Error en el m�todo Axisrea004Service.cargarValoresDesplegables", e);
			AbstractDispatchAction.guardarMensaje(request, "1000050", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		} finally {
			formdata.put("listValores", listValores);
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));

		}
	}

	/*********************************************************************************************************************/
	/************************************************
	 * M�TODOS DE ACTUALIZACI�N
	 *******************************************/
	/*********************************************************************************************************************/

	/**
	 * M�todo para grabar los datos TRAMOS a objetos de bbdd
	 * 
	 * @param request    El HttpServletRequest que contiene la petici�n del cliente
	 *                   web.
	 * @param thisAction Una Action abstracta desde donde se ha invocado el servicio
	 *                   (necesaria para el log).
	 * @throws Exception
	 */

	public

			void m_grabar(HttpServletRequest request, Axisrea004Action thisAction) {
		logger.debug("Axisrea004Propervice m_ajax_guardar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {

			PAC_IAX_REA pac_axis_rea = new PAC_IAX_REA((java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			// Datos cabecera
			BigDecimal CTRAMO = getCampoNumerico(request, "CTRAMO");
			// Si CTRAMO es null, es porque el campo est� disable, entonces pillamos del
			// CTRAMO_MOD
			if (isEmpty(CTRAMO)) {
				logger.debug("entro if ctramo");
				CTRAMO = getCampoNumerico(request, "CTRAMO_MOD");
			}

			BigDecimal NORDEN = getCampoNumerico(request, "NORDEN");
			BigDecimal NVERSION = getCampoNumerico(request, "NVERSIO");
			BigDecimal SCONTRA = getCampoNumerico(request, "SCONTRA");

			// Campos (no promocional/promocional)
			BigDecimal ITOTTRA = getCampoNumerico(request, "ITOTTRA");
			BigDecimal IXLPRIO = getCampoNumerico(request, "IXLPRIO");// CONF 1048
			// BigDecimal IPRIO = getCampoNumerico(request, "IPRIO");//NUEVO CAMPO
			// IAXIS-4611 - BUG/IAXIS-14001 QUITAR CAMPO IPRIO YA QUE EL CAMPO PRIORIDAD YA
			// EXISTIA Y ES EL CAMPO IXLPRIO
			BigDecimal IDAA = getCampoNumerico(request, "IDAA");
			BigDecimal ILAA = getCampoNumerico(request, "ILAA");
			BigDecimal CTPRIMAXL = getCampoNumerico(request, "CTPRIMAXL");
			BigDecimal IPRIMAFIJAXL = getCampoNumerico(request, "IPRIMAFIJAXL");
			BigDecimal IPRIMAESTIMADA = getCampoNumerico(request, "IPRIMAESTIMADA");
			BigDecimal CAPLICTASAXL = getCampoNumerico(request, "CAPLICTASAXL");
			BigDecimal CTIPTASAXL = getCampoNumerico(request, "CTIPTASAXL");
			BigDecimal PTASAXL = getCampoNumerico(request, "PTASAXL");
			BigDecimal CTRAMOTASAXL = getCampoNumerico(request, "CTRAMOTASAXL");
			BigDecimal IDEPXL = getCampoNumerico(request, "IDEPXL");
			BigDecimal PCTPDXL = getCampoNumerico(request, "PCTPDXL");
			BigDecimal CFORPAGPDXL = getCampoNumerico(request, "CFORPAGPDXL");
			BigDecimal IMINXL = getCampoNumerico(request, "IMINXL");
			BigDecimal PCTMINXL = getCampoNumerico(request, "PCTMINXL");
			BigDecimal PCTPB = getCampoNumerico(request, "PCTPB");
			BigDecimal CFREBOR = getCampoNumerico(request, "CFREBOR");
			BigDecimal NANYOSLOSS = getCampoNumerico(request, "NANYOSLOSS");
			BigDecimal IBONOREC = getCampoNumerico(request, "IBONOREC");
			BigDecimal CREPOS = getCampoNumerico(request, "CREPOS");
			BigDecimal IMPCONTADO = getCampoNumerico(request, "IMPCONTADO");
			BigDecimal PCTCONTADO = getCampoNumerico(request, "PCTCONTADO");
			BigDecimal IMPAVISO = getCampoNumerico(request, "IMPAVISO");
			BigDecimal PREEST = getCampoNumerico(request, "PREEST");// CONF-1048
			BigDecimal CLOSSCORRIDOR = getCampoNumerico(request, "CLOSSCORRIDOR");
			BigDecimal CCAPPEDRATIO = getCampoNumerico(request, "CCAPPEDRATIO");

			// Campos v1 (promocioneal)
			BigDecimal PLOCAL = getCampoNumerico(request, "PLOCAL");
			BigDecimal PCTDEP = getCampoNumerico(request, "PCTDEP");
			BigDecimal CFORPAGDEP = getCampoNumerico(request, "CFORPAGDEP");
			BigDecimal INTDEP = getCampoNumerico(request, "INTDEP");
			BigDecimal PCTGASTOS = getCampoNumerico(request, "PCTGASTOS");
			BigDecimal PTASAAJUSTE = getCampoNumerico(request, "PTASAAJUSTE");
			BigDecimal PPORTRAMO = getCampoNumerico(request, "PPORTRAMO"); // BUG CONF-250 Fecha (02/09/2016) - HRE -
																			// Contratos Q1, Q2, Q3
			BigDecimal ICAPCOASEG = getCampoNumerico(request, "ICAPCOASEG");
			BigDecimal IPMD = getCampoNumerico(request, "IPMD");
			BigDecimal CFREPMD = getCampoNumerico(request, "CFREPMD");

			// Campos adicionales
			BigDecimal SCTRXL = getCampoNumerico(request, "SCTRXL");
			BigDecimal NVERXL = getCampoNumerico(request, "NVERXL");

			BigDecimal ICOSTOFIJO = getCampoNumerico(request, "ICOSTOFIJO");
			BigDecimal PCOMISINTERM = getCampoNumerico(request, "PCOMISINTERM");

			// Si el tramo que estamos modificando esta eliminado, lo quitaremos del listado
			// de deletedTramos
			String deletedTramos = (String) formdata.get("deletedTramos");
			if (!isEmpty(deletedTramos)) {
				String deletedTramos2 = "";
				String[] ctramos = deletedTramos.split(",");
				int i = 0;
				for (i = 0; i < ctramos.length; i++) {
					if (!ctramos[i].equals(CTRAMO.toString())) {
						if (deletedTramos2.length() == 0) {
							deletedTramos2 = ctramos[i];
						} else {
							deletedTramos2 = deletedTramos2 + "," + ctramos[i];
						}
					}
				}
				formdata.put("deletedTramos", deletedTramos2);
			}
			Map map = pac_axis_rea.ejecutaPAC_IAX_REA__F_SET_TRAMOS(NVERSION, SCONTRA, CTRAMO, ITOTTRA, null, CFREBOR,
					PLOCAL, IXLPRIO, // CONF-1048
					null, null, null, null, null, null, NORDEN, null, null, IMINXL, IDEPXL, SCTRXL, NVERXL, PTASAXL,
					IPMD, CFREPMD, null, null, null, IDAA, ILAA, CTPRIMAXL, IPRIMAFIJAXL, IPRIMAESTIMADA, CAPLICTASAXL,
					CTIPTASAXL, CTRAMOTASAXL, PCTPDXL, CFORPAGPDXL, PCTMINXL, PCTPB, NANYOSLOSS, CLOSSCORRIDOR,
					CCAPPEDRATIO, CREPOS, IBONOREC, IMPAVISO, IMPCONTADO, PCTCONTADO, PCTGASTOS, PTASAAJUSTE,
					ICAPCOASEG, ICOSTOFIJO, PCOMISINTERM, PPORTRAMO, // BUG CONF-250 Fecha (02/09/2016) - HRE -
																		// Contratos Q1, Q2, Q3
					PREEST // BUG CONF-1048 Fecha (29/08/2017) - HRE - Contratos no proporcionales
			// IPRIO - BUG/IAXIS-14001 QUITAR CAMPO IPRIO YA QUE EL CAMPO PRIORIDAD YA
			// EXISTIA Y ES EL CAMPO IXLPRIO

			);

			BigDecimal resultado = (BigDecimal) tratarRETURNyMENSAJES(request, map);
			formdata.put("abrir035", getCampoNumerico(request, "abrir035"));

		} catch (Exception e) {
			logger.error("Error en el servicio Axisrea004PropService - m�todo m_ajax_grabar", e);
			// ajax.rellenarExcepcionAContenedorAjax(e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			// request.setAttribute(Constantes.AJAXCONTAINER,
			// ajax.procesarContenedorAjax());
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}

	@SuppressWarnings("all")
	public void m_delete_tramo(HttpServletRequest request) {
		logger.debug("Axisarea004Service m_delete_contrato");
		AjaxContainerService ajax = new AjaxContainerService();
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {
			BigDecimal SCONTRA = getCampoNumerico(request, "SCONTRA");
			BigDecimal NVERSIO = getCampoNumerico(request, "NVERSIO");
			BigDecimal CTRAMO = getCampoNumerico(request, "CTRAMO");

			if (CTRAMO == null) {
				CTRAMO = getCampoNumerico(request, "CTRAMO_MOD");
			}
			PAC_IAX_REA pacIaxRea = new PAC_IAX_REA((java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			Map map = pacIaxRea.ejecutaPAC_IAX_REA__F_DEL_TRAMOS(NVERSIO, SCONTRA, CTRAMO);

			BigDecimal CIDIOMA = usuario.getCidioma();
			BigDecimal pPCCODIGO = getCampoNumerico(request, "CREPOS");

			map = pacIaxRea.ejecutaPAC_IAX_REA__F_GET_REPOSICIONES_DET(pPCCODIGO, null);
			List resultado = (ArrayList) tratarRETURNyMENSAJES(request, map);

			if (resultado != null) {
				int i = 0;
				for (i = 0; i < resultado.size(); i++) {
					Map reposicion_det = (HashMap) resultado.get(i);
					BigDecimal NORDEN = (BigDecimal) reposicion_det.get("NORDEN");
					Map map2 = pacIaxRea.ejecutaPAC_IAX_REA__F_DEL_REPOSICIONES_DET(pPCCODIGO, NORDEN);
				}
			}
			map = pacIaxRea.ejecutaPAC_IAX_REA__F_DEL_COD_REPOSICION(pPCCODIGO, CIDIOMA);
			ajax.guardarContenidoFinalAContenedorAjax(map);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisarea003Service - m�todo m_ajax_busqueda_ramos", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

}
