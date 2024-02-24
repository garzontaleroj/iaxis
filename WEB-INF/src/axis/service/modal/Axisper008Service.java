//Revision:# 6Lg1fjFFTc1A4ehrVi6c5A== #
package axis.service.modal;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.jdbc.PAC_IAX_PERSONA;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.control.modal.Axisper008Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

public class Axisper008Service extends AxisBaseService {
	Log log = LogFactory.getLog(this.getClass());

	/*********************************************************************************************************************/
	/************************************************
	 * M�TODOS DE INICIALIZACI�N
	 *******************************************/
	/*********************************************************************************************************************/

	public void m_init(HttpServletRequest request, Axisper008Action thisAction) {
		try {
			request.getSession().removeAttribute("Axisper008_listaPersonas");
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
	public void m_form(HttpServletRequest request, Axisper008Action thisAction) {
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);

		try {
			formdata.remove("SPERSON");
			request.getSession().removeAttribute("axisper008_listaPersonas");
			this.cargarcombos(request, thisAction);

		} catch (Exception e) {
			log.error("Error", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
	}

	private void cargarcombos(HttpServletRequest request, Axisper008Action thisAction) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		Map listValores = new HashMap();
		try {
			PAC_IAX_LISTVALORES pac_axis_listValores = new PAC_IAX_LISTVALORES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			// Tipo de documento
			Map map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_GET_TIPDOCUM_TIPPER(null);
			listValores.put("tipDocum", (List) tratarRETURNyMENSAJES(request, map, false));
			formdata.put("listValores", listValores);
		} catch (Exception e) {
			log.error("Error", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}

	}

	/*********************************************************************************************************************/
	/************************************************
	 * M�TODOS DE ACTUALIZACI�N
	 *******************************************/
	/*********************************************************************************************************************/

	/**
	 * Dado un NOMBRE, un NNUMNIF y/o un NSIP de una Persona, ejecuta la consulta de
	 * b�squeda de Personas en BD, y devuelve el resultado en el atributo de sesi�n
	 * Axisper008_listaPersonas.
	 * 
	 * @param request    El HttpServletRequest que contiene la petici�n del cliente
	 *                   web.
	 * @param thisAction Una Action abstracta desde donde se ha invocado el servicio
	 *                   (necesaria para el log).
	 */
	public void m_busqueda_persona(HttpServletRequest request, Axisper008Action thisAction) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);

		try {

			String NNUMNIF = getCampoTextual(request, "NNUMNIF");
			String NOMBRE = getCampoTextual(request, "NOMBRE");
			String NSIP = getCampoTextual(request, "NSIP");
			String NOMBRECOMP = getCampoTextual(request, "NOMBRECOMP");
			BigDecimal CTIPIDE = getCampoNumerico(request, "CTIPIDE");
			String TAPELLI1 = getCampoTextual(request, "TAPELLI1");
			String TAPELLI2 = getCampoTextual(request, "TAPELLI2");
			java.sql.Date FNACIMI = this.stringToSqlDate(this.getCampoTextual(request, "FNACIMI"));
			String TDOMICI = getCampoTextual(request, "TDOMICI");
			String CPOSTAL = getCampoTextual(request, "CPOSTAL");
			BigDecimal SWPUBLI = getCampoNumerico(request, "SWPUBLI");
			BigDecimal ESTSEGURO = new BigDecimal(0);
			if (!isEmpty(CPOSTAL))
				CPOSTAL = CPOSTAL.toUpperCase();

			if (formdata.get("paginar") == null) {
				request.getSession().removeAttribute("Axisper008_listaPersonas");
				PAC_IAX_PERSONA PAC_IAX_PERSONA = new PAC_IAX_PERSONA(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

				// BigDecimal SSEGURO = (BigDecimal) AbstractDispatchAction.topPila(request,
				// "SSEGURO");
				// Map map =
				// pacIaxListavlores.ejecutaPAC_IAX_LISTVALORES__F_GET_PERSONAS(NNUMNIF, NOMBRE,
				// NSIP, SSEGURO);

				Map map = new HashMap();

				if ("RED_COMERCIAL".equals(AbstractDispatchAction.topPila(request, "CMODO")))
					map = PAC_IAX_PERSONA.ejecutaPAC_IAX_PERSONA__F_GET_PERSONAS_PUBLICAS(NNUMNIF, NOMBRECOMP, NSIP,
							NOMBRE, TAPELLI1, TAPELLI2, CTIPIDE);
				else
					map = PAC_IAX_PERSONA.ejecutaPAC_IAX_PERSONA__F_GET_DET_PERSONA(NNUMNIF, NOMBRECOMP, NSIP, NOMBRE,
							TAPELLI1, TAPELLI2, CTIPIDE, FNACIMI, TDOMICI, CPOSTAL, SWPUBLI, ESTSEGURO);

				log.debug(map);

				request.getSession().setAttribute("axisper008_listaPersonas",
						(ArrayList) tratarRETURNyMENSAJES(request, map, false));
			}

		} catch (Exception e) {
			log.error("Error", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.cargarcombos(request, thisAction);
		this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
	}

	/**
	 * Dada una persona elegida en el buscador, la traspasa a las tablas de estudio.
	 * Pone en request un par�metro "SPERSON_OUT" para que f_onload() de la JSP sepa
	 * que se ha traspasado correctamente, y pueda enviar el nuevo SPERSON a la
	 * pantalla padre.
	 * 
	 * @param request    El HttpServletRequest que contiene la petici�n del cliente
	 *                   web.
	 * @param thisAction Una Action abstracta desde donde se ha invocado el servicio
	 *                   (necesaria para el log).
	 */
	public void m_traspaso_persona(HttpServletRequest request, Axisper008Action thisAction) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);

		try {

			// Recuperar persona a buscar
			BigDecimal SPERSON = getCampoNumerico(request, "SPERSON");
			BigDecimal CAGENTE = getCampoNumerico(request, "CAGENTE");
			// BigDecimal CMODO = getCampoNumerico(request, "CMODO");

			request.setAttribute("CAGENTE", CAGENTE);
			request.setAttribute("CMODO", "CONSULTA");
			request.setAttribute("SPERSON_OUT", SPERSON);

			this.cargarcombos(request, thisAction);

		} catch (Exception e) {
			log.error("Error", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
	}

	// PAC_IAX_PERSONA__F_TRASPASAPERSONAEST

	/**
	 * M�todo que busca la informacion de la tabla de cifin intermedio
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_buscar_cifin_intermedio(HttpServletRequest request, Axisper008Action thisAction) throws Exception {
		log.debug("Axisper010Service m_grabarPersona");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		String NNUMNIF = getCampoTextual(request, "NNUMNIF");
		if (NNUMNIF != null) {
			try {
				if (!isEmpty(NNUMNIF)) {
					PAC_IAX_PERSONA pac_axis_persona = new PAC_IAX_PERSONA(
							(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
					Map map = pac_axis_persona.ejecutaPAC_IAX_PERSONA__F_SET_PERSONA_CIFIN(NNUMNIF);

					BigDecimal RETURN = (BigDecimal) tratarRETURNyMENSAJES(request, map);

					if (new BigDecimal(0).equals(RETURN)) {
						m_busqueda_persona(request, thisAction);
					}

				}
			} catch (Exception e) {
				thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
			}
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}
}
