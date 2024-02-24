package axis.service.modal;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.jdbc.PAC_IAX_RENTAS;
import axis.mvc.control.modal.Axisren001Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AjaxContainerService;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

/**
 * Axisren001Service.java 19/02/2009
 * 
 * @since Java 5.0
 */
@SuppressWarnings("all")
public class Axisren001Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE INICIALIZACION
	 *******************************************/

	/**
	 */
	public

			void m_init(HttpServletRequest request) {
		logger.debug("Axisren001Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {
		} catch (Exception e) {
			logger.error("Error en el servicio Axisren001Service - m�todo m_init", e);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));

		}
	}

	/**
	 * 
	 * @param request
	 */
	public void m_form(HttpServletRequest request, Axisren001Action thisAction) {
		logger.debug("Axisren001Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {

			this.cargarCombos(request, thisAction);
		} catch (Exception e) {
			logger.error("Error en el servicio Axisren001Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {

			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));

		}
	}

	private void cargarCombos(HttpServletRequest request, Axisren001Action thisAction) throws Exception {
		logger.debug("Axisren001Service m_cargarCombos");
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map listValores = new HashMap();
		try {

			PAC_IAX_LISTVALORES pac_axis_listValores = new PAC_IAX_LISTVALORES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

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
			logger.error("Error en el m�todo Axisren001Service cargarCombos", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			formdata.put("listValores", listValores);
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));

		}

	}

	public void m_buscar(HttpServletRequest request, Axisren001Action thisAction) {
		logger.debug("Axisren001Service m_buscar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {

			/*
			 * BigDecimal SSEGURO=getCampoNumerico(request, "SSEGURO"); BigDecimal
			 * SRECREN=getCampoNumerico(request, "SRECREN");
			 * 
			 * Map mapa_cabecera=new
			 * PAC_IAX_RENTAS((java.sql.Connection)request.getAttribute(Constantes.DB01CONN)
			 * ).ejecutaPAC_IAX_RENTAS__F_GET_CAB_RENTA(SSEGURO);
			 * logger.debug(mapa_cabecera);
			 * 
			 * 
			 * Map mapa_cuerpo=new
			 * PAC_IAX_RENTAS((java.sql.Connection)request.getAttribute(Constantes.DB01CONN)
			 * ).ejecutaPAC_IAX_RENTAS__F_GET_PAGORENTA(SRECREN); logger.debug(mapa_cuerpo);
			 */

			m_actualizar_combos(request);

			PAC_IAX_RENTAS pac_axis_rentas = new PAC_IAX_RENTAS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			BigDecimal NPOLIZA = this.getCampoNumerico(request, "NPOLIZA");
			BigDecimal CESTADO = this.getCampoNumerico(request, "CESTADO");
			BigDecimal SPRODUC = this.getCampoNumerico(request, "SPRODUC");
			BigDecimal NCERTIF = this.getCampoNumerico(request, "NCERTIF");
			BigDecimal CEMPRES = this.getCampoNumerico(request, "CEMPRES");
			logger.debug("P�liza : " + NPOLIZA);
			logger.debug("Cramo : " + CESTADO);
			logger.debug("Producto : " + SPRODUC);
			logger.debug("Certificado : " + NCERTIF);
			logger.debug("Empresa : " + CEMPRES);

			Map m = pac_axis_rentas.ejecutaPAC_IAX_RENTAS__F_GET_CONSULTAPAGOSRENTA(CEMPRES, SPRODUC, NPOLIZA, NCERTIF,
					CESTADO);
			logger.debug(m); // (CEMPRES,CRAMO,SPRODUC,NPOLIZA,NCERTIF);
			BigDecimal resultado = (BigDecimal) tratarRETURNyMENSAJES(request, m);
			ArrayList lista = (ArrayList) m.get("OTPAGORENTA");

			request.setAttribute("lista_rentas", lista);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisren001Service - m�todo m_form", e);
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
		logger.debug("Axisadm054Service m_actualizar_combos");
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
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			switch (comboOrigen) {
			case 'E': // Cargar Ramos
				if (!isEmpty(CEMPRES)) {
					ramos = pacIaxListValores.ejecutaPAC_IAX_LISTVALORES__F_GET_CRAMO_EMP(CEMPRES);
					logger.debug("CARGO RAMOS ---------> " + ramos);
					ajax.rellenarPlAContenedorAjax(ramos);
					ajaxResponse.put("CRAMO", ramos);
					request.setAttribute("DOM_LSTRAMOS", tratarRETURNyMENSAJES(request, ramos));

					if (isEmpty(CRAMO)) {
						Map m = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
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
			logger.error("Error en el servicio Axisadm036Service - m�todo m_actualizar_combos", e);
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
		logger.debug("Axisadm054Service m_actualizar_combos");

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
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			if (!isEmpty(CEMPRES)) {
				ramos = pacIaxListValores.ejecutaPAC_IAX_LISTVALORES__F_GET_CRAMO_EMP(CEMPRES);
				logger.debug("CARGO RAMOS ---------> " + ramos);
				request.setAttribute("DOM_LSTRAMOS", tratarRETURNyMENSAJES(request, ramos));

				if (isEmpty(CRAMO)) {
					Map m = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
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
			logger.error("Error en el servicio Axisadm036Service - m�todo m_actualizar_combos", e);

		} finally {
			logger.debug("FINALLY");

		}
	}

}
