package axis.service.modal;

import java.math.BigDecimal;
import java.util.ArrayList;
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
 * Axisadm010Service.java 20/08/2008
 * 
 * @author <a href="lcalvo@csi-ti.com">Luz Calvo</a>
 * @since Java 5.0
 */
public class Axisadm010Service extends AxisBaseService {
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
		logger.debug("Axisadm010Service m_form");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		try {

			this.cargaListaConceptos(request);
			this.cargaListaCuentas(request);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm010Service - m�todo m_form", e);
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
	public void m_buscar(HttpServletRequest request) {

	}

	public void m_ajax_guardar_linea(HttpServletRequest request) {
		logger.debug("Axisadm010Service m_ajax_guardar_linea");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();

		try {

			BigDecimal EMPRESA = getCampoNumerico(request, "CEMPRES");
			BigDecimal SMODCON = getCampoNumerico(request, "SMODCON");
			String CUENTAC = getCampoTextual(request, "CUENTAC");
			String TDESCRI = getCampoTextual(request, "TDESCRI");
			BigDecimal TIPOLIN = getCampoNumerico(request, "TIPOLIN");
			String TSELECT = getCampoTextual(request, "TSELECT");
			BigDecimal NLINEA = getCampoNumerico(request, "NLINEA");

			BigDecimal PLANTILLA = getCampoNumerico(request, "PLANTILLA");

			Map plReturn = new PAC_IAX_CONTABILIDAD((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_CONTABILIDAD__F_GRABAR_DETALLEPLANTILLA(EMPRESA, PLANTILLA, NLINEA, TDESCRI,
							CUENTAC, TIPOLIN, TSELECT);
			ajax.rellenarPlAContenedorAjax(plReturn);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm010Service - m�todo m_ajax_guardar_linea", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	/**
	 * Carga la lista de empresas en la pantalla.
	 * 
	 * @param request El HttpServletRequest que contiene la petici�n del cliente
	 *                web.
	 */
	private void cargaListaCuentas(HttpServletRequest request) throws Exception {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		Map map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTCUENTACONTABLE();
		List listaCuentas = (List) tratarRETURNyMENSAJES(request, map);
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

		Map map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTCONCEPTOCONTABLE();
		List listaConceptos = (List) tratarRETURNyMENSAJES(request, map);
		request.getSession().setAttribute("axisadm_listaConceptos",
				listaConceptos != null ? listaConceptos : new ArrayList());
		listaConceptos = null;
	}

}
