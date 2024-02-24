package axis.service.modal;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_CONVENIOS_EMP;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.control.modal.Axissin063Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

public class Axissin063Service extends AxisBaseService {
	Log log = LogFactory.getLog(this.getClass());

	/*********************************************************************************************************************/
	/************************************************
	 * M�TODOS DE INICIALIZACI�N
	 *******************************************/
	/*********************************************************************************************************************/

	public void m_init(HttpServletRequest request, Axissin063Action thisAction) {
		try {
			request.getSession().removeAttribute("axisper021_listaPersonas");
		} catch (Exception e) {
			log.error("Error", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

	/**
	 * Limpia la antigua lista de personas de sesi�n, en caso que hubiera, para
	 * poder realizar una b�squeda nueva.
	 * 
	 * @param request    El HttpServletRequest que contiene la petici�n del cliente
	 *                   web.
	 * @param thisAction Una Action abstracta desde donde se ha invocado el servicio
	 *                   (necesaria para el log).
	 */
	public void m_form(HttpServletRequest request, Axissin063Action thisAction) {
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);

		try {

			if (formdata.get("paginar") == null) {
				String donde = getCampoTextual(request, "DONDE");
				if (!isEmpty(donde)) {
					if (donde.equals(new String("AXISCOMI013")))
						AbstractDispatchAction.topPila(request, "CMODO", "ALTA_POLIZA");
				}

				formdata.remove("SPERSON");
				formdata.put("CONDICION", getCampoTextual(request, "CONDICION"));

				BigDecimal NRIESGO = getCampoNumerico(request, "HNRIESGO");
				String TRIESGO = getCampoTextual(request, "HTRIESGO");
				formdata.put("NRIESGO", NRIESGO);
				formdata.put("TRIESGO", TRIESGO);

				if (NRIESGO != null) {
					this.m_busqueda_persona(request, thisAction);
				}
				String ORIGEN = getCampoTextual(request, "ORIGEN");
				formdata.put("ORIGEN", ORIGEN);
			}
		} catch (Exception e) {
			log.error("Error", e);
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
	 * Dado un NOMBRE, un NNUMNIF y/o un NSIP de una Persona, ejecuta la consulta de
	 * b�squeda de Personas en BD, y devuelve el resultado en el atributo de sesi�n
	 * axisper021_listaPersonas.
	 * 
	 * @param request    El HttpServletRequest que contiene la petici�n del cliente
	 *                   web.
	 * @param thisAction Una Action abstracta desde donde se ha invocado el servicio
	 *                   (necesaria para el log).
	 */
	public void m_busqueda_persona(HttpServletRequest request, Axissin063Action thisAction) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);

		try {

			BigDecimal SSEGURO = getCampoNumerico(request, "SSEGURO");
			String NOMASEG = getCampoTextual(request, "NOMASEG");
			BigDecimal NRIESGO = getCampoNumerico(request, "HNRIESGO");
			if (NRIESGO == null) {
				NRIESGO = getCampoNumerico(request, "NRIESGO");
			}

			if (formdata.get("paginar") == null) {

				request.getSession().removeAttribute("ASEGURADOS_INNOM");
				/* ASEGURADOS INN */
				PAC_IAX_CONVENIOS_EMP pac_iax_convenios_emp = new PAC_IAX_CONVENIOS_EMP(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
				Map inn = pac_iax_convenios_emp.ejecutaPAC_IAX_CONVENIOS_EMP__F_GET_ASEGURADOS_INNOM(SSEGURO, NRIESGO,
						NOMASEG, null, null);
				log.debug(inn);
				ArrayList lista_aseginn = (ArrayList) tratarRETURNyMENSAJES(request, inn, false);
				request.setAttribute("ASEGURADOS_INNOM", lista_aseginn);

			}

		} catch (Exception e) {
			log.error("Error", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
	}

}
