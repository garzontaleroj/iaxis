//Revision:# cl4H4AN240fwBeOegULfsA== #
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
import axis.jdbc.PAC_IAX_PRODUCCION;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AjaxContainerService;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

public class Axisctr049Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());
	private String SNIP = "";
	private BigDecimal SPERSON;

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE INICIALIZACION
	 *******************************************/
	/*********************************************************************************************************************/

	/**
	 * Inicializa los datos gesti�n y las preguntas y las guarda en los objetos
	 * axisctr_opcionesDatosGestion (las opciones seleccionables),
	 * axisctr_datosGestion (los campos no seleccionables y las respuestas del
	 * usuario) y axisctr_preguntasPoliza.
	 * 
	 * @param request    El HttpServletRequest que contiene la petici�n del cliente
	 *                   web.
	 * @param thisAction Una Action abstracta desde donde se ha invocado el servicio
	 *                   (necesaria para el log).
	 */
	public void m_form(HttpServletRequest request, AbstractDispatchAction thisAction) {
		logger.debug("Axisctr049Service m_form");
		try {
			initDatosGestion(request);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr049Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}

		BigDecimal SPRODUC = (BigDecimal) AbstractDispatchAction.topPila(request, "SPRODUC");
		String CMODO = (String) AbstractDispatchAction.topPila(request, "CMODO");
		logger.debug("aCMODO::" + CMODO);
		if (isEmpty(CMODO))
			AbstractDispatchAction.topPila(request, "CMODO", request.getSession().getAttribute("CMODO"));

		String CMODO2 = (String) AbstractDispatchAction.topPila(request, "CMODO");
		logger.debug("aCMODO::" + CMODO2);
		logger.debug("cmodo :: " + request.getSession().getAttribute("CMODO"));

		// Gesti�n de campos y dependencias
		this.configForm(request, whoami(this));
		this.cargaDependencias(request, (List) request.getAttribute("DEPENDENCIAS"));
	}

	private void initDatosGestion(HttpServletRequest request) throws Exception {
		Map opcionesDatosGestion = new HashMap();
		Map datosGestion = new HashMap();
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		String MENSAJE = getCampoTextual(request, "MENSAJE");

		if (!isEmpty(MENSAJE))
			formdata.put("TMOTRET", MENSAJE);
		// Carga de las PAC_IAX PL/SQL
		PAC_IAX_PRODUCCION pac_axis_produccion = new PAC_IAX_PRODUCCION(
				(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
		PAC_IAX_LISTVALORES pac_axis_listvalores = new PAC_IAX_LISTVALORES(
				(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

		BigDecimal SSEGURO = AxisBaseService
				.stringToBigDecimal(String.valueOf(request.getSession().getAttribute("SSEGURO")));

		Map map = pac_axis_produccion.ejecutaPAC_IAX_PRODUCCION__F_GET_DATPOLIZA(SSEGURO);
		logger.debug(map);
		Map datosPoliza = (Map) tratarRETURNyMENSAJES(request, map);
		((ArrayList) request.getSession().getAttribute(Constantes.PILA)).clear();
		AbstractDispatchAction.pushPila(request);
		AbstractDispatchAction.topPila(request, "CFORM", whoami(this));

		if (!isEmpty(datosPoliza)) {
			// Guardar SPRODUC en sesi�n para posterior llamada a
			// PAC_IAX_CFG__F_GET_FORM_WIZARD()
			request.getSession().setAttribute("SPRODUC", datosPoliza.get("SPRODUC"));
			AbstractDispatchAction.topPila(request, "SPRODUC", datosPoliza.get("SPRODUC"));
		}

		/*
		 * Map map2 = pac_axis_produccion.ejecutaPAC_IAX_PRODUCCION__F_GET_MOTRETENMOV(
		 * AxisBaseService.stringToBigDecimal(String.valueOf(request.getSession().
		 * getAttribute("SSEGURO"))) ,new BigDecimal(1)); // Metemos el ArrayList en
		 * session para poder mostralo en la pantalla List motretenmov = (List)
		 * tratarRETURNyMENSAJES(request, map2);
		 * 
		 * request.getSession().setAttribute("axisctr_motreten",
		 * !isEmpty(motretenmov.get(0)) ? motretenmov.get(0) : new HashMap());
		 */

		/* Datos gesti�n */
		/*
		 * map = pac_axis_produccion.ejecutaPAC_IAX_PRODUCCION__F_LEEDATOSGESTION();
		 * datosGestion = (Map) tratarRETURNyMENSAJES(request, map); logger.debug
		 * (datosGestion);
		 * 
		 * List cuentasTomador = new ArrayList(); /* Cuentas tomador
		 */

		// get cuenta tomadores passant-li sseguro i nordtom(ser� null) es fa per quan
		// pogui haver m�s d'un prenedor
		/*
		 * map = pac_axis_produccion.ejecutaPAC_IAX_PRODUCCION__F_GET_TOMADORCCC();
		 * logger.debug("ejecutaPAC_IAX_PRODUCCION__F_GET_TOMADORCCC()" + map);
		 */

		map = pac_axis_produccion.ejecutaPAC_IAX_PRODUCCION__F_GET_DATOS_COBRO(SSEGURO);
		logger.debug("ejecutaPAC_IAX_PRODUCCION__F_GET_DATOS_COBRO()" + map);
		datosGestion = (Map) tratarRETURNyMENSAJES(request, map);

		map = pac_axis_produccion.ejecutaPAC_IAX_PRODUCCION__F_GET_CCC_SEGURO(SSEGURO, null);
		logger.debug("ejecutaPAC_IAX_PRODUCCION__F_GET_CCC_SEGURO()" + map);

		List cuentasTomador = new ArrayList();

		// Leer el PSPERSON y establecerlo en formdata
		formdata.put("SPERSON", map.get("PSPERSON"));
		SPERSON = (BigDecimal) map.get("PSPERSON");
		if (!isEmpty(map)) {

			cuentasTomador = (List) tratarRETURNyMENSAJES(request, map);
			if (!isEmpty(cuentasTomador)) {
				formdata.put("SNIP", ((Map) cuentasTomador.get(0)).get("SNIP"));
			}
		}

		if (isEmpty(request.getSession().getAttribute("cargaHost")) && !isEmpty(cuentasTomador)) {
			opcionesDatosGestion.put("cuentasTomador", cuentasTomador);

		} else if (!isEmpty(request.getSession().getAttribute("cargaHost"))) {

			if (!isEmpty(getCampoNumerico(request, "SPERSON")))
				SPERSON = getCampoNumerico(request, "SPERSON");

			if (isEmpty(SNIP))
				SNIP = getCampoTextual(request, "SNIP");

			map = new PAC_IAX_PRODUCCION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_PRODUCCION__F_GET_CCC_HOST(SPERSON, SNIP, "SEG");
			logger.debug("ejecutaPAC_IAX_PRODUCCION__F_GET_CCC_HOST()" + map);
			if (!isEmpty(map)) {
				cuentasTomador = (List) tratarRETURNyMENSAJES(request, map);
				opcionesDatosGestion.put("cuentasTomador", cuentasTomador);
			}

		}

		/* Tipo cobro */
		map = pac_axis_listvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_TIPOCOBRO();
		logger.debug(map);
		List tipoCobro = (List) tratarRETURNyMENSAJES(request, map);
		opcionesDatosGestion.put("tipoCobro", tipoCobro);

		// Metemos el ArrayList en session para poder mostralo en la pantalla
		request.getSession().setAttribute("axisctr_opcionesDatosGestion",
				!isEmpty(opcionesDatosGestion) ? opcionesDatosGestion : new HashMap());

		request.getSession().setAttribute("axisctr_datosGestion",
				!isEmpty(datosGestion) ? datosGestion : new HashMap());

		opcionesDatosGestion = null;
		datosGestion = null;

	}

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE ACTUALIZACION
	 ********************************************/
	/*********************************************************************************************************************/

	/**
	 * Carga las cuentas del tomador y las devuelve en modo Ajax.
	 * 
	 * @param request
	 */
	public void m_ajax_cargar_cuentas_tomador(HttpServletRequest request) {
		logger.debug("Axisctr049Service m_ajax_cargar_cuentas_tomador");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();
		try {
			Map map = new PAC_IAX_PRODUCCION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_PRODUCCION__F_GET_TOMADORCCC();
			logger.debug("ejecutaPAC_IAX_PRODUCCION__F_GET_TOMADORCCC()" + map);
			if (!isEmpty(map)) {
				List cuentasTomador = (List) ajax.rellenarPlAContenedorAjax(map);
				ajax.guardarContenidoFinalAContenedorAjax(cuentasTomador);
			}
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr049Service - m�todo m_ajax_cargar_cuentas_tomador", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	public void m_ajax_cargar_cuentas_tomadorAXIS(HttpServletRequest request) {
		logger.debug("Axisctr049Service m_ajax_cargar_cuentas_tomador");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();
		try {

			BigDecimal SSEGURO = (BigDecimal) AbstractDispatchAction.topPila(request, "SSEGURO");
			Map map1 = new PAC_IAX_PRODUCCION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_PRODUCCION__TRASPASO_CCC(SSEGURO, null, SPERSON);
			logger.debug("ejecutaPAC_IAX_PRODUCCION__traspasoccc()" + map1);
			Map map = new PAC_IAX_PRODUCCION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_PRODUCCION__F_GET_TOMADORCCC();
			logger.debug("ejecutaPAC_IAX_PRODUCCION__F_GET_TOMADORCCC()" + map);
			if (!isEmpty(map)) {
				List cuentasTomador = (List) ajax.rellenarPlAContenedorAjax(map);
				ajax.guardarContenidoFinalAContenedorAjax(cuentasTomador);
			}
			request.getSession().removeAttribute("cargaHost");
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr049Service - m�todo m_ajax_cargar_cuentas_tomador", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	/**
	 * Carga las cuentas del tomador y las devuelve en modo Ajax.
	 * 
	 * @param request
	 */
	public void m_ajax_cargar_cuentas_HOST(HttpServletRequest request) {
		logger.debug("Axisctr049Service m_ajax_cargar_cuentas_HOST");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();
		try {

			SPERSON = getCampoNumerico(request, "SPERSON");
			SNIP = getCampoTextual(request, "SNIP");

			Map map = new PAC_IAX_PRODUCCION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_PRODUCCION__F_GET_CCC_HOST(SPERSON, SNIP, "SEG");
			logger.debug("ejecutaPAC_IAX_PRODUCCION__F_GET_CCC_HOST()" + map);
			if (!isEmpty(map)) {
				List cuentasTomador = (List) ajax.rellenarPlAContenedorAjax(map);

				request.getSession().setAttribute("cargaHost", "0");
				ajax.guardarContenidoFinalAContenedorAjax(cuentasTomador);
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr049Service - m�todo m_ajax_cargar_cuentas_HOST", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	public void m_cobrar(HttpServletRequest request, AbstractDispatchAction thisAction) {
		try {
			logger.debug("Axisctr049Service m_cobrar");
			UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
			Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
			PAC_IAX_PRODUCCION pac_axis_produccion = new PAC_IAX_PRODUCCION(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			logger.debug("0");
			BigDecimal SSEGURO = AxisBaseService
					.stringToBigDecimal(String.valueOf(request.getSession().getAttribute("SSEGURO")));
			BigDecimal CTIPCOB = getCampoNumerico(request, "CTIPCOB");
			String CBANCAR = getCampoTextual(request, "CBANCAR");
			logger.debug("01");
			BigDecimal CTIPBAN = null;
			try {
				if (!isEmpty(CBANCAR))
					CTIPBAN = new BigDecimal(request.getParameter("CTIPBAN_" + CBANCAR));
			} catch (Exception e) {
				logger.debug("No hay cbancar ni ctiban");
			}
			// hae falta recuperar tb el CTIPBAN - lo hacemos pregntando por los
			// n.CTIPBAN_cbancar's que nos vienen con la request

			logger.debug("02");
			// java.math.BigDecimal pPSSEGURO, java.math.BigDecimal pPNMOVIMI,
			// java.math.BigDecimal pPCTIPCOB, java.math.BigDecimal pPCTIPBAN, String
			// pPCBANCAR) throws Exception {
			// Map map =
			// pac_axis_produccion.ejecutaPAC_IAX_PRODUCCION__F_SET_COBROREC(SSEGURO,new
			// BigDecimal(1),CTIPCOB,null,CBANCAR);
			Map map = pac_axis_produccion.ejecutaPAC_IAX_PRODUCCION__F_SET_COBROREC(SSEGURO, new BigDecimal(1), CTIPCOB,
					CTIPBAN, CBANCAR);
			// Map map =
			// pac_axis_produccion.ejecutaPAC_IAX_PRODUCCION__F_COBRO_RECIBOS(SSEGURO,new
			// BigDecimal(1));
			logger.debug("03");
			logger.debug(map);
			BigDecimal ok = (BigDecimal) tratarRETURNyMENSAJES(request, map);
			logger.debug("01 :: " + ok);
			if (ok.intValue() == 0) {

				if (!isEmpty(map.get("MENSAJES"))) {
					logger.debug("1");
					request.setAttribute("MENSAJE",
							((Map) ((Map) ((List) map.get("MENSAJES")).get(0)).get("OB_IAX_MENSAJES")).get("TERROR"));
				}

				request.setAttribute("OK", new BigDecimal(0));
				logger.debug(map);
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr049Service - m�todo m_cobrar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.configForm(request, whoami(this));
		this.cargaDependencias(request, (List) request.getAttribute("DEPENDENCIAS"));

	}

	public void m_cancelar(HttpServletRequest request, AbstractDispatchAction thisAction) {
		try {
			logger.debug("Axisctr049Service m_cancelar");
			UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
			Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
			PAC_IAX_PRODUCCION pac_axis_produccion = new PAC_IAX_PRODUCCION(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			request.setAttribute("anulat", new BigDecimal(1));

			BigDecimal SSEGURO = AxisBaseService
					.stringToBigDecimal(String.valueOf(request.getSession().getAttribute("SSEGURO")));
			/*
			 * java.math.BigDecimal pPSSEGURO, java.math.BigDecimal pPNSUPLEM,
			 * java.math.BigDecimal pPCMOTMOV, String pPTOBSERVA
			 */
			Map map = pac_axis_produccion.ejecutaPAC_IAX_PRODUCCION__F_ANULARPROPUESTA(SSEGURO, new BigDecimal(0),
					new BigDecimal(512), String.valueOf(formdata.get("TMOTRET")));
			logger.debug(map);
			BigDecimal retorn = (BigDecimal) tratarRETURNyMENSAJES(request, map);
			if (!isEmpty(retorn) && retorn.intValue() == 0)
				request.setAttribute("anulat", new BigDecimal(0));

			request.setAttribute("MENSAJE",
					((Map) ((Map) ((List) map.get("MENSAJES")).get(0)).get("OB_IAX_MENSAJES")).get("TERROR"));
			logger.debug("aa--" + request.getAttribute("MENSAJE"));

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr049Service - m�todo m_cancelar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.configForm(request, whoami(this));
		this.cargaDependencias(request, (List) request.getAttribute("DEPENDENCIAS"));

	}

}
