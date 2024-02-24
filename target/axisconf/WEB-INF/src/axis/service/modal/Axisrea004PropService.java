//Revision:# A+E2RGI5yXok7owb8y6s5Q== #
package axis.service.modal;

import java.math.BigDecimal;
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
import axis.mvc.control.modal.Axisrea004PropAction;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AjaxContainerService;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

public class Axisrea004PropService extends AxisBaseService {
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

		// Desplegables
		try {

			PAC_IAX_REA pac_iax_rea = new PAC_IAX_REA((java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			BigDecimal SCONTRA = getCampoNumerico(request, "SCONTRA");
			BigDecimal NVERSIO = getCampoNumerico(request, "NVERSIO");
			BigDecimal CTRAMO = getCampoNumerico(request, "CTRAMO");
			BigDecimal CTIPREA = getCampoNumerico(request, "CTIPREA");// BUG CONF-250 Fecha (02/09/2016) - HRE -
																		// Contratos Q1, Q2, Q3

			if (CTRAMO == null) {
				CTRAMO = getCampoNumerico(request, "CTRAMO_MOD");
			}

			/*
			 * Cargar valores del tramo que se consulta en caso de consulta CTRAMO != null
			 * (C�digo de tramo)
			 */
			if (SCONTRA != null && NVERSIO != null && CTRAMO != null) { // Se trata de una edici�n o de una recarga
																		// despu�s de 'GRABAR'

				formdata.put("SCONTRA", SCONTRA);
				formdata.put("NVERSIO", NVERSIO);
				formdata.put("CTRAMO", CTRAMO);
				formdata.put("CTIPREA", CTIPREA);// BUG CONF-250 Fecha (02/09/2016) - HRE - Contratos Q1, Q2, Q3

				HashMap detalle_tramo = pac_iax_rea.ejecutaPAC_IAX_REA__F_GET_DETTRAMO_REA(SCONTRA, NVERSIO, CTRAMO);
				Map datos_tramo = (Map) tratarRETURNyMENSAJES(request, detalle_tramo);

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
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this)); // La configuraci�n es la misma para las dos
																			// pantallas
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
	private

			void cargarValoresDesplegables(HttpServletRequest request, UsuarioBean usuario, Map formdata)
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
			BigDecimal CTIPREA = (BigDecimal) formdata.get("CTIPREA");// BUG CONF-250 Fecha (02/09/2016) - HRE -
																		// Contratos Q1, Q2, Q3
			Map map_ctramo = new PAC_IAX_LISTVALORES_REA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES_REA__F_GET_TIPOSTRAMOS_PROP(CTIPREA);
			// new
			// PAC_IAX_LISTVALORES((java.sql.Connection)request.getAttribute(Constantes.DB01CONN)).ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(CVALOR_T);
			List ListaTramos = (List) tratarRETURNyMENSAJES(request, map_ctramo);
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

		} catch (Exception e) {
			logger.error("Error en el m�todo Axisrea004Service.cargarValoresDesplegables", e);
			AbstractDispatchAction.guardarMensaje(request, "1000050", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		} finally {
			formdata.put("listValores", listValores);
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this)); // La configuraci�n es la misma para las dos
																			// pantallas

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

			void m_ajax_grabar(HttpServletRequest request, AbstractDispatchAction thisAction) {
		logger.debug("Axisrea004Propervice m_ajax_guardar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();
		try {

			PAC_IAX_REA pac_axis_rea = new PAC_IAX_REA((java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			/* Datos cabecera */
			BigDecimal CTRAMO = getCampoNumerico(request, "CTRAMO");
			BigDecimal NORDEN = getCampoNumerico(request, "NORDEN");
			BigDecimal NVERSION = getCampoNumerico(request, "NVERSIO");
			BigDecimal SCONTRA = getCampoNumerico(request, "SCONTRA");

			/* Campos (no promocional/promocional) */
			BigDecimal ITOTTRA = getCampoNumerico(request, "ITOTTRA");
			BigDecimal IXLPRIO = getCampoNumerico(request, "IXLPRIO");// NUEVO CAMPO IAXIS-4611 - / BUG/IAXIS-14001 Se
																		// quita el campo iprio para agregar el campo
																		// IXLPRIO Sed debe quitar campo IPRIO ya que
																		// campo prioridad ya existia y es IXLIPRIO
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
			BigDecimal CLOSSCORRIDOR = getCampoNumerico(request, "CLOSSCORRIDOR");
			BigDecimal CCAPPEDRATIO = getCampoNumerico(request, "CCAPPEDRATIO");

			/* Campos v1 (promocioneal) */
			BigDecimal PLOCAL = getCampoNumerico(request, "PLOCAL");
			BigDecimal PCTDEP = getCampoNumerico(request, "PCTDEP");
			BigDecimal CFORPAGDEP = getCampoNumerico(request, "CFORPAGDEP");
			BigDecimal INTDEP = getCampoNumerico(request, "INTDEP");
			BigDecimal PCTGASTOS = getCampoNumerico(request, "PCTGASTOS");
			BigDecimal PTASAAJUSTE = getCampoNumerico(request, "PTASAAJUSTE");
			BigDecimal PPORTRAMO = getCampoNumerico(request, "PPORTRAMO"); // BUG CONF-250 Fecha (02/09/2016) - HRE -
																			// Contratos Q1, Q2, Q3
			BigDecimal ICAPCOASEG = getCampoNumerico(request, "ICAPCOASEG");

			BigDecimal ICOSTOFIJO = getCampoNumerico(request, "ICOSTOFIJO");
			BigDecimal PCOMISINTERM = getCampoNumerico(request, "PCOMISINTERM");

			/* Campos adicionales */
			BigDecimal SCTRXL = getCampoNumerico(request, "SCTRXL");
			BigDecimal NVERXL = getCampoNumerico(request, "NVERXL");

			/*
			 * if (isEmpty(formdata.get("CTRAMO"))) { logger.debug("entro if ctramo");
			 * CTRAMO = getCampoNumerico(request, "CTRAMO_MOD"); }
			 */

			// Antigua : Map map = pac_axis_rea.ejecutaPAC_IAX_REA__F_SET_OBJETOTRAMOSREA
			// (NVERSION,SCONTRA,CTRAMO,ITOTTRA,null,CFREBOR,PLOCAL,null, null, null, null,
			// null, null, null, NORDEN, null, null, null, null, null, SCTRXL, NVERXL, null,
			// null, null, null, null);
			// Map map =
			// pac_axis_rea.ejecutaPAC_IAX_REA__F_SET_OBJETOTRAMOSREA(PNVERSIO,PSCONTRA,PCTRAMO,
			// PITOTTRA, PNPLENOS, PCFREBOR, PPLOCAL, PIXLPRIO, PIXLEXCE, PSLPRIO, PSLEXCE,
			// PNCESION, PFULTBOR, PIMAXPLO, NORDEN, PNSEGCON, PIMINXL, PIDEPXL, NSEGVER,
			// PPTASAXL, PNCTRXL, PNVERXL, PIPMD, PCFREPMD, PCAPLIXL, PPLIMGAS, PPLIMINX,
			// PIDAA, PILAA, PCTPRIMAXL, PIPRIMAFIJAXL, PIPRIMAESTIMADA, PCAPLICTASAXL,
			// PCTIPTASAXL, PCTRAMOTASAXL, PCTPDXL, PCFORPAGPDXL, PPCTMINXL,PPCTPB,
			// PNANYOSLOSS, PCLOSSCORRIDOR, PCAPPEDRATIO, PCREPOS, PIBONOREC, PIMPAVISO,
			// PIMPCONTADO, PPCTCONTADO, PPCTDEP, PCFORPAGDEP, PINTDEP, PPCTGASTOS,
			// PPTASAAJUSTE, PICAPCOASEG);

			/*
			 * Map map =
			 * pac_axis_rea.ejecutaPAC_IAX_REA__F_SET_OBJETOTRAMOSREA(NVERSION,SCONTRA,
			 * CTRAMO,ITOTTRA, null,CFREBOR,PLOCAL,null,null,null,null,null,
			 * null,null,NORDEN,null, null, IDEPXL, null, PTASAXL, SCTRXL,NVERXL, null,
			 * null,null,null,IMINXL,IDAA,ILAA,CTPRIMAXL,IPRIMAFIJAXL,IPRIMAESTIMADA,
			 * CAPLICTASAXL, CTIPTASAXL, CTRAMOTASAXL, PCTPDXL, CFORPAGPDXL, PCTMINXL,
			 * PCTPB, NANYOSLOSS, CLOSSCORRIDOR, CCAPPEDRATIO, CREPOS, IBONOREC, IMPAVISO,
			 * IMPCONTADO, PCTCONTADO, PCTGASTOS, PTASAAJUSTE, ICAPCOASEG);
			 */

			// BUG IAXIS-14001 26/06/2020 se debe quitar campo IPRIO ya que el campo
			// prioridad ya existia que es IXLIPRIO

			Map map = pac_axis_rea.ejecutaPAC_IAX_REA__F_SET_TRAMOS(NVERSION, SCONTRA, CTRAMO, ITOTTRA, null, CFREBOR,
					PLOCAL, IXLPRIO, null, null, null, null, null, null, NORDEN, null, null, IDEPXL, null, PTASAXL,
					SCTRXL, NVERXL, null, null, null, null, IMINXL, IDAA, ILAA, CTPRIMAXL, IPRIMAFIJAXL, IPRIMAESTIMADA,
					CAPLICTASAXL, CTIPTASAXL, CTRAMOTASAXL, PCTPDXL, CFORPAGPDXL, PCTMINXL, PCTPB, NANYOSLOSS,
					CLOSSCORRIDOR, CCAPPEDRATIO, CREPOS, IBONOREC, IMPAVISO, IMPCONTADO, PCTCONTADO, PCTGASTOS,
					PTASAAJUSTE, ICAPCOASEG, ICOSTOFIJO, PCOMISINTERM, PPORTRAMO, null);// BUG CONF-250 Fecha
																						// (02/09/2016) - HRE -
																						// Contratos Q1, Q2, Q3

			// (java.math.BigDecimal pPNVERSIO, java.math.BigDecimal pPSCONTRA,
			// java.math.BigDecimal pPCTRAMO, java.math.BigDecimal pPITOTTRA,
			// java.math.BigDecimal pPNPLENOS, java.math.BigDecimal pPCFREBOR,
			// java.math.BigDecimal pPPLOCAL, java.math.BigDecimal pPIXLPRIO,
			// java.math.BigDecimal pPIXLEXCE, java.math.BigDecimal pPPSLPRIO,
			// java.math.BigDecimal pPPSLEXCE, java.math.BigDecimal pPNCESION, java.sql.Date
			// pPFULTBOR, java.math.BigDecimal pPIMAXPLO, java.math.BigDecimal pPNORDEN,
			// java.math.BigDecimal pPNSEGCON, java.math.BigDecimal pPIMINXL,
			// java.math.BigDecimal pPIDEPXL, java.math.BigDecimal pPNSEGVER,
			// java.math.BigDecimal pPPTASAXL, java.math.BigDecimal pPNCTRXL,
			// java.math.BigDecimal pPNVERXL, java.math.BigDecimal pPIPMD,
			// java.math.BigDecimal pPCFREPMD, java.math.BigDecimal pPCAPLIXL,
			// java.math.BigDecimal pPPLIMGAS, java.math.BigDecimal pPPLIMINX,
			// java.math.BigDecimal pPIDAA, java.math.BigDecimal pPILAA,
			// java.math.BigDecimal pPCTPRIMAXL, java.math.BigDecimal pPIPRIMAFIJAXL,
			// java.math.BigDecimal pPIPRIMAESTIMADA, java.math.BigDecimal pPCAPLICTASAXL,
			// java.math.BigDecimal pPCTIPTASAXL, java.math.BigDecimal pPCTRAMOTASAXL,
			// java.math.BigDecimal pPPCTPDXL, java.math.BigDecimal pPCFORPAGPDXL,
			// java.math.BigDecimal pPPCTMINXL, java.math.BigDecimal pPPCTPB,
			// java.math.BigDecimal pPNANYOSLOSS, java.math.BigDecimal pPCLOSSCORRIDOR,
			// java.math.BigDecimal pPCCAPPEDRATIO, java.math.BigDecimal pPCREPOS,
			// java.math.BigDecimal pPIBONOREC, java.math.BigDecimal pPIMPAVISO,
			// java.math.BigDecimal pPIMPCONTADO, java.math.BigDecimal pPPCTCONTADO,
			// java.math.BigDecimal pPPCTGASTOS, java.math.BigDecimal pPPTASAAJUSTE,
			// java.math.BigDecimal pPICAPCOASEG)

			// BigDecimal resultado = (BigDecimal)tratarRETURNyMENSAJES(request, map);
			/*
			 * ArrayList prueba = new ArrayList(); prueba.add(map);
			 */
			// ajax.guardarContenidoFinalAContenedorAjax(prueba);

			ajax.rellenarPlAContenedorAjax(map);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisrea004PropService - m�todo m_ajax_grabar", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	public

			void m_grabar(HttpServletRequest request, Axisrea004PropAction thisAction) {
		logger.debug("Axisrea004Propervice m_ajax_guardar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {

			PAC_IAX_REA pac_axis_rea = new PAC_IAX_REA((java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			/* Datos cabecera */
			BigDecimal CTRAMO = getCampoNumerico(request, "CTRAMO");
			BigDecimal NORDEN = getCampoNumerico(request, "NORDEN");
			BigDecimal NVERSION = getCampoNumerico(request, "NVERSIO");
			BigDecimal SCONTRA = getCampoNumerico(request, "SCONTRA");

			/* Campos (no promocional/promocional) */
			BigDecimal ITOTTRA = getCampoNumerico(request, "ITOTTRA");
			BigDecimal IXLPRIO = getCampoNumerico(request, "IXLPRIO");// NUEVO CAMPO IAXIS-4611 -- BUG/IAXIS-14001 Se
																		// quita el campo iprio para agregar el campo
																		// IXLPRIO Sed debe quitar campo IPRIO ya que
																		// campo prioridad ya existia y es IXLIPRIO
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
			BigDecimal CLOSSCORRIDOR = getCampoNumerico(request, "CLOSSCORRIDOR");
			BigDecimal CCAPPEDRATIO = getCampoNumerico(request, "CCAPPEDRATIO");

			/* Campos v1 (promocioneal) */
			BigDecimal PLOCAL = getCampoNumerico(request, "PLOCAL");
			BigDecimal PCTDEP = getCampoNumerico(request, "PCTDEP");
			BigDecimal CFORPAGDEP = getCampoNumerico(request, "CFORPAGDEP");
			BigDecimal INTDEP = getCampoNumerico(request, "INTDEP");
			BigDecimal PCTGASTOS = getCampoNumerico(request, "PCTGASTOS");
			BigDecimal PTASAAJUSTE = getCampoNumerico(request, "PTASAAJUSTE");
			BigDecimal PPORTRAMO = getCampoNumerico(request, "PPORTRAMO"); // BUG CONF-250 Fecha (02/09/2016) - HRE -
																			// Contratos Q1, Q2, Q3
			BigDecimal ICAPCOASEG = getCampoNumerico(request, "ICAPCOASEG");
			BigDecimal ICOSTOFIJO = getCampoNumerico(request, "ICOSTOFIJO");
			BigDecimal PCOMISINTERM = getCampoNumerico(request, "PCOMISINTERM");

			/* Campos adicionales */
			BigDecimal SCTRXL = getCampoNumerico(request, "SCTRXL");
			BigDecimal NVERXL = getCampoNumerico(request, "NVERXL");

			if (isEmpty(formdata.get("CTRAMO"))) {
				logger.debug("entro if ctramo");
				CTRAMO = getCampoNumerico(request, "CTRAMO_MOD");
			}

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

			// BUG/IAXIS-14001 Se quita el campo iprio para agregar el campo IXLPRIO Sed
			// debe quitar campo IPRIO ya que campo prioridad ya existia y es IXLIPRIO
			Map map = pac_axis_rea.ejecutaPAC_IAX_REA__F_SET_TRAMOS(NVERSION, SCONTRA, CTRAMO, ITOTTRA, null, CFREBOR,
					PLOCAL, IXLPRIO, null, null, null, null, null, null, NORDEN, null, null, IDEPXL, null, PTASAXL,
					SCTRXL, NVERXL, null, null, null, null, IMINXL, IDAA, ILAA, CTPRIMAXL, IPRIMAFIJAXL, IPRIMAESTIMADA,
					CAPLICTASAXL, CTIPTASAXL, CTRAMOTASAXL, PCTPDXL, CFORPAGPDXL, PCTMINXL, PCTPB, NANYOSLOSS,
					CLOSSCORRIDOR, CCAPPEDRATIO, CREPOS, IBONOREC, IMPAVISO, IMPCONTADO, PCTCONTADO, PCTGASTOS,
					PTASAAJUSTE, ICAPCOASEG, ICOSTOFIJO, PCOMISINTERM, PPORTRAMO, null); // BUG CONF-250 Fecha
																							// (02/09/2016) - HRE -
																							// Contratos Q1, Q2, Q3

			BigDecimal resultado = (BigDecimal) tratarRETURNyMENSAJES(request, map);
			if (resultado.intValue() == 0) {
				request.setAttribute("grabarOK", "0");
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisrea004PropService - m�todo m_ajax_grabar", e);

		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}

}
