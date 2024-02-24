package axis.service.modal;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_PERSONA;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.control.modal.Axisper011Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

public class Axisper011Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	/*********************************************************************************************************************/
	/************************************************
	 * M�TODOS DE INICIALIZACI�N
	 *******************************************/
	/*********************************************************************************************************************/

	/**
	 * Realiza la carga inicial de la pantalla.
	 * 
	 * @param request    El HttpServletRequest que contiene la petici�n del cliente
	 *                   web.
	 * @param thisAction Una Action abstracta desde donde se ha invocado el servicio
	 *                   (necesaria para el log).
	 */

	/**
	 * Realiza la carga inicial de la pantalla.
	 * 
	 * @param request    El HttpServletRequest que contiene la petici�n del cliente
	 *                   web.
	 * @param thisAction Una Action abstracta desde donde se ha invocado el servicio
	 *                   (necesaria para el log).
	 */
	public void m_form(HttpServletRequest request, Axisper011Action thisAction) {
		logger.debug("Axisper011Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {
			BigDecimal SPERSON = getCampoNumerico(request, "SPERSON");
			BigDecimal CAGENTE = getCampoNumerico(request, "CAGENTE");
			; // null siempre
			String CTABLAS = this.getCampoTextual(request, "CTABLAS");
			logger.debug("CAG-->" + CAGENTE);
			logger.debug("SPERSON-->" + SPERSON);

			PAC_IAX_PERSONA pac_axis_persona = new PAC_IAX_PERSONA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			cargarValoresDesplegables(request, thisAction, usuario, formdata);

			if (!isEmpty(getCampoTextual(request, "CMODCON")) && isEmpty(getCampoTextual(request, "TTIPCON")))
				cargarPersona(request, thisAction, usuario, formdata);

			if (!isEmpty(SPERSON) && !isEmpty(CAGENTE)) {
				/* BUG 24806 */

				Map map = null;
				if (CTABLAS.equalsIgnoreCase("POL"))
					map = pac_axis_persona.ejecutaPAC_IAX_PERSONA__F_GET_PERSONA(SPERSON, CAGENTE);
				else if (CTABLAS.equalsIgnoreCase("EST"))
					map = pac_axis_persona.ejecutaPAC_IAX_PERSONA__F_GET_ESTPERSONA(SPERSON, CAGENTE);

				logger.debug(map);
				Map OBPERSONA = (Map) map.get("OBPERSONA");
				tratarRETURNyMENSAJES(request, map);
				formdata.put("DIRECCIONES", OBPERSONA.get("DIRECCIONES"));

				// 34583-203291
				List list = (List) OBPERSONA.get("DIRECCIONES");
				if (!isEmpty(list)) {
					HashMap dire = (HashMap) list.get(0);
					HashMap OB_IAX_DIRECCIONE = (HashMap) dire.get("OB_IAX_DIRECCIONES");
					formdata.put("CPAIS", OB_IAX_DIRECCIONE.get("CPAIS"));
				}
			}
		} catch (Exception e) {
			logger.error("Error en el m�todo Axisper011Service.m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
	}

	/**
	 * Realiza una carga de BD de los valores est�ticos que contiene cada
	 * desplegable de la pantalla.
	 * 
	 * @param request    El HttpServletRequest que contiene la petici�n del cliente
	 *                   web.
	 * @param thisAction Una Action abstracta desde donde se ha invocado el servicio
	 *                   (necesaria para el log).
	 * @param usuario    El UsuarioBean activo.
	 * @param formdata   HashMap que contiene los valores de los request parameters.
	 * @throws Exception
	 */

	private void cargarValoresDesplegables(HttpServletRequest request, Axisper011Action thisAction, UsuarioBean usuario,
			Map formdata) throws Exception {
		// Carga de valores de los desplegables
		Map listValores = new HashMap();
		try {
			PAC_IAX_PERSONA pac_axis_persona = new PAC_IAX_PERSONA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			// lista tipos contactos

			Map map = pac_axis_persona.ejecutaPAC_IAX_PERSONA__F_GET_TIPCONTACTOS();
			Map mapPaises = pac_axis_persona.ejecutaPAC_IAX_PERSONA__F_GET_PREFIJOSPAISES();

			logger.debug(map);
			listValores.put("lsttipcontactos", (List) tratarRETURNyMENSAJES(request, map, false));
			listValores.put("listPrefijos", tratarRETURNyMENSAJES(request, mapPaises, false));

		} catch (Exception e) {
			logger.error("Error en el m�todo Axisper011Service.cargarValoresDesplegables", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			formdata.put("listValores", listValores);
		}
		this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
	}

	/**
	 * Realiza una carga de BD de los valores est�ticos que contiene cada
	 * desplegable de la pantalla.
	 * 
	 * @param request    El HttpServletRequest que contiene la petici�n del cliente
	 *                   web.
	 * @param thisAction Una Action abstracta desde donde se ha invocado el servicio
	 *                   (necesaria para el log).
	 * @param usuario    El UsuarioBean activo.
	 * @param formdata   HashMap que contiene los valores de los request parameters.
	 * @throws Exception
	 */

	private void cargarPersona(HttpServletRequest request, Axisper011Action thisAction, UsuarioBean usuario,
			Map formdata) throws Exception {
		Map OBPERSONA = new HashMap();
		Map map = new HashMap();
		try {
			BigDecimal SPERSON = getCampoNumerico(request, "SPERSON");
			BigDecimal CMODCON = getCampoNumerico(request, "CMODCON");
			String CTABLAS = this.getCampoTextual(request, "CTABLAS");

			BigDecimal CEMPRES = null; // null siempre
			BigDecimal CAGENTE = getCampoNumerico(request, "CAGENTE");
			; // null siempre
			logger.debug("CAG-->" + CAGENTE);

			PAC_IAX_PERSONA pac_axis_persona = new PAC_IAX_PERSONA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			OBPERSONA.put("isNew", Boolean.valueOf(true));

			/* Estado persona */
			if (!isEmpty(SPERSON)) {
				OBPERSONA.put("isNew", Boolean.valueOf(false));

				/* CONTACTO SELECCIONADO */
				if (CTABLAS.equalsIgnoreCase("POL"))
					map = pac_axis_persona.ejecutaPAC_IAX_PERSONA__F_GET_CONTACTO(SPERSON, CAGENTE, CMODCON);
				else if (CTABLAS.equalsIgnoreCase("EST"))
					map = pac_axis_persona.ejecutaPAC_IAX_PERSONA__F_GET_ESTCONTACTO(SPERSON, CAGENTE, CMODCON);

				logger.debug(map);
				tratarRETURNyMENSAJES(request, map);
				if (!isEmpty(map))
					OBPERSONA.put("CONTACTO", map.get("OB_IAX_CONTACTOS"));
				/* BUG 24806 */
				if (CTABLAS.equalsIgnoreCase("POL"))
					map = pac_axis_persona.ejecutaPAC_IAX_PERSONA__F_GET_PERSONA(SPERSON, CAGENTE);
				else if (CTABLAS.equalsIgnoreCase("EST"))
					map = pac_axis_persona.ejecutaPAC_IAX_PERSONA__F_GET_ESTPERSONA(SPERSON, CAGENTE);

				logger.debug(map);
				Map OBPERSONADIR = (Map) map.get("OBPERSONA");
				tratarRETURNyMENSAJES(request, map);
				formdata.put("DIRECCIONES", OBPERSONADIR.get("DIRECCIONES"));
				/* FIN BUG 24806 */
			}

		} catch (Exception e) {
			logger.error("Error en el m�todo Axisper011Service.cargarPersona", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			if (!isEmpty(map)) {
				formdata.putAll((Map) OBPERSONA.get("CONTACTO"));
				formdata.putAll(OBPERSONA);
			}
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	/*********************************************************************************************************************/
	/****************************************
	 * INNER CLASS QUE REPRESENTA UNA PERSONA
	 *************************************/
	/*********************************************************************************************************************/

	public class Persona {
		// Necesarios s�lo para GRABAR
		BigDecimal SSEGURO;
		BigDecimal SPERSON;
		BigDecimal SPEREAL;
		BigDecimal CAGENTE;
		BigDecimal CEMPRES;
		// Necesarios para VALIDAR y GRABAR
		BigDecimal CTIPPER;
		BigDecimal CTIPIDE;
		String NNUMIDE;
		BigDecimal CSEXPER;
		java.sql.Date FNACIMI;
		String SNIP;
		BigDecimal CESTPER;
		java.sql.Date FJUBILA;
		BigDecimal CMUTUALISTA;
		java.sql.Date FDEFUNC;
		BigDecimal NORDIDE;
		BigDecimal CIDIOMA;
		String TAPELLI1;
		String TAPELLI2;
		String TNOMBRE;
		String TSIGLAS;
		String CPROFES;
		BigDecimal CESTCIV;
		BigDecimal CPAIS;
		BigDecimal CNACIONALIDAD;
		BigDecimal CDOMICI;
		String TNOMBRE1;
		String TNOMBRE2;
		BigDecimal SWRUT;

		public Persona(BigDecimal SSEGURO, BigDecimal SPERSON, BigDecimal SPEREAL, BigDecimal CAGENTE,
				BigDecimal CEMPRES, BigDecimal CTIPPER, BigDecimal CTIPIDE, String NNUMIDE, BigDecimal CSEXPER,
				java.sql.Date FNACIMI, String SNIP, BigDecimal CESTPER, java.sql.Date FJUBILA, BigDecimal CMUTUALISTA,
				java.sql.Date FDEFUNC, BigDecimal NORDIDE, BigDecimal CIDIOMA, String TAPELLI1, String TAPELLI2,
				String TNOMBRE, String TSIGLAS, String CPROFES, BigDecimal CESTCIV, BigDecimal CPAIS,
				BigDecimal CNACIONALIDAD, BigDecimal CDOMICI, String TNOMBRE1, String TNOMBRE2, BigDecimal SWRUT) {
			this.SSEGURO = SSEGURO;
			this.SPERSON = SPERSON;
			this.SPEREAL = SPEREAL;
			this.CAGENTE = CAGENTE;
			this.CEMPRES = CEMPRES;

			this.CTIPPER = CTIPPER;
			this.CTIPIDE = CTIPIDE;
			this.NNUMIDE = NNUMIDE;
			this.CSEXPER = CSEXPER;
			this.FNACIMI = FNACIMI;
			this.SNIP = SNIP;
			this.CESTPER = CESTPER;
			this.FJUBILA = FJUBILA;
			this.CMUTUALISTA = CMUTUALISTA;
			this.FDEFUNC = FDEFUNC;
			this.NORDIDE = NORDIDE;
			this.CIDIOMA = CIDIOMA;
			this.TAPELLI1 = TAPELLI1;
			this.TAPELLI2 = TAPELLI2;
			this.TNOMBRE = TNOMBRE;
			this.TSIGLAS = TSIGLAS;
			this.CPROFES = CPROFES;
			this.CESTCIV = CESTCIV;
			this.CPAIS = CPAIS;
			this.CNACIONALIDAD = CNACIONALIDAD;
			this.CDOMICI = CDOMICI;
			this.TNOMBRE1 = TNOMBRE1;
			this.TNOMBRE2 = TNOMBRE2;
			this.SWRUT = SWRUT;
		}

		/**
		 * M�todos que auto-graban la persona
		 * 
		 * @param pac_axis_persona - Instancia de PAC_IAX_PERSONA
		 * @return Map - El retorno de la funci�n de PAC_IAX_PERSONA
		 * @throws Exception
		 */
		public Map grabaEstPersona(PAC_IAX_PERSONA pac_axis_persona) throws Exception {
			Map map = pac_axis_persona.ejecutaPAC_IAX_PERSONA__F_SET_ESTPERSONA(SSEGURO, SPERSON, SPEREAL, CAGENTE,
					CTIPPER, CTIPIDE, NNUMIDE, CSEXPER, FNACIMI, SNIP, CESTPER, FJUBILA, CMUTUALISTA, FDEFUNC, NORDIDE,
					CIDIOMA, TAPELLI1, TAPELLI2, TNOMBRE, TSIGLAS, CPROFES, CESTCIV, CPAIS, TNOMBRE1, TNOMBRE2, SWRUT,
					null);
			logger.debug(map);
			return map;
		}
	}

	/*********************************************************************************************************************/
	/************************************************
	 * M�TODOS DE ACTUALIZACI�N
	 *******************************************/
	/*********************************************************************************************************************/

	/**
	 * Inicializa y devuelve un objeto Persona con los par�metros introducidos en el
	 * formulario.
	 * 
	 * @param request    El HttpServletRequest que contiene la petici�n del cliente
	 *                   web.
	 * @param thisAction Una Action abstracta desde donde se ha invocado el servicio
	 *                   (necesaria para el log).
	 * @return Persona - El objeto Persona rellenado con los datos del formulario.
	 * @throws Exception
	 */

	public Persona initPersona(HttpServletRequest request, Axisper011Action thisAction) {
		BigDecimal CTIPPER = getCampoNumerico(request, "CTIPPER");
		BigDecimal CTIPIDE = getCampoNumerico(request, "CTIPIDE");
		String NNUMIDE = getCampoTextual(request, "NNUMIDE");
		BigDecimal CSEXPER = getCampoNumerico(request, "CSEXPER");
		java.sql.Date FNACIMI = stringToSqlDate(getCampoTextual(request, "FNACIMI"));
		String SNIP = getCampoTextual(request, "SNIP");
		BigDecimal CESTPER = getCampoNumerico(request, "CESTPER");
		java.sql.Date FJUBILA = stringToSqlDate(getCampoTextual(request, "FJUBILA"));
		BigDecimal CMUTUALISTA = getCampoNumerico(request, "CMUTUALISTA");
		java.sql.Date FDEFUNC = stringToSqlDate(getCampoTextual(request, "FDEFUNC"));
		BigDecimal NORDIDE = getCampoNumerico(request, "NORDIDE");
		BigDecimal CIDIOMA = getCampoNumerico(request, "CIDIOMA");
		String TAPELLI1 = getCampoTextual(request, "TAPELLI1");
		String TAPELLI2 = getCampoTextual(request, "TAPELLI2");
		String TNOMBRE = getCampoTextual(request, "TNOMBRE");
		String TNOMBRE1 = getCampoTextual(request, "TNOMBRE1");
		String TNOMBRE2 = getCampoTextual(request, "TNOMBRE2");
		String TSIGLAS = null;
		if (new BigDecimal(2).equals(CTIPPER)) {
			TNOMBRE = null;
			TNOMBRE1 = null;
			TNOMBRE2 = null;
			TSIGLAS = getCampoTextual(request, "TNOMBRE");
		}
		String CPROFES = getCampoTextual(request, "CPROFES");
		BigDecimal CESTCIV = new BigDecimal(12); // Siempre 12
		BigDecimal CPAIS = getCampoNumerico(request, "CPAIS");
		BigDecimal CNACIONALIDAD = getCampoNumerico(request, "CNACIONALIDAD");
		BigDecimal CDOMICI = getCampoNumerico(request, "CDOMICI");

		// Esto es necesario para el CREAR //

		// BigDecimal SSEGURO = getCampoNumerico (request, "SSEGURO");
		BigDecimal SSEGURO = (BigDecimal) AbstractDispatchAction.topPila(request, "SSEGURO");
		BigDecimal SPERSON = getCampoNumerico(request, "SPERSON");
		BigDecimal SPEREAL = getCampoNumerico(request, "SPEREAL");
		// UsuarioBean usuario = (UsuarioBean)
		// request.getSession().getAttribute(Constantes.USUARIO);
		// BigDecimal CAGENTE = usuario.getCagente();
		BigDecimal CAGENTE = getCampoNumerico(request, "CAGENTE");
		; // null siempre
		BigDecimal CEMPRES = null; // null siempre
		BigDecimal SWRUT = getCampoNumerico(request, "SWRUT");

		return new Persona(SSEGURO, SPERSON, SPEREAL, CAGENTE, CEMPRES, CTIPPER, CTIPIDE, NNUMIDE, CSEXPER, FNACIMI,
				SNIP, CESTPER, FJUBILA, CMUTUALISTA, FDEFUNC, NORDIDE, CIDIOMA, TAPELLI1, TAPELLI2, TNOMBRE, TSIGLAS,
				CPROFES, CESTCIV, CPAIS, CNACIONALIDAD, CDOMICI, TNOMBRE1, TNOMBRE2, SWRUT);

	}

	/**
	 * @param request    El HttpServletRequest que contiene la petici�n del cliente
	 *                   web.
	 * @param thisAction Una Action abstracta desde donde se ha invocado el servicio
	 *                   (necesaria para el log).
	 * @return BigDecimal Indicando si todo ha ido bien o no.
	 * @throws Exception
	 */
	public BigDecimal m_grabarContactoPersona(Persona persona, HttpServletRequest request, Axisper011Action thisAction,
			boolean isNew) {
		logger.debug("Axisper011Service m_grabarContactoPersona");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {
			logger.debug("Axisper011Service().m_grabarContactoPersona .....................");

			PAC_IAX_PERSONA pac_axis_persona = new PAC_IAX_PERSONA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			// 34583-203291
			HashMap m = this.f_Get_Avisos(request, this.whoami(this));
			BigDecimal pRETURN = (BigDecimal) this.tratarRETURNyMENSAJES(request, m);
			request.setAttribute("PLSTAVISOS", m.get("PLSTAVISOS"));

			// 34583-203291
			if (pRETURN != null && pRETURN.intValue() != 1) {
				String TCOMCON = getCampoTextual(request, "TCOMCON");
				BigDecimal CMODCON = getCampoNumerico(request, "CMODCON");
				BigDecimal CTIPCON = getCampoNumerico(request, "CTIPCON");
				String TVALCON = getCampoTextual(request, "TVALCON");
				BigDecimal CDOMICI = getCampoNumerico(request, "CDOMICI");
				BigDecimal COUNTRIES_PER011 = getCampoNumerico(request, "COUNTRIES_PER011");
				String CTABLAS = this.getCampoTextual(request, "CTABLAS");
				boolean todoOk = true;

				Map map = null;
				if (CTABLAS.equalsIgnoreCase("POL"))
					map = pac_axis_persona.ejecutaPAC_IAX_PERSONA__F_SET_CONTACTO(persona.SPERSON, persona.CAGENTE,
							CTIPCON, TCOMCON, TVALCON, CMODCON, CDOMICI, COUNTRIES_PER011);
				else if (CTABLAS.equalsIgnoreCase("EST"))
					map = pac_axis_persona.ejecutaPAC_IAX_PERSONA__F_SET_ESTCONTACTO(persona.SPERSON, persona.CAGENTE,
							CTIPCON, TCOMCON, TVALCON, CMODCON, CDOMICI, COUNTRIES_PER011);

				logger.debug(map);
				todoOk = new BigDecimal(0).equals(tratarRETURNyMENSAJES(request, map));

				if (!isEmpty(map) && !isEmpty(map.get("PSMODCONOUT")))
					formdata.put("SMODCONOUT", map.get("PSMODCONOUT").toString());
				else
					todoOk = false;

				if (!todoOk)
					formdata.put("SMODCONOUT", null);

				return todoOk ? new BigDecimal(0) : new BigDecimal(1);
			} else
				return new BigDecimal(1);

		} catch (Exception e) {
			logger.error("Error en el m�todo Axisper011Service.m_grabarContactoPersona", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
			return new BigDecimal(1);

		}

	}

}
