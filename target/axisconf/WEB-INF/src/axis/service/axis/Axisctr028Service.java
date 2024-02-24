package axis.service.axis;

import javax.servlet.http.HttpServletRequest;

import axis.mvc.control.AbstractDispatchAction;

public class Axisctr028Service extends Axisctr007Service {
	private Axisctr006Service axisctr006Service = new Axisctr006Service();

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE INICIALIZACION
	 *******************************************/
	/*********************************************************************************************************************/

	public void m_form(HttpServletRequest request, AbstractDispatchAction thisAction) {
		request.setAttribute("multiPantalla", Boolean.valueOf(true));
		axisctr006Service.m_form(request, thisAction);
		super.m_form(request, thisAction);
	}

	/*********************************************************************************************************************/
	/************************************************
	 * M�TODOS DE ACTUALIZACI�N
	 *******************************************/
	/*********************************************************************************************************************/

	/* Hereda los m�todos de Axisctr007Service */

	/**
	 * M�todo que efect�a cambios al seleccionar una garantia de la lista de
	 * garantias.
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_selected_garantia(HttpServletRequest request, AbstractDispatchAction thisAction) {
		// Antes, vamos a grabar las cl�usulas de beneficiario, por si el usuario
		// hubiera ya introducido alguna (que no se pierdan)
		request.setAttribute("multiPantalla", Boolean.valueOf(true));
		axisctr006Service.m_siguiente(request, thisAction);
		super.m_selected_garantia(request, thisAction);
	}

	/**
	 * M�todo que se encarga de la actualizaci�n de la pantalla y su posterior
	 * recalculo de primas en funci�n de la revalorizaci�n, las garantias y sus
	 * capitales.
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_tarifar(HttpServletRequest request, AbstractDispatchAction thisAction) {
		// Antes, vamos a grabar las cl�usulas de beneficiario, por si el usuario
		// hubiera ya introducido alguna (que no se pierdan)
		request.setAttribute("multiPantalla", Boolean.valueOf(true));
		axisctr006Service.m_siguiente(request, thisAction);
		super.m_tarifar(request, thisAction);
	}

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
		logger.debug("Axisctr028Service m_siguiente");
		request.setAttribute("multiPantalla", Boolean.valueOf(true));
		axisctr006Service.m_siguiente(request, thisAction);
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
		logger.debug("Axisctr028Service m_anterior");
		request.setAttribute("multiPantalla", Boolean.valueOf(true));
		axisctr006Service.m_anterior(request, thisAction);
		super.m_anterior(request, thisAction);
	}
}
