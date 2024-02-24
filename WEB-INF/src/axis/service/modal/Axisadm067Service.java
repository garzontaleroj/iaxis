package axis.service.modal;

import java.math.BigDecimal;
import java.sql.Date;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_COMMON;
import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.jdbc.PAC_IAX_PRENOTIFICACIONES;
import axis.jdbc.SINPAQUETE;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AjaxContainerService;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

public class Axisadm067Service extends AxisBaseService {
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
	public void m_form(HttpServletRequest request) {
		logger.debug("Axisadm067Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {

			formdata.remove("SPROCDOM");
			request.removeAttribute("SPROCDOM");

			Map LISTVALORES = new HashMap();

			PAC_IAX_LISTVALORES pacIaxListValores = new PAC_IAX_LISTVALORES(
					((java.sql.Connection) request.getAttribute(Constantes.DB01CONN)));
			Map map = pacIaxListValores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTEMPRESAS();
			logger.debug(map);
			LISTVALORES.put("LSTEMPRESAS", tratarRETURNyMENSAJES(request, map));
			formdata.put("LISTVALORES", LISTVALORES);
			formdata.put("CEMPRES", usuario.getCempres());

			/*
			 * ArrayList a = (ArrayList) tratarRETURNyMENSAJES(request, map); if (a.size()
			 * == 1) { if (!isEmpty(usuario.getCempres())) { Map ramos =
			 * pacIaxListValores.ejecutaPAC_IAX_LISTVALORES__F_GET_CRAMO_EMP(usuario.
			 * getCempres()); logger.debug(ramos);
			 * request.getSession().setAttribute("DOM_LSTRAMOS",
			 * tratarRETURNyMENSAJES(request, ramos,false)); } }
			 */

			BigDecimal CRAMO = this.getCampoNumerico(request, "CRAMO");
			BigDecimal CEMPRES = this.getCampoNumerico(request, "CEMPRES");

			BigDecimal SPRODUC = this.getCampoNumerico(request, "SPRODUC");
			BigDecimal SPROCAR = this.getCampoNumerico(request, "SPROCAR");

			if (!isEmpty(CEMPRES)) {
				Map ramos = pacIaxListValores.ejecutaPAC_IAX_LISTVALORES__F_GET_CRAMO_EMP(usuario.getCempres());
				logger.debug(ramos);
				request.getSession().setAttribute("DOM_LSTRAMOS", tratarRETURNyMENSAJES(request, ramos, false));

				// bug 18825/90046
				// Map cobbancario =
				// pacIaxListValores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTCOBRADORES(CEMPRES);
				// Inici BFP 28/12/2011 bug 20544/101990
				Map cobbancario = pacIaxListValores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTDESCCOBRADORES(CEMPRES);
				// Fi BFP 28/12/2011 bug 20544/101990
				logger.debug(cobbancario);
				request.getSession().setAttribute("DOM_LSTCCOBBAN", tratarRETURNyMENSAJES(request, cobbancario, false));
			}

			// bug 18825/90046
			Map bancos = pacIaxListValores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTBANCOS(null, null);
			logger.debug(bancos);
			request.getSession().setAttribute("DOM_LSTCBANCO", tratarRETURNyMENSAJES(request, bancos, false));

			Map ctipcuenta = pacIaxListValores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(274));
			logger.debug(ctipcuenta);
			request.getSession().setAttribute("DOM_LSTCTIPCUENTA", tratarRETURNyMENSAJES(request, ctipcuenta, false));

			logger.debug(CEMPRES + "m_form CEMPRES");

			if (isEmpty(CRAMO)) {
				Map m = new PAC_IAX_LISTVALORES(((java.sql.Connection) request.getAttribute(Constantes.DB01CONN)))
						.ejecutaPAC_IAX_LISTVALORES__F_GET_PRODUCTOS(getCampoTextual(request, "tipo"), CEMPRES, null);
				logger.debug(m);
				request.getSession().setAttribute("DOM_LSTPRODUCTOS", tratarRETURNyMENSAJES(request, m, false));
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm067Service - m�todo m_form", e);
			AbstractDispatchAction.guardarMensaje(request,
					"verbatim:<b>" + e.getClass().getName() + ":</b> " + e.getLocalizedMessage(),
					new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	public void m_obtener_marcados(HttpServletRequest request, BigDecimal SPROCES) {
		logger.debug("Axisadm067Service m_domiciliar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		AjaxContainerService ajax = new AjaxContainerService();
		Map ajaxResponse = new HashMap();

		try {

			String CADENA = getCampoTextual(request, "CADENA");
			BigDecimal CEMPRES = getCampoNumerico(request, "CEMPRES");
			String[] cadena = CADENA.split(";");

			PAC_IAX_PRENOTIFICACIONES pac_iax_adm = new PAC_IAX_PRENOTIFICACIONES(
					((java.sql.Connection) request.getAttribute(Constantes.DB01CONN)));

			String LISTA_REC = "";
			for (int i = 0; i < cadena.length; i++) {
				BigDecimal SELEC = getCampoNumerico(request, "SELEC_" + i);
				if (SELEC.intValue() != 0) { // La casilla est� seleccionada

					// Llamar a la funci�n para actualizar los valores
					Map mapa = pac_iax_adm.ejecutaPAC_IAX_PRENOTIFICACIONES__F_SET_PRODDOMIS(CEMPRES, SPROCES,
							new BigDecimal(cadena[i]), new BigDecimal("1"));
					logger.debug(mapa);
					BigDecimal resultado = (BigDecimal) tratarRETURNyMENSAJES(request, mapa);
				}

			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm003Service - m�todo m_unificar_recibos", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
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
	public void borrarAtributosSession(HttpServletRequest request) {
		logger.debug("Axisadm067Service borrarAtributosSession");

		/* Quitar datos de otras b�squedas que hayan quedado en Session */
		Enumeration<String> attributeNames = request.getSession().getAttributeNames();

		while (attributeNames.hasMoreElements()) {
			String attribute = attributeNames.nextElement();
			if (attribute.startsWith("DOM_"))
				request.getSession().removeAttribute(attribute);
		}
		this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
	}

	/**
	 * 
	 * @param request
	 */
	@SuppressWarnings("all")
	public void m_ajax_actualizar_combos(HttpServletRequest request) {
		logger.debug("Axisadm067Service m_actualizar_combos");
		AjaxContainerService ajax = new AjaxContainerService();
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map<String, Map> ajaxResponse = new HashMap<String, Map>();

		try {
			char comboOrigen = getCampoTextual(request, "comboOrigen").charAt(0);
			BigDecimal CEMPRES = getCampoNumerico(request, "CEMPRES");
			BigDecimal CRAMO = getCampoNumerico(request, "CRAMO");

			Map ramos = new HashMap();
			Map productos = new HashMap();

			PAC_IAX_LISTVALORES pacIaxListValores = new PAC_IAX_LISTVALORES(
					((java.sql.Connection) request.getAttribute(Constantes.DB01CONN)));

			switch (comboOrigen) {
			case 'E': // Cargar Ramos
				if (!isEmpty(CEMPRES)) {
					ramos = pacIaxListValores.ejecutaPAC_IAX_LISTVALORES__F_GET_CRAMO_EMP(CEMPRES);
					logger.debug(ramos);
					ajax.rellenarPlAContenedorAjax(ramos);
					ajaxResponse.put("CRAMO", ramos);
					request.getSession().setAttribute("DOM_LSTRAMOS", tratarRETURNyMENSAJES(request, ramos));

					if (isEmpty(CRAMO)) {
						Map m = new PAC_IAX_LISTVALORES(
								((java.sql.Connection) request.getAttribute(Constantes.DB01CONN)))
								.ejecutaPAC_IAX_LISTVALORES__F_GET_PRODUCTOS(getCampoTextual(request, "tipo"),
										this.getCampoNumerico(request, "CEMPRES"), null);
						ajax.rellenarPlAContenedorAjax(m);
						ajaxResponse.put("SPRODUC", m);
						request.getSession().setAttribute("DOM_LSTPRODUCTOS", tratarRETURNyMENSAJES(request, m, false));
					}
				}
				break;

			case 'R': // Cargar Productos
				if (!isEmpty(CRAMO)) {
					BigDecimal CTERMFIN = BigDecimal.ZERO; // TODO: Hard-coded CTERMFIN
					productos = pacIaxListValores.ejecutaPAC_IAX_LISTVALORES__F_GET_RAMPRODUCTOS(null, CRAMO, CTERMFIN);
					logger.debug(productos);
					ajax.rellenarPlAContenedorAjax(productos);
					ajaxResponse.put("SPRODUC", productos);
					request.getSession().setAttribute("DOM_LSTPRODUCTOS", tratarRETURNyMENSAJES(request, productos));
				} else {
					Map m = new PAC_IAX_LISTVALORES(((java.sql.Connection) request.getAttribute(Constantes.DB01CONN)))
							.ejecutaPAC_IAX_LISTVALORES__F_GET_PRODUCTOS(getCampoTextual(request, "tipo"),
									this.getCampoNumerico(request, "CEMPRES"), null);
					ajax.rellenarPlAContenedorAjax(m);
					ajaxResponse.put("SPRODUC", m);
					request.getSession().setAttribute("DOM_LSTPRODUCTOS", tratarRETURNyMENSAJES(request, m, false));
				}
				break;
			}

			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));

		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm067Service - m�todo m_actualizar_combos", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			ajax.guardarContenidoFinalAContenedorAjax(ajaxResponse);
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	/**
	 * @param request
	 */
	public void m_consultar(HttpServletRequest request) {
		logger.debug("Axisadm067Service m_consultar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {

			BigDecimal SPROCES = getCampoNumerico(request, "SPROCES");
			BigDecimal CEMPRES = getCampoNumerico(request, "CEMPRES");
			BigDecimal CRAMO = getCampoNumerico(request, "CRAMO");
			BigDecimal SPRODUC = getCampoNumerico(request, "SPRODUC");
			Date FEFECTO = stringToSqlDate(getCampoTextual(request, "FEFECTO"));

			// bug 18825/90046
			BigDecimal CCOBBAN = getCampoNumerico(request, "CCOBBAN");
			BigDecimal CBANCO = getCampoNumerico(request, "CBANCO");
			BigDecimal CTIPCUENTA = getCampoNumerico(request, "CTIPCUENTA");
			String FVENTAR = getCampoTextual(request, "FVENTAR");
			String CREFERENCIA = getCampoTextual(request, "CREFERENCIA");
			//
			Date DFEFECTO = stringToSqlDate(getCampoTextual(request, "DFEFECTO"));

			m_obtener_marcados(request, SPROCES);

			/* OBTENER DATO PROCESO */

			Map map = new PAC_IAX_PRENOTIFICACIONES(((java.sql.Connection) request.getAttribute(Constantes.DB01CONN)))
					.ejecutaPAC_IAX_PRENOTIFICACIONES__F_GET_PROCESO();
			logger.debug(map);
			BigDecimal SPROCDOM = (BigDecimal) map.get("PSPROCES");

			map = new PAC_IAX_PRENOTIFICACIONES(((java.sql.Connection) request.getAttribute(Constantes.DB01CONN)))
					.ejecutaPAC_IAX_PRENOTIFICACIONES__F_GET_DOMICILIACION(SPROCES, CEMPRES, CRAMO, SPRODUC, FEFECTO,
							SPROCDOM, CCOBBAN, CBANCO, CTIPCUENTA, FVENTAR, CREFERENCIA, DFEFECTO);

			logger.debug(map);

			List<Map> LST_DOMICILIACIONES = (List<Map>) tratarRETURNyMENSAJES(request, map);

			if (!isEmpty(LST_DOMICILIACIONES)) {
				SINPAQUETE sinPaquete = new SINPAQUETE(
						((java.sql.Connection) request.getAttribute(Constantes.DB01CONN)));
				PAC_IAX_COMMON pacIaxCommon = new PAC_IAX_COMMON(
						((java.sql.Connection) request.getAttribute(Constantes.DB01CONN)));

				for (Map registro : LST_DOMICILIACIONES) {
					// Recuperar descripci�n empresa
					/*
					 * BigDecimal EMPRESA = (BigDecimal) registro.get("EMPRESA");
					 * 
					 * if (!isEmpty(EMPRESA)) { map = sinPaquete.ejecutaF_DESEMPRESA(EMPRESA, null,
					 * ""); if (BigDecimal.ZERO.equals(tratarRETURNyMENSAJES(request, map)))
					 * registro.put("EMPRESA", map.get("PTEMPRES")); }
					 * 
					 * // Formatear COBRADOR String COBRADOR = (String) registro.get("COBRADOR");
					 * BigDecimal CTIPBAN_COBRA = (BigDecimal) registro.get("CTIPBAN_COBRA");
					 * 
					 * if (!isEmpty(CTIPBAN_COBRA) && !isEmpty(COBRADOR)) { registro.put("COBRADOR",
					 * tratarRETURNyMENSAJES(request,
					 * pacIaxCommon.ejecutaPAC_IAX_COMMON__F_FORMATCCC(CTIPBAN_COBRA, COBRADOR))); }
					 */

					// Formatear CCC
					String CBANCAR = (String) registro.get("CBANCAR");
					BigDecimal CTIPBAN_CBAN = (BigDecimal) registro.get("CTIPBAN_CBAN");

					if (!isEmpty(CTIPBAN_CBAN) && !isEmpty(CBANCAR)) {
						registro.put("CBANCAR", tratarRETURNyMENSAJES(request,
								pacIaxCommon.ejecutaPAC_IAX_COMMON__F_FORMATCCC(CTIPBAN_CBAN, CBANCAR)));
					}

					/*
					 * @deprecated Mostrar fichero por pantalla, no se usa. // Recuperar FICHERO
					 * String FICHERO = (String) registro.get("FICHERO"); if (!isEmpty(FICHERO))
					 * request.getSession().setAttribute("miFICHERO", FICHERO);
					 */

				}
			}

			request.setAttribute("LST_DOMICILIACIONES", LST_DOMICILIACIONES);
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));

		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm067Service - m�todo m_consultar", e);
			AbstractDispatchAction.guardarMensaje(request,
					"verbatim:<b>" + e.getClass().getName() + ":</b> " + e.getLocalizedMessage(),
					new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

	/**
	 * @param request
	 */
	public void m_domiciliar(HttpServletRequest request) {
		logger.debug("Axisadm067Service m_domiciliar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();
		Map ajaxResponse = new HashMap();

		try {

			BigDecimal SPROCDOM = getCampoNumerico(request, "SPROCDOM");
			BigDecimal SPROCES = getCampoNumerico(request, "SPROCES");
			BigDecimal CEMPRES = getCampoNumerico(request, "CEMPRES");
			BigDecimal CRAMO = getCampoNumerico(request, "CRAMO");
			BigDecimal SPRODUC = getCampoNumerico(request, "SPRODUC");
			Date FEFECTO = stringToSqlDate(getCampoTextual(request, "FEFECTO"));
			Date FFECCOB = stringToSqlDate(getCampoTextual(request, "FFECCOB"));

			Map map = new PAC_IAX_PRENOTIFICACIONES(((java.sql.Connection) request.getAttribute(Constantes.DB01CONN)))
					.ejecutaPAC_IAX_PRENOTIFICACIONES__F_DOMICILIAR(SPROCES, CEMPRES, FEFECTO, FFECCOB, CRAMO, SPRODUC,
							null, null, null, null, null, null, null);
			logger.debug(map);

			ajax.rellenarPlAContenedorAjax(map);

			/*
			 * @deprecated Mostrar fichero por pantalla, no se usa. /* if
			 * (BigDecimal.ZERO.equals(map.get("RETURN"))) { ajaxResponse.put("FICHERO",
			 * request.getSession().getAttribute("miFICHERO"));
			 * request.getSession().setAttribute("FICHERO",
			 * request.getSession().getAttribute("miFICHERO")); }
			 */
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm067Service - m�todo m_domiciliar", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			ajax.guardarContenidoFinalAContenedorAjax(ajaxResponse);
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

}
