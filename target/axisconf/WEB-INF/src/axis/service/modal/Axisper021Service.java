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

import axis.jdbc.PAC_IAX_CON;
import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.jdbc.PAC_IAX_PERSONA;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.control.modal.Axisper021Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

public class Axisper021Service extends AxisBaseService {
	Log log = LogFactory.getLog(this.getClass());

	public void m_init(HttpServletRequest request, Axisper021Action thisAction) {
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
	public void m_form(HttpServletRequest request, Axisper021Action thisAction) {
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);

		try {

			String donde = getCampoTextual(request, "DONDE");
			if (!isEmpty(donde)) {
				if (donde.equals(new String("AXISCOMI013")))
					AbstractDispatchAction.topPila(request, "CMODO", "ALTA_POLIZA");
			}

			formdata.remove("SPERSON");
			formdata.put("CONDICION", getCampoTextual(request, "CONDICION"));
			request.getSession().removeAttribute("axisper021_listaPersonas");
			this.cargarcombos(request, thisAction);
			String ORIGEN = getCampoTextual(request, "ORIGEN");
			formdata.put("ORIGEN", ORIGEN);
		} catch (Exception e) {
			log.error("Error", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
	}

	private void cargarcombos(HttpServletRequest request, Axisper021Action thisAction) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		Map listValores = new HashMap();
		try {
			PAC_IAX_LISTVALORES pac_axis_listValores = new PAC_IAX_LISTVALORES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			// Tipo de documento
			Map map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_GET_TIPDOCUM_TIPPER(null);
			listValores.put("tipDocum", (List) tratarRETURNyMENSAJES(request, map));

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
	 * axisper021_listaPersonas.
	 * 
	 * @param request    El HttpServletRequest que contiene la petici�n del cliente
	 *                   web.
	 * @param thisAction Una Action abstracta desde donde se ha invocado el servicio
	 *                   (necesaria para el log).
	 */
	public void m_busqueda_persona(HttpServletRequest request, Axisper021Action thisAction) {
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
			String MODO_SWPUBLI = getCampoTextual(request, "MODO_SWPUBLI");
			BigDecimal CAGENTE = getCampoNumerico(request, "CAGENTE");
			String CONDICION = getCampoTextual(request, "CONDICION");

			if (formdata.get("paginar") == null) {
				request.getSession().removeAttribute("axisper021_listaPersonas");
				PAC_IAX_PERSONA PAC_IAX_PERSONA = new PAC_IAX_PERSONA(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

				BigDecimal SSEGURO = (BigDecimal) AbstractDispatchAction.topPila(request, "SSEGURO");
				// Map map =
				// pacIaxListavlores.ejecutaPAC_IAX_LISTVALORES__F_GET_PERSONAS(NNUMNIF, NOMBRE,
				// NSIP, SSEGURO);

				Map map = PAC_IAX_PERSONA.ejecutaPAC_IAX_PERSONA__F_GET_PERSONAS_GENERICA_COND(NNUMNIF, NOMBRECOMP,
						NSIP, NOMBRE, TAPELLI1, TAPELLI2, CTIPIDE, CAGENTE, MODO_SWPUBLI, CONDICION);
				request.getSession().setAttribute("axisper021_listaPersonas",
						(ArrayList) tratarRETURNyMENSAJES(request, map));
			}

		} catch (Exception e) {
			log.error("Error", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.cargarcombos(request, thisAction);
		this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
	}

	public void m_busqueda_persona_host(HttpServletRequest request, Axisper021Action thisAction) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);

		try {

			// Recuperar persona a buscar
			String NNUMNIF = getCampoTextual(request, "NNUMNIF");
			String NOMBRE = getCampoTextual(request, "NOMBRE");
			String NOMBRECOMP = getCampoTextual(request, "NOMBRECOMP");

			String NSIP = getCampoTextual(request, "NSIP");
			String SNIP = NSIP;
			BigDecimal CTIPIDE = getCampoNumerico(request, "CTIPIDE");
			String TAPELLI1 = getCampoTextual(request, "TAPELLI1");
			String TAPELLI2 = getCampoTextual(request, "TAPELLI2");
			String MASDATOS = getCampoTextual(request, "MASDATOS");

			if (formdata.get("paginar") == null) {

				request.getSession().removeAttribute("axisper001_listaPersonas");
				PAC_IAX_PERSONA PAC_IAX_PERSONA = new PAC_IAX_PERSONA(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
				PAC_IAX_CON PAC_IAX_CON = new PAC_IAX_CON(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
				Map map = new HashMap();
				if (isEmpty(MASDATOS)) {
					BigDecimal SSEGURO = (BigDecimal) AbstractDispatchAction.topPila(request, "SSEGURO");
					map = PAC_IAX_PERSONA.ejecutaPAC_IAX_PERSONA__F_GET_PERSONAS_HOST(NNUMNIF, NOMBRECOMP, NSIP,
							SSEGURO, NOMBRE, TAPELLI1, TAPELLI2, CTIPIDE);
				} else {
					map = PAC_IAX_PERSONA.ejecutaPAC_IAX_PERSONA__F_BUSQUEDA_MASDATOS();
					log.debug(map);
					tratarRETURNyMENSAJES(request, map);
				}

				request.getSession().setAttribute("existMasInfo", map.get("POMASDATOS"));
				request.getSession().setAttribute("axisper021_listaPersonas",
						(ArrayList) tratarRETURNyMENSAJES(request, map));
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
	public void m_traspaso_persona(HttpServletRequest request, Axisper021Action thisAction) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);

		try {

			// Recuperar persona a buscar
			BigDecimal SPERSON = getCampoNumerico(request, "SPERSON");
			String CODITABLAS = getCampoTextual(request, "CODITABLAS");
			String SNIP = getCampoTextual(request, "SNIP");
			BigDecimal CEMPRES = null;
			BigDecimal CAGENTE = getCampoNumerico(request, "CAGENTE");
			BigDecimal SSEGURO_PANT = getCampoNumerico(request, "SSEGURO");

			if (formdata.get("paginar") == null) {
				request.getSession().removeAttribute("axisper021_listaPersonas");
				PAC_IAX_PERSONA pac_axis_persona = new PAC_IAX_PERSONA(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
				BigDecimal SSEGURO = (BigDecimal) AbstractDispatchAction.topPila(request, "SSEGURO");

				BigDecimal SSEGURO_OUT = (BigDecimal) AbstractDispatchAction.topPila(request, "SSEGURO_OUT");

				Map map = new HashMap();

				SSEGURO_OUT = !isEmpty(SSEGURO_OUT) ? SSEGURO_OUT : SSEGURO;
				if (isEmpty(SSEGURO_OUT)) {
					SSEGURO_OUT = SSEGURO_PANT;
				}
				map = pac_axis_persona.ejecutaPAC_IAX_PERSONA__F_TRASPASAPERSONAPOL(SPERSON, SNIP, CAGENTE, "INT",
						SSEGURO_OUT);

				if (!isEmpty(map) && new BigDecimal(0).equals(tratarRETURNyMENSAJES(request, map))) {
					request.setAttribute("SPERSON_OUT", map.get("PSPERSON_OUT"));
					request.setAttribute("CAGENTE_OUT", map.get("PCAGENTE"));
				} else {
					if (!isEmpty(map.get("PMENSAPOPUP"))) {
						String format = String.valueOf(map.get("PMENSAPOPUP"));
						format = format.replaceAll((Character.valueOf((char) 13)).toString(), "<br>");
						request.setAttribute("PMENSAPOPUP", format);
					}
				}
			}

		} catch (Exception e) {
			log.error("Error", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.cargarcombos(request, thisAction);
		this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
	}
}
