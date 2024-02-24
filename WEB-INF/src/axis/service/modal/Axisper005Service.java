//Revision:# rmWT2iIQznfGFC2MNUuJrw== #
package axis.service.modal;

import java.math.BigDecimal;
import java.sql.Date;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_DESCVALORES;
import axis.jdbc.PAC_IAX_FINANCIERA;
import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.jdbc.PAC_IAX_PARAM;
import axis.jdbc.PAC_IAX_PERSONA;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.control.modal.Axisper005Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AjaxContainerService;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

public class Axisper005Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());
	BigDecimal CDOMICINEW = BigDecimal.ZERO;

	/*********************************************************************************************************************/
	/************************************************
	 * M�TODOS DE INICIALIZACI�N
	 *******************************************/
	/*********************************************************************************************************************/
	public void m_init(HttpServletRequest request, Axisper005Action thisAction) {
		logger.debug("Axisper005Service m_init");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {
			PAC_IAX_PERSONA pac_axis_persona = new PAC_IAX_PERSONA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			Map m = pac_axis_persona.ejecutaPAC_IAX_PERSONA__F_LIMPIAR_OBJETOS();
			logger.debug(m);

		} catch (Exception e) {
			logger.error("Error en el m�todo Axisper005Service.m_init", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	/**
	 * Realiza la carga inicial de la pantalla.
	 * 
	 * @param request    El HttpServletRequest que contiene la petici�n del cliente
	 *                   web.
	 * @param thisAction Una Action abstracta desde donde se ha invocado el servicio
	 *                   (necesaria para el log).
	 */
	public void m_form(HttpServletRequest request, Axisper005Action thisAction) {
		logger.debug("Axisper005Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {
			PAC_IAX_PERSONA pac_axis_persona = new PAC_IAX_PERSONA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			PAC_IAX_PARAM pac_iax_param = new PAC_IAX_PARAM(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			BigDecimal SPERSON = getHiddenCampoNumerico(request, "SPERSON");
			BigDecimal CAGENTE = getHiddenCampoNumerico(request, "CAGENTE");
			logger.debug(SPERSON);
			logger.debug("CTIPIDE : " + getHiddenCampoNumerico(request, "CTIPIDE"));
			cargarValoresDesplegables(request, thisAction, usuario, formdata);

			Map c = pac_iax_param.ejecutaPAC_IAX_PARAM__F_PAREMPRESA_N("PER_CONTACTOCAMPO", usuario.getCempres());
			formdata.put("PER_CONTACTOCAMPO", (BigDecimal) tratarRETURNyMENSAJES(request, c));

			if (isEmpty(getHiddenCampoTextual(request, "CTIPPER"))) { // LCF TIDENTI
				request.getSession().removeAttribute("resultats");
				cargarPersona(request, thisAction, usuario, formdata);
				BigDecimal CTIPPER = getHiddenCampoNumerico(request, "CTIPPER");
				Map mapx = null;
				mapx = pac_axis_persona.ejecutaPAC_IAX_PERSONA__F_GET_ESTPARPERSONA(SPERSON, new BigDecimal(19000),
						new BigDecimal(0), new BigDecimal(0), CTIPPER);
				logger.debug(mapx);
				BigDecimal ok = (BigDecimal) this.tratarRETURNyMENSAJES(request, mapx);
				ArrayList<HashMap> lista = new ArrayList();
				if (!isEmpty(ok) && ok.intValue() == 0) {
					if (!isEmpty(mapx.get("PPARPER"))) {
						lista = (ArrayList<HashMap>) mapx.get("PPARPER");
						formdata.put("PARPER", lista);
					}
				}
			} else {
				if (!isEmpty(formdata.get("PER_CONTACTOCAMPO"))
						&& ((BigDecimal) formdata.get("PER_CONTACTOCAMPO")).compareTo(new BigDecimal(1)) == 0) {

					if (!isEmpty(SPERSON)) {
						Map con = pac_axis_persona.ejecutaPAC_IAX_PERSONA__F_GET_ESTCONTACTOS(SPERSON, CAGENTE);
						tratarRETURNyMENSAJES(request, con);
						if (!isEmpty(con.get("T_IAX_CONTACTOS")))
							formdata.put("CONTACTOS", (ArrayList) con.get("T_IAX_CONTACTOS"));
					}
				}
				BigDecimal CTIPPER = getHiddenCampoNumerico(request, "CTIPPER");
				Map mapx = pac_axis_persona.ejecutaPAC_IAX_PERSONA__F_GET_ESTPARPERSONA(SPERSON, CAGENTE,
						new BigDecimal(0), new BigDecimal(0), CTIPPER);
				logger.debug(mapx);
				BigDecimal ok = (BigDecimal) this.tratarRETURNyMENSAJES(request, mapx);
				ArrayList<HashMap> lista = new ArrayList();
				if (!isEmpty(ok) && ok.intValue() == 0) {
					if (!isEmpty(mapx.get("PPARPER"))) {
						lista = (ArrayList<HashMap>) mapx.get("PPARPER");
						formdata.put("PARPER", lista);
					}
				}

			}

			Map m = pac_iax_param.ejecutaPAC_IAX_PARAM__F_PAREMPRESA_N(new String("PER_PARPROPIEDADES"),
					usuario.getCempres());
			logger.debug("---> PER_PARPROPIEDADES:" + m);
			formdata.put("PER_PARPROPIEDADES", tratarRETURNyMENSAJES(request, m, false));

			if (!isEmpty(SPERSON)) {

				Map map = pac_axis_persona.ejecutaPAC_IAX_PERSONA__F_PERSONA_ORIGEN_INT(SPERSON);
				logger.debug(map);
				if (((BigDecimal) tratarRETURNyMENSAJES(request, map)).intValue() == 0)
					formdata.put("esHost", "0");
			} else
				formdata.put("esHost", "1");

			m = pac_iax_param.ejecutaPAC_IAX_PARAM__F_PAREMPRESA_N("SIN_PROVINCIAS", usuario.getCempres());
			BigDecimal sin_provincias = (BigDecimal) tratarRETURNyMENSAJES(request, m);
			logger.debug("\n\n\n###########################################\n\n\n" + sin_provincias
					+ "\n\n\n################################\n\n\n");
			formdata.put("sin_provincias", sin_provincias);

		} catch (Exception e) {
			logger.error("Error en el m�todo Axisper005Service.m_form", e);
			formdata.put("esHost", "1");
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
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
	private

			void cargarValoresDesplegables(HttpServletRequest request, Axisper005Action thisAction, UsuarioBean usuario,
					Map formdata) throws Exception {
		// Carga de valores de los desplegables
		Map listValores = new HashMap();
		try {
			PAC_IAX_LISTVALORES pac_axis_listValores = new PAC_IAX_LISTVALORES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			PAC_IAX_PERSONA pac_axis_listPersona = new PAC_IAX_PERSONA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			PAC_IAX_PARAM pac_axis_param = new PAC_IAX_PARAM(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			// Tipo de persona
			Map map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_GET_TIPPERSON();
			logger.debug(map);
			listValores.put("tipPerson", (List) tratarRETURNyMENSAJES(request, map));

			// Tipo de documento
			BigDecimal CTIPPER = getCampoNumerico(request, "TIDENTIcerca");
			if (isEmpty(CTIPPER))
				CTIPPER = getCampoNumerico(request, "CTIPPER");

			map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_GET_TIPDOCUM_TIPPER(CTIPPER);
			logger.debug(map);
			listValores.put("tipDocum", (List) tratarRETURNyMENSAJES(request, map));

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

			// Lista ocupaciones
			map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTPROFESIONES(new BigDecimal(1));
			logger.debug(map);
			listValores.put("lstOcupaciones", (List) tratarRETURNyMENSAJES(request, map, false));

			// Lista pa�ses
			map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTPAISES();
			logger.debug(map);
			listValores.put("lstPaises", (List) tratarRETURNyMENSAJES(request, map, false));

			// Lista CCC
			map = pac_axis_listPersona.ejecutaPAC_IAX_PERSONA__F_GET_TIPCCC(new BigDecimal("1"));
			logger.debug(map);
			listValores.put("tipCCC", (List) tratarRETURNyMENSAJES(request, map));

			// Lista TARJETAS
			map = pac_axis_listPersona.ejecutaPAC_IAX_PERSONA__F_GET_TIPCCC(new BigDecimal("2"));
			logger.debug(map);
			listValores.put("tipTarjeta", (List) tratarRETURNyMENSAJES(request, map));

			// Lista TIPBANCC 2
			map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTTIPCC(new BigDecimal("2"));
			logger.debug(map);
			listValores.put("tipBCC_tarjetas", (List) tratarRETURNyMENSAJES(request, map));

			// Lista TIPBANCC 1
			map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTTIPCC(new BigDecimal("1"));
			logger.debug(map);
			listValores.put("tipBCC_cuentas", (List) tratarRETURNyMENSAJES(request, map));

			// Lista tipo direcciones
			map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTTIPODIRECCION();
			logger.debug(map);
			listValores.put("lstTipoDireccion", (List) tratarRETURNyMENSAJES(request, map));

			// Lista tipo v�as
			map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTTIPOVIA();
			logger.debug(map);
			listValores.put("lstTipoVia", (List) tratarRETURNyMENSAJES(request, map));

			// Lista Estado Civil
			map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(12));
			logger.debug(map);
			listValores.put("lstEstciv", (List) tratarRETURNyMENSAJES(request, map));

			// Lista C�digo V�a predio
			map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(800042));
			logger.debug(map);
			listValores.put("lstCodViaPrevio", (List) tratarRETURNyMENSAJES(request, map));

			// Lista Literal predio
			map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(800043));
			logger.debug(map);
			listValores.put("lstCLITVP", (List) tratarRETURNyMENSAJES(request, map));

			// Bis predio
			map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(800044));
			logger.debug(map);
			listValores.put("lstCBISVP", (List) tratarRETURNyMENSAJES(request, map));

			// Cod. Orientaci�n predio
			map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(800046));
			logger.debug(map);
			listValores.put("lstCORVP", (List) tratarRETURNyMENSAJES(request, map));

			// Literal predio
			map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(800043));
			logger.debug(map);
			listValores.put("lstCLITCO", (List) tratarRETURNyMENSAJES(request, map));

			// Cod. Orientaci�n predio

			map = pac_axis_param.ejecutaPAC_IAX_PARAM__F_PAREMPRESA_N("PER_BISLETRA", usuario.getCempres());
			logger.debug(map);
			BigDecimal valor = (BigDecimal) tratarRETURNyMENSAJES(request, map);

			if (valor == null)
				valor = new BigDecimal(800046);

			map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(valor);
			logger.debug(map);
			listValores.put("lstCORCO", (List) tratarRETURNyMENSAJES(request, map));

			// Cod. Orientaci�n predio
			map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(800046));
			logger.debug(map);
			listValores.put("lstCOR2CO", (List) tratarRETURNyMENSAJES(request, map));

			// Detalle predio
			map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(800047));
			logger.debug(map);
			listValores.put("lstCDET", (List) tratarRETURNyMENSAJES(request, map));
			map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTBANCOS(null, null);
			logger.debug(map);
			listValores.put("tipBANCO", (List) tratarRETURNyMENSAJES(request, map));

			Map mapPrefijos = pac_axis_listPersona.ejecutaPAC_IAX_PERSONA__F_GET_PREFIJOSPAISES();
			listValores.put("listPrefijos", tratarRETURNyMENSAJES(request, mapPrefijos, false));

			if (!isEmpty(CTIPPER)) {
				map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_GET_REGIMENFISCAL(CTIPPER);
				logger.debug(map);
				listValores.put("regFisc", (List) tratarRETURNyMENSAJES(request, map));
			}
			// INI CP0025M_SYS_PERS - JLTS - 21/11/2018 -- Se agrega el listValores
			// LSTTIPOIVA
			/* LSTTIPOIVA */
			map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTTIPOIVA();
			logger.debug(map);
			listValores.put("LSTTIPOIVA", tratarRETURNyMENSAJES(request, map, false));
			// FIN CP0025M_SYS_PERS - JLTS - 21/11/2018

		} catch (Exception e) {
			logger.error("Error en el m�todo Axisper005Service.cargarValoresDesplegables", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			formdata.put("listValores", listValores);
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
	private

			void cargarPersona(HttpServletRequest request, Axisper005Action thisAction, UsuarioBean usuario,
					Map formdata) throws Exception {
		Map OBPERSONA = new HashMap();

		try {
			BigDecimal SPERSON = getHiddenCampoNumerico(request, "SPERSON");
			// BigDecimal CEMPRES = getHiddenCampoNumerico(request, "CEMPRES");
			BigDecimal CEMPRES = null; // null siempre
			// BigDecimal CAGENTE = usuario.getCagente();
			BigDecimal CAGENTE = null; // null siempre
			// BigDecimal SSEGURO = (BigDecimal) AbstractDispatchAction.topPila(request,
			// "SSEGURO");

			PAC_IAX_PERSONA pac_axis_persona = new PAC_IAX_PERSONA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			OBPERSONA.put("isNew", Boolean.valueOf(true));

			/* Estado persona */
			if (!isEmpty(SPERSON)) {
				OBPERSONA.put("isNew", Boolean.valueOf(false));
				request.getSession().setAttribute("resultats", true);

				Map map = pac_axis_persona.ejecutaPAC_IAX_PERSONA__F_GET_ESTPERSONA(SPERSON, CAGENTE);
				logger.debug(map);
				BigDecimal RETURN = (BigDecimal) tratarRETURNyMENSAJES(request, map);

				if (!isEmpty(map) && new BigDecimal(0).equals(RETURN)) {
					OBPERSONA = (Map) map.get("OBPERSONA");

					if (!isEmpty(OBPERSONA)) {
						BigDecimal TIDENTI = (BigDecimal) OBPERSONA.get("CTIPPER");

						// modificacion 18/07/2017 javier herrera jira 960

						BigDecimal SPEREAL = (BigDecimal) OBPERSONA.get("SPEREAL");
						PAC_IAX_FINANCIERA pac_axis_financiera = new PAC_IAX_FINANCIERA(
								(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
						Map mapfICHA = pac_axis_financiera.ejecutaPAC_IAX_FINANCIERA__F_GET_GENERAL_PERSONA(SPEREAL);
						List array = (List) tratarRETURNyMENSAJES(request, mapfICHA);
						if (array != null) {
							int resultado = array.get(0).toString().indexOf("SFINANCI");
							String SFINANCI = array.get(0).toString().substring(resultado).split("=")[1].split(",")[0];
							formdata.put("SFINANCI", SFINANCI);
						}

						// modificacion 18/07/2017 javier herrera jira 960

						if (new BigDecimal(2).equals(TIDENTI)) {
							OBPERSONA.put("TNOMBRE", OBPERSONA.get("TSIGLAS"));
						}

						BigDecimal CTIPPER = new BigDecimal(String.valueOf(OBPERSONA.get("CTIPPER")));
						if (!isEmpty(CTIPPER)) {
							formdata.put("CTIPPER", CTIPPER);
							cargarValoresDesplegables(request, thisAction, usuario, formdata);
						}

						/* Tel�fono fijo */
						map = pac_axis_persona.ejecutaPAC_IAX_PERSONA__F_GET_ESTCONTACTOTLFFIJO(SPERSON, CAGENTE);
						logger.debug(map);
						tratarRETURNyMENSAJES(request, map);
						if (!isEmpty(map)) {
							OBPERSONA.put("TLFFIJO", (String) map.get("TVALCON"));
							OBPERSONA.put("SMODCON_TLFFIJO", (BigDecimal) map.get("SMODCON"));
						}

						/* Tel�fono m�vil */
						map = pac_axis_persona.ejecutaPAC_IAX_PERSONA__F_GET_ESTCONTACTOTLFMOVIL(SPERSON, CAGENTE);
						logger.debug(map);
						tratarRETURNyMENSAJES(request, map);
						if (!isEmpty(map)) {
							OBPERSONA.put("TLFMOVIL", (String) map.get("TVALCON"));
							OBPERSONA.put("SMODCON_TLFMOVIL", (BigDecimal) map.get("SMODCON"));
						}

						/* E-Mail */
						map = pac_axis_persona.ejecutaPAC_IAX_PERSONA__F_GET_ESTCONTACTOMAIL(SPERSON, CAGENTE);
						logger.debug(map);
						tratarRETURNyMENSAJES(request, map);
						if (!isEmpty(map)) {
							OBPERSONA.put("EMAIL", (String) map.get("TVALCON"));
							OBPERSONA.put("SMODCON_EMAIL", (BigDecimal) map.get("SMODCON"));
						}

						/* Fax */
						// Inici BUG 27814 - RCL - 02/08/2013 - Aladir Contacto FAX en el alta rapida de
						// personas
						map = pac_axis_persona.ejecutaPAC_IAX_PERSONA__F_GET_ESTCONTACTOFAX(SPERSON, CAGENTE);
						logger.debug(map);
						tratarRETURNyMENSAJES(request, map);
						if (!isEmpty(map)) {
							OBPERSONA.put("FAX", (String) map.get("TVALCON"));
							OBPERSONA.put("SMODCON_FAX", (BigDecimal) map.get("SMODCON"));
						}
						// Fi BUG 27814 - RCL - 02/08/2013 - Aladir Contacto FAX en el alta rapida de
						// personas

						/* Nacionalidad por defecto */
						map = pac_axis_persona.ejecutaPAC_IAX_PERSONA__F_GET_ESTNACIONALIDADDEFECTO(SPERSON, CAGENTE);
						logger.debug(map);
						tratarRETURNyMENSAJES(request, map);
						if (!isEmpty(map))
							OBPERSONA.put("CNACIONALIDAD", (BigDecimal) map.get("CPAIS"));
						map = pac_axis_persona.ejecutaPAC_IAX_PERSONA__F_GET_ESTPARPERSONA(SPERSON, CAGENTE,
								new BigDecimal(0), new BigDecimal(0), CTIPPER);
						logger.debug(map);
						// OBPERSONA.put("PARPER", (List) tratarRETURNyMENSAJES(request, map,false));
						BigDecimal ok = (BigDecimal) this.tratarRETURNyMENSAJES(request, map);
						ArrayList<HashMap> lista = new ArrayList();
						if (!isEmpty(ok) && ok.intValue() == 0) {
							if (!isEmpty(map.get("PPARPER"))) {
								lista = (ArrayList<HashMap>) map.get("PPARPER");
								OBPERSONA.put("PARPER", lista);
							}
						}
					}
				}

			}

		} catch (Exception e) {
			logger.error("Error en el m�todo Axisper005Service.cargarPersona", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			if (!isEmpty(OBPERSONA))
				formdata.putAll(OBPERSONA);

		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	/*********************************************************************************************************************/
	/****************************************
	 * INNER CLASS QUE REPRESENTA UNA PERSONA
	 *************************************/

	/*********************************************************************************************************************/
	public class

	Persona {
		// Necesarios s�lo para GRABAR
		BigDecimal SSEGURO;
		BigDecimal SPERSON;
		BigDecimal SPEREAL;
		BigDecimal CAGENTE;
		BigDecimal CEMPRES;
		// Necesarios para VALIDAR y GRABAR
		BigDecimal TIDENTI;
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
		java.sql.Date FEFECTO;
		BigDecimal CREGFISCAL;
		BigDecimal SWRUT;
		String COCUPACION;

		public Persona(BigDecimal SSEGURO, BigDecimal SPERSON, BigDecimal SPEREAL, BigDecimal CAGENTE,
				BigDecimal CEMPRES, BigDecimal TIDENTI, BigDecimal CTIPIDE, String NNUMIDE, BigDecimal CSEXPER,
				java.sql.Date FNACIMI, String SNIP, BigDecimal CESTPER, java.sql.Date FJUBILA, BigDecimal CMUTUALISTA,
				java.sql.Date FDEFUNC, BigDecimal NORDIDE, BigDecimal CIDIOMA, String TAPELLI1, String TAPELLI2,
				String TNOMBRE, String TSIGLAS, String CPROFES, BigDecimal CESTCIV, BigDecimal CPAIS,
				BigDecimal CNACIONALIDAD, BigDecimal CDOMICI, BigDecimal PDUPLICADO, String TNOMBRE1, String TNOMBRE2,
				java.sql.Date FEFECTO, BigDecimal CREGFISCAL, BigDecimal SWRUT, String COCUPACION) {
			this.SSEGURO = SSEGURO;
			this.SPERSON = SPERSON;
			this.SPEREAL = SPEREAL;
			this.CAGENTE = CAGENTE;
			this.CEMPRES = CEMPRES;

			this.TIDENTI = TIDENTI;
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
			this.FEFECTO = FEFECTO;
			this.CREGFISCAL = CREGFISCAL;
			this.SWRUT = SWRUT;
			this.COCUPACION = COCUPACION;
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
					TIDENTI, CTIPIDE, NNUMIDE, CSEXPER, FNACIMI, SNIP, CESTPER, FJUBILA, CMUTUALISTA, FDEFUNC, NORDIDE,
					CIDIOMA, TAPELLI1, TAPELLI2, TNOMBRE, TSIGLAS, CPROFES, CESTCIV, CPAIS, TNOMBRE1, TNOMBRE2, SWRUT,
					COCUPACION);
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
	public

			Persona initPersona(HttpServletRequest request, Axisper005Action thisAction) {
		BigDecimal TIDENTI = getHiddenCampoNumerico(request, "CTIPPER"); // LCF TIDENTI
		BigDecimal CTIPIDE = getHiddenCampoNumerico(request, "CTIPIDE");
		String NNUMIDE = getHiddenCampoTextual(request, "NNUMIDE");
		BigDecimal CSEXPER = getHiddenCampoNumerico(request, "CSEXPER");
		java.sql.Date FNACIMI = stringToSqlDate(getHiddenCampoTextual(request, "FNACIMI"));
		String SNIP = getHiddenCampoTextual(request, "SNIP");
		BigDecimal CESTPER = getHiddenCampoNumerico(request, "CESTPER");
		java.sql.Date FJUBILA = stringToSqlDate(getHiddenCampoTextual(request, "FJUBILA"));
		BigDecimal CMUTUALISTA = getHiddenCampoNumerico(request, "CMUTUALISTA");
		java.sql.Date FDEFUNC = stringToSqlDate(getHiddenCampoTextual(request, "FDEFUNC"));
		BigDecimal NORDIDE = getHiddenCampoNumerico(request, "NORDIDE");
		BigDecimal CIDIOMA = getHiddenCampoNumerico(request, "CIDIOMA");
		String TAPELLI1 = getHiddenCampoTextual(request, "TAPELLI1");
		String TAPELLI2 = getHiddenCampoTextual(request, "TAPELLI2");
		String TNOMBRE = getHiddenCampoTextual(request, "TNOMBRE");
		String TNOMBRE1 = getHiddenCampoTextual(request, "TNOMBRE1");
		String TNOMBRE2 = getHiddenCampoTextual(request, "TNOMBRE2");
		String TSIGLAS = null;
		if (new BigDecimal(2).equals(TIDENTI)) {
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
		String CPROFES = getHiddenCampoTextual(request, "CPROFES");
		BigDecimal CESTCIV = getHiddenCampoNumerico(request, "CESTCIV"); // new BigDecimal(12); // Siempre 12
		BigDecimal CPAIS = isEmpty(getHiddenCampoNumerico(request, "CPAIS"))
				? getHiddenCampoNumerico(request, "CPAISnomodi")
				: getHiddenCampoNumerico(request, "CPAIS");
		logger.debug("CPAIIISS ::" + CPAIS);

		BigDecimal CNACIONALIDAD = getHiddenCampoNumerico(request, "CNACIONALIDAD");
		BigDecimal CDOMICI = getHiddenCampoNumerico(request, "CDOMICI");

		// Esto es necesario para el CREAR //

		// BigDecimal SSEGURO = getHiddenCampoNumerico (request, "SSEGURO");
		BigDecimal SSEGURO = (BigDecimal) AbstractDispatchAction.topPila(request, "SSEGURO");
		BigDecimal SPERSON = getHiddenCampoNumerico(request, "SPERSON");
		BigDecimal SPEREAL = getHiddenCampoNumerico(request, "SPEREAL");
		// UsuarioBean usuario = (UsuarioBean)
		// request.getSession().getAttribute(Constantes.USUARIO);
		// BigDecimal CAGENTE = usuario.getCagente();
		BigDecimal CAGENTE = null; // null siempre
		BigDecimal CEMPRES = null; // null siempre
		BigDecimal PDUPLICADA = getHiddenCampoNumerico(request, "PDUPLICADO");

		BigDecimal CREGFISCAL = getHiddenCampoNumerico(request, "CREGFISCAL");
		BigDecimal SWRUT = getHiddenCampoNumerico(request, "SWRUT");
		BigDecimal SWRUT_COLM = getHiddenCampoNumerico(request, "SWRUT_COLM");
		logger.debug("SWRUT ::" + SWRUT);
		logger.debug("SWRUT_COLM ::" + SWRUT_COLM);
		if (isEmpty(SWRUT)) {
			SWRUT = getHiddenCampoNumerico(request, "SWRUT_COLM");
		}
		logger.debug("SWRUT despues if ::" + SWRUT);
		java.sql.Date FEFECTO = stringToSqlDate(getHiddenCampoTextual(request, "FEFECTO"));
		String COCUPACION = getHiddenCampoTextual(request, "COCUPACION");
		return new Persona(SSEGURO, SPERSON, SPEREAL, CAGENTE, CEMPRES, TIDENTI, CTIPIDE, NNUMIDE, CSEXPER, FNACIMI,
				SNIP, CESTPER, FJUBILA, CMUTUALISTA, FDEFUNC, NORDIDE, CIDIOMA, TAPELLI1, TAPELLI2, TNOMBRE, TSIGLAS,
				CPROFES, CESTCIV, CPAIS, CNACIONALIDAD, CDOMICI, PDUPLICADA, TNOMBRE1, TNOMBRE2, FEFECTO, CREGFISCAL,
				SWRUT, COCUPACION);

	}

	/**
	 * @param request    El HttpServletRequest que contiene la petici�n del cliente
	 *                   web.
	 * @param thisAction Una Action abstracta desde donde se ha invocado el servicio
	 *                   (necesaria para el log).
	 * @param isNew      Indica si la persona se est� creando des de cero (true) o
	 *                   se est� modificando (false).
	 * @return BigDecimal Indicando si todo ha ido bien o no.
	 * @throws Exception
	 */
	public

			BigDecimal m_validarCCC(HttpServletRequest request, Axisper005Action thisAction, boolean isNew) {
		logger.debug("Axisper005Service m_validarCCC");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		try {
			logger.debug("a");
			BigDecimal CTIPBAN = getHiddenCampoNumerico(request, "CTIPBAN");
			logger.debug("CTIPBAN : " + CTIPBAN);
			String CBANCAR = getHiddenCampoTextual(request, "CBANCAR");
			logger.debug("CBANCAR : " + CBANCAR);

			String CBANCO = getHiddenCampoTextual(request, "CBANCO");
			logger.debug("CBANCO : " + CBANCO);
			String CCUENTA = getHiddenCampoTextual(request, "CCUENTA");
			logger.debug("CCUENTA : " + CCUENTA);

			// MMS formateo de la CCC
			BigDecimal NLONGBANCO = getCampoNumerico(request, "NLONGBANCO");
			logger.debug("NLONGBANCO : " + NLONGBANCO);
			if (isEmpty(CBANCAR)) {
				// Si es nuevo, y no informa CBANCAR, es correcto
				// Pero devolvemos un 3 para informar de no realizar la grabaci�n de CCC
				// Tambi�n pasaremos por aqu� si !isNew
				// Ya que los datos de CCC no se mostrar�n
				if (isEmpty(CBANCAR) && !isEmpty(CCUENTA)) {
					// CBANCAR=StringUtils.leftPad(CBANCO+"",4,'0')+CCUENTA; // Si el banco no
					// existe por pantalla se tomar� la concatenaci�n de ambos campos
					NLONGBANCO = (NLONGBANCO == null) ? new BigDecimal(4) : NLONGBANCO;
					CBANCAR = StringUtils.leftPad(CBANCO + "", NLONGBANCO.intValue(), '0') + CCUENTA;
				} else {
					return new BigDecimal(3);
				}

			}

			logger.debug("continue");

			PAC_IAX_PERSONA pac_axis_persona = new PAC_IAX_PERSONA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			if (!isEmpty(CBANCAR)) // && new BigDecimal(2).equals(CTIPBAN))
				// quitamos los guiones en todos los casos
				CBANCAR = CBANCAR.replaceAll("-", "");

			BigDecimal resultado = new BigDecimal("0");

			if (!isEmpty(CTIPBAN)) {
				Map map = pac_axis_persona.ejecutaPAC_IAX_PERSONA__F_VALIDACCC(CTIPBAN, CBANCAR);
				logger.debug(map);
				this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
				resultado = (BigDecimal) tratarRETURNyMENSAJES(request, map); // Actualizamos el resultado con el valor
																				// del error si existe.
			}
			return resultado;
		} catch (Exception e) {
			logger.error("Error en el m�todo Axisper005Service.m_validarCCC", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
			return new BigDecimal(1);
		}

	}

	/**
	 * @param request    El HttpServletRequest que contiene la petici�n del cliente
	 *                   web.
	 * @param thisAction Una Action abstracta desde donde se ha invocado el servicio
	 *                   (necesaria para el log).
	 * @return BigDecimal Indicando si todo ha ido bien o no.
	 * @throws Exception
	 */
	public

			BigDecimal m_grabarEstPersona(Persona persona, HttpServletRequest request, Axisper005Action thisAction) {
		logger.debug("Axisper005Service m_grabarPersona");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));

		try {
			PAC_IAX_PERSONA pac_axis_persona = new PAC_IAX_PERSONA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			formdata.put("CPAIS", getHiddenCampoNumerico(request, "CPAISnomodi"));
			String modo = getHiddenCampoTextual(request, "MODO");
			HashMap aviso = this.f_Get_Avisos(request, this.whoami(this));
			BigDecimal pRETURN = (BigDecimal) this.tratarRETURNyMENSAJES(request, aviso);
			request.setAttribute("PLSTAVISOS", aviso.get("PLSTAVISOS"));

			Map map = new HashMap();
			if (pRETURN != null && pRETURN.intValue() != 1) {

				BigDecimal CCIIU = getCampoNumerico(request, "CCIIU");

				PAC_IAX_DESCVALORES pac_axis_valores = new PAC_IAX_DESCVALORES(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
				Map mapCiiu = pac_axis_valores.ejecutaPAC_IAX_DESCVALORES__F_GET_CIIU(CCIIU);

				if (!isEmpty(mapCiiu) && !isEmpty(mapCiiu.get("RETURN"))
						&& !"**".equals((String) mapCiiu.get("RETURN"))) {

				} else {
					thisAction.guardarMensaje(request, "89905716", new Object[] { "" }, Constantes.MENSAJE_ERROR);
					return new BigDecimal(1);
				}

				map = persona.grabaEstPersona(pac_axis_persona);

				if (!isEmpty(map) && !isEmpty(map.get("PSPERSONOUT"))) {
					// Recuperar la PSPERSONOUT y actualizar el SPERSON
					persona.SPERSON = (BigDecimal) map.get("PSPERSONOUT");
					request.setAttribute("PSPERSONOUT", map.get("PSPERSONOUT"));
					formdata.put("SPERSON", map.get("PSPERSONOUT").toString());
					formdata.put("SUFIJOPAIS", new BigDecimal(1));
					Map m;
					if (modo != null && modo.equals("CAN")) {
						m = pac_axis_persona.ejecutaPAC_IAX_PERSONA__F_GRABAR_PARPERSONA(persona.SPERSON, null, "CAN");
					} else {
						m = pac_axis_persona.ejecutaPAC_IAX_PERSONA__F_GRABAR_PARPERSONA(persona.SPERSON, null, "EST");
					}
					tratarRETURNyMENSAJES(request, m);
					logger.debug(m);
				}
			} else {
				this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
				return new BigDecimal(1);
			}
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));

			// this.cargarPersona(request,thisAction,usuario,formdata);
			return (BigDecimal) tratarRETURNyMENSAJES(request, map);

		} catch (Exception e) {
			logger.error("Error en el m�todo Axisper005Service.m_grabarPersona", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
			return new BigDecimal(1);
		}

	}

	/**
	 * @param request    El HttpServletRequest que contiene la petici�n del cliente
	 *                   web.
	 * @param thisAction Una Action abstracta desde donde se ha invocado el servicio
	 *                   (necesaria para el log).
	 * @param isNew      Indica si la persona se est� creando des de cero (true) o
	 *                   se est� modificando (false).
	 * @return BigDecimal Indicando si todo ha ido bien o no.
	 * @throws Exception
	 */
	public

			BigDecimal m_grabarContactoPersona(Persona persona, HttpServletRequest request, Axisper005Action thisAction,
					boolean isNew) {
		logger.debug("Axisper005Service m_grabarContactoPersona");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {
			PAC_IAX_PERSONA pac_axis_persona = new PAC_IAX_PERSONA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			String TLFFIJO_TVALCON = getHiddenCampoTextual(request, "TLFFIJO");
			BigDecimal CPREFIXTF = getCampoNumerico(request, "CPREFIXTF");
			logger.error("CPREFIXTF " + CPREFIXTF);
			BigDecimal SMODCON_TLFFIJO = getHiddenCampoNumerico(request, "SMODCON_TLFFIJO");
			String TLFMOVIL_TVALCON = getHiddenCampoTextual(request, "TLFMOVIL");
			BigDecimal CPREFIXTM = getCampoNumerico(request, "CPREFIXTM");
			logger.error("CPREFIXTM " + CPREFIXTM);
			BigDecimal SMODCON_TLFMOVIL = getHiddenCampoNumerico(request, "SMODCON_TLFMOVIL");
			String EMAIL_TVALCON = getHiddenCampoTextual(request, "EMAIL");
			BigDecimal SMODCON_EMAIL = getHiddenCampoNumerico(request, "SMODCON_EMAIL");
			// Inici BUG 27814 - RCL - 02/08/2013 - Aladir Contacto FAX en el alta rapida de
			// personas
			String FAX_TVALCON = getHiddenCampoTextual(request, "FAX");
			BigDecimal SMODCON_FAX = getHiddenCampoNumerico(request, "SMODCON_FAX");
			BigDecimal CPREFIXF = getCampoNumerico(request, "CPREFIXF");
			logger.error("CPREFIXF " + CPREFIXF);
			// Fi BUG 27814 - RCL - 02/08/2013 - Aladir Contacto FAX en el alta rapida de
			// personas

			boolean todoOk = true;

			if (!isNew | !isEmpty(TLFFIJO_TVALCON)) { // Un solo |, se debe cumplir todo
				Map map = pac_axis_persona.ejecutaPAC_IAX_PERSONA__F_SET_ESTCONTACTOTLFFIJO(persona.SPERSON,
						persona.CAGENTE, TLFFIJO_TVALCON, SMODCON_TLFFIJO, CPREFIXTF);
				logger.debug(map);
				todoOk = new BigDecimal(0).equals(tratarRETURNyMENSAJES(request, map));
				if (!isEmpty(map) && !isEmpty(map.get("SMODCONOUT")))
					formdata.put("SMODCON_TLFFIJO", map.get("SMODCONOUT").toString());
			}

			if (todoOk && (!isNew | !isEmpty(TLFMOVIL_TVALCON))) { // Un solo |, se debe cumplir todo
				Map map = pac_axis_persona.ejecutaPAC_IAX_PERSONA__F_SET_ESTCONTACTOTLFMOVIL(persona.SPERSON,
						persona.CAGENTE, TLFMOVIL_TVALCON, SMODCON_TLFMOVIL, CPREFIXTM);
				logger.debug(map);
				todoOk = new BigDecimal(0).equals(tratarRETURNyMENSAJES(request, map));
				if (!isEmpty(map) && !isEmpty(map.get("SMODCONOUT")))
					formdata.put("SMODCON_TLFMOVIL", map.get("SMODCONOUT").toString());
			}

			if (todoOk && (!isNew | !isEmpty(EMAIL_TVALCON))) { // Un solo |, se debe cumplir todo
				Map map = pac_axis_persona.ejecutaPAC_IAX_PERSONA__F_SET_ESTCONTACTOMAIL(persona.SPERSON,
						persona.CAGENTE, EMAIL_TVALCON, SMODCON_EMAIL);
				logger.debug(map);
				todoOk = new BigDecimal(0).equals(tratarRETURNyMENSAJES(request, map));
				if (!isEmpty(map) && !isEmpty(map.get("SMODCONOUT")))
					formdata.put("SMODCON_EMAIL", map.get("SMODCONOUT").toString());
			}

			// Inici BUG 27814 - RCL - 02/08/2013 - Aladir Contacto FAX en el alta rapida de
			// personas
			if (todoOk && (!isNew | !isEmpty(FAX_TVALCON))) { // Un solo |, se debe cumplir todo
				Map map = pac_axis_persona.ejecutaPAC_IAX_PERSONA__F_SET_ESTCONTACTO(persona.SPERSON, persona.CAGENTE,
						new BigDecimal(2), null, FAX_TVALCON, SMODCON_FAX, null, CPREFIXF);
				logger.debug(map);
				todoOk = new BigDecimal(0).equals(tratarRETURNyMENSAJES(request, map));
				if (!isEmpty(map) && !isEmpty(map.get("SMODCONOUT")))
					formdata.put("SMODCON_FAX", map.get("SMODCONOUT").toString());
			}
			// Fi BUG 27814 - RCL - 02/08/2013 - Aladir Contacto FAX en el alta rapida de
			// personas
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
			return todoOk ? new BigDecimal(0) : new BigDecimal(1);

		} catch (Exception e) {
			logger.error("Error en el m�todo Axisper005Service.m_grabarContactoPersona", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
			return new BigDecimal(1);
		}

	}

	/**
	 * M�todo para grabar la direcci�n de la persona, s�lo se ejecuta si la persona
	 * es nueva. Si no es nueva, en la JSP se esconde la secci�n de Direcci�n.
	 * 
	 * @param request    El HttpServletRequest que contiene la petici�n del cliente
	 *                   web.
	 * @param thisAction Una Action abstracta desde donde se ha invocado el servicio
	 *                   (necesaria para el log).
	 * @param isNew      Indica si la persona se est� creando des de cero (true) o
	 *                   se est� modificando (false).
	 * @return BigDecimal Indicando si todo ha ido bien o no.
	 * @throws Exception
	 */
	public

			BigDecimal m_grabarDireccionPersona(Persona persona, HttpServletRequest request,
					Axisper005Action thisAction, boolean isNew) {
		logger.debug("Axisper005Service m_grabarDireccionPersona");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {
			if (!isNew)
				return new BigDecimal(0);

			PAC_IAX_PERSONA pac_axis_persona = new PAC_IAX_PERSONA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			BigDecimal CTIPDIR = getHiddenCampoNumerico(request, "CTIPDIR");
			BigDecimal CSIGLAS = getHiddenCampoNumerico(request, "CSIGLAS");
			String TNOMVIA = getHiddenCampoTextual(request, "TNOMVIA");
			BigDecimal NNUMVIA = getHiddenCampoNumerico(request, "NNUMVIA");
			String TCOMPLE = getHiddenCampoTextual(request, "TCOMPLE");
			String CPOSTAL = getHiddenCampoTextual(request, "CPOSTAL");
			if (!isEmpty(CPOSTAL))
				CPOSTAL = CPOSTAL.toUpperCase();
			BigDecimal CPOBLAC = getHiddenCampoNumerico(request, "CPOBLAC");
			BigDecimal CPROVIN = getHiddenCampoNumerico(request, "CPROVIN");
			BigDecimal CPAIS = getHiddenCampoNumerico(request, "CPAIS_DIRECCION");

			if (isEmpty(CTIPDIR) && isEmpty(CSIGLAS) && isEmpty(TNOMVIA) && isEmpty(NNUMVIA) && isEmpty(TCOMPLE)
					&& isEmpty(CPOSTAL) && isEmpty(CPOBLAC) && isEmpty(CPROVIN) && isEmpty(CPAIS)) {
				// Si no informa nada, no grabar
				return new BigDecimal(0);
				// Si informa algo, continuar
			}

			// Bug 18940/92686 - 29/09/2011 - AMC
			BigDecimal CVIAVP = getCampoNumerico(request, "CVIAVP");
			BigDecimal CLITVP = getCampoNumerico(request, "CLITVP");
			BigDecimal CBISVP = getCampoNumerico(request, "CBISVP");
			BigDecimal CORVP = getCampoNumerico(request, "CORVP");
			BigDecimal NVIAADCO = getCampoNumerico(request, "NVIAADCO");
			BigDecimal CLITCO = getCampoNumerico(request, "CLITCO");
			BigDecimal CORCO = getCampoNumerico(request, "CORCO");
			BigDecimal NPLACACO = getCampoNumerico(request, "NPLACACO");
			BigDecimal COR2CO = getCampoNumerico(request, "COR2CO");
			BigDecimal CDET1IA = getCampoNumerico(request, "CDET1IA");
			String TNUM1IA = getCampoTextual(request, "TNUM1IA");
			BigDecimal CDET2IA = getCampoNumerico(request, "CDET2IA");
			String TNUM2IA = getCampoTextual(request, "TNUM2IA");
			BigDecimal CDET3IA = getCampoNumerico(request, "CDET3IA");
			String TNUM3IA = getCampoTextual(request, "TNUM3IA");

			String LOCALIDAD = getCampoTextual(request, "LOCALIDAD");

			Map map = pac_axis_persona.ejecutaPAC_IAX_PERSONA__F_SET_ESTDIRECCION(persona.SPERSON, persona.CAGENTE,
					persona.CDOMICI, CTIPDIR, CSIGLAS, TNOMVIA, NNUMVIA, TCOMPLE, CPOSTAL, CPOBLAC, CPROVIN, CPAIS,
					CVIAVP, CLITVP, CBISVP, CORVP, NVIAADCO, CLITCO, CORCO, NPLACACO, COR2CO, CDET1IA, TNUM1IA, CDET2IA,
					TNUM2IA, CDET3IA, TNUM3IA, LOCALIDAD);

			logger.debug(map);
			if (!isEmpty(map) && !isEmpty(map.get("PCDOMICIOUT"))) {
				persona.CDOMICI = (BigDecimal) map.get("PCDOMICIOUT");
				CDOMICINEW = (BigDecimal) map.get("PCDOMICIOUT");
				formdata.put("CDOMICI", map.get("PCDOMICIOUT").toString());
			}

			String TLFFIJO_TVALCON = getHiddenCampoTextual(request, "TLFFIJO");
			BigDecimal CPREFIXTF = getCampoNumerico(request, "CPREFIXTF");
			String TLFMOVIL_TVALCON = getHiddenCampoTextual(request, "TLFMOVIL");
			BigDecimal CPREFIXTM = getCampoNumerico(request, "CPREFIXTM");

			map = pac_axis_persona.ejecutaPAC_IAX_PERSONA__F_SET_ESTCONTACTO(persona.SPERSON, persona.CAGENTE,
					BigDecimal.ONE, null, TLFFIJO_TVALCON, BigDecimal.ONE, persona.CDOMICI, CPREFIXTF);
			map = pac_axis_persona.ejecutaPAC_IAX_PERSONA__F_SET_ESTCONTACTO(persona.SPERSON, persona.CAGENTE,
					new BigDecimal("6"), null, TLFMOVIL_TVALCON, new BigDecimal("2"), persona.CDOMICI, CPREFIXTM);

			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
			return ((BigDecimal) tratarRETURNyMENSAJES(request, map));

		} catch (Exception e) {
			logger.error("Error en el m�todo Axisper005Service.m_grabarDireccionPersona", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
			return new BigDecimal(1);
		}
	}

	/**
	 * @param request    El HttpServletRequest que contiene la petici�n del cliente
	 *                   web.
	 * @param thisAction Una Action abstracta desde donde se ha invocado el servicio
	 *                   (necesaria para el log).
	 * @return BigDecimal Indicando si todo ha ido bien o no.
	 * @throws Exception
	 */
	public

			BigDecimal m_grabarNacionalidadPersona(Persona persona, HttpServletRequest request,
					Axisper005Action thisAction) {
		logger.debug("Axisper005Service m_grabarNacionalidadPersona");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		try {
			PAC_IAX_PERSONA pac_axis_persona = new PAC_IAX_PERSONA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			BigDecimal CPAIS = getHiddenCampoNumerico(request, "CNACIONALIDAD");

			Map map = pac_axis_persona.ejecutaPAC_IAX_PERSONA__F_SET_ESTNACIONALIDADDEFECTO(persona.SPERSON,
					persona.CAGENTE, CPAIS);
			logger.debug(map);
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
			return ((BigDecimal) tratarRETURNyMENSAJES(request, map));

		} catch (Exception e) {
			logger.error("Error en el m�todo Axisper005Service.m_grabarESTNacionalidadPersona", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
			return new BigDecimal(1);
		}
	}

	/**
	 * @param request    El HttpServletRequest que contiene la petici�n del cliente
	 *                   web.
	 * @param thisAction Una Action abstracta desde donde se ha invocado el servicio
	 *                   (necesaria para el log).
	 * @return BigDecimal Indicando si todo ha ido bien o no.
	 * @throws Exception
	 */
	public BigDecimal m_grabarRegfiscalPersona(Persona persona, HttpServletRequest request,
			Axisper005Action thisAction) {
		logger.debug("Axisper005Service m_grabarRegfiscalPersona");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {
			PAC_IAX_PERSONA pac_axis_persona = new PAC_IAX_PERSONA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			java.sql.Date FEFECTO = stringToSqlDate(getCampoTextual(request, "FEFECTO"));
			logger.debug("FEFECTO : " + FEFECTO);
			BigDecimal CREGFISCAL = getCampoNumerico(request, "CREGFISCAL");
			logger.debug("CREGFISCAL :" + CREGFISCAL);
			BigDecimal CTIPIVA = getCampoNumerico(request, "CTIPIVA");

			boolean todoOk = true;
			if (!isEmpty(FEFECTO) && !isEmpty(CREGFISCAL)) {
				Map map = pac_axis_persona.ejecutaPAC_IAX_PERSONA__F_SET_ESTREGIMENFISCAL(persona.SPERSON,
						persona.CAGENTE, FEFECTO, CREGFISCAL, CTIPIVA);
				logger.debug(map);
				todoOk = new BigDecimal(0).equals(tratarRETURNyMENSAJES(request, map));
			}

			return todoOk ? new BigDecimal(0) : new BigDecimal(1);

		} catch (Exception e) {
			logger.error("Error en el m�todo Axisper005Service.m_grabarRegfiscalPersona", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
			return new BigDecimal(1);
		}
	}

	/**
	 * @param request    El HttpServletRequest que contiene la petici�n del cliente
	 *                   web.
	 * @param thisAction Una Action abstracta desde donde se ha invocado el servicio
	 *                   (necesaria para el log).
	 * @return BigDecimal Indicando si todo ha ido bien o no.
	 * @throws Exception
	 */
	public

			BigDecimal m_grabarCCCPersona(Persona persona, HttpServletRequest request, Axisper005Action thisAction) {
		logger.debug("Axisper005Service m_grabarCCCPersona");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {
			PAC_IAX_PERSONA pac_axis_persona = new PAC_IAX_PERSONA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			BigDecimal CNORDBAN = getHiddenCampoNumerico(request, "CNORDBAN");
			BigDecimal CTIPBAN = getHiddenCampoNumerico(request, "CTIPBAN");
			String CBANCAR = getHiddenCampoTextual(request, "CBANCAR");
			BigDecimal CDEFECTO = getHiddenCampoNumerico(request, "CDEFECTO");
			BigDecimal CBANCO = getCampoNumerico(request, "CBANCO");
			String CCUENTA = getCampoTextual(request, "CCUENTA");
			String CTIPCC = getCampoTextual(request, "CTIPCC");

			// MMS formateo de la CCC
			BigDecimal NLONGBANCO = getCampoNumerico(request, "NLONGBANCO");

			if (!isEmpty(CCUENTA))
				// quitamos los guiones en todos los casos
				CCUENTA = CCUENTA.replaceAll("-", "");

			if (isEmpty(CBANCAR) && !isEmpty(CCUENTA)) {
				// CBANCAR=StringUtils.leftPad(CBANCO+"",4,'0')+CCUENTA; // Si el banco no
				// existe por pantalla se tomar� la concatenaci�n de ambos campos
				NLONGBANCO = (NLONGBANCO == null) ? new BigDecimal(4) : NLONGBANCO;
				CBANCAR = StringUtils.leftPad(CBANCO + "", NLONGBANCO.intValue(), '0') + CCUENTA;
			}

			if (CDEFECTO == null)
				CDEFECTO = new BigDecimal(1);
			// grabamos los datos de la CCC
			Map map = pac_axis_persona.ejecutaPAC_IAX_PERSONA__F_SET_ESTCCC(persona.SPERSON, persona.CAGENTE, CNORDBAN,
					CTIPBAN, CBANCAR, CDEFECTO, null, null, null, CTIPCC);
			logger.debug(map);

			if ((!isEmpty(map) && !isEmpty(map.get("CNORDBANOUT"))))
				formdata.put("CNORDBAN", map.get("CNORDBANOUT").toString());

			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
			return ((BigDecimal) tratarRETURNyMENSAJES(request, map));

		} catch (Exception e) {
			logger.error("Error en el m�todo Axisper005Service.m_grabarCCCPersona", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
			return new BigDecimal(1);
		}
	}

	public BigDecimal m_grabarTarjetaPersona(Persona persona, HttpServletRequest request, Axisper005Action thisAction) {
		logger.debug("Axisper005Service m_grabarTarjetaPersona");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {
			PAC_IAX_PERSONA pac_axis_persona = new PAC_IAX_PERSONA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			BigDecimal CNORDBAN = new BigDecimal(1);// LCF //getHiddenCampoNumerico(request, "CNORDBAN");
			BigDecimal CDEFECTO = getHiddenCampoNumerico(request, "CDEFECTO");

			/* *************** TRATAMIENTO FVENCIM ****************** */
			String FVENCIM_CADENA = getCampoTextual(request, "FVENCIM");
			String FVENCIM_CADENAx = getCampoTextual(request, "FVENCIM");
			java.sql.Date FVENCIM = stringToSqlDate(getCampoTextual(request, "FVENCIM"));
			if (!isEmpty(FVENCIM_CADENA)) {
				Calendar calendar = Calendar.getInstance();
				int ANYO = new Integer(FVENCIM_CADENA.substring(3, 7));
				int MES = 0;
				String mes = FVENCIM_CADENA.substring(0, 2);

				MES = this.getMes(mes);

				calendar.set(ANYO, MES, 1);
				int maxDay = calendar.getActualMaximum(Calendar.DAY_OF_MONTH);

				FVENCIM = stringToSqlDate(maxDay + "/" + FVENCIM_CADENA);
				// formdata.put("FVENCIM",FVENCIM);
			}
			/* ******************************************************* */
			formdata.put("FVENCIM", FVENCIM_CADENAx);

			String TSEGURI = getCampoTextual(request, "TSEGURI");
			BigDecimal CPAGSIN = getCampoNumerico(request, "CPAGSIN");

			BigDecimal CTIPBAN_TARJ = getCampoNumerico(request, "CTIPBAN_TARJ");
			String CBANCAR_TARJ = getCampoTextual(request, "CBANCAR_TARJ");
			BigDecimal CBANCO_TARJ = getCampoNumerico(request, "CBANCO_TARJ");
			String CCUENTA_TARJ = getCampoTextual(request, "CCUENTA_TARJ");
			String CTIPCC_TARJ = getCampoTextual(request, "CTIPCC_TARJ");
			if (!isEmpty(CCUENTA_TARJ))
				// quitamos los guiones en todos los casos
				CCUENTA_TARJ = CCUENTA_TARJ.replaceAll("-", "");

			if (isEmpty(CBANCAR_TARJ) && !isEmpty(CCUENTA_TARJ)) {
				CBANCAR_TARJ = StringUtils.leftPad(CBANCO_TARJ + "", 4, '0') + CCUENTA_TARJ; // Si el banco no existe
																								// por pantalla se
																								// tomar� la
																								// concatenaci�n de
																								// ambos campos
			}

			if (CPAGSIN == null)
				CPAGSIN = new BigDecimal(0); // TODO: Valor predeterminado

			if (CDEFECTO == null)
				CDEFECTO = new BigDecimal(1);

			if (!isEmpty(CBANCAR_TARJ)) // && new BigDecimal(2).equals(CTIPBAN))
				// quitamos los guiones en todos los casos
				CBANCAR_TARJ = CBANCAR_TARJ.replaceAll("-", "");
			else
				return new BigDecimal(3); // campo vacio

			// grabamos los datos de la tarjeta
			Map map_tarj = pac_axis_persona.ejecutaPAC_IAX_PERSONA__F_SET_ESTCCC(persona.SPERSON, persona.CAGENTE,
					CNORDBAN, CTIPBAN_TARJ, CBANCAR_TARJ, CDEFECTO, CPAGSIN, FVENCIM, TSEGURI, CTIPCC_TARJ);
			logger.debug(map_tarj);

			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
			return ((BigDecimal) tratarRETURNyMENSAJES(request, map_tarj));

		} catch (Exception e) {
			logger.error("Error en el m�todo Axisper005Service.m_grabarTarjetaPersona", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
			return new BigDecimal(1);
		}
	}

	public String m_getDescTipSoc(HttpServletRequest request, Axisper005Action thisAction) {
		logger.debug("Axisper005Service m_getDescTipSoc");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {
			PAC_IAX_DESCVALORES pac_axis_descValores = new PAC_IAX_DESCVALORES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			String NNUMIDEcerca = getHiddenCampoTextual(request, "NNUMIDEcerca");

			if (!isEmpty(NNUMIDEcerca)) {
				NNUMIDEcerca = NNUMIDEcerca.toUpperCase();
				Map map = pac_axis_descValores.ejecutaPAC_IAX_DESCVALORES__F_GET_DESCSOCIEDAD(NNUMIDEcerca);
				return (String) this.tratarRETURNyMENSAJES(request, map);

			}
			return "";
		}

		catch (Exception e) {
			logger.error("Error en el m�todo Axisper005Service.m_getDescTipSoc", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
			return "";
		}
	}

	/**
	 * @param request El HttpServletRequest que contiene la petici�n del cliente
	 *                web.
	 * @throws Exception
	 */
	public void m_ajax_getProvinPobla(HttpServletRequest request) {
		logger.debug("Axisper005Service m_ajax_getProvinPobla");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {
			PAC_IAX_PERSONA pac_axis_persona = new PAC_IAX_PERSONA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			String CPOSTAL = getHiddenCampoTextual(request, "CPOSTAL");

			if (!isEmpty(CPOSTAL)) {
				CPOSTAL = CPOSTAL.toUpperCase();
				Map map = pac_axis_persona.ejecutaPAC_IAX_PERSONA__F_GET_PROVINPOBLA(CPOSTAL);
				if (!isEmpty(map) && (new BigDecimal(0).equals(ajax.rellenarPlAContenedorAjax(map))
						|| new BigDecimal(2).equals(ajax.rellenarPlAContenedorAjax(map)))) {
					Map direccion = new HashMap();
					direccion.putAll(map);
					formdata.putAll(map);
					ajax.guardarContenidoFinalAContenedorAjax(direccion);
				}
				logger.debug(map);
			}
		} catch (Exception e) {
			logger.error("Error en el servicio Axisper005Service - m�todo m_ajax_getProvinPobla", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	public void m_ajax_direccion(HttpServletRequest request, Axisper005Action thisAction) {
		logger.debug("Axisper005Service m_ajax_direccion");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {
			String op = this.getHiddenCampoTextual(request, "op");
			BigDecimal CPAIS_DIRECCION = this.getHiddenCampoNumerico(request, "CPAIS_DIRECCION");
			BigDecimal CPOBLAC = this.getHiddenCampoNumerico(request, "CPOBLAC");
			BigDecimal CPROVIN = this.getHiddenCampoNumerico(request, "CPROVIN");
			BigDecimal CPAIS_RESIDENCIA = this.getHiddenCampoNumerico(request, "CPAIS_RESIDENCIA");
			BigDecimal CPAIS_NACIONALIDAD = this.getHiddenCampoNumerico(request, "CPAIS_NACIONALIDAD");
			PAC_IAX_DESCVALORES pac_axis_persona = new PAC_IAX_DESCVALORES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			if (CPAIS_DIRECCION == null) {
				CPAIS_DIRECCION = new BigDecimal("-999");
			}
			if (CPROVIN == null) {
				CPROVIN = new BigDecimal("-999");
			}
			if (CPOBLAC == null) {
				CPOBLAC = new BigDecimal("-999");
			}
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
				Map map = pac_axis_persona.ejecutaPAC_IAX_DESCVALORES__F_GET_DESCNACION(CPAIS_NACIONALIDAD);
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
			} else if (!isEmpty(op) && op.equalsIgnoreCase("CPOBLACSINPROV")) {
				Map map = pac_axis_persona.ejecutaPAC_IAX_DESCVALORES__F_GET_DESCPOBLACIONSINPROV(CPOBLAC);
				logger.debug(map);
				ajax.rellenarPlAContenedorAjax(map);
				if (!isEmpty(map) && !isEmpty(map.get("RETURN")) && !"**".equals((String) map.get("RETURN"))) {
					Map poblacion = new HashMap();
					poblacion.put("CPOBLAC", CPOBLAC);
					poblacion.put("TPOBLAC", map.get("RETURN"));
					poblacion.put("CPROVIN", map.get("CPROVIN"));
					formdata.put("CPOBLAC", CPOBLAC);
					formdata.put("TPOBLAC", map.get("RETURN"));
					formdata.put("CPROVIN", map.get("CPROVIN"));
					ajax.guardarContenidoFinalAContenedorAjax(poblacion);
				} else if ("**".equals((String) map.get("RETURN"))) {
					Map poblacion = new HashMap();
					poblacion.put("CPOBLAC", CPOBLAC);
					formdata.put("CPOBLAC", CPOBLAC);
					poblacion.put(Constantes.OPERACION_AJAX_ERROR, Constantes.OPERACION_AJAX_ERROR);
					ajax.guardarContenidoFinalAContenedorAjax(poblacion);
				}
			} else {
				ajax.guardarContenidoFinalAContenedorAjax(Constantes.OPERACION_AJAX_ERROR);
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisper005Service - m�todo m_ajax_direccion", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	public void m_ajaxgetInfoHost(HttpServletRequest request, Axisper005Action thisAction) {
		logger.debug("Axisper005Service m_ajaxgetInfoHost");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {
			BigDecimal SPERSON = getHiddenCampoNumerico(request, "SPERSON");
			logger.debug(SPERSON);
			// SPERSON = new BigDecimal(17071);
			PAC_IAX_PERSONA pac_axis_persona = new PAC_IAX_PERSONA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map map = pac_axis_persona.ejecutaPAC_IAX_PERSONA__F_GET_PERSONA_TRECIBIDO(SPERSON);
			logger.debug(map);
			ajax.rellenarPlAContenedorAjax(map);
		} catch (Exception e) {
			logger.error("Error en el servicio Axisper005Service - m�todo m_ajaxgetInfoHost", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	public void m_busqueda_persona(HttpServletRequest request, Axisper005Action thisAction) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		Map OBPERSONA = new HashMap();
		Map orden;
		int traza = 0;
		try {
			PAC_IAX_PARAM param = new PAC_IAX_PARAM((java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			orden = param.ejecutaPAC_IAX_PARAM__F_PAREMPRESA_N("V_PROV", usuario.getCempres());

			if (orden.get("RETURN") != null && orden.get("RETURN").equals(BigDecimal.ONE)) {
				request.getSession().setAttribute("V_PROV", 1);
			} else {
				request.getSession().setAttribute("V_PROV", 0);
			}

		} catch (Exception e) {
			e.toString();
		}

		try {
			PAC_IAX_PERSONA PAC_IAX_PERSONA = new PAC_IAX_PERSONA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			// Recuperar persona a buscar
			BigDecimal TIDENTI = getHiddenCampoNumerico(request, "TIDENTIcerca");
			String NNUMNIF = getHiddenCampoTextual(request, "NNUMIDEcerca");
			BigDecimal CTIPIDE = getHiddenCampoNumerico(request, "CTIPIDEcerca");
			BigDecimal CSEXPER = getHiddenCampoNumerico(request, "CSEXPERcerca");
			java.sql.Date FNACIMI = stringToSqlDate(getHiddenCampoTextual(request, "FNACIMIcerca"));
			String PMODO = null;
			cargarValoresDesplegables(request, thisAction, usuario, formdata);

			for (int i = 0; i < thisAction.getPila(request).size(); i++) {
				HashMap m = (HashMap) thisAction.getPila(request).get(i);
				PMODO = (String) m.get("CMODO");
			}

			BigDecimal RETURN = new BigDecimal(0);

			if (!isEmpty(NNUMNIF) && !isEmpty(CTIPIDE)) {
				Map map = PAC_IAX_PERSONA.ejecutaPAC_IAX_PERSONA__F_VALIDANIF(NNUMNIF, CTIPIDE, CSEXPER, FNACIMI);
				logger.debug(map);
				RETURN = (BigDecimal) tratarRETURNyMENSAJES(request, map);
				if (!new BigDecimal(0).equals(RETURN))
					formdata.put("INVALID", "1");
			}

			if (formdata.get("paginar") == null && new BigDecimal(0).equals(RETURN)) {
				request.getSession().removeAttribute("Axisper005_listaPersonas");

				BigDecimal SSEGURO = (BigDecimal) AbstractDispatchAction.topPila(request, "SSEGURO");
				BigDecimal PDUPLICADA = getHiddenCampoNumerico(request, "PDUPLICADO");

				Map map = PAC_IAX_PERSONA.ejecutaPAC_IAX_PERSONA__F_GET_PERSONAUNICA(TIDENTI, CTIPIDE, NNUMNIF, CSEXPER,
						FNACIMI, PMODO, SSEGURO, null, PDUPLICADA);

				logger.debug(map);
				RETURN = (BigDecimal) tratarRETURNyMENSAJES(request, map);
				OBPERSONA.put("isModify", Boolean.valueOf(true));
				if (!isEmpty(map) && new BigDecimal(0).equals(RETURN)) {
					OBPERSONA = (Map) map.get("OBPERSONA");
					traza = 1;
					if (!isEmpty(OBPERSONA)) {

						if (!isEmpty(OBPERSONA.get("CTIPIDE")) && !isEmpty(OBPERSONA.get("NNUMIDE")))
							OBPERSONA.put("isModify", Boolean.valueOf(false));

						TIDENTI = (BigDecimal) OBPERSONA.get("CTIPPER");
						if (new BigDecimal(2).equals(TIDENTI)) {
							OBPERSONA.put("TNOMBRE", OBPERSONA.get("TSIGLAS"));
						}
						traza = 2;
						formdata.put("TIPOSOC", this.m_getDescTipSoc(request, thisAction));

						if (!isEmpty(OBPERSONA.get("SPERSON"))) {

							BigDecimal SPERSON = new BigDecimal(String.valueOf(OBPERSONA.get("SPERSON")));

							traza = 3;
							/* Tel�fono fijo */
							map = PAC_IAX_PERSONA.ejecutaPAC_IAX_PERSONA__F_GET_ESTCONTACTOTLFFIJO(SPERSON, null);
							logger.debug(map);
							tratarRETURNyMENSAJES(request, map);
							if (!isEmpty(map)) {
								OBPERSONA.put("TLFFIJO", (String) map.get("TVALCON"));
								OBPERSONA.put("SMODCON_TLFFIJO", (BigDecimal) map.get("SMODCON"));
							}
							traza = 4;
							/* Tel�fono m�vil */
							map = PAC_IAX_PERSONA.ejecutaPAC_IAX_PERSONA__F_GET_ESTCONTACTOTLFMOVIL(SPERSON, null);
							logger.debug(map);
							tratarRETURNyMENSAJES(request, map);
							if (!isEmpty(map)) {
								OBPERSONA.put("TLFMOVIL", (String) map.get("TVALCON"));
								OBPERSONA.put("SMODCON_TLFMOVIL", (BigDecimal) map.get("SMODCON"));
							}
							traza = 5;
							/* E-Mail */
							map = PAC_IAX_PERSONA.ejecutaPAC_IAX_PERSONA__F_GET_ESTCONTACTOMAIL(SPERSON, null);
							logger.debug(map);
							tratarRETURNyMENSAJES(request, map);
							if (!isEmpty(map)) {
								OBPERSONA.put("EMAIL", (String) map.get("TVALCON"));
								OBPERSONA.put("SMODCON_EMAIL", (BigDecimal) map.get("SMODCON"));
							}
							traza = 6;
							/* Fax */
							// Inici BUG 27814 - RCL - 02/08/2013 - Aladir Contacto FAX en el alta rapida de
							// personas
							map = PAC_IAX_PERSONA.ejecutaPAC_IAX_PERSONA__F_GET_ESTCONTACTOFAX(SPERSON, null);
							logger.debug(map);
							tratarRETURNyMENSAJES(request, map);
							if (!isEmpty(map)) {
								OBPERSONA.put("FAX", (String) map.get("TVALCON"));
								OBPERSONA.put("SMODCON_FAX", (BigDecimal) map.get("SMODCON"));
							}
							traza = 7;
							// Fi BUG 27814 - RCL - 02/08/2013 - Aladir Contacto FAX en el alta rapida de
							// personas
							/* Nacionalidad por defecto */
							map = PAC_IAX_PERSONA.ejecutaPAC_IAX_PERSONA__F_GET_ESTNACIONALIDADDEFECTO(SPERSON, null);
							logger.debug(map);
							tratarRETURNyMENSAJES(request, map);
							if (!isEmpty(map))
								OBPERSONA.put("CNACIONALIDAD", (BigDecimal) map.get("CPAIS"));
							traza = 8;
							/* ejecutaPAC_IAX_PERSONA__F_GETESTCCC */
							map = PAC_IAX_PERSONA.ejecutaPAC_IAX_PERSONA__F_GET_ESTCUENTASBANCARIAS(SPERSON, null);
							traza = 9;
							logger.debug(map);

							if (map.get("PCCC") != null && ((ArrayList) map.get("PCCC")).size() > 0) {
								HashMap ccc = (HashMap) ((HashMap) ((ArrayList) map.get("PCCC")).get(0))
										.get("OB_IAX_CCC");
								map = PAC_IAX_PERSONA.ejecutaPAC_IAX_PERSONA__F_GET_ESTCCC(SPERSON,
										new BigDecimal(String.valueOf(ccc.get("CNORDBAN"))));
								logger.debug(map);
								if (map != null && map.size() > 0) {
									if (new BigDecimal(0).equals(tratarRETURNyMENSAJES(request, map))) {
										Map OB_IAX_CCC = (Map) map.get("CCC");
										if (!isEmpty(OB_IAX_CCC))
											formdata.putAll(OB_IAX_CCC);
									}
								}
							}
							traza = 10;

							map = PAC_IAX_PERSONA.ejecutaPAC_IAX_PERSONA__F_GET_ESTDIRECCIONES(SPERSON, null);
							traza = 9;
							logger.debug(map);
							if (map.get("PDIRECCIONES") != null && ((ArrayList) map.get("PDIRECCIONES")).size() > 0) {

								HashMap direccion = (HashMap) ((HashMap) ((ArrayList) map.get("PDIRECCIONES")).get(0))
										.get("OB_IAX_DIRECCIONES");
								map = PAC_IAX_PERSONA.ejecutaPAC_IAX_PERSONA__F_GET_ESTDIRECCION(SPERSON,
										new BigDecimal(String.valueOf(direccion.get("CDOMICI"))));
								logger.debug(map);
								if (new BigDecimal(0).equals(tratarRETURNyMENSAJES(request, map))) {
									Map OB_IAX_DIRECCIONES = (Map) map.get("PDIRECCIONES");
									if (!isEmpty(OB_IAX_DIRECCIONES)) {
										OB_IAX_DIRECCIONES.put("CPAIS_DIRECCION", OB_IAX_DIRECCIONES.get("CPAIS"));
										formdata.putAll(OB_IAX_DIRECCIONES);
									}
								}
							}

							traza = 11;
						} else {

							if (!isEmpty(OBPERSONA.get("CCC"))) {
								formdata.putAll((HashMap) ((HashMap) ((ArrayList) OBPERSONA.get("CCC")).get(0))
										.get("OB_IAX_CCC"));
								formdata.putAll((HashMap) ((HashMap) ((ArrayList) OBPERSONA.get("DIRECCIONES")).get(0))
										.get("OB_IAX_DIRECCIONES"));
								formdata.putAll(
										(HashMap) ((HashMap) ((ArrayList) OBPERSONA.get("NACIONALIDADES")).get(0))
												.get("OB_IAX_NACIONALIDADES"));
								if (!isEmpty(OBPERSONA.get("CONTACTOS")))
									formdata.putAll(
											(HashMap) ((HashMap) ((ArrayList) OBPERSONA.get("CONTACTOS")).get(0))
													.get("OB_IAX_CONTACTOS"));
								formdata.putAll(
										(HashMap) ((HashMap) ((ArrayList) OBPERSONA.get("IDENTIFICADORES")).get(0))
												.get("OB_IAX_IDENTIFICADORES"));
							}
							OBPERSONA.put("CNACIONALIDAD", null);
							OBPERSONA.put("EMAIL", null);
							OBPERSONA.put("SMODCON_EMAIL", null);
							OBPERSONA.put("TLFFIJO", null);
							OBPERSONA.put("SMODCON_TLFFIJO", null);
							OBPERSONA.put("TLFMOVIL", null);
							OBPERSONA.put("SMODCON_TLFMOVIL", null);
							OBPERSONA.put("CPAIS_DIRECCION", null);
							// Inici BUG 27814 - RCL - 02/08/2013 - Aladir Contacto FAX en el alta rapida de
							// personas
							OBPERSONA.put("FAX", null);
							OBPERSONA.put("SMODCON_FAX", null);
							// Fi BUG 27814 - RCL - 02/08/2013 - Aladir Contacto FAX en el alta rapida de
							// personas

						}
					}
				}

				BigDecimal SPERSON = getHiddenCampoNumerico(request, "SPERSON");
				BigDecimal CAGENTE = getHiddenCampoNumerico(request, "CAGENTE");
				logger.debug(SPERSON);

				Map mapx = PAC_IAX_PERSONA.ejecutaPAC_IAX_PERSONA__F_GET_ESTPARPERSONA(SPERSON, CAGENTE,
						new BigDecimal(0), new BigDecimal(0), TIDENTI);
				logger.debug(mapx);
				BigDecimal ok = (BigDecimal) this.tratarRETURNyMENSAJES(request, mapx);
				ArrayList<HashMap> lista = new ArrayList();
				if (!isEmpty(ok) && ok.intValue() == 0) {
					if (!isEmpty(mapx.get("PPARPER"))) {
						lista = (ArrayList<HashMap>) mapx.get("PPARPER");
						formdata.put("PARPER", lista);
					}
				}
			}
			formdata.put("sin_provincias", formdata.get("sinProvincias"));
		} catch (Exception e) {
			thisAction.guardarMensaje(request, "1000050", new Object[] { new BigDecimal(traza) },
					Constantes.MENSAJE_ERROR);
			// new Object[] {e.toString()

		} finally {
			if (!isEmpty(OBPERSONA)) {
				formdata.putAll(OBPERSONA);
				request.getSession().setAttribute("dades_setpersona", OBPERSONA);
			} else {
				try {

					cargarValoresDesplegables(request, thisAction, usuario, formdata);
				} catch (Exception ex) {
				}
				request.getSession().removeAttribute("dades_setpersona");
			}

			request.getSession().setAttribute("resultats", true);

		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	public void m_ajax_duplicada(HttpServletRequest request, Axisper005Action thisAction) {
		logger.debug("Axisper005Service m_ajax_duplicada");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {
			BigDecimal CTIPPER = getHiddenCampoNumerico(request, "CTIPPERcerca");
			BigDecimal SPERSON = getHiddenCampoNumerico(request, "SPERSON");
			String NNUMNIF = getHiddenCampoTextual(request, "NNUMIDEcerca");
			String SNIP = getHiddenCampoTextual(request, "SNIP");
			BigDecimal CTIPIDE = getHiddenCampoNumerico(request, "CTIPIDEcerca");
			BigDecimal CSEXPER = getHiddenCampoNumerico(request, "CSEXPERcerca");
			// BigDecimal SWPUBLI = getHiddenCampoNumerico(request, "SWPUBLI");
			// se pone SWPUBLI a 0 porque siempre son personas privadas desde nueva
			// producci�n.
			BigDecimal SWPUBLI = new BigDecimal("0");

			BigDecimal CAGENTE = isEmpty(getHiddenCampoNumerico(request, "CAGENTEcerca"))
					? this.getHiddenCampoNumerico(request, "CAGENTE_INI")
					: getHiddenCampoNumerico(request, "CAGENTEcerca");
			java.sql.Date FNACIMI = stringToSqlDate(getHiddenCampoTextual(request, "FNACIMIcerca"));
			PAC_IAX_PERSONA pac_axis_persona = new PAC_IAX_PERSONA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map map = pac_axis_persona.ejecutaPAC_IAX_PERSONA__F_PERSONA_DUPLICADA(SPERSON, NNUMNIF, CSEXPER, FNACIMI,
					SNIP, CAGENTE, SWPUBLI, CTIPIDE);
			logger.debug(map);
			ajax.rellenarPlAContenedorAjax(map);
			ajax.guardarContenidoFinalAContenedorAjax(map);

			PAC_IAX_PARAM pac_iax_param = new PAC_IAX_PARAM(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map m = pac_iax_param.ejecutaPAC_IAX_PARAM__F_PAREMPRESA_N("SIN_PROVINCIAS", usuario.getCempres());
			BigDecimal sin_provincias = (BigDecimal) tratarRETURNyMENSAJES(request, m);
			logger.debug("\n\n\n###########################################\n\n\n" + sin_provincias
					+ "\n\n\n################################\n\n\n");
			formdata.put("sin_provincias", sin_provincias);
			logger.debug(request.getAttribute(Constantes.FORMDATA));
		} catch (Exception e) {
			logger.error("Error en el servicio Axisper005Service - m�todo m_ajax_direccion", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	public void m_ajax_getnnumide(HttpServletRequest request, Axisper005Action thisAction) {
		logger.debug("Axisper005Service m_ajax_getnnumide");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {
			BigDecimal SPERSON = getHiddenCampoNumerico(request, "SPERSON");
			String NNUMNIF = getHiddenCampoTextual(request, "NNUMIDE");
			String SNIP = getHiddenCampoTextual(request, "SNIP");
			BigDecimal CTIPIDE = getHiddenCampoNumerico(request, "CTIPIDE");
			PAC_IAX_PERSONA pac_axis_persona = new PAC_IAX_PERSONA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map map = pac_axis_persona.ejecutaPAC_IAX_PERSONA__F_GET_NIF(SPERSON, CTIPIDE, NNUMNIF, SNIP);
			logger.debug(map);

			ajax.rellenarPlAContenedorAjax(map);
			ajax.guardarContenidoFinalAContenedorAjax(map);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisper005Service - m�todo m_ajax_getnnumide", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

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
	public void m_getPersona(HttpServletRequest request, Axisper005Action thisAction) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		Map OBPERSONA = new HashMap();
		try {
			PAC_IAX_PERSONA PAC_IAX_PERSONA = new PAC_IAX_PERSONA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			// Recuperar persona a buscar
			BigDecimal SPERSON = getHiddenCampoNumerico(request, "SPERSONDUP");
			BigDecimal CAGENTE = getHiddenCampoNumerico(request, "CAGENTEDUP");

			BigDecimal SPERSONEST = getHiddenCampoNumerico(request, "SPERSONEST");

			// Traspasem la persona

			String CODITABLAS = getHiddenCampoTextual(request, "CODITABLAS");
			String SNIP = getHiddenCampoTextual(request, "SNIP");
			BigDecimal CEMPRES = null;

			if (isEmpty(CODITABLAS))
				CODITABLAS = "POL";

			BigDecimal SSEGURO = (BigDecimal) AbstractDispatchAction.topPila(request, "SSEGURO");

			logger.debug("pila nova-->" + request.getSession().getAttribute("PASSTOPPILA"));
			BigDecimal SSEGURO_OUT = (BigDecimal) AbstractDispatchAction.topPila(request, "SSEGURO_OUT");

			SSEGURO_OUT = !isEmpty(SSEGURO_OUT) ? SSEGURO_OUT : SSEGURO;
			Map map = PAC_IAX_PERSONA.ejecutaPAC_IAX_PERSONA__F_TRASPASAPERSONAEST(SPERSON, CAGENTE, CODITABLAS,
					SSEGURO_OUT, SNIP);
			logger.debug(map);

			if (!isEmpty(map) && new BigDecimal(0).equals(tratarRETURNyMENSAJES(request, map))) {
				request.setAttribute("SPERSON_OUT", map.get("PSPERSON_OUT"));
				SPERSONEST = new BigDecimal(String.valueOf(map.get("PSPERSON_OUT")));
				formdata.put("SPERSON", SPERSONEST);
			}

			this.cargarPersona(request, thisAction, usuario, formdata);

			formdata.put("isNew", Boolean.FALSE);
			cargarValoresDesplegables(request, thisAction, usuario, formdata);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisper005Service - m�todo m_get_persona", e);

		} finally {

			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}

	}

	public int getMes(String mes) {
		Calendar calendar = Calendar.getInstance();
		if (mes.equals("01")) {
			return calendar.JANUARY;
		} else if (mes.equals("02")) {
			return calendar.FEBRUARY;
		} else if (mes.equals("03")) {
			return calendar.MARCH;
		} else if (mes.equals("04")) {
			return calendar.APRIL;
		} else if (mes.equals("05")) {
			return calendar.MAY;
		} else if (mes.equals("06")) {
			return calendar.JUNE;
		} else if (mes.equals("07")) {
			return calendar.JULY;
		} else if (mes.equals("08")) {
			return calendar.AUGUST;
		} else if (mes.equals("09")) {
			return calendar.SEPTEMBER;
		} else if (mes.equals("10")) {
			return calendar.OCTOBER;
		} else if (mes.equals("11")) {
			return calendar.NOVEMBER;
		} else if (mes.equals("12")) {
			return calendar.DECEMBER;
		} else {
			return calendar.DECEMBER;
		}
	}

	public void m_ajax_getdigito(HttpServletRequest request, Axisper005Action thisAction) {
		logger.debug("Axisper005Service m_ajax_getdigito");
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
			logger.error("Error en el servicio Axisper005Service - m�todo m_ajax_getdigito", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	/**
	 * Dada una persona elegida en el buscador, la traspasa a las tablas de estudio.
	 * Pone en request un par?metro "SPERSON_OUT" para que f_onload() de la JSP sepa
	 * que se ha traspasado correctamente, y pueda enviar el nuevo SPERSON a la
	 * pantalla padre.
	 * 
	 * @param request    El HttpServletRequest que contiene la petici?n del cliente
	 *                   web.
	 * @param thisAction Una Action abstracta desde donde se ha invocado el servicio
	 *                   (necesaria para el log).
	 */

	public void m_traspaso_persona(HttpServletRequest request, Axisper005Action thisAction) {
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
				PAC_IAX_PERSONA pac_axis_persona = new PAC_IAX_PERSONA(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
				BigDecimal SSEGURO = (BigDecimal) AbstractDispatchAction.topPila(request, "SSEGURO");

				logger.debug("pila nova --> " + request.getSession().getAttribute("PASSTOPPILA"));
				BigDecimal SSEGURO_OUT = (BigDecimal) AbstractDispatchAction.topPila(request, "SSEGURO_OUT");

				Map map = new HashMap();

				SSEGURO_OUT = !isEmpty(SSEGURO_OUT) ? SSEGURO_OUT : SSEGURO;
				map = pac_axis_persona.ejecutaPAC_IAX_PERSONA__F_TRASPASAPERSONAEST(SPERSON, CAGENTE, CODITABLAS,
						SSEGURO_OUT, SNIP);
				logger.debug(map);

				if (!isEmpty(map) && new BigDecimal(0).equals(tratarRETURNyMENSAJES(request, map))) {
					request.setAttribute("SPERSON", map.get("PSPERSON_OUT"));
					formdata.put("SPERSON", map.get("PSPERSON_OUT"));
					request.setAttribute("SPERSON_OUT", map.get("PSPERSON_OUT"));

				} else {
					if (!isEmpty(map.get("PMENSAPOPUP"))) {
						String format = String.valueOf(map.get("PMENSAPOPUP"));
						format = format.replaceAll((Character.valueOf((char) 13)).toString(), "<br>");
						request.setAttribute("PMENSAPOPUP", format);
					}
				}

				this.m_form(request, thisAction);

			}

		} catch (Exception e) {
			logger.error("Error", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}

		this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
	}

	public void m_eliminarCONTACTO(HttpServletRequest request, Axisper005Action thisAction) {
		logger.debug("Axisper005Service m_eliminarCONTACTO");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {
			BigDecimal SPERSON = this.getHiddenCampoNumerico(request, "SPERSON");
			BigDecimal CMODCON = this.getCampoNumerico(request, "CMODCON");
			BigDecimal CAGENTE = getCampoNumerico(request, "CAGENTE");

			logger.error("SPERSON " + SPERSON);
			logger.error("CMODCON " + CMODCON);

			PAC_IAX_PERSONA pac_axis_persona = new PAC_IAX_PERSONA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map map = pac_axis_persona.ejecutaPAC_IAX_PERSONA__F_DEL_ESTCONTACTO(SPERSON, CMODCON, CAGENTE);

			tratarRETURNyMENSAJES(request, map);
		} catch (Exception e) {
			logger.error("Error en el m�todo Axisper005Service.m_eliminarCONTACTO", e);
			thisAction.guardarMensaje(request, "1000052", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	public String m_personaSperson(Persona persona) {
		return isEmpty(persona.SPERSON) ? null : persona.SPERSON.toString();
	}

	// INI BUG CONF-349 - 17/09/2016 - JAEG
	/**
	 * Graba una persona en la emision directamente en las tablas reales
	 * 
	 * @param request    El HttpServletRequest que contiene la petici?n del cliente
	 *                   web.
	 * @param thisAction Una Action abstracta desde donde se ha invocado el servicio
	 *                   (necesaria para el log).
	 */

	public void m_traspaso_persona_est(HttpServletRequest request, Axisper005Action thisAction) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);

		try {
			PAC_IAX_PARAM pac_axis_param = new PAC_IAX_PARAM(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map map_param = new HashMap();
			map_param = pac_axis_param.ejecutaPAC_IAX_PARAM__F_PARINSTALACION_NN("PERSONA_ONLINE");
			if (new BigDecimal(1).equals(map_param.get("RETURN"))) {
				// Recuperar persona a buscar
				BigDecimal SPERSON = getCampoNumerico(request, "SPERSON");
				String SNIP = getCampoTextual(request, "SNIP");
				BigDecimal CAGENTE = null;

				PAC_IAX_PERSONA pac_axis_persona = new PAC_IAX_PERSONA(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
				BigDecimal SSEGURO = (BigDecimal) AbstractDispatchAction.topPila(request, "SSEGURO");
				BigDecimal SSEGURO_OUT = (BigDecimal) AbstractDispatchAction.topPila(request, "SSEGURO_OUT");

				Map map = new HashMap();

				SSEGURO_OUT = !isEmpty(SSEGURO_OUT) ? SSEGURO_OUT : SSEGURO;
				map = pac_axis_persona.ejecutaPAC_IAX_PERSONA__F_TRASPASAPERSONAPOL(SPERSON, SNIP, CAGENTE, "EST",
						SSEGURO_OUT);

				// modificacion 18/07/2017 javier herrera jira 960

				BigDecimal SPEREAL = (BigDecimal) map.get("PSPERSON_OUT");

				BigDecimal CCIIU = getCampoNumerico(request, "CCIIU");
				String CMODO = "1";
				java.sql.Date FCCOMER = new java.sql.Date(Calendar.getInstance().getTime().getTime());

				String TDESCRIP = "";
				BigDecimal CFOTORUT = BigDecimal.ZERO;
				Date FRUT = new java.sql.Date(Calendar.getInstance().getTime().getTime());
				String TTITULO = "";
				BigDecimal CFOTOCED = BigDecimal.ZERO;
				Date FEXPICED = new java.sql.Date(Calendar.getInstance().getTime().getTime());
				BigDecimal CPAIS = new BigDecimal(170);
				BigDecimal CPROVIN = new BigDecimal(11);
				BigDecimal CPOBLAC = new BigDecimal(1);
				String TINFOAD = "";
				BigDecimal CTIPSOCI = BigDecimal.ZERO;
				BigDecimal CESTSOC = BigDecimal.ZERO;
				String TOBJSOC = ".";
				String TEXPERI = "";
				Date FCONSTI = stringToSqlDate(getCampoTextual(request, "FNACIMI"));
				String TVIGENC = ".";
				BigDecimal SFINANCI = getCampoNumerico(request, "SFINANCI");
				PAC_IAX_FINANCIERA pac_axis_financiera = new PAC_IAX_FINANCIERA(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
				if (SFINANCI == null) {// si es nueva la persona se crea la ficha
					SFINANCI = BigDecimal.ZERO;

					Map mapFicha = pac_axis_financiera.ejecutaPAC_IAX_FINANCIERA__F_GRABAR_GENERAL(SPEREAL, SFINANCI,
							CMODO, null, null, null, null, null, null, null, CPAIS, null, null, null, CCIIU, null, null,
							null, null, FCONSTI, null);

				} else {// se modifica el cciiu
					Map mapFicha = pac_axis_financiera.ejecutaPAC_IAX_FINANCIERA__F_MODIFICAR_CCIIU(SFINANCI, CCIIU);
				}

				// modificacion 18/07/2017 javier herrera jira 960

				BigDecimal CTIPDIR = getHiddenCampoNumerico(request, "CTIPDIR");
				BigDecimal CSIGLAS = getHiddenCampoNumerico(request, "CSIGLAS");
				String TNOMVIA = getHiddenCampoTextual(request, "TNOMVIA");
				BigDecimal NNUMVIA = getHiddenCampoNumerico(request, "NNUMVIA");
				String TCOMPLE = getHiddenCampoTextual(request, "TCOMPLE");
				String CPOSTAL = getHiddenCampoTextual(request, "CPOSTAL");
				if (!isEmpty(CPOSTAL))
					CPOSTAL = CPOSTAL.toUpperCase();
				CPOBLAC = getHiddenCampoNumerico(request, "CPOBLAC");
				CPROVIN = getHiddenCampoNumerico(request, "CPROVIN");
				CPAIS = getHiddenCampoNumerico(request, "CPAIS_DIRECCION");
				BigDecimal CVIAVP = getCampoNumerico(request, "CVIAVP");
				BigDecimal CLITVP = getCampoNumerico(request, "CLITVP");
				BigDecimal CBISVP = getCampoNumerico(request, "CBISVP");
				BigDecimal CORVP = getCampoNumerico(request, "CORVP");
				BigDecimal NVIAADCO = getCampoNumerico(request, "NVIAADCO");
				BigDecimal CLITCO = getCampoNumerico(request, "CLITCO");
				BigDecimal CORCO = getCampoNumerico(request, "CORCO");
				BigDecimal NPLACACO = getCampoNumerico(request, "NPLACACO");
				BigDecimal COR2CO = getCampoNumerico(request, "COR2CO");
				BigDecimal CDET1IA = getCampoNumerico(request, "CDET1IA");
				String TNUM1IA = getCampoTextual(request, "TNUM1IA");
				BigDecimal CDET2IA = getCampoNumerico(request, "CDET2IA");
				String TNUM2IA = getCampoTextual(request, "TNUM2IA");
				BigDecimal CDET3IA = getCampoNumerico(request, "CDET3IA");
				String TNUM3IA = getCampoTextual(request, "TNUM3IA");
				String LOCALIDAD = getCampoTextual(request, "LOCALIDAD");

				String TALIAS = getCampoTextual(request, "TALIAS");
				Map map2 = pac_axis_persona.ejecutaPAC_IAX_PERSONA__F_SET_DIRECCION(SPEREAL, usuario.getCagente(),
						CDOMICINEW, CTIPDIR, CSIGLAS, TNOMVIA, NNUMVIA, TCOMPLE, CPOSTAL, CPOBLAC, CPROVIN, CPAIS,
						CVIAVP, CLITVP, CBISVP, CORVP, NVIAADCO, CLITCO, CORCO, NPLACACO, COR2CO, CDET1IA, TNUM1IA,
						CDET2IA, TNUM2IA, CDET3IA, TNUM3IA, LOCALIDAD, TALIAS);
				tratarRETURNyMENSAJES(request, map);
			}
		} catch (Exception e) {
			logger.error("Error", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}
	// FIN BUG CONF-349 - 17/09/2016 - JAEG

}
