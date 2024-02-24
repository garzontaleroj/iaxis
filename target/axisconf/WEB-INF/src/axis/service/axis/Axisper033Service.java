//Revision:# 6Lg1fjFFTc1A4ehrVi6c5A== #
package axis.service.axis;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_FUSIONPERSONA;
import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.jdbc.PAC_IAX_PERSONA;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.control.axis.Axisper033Action;
import axis.mvc.model.UsuarioBean;
import axis.util.Constantes;

public class Axisper033Service extends AxisBaseService {
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
	public void m_form(HttpServletRequest request, Axisper033Action thisAction) {
		logger.debug("Axisper033Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {

			// request.removeAttribute("dades_persona");
			request.getSession().removeAttribute("AXISMPRXXX_EST");

			cargarValoresDesplegables(request, thisAction, usuario, formdata);

			cargarPersona(request, thisAction, usuario, formdata);

		} catch (Exception e) {
			logger.error("Error en el m�todo Axisper033Service.m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
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

	private void cargarValoresDesplegables(HttpServletRequest request, Axisper033Action thisAction, UsuarioBean usuario,
			Map formdata) throws Exception {
		// Carga de valores de los desplegables
		Map listValores = new HashMap();
		try {
			PAC_IAX_LISTVALORES pac_axis_listValores = new PAC_IAX_LISTVALORES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			PAC_IAX_PERSONA pac_axis_persona = new PAC_IAX_PERSONA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			// Tipo de persona
			Map map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_GET_TIPPERSON();
			logger.debug(map);
			listValores.put("tipPerson", (List) tratarRETURNyMENSAJES(request, map));

			// Tipo de sexo
			map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_GET_TIPSEXO();
			logger.debug(map);
			listValores.put("tipSexo", (List) tratarRETURNyMENSAJES(request, map));

			// Lista idiomas
			map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTIDIOMAS();
			logger.debug(map);
			listValores.put("lstIdiomas", (List) tratarRETURNyMENSAJES(request, map));

			// Lista profesiones
			map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTPROFESIONES(new BigDecimal(0));
			logger.debug(map);
			listValores.put("lstProfesiones", (List) tratarRETURNyMENSAJES(request, map, false));

			// Lista pa�ses
			map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTPAISES();
			logger.debug(map);
			listValores.put("lstPaises", (List) tratarRETURNyMENSAJES(request, map, false));

			/*
			 * // Lista tipo de tarjetas map =
			 * pac_axis_persona.ejecutaPAC_IAX_PERSONA__F_GET_TIPCCC(new BigDecimal("2"));
			 * logger.debug(map); listValores.put("tipCCC", (List)
			 * tratarRETURNyMENSAJES(request, map));
			 * 
			 * // Lista tipo de cuentas map =
			 * pac_axis_persona.ejecutaPAC_IAX_PERSONA__F_GET_TIPCCC(new BigDecimal("1"));
			 * logger.debug(map); listValores.put("tipTARJETA", (List)
			 * tratarRETURNyMENSAJES(request, map));
			 * 
			 * // Lista tipo direcciones map =
			 * pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTTIPODIRECCION();
			 * logger.debug(map); listValores.put("lstTipoDireccion", (List)
			 * tratarRETURNyMENSAJES(request, map));
			 * 
			 * // Lista tipo v�as map =
			 * pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTTIPOVIA();
			 * logger.debug(map); listValores.put("lstTipoVia", (List)
			 * tratarRETURNyMENSAJES(request, map));
			 */
		} catch (Exception e) {
			logger.error("Error en el m�todo Axisper033Service.cargarValoresDesplegables", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			formdata.put("listValores", listValores);
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));

		}
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

	private void cargarPersona(HttpServletRequest request, Axisper033Action thisAction, UsuarioBean usuario,
			Map formdata) throws Exception {
		Map OBPERSONA = new HashMap();

		try {

			BigDecimal SPERSON = null;
			BigDecimal SPERSON2 = null;
			SPERSON = getCampoNumerico(request, "SPERSON1");
			SPERSON2 = getCampoNumerico(request, "SPERSON2");
			formdata.put("SPERSON1", SPERSON);
			formdata.put("SPERSON2", SPERSON2);
			logger.debug("SPERSON ----> " + SPERSON);
			logger.debug("SPERSON2 ----> " + SPERSON2);

			BigDecimal CEMPRES = null; // null siempre
			BigDecimal CAGENTE = getCampoNumerico(request, "CAGENTE"); // null siempre
			BigDecimal CAGENTE2 = getCampoNumerico(request, "CAGENTE2");
			logger.debug("CAGENTE ----> " + CAGENTE);
			logger.debug("CAGENTE2 ----> " + CAGENTE2);

			logger.debug("OBPERSONA.put");

			OBPERSONA.put("isNew", Boolean.valueOf(true));
			PAC_IAX_PERSONA pac_axis_persona = new PAC_IAX_PERSONA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			// PAC_IAX_GESTION_REC pac_axis_gestion_rec = new
			// PAC_IAX_GESTION_REC((java.sql.Connection)request.getAttribute(Constantes.DB01CONN));
			/* Estado persona */
			PAC_IAX_FUSIONPERSONA PAC_IAX_FUSIONPERSONA = new PAC_IAX_FUSIONPERSONA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			boolean cargar = true;
			if (!isEmpty(SPERSON) && !isEmpty(SPERSON2)) {
				if (SPERSON.equals(SPERSON2)) {
					cargar = false;
					formdata.put("MISMAPER", 1);
				}
			}

			if (!isEmpty(SPERSON)) {
				OBPERSONA.put("isNew", Boolean.valueOf(false));
				if (isEmpty(request.getAttribute("agents_visio"))) {
					Map mapAg = pac_axis_persona.ejecutaPAC_IAX_PERSONA__F_GET_AGENTES_VISION(SPERSON);
					logger.debug(mapAg);
					request.setAttribute("agents_visio", tratarRETURNyMENSAJES(request, mapAg));
					if (!isEmpty(tratarRETURNyMENSAJES(request, mapAg)) && isEmpty(CAGENTE)) {
						List retornAgentesVision = (List) tratarRETURNyMENSAJES(request, mapAg);
						if (retornAgentesVision.size() > 0) {
							HashMap inicialitzaPersona = (HashMap) retornAgentesVision.get(0);
							CAGENTE = new BigDecimal(String.valueOf(inicialitzaPersona.get("CAGENTE")));
							formdata.put("CAGENTE", inicialitzaPersona.get("CAGENTE"));
						}
					}
				}

				Map map = pac_axis_persona.ejecutaPAC_IAX_PERSONA__F_GET_PERSONA(SPERSON, CAGENTE);
				logger.debug(map);
				BigDecimal RETURN = (BigDecimal) tratarRETURNyMENSAJES(request, map);

				if (!isEmpty(map) && new BigDecimal(0).equals(RETURN)) {
					OBPERSONA = (Map) map.get("OBPERSONA");
					request.setAttribute("persona1", (Map) map.get("OBPERSONA"));
					logger.debug("----->CCC:" + OBPERSONA.get("CCC"));
					if (!isEmpty(OBPERSONA)) {
						BigDecimal CTIPPER = (BigDecimal) OBPERSONA.get("CTIPPER");
						if (new BigDecimal(2).equals(CTIPPER)) {
							OBPERSONA.put("TNOMBRE", OBPERSONA.get("TSIGLAS"));
						}

						List tipPersona = (List) ((Map) formdata.get("listValores")).get("tipPerson");
						for (int i = 0; i < tipPersona.size(); i++) {
							Map mapTP = (Map) tipPersona.get(i);
							if (((BigDecimal) mapTP.get("CATRIBU")).equals(CTIPPER))
								OBPERSONA.put("DESCIDENT", mapTP.get("TATRIBU"));
						}

						// BigDecimal CIDIOMA = (BigDecimal) OBPERSONA.get("CIDIOMA");
						formdata.put("SPERSON1", SPERSON);
						formdata.put("CAGENTE1", CAGENTE);
					}
				}

				if (isEmpty(SPERSON2)) {
					Map m = PAC_IAX_FUSIONPERSONA.ejecutaPAC_IAX_FUSIONPERSONA__F_GET_PERDUPLICADA(SPERSON, CAGENTE);
					logger.debug(m);
					tratarRETURNyMENSAJES(request, m);
					SPERSON2 = (BigDecimal) m.get("PSPERSON2");
					logger.debug("--> SPERSON2:" + SPERSON2);
				}

			}

			logger.debug("SPERSON2 1----> " + SPERSON2);
			if (!isEmpty(SPERSON2) && cargar) {
				OBPERSONA.put("isNew", Boolean.valueOf(false));
				if (isEmpty(request.getAttribute("agents_visio2"))) {
					Map mapAg = pac_axis_persona.ejecutaPAC_IAX_PERSONA__F_GET_AGENTES_VISION(SPERSON2);
					logger.debug(mapAg);
					request.setAttribute("agents_visio2", tratarRETURNyMENSAJES(request, mapAg));
					if (!isEmpty(tratarRETURNyMENSAJES(request, mapAg)) && isEmpty(CAGENTE2)) {
						List retornAgentesVision = (List) tratarRETURNyMENSAJES(request, mapAg);
						if (retornAgentesVision.size() > 0) {
							HashMap inicialitzaPersona = (HashMap) retornAgentesVision.get(0);
							logger.debug("inicialitzaPersona 1----> " + inicialitzaPersona);
							CAGENTE2 = new BigDecimal(String.valueOf(inicialitzaPersona.get("CAGENTE")));
							logger.debug("CAGENTE2 1----> " + CAGENTE2);
							formdata.put("CAGENTE2", inicialitzaPersona.get("CAGENTE"));
						}
					}
				}

				Map map = pac_axis_persona.ejecutaPAC_IAX_PERSONA__F_GET_PERSONA(SPERSON2, CAGENTE2);
				logger.debug(map);
				BigDecimal RETURN = (BigDecimal) tratarRETURNyMENSAJES(request, map);

				if (!isEmpty(map) && new BigDecimal(0).equals(RETURN)) {
					OBPERSONA = (Map) map.get("OBPERSONA");
					request.setAttribute("persona2", (Map) map.get("OBPERSONA"));
					logger.debug("----->CCC:" + OBPERSONA.get("CCC"));
					if (!isEmpty(OBPERSONA)) {
						BigDecimal CTIPPER = (BigDecimal) OBPERSONA.get("CTIPPER");
						if (new BigDecimal(2).equals(CTIPPER)) {
							OBPERSONA.put("TNOMBRE", OBPERSONA.get("TSIGLAS"));
						}

						List tipPersona = (List) ((Map) formdata.get("listValores")).get("tipPerson");
						for (int i = 0; i < tipPersona.size(); i++) {
							Map mapTP = (Map) tipPersona.get(i);
							if (((BigDecimal) mapTP.get("CATRIBU")).equals(CTIPPER))
								OBPERSONA.put("DESCIDENT", mapTP.get("TATRIBU"));
						}

						// BigDecimal CIDIOMA = (BigDecimal) OBPERSONA.get("CIDIOMA");
						formdata.put("SPERSON2", SPERSON2);
						formdata.put("CAGENTE2", CAGENTE2);
					}
				}
			}

		} catch (Exception e) {
			logger.error("Error en el m�todo Axisper009Service.cargarPersona", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
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
		BigDecimal PDUPLICADA;
		String TNOMBRE1;
		String TNOMBRE2;

		public Persona(BigDecimal SSEGURO, BigDecimal SPERSON, BigDecimal SPEREAL, BigDecimal CAGENTE,
				BigDecimal CEMPRES, BigDecimal CTIPPER, BigDecimal CTIPIDE, String NNUMIDE, BigDecimal CSEXPER,
				java.sql.Date FNACIMI, String SNIP, BigDecimal CESTPER, java.sql.Date FJUBILA, BigDecimal CMUTUALISTA,
				java.sql.Date FDEFUNC, BigDecimal NORDIDE, BigDecimal CIDIOMA, String TAPELLI1, String TAPELLI2,
				String TNOMBRE, String TSIGLAS, String CPROFES, BigDecimal CESTCIV, BigDecimal CPAIS,
				BigDecimal CNACIONALIDAD, BigDecimal CDOMICI, BigDecimal PDUPLICADO, String TNOMBRE1, String TNOMBRE2) {
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
			this.PDUPLICADA = PDUPLICADO;
			this.TNOMBRE1 = TNOMBRE1;
			this.TNOMBRE2 = TNOMBRE2;
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

	public Persona initPersona(HttpServletRequest request, Axisper033Action thisAction) {
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
		String TAPELLI1 = getHiddenCampoTextual(request, "TAPELLI1");
		String TAPELLI2 = getHiddenCampoTextual(request, "TAPELLI2");
		String TNOMBRE = getHiddenCampoTextual(request, "TNOMBRE");
		String TNOMBRE1 = getHiddenCampoTextual(request, "TNOMBRE1");
		String TNOMBRE2 = getHiddenCampoTextual(request, "TNOMBRE2");
		String TSIGLAS = null;

		if (new BigDecimal(2).equals(CTIPPER)) {
			TNOMBRE = null;
			TNOMBRE1 = null;
			TNOMBRE2 = null;
			String TNOM_AUX = getHiddenCampoTextual(request, "TNOMBRE");
			if (isEmpty(TNOM_AUX)) {
				TSIGLAS = getHiddenCampoTextual(request, "TAPELLI1");
			} else {
				TSIGLAS = getHiddenCampoTextual(request, "TNOMBRE");
			}
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
		BigDecimal CEMPRES = null; // null siempre
		BigDecimal PDUPLICADA = getHiddenCampoNumerico(request, "PDUPLICADO");

		return new Persona(SSEGURO, SPERSON, SPEREAL, CAGENTE, CEMPRES, CTIPPER, CTIPIDE, NNUMIDE, CSEXPER, FNACIMI,
				SNIP, CESTPER, FJUBILA, CMUTUALISTA, FDEFUNC, NORDIDE, CIDIOMA, TAPELLI1, TAPELLI2, TNOMBRE, TSIGLAS,
				CPROFES, CESTCIV, CPAIS, CNACIONALIDAD, CDOMICI, PDUPLICADA, TNOMBRE1, TNOMBRE2);

	}

	/**
	 */
	public void m_aceptar(HttpServletRequest request, Axisper033Action thisAction) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);

		try {
			PAC_IAX_FUSIONPERSONA PAC_IAX_FUSIONPERSONA = new PAC_IAX_FUSIONPERSONA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			// Recuperar persona a buscar
			BigDecimal SPERSON1 = getCampoNumerico(request, "SPERSON1");
			BigDecimal SPERSON2 = getCampoNumerico(request, "SPERSON2");
			BigDecimal CAGENTE1 = getCampoNumerico(request, "CAGENTE1");
			BigDecimal CAGENTE2 = getCampoNumerico(request, "CAGENTE2");

			Map map = PAC_IAX_FUSIONPERSONA.ejecutaPAC_IAX_FUSIONPERSONA__F_FUSIONAR_PER(SPERSON1, CAGENTE1, SPERSON2,
					CAGENTE2);

			logger.debug(map);
			BigDecimal ok = (BigDecimal) tratarRETURNyMENSAJES(request, map);
			formdata.put("OK", 1);
		} catch (Exception e) {
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}

		this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
	}
}
