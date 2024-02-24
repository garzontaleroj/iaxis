package axis.service.modal;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_FINANCIERA;
import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.jdbc.PAC_IAX_PERSONA;
import axis.mvc.control.modal.Axisper017Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AjaxContainerService;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

public class Axisper017Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	/*********************************************************************************************************************/
	/************************************************
	 * MTODOS DE INICIALIZACIN
	 *******************************************/
	/*********************************************************************************************************************/

	/**
	 * Realiza la carga inicial de la pantalla.
	 * 
	 * @param request    El HttpServletRequest que contiene la peticin del cliente
	 *                   web.
	 * @param thisAction Una Action abstracta desde donde se ha invocado el servicio
	 *                   (necesaria para el log).
	 */
	public void m_form(HttpServletRequest request, Axisper017Action thisAction) {
		logger.debug("Axisper017Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		BigDecimal CTIPPER = getCampoNumerico(request, "CTIPPER");
		try {
			if ((CTIPPER == null) || (isEmpty(CTIPPER))) {
				cargarPersona(request, thisAction, usuario, formdata);
			}
			cargarValoresDesplegables(request, thisAction, usuario, formdata);
		} catch (Exception e) {
			logger.error("Error en el mtodo Axisper017Service.m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
	}

	/**
	 * Realiza una carga de BD de los valores estticos que contiene cada desplegable
	 * de la pantalla.
	 * 
	 * @param request    El HttpServletRequest que contiene la peticin del cliente
	 *                   web.
	 * @param thisAction Una Action abstracta desde donde se ha invocado el servicio
	 *                   (necesaria para el log).
	 * @param usuario    El UsuarioBean activo.
	 * @param formdata   HashMap que contiene los valores de los request parameters.
	 * @throws Exception
	 */

	private void cargarValoresDesplegables(HttpServletRequest request, Axisper017Action thisAction, UsuarioBean usuario,
			Map formdata) throws Exception {
		// Carga de valores de los desplegables
		Map listValores = new HashMap();
		try {
			PAC_IAX_LISTVALORES pac_axis_listValores = new PAC_IAX_LISTVALORES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			if (isEmpty(formdata.get("listValores"))) {
				// Tipo de persona
				Map map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_GET_TIPPERSON();
				logger.debug(map);
				listValores.put("tipPerson", (List) tratarRETURNyMENSAJES(request, map));

				// Tipo de documento
				BigDecimal CTIPPER = getCampoNumerico(request, "CTIPPER");
				map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_GET_TIPDOCUM_TIPPER(CTIPPER);
				logger.debug(map);
				listValores.put("tipDocum", (List) tratarRETURNyMENSAJES(request, map));

				// Tipo de sexo
				map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_GET_TIPSEXO();
				logger.debug(map);
				listValores.put("tipSexo", (List) tratarRETURNyMENSAJES(request, map));

				// Preaviso
				map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(108));
				logger.debug(map);
				listValores.put("tipPreaviso", (List) tratarRETURNyMENSAJES(request, map));

			}

		} catch (Exception e) {
			logger.error("Error en el mtodo Axisper017Service.cargarValoresDesplegables", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			if (isEmpty(formdata.get("listValores"))) {
				formdata.put("listValores", listValores);
			}
		}
	}

	/**
	 * Realiza una carga de BD de los valores estticos que contiene cada desplegable
	 * de la pantalla.
	 * 
	 * @param request    El HttpServletRequest que contiene la peticin del cliente
	 *                   web.
	 * @param thisAction Una Action abstracta desde donde se ha invocado el servicio
	 *                   (necesaria para el log).
	 * @param usuario    El UsuarioBean activo.
	 * @param formdata   HashMap que contiene los valores de los request parameters.
	 * @throws Exception
	 */

	private void cargarPersona(HttpServletRequest request, Axisper017Action thisAction, UsuarioBean usuario,
			Map formdata) throws Exception {
		Map OBPERSONA = new HashMap();

		try {
			BigDecimal SPERSON = getCampoNumerico(request, "SPERSON");
			if (SPERSON == null) {
				try {
					SPERSON = new BigDecimal(String.valueOf(request.getParameter("SPERSON")));
				} catch (Exception ex) {
					SPERSON = null;
				}
			}

			BigDecimal CEMPRES = null; // null siempre
			BigDecimal CAGENTE = getCampoNumerico(request, "CAGENTEselected");
			if ((CAGENTE == null) || (isEmpty(CAGENTE))) {
				CAGENTE = getCampoNumerico(request, "CAGENTE");
			}
			formdata.put("CAGENTE", CAGENTE);

			logger.debug("CAGENTE-->" + CAGENTE);
			PAC_IAX_PERSONA pac_axis_persona = new PAC_IAX_PERSONA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			OBPERSONA.put("isNew", Boolean.valueOf(true));

			/* Estado persona */
			if (!isEmpty(SPERSON)) {
				OBPERSONA.put("isNew", Boolean.valueOf(false));
				request.getSession().setAttribute("resultats", true);

				Map map = pac_axis_persona.ejecutaPAC_IAX_PERSONA__F_GET_PERSONA(SPERSON, CAGENTE);
				logger.debug("ejecutaPAC_IAX_PERSONA__F_GET_PERSONA:" + map);
				BigDecimal RETURN = (BigDecimal) tratarRETURNyMENSAJES(request, map);

				if (!isEmpty(map) && new BigDecimal(0).equals(RETURN)) {
					OBPERSONA = (Map) map.get("OBPERSONA");
					formdata.put("CTIPPER", OBPERSONA.get("CTIPPER"));

					if (!isEmpty(OBPERSONA)) {
						BigDecimal CTIPPER = (BigDecimal) OBPERSONA.get("CTIPPER");
						if (new BigDecimal(2).equals(CTIPPER)) {
							OBPERSONA.put("TNOMBRE", OBPERSONA.get("TSIGLAS"));
						}
						// OBPERSONA.put("isNew", Boolean.valueOf(false));
						PAC_IAX_FINANCIERA pac_axis_financiera = new PAC_IAX_FINANCIERA(
								(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
						map = pac_axis_financiera.ejecutaPAC_IAX_FINANCIERA__F_GET_GENERAL_PERSONA(SPERSON);
						List array = (List) tratarRETURNyMENSAJES(request, map);
						if (array != null) {
							Map t = (Map) array.get(0);
							formdata.put("SFINANCI", t.get("SFINANCI"));
							if (isEmpty(OBPERSONA.get("FNACIMI"))) {
								OBPERSONA.put("FCONSTI", stringToSqlDate(t.get("FCONSTI").toString()));
								OBPERSONA.replace("FNACIMI", t.get("FCONSTI"));
								formdata.put("FNACIMI", t.get("FCONSTI"));
								OBPERSONA.put("CTIPSOCI", t.get("CTIPSOCI"));
							}
						}
					}
				}

			}
		} catch (Exception e) {
			logger.error("Error en el mtodo Axisper017Service.cargarPersona", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			if (!isEmpty(OBPERSONA))
				request.getSession().setAttribute("dades_setpersona", OBPERSONA);
			formdata.putAll(OBPERSONA);
		}

		this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
	}

	/*********************************************************************************************************************/
	/****************************************
	 * INNER CLASS QUE REPRESENTA UNA PERSONA
	 *************************************/
	/*********************************************************************************************************************/

	public class Persona {
		// Necesarios slo para GRABAR
		BigDecimal SPERSON;
		BigDecimal CAGENTE;
		BigDecimal CEMPRES;
		// Necesarios para VALIDAR y GRABAR
		BigDecimal CTIPPER;
		BigDecimal CTIPIDE;
		String NNUMIDE;

		BigDecimal CSEXPER;
		java.sql.Date FNACIMI;
		BigDecimal SWPUBLI;
		BigDecimal SWRUT;
		BigDecimal CPREAVISO;

		public Persona(BigDecimal SPERSON, BigDecimal CAGENTE, BigDecimal CEMPRES, BigDecimal CTIPPER,
				BigDecimal CTIPIDE, String NNUMIDE, BigDecimal CSEXPER, java.sql.Date FNACIMI, BigDecimal SWPUBLI,
				BigDecimal SWRUT, BigDecimal CPREAVISO) {

			this.SPERSON = SPERSON;

			this.CAGENTE = CAGENTE;
			this.CEMPRES = CEMPRES;
			this.SWPUBLI = SWPUBLI;
			this.CTIPPER = CTIPPER;
			this.CTIPIDE = CTIPIDE;
			this.NNUMIDE = NNUMIDE;
			this.CSEXPER = CSEXPER;
			this.FNACIMI = FNACIMI;
			this.SWRUT = SWRUT;
			this.CPREAVISO = CPREAVISO;

		}

		/**
		 * Mtodos que auto-graban la persona
		 * 
		 * @param pac_axis_persona - Instancia de PAC_IAX_PERSONA
		 * @return Map - El retorno de la funcin de PAC_IAX_PERSONA
		 * @throws Exception
		 */
		public Map grabaPersona(PAC_IAX_PERSONA pac_axis_persona) throws Exception {
			Map map = pac_axis_persona.ejecutaPAC_IAX_PERSONA__F_SET_BASICOS_PERSONA(SPERSON, CTIPPER, CTIPIDE, NNUMIDE,
					CSEXPER, FNACIMI, SWPUBLI, SWRUT, CPREAVISO);
			logger.debug(map);
			return map;
		}
	}

	/*********************************************************************************************************************/
	/************************************************
	 * MTODOS DE ACTUALIZACIN
	 *******************************************/
	/*********************************************************************************************************************/

	/**
	 * Inicializa y devuelve un objeto Persona con los parmetros introducidos en el
	 * formulario.
	 * 
	 * @param request    El HttpServletRequest que contiene la peticin del cliente
	 *                   web.
	 * @param thisAction Una Action abstracta desde donde se ha invocado el servicio
	 *                   (necesaria para el log).
	 * @return Persona - El objeto Persona rellenado con los datos del formulario.
	 * @throws Exception
	 */

	public Persona initPersona(HttpServletRequest request, Axisper017Action thisAction) {
		BigDecimal CTIPPER = getCampoNumerico(request, "CTIPPER"); // LCF CTIPPER
		BigDecimal CTIPIDE = getCampoNumerico(request, "CTIPIDE");
		String NNUMIDE = getCampoTextual(request, "NNUMIDE");
		BigDecimal CSEXPER = getCampoNumerico(request, "CSEXPER");
		java.sql.Date FNACIMI = stringToSqlDate(getCampoTextual(request, "FNACIMI"));
		BigDecimal SPERSON = getCampoNumerico(request, "SPERSON");
		BigDecimal CAGENTE = getCampoNumerico(request, "CAGENTE");
		BigDecimal SWPUBLI = isEmpty(getCampoNumerico(request, "SWPUBLI")) ? new BigDecimal(0)
				: getCampoNumerico(request, "SWPUBLI");
		BigDecimal CEMPRES = null; // null siempre
		BigDecimal SWRUT = null;
		BigDecimal CPREAVISO = isEmpty(getCampoNumerico(request, "CPREAVISO")) ? null
				: getCampoNumerico(request, "CPREAVISO");

		// BigDecimal SWRUT = getHiddenCampoNumerico(request, "SWRUT");
		logger.debug("SWRUT antes if ::" + SWRUT);
		BigDecimal SWRUT_COLM = getHiddenCampoNumerico(request, "SWRUT_COLM");
		BigDecimal SWRUT_COLM_OCULTO = getHiddenCampoNumerico(request, "SWRUT_COLM_OCULTO");
		logger.debug("SWRUT DE LA 17::" + SWRUT);
		logger.debug("SWRUT_COLM ::" + SWRUT_COLM);
		logger.debug("SWRUT_COLM_OCULTO ::" + SWRUT_COLM_OCULTO);
		if (isEmpty(SWRUT)) {
			if (isEmpty(SWRUT_COLM))
				SWRUT = getHiddenCampoNumerico(request, "SWRUT_COLM_OCULTO");
			else
				SWRUT = getHiddenCampoNumerico(request, "SWRUT_COLM");

		}

		if (isEmpty(SWRUT))
			SWRUT = isEmpty(getCampoNumerico(request, "SWRUT")) ? new BigDecimal(0)
					: getCampoNumerico(request, "SWRUT");

		logger.debug("SWRUT despues if ::" + SWRUT);

		this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		return new Persona(SPERSON, CAGENTE, CEMPRES, CTIPPER, CTIPIDE, NNUMIDE, CSEXPER, FNACIMI, SWPUBLI, SWRUT,
				CPREAVISO);

	}

	/**
	 * @param request    El HttpServletRequest que contiene la peticin del cliente
	 *                   web.
	 * @param thisAction Una Action abstracta desde donde se ha invocado el servicio
	 *                   (necesaria para el log).
	 * @return BigDecimal Indicando si todo ha ido bien o no.
	 * @throws Exception
	 */

	public BigDecimal m_grabarPersona(Persona persona, HttpServletRequest request, Axisper017Action thisAction) {
		logger.debug("Axisper017Service m_grabarPersona");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {
			PAC_IAX_PERSONA pac_axis_persona = new PAC_IAX_PERSONA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			HashMap m = this.f_Get_Avisos(request, this.whoami(this));
			BigDecimal pRETURN = (BigDecimal) this.tratarRETURNyMENSAJES(request, m);
			request.setAttribute("PLSTAVISOS", m.get("PLSTAVISOS"));
			BigDecimal ok = new BigDecimal(1);
			if (pRETURN != null && pRETURN.intValue() != 1) {
				Map mapvalida = pac_axis_persona.ejecutaPAC_IAX_PERSONA__F_VALIDANIF(persona.NNUMIDE, persona.CTIPIDE,
						persona.CSEXPER, persona.FNACIMI);
				logger.debug(mapvalida);
				BigDecimal RETURN = (BigDecimal) tratarRETURNyMENSAJES(request, mapvalida);
				if (!new BigDecimal(0).equals(RETURN)) {
					this.cargarValoresDesplegables(request, thisAction, usuario, formdata);
					this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
					return RETURN;
				}

				Map map = persona.grabaPersona(pac_axis_persona);
				BigDecimal CTIPPER = getCampoNumerico(request, "CTIPPER");
				ok = (BigDecimal) tratarRETURNyMENSAJES(request, map);
				if (ok.intValue() == 0) {
					request.setAttribute("OK", new BigDecimal(0));
					int canvipersona = (CTIPPER.intValue() != persona.CTIPPER.intValue()) ? 1 : 0;
					request.setAttribute("canvipersona", new BigDecimal(canvipersona));

				} else
					this.cargarValoresDesplegables(request, thisAction, usuario, formdata);
			} else
				this.cargarValoresDesplegables(request, thisAction, usuario, formdata);

			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
			return ok;

		} catch (Exception e) {
			logger.error("Error en el mtodo Axisper017Service.m_grabarPersona", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
			try {
				this.cargarValoresDesplegables(request, thisAction, usuario, formdata);
			} catch (Exception ex) {
			}
			return new BigDecimal(1);
		}

	}

	public void m_ajax_getdigito(HttpServletRequest request, Axisper017Action thisAction) {
		logger.debug("Axisper017Service m_ajax_getdigito");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {
			String NNUMNIF = getHiddenCampoTextual(request, "NNUMIDE");
			BigDecimal CTIPIDE = getHiddenCampoNumerico(request, "CTIPIDE");
			PAC_IAX_PERSONA pac_axis_persona = new PAC_IAX_PERSONA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map map = pac_axis_persona.ejecutaPAC_IAX_PERSONA__F_DIGITO_NIF_COL(CTIPIDE, NNUMNIF);
			logger.debug(map);

			ajax.rellenarPlAContenedorAjax(map);
			ajax.guardarContenidoFinalAContenedorAjax(map);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisper017Service - mtodo m_ajax_getdigito", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

}
