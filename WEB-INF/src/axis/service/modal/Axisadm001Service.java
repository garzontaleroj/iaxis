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

import axis.jdbc.PAC_IAX_ADM;
import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.jdbc.PAC_IAX_PERSONA;
import axis.jdbc.PAC_IAX_REDCOMERCIAL;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AjaxContainerService;
import axis.service.axis.AxisBaseService;
import axis.service.axis.Axisctr001Service;
import axis.util.Constantes;

/**
 * Axisadm001Service.java 04/06/2008
 * 
 * @author <a href="rkirchner@csi-ti.com">Roger Kirchner</a>
 * @since Java 5.0
 */
public class Axisadm001Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE INICIALIZACION
	 *******************************************/
	/*********************************************************************************************************************/

	/**
	 * 
	 * @param request
	 */
	@SuppressWarnings("all")
	public void m_form(HttpServletRequest request) {
		logger.debug("Axisadm001Service m_form");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		try {
			request.getSession().removeAttribute("REC_LSTRECIBOS");
			/* LISTVALORES */
			PAC_IAX_LISTVALORES pac_iax_listvalores = new PAC_IAX_LISTVALORES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			PAC_IAX_REDCOMERCIAL pac_iax_redcomercial = new PAC_IAX_REDCOMERCIAL(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map LISTVALORES = new HashMap();

			// Inici - BFP 19/12/2011 bug 20326
			PAC_IAX_PERSONA pac_axis_persona = new PAC_IAX_PERSONA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			// Fi - BFP 19/12/2011 bug 20326

			Map map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTEMPRESAS();
			logger.debug(map);
			LISTVALORES.put("LSTEMPRESAS", (List<Map>) tratarRETURNyMENSAJES(request, map, false));

			BigDecimal CEMPRESA = getCampoNumerico(request, "CEMPRES");
			String CMODO = (String) AbstractDispatchAction.topPila(request, "CMODO");
			if (CMODO != null && "UNIFICACION".equals(CMODO)) {
				map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_PRODUCTOS("RECUNIF", CEMPRESA, null);
			} else {
				map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_PRODUCTOS(null, CEMPRESA, null);
			}
			logger.debug(map);
			LISTVALORES.put("LSTPRODUCTOS", (List<Map>) tratarRETURNyMENSAJES(request, map, false));

			if (!isEmpty(CEMPRESA)) {
				map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTDESCCOBRADORES(CEMPRESA);
				logger.debug(map);
				LISTVALORES.put("LSTCOBRADORES", (List<Map>) tratarRETURNyMENSAJES(request, map, false));
			}

			map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTCTIPREC();
			logger.debug(map);
			LISTVALORES.put("LSTCTIPREC", (List<Map>) tratarRETURNyMENSAJES(request, map));

			// -- Bug 0012679 - 18/02/2010 - JMF
			// map =
			// pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTESTADORECIBO();
			map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTESTADORECIBO_MV();
			logger.debug(map);
			LISTVALORES.put("LSTESTADORECIBO", (List<Map>) tratarRETURNyMENSAJES(request, map, false));

			// -- Bug 16140 - 11/10/2010 - ICV
			map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(75));
			logger.debug(map);
			LISTVALORES.put("LSTIMPREC", (List<Map>) tratarRETURNyMENSAJES(request, map, false));

			map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(1033));
			logger.debug(map);
			LISTVALORES.put("LSLIQUIDAD", (List<Map>) tratarRETURNyMENSAJES(request, map, false));

			// Bug 18908/90150 - 03/08/2011 - AMC
			BigDecimal CIDIOMA = usuario.getCidioma();
			map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_AGENTESTIPO(new BigDecimal(10), CIDIOMA, null); // bug
																														// IAXIS-13049
																														// -JRVG-
																														// 15/07/2020
			logger.debug(map);
			LISTVALORES.put("LSAGENTESTIPO", (List<Map>) tratarRETURNyMENSAJES(request, map, false));

			map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTAGENTES(null, null, null, new BigDecimal(1));
			logger.debug(map);
			LISTVALORES.put("LSAGENTE", (List<Map>) tratarRETURNyMENSAJES(request, map, false));

			map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(552));
			logger.debug(map);
			LISTVALORES.put("LSMEDIO", (List<Map>) tratarRETURNyMENSAJES(request, map, false));

			// bug 20326/99335 - 01/12/2011 BFP
			Map bancos = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTBANCOS(null, null);
			logger.debug(bancos);
			request.getSession().setAttribute("DOM_LSTCBANCO", tratarRETURNyMENSAJES(request, bancos, false));

			Map ctipcuenta;
			ctipcuenta = pac_axis_persona.ejecutaPAC_IAX_PERSONA__F_GET_TIPCCC(new BigDecimal("1")); // BFP - 20326 -
																										// 19/12/2011:
																										// pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new
																										// BigDecimal(274));
			logger.debug(ctipcuenta);
			request.getSession().setAttribute("DOM_LSTCTIPCUENTA", tratarRETURNyMENSAJES(request, ctipcuenta, false));
			// FI bug 20326/99335 - 01/12/2011 BFP

			map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(884));
			logger.debug(map);
			LISTVALORES.put("LSNEGOCIO", (List<Map>) tratarRETURNyMENSAJES(request, map, false));

			map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_AGENTESTIPO(new BigDecimal(1), CIDIOMA, null);
			logger.debug(map);
			LISTVALORES.put("LSREGIONAL", (List<Map>) tratarRETURNyMENSAJES(request, map, false));

			formdata.put("LISTVALORES", LISTVALORES);
			formdata.put("NRECIBO2", getCampoNumerico(request, "NRECIBO2"));
			formdata.put("TIPORECIBO", getCampoTextual(request, "TIPORECIBO"));

			// INI BUG CONF-441 - 14/12/2016 - JAEG
			map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(552)); // bug IAXIS-13049
																										// -JRVG-
																										// 15/07/2020
			LISTVALORES.put("LSCMRECA", (List<Map>) tratarRETURNyMENSAJES(request, map, false));
			formdata.put("LISTVALORES", LISTVALORES);
			// FIN BUG CONF-441 - 14/12/2016 - JAEG

			String cargaPersonas = getCampoTextual(request, "cargaPersonas");
			if (cargaPersonas != null) {
				// INI CARGA DE PERSONAS
				String NNUMIDE = getCampoTextual(request, "NNUMIDE");
				String TNOMBRE = getCampoTextual(request, "TNOMBRE");

				if (NNUMIDE == null)
					NNUMIDE = "";
				if (TNOMBRE == null)
					TNOMBRE = "";

				String CODIGO = "DATOSPERSONA";
				String CONDICION = NNUMIDE + "|" + TNOMBRE;

				map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_LISTVALORES__F_GET_CONSULTA(CODIGO, CONDICION);
				logger.debug(map);
				List DATOSPERSONA = (List) tratarRETURNyMENSAJES(request, map, false);
				request.setAttribute(CODIGO, DATOSPERSONA);
				request.getSession().removeAttribute("REC_LSTRECIBOS");
				formdata.put("TIPORECIBO", getCampoTextual(request, "TIPORECIBO"));

			} // FIN CARGA PERSONAS
				// para mantener los dataos en pantalla
			BigDecimal NCERTIF = getCampoNumerico(request, "NCERTIF");
			formdata.put("NCERTIF", NCERTIF);
			BigDecimal CCOBBAN = getCampoNumerico(request, "list_COBBANCARIO");
			formdata.put("CCOBBAN", CCOBBAN);
			String CRAMO = getCampoTextual(request, "ramoProducto");
			formdata.put("CRAMO", CRAMO);
			BigDecimal SPRODUC = getCampoNumerico(request, "SPRODUC");
			formdata.put("SPRODUC_SELEC", SPRODUC);
			BigDecimal LSMEDIO = getCampoNumerico(request, "LSMEDIO");
			formdata.put("LSMEDIO", LSMEDIO);
			String tomador = getCampoTextual(request, "tomador");
			formdata.put("tomador", tomador == null ? "" : tomador);
			String asegurado = getCampoTextual(request, "asegurado");
			formdata.put("asegurado", asegurado == null ? "" : asegurado);
			String pagador = getCampoTextual(request, "pagador");
			formdata.put("pagador", pagador == null ? "" : pagador);

			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
			this.cargaComboCompania(request);
		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm001Service - m�todo m_form", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
	}

	/*********************************************************************************************************************/
	/************************************************
	 * M�TODOS DE ACTUALIZACI�N
	 *******************************************/
	/*********************************************************************************************************************/

	/**
	 * 
	 * @param request
	 */
	@SuppressWarnings("all")
	public void m_ajax_cargarDatosPersona(HttpServletRequest request) {
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		logger.debug("Axispro018Service m_cargarDatosPersona");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();

		try {
			String NNUMIDE = getCampoTextual(request, "NNUMIDE");
			String TNOMBRE = getCampoTextual(request, "TNOMBRE");

			if (NNUMIDE == null)
				NNUMIDE = "";
			if (TNOMBRE == null)
				TNOMBRE = "";

			String CODIGO = "DATOSPERSONA";
			String CONDICION = NNUMIDE + "|" + TNOMBRE;

			Map map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES__F_GET_CONSULTA(CODIGO, CONDICION);
			logger.debug(map);

			List DATOSPERSONA = (List) ajax.rellenarPlAContenedorAjax(map);
			ajax.guardarContenidoFinalAContenedorAjax(DATOSPERSONA);
			request.getSession().removeAttribute("REC_LSTRECIBOS");
			formdata.put("TIPORECIBO", getCampoTextual(request, "TIPORECIBO"));
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
			this.cargaComboCompania(request);

		} catch (Exception e) {
			logger.error("Error en el servicio Axispro022Service - m�todo m_cargarDatosPersona", e);
			ajax.rellenarExcepcionAContenedorAjax(e);

		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	public void m_cargarRecercaRebuts(HttpServletRequest request) {
		logger.debug("Axisadm001Service m_cargarRecercaRebuts");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {

			// TODO: Permitir b�squedas sin NRECIBO? Es una query larga, se queda tirado
			BigDecimal NRECIBO = getCampoNumerico(request, "NRECIBO");
			if (isEmpty(NRECIBO) && !isEmpty(request.getAttribute("NRECIBO")))
				NRECIBO = new BigDecimal(String.valueOf(request.getAttribute("NRECIBO")));
			BigDecimal CEMPRES = getCampoNumerico(request, "CEMPRES");
			BigDecimal SPRODUC = getCampoNumerico(request, "SPRODUC");
			BigDecimal NPOLIZA = getCampoNumerico(request, "NPOLIZA");
			BigDecimal NCERTIF = getCampoNumerico(request, "NCERTIF");
			BigDecimal CTIPREC = getCampoNumerico(request, "CTIPREC");
			BigDecimal CESTREC = getCampoNumerico(request, "CESTREC");
			Date FEMISIOINI = stringToSqlDate(getCampoTextual(request, "FEMISIOINI"));
			Date FEMISIOFIN = stringToSqlDate(getCampoTextual(request, "FEMISIOFIN"));
			Date FEFEINI = stringToSqlDate(getCampoTextual(request, "FEFEINI"));
			Date FEFEFIN = stringToSqlDate(getCampoTextual(request, "FEFEFIN"));
			BigDecimal CESTIMP = getCampoNumerico(request, "CESTIMP");
			String CRECCIA = getCampoTextual(request, "CRECCIA");
			String CPOLCIA = getCampoTextual(request, "CPOLCIA");
			BigDecimal CCOMPANI = getCampoNumerico(request, "CCOMPANI");

			BigDecimal PRECUNIF = new BigDecimal("0");

			BigDecimal CTIPO = getCampoNumerico(request, "CTIPO");
			BigDecimal SPERSON = getCampoNumerico(request, "SPERSON");
			BigDecimal LIQUIDAD = getCampoNumerico(request, "LIQUIDAD");

			String REBUT_INI = getCampoTextual(request, "REBUT_INI");

			String CMODO = (String) AbstractDispatchAction.topPila(request, "CMODO");

			if (CMODO != null && "UNIFICACION".equals(CMODO)) {
				PRECUNIF = new BigDecimal("1");
			}

			// Bug 18908-90150

			BigDecimal PNANUALI = getHiddenCampoNumerico(request, "NANUALI");
			BigDecimal PNFRACCI = getHiddenCampoNumerico(request, "NFRACCI");
			BigDecimal PTIPNEGOC = getHiddenCampoNumerico(request, "LSNEGOCIO");

			String CCONDICION = getHiddenCampoTextual(request, "TCONDICION");

			BigDecimal CAGENTE = getHiddenCampoNumerico(request, "CAGENTE");

			BigDecimal PTIPREGIO = getHiddenCampoNumerico(request, "TIPREGIO");

			PAC_IAX_ADM pac_iax_adm = new PAC_IAX_ADM((java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			BigDecimal filtro = this.getFiltro(request);
			// bug 20326/99335 - 01/12/2011 BFP
			// Map map0 = pac_iax_adm.ejecutaPAC_IAX_ADM__F_GET_CONSULTARECIBOS_MV(NRECIBO,
			// CEMPRES, SPRODUC, NPOLIZA,
			// NCERTIF, CTIPREC, CESTREC, FEMISIOINI, FEMISIOFIN, FEFEINI, FEFEFIN, CTIPO,
			// SPERSON , PRECUNIF, CESTIMP, CRECCIA, CPOLCIA,CCOMPANI,LIQUIDAD,filtro,
			// null,null,null,null,null);
			// INI BUG IAXIS-13049 JRVG 15/07/2020
			String NRECCAJ = getCampoTextual(request, "NRECCAJ"); // BUG CONF-441 - 14/12/2016 - JAEG
			// FIN BUG IAXIS-13049 JRVG 15/07/2020
			BigDecimal CMRECA = getHiddenCampoNumerico(request, "CMRECA"); // BUG CONF-441 - 14/12/2016 - JAEG

			Map map0 = pac_iax_adm.ejecutaPAC_IAX_ADM__F_GET_CONSULTARECIBOS_MV(NRECIBO, CEMPRES, SPRODUC, NPOLIZA,
					NCERTIF, CTIPREC, CESTREC, FEMISIOINI, FEMISIOFIN, FEFEINI, FEFEFIN, CTIPO, SPERSON, PRECUNIF,
					CESTIMP, CRECCIA, CPOLCIA, CCOMPANI, LIQUIDAD, filtro, null, null, CAGENTE, null, null, null, null,
					null, REBUT_INI, PNANUALI, PNFRACCI, PTIPNEGOC, CCONDICION, PTIPREGIO, NRECCAJ, CMRECA); // BUG
																												// CONF-441
																												// -
																												// 14/12/2016
																												// -
																												// JAEG

			// bug 20326/99335 - 01/12/2011 BFP
			logger.debug(map0);

			List LSTRECIBOS = (List<Map>) tratarRETURNyMENSAJES(request, map0);
			if (isEmpty(LSTRECIBOS))
				// No se han encontrado datos
				AbstractDispatchAction.guardarMensaje(request, "120135", null, Constantes.MENSAJE_INFO);

			request.getSession().setAttribute("REC_LSTRECIBOS", LSTRECIBOS);
			formdata.put("NRECIBO2", getCampoNumerico(request, "NRECIBO2"));

			/* LISTVALORES */
			PAC_IAX_LISTVALORES pac_iax_listvalores = new PAC_IAX_LISTVALORES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map LISTVALORES = new HashMap();

			Map map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTEMPRESAS();
			logger.debug(map);
			LISTVALORES.put("LSTEMPRESAS", (List<Map>) tratarRETURNyMENSAJES(request, map, false));

			BigDecimal CEMPRESA = getCampoNumerico(request, "CEMPRES");
			map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_PRODUCTOS(null, CEMPRESA, null);
			logger.debug(map);
			LISTVALORES.put("LSTPRODUCTOS", (List<Map>) tratarRETURNyMENSAJES(request, map, false));

			if (!isEmpty(CEMPRESA)) {
				map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTCOBRADORES(CEMPRESA);
				logger.debug(map);
				LISTVALORES.put("LSTCOBRADORES", (List<Map>) tratarRETURNyMENSAJES(request, map, false));
			}

			map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTCTIPREB();
			logger.debug(map);
			LISTVALORES.put("LSTCTIPREB", (List<Map>) tratarRETURNyMENSAJES(request, map, false));

			map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTESTADORECIBO();
			logger.debug(map);
			LISTVALORES.put("LSTESTADORECIBO", (List<Map>) tratarRETURNyMENSAJES(request, map, false));

			// -- Bug 16140 - 11/10/2010 - ICV
			map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(75));
			logger.debug(map);
			LISTVALORES.put("LSTIMPREC", (List<Map>) tratarRETURNyMENSAJES(request, map, false));

			map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(1033));
			logger.debug(map);
			LISTVALORES.put("LSLIQUIDAD", (List<Map>) tratarRETURNyMENSAJES(request, map, false));

			// Bug 18908/90150 - 03/08/2011 - AMC
			BigDecimal CIDIOMA = usuario.getCidioma();
			map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_AGENTESTIPO(new BigDecimal(10), CIDIOMA, null); // bug
																														// IAXIS-13049
																														// -JRVG-
																														// 15/07/2020
			logger.debug(map);
			LISTVALORES.put("LSAGENTESTIPO", (List<Map>) tratarRETURNyMENSAJES(request, map, false));

			map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTAGENTES(null, null, null, new BigDecimal(1));
			logger.debug(map);
			LISTVALORES.put("LSAGENTE", (List<Map>) tratarRETURNyMENSAJES(request, map, false));

			map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(552));
			logger.debug(map);
			LISTVALORES.put("LSMEDIO", (List<Map>) tratarRETURNyMENSAJES(request, map, false));

			map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(884));
			logger.debug(map);
			LISTVALORES.put("LSNEGOCIO", (List<Map>) tratarRETURNyMENSAJES(request, map, false));

			formdata.put("LISTVALORES", LISTVALORES);
			formdata.put("TIPORECIBO", getCampoTextual(request, "TIPORECIBO"));

			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
			this.cargaComboCompania(request);
		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm001Service - m�todo m_cargarRecercaRebuts", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
	}

	private void cargaComboCompania(HttpServletRequest request) throws Exception {
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map cias = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_LISTVALORES__F_GET_CIAPRODUCTOS();
		logger.debug("ejecutaPAC_IAX_LISTVALORES__F_GET_CIAPRODUCTOS: devuelve" + cias);
		List listacias = (List) tratarRETURNyMENSAJES(request, cias, false);
		formdata.put("CIAS", listacias);
	}

	private List dbGetCompaniRams(HttpServletRequest request) throws Exception {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		String tipo = this.getCampoTextual(request, "tipo");
		BigDecimal pCOMPANI = this.getCampoNumerico(request, "CEMPRES");
		// Carga de ramos de la BD
		Map map = null;
		if ((pCOMPANI != null) && (pCOMPANI.intValue() > 0)) {
			map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES__F_GET_RAMOS(tipo, null);
		}

		logger.debug("----Buscamos ramos empresa:" + pCOMPANI + " map:" + map);
		List listaRamos = (List) tratarRETURNyMENSAJES(request, map, false);

		return listaRamos;
	}

	/**
	 * Carga la lista inicial de ramos en la pantalla.
	 * 
	 * @param request El HttpServletRequest que contiene la petici�n del cliente
	 *                web.
	 */
	private void cargaListaRamos(HttpServletRequest request) throws Exception {
		List listaRamos = dbGetCompaniRams(request);
		request.setAttribute("axisctr_listaRamos", listaRamos != null ? listaRamos : new ArrayList());
	}

	/**
	 * Carga el agente inicial de la pantalla.
	 * 
	 * @param request El HttpServletRequest que contiene la petici�n del cliente
	 *                web.
	 *
	 *                private Map ActualizaAgente(HttpServletRequest request, String
	 *                CAGENTE) throws Exception { Map mapAgentes=new HashMap();
	 * 
	 *                // Cargar Agente de la BD Map agente=new HashMap(); if
	 *                (!isEmpty(CAGENTE)) { UsuarioBean
	 *                usuario=(UsuarioBean)request.getSession().getAttribute(Constantes.USUARIO);
	 *                mapAgentes=new
	 *                PAC_IAX_LISTVALORES((java.sql.Connection)request.getAttribute(Constantes.DB01CONN)).ejecutaPAC_IAX_LISTVALORES__F_GET_LSTAGENTES(null,
	 *                null, CAGENTE, new BigDecimal(1)); logger.debug(mapAgentes);
	 *                List agentes=(List)mapAgentes.get("RETURN");
	 * 
	 * 
	 *                if (!isEmpty(mapAgentes.get("RETURN")))
	 *                agente=(Map)agentes.get(0); }
	 * 
	 *                request.setAttribute("axisctr_agente", agente);
	 * 
	 *                return mapAgentes; }
	 */

	private List dbGetRamProductos(HttpServletRequest request) throws Exception {
		// TODO: PCTERMFIN a hard-code
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		logger.debug("----Buscamos productos TIPO:" + getCampoTextual(request, "tipo") + "------------");
		BigDecimal pCOMPANI = this.getCampoNumerico(request, "CCOMPANI");
		Map m;
		if ((pCOMPANI != null) && (pCOMPANI.intValue() > 0)) {
			m = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES__F_GET_PRODUCTOSCOMPANIA(pCOMPANI, getCampoNumerico(request, "CRAMO"));
		} else {
			m = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES__F_GET_RAMPRODUCTOS(getCampoTextual(request, "tipo"),
							getCampoNumerico(request, "CRAMO"), new BigDecimal(0));
		}

		logger.debug(m);
		List productos = (List) tratarRETURNyMENSAJES(request, m, false);

		return productos;
	}

	/**
	 * Realiza una b�squeda de productos por Ajax.
	 * 
	 * @see buscaProductos
	 * @param request El HttpServletRequest que contiene la petici�n del cliente
	 *                web.
	 */
	public void m_ajax_busqueda_ramos(HttpServletRequest request) {
		logger.debug("---> Axisadm001Service m_ajax_busqueda_ramos");
		AjaxContainerService ajax = new AjaxContainerService();
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {
			if (!isEmpty(this.getCampoNumerico(request, "CEMPRES"))) {
				ajax.guardarContenidoFinalAContenedorAjax(this.dbGetCompaniRams(request));
			}
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr001Service - m�todo m_ajax_busqueda_ramos", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	/**
	 * Realiza una b�squeda de productos por Ajax.
	 * 
	 * @see buscaProductos
	 * @param request El HttpServletRequest que contiene la petici�n del cliente
	 *                web.
	 */
	public void m_ajax_busqueda_productos(HttpServletRequest request) {
		logger.debug("Axisctr019Service m_ajax_busqueda_productos");
		AjaxContainerService ajax = new AjaxContainerService();
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {
			if ((!isEmpty(this.getCampoNumerico(request, "CRAMO")))
					|| (!isEmpty(this.getCampoNumerico(request, "CCOMPANI")))) {
				ajax.guardarContenidoFinalAContenedorAjax(this.dbGetRamProductos(request));
			} else
				ajax.guardarContenidoFinalAContenedorAjax(this.dbGetProductos(request, usuario));
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr001Service - m�todo m_ajax_busqueda_productos", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());

		}
	}

	/**
	 * M�todo que llama a la funci�n pl correspondiente a la carga de productos para
	 * seleccionar una p�liza.
	 * 
	 * @param request
	 * @param usuario
	 * @return
	 * @throws Exception
	 */
	private List dbGetProductos(HttpServletRequest request, UsuarioBean usuario) throws Exception {
		// TODO: PCTERMFIN a hard-code
		logger.debug("----Buscamos productos TIPO:" + getCampoTextual(request, "tipo") + "------------");
		Map m = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_LISTVALORES__F_GET_PRODUCTOS(getCampoTextual(request, "tipo"), null, null);
		logger.debug(m);
		List primas = (List) tratarRETURNyMENSAJES(request, m, false);

		return primas;
	}

	/**
	 * Realiza una b�squeda de productos por Ajax.
	 * 
	 * @see Axisctr001Service#buscaProductos
	 * @param request El HttpServletRequest que contiene la petici�n del cliente
	 *                web.
	 */
	public void m_ajax_actualizar_agente(HttpServletRequest request) {
		AjaxContainerService ajax = new AjaxContainerService();

		try {
			String CAGENTE = getCampoTextual(request, "CAGENTE");
			Map m = (Map) this.ActualizaAgente(request, CAGENTE);
			ajax.rellenarPlAContenedorAjax(m);
			ajax.guardarContenidoFinalAContenedorAjax(m);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm021Service - m�todo m_ajax_actualizar_agente", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	/**
	 * Carga el agente inicial de la pantalla.
	 * 
	 * @param request El HttpServletRequest que contiene la petici�n del cliente
	 *                web.
	 */
	private Map ActualizaAgente(HttpServletRequest request, String CAGENTE) throws Exception {
		Map mapAgentes = new HashMap();

		// Cargar Agente de la BD
		Map agente = new HashMap();
		if (!isEmpty(CAGENTE)) {
			UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
			String CONDICION = this.getCampoTextual(request, "CONDICION");
			mapAgentes = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTAGENTES_COND(null, null, new BigDecimal(CAGENTE),
							new BigDecimal(1), CONDICION);
			logger.debug(mapAgentes);
			List agentes = (List) mapAgentes.get("RETURN");

			if (!isEmpty(mapAgentes.get("RETURN")))
				agente = (Map) agentes.get(0);
		}

		request.getSession().setAttribute("axisctr_agente", agente);

		return mapAgentes;
	}

	/**
	 * Dado un agente seleccionado en el modal de selecci�n de agentes (axisctr014),
	 * �ste m�todo recibe el atributo CODI del agente y lo pone en el par�metro de
	 * sesi�n axisctr_agente.
	 * 
	 * @param request El HttpServletRequest que contiene la petici�n del cliente
	 *                web.
	 */
	public void m_ajax_ver_agente(HttpServletRequest request) {
		AjaxContainerService ajax = new AjaxContainerService();
		try {
			String CODI = getCampoTextual(request, "CODI");

			if (request.getSession().getAttribute("axisctr014_listaAgentes") != null) {
				List listaAgentes = (List) request.getSession().getAttribute("axisctr014_listaAgentes");
				Map agente = getObjetoDeLista(listaAgentes, CODI, "CODI");

				if (!isEmpty(agente)) {
					ajax.guardarContenidoFinalAContenedorAjax(agente);
					request.getSession().setAttribute("axisctr_agente", agente);
				}
				listaAgentes = null;
			}
		} catch (Exception e) {
			logger.error("Error", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}
}
