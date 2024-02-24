package axis.service.modal;

import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_CONTABILIDAD;
import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.jdbc.PAC_IAX_MAP;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AjaxContainerService;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

/**
 * Axisrmb001Service.java 20/08/2008
 * 
 * @author <a href="lcalvo@csi-ti.com">Luz Calvo</a>
 * @since Java 5.0
 */
public class Axisadm007Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());
	SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");

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
	public void m_init(HttpServletRequest request) {
		logger.debug("Axisrmb001Service m_form");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		try {

			request.getSession().removeAttribute("ORDEN_LINEA");

		} catch (Exception e) {
			logger.error("Error en el servicio Axisrmb001Service - m�todo m_form", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	/**
	 * 
	 * @param request
	 */
	@SuppressWarnings("all")
	public void m_form(HttpServletRequest request) {
		logger.debug("Axisrmb001Service m_form");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		try {

			BigDecimal ORDEN_LINEA = getCampoNumerico(request, "ORDEN_LINEA");
			request.getSession().setAttribute("ORDEN_LINEA", ORDEN_LINEA);
			// this.cargaListaAsientos(request);
			this.cargaListaConceptos(request);
			this.cargaListaCuentas(request);
			// this.cargaListaPaises(request);
			// Cargar lista de apuntes de cada movimiento
			this.m_consultar(request);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisrmb001Service - m�todo m_form", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
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
	public void m_consultar(HttpServletRequest request) {
		logger.debug("Axisrmb001Service m_buscar");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {

			PAC_IAX_CONTABILIDAD pac_iax_reembolsos = new PAC_IAX_CONTABILIDAD(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			/* Busqueda de reembolso */
			String CUENTA = getCampoTextual(request, "CCUENTA_INTERNO");
			String CONCEPTO = getCampoTextual(request, "CONCEPTO"); // Debe /Haber 1/2
			BigDecimal EMPRESA = getCampoNumerico(request, "CEMPRES");
			Date FCONTABLE = getCampoTextual(request, "FASIENT") != null
					? sdf.parse(getCampoTextual(request, "FASIENT"))
					: null;
			java.sql.Date FCONTABLE_2 = FCONTABLE != null ? new java.sql.Date(FCONTABLE.getTime()) : null;
			BigDecimal PAIS = getCampoNumerico(request, "CPAIS");
			// BigDecimal LINEA = getCampoNumerico(request,"LINEA");
			BigDecimal LINEA = getCampoNumerico(request, "NLINEA");
			BigDecimal ASIENTO = getCampoNumerico(request, "NASIENT");
			BigDecimal ACTUAL = getCampoNumerico(request, "TIPO_LISTADO"); // 0:HISTORICO 1:CUADRE

			formdata.put("NASIENTO", ASIENTO);

			BigDecimal NMESES = getCampoNumerico(request, "NMESES");
			logger.debug("NMESES ------------------>: " + NMESES);
			Map map = new PAC_IAX_CONTABILIDAD((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_CONTABILIDAD__F_GET_CONSULTADESGLOSE(CUENTA, CONCEPTO, EMPRESA, FCONTABLE_2, PAIS,
							LINEA, ASIENTO, ACTUAL, NMESES);

			logger.debug(map);

			List listaDetalle = (List) tratarRETURNyMENSAJES(request, map, false);
			request.getSession().setAttribute("axisadm_listaApuntes",
					listaDetalle != null ? listaDetalle : new ArrayList());
			listaDetalle = null;

		} catch (Exception e) {
			logger.error("Error en el servicio Axisrmb001Service - m�todo m_buscar", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	/**
	 * Carga la lista de empresas en la pantalla.
	 * 
	 * @param request El HttpServletRequest que contiene la petici�n del cliente
	 *                web.
	 */
	private void cargaListaAsientos(HttpServletRequest request) throws Exception {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		BigDecimal EMPRESA = getCampoNumerico(request, "CEMPRES");
		// Carga de ramos de la BD
		Map map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTASIENTO(EMPRESA);
		List listaAsientos = (List) tratarRETURNyMENSAJES(request, map, false);
		request.getSession().setAttribute("axisadm_listaAsientos",
				listaAsientos != null ? listaAsientos : new ArrayList());
		listaAsientos = null;
	}

	/**
	 * Carga la lista de empresas en la pantalla.
	 * 
	 * @param request El HttpServletRequest que contiene la petici�n del cliente
	 *                web.
	 */
	private void cargaListaCuentas(HttpServletRequest request) throws Exception {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		// Carga de ramos de la BD
		Map map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTCUENTACONTABLE();
		List listaCuentas = (List) tratarRETURNyMENSAJES(request, map, false);
		request.getSession().setAttribute("axisadm_listaCuentas",
				listaCuentas != null ? listaCuentas : new ArrayList());
		listaCuentas = null;
	}

	/**
	 * Carga la lista de empresas en la pantalla.
	 * 
	 * @param request El HttpServletRequest que contiene la petici�n del cliente
	 *                web.
	 */
	private void cargaListaConceptos(HttpServletRequest request) throws Exception {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		// Carga de ramos de la BD
		Map map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTCONCEPTOCONTABLE();
		List listaConceptos = (List) tratarRETURNyMENSAJES(request, map, false);
		request.getSession().setAttribute("axisadm_listaConceptos",
				listaConceptos != null ? listaConceptos : new ArrayList());
		listaConceptos = null;
	}

	/**
	 * Carga la lista de empresas en la pantalla.
	 * 
	 * @param request El HttpServletRequest que contiene la petici�n del cliente
	 *                web.
	 */
	private void cargaListaPaises(HttpServletRequest request) throws Exception {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		// Carga de ramos de la BD
		Map map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTPAISES();
		List listaPaises = (List) tratarRETURNyMENSAJES(request, map, false);
		request.getSession().setAttribute("axisadm_listaPaises", listaPaises != null ? listaPaises : new ArrayList());
		listaPaises = null;
	}

	/* ************************** FUNCIONES AJAX ************************* */

	/**
	 * 
	 * @param request
	 **/

	public void m_ajax_cargar_asientos(HttpServletRequest request) {
		logger.debug("Axisadm007Service m_ajax_cargar_asientos");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();

		try {

			BigDecimal EMPRESA = getCampoNumerico(request, "CEMPRES");
			// Carga de ramos de la BD
			Map map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTASIENTO(EMPRESA);

			ajax.rellenarPlAContenedorAjax(map);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm007Service m_ajax_cargar_asientos", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	/* ********************************************************** */

	public void m_ajax_generar_resultados_map(HttpServletRequest request) {
		logger.debug("Axisadm007Service m_ajax_generar_resultados_map");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();
		try {
			String CMAP = getCampoTextual(request, "CMAP");
			String CPARAMETROS = getCampoTextual(request, "CPARAMETROS");

			request.getSession().removeAttribute("CFICHERO");
			String[] C_FICHERO_OUT = { "RETURN" };

			Map map = new PAC_IAX_MAP((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_MAP__F_EJECUTA(CMAP, CPARAMETROS);

			logger.debug("ejecutaPAC_IAX_MAP__F_EJECUTAR" + map);

			ajax.guardarContenidoFinalAContenedorAjax(map);

			System.out.println(ajax.getAjaxContainer());

			Object[] resultadoAjax = (Object[]) ajax.rellenarPlAContenedorAjax(map, C_FICHERO_OUT);

			if (resultadoAjax[0].equals(new BigDecimal(0))) {
				Map resultado = new HashMap();
				resultado.put("VALOR", resultadoAjax[0]);
				if (!isEmpty(resultadoAjax[1])) {
					resultado.put("FICHERO", resultadoAjax[1]);
					request.getSession().setAttribute("CFICHERO", resultadoAjax[1]);
				}

				ajax.guardarContenidoFinalAContenedorAjax(resultado);
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr029Service - m�todo m_ajax_generar_resultados_map", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

}
