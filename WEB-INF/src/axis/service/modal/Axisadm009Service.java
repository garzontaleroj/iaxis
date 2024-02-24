package axis.service.modal;

import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_CONTABILIDAD;
import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AjaxContainerService;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

/**
 * Axisadm009Service.java 20/08/2008
 * 
 * @author <a href="lcalvo@csi-ti.com">Luz Calvo</a>
 * @since Java 5.0
 */
public class Axisadm009Service extends AxisBaseService {
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
		logger.debug("Axisadm009Service m_init");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		try {
			request.removeAttribute("listaLinea");
		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm009Service - m�todo m_init", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
	}

	/**
	 * 
	 * @param request
	 */
	@SuppressWarnings("all")
	public void m_form(HttpServletRequest request) {
		logger.debug("Axisadm009Service m_form");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		try {

			BigDecimal EMPRESA = getCampoNumerico(request, "CEMPRES");

			if (EMPRESA != null) {
				this.cargaListaLinea(request);
			} else {
				// Inicializamos a cero la lista de plantillas
				request.getSession().setAttribute("listaLinea", new ArrayList());
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm009Service - m�todo m_form", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
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
	public void m_buscar(HttpServletRequest request) {
		logger.debug("Axisadm009Service m_buscar");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {

			// this.cargaListaLinea(request);
			BigDecimal EMPRESA = getCampoNumerico(request, "CEMPRES");
			BigDecimal SMODCON = getCampoNumerico(request, "SMODCON");
			Date FINI = getCampoTextual(request, "FINI") != null ? sdf.parse(getCampoTextual(request, "FINI")) : null;
			java.sql.Date FINI_2 = FINI != null ? new java.sql.Date(FINI.getTime()) : null;

			BigDecimal PLANTILLA = getCampoNumerico(request, "PLANTILLA");

			Map map = new PAC_IAX_CONTABILIDAD((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_CONTABILIDAD__F_GET_CONSULTADETALLEPLANTILLA(EMPRESA, PLANTILLA); /* CHANGED */
			List listaLinea = (List) tratarRETURNyMENSAJES(request, map);
			request.getSession().setAttribute("listaLinea", listaLinea != null ? listaLinea : new ArrayList());

			formdata.put("FINI", FINI_2);
			listaLinea = null;

		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm009Service - m�todo m_buscar", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
	}

	/**
	 * Carga la lista de empresas en la pantalla.
	 * 
	 * @param request El HttpServletRequest que contiene la petici�n del cliente
	 *                web.
	 */
	private void cargaListaLinea(HttpServletRequest request) throws Exception {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		BigDecimal EMPRESA = getCampoNumerico(request, "CEMPRES");
		BigDecimal SMODCON = getCampoNumerico(request, "PLANTILLA");

		Map map = new PAC_IAX_CONTABILIDAD((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_CONTABILIDAD__F_GET_CONSULTADETALLEPLANTILLA(EMPRESA, SMODCON);
		List listaLinea = (List) tratarRETURNyMENSAJES(request, map);
		request.getSession().setAttribute("listaLinea", listaLinea != null ? listaLinea : new ArrayList());

		listaLinea = null;

	}

	/**
	 * 
	 * @param request
	 **/

	public void m_borrar_detalle(HttpServletRequest request) {
		logger.debug("Axisadm009Service m_borrar_detalle");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {

			BigDecimal EMPRESA = getCampoNumerico(request, "CEMPRES");
			BigDecimal SMODCON = getCampoNumerico(request, "SMODCON");
			BigDecimal NLINEA = getCampoNumerico(request, "NLINEA_LIN");
			BigDecimal PLANTILLA = getCampoNumerico(request, "PLANT");

			Date FINI = getCampoTextual(request, "FINI") != null ? sdf.parse(getCampoTextual(request, "FINI")) : null;
			java.sql.Date FINI_2 = FINI != null ? new java.sql.Date(FINI.getTime()) : null;
			formdata.put("FINI", FINI_2);

			Map plReturn = new PAC_IAX_CONTABILIDAD((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_CONTABILIDAD__F_DEL_DETALLEPLANTILLA(EMPRESA, PLANTILLA, NLINEA); /* CHANGED */
			BigDecimal valorResultado = (BigDecimal) tratarRETURNyMENSAJES(request, plReturn);

			/* TODO: PONER DESDE PL LA PARTE DE LOS MENSAJES */
			if (valorResultado.intValue() == 0) {

				this.cargaListaLinea(request);

			}
		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm009Service - m�todo m_obtener_combos", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
	}

	/*********************************************************************************************************************/
	/************************************************
	 * M�TODOS AJAX
	 *******************************************/
	/*********************************************************************************************************************/

	/**
	 * 
	 * @param request
	 **/

	public void m_ajax_cargar_asientos(HttpServletRequest request) {
		logger.debug("Axisadm009Service m_ajax_cargar_asientos");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();

		try {

			BigDecimal EMPRESA = getCampoNumerico(request, "CEMPRES");

			Map plReturn = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTASIENTO(EMPRESA);
			List getAsientosReturn = (List) ajax.rellenarPlAContenedorAjax(plReturn);

			if (!isEmpty(getAsientosReturn) && getAsientosReturn.size() > 0) {
				ajax.guardarContenidoFinalAContenedorAjax((List) getAsientosReturn);
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm009Service - m�todo m_ajax_cargar_asientos", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
		this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
	}

	/**
	 * 
	 * @param request
	 **/

	public void m_ajax_guardar_plantilla(HttpServletRequest request) {
		logger.debug("Axisadm009Service m_ajax_guardar_plantilla");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();

		try {

			BigDecimal EMPRESA = getCampoNumerico(request, "CEMPRES");
			BigDecimal SMODCON = getCampoNumerico(request, "SMODCON");
			Date FINI = getCampoTextual(request, "FINI") != null ? sdf.parse(getCampoTextual(request, "FINI")) : null;
			java.sql.Date FINI_2 = FINI != null ? new java.sql.Date(FINI.getTime()) : null;
			Date FFIN = getCampoTextual(request, "FFIN") != null ? sdf.parse(getCampoTextual(request, "FFIN")) : null;
			java.sql.Date FFIN_2 = FFIN != null ? new java.sql.Date(FFIN.getTime()) : null;

			BigDecimal PLANTILLA = getCampoNumerico(request, "PLANTILLA");

			Map plReturn = new PAC_IAX_CONTABILIDAD((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_CONTABILIDAD__F_GRABAR_PLANTILLA(EMPRESA, SMODCON, FFIN_2);
			ajax.rellenarPlAContenedorAjax(plReturn);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm009Service - m�todo m_ajax_guardar_plantilla", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
		this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
	}

}
