package axis.service.axis;

import javax.servlet.http.HttpServletRequest;

import axis.mvc.control.AbstractDispatchAction;

public class Axisctr027Service extends Axisctr008Service {
	private Axisctr004Service axisctr004Service = new Axisctr004Service();

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE INICIALIZACION
	 *******************************************/
	/*********************************************************************************************************************/

	public void m_form(HttpServletRequest request, AbstractDispatchAction thisAction) {
		request.setAttribute("multiPantalla", Boolean.valueOf(true));
		axisctr004Service.m_form(request, thisAction);
		super.m_form(request, thisAction);
	}

	/*********************************************************************************************************************/
	/************************************************
	 * M�TODOS DE ACTUALIZACI�N
	 *******************************************/
	/*********************************************************************************************************************/

	/* Hereda los m�todos de Axisctr008Service */

	/*********************************************************************************************************************/
	/**************************************************
	 * M�TODOS DE NAVEGACI�N
	 ********************************************/
	/*********************************************************************************************************************/

	/**
	 * Guarda la pantalla, realiza su validaci�n y determina la siguiente pantalla a
	 * ejecutar.
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_siguiente(HttpServletRequest request, AbstractDispatchAction thisAction) {
		logger.debug("Axisctr027Service m_siguiente");
		request.setAttribute("multiPantalla", Boolean.valueOf(true));
		axisctr004Service.m_siguiente(request, thisAction);
		super.m_siguiente(request, thisAction);
	}

	/**
	 * Guarda la pantalla, realiza su validaci�n y determina la pantalla anterior a
	 * ejecutar.
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_anterior(HttpServletRequest request, AbstractDispatchAction thisAction) {
		logger.debug("Axisctr027Service m_anterior");
		request.setAttribute("multiPantalla", Boolean.valueOf(true));
		axisctr004Service.m_anterior(request, thisAction);
		super.m_anterior(request, thisAction);
	}

	/**
	 * Carga las cuentas del tomador y las devuelve en modo Ajax.
	 * 
	 * @param request
	 */
	public void m_ajax_cargar_cuentas_tomador(HttpServletRequest request) {
		axisctr004Service.m_ajax_cargar_cuentas_tomador(request);
	}
}
