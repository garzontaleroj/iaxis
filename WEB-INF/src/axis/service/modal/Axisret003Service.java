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
import axis.mvc.control.modal.Axisret003Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AjaxContainerService;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

/**
 * Axisret003Service.java 19/02/2009
 * 
 * @since Java 5.0
 */
@SuppressWarnings("all")
public class Axisret003Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE INICIALIZACION
	 *******************************************/

	/**
	 */
	public

			void m_init(HttpServletRequest request, Axisret003Action thisAction) {
		logger.debug("Axisret003Service m_init");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {
		} catch (Exception e) {
			logger.error("Error en el servicio Axisret003Service - m�todo m_init", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));

		}
	}

	/**
	 * 
	 * @param request
	 */
	public void m_form(HttpServletRequest request, Axisret003Action thisAction) {
		logger.debug("Axisret003Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {
			// bug 0024892
			String vok = (String) formdata.get("OK");
			logger.debug("Axisret003Service m_form vok--> " + vok);

			if (vok != "ERROR") {
				this.cargarCombos(request, thisAction);
				String CODCONV = getCampoTextual(request, "CODCONV_SEL");
				String TDESCONV = getCampoTextual(request, "TDESCONV_SEL");
				String CUSERAUT = getCampoTextual(request, "CUSERAUT_SEL");
				Date FINIVIG = AxisBaseService.stringToSqlDate(getCampoTextual(request, "FINIVIG_SEL"));
				Date FFINVIG = AxisBaseService.stringToSqlDate(getCampoTextual(request, "FFINVIG_SEL"));

				BigDecimal DEC_SPERSON = getCampoNumerico(request, "SPERSON");
				String NNUMIDE = getCampoTextual(request, "NNUMIDE");
				String NOMBRE_TEXT = getCampoTextual(request, "TNOMTOM");

				logger.debug(
						"Axisret003Service 89 m_form per=" + DEC_SPERSON + " ide=" + NNUMIDE + " nom=" + NOMBRE_TEXT);

				formdata.remove("CODCONV");
				formdata.remove("TDESCONV");
				formdata.remove("CUSERAUT");
				formdata.remove("FINIVIG");
				formdata.remove("FFINVIG");

				formdata.remove("DEC_SPERSON");
				formdata.remove("NNUMIDE");
				formdata.remove("NOMBRE_TEXT");

				formdata.put("CODCONV", CODCONV);
				formdata.put("TDESCONV", TDESCONV);
				formdata.put("CUSERAUT", CUSERAUT);
				formdata.put("FINIVIG", FINIVIG);
				formdata.put("FFINVIG", FFINVIG);

				formdata.put("DEC_SPERSON", DEC_SPERSON);
				formdata.put("NNUMIDE", NNUMIDE);
				formdata.put("NOMBRE_TEXT", NOMBRE_TEXT);
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisret003Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {

			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));

		}
	}

	private void cargarCombos(HttpServletRequest request, Axisret003Action thisAction) throws Exception {
		logger.debug("Axisret003Service m_cargarCombos");
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
			logger.error("Error en el m�todo Axisret003Service cargarCombos", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			formdata.put("listValores", listValores);
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));

		}

	}

	public void m_buscar(HttpServletRequest request, Axisret003Action thisAction) {
		logger.debug("Axisret003Service m_buscar");
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
			logger.error("Error en el servicio Axisret003Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}

	public void m_aceptar(HttpServletRequest request, Axisret003Action thisAction) {
		logger.debug("Axisret003Service m_aceptar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {
			this.cargarCombos(request, thisAction);

			PAC_IAX_RETORNO pac_axis_retorno = new PAC_IAX_RETORNO(
					(Connection) request.getAttribute(Constantes.DB01CONN));

			BigDecimal IDCONVENIO = this.getCampoNumerico(request, "IDCONVENIO");
			String CCODCONV = this.getCampoTextual(request, "CODCONV");
			String TDESCONV = this.getCampoTextual(request, "TDESCONV");
			Date FINIVIG = AxisBaseService.stringToSqlDate(getCampoTextual(request, "FINIVIG"));
			Date FFINVIG = AxisBaseService.stringToSqlDate(getCampoTextual(request, "FFINVIG"));
			// bug 0025815
			BigDecimal SPERSON = this.getCampoNumerico(request, "DEC_SPERSON");

			Map m = pac_axis_retorno.ejecutaPAC_IAX_RETORNO__F_SET_DATCONVENIO(IDCONVENIO, CCODCONV, TDESCONV, FINIVIG,
					FFINVIG, SPERSON);

			logger.debug(m);
			BigDecimal id_convenio = (BigDecimal) m.get("PIDCONVENIO_OUT");
			BigDecimal resultado = (BigDecimal) tratarRETURNyMENSAJES(request, m);

			if (resultado.intValue() == 0) {
				formdata.put("OK", "OK");
				logger.debug("Axisret003Service m_aceptar resultado es : OK");
			} else {
				formdata.put("OK", "ERROR");
				logger.debug("Axisret003Service m_aceptar resultado es : kokokokokokokokokokokokokokokokokokokokoko");
			}

			if (id_convenio != null) {
				formdata.put("IDCONVENIO", id_convenio);
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisret003Service - m�todo m_aceptar", e);
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
		logger.debug("Axisret003Service m_actualizar_combos");
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
			logger.error("Error en el servicio Axisret003Service - m�todo m_actualizar_combos", e);
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
		logger.debug("Axisret003Service m_actualizar_combos");

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
			logger.error("Error en el servicio Axisret003Service - m�todo m_actualizar_combos", e);

		} finally {
			logger.debug("FINALLY");

		}
	}

	public void m_ajax_get_persona(HttpServletRequest request) {
		logger.debug("Axisret003Service AJAX m_ajax_get_persona");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {
			PAC_IAX_PERSONA pac_axis_persona = new PAC_IAX_PERSONA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			request.getSession().removeAttribute("SPERSON_ALTA");
			BigDecimal SPERSON = getCampoNumerico(request, "SPERSON");
			BigDecimal CAGENTE = usuario.getCagente();
			String PMODE = new String("POL");

			Map map = new PAC_IAX_PERSONA((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_PERSONA__F_GET_PERSONA_AGENTE(SPERSON, CAGENTE, PMODE);

			logger.debug("get PERSONA()" + map);
			Map OB_PERSONA = (Map) map.get("OBPERSONA");
			logger.debug("---> get OB_PERSONA:" + OB_PERSONA);

			formdata.putAll(OB_PERSONA);

			ajax.rellenarPlAContenedorAjax(map);
			ajax.guardarContenidoFinalAContenedorAjax(map);

		} catch (Exception e) {
			logger.error("Axisret003Service m_ajax_get_persona - Excepcion", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

}
