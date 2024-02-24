package axis.service.modal;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.jdbc.PAC_IAX_RETORNO;
import axis.mvc.control.modal.Axisret001Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AjaxContainerService;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

/**
 * Axisret001Service.java 19/02/2009
 * 
 * @since Java 5.0
 */
@SuppressWarnings("all")
public class Axisret001Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE INICIALIZACION
	 *******************************************/

	/**
	 */
	public

			void m_init(HttpServletRequest request) {
		logger.debug("Axisret001Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {
		} catch (Exception e) {
			logger.error("Error en el servicio Axisret001Service - m�todo m_init", e);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));

		}
	}

	/**
	 * 
	 * @param request
	 */
	public void m_form(HttpServletRequest request, Axisret001Action thisAction) {
		logger.debug("Axisret001Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {

			this.cargarCombos(request, thisAction);
		} catch (Exception e) {
			logger.error("Error en el servicio Axisret001Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {

			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));

		}
	}

	private void cargarCombos(HttpServletRequest request, Axisret001Action thisAction) throws Exception {
		logger.debug("Axisret001Service m_cargarCombos");
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map listValores = new HashMap();
		try {

			PAC_IAX_LISTVALORES pac_axis_listValores = new PAC_IAX_LISTVALORES(
					(Connection) request.getAttribute(Constantes.DB01CONN));

			// Lista Empresas
			Map map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTEMPRESAS();
			logger.debug(map);
			listValores.put("lstempresas", tratarRETURNyMENSAJES(request, map));

			Map m = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal("230"));
			logger.debug(m);
			listValores.put("lstestados", tratarRETURNyMENSAJES(request, m));
			formdata.put("listvalores", listValores);

			BigDecimal CEMPRES = getCampoNumerico(request, "CEMPRES");
			if (isEmpty(CEMPRES) && request.getParameter("CEMPRES") == null) {
				CEMPRES = usuario.getCempres();
				formdata.put("CEMPRES", CEMPRES);
			}

			// bug 0025691: lista sucursales
			Map mapsuc = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_GET_AGENTESTIPO(new BigDecimal("2"),
					usuario.getCidioma(), null);
			logger.debug(mapsuc);
			listValores.put("LSTASUC", this.tratarRETURNyMENSAJES(request, mapsuc, false));

			// bug 0025691: lista adn
			BigDecimal PSUCURSAL = getCampoNumerico(request, "SUCURSAL");
			Map mapage = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_GET_AGENTESTIPO(new BigDecimal("3"),
					usuario.getCidioma(), null);
			logger.debug(mapage);
			listValores.put("LSTAGENTES", this.tratarRETURNyMENSAJES(request, mapage, false));

		} catch (Exception e) {
			logger.error("Error en el m�todo Axisret001Service cargarCombos", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			formdata.put("listValores", listValores);
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));

		}

	}

	public void m_buscar(HttpServletRequest request, Axisret001Action thisAction) {
		logger.debug("Axisret001Service m_buscar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {

			m_actualizar_combos(request);

			PAC_IAX_RETORNO pac_axis_retorno = new PAC_IAX_RETORNO(
					(Connection) request.getAttribute(Constantes.DB01CONN));

			String CODCONV = this.getCampoTextual(request, "CODCONV");
			String TDESCONV = this.getCampoTextual(request, "TDESCONV");
			Date FINIVIG = AxisBaseService.stringToSqlDate(getCampoTextual(request, "FINIVIG"));
			Date FFINVIG = AxisBaseService.stringToSqlDate(getCampoTextual(request, "FFINVIG"));

			BigDecimal CRAMO = this.getCampoNumerico(request, "CRAMO");
			BigDecimal SPRODUC = this.getCampoNumerico(request, "SPRODUC");
			/* Bug 25060 -- ECP -- 11/12/2012 Se cambia CAGENTE por CAGENTE_TEXT */
			BigDecimal CAGENTE = this.getCampoNumerico(request, "CAGENTE_TEXT");
			String TNOMBNF = this.getCampoTextual(request, "TNOMBNF");

			// bug 0025691
			BigDecimal ADNSUC = this.getCampoNumerico(request, "ADNSUC");
			BigDecimal SUCURSAL = this.getCampoNumerico(request, "SUCURSAL");

			logger.debug("C�digo : " + CODCONV);
			logger.debug("Descripci�n : " + TDESCONV);
			logger.debug("Producto : " + SPRODUC);
			logger.debug("Ramo : " + CRAMO);
			logger.debug("Fecha ini : " + FINIVIG);
			logger.debug("Fecha fin : " + FFINVIG);
			logger.debug("Nombre Beneficiario : " + TNOMBNF);

			// bug 0025691
			logger.debug("ADNSUC : " + ADNSUC);
			logger.debug("SUCURSAL : " + SUCURSAL);

			Map m = pac_axis_retorno.ejecutaPAC_IAX_RETORNO__F_GET_LSTCONVENIOS(CODCONV, TDESCONV, FINIVIG, FFINVIG,
					CRAMO, SPRODUC, CAGENTE, TNOMBNF, SUCURSAL, ADNSUC);
			logger.debug(m);
			ArrayList lista = (ArrayList) tratarRETURNyMENSAJES(request, m);

			request.setAttribute("lista_convenios", lista);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisret001Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}

	/*
	 * *********************************************** ACCIONES
	 * ************************************************
	 */

	/**
	 * 
	 * @param request
	 */
	@SuppressWarnings("all")
	public void m_ajax_actualizar_combos(HttpServletRequest request) {
		logger.debug("Axisret001Service m_actualizar_combos");
		AjaxContainerService ajax = new AjaxContainerService();
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map<String, Map> ajaxResponse = new HashMap<String, Map>();

		try {
			char comboOrigen = getCampoTextual(request, "comboOrigen").charAt(0);
			BigDecimal CEMPRES = getCampoNumerico(request, "CEMPRES");
			BigDecimal CRAMO = getCampoNumerico(request, "CRAMO");

			logger.debug("CEMPRES  ---------> " + CEMPRES);
			logger.debug("comboOrigen  ---------> " + comboOrigen);

			Map ramos = new HashMap();
			Map productos = new HashMap();

			PAC_IAX_LISTVALORES pacIaxListValores = new PAC_IAX_LISTVALORES(
					(Connection) request.getAttribute(Constantes.DB01CONN));

			switch (comboOrigen) {
			case 'E': // Cargar Ramos
				if (!isEmpty(CEMPRES)) {
					ramos = pacIaxListValores.ejecutaPAC_IAX_LISTVALORES__F_GET_CRAMO_EMP(CEMPRES);
					logger.debug("CARGO RAMOS ---------> " + ramos);
					ajax.rellenarPlAContenedorAjax(ramos);
					ajaxResponse.put("CRAMO", ramos);
					request.setAttribute("DOM_LSTRAMOS", tratarRETURNyMENSAJES(request, ramos));

					if (isEmpty(CRAMO)) {
						Map m = new PAC_IAX_LISTVALORES((Connection) request.getAttribute(Constantes.DB01CONN))
								.ejecutaPAC_IAX_LISTVALORES__F_GET_PRODUCTOS(getCampoTextual(request, "tipo"),
										this.getCampoNumerico(request, "CEMPRES"), null);
						logger.debug("CARGO PRODUCTOOOOOOS ---------> " + m);
						ajax.rellenarPlAContenedorAjax(m);
						ajaxResponse.put("SPRODUC", m);
						request.setAttribute("DOM_LSTPRODUCTOS", tratarRETURNyMENSAJES(request, m, false));
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
					request.setAttribute("DOM_LSTPRODUCTOS", tratarRETURNyMENSAJES(request, productos));
				}
				break;
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisret001Service - m�todo m_actualizar_combos", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			logger.debug("FINALLY");
			ajax.guardarContenidoFinalAContenedorAjax(ajaxResponse);
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());

		}
	}

	public void m_ajax_selected_sucursal(HttpServletRequest request) {
		logger.debug("Axisret001Service AJAX m_ajax_selected_sucursal");
		// bug 0025691: lista adn
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();

		try {
			BigDecimal SUCURSAL = getCampoNumerico(request, "SUCURSAL");

			logger.debug("m_ajax_selected_sucursal SUCURSAL-->" + SUCURSAL);

			PAC_IAX_LISTVALORES pac_axis_listValores = new PAC_IAX_LISTVALORES(
					(Connection) request.getAttribute(Constantes.DB01CONN));

			if (!isEmpty(SUCURSAL)) {
				Map mapage = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_GET_AGENTESTIPO(new BigDecimal("3"),
						usuario.getCidioma(), SUCURSAL);
				List tramitadIni = (List) ajax.rellenarPlAContenedorAjax(mapage);
				ajax.guardarContenidoFinalAContenedorAjax((List) tramitadIni);
			}

		} catch (Exception e) {
			logger.error("Axisret001Service m_ajax_selected_sucursal - Excepcion", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	/**
	 * 
	 * @param request
	 */
	@SuppressWarnings("all")
	public void m_actualizar_combos(HttpServletRequest request) {
		logger.debug("Axisret001Service m_actualizar_combos");

		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {

			BigDecimal CEMPRES = getCampoNumerico(request, "CEMPRES");
			BigDecimal CRAMO = getCampoNumerico(request, "CRAMO");
			BigDecimal SPRODUC = getCampoNumerico(request, "SPRODUC");

			logger.debug("CEMPRES  ---------> " + CEMPRES);
			logger.debug("CRAMO  ---------> " + CRAMO);

			formdata.put("CRAMO", CRAMO);
			formdata.put("SPRODUC", SPRODUC);

			Map ramos = new HashMap();
			Map productos = new HashMap();

			PAC_IAX_LISTVALORES pacIaxListValores = new PAC_IAX_LISTVALORES(
					(Connection) request.getAttribute(Constantes.DB01CONN));

			if (!isEmpty(CEMPRES)) {
				ramos = pacIaxListValores.ejecutaPAC_IAX_LISTVALORES__F_GET_CRAMO_EMP(CEMPRES);
				logger.debug("CARGO RAMOS ---------> " + ramos);
				request.setAttribute("DOM_LSTRAMOS", tratarRETURNyMENSAJES(request, ramos));

				if (isEmpty(CRAMO)) {
					Map m = new PAC_IAX_LISTVALORES((Connection) request.getAttribute(Constantes.DB01CONN))
							.ejecutaPAC_IAX_LISTVALORES__F_GET_PRODUCTOS(getCampoTextual(request, "tipo"),
									this.getCampoNumerico(request, "CEMPRES"), null);
					logger.debug("CARGO PRODUCTOOOOOOS ---------> " + m);
					request.setAttribute("DOM_LSTPRODUCTOS", tratarRETURNyMENSAJES(request, m, false));
				}
			}

			if (!isEmpty(CRAMO)) {
				BigDecimal CTERMFIN = BigDecimal.ZERO; // TODO: Hard-coded CTERMFIN
				productos = pacIaxListValores.ejecutaPAC_IAX_LISTVALORES__F_GET_RAMPRODUCTOS(null, CRAMO, CTERMFIN);
				logger.debug(productos);
				request.setAttribute("DOM_LSTPRODUCTOS", tratarRETURNyMENSAJES(request, productos));
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisret001Service - m�todo m_actualizar_combos", e);

		} finally {
			logger.debug("FINALLY");

		}
	}

}
