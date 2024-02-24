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
import axis.jdbc.PAC_IAX_PARAM;
import axis.jdbc.PAC_IAX_PERSONA;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.control.modal.Axisper001Action;
import axis.mvc.model.UsuarioBean;
import axis.mvc.view.VisibleTag;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

public class Axisper001Service extends AxisBaseService {
	Log log = LogFactory.getLog(this.getClass());
	private String SNIP;

	/*********************************************************************************************************************/
	/************************************************
	 * M�TODOS DE INICIALIZACI�N
	 *******************************************/

	/*********************************************************************************************************************/
	public

			void m_init(HttpServletRequest request, Axisper001Action thisAction) {
		try {
			request.getSession().removeAttribute("axisper001_listaPersonas");
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));

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
	public void m_form(HttpServletRequest request, Axisper001Action thisAction) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);

		try {

			request.getSession().setAttribute("num_max_filas", Constantes.num_max_filas);
			request.getSession().removeAttribute("axisper001_listaPersonas");
			this.cargarcombos(request, thisAction);

			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));

		} catch (Exception e) {
			log.error("Error", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

	private void cargarcombos(HttpServletRequest request, Axisper001Action thisAction) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		Map listValores = new HashMap();
		try {
			PAC_IAX_LISTVALORES pac_axis_listValores = new PAC_IAX_LISTVALORES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			// Tipo de documento
			BigDecimal CTIPPER = getCampoNumerico(request, "CTIPPER");
			Map map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_GET_TIPDOCUM_TIPPER(CTIPPER);
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
	 * axisper001_listaPersonas.
	 * 
	 * @param request    El HttpServletRequest que contiene la petici�n del cliente
	 *                   web.
	 * @param thisAction Una Action abstracta desde donde se ha invocado el servicio
	 *                   (necesaria para el log).
	 */
	public void m_busqueda_persona(HttpServletRequest request, Axisper001Action thisAction) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);

		try {

			// Recuperar persona a buscar
			String NNUMNIF = getCampoTextual(request, "NNUMNIF");
			String NOMBRE = getCampoTextual(request, "NOMBRE");
			String NOMBRECOMP = getCampoTextual(request, "NOMBRECOMP");
			String NSIP = getCampoTextual(request, "NSIP");
			SNIP = NSIP;
			BigDecimal CTIPIDE = getCampoNumerico(request, "CTIPIDE");
			String TAPELLI1 = getCampoTextual(request, "TAPELLI1");
			String TAPELLI2 = getCampoTextual(request, "TAPELLI2");
			java.sql.Date FNACIMI = this.stringToSqlDate(this.getCampoTextual(request, "FNACIMI"));
			String TDOMICI = getCampoTextual(request, "TDOMICI");
			String CPOSTAL = getCampoTextual(request, "CPOSTAL");
			String FIDEICO = getCampoTextual(request, "FIDEICO");
			if (!isEmpty(CPOSTAL))
				CPOSTAL = CPOSTAL.toUpperCase();

			// POSEM AIX� PER TAL QUE ENS MOSTRI LES DIRECCIONS DE LES PERSONES QUE BUSQUEM
			// TOT I QUE NO
			// FILTREM LA CERCA PER EL TDOMICI, XPL BUG .9227
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
			if (VisibleTag.esComponenteVisible(request, "axisper001", "TDOMICI")) {
				if (isEmpty(TDOMICI))
					TDOMICI = "%";
			}

			if (formdata.get("paginar") == null) {

				request.getSession().removeAttribute("axisper001_listaPersonas");
				PAC_IAX_PERSONA PAC_IAX_PERSONA = new PAC_IAX_PERSONA(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

				BigDecimal SSEGURO = (BigDecimal) AbstractDispatchAction.topPila(request, "SSEGURO");
				// Map map =
				// pacIaxListavlores.ejecutaPAC_IAX_LISTVALORES__F_GET_PERSONAS(NNUMNIF, NOMBRE,
				// NSIP, SSEGURO);

				// Bug 36596 IGIL INI

				Map map = PAC_IAX_PERSONA.ejecutaPAC_IAX_PERSONA__F_GET_PERSONAS_AGENTES(NNUMNIF, NOMBRECOMP, NSIP,
						SSEGURO, NOMBRE, TAPELLI1, TAPELLI2, CTIPIDE, FNACIMI, TDOMICI, CPOSTAL,
						(String) request.getSession().getAttribute("HOSPITAL"), FIDEICO);
				log.debug(map);
				// Bug 36596 IGIL FIN
				request.getSession().setAttribute("axisper001_listaPersonas",
						(ArrayList) tratarRETURNyMENSAJES(request, map));
			}
		} catch (Exception e) {
			log.error("Error", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.cargarcombos(request, thisAction);
		this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
	}

	public void m_busqueda_persona_host(HttpServletRequest request, Axisper001Action thisAction) {
		log.debug("m_busqueda_persona_host");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		boolean isExtended = false;
		boolean existDataLocal = false;
		boolean buscarHost = false;
		try {
			PAC_IAX_PARAM pac_iax_param = new PAC_IAX_PARAM(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map m = pac_iax_param.ejecutaPAC_IAX_PARAM__F_PAREMPRESA_N("BUSCARHOSTEXTENDED", usuario.getCempres());
			isExtended = (m.get("RETURN") != null && ((BigDecimal) m.get("RETURN")).intValue() == 1);
		} catch (Exception e) {
			log.error("Error", e);

		}
		// Recuperar persona a buscar
		String NNUMNIF = getCampoTextual(request, "NNUMNIF");
		String NOMBRE = getCampoTextual(request, "NOMBRE");
		String NOMBRECOMP = getCampoTextual(request, "NOMBRECOMP");
		String NSIP = getCampoTextual(request, "NSIP");
		SNIP = NSIP;
		BigDecimal CTIPIDE = getCampoNumerico(request, "CTIPIDE");
		String TAPELLI1 = getCampoTextual(request, "TAPELLI1");
		String TAPELLI2 = getCampoTextual(request, "TAPELLI2");
		java.sql.Date FNACIMI = this.stringToSqlDate(this.getCampoTextual(request, "FNACIMI"));
		String TDOMICI = getCampoTextual(request, "TDOMICI");
		String CPOSTAL = getCampoTextual(request, "CPOSTAL");
		String MASDATOS = getCampoTextual(request, "MASDATOS");
		String FIDEICO = getCampoTextual(request, "FIDEICO");
		if (!isEmpty(CPOSTAL))
			CPOSTAL = CPOSTAL.toUpperCase();
		if (isExtended) {
			try {
				this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
				if (VisibleTag.esComponenteVisible(request, "axisper001", "TDOMICI")) {
					if (isEmpty(TDOMICI))
						TDOMICI = "%";
				}
				if (formdata.get("paginar") == null) {
					request.getSession().removeAttribute("axisper001_listaPersonas");
					PAC_IAX_PERSONA PAC_IAX_PERSONA = new PAC_IAX_PERSONA(
							(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
					BigDecimal SSEGURO = (BigDecimal) AbstractDispatchAction.topPila(request, "SSEGURO");
					// Bug 36596 IGIL INI

					Map map = PAC_IAX_PERSONA.ejecutaPAC_IAX_PERSONA__F_GET_PERSONAS_AGENTES(NNUMNIF, NOMBRECOMP, NSIP,
							SSEGURO, NOMBRE, TAPELLI1, TAPELLI2, CTIPIDE, FNACIMI, TDOMICI, CPOSTAL,
							(String) request.getSession().getAttribute("HOSPITAL"), FIDEICO);
					log.debug(map);
					// Bug 36596 IGIL FIN
					existDataLocal = (map.get("RETURN") != null && ((List) map.get("RETURN")).size() > 0);
					request.getSession().setAttribute("axisper001_listaPersonas",
							(ArrayList) tratarRETURNyMENSAJES(request, map));
				}
			} catch (Exception e) {
				log.error("Error", e);
				thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
			}
		}

		try {
			if (!existDataLocal) {
				if (formdata.get("paginar") == null) {
					Map map = new HashMap();
					HashMap mostrar;
					PAC_IAX_PARAM param = new PAC_IAX_PARAM(
							(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
					mostrar = param.ejecutaPAC_IAX_PARAM__F_PAREMPRESA_N("BUSQUEDA_HOST", usuario.getCempres());

					if (mostrar.get("RETURN") != null && mostrar.get("RETURN").equals(BigDecimal.ONE)) {

						if (CTIPIDE == null && NNUMNIF == null && NSIP == null) {
							thisAction.guardarMensaje(request, "9906859", new Object[] { "" },
									Constantes.MENSAJE_ERROR);
							buscarHost = true;
						} else if (CTIPIDE != null && NNUMNIF == null) {
							thisAction.guardarMensaje(request, "9902301", new Object[] { "" },
									Constantes.MENSAJE_ERROR);
							buscarHost = true;
						} else if (CTIPIDE == null && NNUMNIF != null) {
							thisAction.guardarMensaje(request, "9906861", new Object[] { "" },
									Constantes.MENSAJE_ERROR);
							buscarHost = true;
						}
					}

					if (!buscarHost) {

						request.getSession().removeAttribute("axisper001_listaPersonas");
						PAC_IAX_PERSONA PAC_IAX_PERSONA = new PAC_IAX_PERSONA(
								(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
						PAC_IAX_CON PAC_IAX_CON = new PAC_IAX_CON(
								(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

						if (isEmpty(MASDATOS)) {
							BigDecimal SSEGURO = (BigDecimal) AbstractDispatchAction.topPila(request, "SSEGURO");
							// Map map =
							// pacIaxListavlores.ejecutaPAC_IAX_LISTVALORES__F_GET_PERSONAS(NNUMNIF, NOMBRE,
							// NSIP, SSEGURO);
							map = PAC_IAX_PERSONA.ejecutaPAC_IAX_PERSONA__F_GET_PERSONAS_HOST(NNUMNIF, NOMBRECOMP, NSIP,
									SSEGURO, NOMBRE, TAPELLI1, TAPELLI2, CTIPIDE);
							log.debug("host-->" + map);
						} else {
							map = PAC_IAX_PERSONA.ejecutaPAC_IAX_PERSONA__F_BUSQUEDA_MASDATOS();
							log.debug(map);
							tratarRETURNyMENSAJES(request, map);
						}
					}

					request.getSession().setAttribute("existMasInfo", map.get("POMASDATOS"));

					log.debug("POMASDATOS-->" + map.get("POMASDATOS"));
					request.getSession().setAttribute("axisper001_listaPersonas",
							(ArrayList) tratarRETURNyMENSAJES(request, map));
				}
			}
		} catch (Exception e) {
			log.error("Error", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.cargarcombos(request, thisAction);
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
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
	public void m_traspaso_persona(HttpServletRequest request, Axisper001Action thisAction) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);

		try {

			// Recuperar persona a buscar
			BigDecimal SPERSON = getCampoNumerico(request, "SPERSON");
			String CODITABLAS = getCampoTextual(request, "CODITABLAS");
			String SNIP = getCampoTextual(request, "SNIP");
			BigDecimal CEMPRES = null;
			BigDecimal CAGENTE = null;

			if (formdata.get("paginar") == null) {
				request.getSession().removeAttribute("axisper001_listaPersonas");
				PAC_IAX_PERSONA pac_axis_persona = new PAC_IAX_PERSONA(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
				BigDecimal SSEGURO = (BigDecimal) AbstractDispatchAction.topPila(request, "SSEGURO");

				log.debug("pila nova-->" + request.getSession().getAttribute("PASSTOPPILA"));
				BigDecimal SSEGURO_OUT = (BigDecimal) AbstractDispatchAction.topPila(request, "SSEGURO_OUT");

				Map map = new HashMap();

				SSEGURO_OUT = !isEmpty(SSEGURO_OUT) ? SSEGURO_OUT : SSEGURO;
				map = pac_axis_persona.ejecutaPAC_IAX_PERSONA__F_TRASPASAPERSONAEST(SPERSON, CAGENTE, CODITABLAS,
						SSEGURO_OUT, SNIP);
				log.debug(map);

				if (!isEmpty(map) && new BigDecimal(0).equals(tratarRETURNyMENSAJES(request, map))) {
					request.setAttribute("SPERSON_OUT", map.get("PSPERSON_OUT"));
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

	// PAC_IAX_PERSONA__F_TRASPASAPERSONAEST
}
