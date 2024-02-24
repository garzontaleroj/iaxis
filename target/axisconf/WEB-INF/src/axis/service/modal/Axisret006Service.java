package axis.service.modal;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.jdbc.PAC_IAX_PERSONA;
import axis.jdbc.PAC_IAX_RETORNO;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.control.modal.Axisret006Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AjaxContainerService;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

/**
 * Axisret004Service.java 19/02/2009
 * 
 * @since Java 5.0
 */
@SuppressWarnings("all")
public class Axisret006Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE INICIALIZACION
	 *******************************************/

	public void m_buscarpersonaajaxjson(HttpServletRequest request, Axisret006Action thisAction) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {

			// JLV 13/06/2013 bug 27267/146266 se cambia personas PERSONAS_PRIVADAS por
			// PERSONAS_PUBPRIV para que muestre
			// en los beneficiarios a las personas sin restricciones
			String MODO_SWPUBLI = "PERSONAS_PUBPRIV";
			String v = request.getParameter("v");
			logger.debug("v:" + v);

			PAC_IAX_PERSONA pAC_IAX_PERSONA = new PAC_IAX_PERSONA(
					(Connection) request.getAttribute(Constantes.DB01CONN));
			Map map = pAC_IAX_PERSONA.ejecutaPAC_IAX_PERSONA__F_GET_PERSONAS_GENERICA_COND(v, null, null, null, null,
					null, null, null, MODO_SWPUBLI, null);
			logger.debug(map);
			if (map == null) {
				logger.debug("Axisret006Service m_buscarpersonaajaxjson - fin");
				return;
			}

			ArrayList lst = (ArrayList) map.get("RETURN");
			HashMap miDataObject = (HashMap) lst.get(0);

			// SPERSON=(BigDecimal)lstmap.get("CODI");

			request.setAttribute(Constantes.AJAXCONTAINER, miDataObject);

		} catch (Exception e) {
			logger.error("Error.", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		} finally {
			// this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	/**
	 */
	public

			void m_init(HttpServletRequest request) {
		logger.debug("Axisret006Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {
		} catch (Exception e) {
			logger.error("Error en el servicio Axisret006Service - m�todo m_init", e);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));

		}
	}

	/**
	 * 
	 * @param request
	 */
	public void m_form(HttpServletRequest request, Axisret006Action thisAction) {
		logger.debug("Axisret004Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {

			this.cargarCombos(request, thisAction);
		} catch (Exception e) {
			logger.error("Error en el servicio Axisret004Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {

			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));

		}
	}

	private void cargarCombos(HttpServletRequest request, Axisret006Action thisAction) throws Exception {
		logger.debug("Axisret004Service m_cargarCombos");
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

		} catch (Exception e) {
			logger.error("Error en el m�todo Axisret004Service cargarCombos", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			formdata.put("listValores", listValores);
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));

		}

	}

	public void m_buscar(HttpServletRequest request, Axisret006Action thisAction) {
		logger.debug("Axisret004Service m_buscar");
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
			BigDecimal CAGENTE = this.getCampoNumerico(request, "CAGENTE");
			String TNOMBNF = this.getCampoTextual(request, "TNOMBNF");
			logger.debug("C�digo : " + CODCONV);
			logger.debug("Descripci�n : " + TDESCONV);
			logger.debug("Producto : " + SPRODUC);
			logger.debug("Ramo : " + CRAMO);
			logger.debug("Fecha ini : " + FINIVIG);
			logger.debug("Fecha fin : " + FFINVIG);
			logger.debug("Nombre Beneficiario : " + TNOMBNF);

			// bug 0025691
			Map m = pac_axis_retorno.ejecutaPAC_IAX_RETORNO__F_GET_LSTCONVENIOS(CODCONV, TDESCONV, FINIVIG, FFINVIG,
					CRAMO, SPRODUC, CAGENTE, TNOMBNF, null, null);
			logger.debug(m);
			ArrayList lista = (ArrayList) tratarRETURNyMENSAJES(request, m);

			request.setAttribute("lista_convenios", lista);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisret004Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}

	public void m_aceptar(HttpServletRequest request, Axisret006Action thisAction) {
		logger.debug("Axisret006Service m_aceptar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {

			m_actualizar_combos(request);

			PAC_IAX_RETORNO pac_axis_retorno = new PAC_IAX_RETORNO(
					(Connection) request.getAttribute(Constantes.DB01CONN));

			BigDecimal IDCONVENIO = this.getCampoNumerico(request, "IDCONVENIO");
			BigDecimal SPERSON = this.getCampoNumerico(request, "SPERSON");
			BigDecimal PRETORNO = this.getCampoNumerico(request, "PRETORNO");

			// bug 0025580
			// bug 0025815
			Map m = pac_axis_retorno.ejecutaPAC_IAX_RETORNO__F_SET_BENEFCONVENIO(IDCONVENIO, SPERSON, PRETORNO);

			logger.debug(m);

			BigDecimal resultado = (BigDecimal) tratarRETURNyMENSAJES(request, m);

			if (resultado.intValue() == 0) {
				formdata.put("OK", "OK");
			} else {
				formdata.put("OK", "KO");
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisret004Service - m�todo m_form", e);
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
		logger.debug("Axisret006Service m_actualizar_combos");
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
			logger.error("Error en el servicio Axisret004Service - m�todo m_actualizar_combos", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			logger.debug("FINALLY");
			ajax.guardarContenidoFinalAContenedorAjax(ajaxResponse);
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());

		}
	}

	/**
	 * 
	 * @param request
	 */
	@SuppressWarnings("all")
	public void m_actualizar_combos(HttpServletRequest request) {
		logger.debug("Axisret006Service m_actualizar_combos");

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
			logger.error("Error en el servicio Axisret006Service - m�todo m_actualizar_combos", e);

		} finally {
			logger.debug("FINALLY");

		}
	}

	public void m_ajax_actualizar_persona(HttpServletRequest request, Axisret006Action thisAction) {
		logger.debug("Axisctr038Service m_ajax_actualizar_persona");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		AjaxContainerService ajax = new AjaxContainerService();

		try {
			BigDecimal SPERSON = this.getCampoNumerico(request, "SPERSON"); // (BigDecimal)
																			// AbstractDispatchAction.topPila(request,
																			// "SSEGURO");
			BigDecimal CAGENTE = this.getCampoNumerico(request, "CAGENTE1"); // (BigDecimal)
																				// AbstractDispatchAction.topPila(request,
																				// "SSEGURO");
			Map map = new PAC_IAX_PERSONA((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_PERSONA__F_GET_PERSONA(SPERSON, CAGENTE);
			logger.debug("get PERSONA()" + map);
			BigDecimal RETURN = (BigDecimal) tratarRETURNyMENSAJES(request, map);
			if (!isEmpty(map) && new BigDecimal(0).equals(RETURN)) {
				// ajax.rellenarPlAContenedorAjax((Map)map.get("OBPERSONA"));
				Map OB_PERSONA = (Map) map.get("OBPERSONA");
				logger.debug(OB_PERSONA);
				ajax.rellenarPlAContenedorAjax(map);

				ajax.guardarContenidoFinalAContenedorAjax(OB_PERSONA);
			}

		} catch (Exception e) {
			logger.error("Axisctr038Service m_ajax_actualizar_persona - Excepcion", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

}
