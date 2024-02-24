//Revision:# XSlNdt11Qof2sXZzvMeO9g== #
package axis.service.modal;

import java.math.BigDecimal;
import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_COMMON;
import axis.jdbc.PAC_IAX_DESCVALORES;
import axis.jdbc.PAC_IAX_FINANCIERA;
import axis.jdbc.PAC_IAX_GESTION_REC;
import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.jdbc.PAC_IAX_PARAM;
import axis.jdbc.PAC_IAX_PERSONA;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.control.axis.Axisper009Action;
import axis.mvc.control.modal.Axisfic002Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AjaxContainerService;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

public class Axisfic002Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	/*********************************************************************************************************************/
	/************************************************
	 * M�TODOS DE INICIALIZACI�N
	 *******************************************/
	/*********************************************************************************************************************/

	/**
	 * Realiza la carga inicial de la pantalla.
	 * 
	 * @param request El HttpServletRequest que contiene la petici�n del cliente
	 *                web.
	 */
	public void m_form(HttpServletRequest request, Axisfic002Action thisAction) {
		logger.debug("Axisfic002Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		// IAXIS-4854 SE GUARDA EL MODO DE INGRESO AL MODULO DE PERSONAS
		String modoAct = AbstractDispatchAction.topPila(request, "CMODO").toString();
		try {

			/* Desplegables */
			cargarValoresDesplegables(request, usuario, formdata);

			/* Cargar direcci�n (s�lo si hay CDOMICI) */
			BigDecimal SPERSON = getCampoNumerico(request, "SPERSON");
			if (SPERSON == null) {
				try {
					SPERSON = new BigDecimal(String.valueOf(request.getParameter("SPERSON")));
				} catch (Exception ex) {
					SPERSON = null;
				}
			}

			BigDecimal CDOMICI = getCampoNumerico(request, "CDOMICI");
			BigDecimal CAGENTE = getCampoNumerico(request, "CAGENTE");
			logger.debug("C-->" + CAGENTE);
			// formdata.put("CAGENTE", CAGENTE);
			formdata.put("CDOMICI", bigDecimalToString(CDOMICI));
			formdata.put("CAGENTE", bigDecimalToString(CAGENTE));

			if (!isEmpty(CDOMICI) && isEmpty(getCampoNumerico(request, "CTIPDIR"))) {
				PAC_IAX_PERSONA pac_axis_persona = new PAC_IAX_PERSONA(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
				Map map = pac_axis_persona.ejecutaPAC_IAX_PERSONA__F_GET_DIRECCION(SPERSON, CDOMICI);
				logger.debug(map);
				if (new BigDecimal(0).equals(tratarRETURNyMENSAJES(request, map))) {
					Map OB_IAX_DIRECCIONES = (Map) map.get("PDIRECCIONES");
					if (!isEmpty(OB_IAX_DIRECCIONES)) {
						formdata.putAll(OB_IAX_DIRECCIONES);
						// formdata.put("TNOMVIACOL",OB_IAX_DIRECCIONES.get("TNOMVIA"));
					}
				}
			}

			/* Cargar SFINANCI, NMOVIMI y CMODO */
			BigDecimal SFINANCI = getCampoNumerico(request, "SFINANCI");
			if (SFINANCI == null) {
				try {
					SFINANCI = new BigDecimal(String.valueOf(request.getParameter("SFINANCI")));
				} catch (Exception ex) {
					SFINANCI = null;
				}
			}
			// INI TCS_11;IAXIS-2119 - JLTS - 10/03/2019 - Se incluye campo NMOVIMI
			BigDecimal NMOVIMI = getCampoNumerico(request, "NMOVIMI");
			if (NMOVIMI == null) {
				try {
					NMOVIMI = new BigDecimal(String.valueOf(request.getParameter("NMOVIMI")));
				} catch (Exception ex) {
					NMOVIMI = null;
				}
			}
			// FIN TCS_11;IAXIS-2119 - JLTS - 10/03/2019

			if (!isEmpty(getCampoTextual(request, "CMODO"))) {

				String tModo = "";

				if (getCampoTextual(request, "CMODO").equals("0")) {
					tModo = "ALTA";
				} else if (getCampoTextual(request, "CMODO").equals("1")) {
					tModo = "CONSULTA";
				} else if (getCampoTextual(request, "CMODO").equals("2")) {
					tModo = "MODIFICACION";
				}
				AbstractDispatchAction.topPila(request, "CMODO", tModo);
				formdata.put("CMODO", getCampoTextual(request, "CMODO"));
			}
			// INI TCS_11;IAXIS-2119 - JLTS - 10/03/2019 - Se adiciona campo CMODO
			BigDecimal CMODO = getCampoNumerico(request, "CMODO");
			if (CMODO == null) {
				try {
					CMODO = new BigDecimal(String.valueOf(request.getParameter("CMODO")));
				} catch (Exception ex) {
					CMODO = null;
				}
			}
			// FIN TCS_11;IAXIS-2119 - JLTS - 10/03/2019

			formdata.put("SFINANCI", bigDecimalToString(SFINANCI));

			Axisper009Action axisper009Action = new Axisper009Action();
			cargarPersona(request, axisper009Action, usuario, formdata);

			// 0 - Nuevo
			// 1 - Consultar
			// 2 - Editar
			// INI TCS_11;IAXIS-2119 - JLTS - 10/03/2019 - Se adiciona condici�n
			if (SFINANCI != null && (CMODO.equals(new BigDecimal("1")) || CMODO.equals(new BigDecimal("2")))) {
				m_buscar(request, thisAction);
			}
			// FIN TCS_11;IAXIS-2119 - JLTS - 10/03/2019

		} catch (Exception e) {
			logger.error("Error en el m�todo Axisfic002Service.m_form", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		// SE REESTABLECE EL MODO EN EL QUE SE INGRESA AL M�DULO DE PERSONAS EN EL
		// request EN EL formdata SE DEJA PARA EL FUNCIONAMIENTO DEL MODAL AXISFIC002
		AbstractDispatchAction.topPila(request, "CMODO", modoAct);// IAXIS-4854
	}

	/**
	 * M�todo que busca la informacion general
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_buscar(HttpServletRequest request, Axisfic002Action thisAction) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		logger.debug("Axisfic002Service m_buscar");

		try {

			BigDecimal SPERSON = getCampoNumerico(request, "SPERSON");

			if (SPERSON == null) {
				try {
					SPERSON = new BigDecimal(String.valueOf(request.getParameter("SPERSON")));
				} catch (Exception ex) {
					SPERSON = null;
				}
			}
			// INI TCS_11;IAXIS-2119 - JLTS - 10/03/2019 - Se adicionan campos NMOVIMI,
			// FRUT, FCCOMER
			BigDecimal NMOVIMI = getCampoNumerico(request, "NMOVIMI");

			if (NMOVIMI == null) {
				try {
					NMOVIMI = new BigDecimal(String.valueOf(request.getParameter("NMOVIMI")));
				} catch (Exception ex) {
					NMOVIMI = null;
				}
			}
			Date FRUT = stringToSqlDate(request.getParameter("FRUT"));
			if (FRUT == null) {
				try {
					FRUT = stringToSqlDate(String.valueOf(request.getParameter("FRUT")));
				} catch (Exception ex) {
					FRUT = null;
				}
			}
			Date FCCOMER = stringToSqlDate(request.getParameter("FCCOMER"));
			if (FCCOMER == null) {
				try {
					FCCOMER = stringToSqlDate(String.valueOf(request.getParameter("FCCOMER")));
				} catch (Exception ex) {
					FCCOMER = null;
				}
			}

			// FIN TCS_11;IAXIS-2119 - JLTS - 10/03/2019

			BigDecimal SFINANCI = getCampoNumerico(request, "SFINANCI");

			if (SFINANCI == null) {
				try {
					SFINANCI = new BigDecimal(String.valueOf(request.getParameter("SFINANCI")));
				} catch (Exception ex) {
					SFINANCI = null;
				}
			}

			PAC_IAX_FINANCIERA pac_axis_financiera = new PAC_IAX_FINANCIERA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map map = null;
			List<Map> lstGeneral = null;
			if (SPERSON != null) {
				// INI TCS_11;IAXIS-2119 - JLTS - 10/03/2019 - Se ajusta la funcion y sus
				// par�metros
				map = pac_axis_financiera.ejecutaPAC_IAX_FINANCIERA__F_GET_GENERAL_PERSONA_DET(SPERSON, NMOVIMI);
				// FIN TCS_11;IAXIS-2119 - JLTS - 10/03/2019
				lstGeneral = (List<Map>) tratarRETURNyMENSAJES(request, map);
			}
			logger.debug(map);

			if (!isEmpty(map) && lstGeneral != null) {
				formdata.put("lstGeneral", lstGeneral);
				for (Map iLstGeneral : lstGeneral) {
					if (SPERSON.equals(iLstGeneral.get("SPERSON"))) {
						formdata.putAll(iLstGeneral);
					}
				}
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisfic002Service - m�todo m_buscar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
	}

	/**
	 * M�todo que almacena la informacion general
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_aceptar(HttpServletRequest request, Axisfic002Action thisAction) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		logger.debug("Axisfic002Service m_aceptar");

		try {

			BigDecimal SFINANCI = getCampoNumerico(request, "SFINANCI");
			if (SFINANCI == null) {
				try {
					SFINANCI = new BigDecimal(String.valueOf(request.getParameter("SFINANCI")));
				} catch (Exception ex) {
					SFINANCI = null;
				}
			}
			// INI TCS_11;IAXIS-2119 - JLTS - 10/03/2019 - Se adiciona el campo NMOVIMI
			BigDecimal NMOVIMI = getCampoNumerico(request, "NMOVIMI");
			if (NMOVIMI == null) {
				try {
					NMOVIMI = new BigDecimal(String.valueOf(request.getParameter("NMOVIMI")));
				} catch (Exception ex) {
					NMOVIMI = null;
				}
			}
			// FIN TCS_11;IAXIS-2119 - JLTS - 10/03/2019

			String CMODO = getCampoTextual(request, "CMODO");
			if (CMODO == null) {
				try {
					CMODO = "CMODOF";
				} catch (Exception ex) {
					CMODO = null;
				}
			}

			String TDESCRIP = getCampoTextual(request, "TDESCRIP");
			Date FCCOMER = stringToSqlDate(getCampoTextual(request, "FCCOMER"));
			BigDecimal CFOTORUT = getCampoNumerico(request, "CFOTORUT");
			Date FRUT = stringToSqlDate(getCampoTextual(request, "FRUT"));
			String TTITULO = getCampoTextual(request, "TTITULO");
			BigDecimal CFOTOCED = getCampoNumerico(request, "CFOTOCED");
			Date FEXPICED = stringToSqlDate(getCampoTextual(request, "FEXPICED"));
			BigDecimal CPAIS = getCampoNumerico(request, "CPAIS");
			BigDecimal CPROVIN = getCampoNumerico(request, "CPROVIN");
			BigDecimal CPOBLAC = getCampoNumerico(request, "CPOBLAC");
			String TINFOAD = getCampoTextual(request, "TINFOAD");
			BigDecimal CCIIU = getCampoNumerico(request, "CCIIU");
			BigDecimal CTIPSOCI = getCampoNumerico(request, "CTIPSOCI");
			BigDecimal CESTSOC = getCampoNumerico(request, "CESTSOC");
			String TOBJSOC = getCampoTextual(request, "TOBJSOC");
			String TEXPERI = getCampoTextual(request, "TEXPERI");
			Date FCONSTI = stringToSqlDate(getCampoTextual(request, "FCONSTI"));
			String TVIGENC = getCampoTextual(request, "TVIGENC");

			PAC_IAX_FINANCIERA pac_axis_financiera = new PAC_IAX_FINANCIERA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			// INI TCS_11;IAXIS-2119 - JLTS - 10/03/2019 - Se ajusta la funcion y sus
			// par�metros
			Map map = pac_axis_financiera.ejecutaPAC_IAX_FINANCIERA__F_GRABAR_GENERAL_DET(SFINANCI, NMOVIMI, CMODO,
					TDESCRIP, FCCOMER, CFOTORUT, FRUT, TTITULO, CFOTOCED, FEXPICED, CPAIS, CPROVIN, CPOBLAC, TINFOAD,
					CCIIU, CTIPSOCI, CESTSOC, TOBJSOC, TEXPERI, FCONSTI, TVIGENC);
			// INI TCS_11;IAXIS-2119 - JLTS - 10/03/2019
			logger.debug(map);
			String mensaje = "";

			request.setAttribute("resultado", (BigDecimal) tratarRETURNyMENSAJES(request, map));
			// INI TCS_11;IAXIS-2119 - JLTS - 10/03/2019 - Se verifica el error al aceptar
			if ((BigDecimal) tratarRETURNyMENSAJES(request, map) == (new BigDecimal(0))) {
				m_buscar(request, thisAction);
			} else {
				List<Map> lstMapParam = (List<Map>) map.get("MENSAJES");
				if (!isEmpty(lstMapParam)) {
					for (Map parpersona : lstMapParam) {
						Map pp = (Map) parpersona.get("OB_IAX_MENSAJES");
						mensaje = pp.get("TERROR").toString();
						logger.debug(pp.get("TERROR"));
					}
				}

				request.getSession().setAttribute("ERRACEPTAR", mensaje);

				formdata.put("ERRACEPTAR", mensaje);
				this.m_form(request, thisAction);
			}
			// FIN TCS_11;IAXIS-2119 - JLTS - 10/03/2019

		} catch (Exception e) {
			logger.error("Error en el servicio Axisfic002Service - m�todo m_aceptar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
	}

	/**
	 * Realiza una carga de BD de los valores est�ticos que contiene cada
	 * desplegable de la pantalla.
	 * 
	 * @param request  El HttpServletRequest que contiene la petici�n del cliente
	 *                 web.
	 * @param usuario  El UsuarioBean activo.
	 * @param formdata HashMap que contiene los valores de los request parameters.
	 * @throws Exception
	 */

	private void cargarValoresDesplegables(HttpServletRequest request, UsuarioBean usuario, Map formdata)
			throws Exception {
		// Carga de valores de los desplegables
		Map listValores = new HashMap();
		try {
			PAC_IAX_LISTVALORES pac_axis_listValores = new PAC_IAX_LISTVALORES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			PAC_IAX_PARAM pac_axis_param = new PAC_IAX_PARAM(
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

			// Lista tipo de tarjetas
			// map = pac_axis_persona.ejecutaPAC_IAX_PERSONA__F_GET_TIPCCC(new
			// BigDecimal("2"));
			// logger.debug(map);
			// listValores.put("tipCCC", (List) tratarRETURNyMENSAJES(request, map));

			// Lista tipo de cuentas
			// map = pac_axis_persona.ejecutaPAC_IAX_PERSONA__F_GET_TIPCCC(new
			// BigDecimal("1"));
			// logger.debug(map);
			// listValores.put("tipTARJETA", (List) tratarRETURNyMENSAJES(request, map));

			// Lista tipo direcciones
			map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTTIPODIRECCION();
			logger.debug(map);
			listValores.put("lstTipoDireccion", (List) tratarRETURNyMENSAJES(request, map));

			// Lista tipo v�as
			map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTTIPOVIA();
			logger.debug(map);
			listValores.put("lstTipoVia", (List) tratarRETURNyMENSAJES(request, map));

			// Lista Si/No
			map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTSINO();
			logger.debug(map);
			listValores.put("lstSiNo", (List) tratarRETURNyMENSAJES(request, map));

			// Lista Numero C.I.I.U.
			map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(8001072));
			logger.debug(map);
			listValores.put("lstCIIU", (List) tratarRETURNyMENSAJES(request, map));

			// Lista Tipo Sociedad
			map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(8001073));
			logger.debug(map);
			listValores.put("lstTipoSociedad", (List) tratarRETURNyMENSAJES(request, map));

			// Lista Estado Sociedad
			map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(8001074));
			logger.debug(map);
			listValores.put("lstEstadoSociedad", (List) tratarRETURNyMENSAJES(request, map));

			// Lista pa�ses
			map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTPAISES();
			logger.debug(map);
			listValores.put("lstPaises", (List) tratarRETURNyMENSAJES(request, map, false));

			map = pac_axis_param.ejecutaPAC_IAX_PARAM__F_PAREMPRESA_N("SIN_PROVINCIAS", usuario.getCempres());
			BigDecimal sin_provincias = (BigDecimal) tratarRETURNyMENSAJES(request, map);
			formdata.put("sin_provincias", sin_provincias);

			// Lista tipo direcciones
			map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTTIPODIRECCION();
			logger.debug(map);
			listValores.put("lstTipoDireccion", (List) tratarRETURNyMENSAJES(request, map));

			// Lista tipo v�as
			map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTTIPOVIA();
			logger.debug(map);
			listValores.put("lstTipoVia", (List) tratarRETURNyMENSAJES(request, map));

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

			logger.debug("   0- $$$$$$$$$$$$$$$$$$$$  ");

			// Cod. Orientaci�n predio
			map = pac_axis_param.ejecutaPAC_IAX_PARAM__F_PAREMPRESA_N("PER_BISLETRA", usuario.getCempres());
			logger.debug(map);
			BigDecimal valor = (BigDecimal) tratarRETURNyMENSAJES(request, map);
			logger.debug("   1- $$$$$$$$$$$$$$$$$$$$  " + valor);

			if (valor == null)
				valor = new BigDecimal(800046);
			logger.debug("   2- $$$$$$$$$$$$$$$$$$$$  " + valor);

			map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(valor);
			logger.debug("   3- $$$$$$$$$$$$$$$$$$$$  " + valor);
			logger.debug(map);
			listValores.put("lstCORCO", (List) tratarRETURNyMENSAJES(request, map));
			logger.debug("   4- $$$$$$$$$$$$$$$$$$$$  " + listValores.get("lstCORCO"));

			// Cod. Orientaci�n predio
			map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(800046));
			logger.debug(map);
			listValores.put("lstCOR2CO", (List) tratarRETURNyMENSAJES(request, map));

			// Detalle predio
			map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(800047));
			logger.debug(map);
			listValores.put("lstCDET", (List) tratarRETURNyMENSAJES(request, map));

		} catch (Exception e) {
			logger.error("Error en el m�todo Axisfic002Service.cargarValoresDesplegables", e);
			AbstractDispatchAction.guardarMensaje(request, "1000050", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		} finally {
			formdata.put("listValores", listValores);
		}
	}

	/*********************************************************************************************************************/
	/************************************************
	 * M�TODOS DE ACTUALIZACI�N
	 *******************************************/
	/*********************************************************************************************************************/

	/**
	 * M�todo para grabar la direcci�n de la persona.
	 * 
	 * @param request    El HttpServletRequest que contiene la petici�n del cliente
	 *                   web.
	 * @param thisAction Una Action abstracta desde donde se ha invocado el servicio
	 *                   (necesaria para el log).
	 * @throws Exception
	 */
	public void m_grabarDireccion(HttpServletRequest request, AbstractDispatchAction thisAction) {
		logger.debug("Axisfic002Service m_grabarDireccionPersona");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {
			PAC_IAX_PERSONA pac_axis_persona = new PAC_IAX_PERSONA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			HashMap m = this.f_Get_Avisos(request, this.whoami(this));
			BigDecimal pRETURN = (BigDecimal) this.tratarRETURNyMENSAJES(request, m);
			request.setAttribute("PLSTAVISOS", m.get("PLSTAVISOS"));

			if (pRETURN != null && pRETURN.intValue() != 1) {
				BigDecimal SPERSON = getCampoNumerico(request, "SPERSON");
				BigDecimal CEMPRES = null; // null siempre
				// BigDecimal CAGENTE = usuario.getCagente();
				BigDecimal CAGENTE = getCampoNumerico(request, "CAGENTE");
				BigDecimal CDOMICI = getCampoNumerico(request, "CDOMICI");
				BigDecimal CTIPDIR = getCampoNumerico(request, "CTIPDIR");
				BigDecimal CSIGLAS = getCampoNumerico(request, "CSIGLAS");
				String TNOMVIA = getCampoTextual(request, "TNOMVIA");
				BigDecimal NNUMVIA = getCampoNumerico(request, "NNUMVIA");
				String TCOMPLE = getCampoTextual(request, "TCOMPLE");
				String CPOSTAL = getCampoTextual(request, "CPOSTAL");
				if (!isEmpty(CPOSTAL))
					CPOSTAL = CPOSTAL.toUpperCase();
				BigDecimal CPOBLAC = getCampoNumerico(request, "CPOBLAC");
				BigDecimal CPROVIN = getCampoNumerico(request, "CPROVIN");
				BigDecimal CPAIS = getCampoNumerico(request, "CPAIS");

				// Bug 18940/92686 - 29/09/2011 - AMC
				BigDecimal CVIAVP = getCampoNumerico(request, "CVIAVP");
				// String TNOMVIACOL = getCampoTextual(request, "TNOMVIACOL");
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

				/*
				 * String TNOMV; if(isEmpty(TNOMVIACOL)) TNOMV = TNOMVIA; else TNOMV =
				 * TNOMVIACOL;
				 */
				String LOCALIDAD = getCampoTextual(request, "LOCALIDAD");
				String TALIAS = getCampoTextual(request, "TALIAS"); // BUG CONF-441 - 14/12/2016 - JAEG

				Map map = pac_axis_persona.ejecutaPAC_IAX_PERSONA__F_SET_DIRECCION(SPERSON, CAGENTE, CDOMICI, CTIPDIR,
						CSIGLAS, TNOMVIA, NNUMVIA, TCOMPLE, CPOSTAL, CPOBLAC, CPROVIN, CPAIS, CVIAVP, CLITVP, CBISVP,
						CORVP, NVIAADCO, CLITCO, CORCO, NPLACACO, COR2CO, CDET1IA, TNUM1IA, CDET2IA, TNUM2IA, CDET3IA,
						TNUM3IA, LOCALIDAD, TALIAS); // BUG CONF-441 - 14/12/2016 - JAEG

				logger.debug(map);
				if (!isEmpty(map) && !isEmpty(map.get("PCDOMICIOUT")))
					formdata.put("CDOMICI", map.get("PCDOMICIOUT").toString());

				request.setAttribute("grabarOK", (BigDecimal) tratarRETURNyMENSAJES(request, map));
			}
		} catch (Exception e) {
			logger.error("Error en el m�todo Axisfic002Service.m_grabarDireccionPersona", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	/**
	 * @param request El HttpServletRequest que contiene la petici�n del cliente
	 *                web.
	 * @throws Exception
	 */

	public void m_ajax_getProvinPobla(HttpServletRequest request) {
		logger.debug("Axisfic002Service m_ajax_getProvinPobla");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {
			PAC_IAX_PERSONA pac_axis_persona = new PAC_IAX_PERSONA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			String CPOSTAL = getCampoTextual(request, "CPOSTAL");

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
			logger.error("Error en el servicio Axisfic002Service - m�todo m_ajax_getProvinPobla", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	public void m_ajax_direccion(HttpServletRequest request, Axisfic002Action thisAction) {
		logger.debug("Axisfic002Service m_ajax_direccion");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {
			String op = this.getCampoTextual(request, "op");
			BigDecimal CPAIS = this.getCampoNumerico(request, "CPAIS");
			BigDecimal CPOBLAC = this.getCampoNumerico(request, "CPOBLAC");
			BigDecimal CPROVIN = this.getCampoNumerico(request, "CPROVIN");

			PAC_IAX_DESCVALORES pac_axis_persona = new PAC_IAX_DESCVALORES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			if (!isEmpty(op) && op.equalsIgnoreCase("CPAIS")) {

				Map map = pac_axis_persona.ejecutaPAC_IAX_DESCVALORES__F_GET_DESCPAIS(CPAIS);
				logger.debug(map);
				ajax.rellenarPlAContenedorAjax(map);
				if (!isEmpty(map) && !isEmpty(map.get("RETURN")) && !"**".equals((String) map.get("RETURN"))) {
					Map pais = new HashMap();
					pais.put("CPAIS", CPAIS);
					pais.put("TPAIS", map.get("RETURN"));
					formdata.put("CPAIS", CPAIS);
					formdata.put("TPAIS", map.get("RETURN"));
					ajax.guardarContenidoFinalAContenedorAjax(pais);
				} else if ("**".equals((String) map.get("RETURN"))) {
					Map pais = new HashMap();
					pais.put("CPAIS", CPAIS);
					formdata.put("CPROVIN", CPROVIN);
					pais.put(Constantes.OPERACION_AJAX_ERROR, Constantes.OPERACION_AJAX_ERROR);
					ajax.guardarContenidoFinalAContenedorAjax(pais);
				}
			} else if (!isEmpty(op) && op.equalsIgnoreCase("CPROVIN")) {
				Map map = pac_axis_persona.ejecutaPAC_IAX_DESCVALORES__F_GET_DESCPROVINCIA(CPROVIN, CPAIS);
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
			} else {
				ajax.guardarContenidoFinalAContenedorAjax(Constantes.OPERACION_AJAX_ERROR);
			}
		} catch (Exception e) {
			logger.error("Error en el servicio Axisfic002Service - m�todo m_ajax_direccion", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	public void m_ajax_ciiu(HttpServletRequest request, Axisfic002Action thisAction) {
		logger.debug("Axisfic002Service m_ajax_ciiu");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {
			BigDecimal CIIU = this.getCampoNumerico(request, "CIIU");

			PAC_IAX_DESCVALORES pac_axis_persona = new PAC_IAX_DESCVALORES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			if (!isEmpty(CIIU)) {

				Map map = pac_axis_persona.ejecutaPAC_IAX_DESCVALORES__F_GET_CIIU(CIIU);
				logger.debug(map);
				ajax.rellenarPlAContenedorAjax(map);
				if (!isEmpty(map) && !isEmpty(map.get("RETURN")) && !"**".equals((String) map.get("RETURN"))) {
					Map ciiu = new HashMap();
					ciiu.put("CIIU", CIIU);
					ciiu.put("TCIIU", map.get("RETURN"));
					formdata.put("CPAIS", CIIU);
					formdata.put("TCIIU", map.get("RETURN"));
					ajax.guardarContenidoFinalAContenedorAjax(ciiu);
				}
			} else {
				ajax.guardarContenidoFinalAContenedorAjax(Constantes.OPERACION_AJAX_ERROR);
			}
		} catch (Exception e) {
			logger.error("Error en el servicio Axisfic002Service - m�todo m_ajax_ciiu", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
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

	private void cargarPersona(HttpServletRequest request, Axisper009Action thisAction, UsuarioBean usuario,
			Map formdata) throws Exception {
		Map OBPERSONA = new HashMap();

		try {

			BigDecimal SPERSON = null;

			SPERSON = getCampoNumerico(request, "SPERSON");

			logger.debug("SPERSON ----> " + SPERSON);
			logger.debug("-------->request.getParameter(SPERSON_AUX)" + request.getParameter("SPERSON_AUX"));

			BigDecimal SPERSON_AUX = null;
			if (!isEmpty(request.getParameter("SPERSON_AUX")))
				SPERSON = new BigDecimal(String.valueOf(request.getParameter("SPERSON_AUX")));

			logger.debug("SPERSON_AUX ----> " + SPERSON_AUX);

			if (isEmpty(SPERSON) && !isEmpty(request.getParameter("SPERSON")))
				SPERSON = new BigDecimal(String.valueOf(request.getParameter("SPERSON")));

			BigDecimal CEMPRES = null; // null siempre

			BigDecimal CAGENTE = isEmpty(getCampoNumerico(request, "CAGENTEselected"))
					? getCampoNumerico(request, "CAGENTE")
					: getCampoNumerico(request, "CAGENTEselected"); // null siempre
			logger.debug("CAGENTE ----> " + CAGENTE);

			if (isEmpty(CAGENTE) && !isEmpty(request.getParameter("CAGENTE")))
				CAGENTE = new BigDecimal(String.valueOf(request.getParameter("CAGENTE")));

			logger.debug("CAGENTE2 ----> " + CAGENTE);

			if (!isEmpty(request.getParameter("canviagent")) || isEmpty(formdata.get("CAGENTE"))
					|| !isEmpty(getCampoNumerico(request, "CAGENTEselected")))
				formdata.put("CAGENTE", CAGENTE);

			if (!isEmpty(this.getCampoTextual(request, "ALTA_PERSONA_INI"))) {
				formdata.put("CAGENTE_INI", usuario.getCagente());
			}

			String DONDE = request.getParameter("DONDE");
			if (!isEmpty(DONDE)) {
				if (DONDE.equals("AXISCTR020")) {
					formdata.put("CAGENTE", usuario.getCagente());
					CAGENTE = usuario.getCagente();
				}
			}

			logger.debug("OBPERSONA.put");

			BigDecimal CAGENTE_VISIO = null;

			OBPERSONA.put("isNew", Boolean.valueOf(true));
			PAC_IAX_PERSONA pac_axis_persona = new PAC_IAX_PERSONA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			PAC_IAX_GESTION_REC pac_axis_gestion_rec = new PAC_IAX_GESTION_REC(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			/* Estado persona */
			if (!isEmpty(SPERSON)) {
				OBPERSONA.put("isNew", Boolean.valueOf(false));
				if (isEmpty(request.getAttribute("agents_visio"))) {
					Map mapAg = pac_axis_persona.ejecutaPAC_IAX_PERSONA__F_GET_AGENTES_VISION(SPERSON);
					logger.debug(mapAg);
					request.setAttribute("agents_visio", tratarRETURNyMENSAJES(request, mapAg));

					if (!isEmpty(tratarRETURNyMENSAJES(request, mapAg))) {
						List retornAgentesVision = (List) tratarRETURNyMENSAJES(request, mapAg);
						if (retornAgentesVision.size() > 0) {
							HashMap inicialitzaPersona = (HashMap) retornAgentesVision.get(0);
							CAGENTE_VISIO = new BigDecimal(String.valueOf(inicialitzaPersona.get("CAGENTE")));
							// formdata.put("CAGENTE",inicialitzaPersona.get("CAGENTE"));
						}
					}
					logger.debug("CAGENTE:" + CAGENTE + " - CAGENTE_VISIO:" + CAGENTE_VISIO);

					if (!isEmpty(tratarRETURNyMENSAJES(request, mapAg)) && (isEmpty(CAGENTE))) {
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
					// INI.AAC--
					String nombreCompleto = "";
					if (OBPERSONA.get("TNOMBRE") != null && !"".equals(OBPERSONA.get("TNOMBRE")))
						nombreCompleto = nombreCompleto + ((String) OBPERSONA.get("TNOMBRE")).trim() + " ";
					if (OBPERSONA.get("TAPELLI1") != null && !"".equals(OBPERSONA.get("TAPELLI1")))
						nombreCompleto = nombreCompleto + ((String) OBPERSONA.get("TAPELLI1")).trim() + " ";
					if (OBPERSONA.get("TAPELLI2") != null && !"".equals(OBPERSONA.get("TAPELLI2")))
						nombreCompleto = nombreCompleto + ((String) OBPERSONA.get("TAPELLI2")).trim();
					OBPERSONA.put("TNOMBRECOMPL", nombreCompleto);
					// FIN.AAC
					request.setAttribute("dades_persona", (Map) map.get("OBPERSONA"));

					if (!isEmpty(OBPERSONA)) {
						BigDecimal CTIPPER = (BigDecimal) OBPERSONA.get("CTIPPER");
						if (new BigDecimal(2).equals(CTIPPER)) {
							OBPERSONA.put("TNOMBRE", OBPERSONA.get("TSIGLAS"));
						}
						// INI IAXIS-4143 -JLTS - 22/01/2020 - Se adiciona CTIPPER
						formdata.put("CTIPPER", CTIPPER);
						// FIN IAXIS-4143 -JLTS - 22/01/2020 - Se adiciona CTIPPER
						List tipPersona = (List) ((Map) formdata.get("listValores")).get("tipPerson");
						for (int i = 0; i < tipPersona.size(); i++) {
							Map mapTP = (Map) tipPersona.get(i);
							if (((BigDecimal) mapTP.get("CATRIBU")).equals(CTIPPER))
								OBPERSONA.put("DESCIDENT", mapTP.get("TATRIBU"));
						}

						BigDecimal CIDIOMA = (BigDecimal) OBPERSONA.get("CIDIOMA");

						List lstIdiomas = (List) ((Map) formdata.get("listValores")).get("lstIdiomas");
						for (int i = 0; i < lstIdiomas.size(); i++) {
							Map mapLI = (Map) lstIdiomas.get(i);
							if (((BigDecimal) mapLI.get("CIDIOMA")).equals(CIDIOMA))
								OBPERSONA.put("TIDIOMA", mapLI.get("TIDIOMA"));
						}

						String NNUMIDE = (String) OBPERSONA.get("NNUMIDE");
						formdata.put("TIPOSOC", this.m_getDescTipSoc(request, thisAction, NNUMIDE));

						Map listValores = (Map) formdata.get("listValores");
						List lstNanos = new ArrayList();
						logger.debug(request.getParameterMap());
						BigDecimal NANO_CHANGE = this.getCampoNumerico(request, "NANO_CHANGE");

						logger.debug(request.getParameter("NANO_CHANGE"));

						if (!isEmpty(OBPERSONA.get("IRPF"))) {
							List<Map> lstIrpfs = (List) OBPERSONA.get("IRPF");
							// Collections.sort(lstIrpfs);
							for (Map irpf : lstIrpfs) {
								Map OB_IAX_IRPF = (Map) irpf.get("OB_IAX_IRPF");
								Map nano = new HashMap();
								nano.put("NANO", OB_IAX_IRPF.get("NANO"));
								lstNanos.add(nano);

								if (isEmpty(NANO_CHANGE) && !isEmpty(formdata.get("NANO"))
										&& !isEmpty(OB_IAX_IRPF.get("NANO"))) {
									BigDecimal formNANO = new BigDecimal(String.valueOf(formdata.get("NANO")));
									BigDecimal IRPFNANO = new BigDecimal(String.valueOf(OB_IAX_IRPF.get("NANO")));
									formdata.put("NANO",
											new BigDecimal(Math.max(formNANO.intValue(), IRPFNANO.intValue())));
								} else
									formdata.put("NANO", isEmpty(NANO_CHANGE) ? OB_IAX_IRPF.get("NANO") : NANO_CHANGE);

							}

							OBPERSONA.put("OB_IAX_IRPF", this.getOB_IAX_IRPF((List) OBPERSONA.get("IRPF"),
									(BigDecimal) formdata.get("NANO")));

						}

						listValores.put("lstNanos", lstNanos);
						for (int i = 0; i < lstIdiomas.size(); i++) {
							Map mapLI = (Map) lstIdiomas.get(i);
							if (((BigDecimal) mapLI.get("CIDIOMA")).equals(CIDIOMA))
								OBPERSONA.put("TIDIOMA", mapLI.get("TIDIOMA"));
						}
						/*
						 * Ini IAXIS-15800 --JLTS - 25/06/2021. Se comentariza por Performance y falta
						 * de uso map =
						 * pac_axis_gestion_rec.ejecutaPAC_IAX_GESTION_REC__F_GET_REBTOM(SPERSON);
						 * logger.debug(map); if (((BigDecimal)tratarRETURNyMENSAJES(request,
						 * map,false)).intValue() == 0){ formdata.put("IPAGADO",map.get("PIPAGADO"));
						 * formdata.put("IPENDIENTE",map.get("PIPENDIENTE"));
						 * formdata.put("IMPAGADO",map.get("PIMPAGADO"));
						 * formdata.put("PISALDO",map.get("PISALDO")); OBPERSONA.put("RECTOM",
						 * map.get("PRECIBOS")); } Fin IAXIS-15800 --JLTS - 25/06/2021.
						 */
						map = pac_axis_persona.ejecutaPAC_IAX_PERSONA__F_GET_CONDUCTORES(SPERSON);
						logger.debug(map);
						OBPERSONA.put("CONDUCTORES", (List) tratarRETURNyMENSAJES(request, map, false));

						map = pac_axis_persona.ejecutaPAC_IAX_PERSONA__F_GET_ANTIGUEDAD(SPERSON);
						logger.debug(map);
						OBPERSONA.put("ANTIGUEDAD", (List) tratarRETURNyMENSAJES(request, map, false));

						map = pac_axis_persona.ejecutaPAC_IAX_PERSONA__F_GET_POLTOM(SPERSON);
						logger.debug(map);
						OBPERSONA.put("POLTOM", (List) tratarRETURNyMENSAJES(request, map, false));

						map = pac_axis_persona.ejecutaPAC_IAX_PERSONA__F_GET_POLASE(SPERSON);
						logger.debug(map);
						OBPERSONA.put("POLASE", (List) tratarRETURNyMENSAJES(request, map, false));

						map = pac_axis_persona.ejecutaPAC_IAX_PERSONA__F_GET_PROFESIONALES(SPERSON);
						logger.debug(map);
						OBPERSONA.put("PERPRO", (List) tratarRETURNyMENSAJES(request, map, false));

						map = pac_axis_persona.ejecutaPAC_IAX_PERSONA__F_GET_INQUIAVAL(SPERSON, new BigDecimal(1));
						tratarRETURNyMENSAJES(request, map, false);
						logger.debug(map);
						OBPERSONA.put("PINQUIL", (List) map.get("PCUR"));

						map = pac_axis_persona.ejecutaPAC_IAX_PERSONA__F_GET_INQUIAVAL(SPERSON, new BigDecimal(2));
						tratarRETURNyMENSAJES(request, map, false);
						logger.debug(map);
						OBPERSONA.put("PAVALIST", (List) map.get("PCUR"));

						map = pac_axis_persona.ejecutaPAC_IAX_PERSONA__F_GET_GESCOBRO(SPERSON);
						tratarRETURNyMENSAJES(request, map, false);
						logger.debug(map);
						OBPERSONA.put("PGESCOBRO", (List) map.get("PCUR"));

						map = pac_axis_persona.ejecutaPAC_IAX_PERSONA__F_GET_COMPANIAS(SPERSON);
						logger.debug(map);
						OBPERSONA.put("PERCIA", (List) tratarRETURNyMENSAJES(request, map, false));

						map = pac_axis_persona.ejecutaPAC_IAX_PERSONA__F_GET_AGENTES(SPERSON);
						logger.debug(map);
						OBPERSONA.put("PERAGE", (List) tratarRETURNyMENSAJES(request, map, false));

						BigDecimal CDOMICI = (BigDecimal) OBPERSONA.get("CDOMICI");

						if (!isEmpty(CDOMICI)) {
							map = pac_axis_persona.ejecutaPAC_IAX_PERSONA__F_GET_DIRECCION(SPERSON, CDOMICI);
							logger.debug(map);
							tratarRETURNyMENSAJES(request, map);
							if (!isEmpty(map)) {
								OBPERSONA.put("DIRECCIONES", (String) map.get("PDIRECCIONES"));

							}
						}

						map = pac_axis_persona.ejecutaPAC_IAX_PERSONA__F_GET_SINIESTROS(SPERSON);
						logger.debug(map);
						OBPERSONA.put("POLSIN", (List) tratarRETURNyMENSAJES(request, map, false));

						map = pac_axis_persona.ejecutaPAC_IAX_PERSONA__F_GET_PARPERSONA(SPERSON, CAGENTE,
								new BigDecimal(1), new BigDecimal(0));
						logger.debug(map);
						OBPERSONA.put("PARPER", (List) tratarRETURNyMENSAJES(request, map, false));

						/* ******************** Nuevas Listas ************************* */
						map = pac_axis_persona.ejecutaPAC_IAX_PERSONA__F_GET_GESTORES_EMPLEADOS(SPERSON);
						tratarRETURNyMENSAJES(request, map, false);
						logger.debug(map);
						OBPERSONA.put("SPONSOR", (List) map.get("PCUR"));

						map = pac_axis_persona.ejecutaPAC_IAX_PERSONA__F_GET_GESTORES_EMPLEADOS(SPERSON);
						tratarRETURNyMENSAJES(request, map, false);
						logger.debug(map);
						OBPERSONA.put("GESTORES", (List) map.get("PCUR"));

						map = pac_axis_persona.ejecutaPAC_IAX_PERSONA__F_GET_REPRESENT_PROMOTORES(SPERSON);
						tratarRETURNyMENSAJES(request, map, false);
						logger.debug(map);
						OBPERSONA.put("REPRESENTANTES", (List) map.get("PCUR"));

						map = pac_axis_persona.ejecutaPAC_IAX_PERSONA__F_GET_COORDINADORES(SPERSON);
						tratarRETURNyMENSAJES(request, map, false);
						logger.debug(map);
						OBPERSONA.put("COORDINADORES", (List) map.get("PCUR"));

						map = pac_axis_persona.ejecutaPAC_IAX_PERSONA__F_GET_LISTAS_OFICIALES(SPERSON,
								new BigDecimal("1")); // EXTERNA
						tratarRETURNyMENSAJES(request, map, false);
						logger.debug(map);
						OBPERSONA.put("LISTASOFIEXT", (List) map.get("PCUR"));

						map = pac_axis_persona.ejecutaPAC_IAX_PERSONA__F_GET_LISTAS_OFICIALES(SPERSON,
								new BigDecimal("2")); // INTERNA
						tratarRETURNyMENSAJES(request, map, false);
						logger.debug(map);
						OBPERSONA.put("LISTASOFIINT", (List) map.get("PCUR"));

						/* Formatear todas las cuentas corrientes de la persona */
						List<Map> listCCC = (List<Map>) OBPERSONA.get("CCC");
						if (!isEmpty(listCCC)) {
							PAC_IAX_COMMON pacIaxCommon = new PAC_IAX_COMMON(
									(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
							for (Map cuenta : listCCC) {
								Map OB_IAX_CCC = (Map) cuenta.get("OB_IAX_CCC");
								if (!isEmpty(OB_IAX_CCC)) {
									String CBANCAR = (String) OB_IAX_CCC.get("CBANCAR");
									BigDecimal CTIPBAN = (BigDecimal) OB_IAX_CCC.get("CTIPBAN");
									if (!isEmpty(CBANCAR) && !isEmpty(CTIPBAN)) {
										map = pacIaxCommon.ejecutaPAC_IAX_COMMON__F_FORMATCCC(CTIPBAN, CBANCAR);
										OB_IAX_CCC.put("CBANCAR", tratarRETURNyMENSAJES(request, map));
									}
								}
							}
						}

						/* Formatear todas las tarjetas de credito de la persona */
						List<Map> listTARJETA = (List<Map>) OBPERSONA.get("TARJETAS");
						if (!isEmpty(listTARJETA)) {
							PAC_IAX_COMMON pacIaxCommon = new PAC_IAX_COMMON(
									(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
							for (Map tarjeta : listTARJETA) {
								Map OB_IAX_TARJETA = (Map) tarjeta.get("OB_IAX_CCC");
								if (!isEmpty(OB_IAX_TARJETA)) {
									String CBANCAR = (String) OB_IAX_TARJETA.get("CBANCAR");
									BigDecimal CTIPBAN = (BigDecimal) OB_IAX_TARJETA.get("CTIPBAN");
									if (!isEmpty(CBANCAR) && !isEmpty(CTIPBAN)) {
										map = pacIaxCommon.ejecutaPAC_IAX_COMMON__F_FORMATCCC(CTIPBAN, CBANCAR);
										OB_IAX_TARJETA.put("CBANCAR", tratarRETURNyMENSAJES(request, map));
									}
								}
							}
						}

						OBPERSONA.put("LISTADOCPERSONA", (List) OBPERSONA.get("DATOS_DOCUMENTACION"));

						map = pac_axis_persona.ejecutaPAC_IAX_PERSONA__F_GET_AUTORIZACIONES(SPERSON, CAGENTE);
						tratarRETURNyMENSAJES(request, map, false);
						logger.debug(map);
						OBPERSONA.put("AUTORIZACIONES", tratarRETURNyMENSAJES(request, map));

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

	public String m_getDescTipSoc(HttpServletRequest request, Axisper009Action thisAction, String NNUMIDE) {
		logger.debug("Axisper009Service m_getDescTipSoc");

		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {
			PAC_IAX_DESCVALORES pac_axis_descValores = new PAC_IAX_DESCVALORES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			// String NNUMIDE=getCampoTextual(request, "NNUMIDE");
			// NNUMIDE = new String(String.valueOf(request.getParameter("NNUMIDE")));
			// OBPERSONA = (Map) map.get("OBPERSONA");
			// request.setAttribute("dades_persona",(Map) map.get("OBPERSONA"));

			// String NNUMIDE = (String) OBPERSONA.get("NNUMIDE");

			if (!isEmpty(NNUMIDE)) {
				NNUMIDE = NNUMIDE.toUpperCase();
				Map map = pac_axis_descValores.ejecutaPAC_IAX_DESCVALORES__F_GET_DESCSOCIEDAD(NNUMIDE);
				return (String) this.tratarRETURNyMENSAJES(request, map);

			}
			return "";
		}

		catch (Exception e) {
			logger.error("Error en el m�todo Axisper009Service.m_getDescTipSoc", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
			return "";
		}
	}

	private Map getOB_IAX_IRPF(List<Map> T_IAX_IRPF, BigDecimal nano) {

		for (Map irpf : T_IAX_IRPF) {
			Map OB_IAX_IRPF = (Map) irpf.get("OB_IAX_IRPF");
			BigDecimal OB_NANO = new BigDecimal(String.valueOf(OB_IAX_IRPF.get("NANO")));
			if (nano.intValue() == OB_NANO.intValue())
				return OB_IAX_IRPF;

		}

		return null;
	}
}
