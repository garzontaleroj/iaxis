//Revision:# xV3p6S75OlJcMtlcuiRlcQ== #
package axis.service.modal;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.jdbc.PAC_IAX_PERSONA;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.control.modal.Axisper026Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

public class Axisper026Service extends AxisBaseService {
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
	public void m_form(HttpServletRequest request, Axisper026Action thisAction) {
		logger.debug("Axisper026Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {
			cargarValoresDesplegables(request, thisAction, usuario, formdata);

		} catch (Exception e) {
			logger.error("Error en el m�todo Axisper026Service.m_form", e);
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
	private void cargarValoresDesplegables(HttpServletRequest request, Axisper026Action thisAction, UsuarioBean usuario,
			Map formdata) throws Exception {
		// Carga de valores de los desplegables
		Map listValores = new HashMap();
		try {
			PAC_IAX_LISTVALORES pac_axis_listValores = new PAC_IAX_LISTVALORES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			BigDecimal CTIPPER = getCampoNumerico(request, "selectedCTIPPER");

			// Tipo de Persona Relacionada
			Map map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_GET_REGIMENFISCAL(CTIPPER);
			logger.debug(map);
			listValores.put("regFisc", (List) tratarRETURNyMENSAJES(request, map));

			/* LSTTIPOIVA */
			map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTTIPOIVA();
			logger.debug(map);
			listValores.put("LSTTIPOIVA", tratarRETURNyMENSAJES(request, map, false));

		} catch (Exception e) {
			logger.error("Error en el m�todo Axisper026Service.cargarValoresDesplegables", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			formdata.put("listValores", listValores);
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

	public Persona initPersona(HttpServletRequest request, Axisper026Action thisAction) {
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
		BigDecimal CAGENTE = getCampoNumerico(request, "CAGENTE"); // null siempre
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
	public BigDecimal m_grabarRegimen(Persona persona, HttpServletRequest request, Axisper026Action thisAction,
			boolean isNew) {
		logger.debug("Axisper026Service m_grabarRegimen");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {
			PAC_IAX_PERSONA pac_axis_persona = new PAC_IAX_PERSONA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			// BigDecimal SPERSON = getCampoNumerico(request, "SPERSON");
			// BigDecimal CAGENTE = getCampoNumerico(request, "CAGENTE");
			// BigDecimal SPERSON_REL = getCampoNumerico(request, "SPER_AUX");
			BigDecimal CTIPPER = getCampoNumerico(request, "selectedCTIPPER");
			java.sql.Date FEFECTO = stringToSqlDate(getCampoTextual(request, "FEFECTO"));
			BigDecimal CREGFISCAL = getCampoNumerico(request, "CREGFISCAL");
			BigDecimal CREGFISEXEIVA = getHiddenCampoNumerico(request, "CREGFISEXEIVA_CHECK");
			BigDecimal CTIPIVA = getCampoNumerico(request, "CTIPIVA");

			if (CREGFISEXEIVA == null)
				CREGFISEXEIVA = new BigDecimal(0);

			boolean todoOk = true;

			Map map = pac_axis_persona.ejecutaPAC_IAX_PERSONA__F_SET_REGIMENFISCAL(persona.SPERSON, persona.CAGENTE,
					FEFECTO, CREGFISCAL, CREGFISEXEIVA, CTIPIVA);
			logger.debug(map);
			todoOk = new BigDecimal(0).equals(tratarRETURNyMENSAJES(request, map));

			if (todoOk) {
				formdata.put("REGFISCOUT", CREGFISCAL);

			} else
				todoOk = false;

			return todoOk ? new BigDecimal(0) : new BigDecimal(1);

		} catch (Exception e) {
			logger.error("Error en el m�todo Axisper026Service.m_grabarRegimen", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
			return new BigDecimal(1);
		}
		// this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
	}

}
