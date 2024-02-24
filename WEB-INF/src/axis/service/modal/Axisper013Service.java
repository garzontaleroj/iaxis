package axis.service.modal;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_DESCVALORES;
import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.jdbc.PAC_IAX_PERSONA;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.control.modal.Axisper013Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AjaxContainerService;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

public class Axisper013Service extends AxisBaseService {
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
	public void m_form(HttpServletRequest request, Axisper013Action thisAction) {
		logger.debug("Axisper013Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {
			cargarValoresDesplegables(request, thisAction, usuario, formdata);

			if (!isEmpty(getCampoTextual(request, "CPAIS")) && isEmpty(getCampoTextual(request, "TPAIS")))
				cargarPersona(request, thisAction, usuario, formdata);
			// actualizarFormatoFechas(request, new String[] {"FNACIMI"});
		} catch (Exception e) {
			logger.error("Error en el m�todo Axisper013Service.m_form", e);
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

	private void cargarValoresDesplegables(HttpServletRequest request, Axisper013Action thisAction, UsuarioBean usuario,
			Map formdata) throws Exception {
		// Carga de valores de los desplegables
		Map listValores = new HashMap();
		try {
			PAC_IAX_LISTVALORES pac_axis_listValores = new PAC_IAX_LISTVALORES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			// Lista pa�ses
			Map map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTPAISES();
			logger.debug(map);
			listValores.put("lstPaises", (List) tratarRETURNyMENSAJES(request, map, false));

		} catch (Exception e) {
			logger.error("Error en el m�todo Axisper013Service.cargarValoresDesplegables", e);
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

	private void cargarPersona(HttpServletRequest request, Axisper013Action thisAction, UsuarioBean usuario,
			Map formdata) throws Exception {
		Map OBPERSONA = new HashMap();
		Map map = new HashMap();
		try {
			BigDecimal SPERSON = getCampoNumerico(request, "SPERSON");
			BigDecimal CPAIS = getCampoNumerico(request, "CPAIS");
			// BigDecimal CEMPRES = getCampoNumerico(request, "CEMPRES");
			BigDecimal CEMPRES = null; // null siempre
			// BigDecimal CAGENTE = usuario.getCagente();
			BigDecimal CAGENTE = getCampoNumerico(request, "CAGENTE");// null siempre
			logger.debug("C!-->" + CAGENTE);
			// BigDecimal SSEGURO = (BigDecimal) AbstractDispatchAction.topPila(request,
			// "SSEGURO");

			PAC_IAX_PERSONA pac_axis_persona = new PAC_IAX_PERSONA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			OBPERSONA.put("isNew", Boolean.valueOf(true));

			/* Estado persona */
			if (!isEmpty(SPERSON)) {
				OBPERSONA.put("isNew", Boolean.valueOf(false));

				/* Nacionalidad por defecto */
				map = pac_axis_persona.ejecutaPAC_IAX_PERSONA__F_GET_NACIONALIDAD(SPERSON, CPAIS, CAGENTE);

				logger.debug(map);
				tratarRETURNyMENSAJES(request, map);
				if (!isEmpty(map))
					OBPERSONA.put("CNACIONALIDAD", map.get("NACIONALIDAD"));

			}
		} catch (Exception e) {
			logger.error("Error en el m�todo Axisper013Service.cargarPersona", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			if (!isEmpty(map)) {
				formdata.putAll((Map) OBPERSONA.get("CNACIONALIDAD"));
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

	public Persona initPersona(HttpServletRequest request, Axisper013Action thisAction) {
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

	public BigDecimal m_grabarNacionalidadPersona(Persona persona, HttpServletRequest request,
			Axisper013Action thisAction) {
		logger.debug("Axisper013Service m_grabarNacionalidadPersona");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		try {
			PAC_IAX_PERSONA pac_axis_persona = new PAC_IAX_PERSONA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			PAC_IAX_DESCVALORES descvalores = new PAC_IAX_DESCVALORES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			HashMap m = this.f_Get_Avisos(request, this.whoami(this));
			BigDecimal pRETURN = (BigDecimal) this.tratarRETURNyMENSAJES(request, m);
			request.setAttribute("PLSTAVISOS", m.get("PLSTAVISOS"));
			if (pRETURN != null && pRETURN.intValue() != 1) {
				BigDecimal CPAIS = getCampoNumerico(request, "CNACIONALIDAD");
				BigDecimal CDEFECTO = getCampoNumerico(request, "CDEFECTO");

				if (CDEFECTO == null)
					CDEFECTO = new BigDecimal(0);

				Map map2 = descvalores.ejecutaPAC_IAX_DESCVALORES__F_GET_DESCPAIS(CPAIS);
				logger.debug(map2);

				if (isEmpty(tratarRETURNyMENSAJES(request, map2)))
					return new BigDecimal(1);

				Map map = pac_axis_persona.ejecutaPAC_IAX_PERSONA__F_SET_NACIONALIDAD(persona.SPERSON, persona.CAGENTE,
						CPAIS, CDEFECTO);
				if (Integer.parseInt(String.valueOf(map.get("RETURN"))) == 0) {
					request.setAttribute("PSPERSONOUT", persona.SPERSON);
					formdata.put("SPERSON", persona.SPERSON);
				}
				logger.debug(map);
				return ((BigDecimal) tratarRETURNyMENSAJES(request, map));
			} else {
				cargarValoresDesplegables(request, thisAction, usuario, formdata);
				return new BigDecimal(1);
			}

		} catch (Exception e) {
			logger.error("Error en el m�todo Axisper013Service.m_grabarNacionalidad", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
			return new BigDecimal(1);
		}
	}

	public void m_ajax_direccion(HttpServletRequest request, Axisper013Action thisAction) {
		logger.debug("Axisper013Service m_ajax_direccion");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {
			String op = this.getCampoTextual(request, "op");
			BigDecimal CPAIS_DIRECCION = this.getCampoNumerico(request, "CPAIS_DIRECCION");
			BigDecimal CPOBLAC = this.getCampoNumerico(request, "CPOBLAC");
			BigDecimal CPROVIN = this.getCampoNumerico(request, "CPROVIN");
			BigDecimal CPAIS_RESIDENCIA = this.getCampoNumerico(request, "CPAIS_RESIDENCIA");
			BigDecimal CPAIS_NACIONALIDAD = this.getCampoNumerico(request, "CPAIS_NACIONALIDAD");
			PAC_IAX_DESCVALORES pac_axis_persona = new PAC_IAX_DESCVALORES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			if (!isEmpty(op) && op.equalsIgnoreCase("CPAIS_RESIDENCIA")) {
				Map map = pac_axis_persona.ejecutaPAC_IAX_DESCVALORES__F_GET_DESCPAIS(CPAIS_RESIDENCIA);
				logger.debug(map);
				ajax.rellenarPlAContenedorAjax(map);
				if (!isEmpty(map) && !isEmpty(map.get("RETURN")) && !"**".equals((String) map.get("RETURN"))) {
					Map pais = new HashMap();
					pais.put("CPAIS_RESIDENCIA", CPAIS_RESIDENCIA);
					pais.put("TPAISRESIDENCIA", map.get("RETURN"));
					formdata.put("CPAIS", CPAIS_RESIDENCIA);
					formdata.put("TPAISRESIDENCIA", map.get("RETURN"));
					ajax.guardarContenidoFinalAContenedorAjax(pais);
				} else if ("**".equals((String) map.get("RETURN"))) {
					Map pais = new HashMap();
					pais.put("CPAIS", CPAIS_RESIDENCIA);
					formdata.put("CPAIS", CPAIS_RESIDENCIA);
					pais.put(Constantes.OPERACION_AJAX_ERROR, Constantes.OPERACION_AJAX_ERROR);
					ajax.guardarContenidoFinalAContenedorAjax(pais);
				}
			} else if (!isEmpty(op) && op.equalsIgnoreCase("CPAIS_NACIONALIDAD")) {
				Map map = pac_axis_persona.ejecutaPAC_IAX_DESCVALORES__F_GET_DESCPAIS(CPAIS_NACIONALIDAD);
				logger.debug(map);
				ajax.rellenarPlAContenedorAjax(map);
				if (!isEmpty(map) && !isEmpty(map.get("RETURN")) && !"**".equals((String) map.get("RETURN"))) {
					Map pais = new HashMap();
					pais.put("CNACIONALIDAD", CPAIS_NACIONALIDAD);
					pais.put("TPAISNACIONALIDAD", map.get("RETURN"));
					formdata.put("CNACIONALIDAD", CPAIS_NACIONALIDAD);
					formdata.put("TPAISNACIONALIDAD", map.get("RETURN"));
					ajax.guardarContenidoFinalAContenedorAjax(pais);
				} else if ("**".equals((String) map.get("RETURN"))) {
					Map pais = new HashMap();
					pais.put("CNACIONALIDAD", CPAIS_RESIDENCIA);
					formdata.put("CNACIONALIDAD", CPAIS_RESIDENCIA);
					pais.put(Constantes.OPERACION_AJAX_ERROR, Constantes.OPERACION_AJAX_ERROR);
					ajax.guardarContenidoFinalAContenedorAjax(pais);
				}
			} else if (!isEmpty(op) && op.equalsIgnoreCase("CPAIS_DIRECCION")) {
				Map map = pac_axis_persona.ejecutaPAC_IAX_DESCVALORES__F_GET_DESCPAIS(CPAIS_DIRECCION);
				logger.debug(map);
				ajax.rellenarPlAContenedorAjax(map);
				if (!isEmpty(map) && !isEmpty(map.get("RETURN")) && !"**".equals((String) map.get("RETURN"))) {
					Map pais = new HashMap();
					pais.put("CPAIS", CPAIS_DIRECCION);
					pais.put("TPAIS", map.get("RETURN"));
					formdata.put("CPAIS_DIRECCION", CPAIS_DIRECCION);
					formdata.put("TPAIS", map.get("RETURN"));
					ajax.guardarContenidoFinalAContenedorAjax(pais);
				} else if ("**".equals((String) map.get("RETURN"))) {
					Map pais = new HashMap();
					pais.put("CPAIS", CPAIS_DIRECCION);
					formdata.put("CPAIS", CPAIS_DIRECCION);
					pais.put(Constantes.OPERACION_AJAX_ERROR, Constantes.OPERACION_AJAX_ERROR);
					ajax.guardarContenidoFinalAContenedorAjax(pais);
				}
			} else if (!isEmpty(op) && op.equalsIgnoreCase("CPROVIN")) {
				Map map = pac_axis_persona.ejecutaPAC_IAX_DESCVALORES__F_GET_DESCPROVINCIA(CPROVIN, CPAIS_DIRECCION);
				logger.debug(map);
				ajax.rellenarPlAContenedorAjax(map);
				if (!isEmpty(map) && !isEmpty(map.get("RETURN")) && !"**".equals((String) map.get("RETURN"))) {
					Map provincia = new HashMap();
					provincia.put("CPROVIN", CPROVIN);
					provincia.put("TPROVIN", map.get("RETURN"));
					formdata.put("CPROVIN", CPROVIN);
					formdata.put("TPROVIN", map.get("RETURN"));
					ajax.guardarContenidoFinalAContenedorAjax(provincia);
				} else if ("**".equals((String) map.get("RETURN"))) {
					Map provincia = new HashMap();
					provincia.put("CPROVIN", CPROVIN);
					formdata.put("CPROVIN", CPROVIN);
					provincia.put(Constantes.OPERACION_AJAX_ERROR, Constantes.OPERACION_AJAX_ERROR);
					ajax.guardarContenidoFinalAContenedorAjax(provincia);
				}
			} else if (!isEmpty(op) && op.equalsIgnoreCase("CPOBLAC")) {
				Map map = pac_axis_persona.ejecutaPAC_IAX_DESCVALORES__F_GET_DESCPROBLACION(CPROVIN, CPOBLAC);
				logger.debug(map);
				ajax.rellenarPlAContenedorAjax(map);
				if (!isEmpty(map) && !isEmpty(map.get("RETURN")) && !"**".equals((String) map.get("RETURN"))) {
					Map poblacion = new HashMap();
					poblacion.put("CPOBLAC", CPOBLAC);
					poblacion.put("TPOBLAC", map.get("RETURN"));
					formdata.put("CPOBLAC", CPOBLAC);
					formdata.put("TPOBLAC", map.get("RETURN"));
					ajax.guardarContenidoFinalAContenedorAjax(poblacion);
				} else if ("**".equals((String) map.get("RETURN"))) {
					Map poblacion = new HashMap();
					poblacion.put("CPOBLAC", CPOBLAC);
					formdata.put("CPOBLAC", CPOBLAC);
					poblacion.put(Constantes.OPERACION_AJAX_ERROR, Constantes.OPERACION_AJAX_ERROR);
					ajax.guardarContenidoFinalAContenedorAjax(poblacion);
				}
			}

			else {
				ajax.guardarContenidoFinalAContenedorAjax(Constantes.OPERACION_AJAX_ERROR);
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisper013Service - m�todo m_ajax_direccion", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

}
