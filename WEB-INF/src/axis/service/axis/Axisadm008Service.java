package axis.service.axis;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import axis.jdbc.PAC_IAX_CONTABILIDAD;
import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.control.axis.Axisadm008Action;
import axis.mvc.model.UsuarioBean;
import axis.util.Constantes;

/**
 * Axisadm008Service.java 20/08/2008
 * 
 * @author <a href="lcalvo@csi-ti.com">Luz Calvo</a>
 * @since Java 5.0
 */

public class Axisadm008Service extends AxisBaseService {

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE INICIALIZACION
	 *******************************************/
	/*********************************************************************************************************************/

	/**
	 * M�todo que se llama al inicio de este flujo.
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_init(HttpServletRequest request, Axisadm008Action thisAction) {
		try {
		} catch (Exception e) {
			logger.error("Error", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
	}

	/**
	 * M�todo que se llama al inicio de este flujo.
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_form(HttpServletRequest request, Axisadm008Action thisAction) {

		logger.debug("Axisadm008Service m_form");

		try {

			this.cargaListaEmpresas(request);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm008Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
	}

	/**
	 * M�todo que se llama al inicio de este flujo.
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_buscar(HttpServletRequest request, Axisadm008Action thisAction) {

		logger.debug("Axisadm008Service m_buscar");

		try {

			BigDecimal SMODCON = getCampoNumerico(request, "SMODCON");
			request.getSession().setAttribute("CASIENT_AUX", SMODCON);
			this.cargaListaEmpresas(request);
			this.cargaListaPlantillas(request);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm008Service - m�todo m_buscar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
	}

	/*********************************************************************************************************************/
	/************************************************
	 * M�TODOS DE ACTUALIZACI�N
	 *******************************************/
	/*********************************************************************************************************************/

	/**
	 * M�todo que se encarga de la actualizaci�n de la pantalla y su posterior
	 * recalculo de primas en funci�n de la revalorizaci�n, las garantias y sus
	 * capitales.
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_generar(HttpServletRequest request, AbstractDispatchAction thisAction) {
		this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
	}

	/*********************************************************************************************************************/
	/**************************************************
	 * M�TODOS DE NAVEGACI�N
	 ********************************************/
	/*********************************************************************************************************************/

	/**
	 * Guarda la pantalla, realiza su validaci�n y determina la pantalla anterior a
	 * ejecutar.
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_anterior(HttpServletRequest request, AbstractDispatchAction thisAction) {
		this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
	}

	/**
	 * Carga la lista de empresas en la pantalla.
	 * 
	 * @param request El HttpServletRequest que contiene la petici�n del cliente
	 *                web.
	 */
	private void cargaListaEmpresas(HttpServletRequest request) throws Exception {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		Map map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTEMPRESAS();
		List listaEmpresas = (List) tratarRETURNyMENSAJES(request, map);
		request.getSession().setAttribute("axisadm_listaEmpresas",
				listaEmpresas != null ? listaEmpresas : new ArrayList());
		// if(listaEmpresas.size()==1){
		// request.getSession().setAttribute("CEMPRES",);
		// }
		listaEmpresas = null;
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

		Map map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTASIENTO(EMPRESA);
		List listaAsientos = (List) tratarRETURNyMENSAJES(request, map);
		request.getSession().setAttribute("listaAsientos", listaAsientos != null ? listaAsientos : new ArrayList());
		listaAsientos = null;
	}

	/**
	 * Carga la lista de empresas en la pantalla.
	 * 
	 * @param request El HttpServletRequest que contiene la petici�n del cliente
	 *                web.
	 */
	private void cargaListaPlantillas(HttpServletRequest request) throws Exception {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		BigDecimal EMPRESA = getCampoNumerico(request, "CEMPRES");
		BigDecimal SMODCON = getCampoNumerico(request, "SMODCON");

		request.setAttribute("CONSULTA", "YES");

		if (SMODCON != null && SMODCON.intValue() < 0) {
			SMODCON = null;
		}

		Map map = new PAC_IAX_CONTABILIDAD((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_CONTABILIDAD__F_GET_CONSULTAPLANTILLA(EMPRESA, SMODCON);
		List listaPlantillas = (List) tratarRETURNyMENSAJES(request, map);

		request.getSession().setAttribute("listaPlantillas",
				listaPlantillas != null ? listaPlantillas : new ArrayList());

		listaPlantillas = null;
	}

	/*********************************************************************************************************************/
	/**************************************************
	 * M�TODOS AJAX
	 ********************************************/
	/*********************************************************************************************************************/

	/**
	 * 
	 * @param request
	 **/

	public void m_ajax_cargar_asientos(HttpServletRequest request) {
		logger.debug("Axisadm008Service m_ajax_cargar_asientos");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();

		try {

			BigDecimal EMPRESA = getCampoNumerico(request, "CEMPRES");
			BigDecimal SMODCON = getCampoNumerico(request, "SMODCON");

			Map plReturn = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTASIENTO(EMPRESA);
			List getAsientosReturn = (List) ajax.rellenarPlAContenedorAjax(plReturn);

			HashMap modelo = new HashMap();
			modelo.put("SMODCON", modelo);
			ArrayList prueba = new ArrayList();
			prueba.add(modelo);
			ajax.guardarContenidoFinalAContenedorAjax(prueba);

			if (!isEmpty(getAsientosReturn) && getAsientosReturn.size() > 0) {
				ajax.guardarContenidoFinalAContenedorAjax((List) getAsientosReturn);
				request.getSession().setAttribute("axisadm_listaAsientos", getAsientosReturn);
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm008Service - m�todo m_ajax_cargar_asientos", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
		this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
	}

	/**
	 * M�todo que duplica una plantilla seleccionada, y da por anulada la plantilla
	 * de la cual se realiza la copia mediante la fecha de baja.
	 * 
	 * @param request
	 **/

	public void m_ajax_duplicar_plantilla(HttpServletRequest request) {
		logger.debug("Axisadm008Service m_ajax_duplicar_plantilla");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();

		try {

			BigDecimal EMPRESA = getCampoNumerico(request, "CEMPRES");
			BigDecimal PLANTILLA = getCampoNumerico(request, "PLANTILLA");
			// Se envia el n�mero de plantilla
			Map plReturn = new PAC_IAX_CONTABILIDAD((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_CONTABILIDAD__F_DUPLICARMODELO(EMPRESA, PLANTILLA);
			BigDecimal getModeloReturn = (BigDecimal) ajax.rellenarPlAContenedorAjax(plReturn);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm008Service - m�todo m_ajax_cargar_asientos", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
		this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
	}

}
