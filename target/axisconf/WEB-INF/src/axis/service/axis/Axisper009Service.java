//Revision:# gZKqcQPDHRlSVU96rUFEnQ== #
package axis.service.axis;

import java.math.BigDecimal;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Enumeration;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_AGENDA;
import axis.jdbc.PAC_IAX_COMMON;
import axis.jdbc.PAC_IAX_CONTRAGARAN;
import axis.jdbc.PAC_IAX_DESCVALORES;
import axis.jdbc.PAC_IAX_ESC_RIESGO;
import axis.jdbc.PAC_IAX_FINANCIERA;
import axis.jdbc.PAC_IAX_GESTION_REC;
import axis.jdbc.PAC_IAX_LISTASRESTRINGIDA; //JAVENDANO CONF 239
import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.jdbc.PAC_IAX_PERSONA;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.control.axis.Axisper009Action;
import axis.mvc.model.UsuarioBean;
import axis.util.Constantes;

public class Axisper009Service extends AxisBaseService {
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
	public void m_form(HttpServletRequest request, Axisper009Action thisAction) {
		logger.debug("Axisper009Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {
			request.removeAttribute("dades_persona");
			request.getSession().removeAttribute("PERSONA_SARLAFT");
			request.getSession().removeAttribute("AXISMPRXXX_EST");

			String CMODO = (String) AbstractDispatchAction.topPila(request, "CMODO");
			if (CMODO == null) {
				CMODO = (String) formdata.get("CMODO");
				// INI IAXIS-4854
				if (CMODO == null) {
					CMODO = (String) formdata.get("MODO__joined");
					logger.debug("----> modo:" + CMODO);
					if (CMODO != null) {
						String[] modos = CMODO.split("\\|");
						if (modos.length > 0) {
							// CONTIENE EL MODO EN EL CUAL SE INGRESA A LA APLICACIÓN
							CMODO = modos[modos.length - 1];
						}
					}
				}
				// FIN IAXIS-4854
				logger.debug("----> modo:" + CMODO);
			}

			formdata.put("CMODO", CMODO);
			AbstractDispatchAction.topPila(request, "CMODO", CMODO);

			cargarValoresDesplegables(request, thisAction, usuario, formdata);

			cargarPersona(request, thisAction, usuario, formdata);

			cargarFichaTecnica(request, thisAction, usuario, formdata);

			cargarScoring(request, thisAction, usuario, formdata);

			cargarHistoricoLRE(request, thisAction);

		} catch (Exception e) {
			logger.error("Error en el mtodo Axisper009Service.m_form", e);
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
			logger.error("Error en el mtodo Axisper009Service.m_getDescTipSoc", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
			return "";
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

	private void cargarValoresDesplegables(HttpServletRequest request, Axisper009Action thisAction, UsuarioBean usuario,
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

			// Lista pases
			map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTPAISES();
			logger.debug(map);
			listValores.put("lstPaises", (List) tratarRETURNyMENSAJES(request, map, false));

			// Lista tipo de tarjetas
			map = pac_axis_persona.ejecutaPAC_IAX_PERSONA__F_GET_TIPCCC(new BigDecimal("2"));
			logger.debug(map);
			listValores.put("tipCCC", (List) tratarRETURNyMENSAJES(request, map));

			// Lista tipo de cuentas
			map = pac_axis_persona.ejecutaPAC_IAX_PERSONA__F_GET_TIPCCC(new BigDecimal("1"));
			logger.debug(map);
			listValores.put("tipTARJETA", (List) tratarRETURNyMENSAJES(request, map));

			// Lista tipo direcciones
			map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTTIPODIRECCION();
			logger.debug(map);
			listValores.put("lstTipoDireccion", (List) tratarRETURNyMENSAJES(request, map));

			// Lista tipo vas
			map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTTIPOVIA();
			logger.debug(map);
			listValores.put("lstTipoVia", (List) tratarRETURNyMENSAJES(request, map));

			// Lista agrupaciones consrocios
			BigDecimal SPERSON = getCampoNumerico(request, "SPERSON");
			if (isEmpty(SPERSON) && !isEmpty(request.getParameter("SPERSON"))) {
				SPERSON = new BigDecimal(String.valueOf(request.getParameter("SPERSON")));
			}

			if (SPERSON != null) {
				map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_GET_AGRUPACIONES_CONSORCIOS(SPERSON,
						"ORIGINAL");
				logger.debug(map);
				listValores.put("agrupacionesConsorcio", (List) tratarRETURNyMENSAJES(request, map));
			}

		} catch (Exception e) {
			logger.error("Error en el mtodo Axisper009Service.cargarValoresDesplegables", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			formdata.put("listValores", listValores);
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));

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
			PAC_IAX_CONTRAGARAN pac_IAX_CONTRAGARAN = new PAC_IAX_CONTRAGARAN(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			/* Estado persona */
			if (!isEmpty(SPERSON)) {

				Map mapGetRelacionContra = pac_IAX_CONTRAGARAN
						.ejecutaPAC_IAX_CONTRAGARANTIAS__F_GETRELACION_SPERSON(SPERSON, "POL");
				List T_IAX_CONTRAGARAN = (List) tratarRETURNyMENSAJES(request, mapGetRelacionContra);
				formdata.put("T_IAX_CONTRAGARAN", T_IAX_CONTRAGARAN);
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

				// inicio modificacion bartolo herrera 22-02-2019

				Map mapVinPer = pac_axis_persona.ejecutaPAC_IAX_PERSONA__F_GET_TIPO_VINCULACION_PERSONA(SPERSON);
				List tipoVinculacion = (List) tratarRETURNyMENSAJES(request, mapVinPer);
				String tipVin = "";
				if (tipoVinculacion != null) {
					Map aux = (Map) tipoVinculacion.get(0);
					tipVin = aux.get("VINCULACION").toString();
				}

				formdata.put("TIPVIN", tipVin);

				// fin modificacion bartolo herrera 22-02-2019

				// CONF-347-20161101-RCS - Ini
				PAC_IAX_AGENDA paciaxagenda = new PAC_IAX_AGENDA(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

				PAC_IAX_PERSONA pac_IAX_PERSONA = new PAC_IAX_PERSONA(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
				Map m2 = paciaxagenda.ejecutaPAC_IAX_AGENDA__F_GET_LSTAPUNTES(null, null, new BigDecimal(4),
						SPERSON.toString(), new BigDecimal(2), // TCS-809 26/02/2019 AP
						null, null, null, null, null, null, null, null, null, null, null, null, null, null);
				// INI TCS-809 26/02/2019 AP
				Map m3 = paciaxagenda.ejecutaPAC_IAX_AGENDA__F_GET_LSTAPUNTES(null, null, new BigDecimal(4),
						SPERSON.toString(), new BigDecimal(1), null, null, null, null, null, null, null, null, null,
						null, null, null, null, null);
				logger.debug("MAP M2 -->" + m2);
				logger.debug("MAP M3 -->" + m3);
				logger.debug("MAP M2 -->" + m2.get("PLSTAGENDA"));
				logger.debug("MAP M3 -->" + m3.get("PLSTAGENDA"));
				if (((BigDecimal) this.tratarRETURNyMENSAJES(request, m2)).intValue() == 0
						&& ((BigDecimal) this.tratarRETURNyMENSAJES(request, m3)).intValue() == 0) {
					formdata.put("resultagenda", m2.get("PLSTAGENDA"));
					formdata.put("resultagenda1", m3.get("PLSTAGENDA"));
					logger.debug("MAP M2 -->" + m2);
					logger.debug("MAP M3 -->" + m3);
					// FIN TCS-809 26/02/2019 AP

				}

				// CONF-347-20161101-RCS - Fin

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
					// TCS-1570 CESS - Init
					if (isEmpty(OBPERSONA.get("FNACIMI"))) {
						PAC_IAX_FINANCIERA pac_axis_financiera = new PAC_IAX_FINANCIERA(
								(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
						Map mapMio = pac_axis_financiera.ejecutaPAC_IAX_FINANCIERA__F_GET_GENERAL_PERSONA(
								new BigDecimal(OBPERSONA.get("SPERSON").toString()));
						List array = (List) tratarRETURNyMENSAJES(request, mapMio);
						if (array != null) {
							Map t = (Map) array.get(0);
							OBPERSONA.replace("FNACIMI", t.get("FCONSTI"));
						}
					}

					// TCS-1570 CESS - End

					request.setAttribute("dades_persona", (Map) map.get("OBPERSONA"));
					request.getSession().setAttribute("PERSONA_SARLAFT", map.get("OBPERSONA"));
					if (!isEmpty(OBPERSONA)) {
						BigDecimal CTIPPER = (BigDecimal) OBPERSONA.get("CTIPPER");
						if (new BigDecimal(2).equals(CTIPPER)) {
							OBPERSONA.put("TNOMBRE", OBPERSONA.get("TSIGLAS"));
						}

						String tipo_persona = "";
						List tipPersona = (List) ((Map) formdata.get("listValores")).get("tipPerson");
						for (int i = 0; i < tipPersona.size(); i++) {
							Map mapTP = (Map) tipPersona.get(i);
							if (((BigDecimal) mapTP.get("CATRIBU")).equals(CTIPPER)) {
								OBPERSONA.put("DESCIDENT", mapTP.get("TATRIBU"));
								tipo_persona = (String) mapTP.get("TATRIBU");
							}
						}

						OBPERSONA.put("tipo_persona", tipo_persona);

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

						Map mapSarlaf = pac_axis_persona.ejecutaPAC_IAX_PERSONA__F_GET_DATSARLATF(null, null, SPERSON);

						List<Map> listaarlaf = (List) tratarRETURNyMENSAJES(request, mapSarlaf);

						Map DET_SARLAFT = null;
						BigDecimal ultima_version = new BigDecimal(0);
						BigDecimal cconfir = new BigDecimal(0);
						Date fconfirfor = null;
						if (listaarlaf != null)
							for (Map miop : listaarlaf) {
								DET_SARLAFT = miop;
								if (((BigDecimal) DET_SARLAFT.get("SSARLAFT")).compareTo(ultima_version) > 0)
									ultima_version = (BigDecimal) DET_SARLAFT.get("SSARLAFT");
								cconfir = (BigDecimal) DET_SARLAFT.get("CCONFIR");
								if (!isEmpty(DET_SARLAFT.get("FCONFIRFOR"))) {
									fconfirfor = Date.valueOf(((java.sql.Timestamp) DET_SARLAFT.get("FCONFIRFOR"))
											.toLocalDateTime().toLocalDate());
								}
								if ((new BigDecimal(1)).equals(cconfir)) {
									request.getSession().setAttribute("sarlaftDuplicable", ultima_version);
								}
							}
						OBPERSONA.put("LISTAARLAF", listaarlaf);

						Calendar fechaHoy = new GregorianCalendar();
						// Fijar la media noche del da de hoy para no tener problemas con los
						// milisegundos
						// durante la comparacin de fechas.
						fechaHoy.set(Calendar.HOUR_OF_DAY, 0);
						fechaHoy.set(Calendar.MINUTE, 0);
						fechaHoy.set(Calendar.SECOND, 0);
						fechaHoy.set(Calendar.MILLISECOND, 0);

						Calendar calFechaConfir = Calendar.getInstance();

						if (!isEmpty(fconfirfor)) {
							calFechaConfir.setTime(fconfirfor);
						}
						// Si es igual a "0" se trata del mismo da, luego permite editar el formulario
						if (fechaHoy.compareTo(calFechaConfir) == 0 || new BigDecimal(0).equals(cconfir)) {
							OBPERSONA.put("permiteEditar", new BigDecimal(0));
						}

						OBPERSONA.put("ultima_version", ultima_version);
//            			formdata.put("LISTAARLAF", listaarlaf);
						// CONF-347-20161101-RCS - Ini
						String pParam = this.getInfoString(request, SPERSON.toString());

						Map mApuntesAgenda = paciaxagenda.ejecutaPAC_IAX_AGENDA__F_GET_LSTAGDOBS(new BigDecimal(6),
								null, pParam);
						logger.debug("lista agenda siniestros:" + mApuntesAgenda);
						BigDecimal ok = (isEmpty(this.tratarRETURNyMENSAJES(request, mApuntesAgenda)))
								? new BigDecimal(0)
								: (BigDecimal) this.tratarRETURNyMENSAJES(request, mApuntesAgenda);
						if (ok.intValue() == 0) {
							formdata.put("PLSTAGENDA_TRAMI", mApuntesAgenda.get("PLSTAGDOBS"));
						}

						// CONF-347-20161101-RCS - Ini

						Map mapSarlaftEstados = pac_IAX_PERSONA
								.ejecutaPAC_IAX_PERSONA__F_GET_ULTIMOSESTADOS_SARLATF(SPERSON);
						List<Map> estados = (List) tratarRETURNyMENSAJES(request, mapSarlaftEstados);
						OBPERSONA.put("ULTIMOS_ESTADOS", estados);
					}
				}
			}
			Map personaAUX = (Map) request.getAttribute("dades_persona");
			if (personaAUX != null) {
				if (personaAUX.containsKey("PERSONAS_REL")) {
					List<Map> personas = (List) personaAUX.get("PERSONAS_REL");
					HashMap<String, String> fechaAgrupacionConsorcioMap = new HashMap();
					HashMap<String, Long> contPersonasRelMap = new HashMap();
					contPersonasRelMap.put("0", Long.valueOf(0));
					for (Map persona : personas) {
						Map persona_rel = (Map) persona.get("OB_IAX_PERSONAS_REL");
						if (persona_rel.get("CAGRUPA") == null) {
							contPersonasRelMap.put("0", contPersonasRelMap.get("0") + 1);
						} else {
							String key = persona_rel.get("CAGRUPA").toString();
							String fechaAgrupaC = null;
							try {
								java.sql.Timestamp fechaTimestamp = (java.sql.Timestamp) persona_rel.get("FAGRUPA");
								fechaAgrupaC = new SimpleDateFormat("dd/MM/yyyy").format(fechaTimestamp);
							} catch (Exception e) {
								logger.debug("Error peticion get fecha vacia", e); // 18/01/2019 TCS 468A AP
							}
							if (!contPersonasRelMap.containsKey(key)) {
								contPersonasRelMap.put(key.toString(), Long.valueOf(1));
								fechaAgrupacionConsorcioMap.put(key.toString(), fechaAgrupaC);
							} else {
								contPersonasRelMap.put(key.toString(), contPersonasRelMap.get(key) + 1);
							}
						}

					}

					request.setAttribute("CONT_PERSONAS_REL", contPersonasRelMap);

					if (fechaAgrupacionConsorcioMap.isEmpty()) {
						request.setAttribute("FECHA_AGRUPAC", "");

					} else {

						String fechaAgrupaC = fechaAgrupacionConsorcioMap.toString();
						String fechaac = (fechaAgrupaC.replace("{", "").replace("}", "")).toString();

						request.setAttribute("FECHA_AGRUPAC", fechaac);
					}
				}
			}
		} catch (Exception e) {
			logger.error("Error en el mtodo Axisper009Service.cargarPersona", e);
			e.printStackTrace();
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
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

	/* CONF-347-20161101-RCS - Ini */
	private String getInfoString(HttpServletRequest request, String NSINIES) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {
			StringBuffer cadena = new StringBuffer();

			Enumeration enumera = request.getParameterNames();
			while (enumera.hasMoreElements()) {
				String fieldName = (String) enumera.nextElement();
				String[] todos_valores = request.getParameterValues(fieldName);
				for (int i = 0; i < todos_valores.length; i++) {
					String fieldValue = todos_valores[i];

					if (!isEmpty(fieldValue) && !fieldValue.equals("undefined") && !fieldName.equals("NSINIES")) {
						if (i == 0)
							cadena.append("#").append(fieldName).append(";").append(fieldValue);
						else
							cadena.append("#").append(fieldName).append("__").append(i).append(";").append(fieldValue);
					}

				}
			}
			cadena.append("#").append("NSINIES").append(";").append(NSINIES);
			return cadena.append("#").toString();
		} catch (Exception e) {
			logger.debug("error : " + e.getMessage());
			return "";
		}
	}
	/* CONF-347-20161101-RCS - Fin */

	/*********************************************************************************************************************/
	/****************************************
	 * INNER CLASS QUE REPRESENTA UNA PERSONA
	 *************************************/
	/*********************************************************************************************************************/

	public class Persona {
		// Necesarios slo para GRABAR
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
		BigDecimal SWRUT;

		public Persona(BigDecimal SSEGURO, BigDecimal SPERSON, BigDecimal SPEREAL, BigDecimal CAGENTE,
				BigDecimal CEMPRES, BigDecimal CTIPPER, BigDecimal CTIPIDE, String NNUMIDE, BigDecimal CSEXPER,
				java.sql.Date FNACIMI, String SNIP, BigDecimal CESTPER, java.sql.Date FJUBILA, BigDecimal CMUTUALISTA,
				java.sql.Date FDEFUNC, BigDecimal NORDIDE, BigDecimal CIDIOMA, String TAPELLI1, String TAPELLI2,
				String TNOMBRE, String TSIGLAS, String CPROFES, BigDecimal CESTCIV, BigDecimal CPAIS,
				BigDecimal CNACIONALIDAD, BigDecimal CDOMICI, BigDecimal PDUPLICADO, String TNOMBRE1, String TNOMBRE2,
				BigDecimal SWRUT) {
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
			this.SWRUT = SWRUT;
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

	public Persona initPersona(HttpServletRequest request, Axisper009Action thisAction) {
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
		BigDecimal SWRUT = getHiddenCampoNumerico(request, "SWRUT");
		BigDecimal SWRUT_COLM = getHiddenCampoNumerico(request, "SWRUT_COLM");
		logger.debug("09-SWRUT ::" + SWRUT);
		logger.debug("SWRUT_COLM ::" + SWRUT_COLM);
		if (isEmpty(SWRUT)) {
			SWRUT = getHiddenCampoNumerico(request, "SWRUT_COLM");
		}
		logger.debug("SWRUT despues if ::" + SWRUT);

		return new Persona(SSEGURO, SPERSON, SPEREAL, CAGENTE, CEMPRES, CTIPPER, CTIPIDE, NNUMIDE, CSEXPER, FNACIMI,
				SNIP, CESTPER, FJUBILA, CMUTUALISTA, FDEFUNC, NORDIDE, CIDIOMA, TAPELLI1, TAPELLI2, TNOMBRE, TSIGLAS,
				CPROFES, CESTCIV, CPAIS, CNACIONALIDAD, CDOMICI, PDUPLICADA, TNOMBRE1, TNOMBRE2, SWRUT);

	}

	/**
	 * @param request    El HttpServletRequest que contiene la peticin del cliente
	 *                   web.
	 * @param thisAction Una Action abstracta desde donde se ha invocado el servicio
	 *                   (necesaria para el log).
	 */
	public void m_eliminarDireccion(HttpServletRequest request, Axisper009Action thisAction) {
		logger.debug("Axisper009Service m_eliminarDireccion");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {
			BigDecimal SPERSON = null;
			BigDecimal CDOMICI = null;
			try {
				SPERSON = new BigDecimal(String.valueOf(request.getParameter("SPERSON")));
				CDOMICI = new BigDecimal(String.valueOf(request.getParameter("CDOMICI")));
			} catch (Exception ex) {
				SPERSON = null;
				CDOMICI = null;
			}

			BigDecimal CAGENTE = getCampoNumerico(request, "CAGENTE");
			PAC_IAX_PERSONA pac_axis_persona = new PAC_IAX_PERSONA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map map = pac_axis_persona.ejecutaPAC_IAX_PERSONA__F_DEL_DIRECCIONES(SPERSON, CDOMICI, null, CAGENTE);
			logger.debug(map);
			tratarRETURNyMENSAJES(request, map);
		} catch (Exception e) {
			logger.error("Error en el mtodo Axisper009Service.m_eliminarDireccion", e);
			thisAction.guardarMensaje(request, "1000052", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	public void m_eliminarCCC(HttpServletRequest request, Axisper009Action thisAction) {
		logger.debug("Axisper009Service m_eliminarCCC");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {
			BigDecimal SPERSON = null;
			BigDecimal CNORDBAN = null;
			try {
				SPERSON = new BigDecimal(String.valueOf(request.getParameter("SPERSON")));
				CNORDBAN = new BigDecimal(String.valueOf(request.getParameter("CNORDBAN")));
			} catch (Exception ex) {
				SPERSON = null;
				CNORDBAN = null;
			}

			PAC_IAX_PERSONA pac_axis_persona = new PAC_IAX_PERSONA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map map = pac_axis_persona.ejecutaPAC_IAX_PERSONA__F_DEL_CCC(SPERSON, CNORDBAN);
			logger.debug(map);
			tratarRETURNyMENSAJES(request, map);
		} catch (Exception e) {
			logger.error("Error en el mtodo Axisper009Service.m_eliminarCCC", e);
			thisAction.guardarMensaje(request, "1000052", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	public void m_eliminarNACIONALIDAD(HttpServletRequest request, Axisper009Action thisAction) {
		logger.debug("Axisper009Service m_eliminarNACIONALIDADA");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {
			BigDecimal SPERSON = null;
			BigDecimal CPAIS = null;
			BigDecimal CAGENTE = getCampoNumerico(request, "CAGENTE");
			try {
				SPERSON = new BigDecimal(String.valueOf(request.getParameter("SPERSON")));
				CPAIS = new BigDecimal(String.valueOf(request.getParameter("CPAIS")));
			} catch (Exception ex) {
				SPERSON = null;
				CPAIS = null;
			}

			PAC_IAX_PERSONA pac_axis_persona = new PAC_IAX_PERSONA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map map = pac_axis_persona.ejecutaPAC_IAX_PERSONA__F_DEL_NACIONALIDAD(SPERSON, CPAIS, CAGENTE);
			logger.debug(map);
			tratarRETURNyMENSAJES(request, map);
		} catch (Exception e) {
			logger.error("Error en el mtodo Axisper009Service.m_eliminarNACIONALIDAD", e);
			thisAction.guardarMensaje(request, "1000052", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	public void m_eliminarCONTACTO(HttpServletRequest request, Axisper009Action thisAction) {
		logger.debug("Axisper009Service m_eliminarCONTACTO");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {
			BigDecimal SPERSON = null;
			BigDecimal CMODCON = null;
			BigDecimal CAGENTE = getCampoNumerico(request, "CAGENTE");
			try {
				SPERSON = new BigDecimal(String.valueOf(request.getParameter("SPERSON")));
				CMODCON = new BigDecimal(String.valueOf(request.getParameter("CMODCON")));
			} catch (Exception ex) {
				SPERSON = null;
				CMODCON = null;
			}

			PAC_IAX_PERSONA pac_axis_persona = new PAC_IAX_PERSONA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map map = pac_axis_persona.ejecutaPAC_IAX_PERSONA__F_DEL_CONTACTO(SPERSON, CAGENTE, CMODCON);
			logger.debug(map);
			tratarRETURNyMENSAJES(request, map);
		} catch (Exception e) {
			logger.error("Error en el mtodo Axisper009Service.m_eliminarCONTACTO", e);
			thisAction.guardarMensaje(request, "1000052", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	public void m_eliminarIDENTIFICADOR(HttpServletRequest request, Axisper009Action thisAction) {
		logger.debug("Axisper009Service m_eliminarIDENTIFICADOR");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {
			BigDecimal SPERSON = null;
			BigDecimal CTIPIDE = null;
			BigDecimal CAGENTE = getCampoNumerico(request, "CAGENTE");
			try {
				SPERSON = new BigDecimal(String.valueOf(request.getParameter("SPERSON")));
				CTIPIDE = new BigDecimal(String.valueOf(request.getParameter("CTIPIDE")));
			} catch (Exception ex) {
				SPERSON = null;
				CTIPIDE = null;
			}

			PAC_IAX_PERSONA pac_axis_persona = new PAC_IAX_PERSONA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map map = pac_axis_persona.ejecutaPAC_IAX_PERSONA__F_DEL_IDENTIFICADOR(SPERSON, CAGENTE, CTIPIDE);
			logger.debug(map);
			tratarRETURNyMENSAJES(request, map);
		} catch (Exception e) {
			logger.error("Error en el mtodo Axisper009Service.m_eliminarIDENTIFICADOR", e);
			thisAction.guardarMensaje(request, "1000052", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	public void m_eliminarIRPF(HttpServletRequest request, Axisper009Action thisAction) {
		logger.debug("Axisper009Service  m_eliminarIRPF  ");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {
			BigDecimal SPERSON = null;
			BigDecimal CTIPIDE = null;
			BigDecimal CAGENTE = getCampoNumerico(request, "CAGENTE");
			BigDecimal NANO = getCampoNumerico(request, "NANO");
			try {
				SPERSON = new BigDecimal(String.valueOf(request.getParameter("SPERSON")));

			} catch (Exception ex) {
				SPERSON = null;
				CTIPIDE = null;
			}

			PAC_IAX_PERSONA pac_axis_persona = new PAC_IAX_PERSONA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map map = pac_axis_persona.ejecutaPAC_IAX_PERSONA__F_DEL_IRPF(SPERSON, CAGENTE, NANO);
			logger.debug(map);
			tratarRETURNyMENSAJES(request, map);

			formdata.remove("NANO");

		} catch (Exception e) {
			logger.error("Error en el mtodo Axisper009Service. m_eliminarIRPF  ", e);
			thisAction.guardarMensaje(request, "1000052", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	public void m_eliminarPARPER(HttpServletRequest request, Axisper009Action thisAction) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {
			BigDecimal SPERSON = getCampoNumerico(request, "SPERSON");
			BigDecimal CAGENTE = getCampoNumerico(request, "CAGENTE");
			String CPARAM = getCampoTextual(request, "CPARAM");

			PAC_IAX_PERSONA pac_axis_persona = new PAC_IAX_PERSONA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map map = pac_axis_persona.ejecutaPAC_IAX_PERSONA__F_DEL_PARPERSONA(SPERSON, CAGENTE, CPARAM);
			logger.debug(map);
			tratarRETURNyMENSAJES(request, map);
		} catch (Exception e) {
			logger.error("Error en el mtodo Axisper009Service. m_eliminarPARPER  ", e);
			thisAction.guardarMensaje(request, "1000052", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	public void m_consultarPolissa(HttpServletRequest request, Axisper009Action thisAction) {
		logger.debug("Axisper009Service m_consultarPolissa");
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);

		try {
			UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
			// Push de los datos necesarios a la pila
			BigDecimal SSEGURO = getCampoNumerico(request, "SSEGURO");
			BigDecimal SPERSON = new BigDecimal(String.valueOf(request.getParameter("SPERSON")));

			thisAction.topPila(request, "formdata_axisper009", formdata);
			thisAction.topPila(request, "SPERSON", SPERSON);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisper009Service - mtodo m_consultarPolissa", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	public void m_volverPol(HttpServletRequest request, Axisper009Action thisAction) {
		logger.debug("Axisper009Service m_volver");
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {
			Map formdata_axisper009 = (Map) thisAction.removeTopPila(request, "formdata_axisper009");
			if (!isEmpty(formdata_axisper009)) {
				formdata.putAll(formdata_axisper009);
			}
			formdata.put("SPERSON", bigDecimalToString((BigDecimal) thisAction.removeTopPila(request, "SPERSON")));

		} catch (Exception e) {
			logger.error("Error en el servicio Axisper009Service - mtodo m_volver", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	public void m_eliminarPERREL(HttpServletRequest request, Axisper009Action thisAction) {
		logger.debug("Axisper009Service m_eliminarPERREL");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {
			BigDecimal SPERSONSelected = null;
			BigDecimal SPERSON_REL = null;
			BigDecimal CAGENTEselected = null;
			BigDecimal CAGRUPA = null;
			try {
				SPERSONSelected = new BigDecimal(String.valueOf(request.getParameter("SPERSONSelected")));
				SPERSON_REL = new BigDecimal(String.valueOf(request.getParameter("SPERSON_REL")));
				CAGENTEselected = new BigDecimal(String.valueOf(request.getParameter("CAGENTEselected")));
				CAGRUPA = new BigDecimal(String.valueOf(request.getParameter("CAGRUPA")));
			} catch (Exception ex) {
				SPERSONSelected = null;
				SPERSON_REL = null;
			}

			PAC_IAX_PERSONA pac_axis_persona = new PAC_IAX_PERSONA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map map = pac_axis_persona.ejecutaPAC_IAX_PERSONA__F_DEL_PERSONA_REL(SPERSONSelected, CAGENTEselected,
					SPERSON_REL, CAGRUPA);
			logger.debug(map);
			tratarRETURNyMENSAJES(request, map);
		} catch (Exception e) {
			logger.error("Error en el mtodo Axisper009Service.m_eliminarPERREL", e);
			thisAction.guardarMensaje(request, "1000052", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	public void m_eliminarREGFISC(HttpServletRequest request, Axisper009Action thisAction) {
		logger.debug("Axisper009Service m_eliminarREGFISC");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		try {
			BigDecimal SPERSONSelected = null;
			BigDecimal CAGENTEselected = null;
			java.sql.Date FEFECTO = null;
			try {
				SPERSONSelected = new BigDecimal(String.valueOf(request.getParameter("SPERSONSelected")));
				FEFECTO = stringToSqlDate(String.valueOf(request.getParameter("FEFECTOSelected")));
				logger.debug("------------------------------------------------------> FEFECTO : " + FEFECTO);
				CAGENTEselected = new BigDecimal(String.valueOf(request.getParameter("CAGENTEselected")));
			} catch (Exception ex) {
				SPERSONSelected = null;
			}

			PAC_IAX_PERSONA pac_axis_persona = new PAC_IAX_PERSONA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map map = pac_axis_persona.ejecutaPAC_IAX_PERSONA__F_DEL_REGIMENFISCAL(SPERSONSelected, CAGENTEselected,
					FEFECTO);
			logger.debug(map);
			tratarRETURNyMENSAJES(request, map);
		} catch (Exception e) {
			logger.error("Error en el mtodo Axisper009Service.m_eliminarREGFISC", e);
			thisAction.guardarMensaje(request, "1000052", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	public void m_eliminarSARLAFT(HttpServletRequest request, Axisper009Action thisAction) {
		logger.debug("Axisper009Service m_eliminarREGFISC");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		try {
			BigDecimal SPERSON_SARLAFT = null;
			BigDecimal CAGENTE_SARLAFT = null;
			java.sql.Date FEFECTO = null;
			try {
				SPERSON_SARLAFT = new BigDecimal(String.valueOf(request.getParameter("SPERSON_SARLAFT")));
				FEFECTO = stringToSqlDate(String.valueOf(request.getParameter("FEFECTO_SARLAFT")));
				logger.debug("------------------------------------------------------> FEFECTO : " + FEFECTO);
				CAGENTE_SARLAFT = new BigDecimal(String.valueOf(request.getParameter("CAGENTE_SARLAFT")));
			} catch (Exception ex) {
				SPERSON_SARLAFT = null;
			}

			PAC_IAX_PERSONA pac_axis_persona = new PAC_IAX_PERSONA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map map = pac_axis_persona.ejecutaPAC_IAX_PERSONA__F_DEL_SARLAFT(SPERSON_SARLAFT, CAGENTE_SARLAFT, FEFECTO);
			logger.debug(map);
			tratarRETURNyMENSAJES(request, map);
		} catch (Exception e) {
			logger.error("Error en el mtodo Axisper009Service.m_eliminarREGFISC", e);
			thisAction.guardarMensaje(request, "1000052", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	public void m_consultarPerRel(HttpServletRequest request, Axisper009Action thisAction) {
		logger.debug("Axisper009Service m_consultarPerRel");
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);

		try {
			UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
			// Push de los datos necesarios a la pila
			// BigDecimal SSEGURO = getCampoNumerico (request, "SSEGURO");
			BigDecimal SPERSON_AUX = new BigDecimal(String.valueOf(request.getParameter("SPERSON_AUX"))); // A consultar
			BigDecimal SPERSON = new BigDecimal(String.valueOf(request.getParameter("SPERSON"))); // Actual
			logger.debug("m_consultar ---------------------> " + SPERSON_AUX);
			// formdata.put("SPERSON",SPERSON_AUX);

			thisAction.topPila(request, "formdata_axisper009", formdata);
			thisAction.topPila(request, "SPERSON_AUX", SPERSON);
			thisAction.topPila(request, "SPERSON", SPERSON_AUX);

			thisAction.topPila(request, "CMODO_AUX", (String) AbstractDispatchAction.topPila(request, "CMODO"));
			AbstractDispatchAction.topPila(request, "CMODO", "CONSULTA");
			request.setAttribute(Constantes.PASSTOPPILA, thisAction.topPila(request));

			// String CMODO=(String) AbstractDispatchAction.topPila(request, "CMODO");

		} catch (Exception e) {
			logger.error("Error en el servicio Axisper009Service - mtodo m_consultarPerRel", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	public void m_volverPerRel(HttpServletRequest request, Axisper009Action thisAction) {
		logger.debug("Axisper009Service m_volver");
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {
			Map formdata_axisper009 = (Map) thisAction.removeTopPila(request, "formdata_axisper009");
			if (!isEmpty(formdata_axisper009)) {
				formdata.putAll(formdata_axisper009);
			}
			formdata.put("SPERSON", bigDecimalToString((BigDecimal) thisAction.removeTopPila(request, "SPERSON_AUX"))); // El
																														// anterior

			thisAction.topPila(request, "CMODO", (String) AbstractDispatchAction.topPila(request, "CMODO_AUX"));

		} catch (Exception e) {
			logger.error("Error en el servicio Axisper009Service - mtodo m_volver", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	/*
	 * *****************************************************************************
	 * ************
	 */
	/*
	 * ********************************** NAVEGAR SINIESTRO
	 * ************************************
	 */
	/*
	 * *****************************************************************************
	 * ************
	 */

	public void m_navegar(HttpServletRequest request, Axisper009Action thisAction) {
		logger.debug("Axisper009Service m_navegar");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {

			// Push de los datos necesarios a la pila

			BigDecimal SSEGURO = getCampoNumerico(request, "SSEGURO");
			BigDecimal SPERSON = getCampoNumerico(request, "SPERSON");

			BigDecimal NRECIBO = getCampoNumerico(request, "NRECIBO");
			BigDecimal NTRAMIT = getCampoNumerico(request, "NTRAMIT");
			String NSINIES = getCampoTextual(request, "NSINIES");
			String NSINIESselected = getCampoTextual(request, "NSINIES");

			BigDecimal SPROCES = getCampoNumerico(request, "SPROCES");
			BigDecimal NLINEA = getCampoNumerico(request, "NLINEA");
			BigDecimal NLINEAINDX = getCampoNumerico(request, "NLINEAINDX");

			thisAction.topPila(request, "SPROCES", SPROCES);
			thisAction.topPila(request, "NLINEA", NLINEA);
			thisAction.topPila(request, "NLINEAINDX", NLINEAINDX);

			thisAction.topPila(request, "SSEGURO", SSEGURO);
			thisAction.topPila(request, "SPERSON", SPERSON);
			thisAction.topPila(request, "NRECIBO", NRECIBO);
			thisAction.topPila(request, "NTRAMIT", NTRAMIT);
			thisAction.topPila(request, "NSINIES", NSINIES);
			thisAction.topPila(request, "NSINIESselected", NSINIESselected);

			thisAction.topPila(request, "formdata_axisper009", formdata);

			thisAction.topPila(request, "SPERSON", SPERSON); // A consultar

			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));

		} catch (Exception e) {
			logger.error("Error en el servicio Axisper009Service - mtodo m_navegar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

	public void m_volver(HttpServletRequest request, Axisper009Action thisAction) {
		logger.debug("Axisper009Service m_volver");
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {

			/*
			 * formdata.put("NSINIES", (String)thisAction.removeTopPila(request,
			 * "NSINIES")); formdata.put("SPERSON",
			 * bigDecimalToString((BigDecimal)thisAction.removeTopPila(request,
			 * "SPERSON"))); formdata.put("NRECIBO",
			 * bigDecimalToString((BigDecimal)thisAction.removeTopPila(request,
			 * "NRECIBO"))); formdata.put("NTRAMIT",
			 * bigDecimalToString((BigDecimal)thisAction.removeTopPila(request,
			 * "NTRAMIT"))); formdata.put("SSEGURO",
			 * bigDecimalToString((BigDecimal)thisAction.removeTopPila(request,
			 * "SSEGURO")));
			 * 
			 * formdata.put("SPROCES",
			 * bigDecimalToString((BigDecimal)thisAction.removeTopPila(request,
			 * "SPROCES"))); formdata.put("NLINEA",
			 * bigDecimalToString((BigDecimal)thisAction.removeTopPila(request, "NLINEA")));
			 * formdata.put("NLINEAINDX",
			 * bigDecimalToString((BigDecimal)thisAction.removeTopPila(request,
			 * "NLINEAINDX")));
			 */

			Map formdata_axisper009 = (Map) thisAction.removeTopPila(request, "formdata_axisper009");
			if (!isEmpty(formdata_axisper009)) {
				formdata.putAll(formdata_axisper009);
			}
			formdata.put("SPERSON", bigDecimalToString((BigDecimal) thisAction.removeTopPila(request, "SPERSON")));

			if (isEmpty(thisAction.topPila(request, "CMODO")))// IAXIS-5125 Si tiene modo inicial no se cambia por el
																// auxiliar
				thisAction.topPila(request, "CMODO", (String) AbstractDispatchAction.topPila(request, "CMODO_AUX"));
		} catch (Exception e) {
			logger.error("Error en el servicio Axisper009Service - mtodo m_volver", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	public void m_bloquearPersonaLOPD(HttpServletRequest request, Axisper009Action thisAction) {
		logger.debug("Axisper009Service m_bloquearPersonaLOPD");
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {
			BigDecimal SPERSON = getCampoNumerico(request, "SPERSON");
			BigDecimal CAGENTE = getCampoNumerico(request, "CAGENTE");
			PAC_IAX_PERSONA pac_axis_persona = new PAC_IAX_PERSONA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map map = pac_axis_persona.ejecutaPAC_IAX_PERSONA__F_BLOQUEAR_PERSONA(SPERSON, CAGENTE);
			logger.debug(map);
			tratarRETURNyMENSAJES(request, map);
		} catch (Exception e) {
			logger.error("Error en el servicio Axisper009Service - mtodo m_bloquearPersonaLOPD", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	public void m_desbloquearPersonaLOPD(HttpServletRequest request, Axisper009Action thisAction) {
		logger.debug("Axisper009Service m_desbloquearPersonaLOPD");
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {

			BigDecimal SPERSON = getCampoNumerico(request, "SPERSON");
			BigDecimal CAGENTE = getCampoNumerico(request, "CAGENTE");
			PAC_IAX_PERSONA pac_axis_persona = new PAC_IAX_PERSONA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map map = pac_axis_persona.ejecutaPAC_IAX_PERSONA__F_DESBLOQUEAR_PERSONA(SPERSON, CAGENTE);
			logger.debug(map);
			tratarRETURNyMENSAJES(request, map);
		} catch (Exception e) {
			logger.error("Error en el servicio Axisper009Service - mtodo m_desbloquearPersonaLOPD", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	public void m_borrarPersonaLOPD(HttpServletRequest request, Axisper009Action thisAction) {
		logger.debug("Axisper009Service m_borrarPersonaLOPD");
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {

			BigDecimal SPERSON = getCampoNumerico(request, "SPERSON");
			BigDecimal CAGENTE = getCampoNumerico(request, "CAGENTE");
			PAC_IAX_PERSONA pac_axis_persona = new PAC_IAX_PERSONA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map map = pac_axis_persona.ejecutaPAC_IAX_PERSONA__F_BORRAR_PERSONA_LOPD(SPERSON, CAGENTE);
			logger.debug(map);
			tratarRETURNyMENSAJES(request, map);
		} catch (Exception e) {
			logger.error("Error en el servicio Axisper009Service - mtodo m_borrarPersonaLOPD", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
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

	private void cargarFichaTecnica(HttpServletRequest request, Axisper009Action thisAction, UsuarioBean usuario,
			Map formdata) throws Exception {
		// Carga de valores de la ficha tcnica (ficha financiera)
		Map fichaTecnica = new HashMap();
		try {

			BigDecimal SFINANCI = getCampoNumerico(request, "SFINANCI");
			BigDecimal SPERSON = getCampoNumerico(request, "SPERSON");
			if (isEmpty(SPERSON) && !isEmpty(request.getParameter("SPERSON"))) {
				SPERSON = new BigDecimal(String.valueOf(request.getParameter("SPERSON")));

				PAC_IAX_FINANCIERA pac_axis_financiera = new PAC_IAX_FINANCIERA(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
				Map map = pac_axis_financiera.ejecutaPAC_IAX_FINANCIERA__F_GET_GENERAL_PERSONA(SPERSON);
				List array = (List) tratarRETURNyMENSAJES(request, map);
				if (array != null) {
					int resultado = array.get(0).toString().indexOf("SFINANCI");
					String SFINAN = array.get(0).toString().substring(resultado).split("=")[1].split(",")[0];
					formdata.put("SFINANCI", SFINAN);
					// INI TCS_11;IAXIS-2119 - JLTS - 10/03/2019 - Se ajusta el resulado de CIIU
					int resultado1 = array.get(0).toString().indexOf("CIIU");
					String CIIU = array.get(0).toString().substring(resultado1).split("=")[1].split(",")[0];
					formdata.put("CIIU", CIIU);
					// FIN TCS_11;IAXIS-2119 - JLTS - 10/03/2019
				}

				logger.debug(map);

				fichaTecnica.put("lstGeneral", (List) tratarRETURNyMENSAJES(request, map));

			}
		} catch (Exception e) {
			logger.error("Error en el servicio Axisper009Service - mtodo cargarFichaTecnica", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			formdata.put("fichaTecnica", fichaTecnica);
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
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

	private void cargarScoring(HttpServletRequest request, Axisper009Action thisAction, UsuarioBean usuario,
			Map formdata) throws Exception {
		// Carga de valores de la ficha tcnica (ficha financiera)
		Map scoring = new HashMap();
		try {

			BigDecimal SPERSON = getCampoNumerico(request, "SPERSON");
			if (isEmpty(SPERSON) && !isEmpty(request.getParameter("SPERSON"))) {
				SPERSON = new BigDecimal(String.valueOf(request.getParameter("SPERSON")));

				PAC_IAX_ESC_RIESGO pac_iax_esc_riesgo = new PAC_IAX_ESC_RIESGO(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
				Map map = pac_iax_esc_riesgo.ejecutaPAC_IAX_ESC_RIESGO__F_GET_SCORING_GENERAL(SPERSON);
				logger.debug(map);

				scoring.put("lstScoring", (List) tratarRETURNyMENSAJES(request, map));

			}
		} catch (Exception e) {
			logger.error("Error en el servicio Axisper009Service - mtodo cargarFichaTecnica", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			formdata.put("scoring", scoring);
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}

	}

	@SuppressWarnings("all")
	public void borrar_sarlaft(HttpServletRequest request, Axisper009Action thisAction) {
		logger.debug("Axisper047Service m_aceptar");
		try {
			UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
			Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

			PAC_IAX_PERSONA pac_IAX_PERSONA = new PAC_IAX_PERSONA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			BigDecimal SPERSON = getCampoNumerico(request, "SPERSON");
			BigDecimal SSARLAFT = getCampoNumerico(request, "SSARLAFT");
			String DETSARLAFT = getCampoTextual(request, "DETSARLAFT");
			BigDecimal IDSARLAFT = getCampoNumerico(request, "IDSARLAFT");
			Date FRADICA = AxisBaseService.stringToSqlDate(this.getCampoTextual(request, "FRADICA"), "dd/MM/yyyy");

			if (DETSARLAFT.equals("0")) {
				Map map = pac_IAX_PERSONA.ejecutaPAC_IAX_PERSONA__F_DEL_DATSARLATF(SSARLAFT, FRADICA, SPERSON);
				this.tratarRETURNyMENSAJES(request, map);

				map = pac_IAX_PERSONA.ejecutaPAC_IAX_PERSONA__F_DEL_DETSARLATF_DEC(null, SPERSON, SSARLAFT);
				this.tratarRETURNyMENSAJES(request, map);

				map = pac_IAX_PERSONA.ejecutaPAC_IAX_PERSONA__F_DEL_DETSARLATF_ACT(null, SPERSON, SSARLAFT);
				this.tratarRETURNyMENSAJES(request, map);

				map = pac_IAX_PERSONA.ejecutaPAC_IAX_PERSONA__F_DEL_DETSARLAFT_REC(null, SPERSON, SSARLAFT);
				this.tratarRETURNyMENSAJES(request, map);

			}
			if (DETSARLAFT.equals("1")) {
				Map map = pac_IAX_PERSONA.ejecutaPAC_IAX_PERSONA__F_DEL_DETSARLATF_DEC(IDSARLAFT, SPERSON, SSARLAFT);
				this.tratarRETURNyMENSAJES(request, map);
			}
			if (DETSARLAFT.equals("2")) {
				Map map = pac_IAX_PERSONA.ejecutaPAC_IAX_PERSONA__F_DEL_DETSARLATF_ACT(IDSARLAFT, SPERSON, SSARLAFT);
				this.tratarRETURNyMENSAJES(request, map);
			}
			if (DETSARLAFT.equals("3")) {
				Map map = pac_IAX_PERSONA.ejecutaPAC_IAX_PERSONA__F_DEL_DETSARLAFT_REC(IDSARLAFT, SPERSON, SSARLAFT);
				this.tratarRETURNyMENSAJES(request, map);
			}

			m_form(request, thisAction);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisper047Service - mtodo m_aceptar", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	@SuppressWarnings("all")
	public void m_aceptarSarlaft(HttpServletRequest request) {
		logger.debug("Axisper047Service m_aceptar");
		try {
			UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
			Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

			PAC_IAX_PERSONA pac_IAX_PERSONA = new PAC_IAX_PERSONA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			BigDecimal pPSSARLAFT = getHiddenCampoNumerico(request, "SSARLAFT");
			Date pPFRADICA = AxisBaseService.stringToSqlDate(this.getCampoTextual(request, "FRADICA"), "dd/MM/yyyy");
			BigDecimal pPSPERSON = getCampoNumerico(request, "SPERSON");
			Date pPFDILIGENCIA = AxisBaseService.stringToSqlDate(this.getCampoTextual(request, "FDILIGENCIA"),
					"dd/MM/yyyy");
			BigDecimal pPCAUTTRADAT = getCampoNumerico(request, "CAUTTRADAT");
			BigDecimal pPCRUTFCC = getCampoNumerico(request, "CRUTFCC");
			BigDecimal pPCESTCONF = getCampoNumerico(request, "CESTCONF");
			Date pPFCONFIR = AxisBaseService.stringToSqlDate(this.getCampoTextual(request, "FCONFIR"), "dd/MM/yyyy");
			BigDecimal pPCVINCULACION = getCampoNumerico(request, "CVINCULACION");
			String pPTVINCULACION = getCampoTextual(request, "TVINCULACION");
			BigDecimal pPCVINTOMASE = getCampoNumerico(request, "CVINTOMASE");
			String pPTVINTOMASE = getCampoTextual(request, "TVINTOMASE");
			BigDecimal pPCVINTOMBEN = getCampoNumerico(request, "CVINTOMBEN");
			String pPTVINTOMBEM = getCampoTextual(request, "TVINTOMBEM");
			BigDecimal pPCVINASEBEN = getCampoNumerico(request, "CVINASEBEN");
			String pPTVINASEBEM = getCampoTextual(request, "TVINASEBEM");
			BigDecimal pPCACTIPPAL = getCampoNumerico(request, "CACTIPPAL");
			BigDecimal pPPER_SECTORPPAL = getCampoNumerico(request, "PER_SECTORPPAL");
			BigDecimal pPNCIIUPPAL = getCampoNumerico(request, "NCIIUPPAL");
			String pPTCCIIUPPAL = getCampoTextual(request, "TCCIIUPPAL");
			String pPPERTIPOACTIVPPAL = getCampoTextual(request, "PER_TIPOACTIVPPAL");
			String pPTOCUPACION = getCampoTextual(request, "TOCUPACION");
			String pPTCARGO = getCampoTextual(request, "TCARGO");
			String pPTEMPRESA = getCampoTextual(request, "TEMPRESA");
			String pPTDIREMPRESA = getCampoTextual(request, "TDIREMPRESA");

			BigDecimal pPER_CDEPTOOFIC = getCampoNumerico(request, "PER_CDEPTOOFIC");
			String pPER_TDEPTOOFIC = getCampoTextual(request, "PER_TDEPTOOFIC");
			BigDecimal pPER_CCIUOFIC = getCampoNumerico(request, "PER_CCIUOFIC");
			String pPER_TCIUOFIC = getCampoTextual(request, "PER_TCIUOFIC");

			String pPTTELEMPRESA = getCampoTextual(request, "TTELEMPRESA");
			BigDecimal pPCACTISEC = getCampoNumerico(request, "CACTISEC");
			BigDecimal pPNCIIUSEC = getCampoNumerico(request, "NCIIUSEC");
			String pPTCCIIUSEC = getCampoTextual(request, "TCCIIUSEC");
			String pPTDIRSEC = getCampoTextual(request, "TDIRSEC");
			String pPTTELSEC = getCampoTextual(request, "TTELSEC");
			String pPTPRODSERVCOM = getCampoTextual(request, "TPRODSERVCOM");
			BigDecimal pPIINGRESOS = getCampoNumerico(request, "IINGRESOS");
			BigDecimal pPIACTIVOS = getCampoNumerico(request, "IACTIVOS");
			BigDecimal pPIPATRIMONIO = getCampoNumerico(request, "IPATRIMONIO");
			BigDecimal pPIEGRESOS = getCampoNumerico(request, "IEGRESOS");
			BigDecimal pPIPASIVOS = getCampoNumerico(request, "IPASIVOS");
			BigDecimal pPIOTROINGRESO = getCampoNumerico(request, "IOTROINGRESO");
			String pPTCONCOTRING = getCampoTextual(request, "TCONCOTRING");
			BigDecimal pPCMANRECPUB = getCampoNumerico(request, "CMANRECPUB");
			BigDecimal pPCPODPUB = getCampoNumerico(request, "CPODPUB");
			BigDecimal pPCRECPUB = getCampoNumerico(request, "CRECPUB");
			BigDecimal pPCVINPERPUB = getCampoNumerico(request, "CVINPERPUB");
			String pPTVINPERPUB = getCampoTextual(request, "TVINPERPUB");
			BigDecimal pPCDECTRIBEXT = getCampoNumerico(request, "CDECTRIBEXT");
			String pPTDECTRIBEXT = getCampoTextual(request, "TDECTRIBEXT");
			String pPTORIGFOND = getCampoTextual(request, "TORIGFOND");
			BigDecimal pPCTRAXMODEXT = getCampoNumerico(request, "CTRAXMODEXT");
			String pPTTRAXMODEXT = getCampoTextual(request, "TTRAXMODEXT");
			BigDecimal pPCPRODFINEXT = getCampoNumerico(request, "CPRODFINEXT");
			BigDecimal pPCCTAMODEXT = getCampoNumerico(request, "CCTAMODEXT");
			String pPTOTRASOPER = getCampoTextual(request, "TOTRASOPER");
			BigDecimal pPCRECLINDSEG = getCampoNumerico(request, "CRECLINDSEG");
			BigDecimal pPTCIUDADSUC = getCampoNumerico(request, "TCIUDADSUC");
			BigDecimal pPTPAISUC = getCampoNumerico(request, "TPAISUC");
			BigDecimal pPTDEPATAMENTOSUC = getCampoNumerico(request, "TDEPATAMENTOSUC");
			BigDecimal pPTCIUDAD = getCampoNumerico(request, "TCIUDAD");
			BigDecimal pPTDEPATAMENTO = getCampoNumerico(request, "TDEPATAMENTO");
			BigDecimal pPTPAIS = getCampoNumerico(request, "TPAIS");
			BigDecimal pPTLUGAREXPEDIDOC = getCampoNumerico(request, "TLUGAREXPEDIDOC");
			BigDecimal pPRESOCIEDAD = getCampoNumerico(request, "RESOCIEDAD");
			BigDecimal pPTNACIONALI2 = getCampoNumerico(request, "TNACIONALI2");
			BigDecimal pPNGRADOPOD = getCampoNumerico(request, "NGRADOPOD");
			BigDecimal pPNGOZREC = getCampoNumerico(request, "NGOZREC");
			BigDecimal pPNPARTICIPA = getCampoNumerico(request, "NPARTICIPA");
			BigDecimal pPNVINCULO = getCampoNumerico(request, "NVINCULO");
			BigDecimal pPNTIPDOC = getCampoNumerico(request, "NTIPDOC");
			Date pPFEXPEDICDOC = AxisBaseService.stringToSqlDate(this.getCampoTextual(request, "FEXPEDICDOC"),
					"dd/MM/yyyy");
			Date pPFNACIMIENTO = AxisBaseService.stringToSqlDate(this.getCampoTextual(request, "FNACIMIENTO"),
					"dd/MM/yyyy");
			String pPNRAZONSO = getCampoTextual(request, "NRAZONSO");
			String pPTNIT = getCampoTextual(request, "TNIT");
			String pPTDV = getCampoTextual(request, "TDV");
			String pPTOFICINAPRI = getCampoTextual(request, "TOFICINAPRI");
			String pPTTELEFONO = getCampoTextual(request, "TTELEFONO");
			String pPTFAX = getCampoTextual(request, "TFAX");
			String pPTSUCURSAL = getCampoTextual(request, "TSUCURSAL");
			String pPTTELEFONOSUC = getCampoTextual(request, "TTELEFONOSUC");
			String pPTFAXSUC = getCampoTextual(request, "TFAXSUC");
			String pPCTIPOEMP = getCampoTextual(request, "CTIPOEMP");
			String pPTCUALTEMP = getCampoTextual(request, "TCUALTEMP");
			String pPTSECTOR = getCampoTextual(request, "TSECTOR");
			BigDecimal pPCCIIU = getCampoNumerico(request, "CCIIU");
			String pPTACTIACA = getCampoTextual(request, "TACTIACA");
			String pPTMAILJURID = getCampoTextual(request, "TMAILJURID");
			String pPTREPRESENTANLE = getCampoTextual(request, "TREPRESENTANLE");
			String pPTSEGAPE = getCampoTextual(request, "TSEGAPE");
			String pPTNOMBRES = getCampoTextual(request, "TNOMBRES");
			String pPTNUMDOC = getCampoTextual(request, "TNUMDOC");
			String pPTLUGNACI = getCampoTextual(request, "TLUGNACI");
			String pPTNACIONALI1 = getCampoTextual(request, "TNACIONALI1");
			String pPTINDIQUEVIN = getCampoTextual(request, "TINDIQUEVIN");
			String pPPER_PAPELLIDO = getCampoTextual(request, "PER_PAPELLIDO");
			String pPPER_SAPELLIDO = getCampoTextual(request, "PER_SAPELLIDO");
			String pPPER_NOMBRES = getCampoTextual(request, "PER_NOMBRES");
			BigDecimal pPPER_TIPDOCUMENT = getCampoNumerico(request, "PER_TIPDOCUMENT");
			String pPPER_DOCUMENT = getCampoTextual(request, "PER_DOCUMENT");
			Date pPPER_FEXPEDICION = AxisBaseService.stringToSqlDate(this.getCampoTextual(request, "PER_FEXPEDICION"),
					"dd/MM/yyyy");
			BigDecimal pPPER_LUGEXPEDICION = getCampoNumerico(request, "PER_LUGEXPEDICION");
			Date pPPER_FNACIMI = AxisBaseService.stringToSqlDate(this.getCampoTextual(request, "PER_FNACIMI"),
					"dd/MM/yyyy");
			BigDecimal pPPER_LUGNACIMI = getCampoNumerico(request, "PER_LUGNACIMI");
			BigDecimal pPPER_NACION1 = getCampoNumerico(request, "PER_NACION1");
			String pPPER_DIRERECI = getCampoTextual(request, "PER_DIRERECI");
			BigDecimal pPPER_PAIS = getCampoNumerico(request, "PER_PAIS");
			BigDecimal pPPER_CIUDAD = getCampoNumerico(request, "PER_CIUDAD");
			BigDecimal pPPER_DEPARTAMENT = getCampoNumerico(request, "PER_DEPARTAMENT");
			String pPPER_EMAIL = getCampoTextual(request, "PER_EMAIL");
			String pPPER_TELEFONO = getCampoTextual(request, "PER_TELEFONO");
			String pPPER_CELULAR = getCampoTextual(request, "PER_CELULAR");
			BigDecimal pPNRECPUB = getCampoNumerico(request, "NRECPUB");
			BigDecimal pPTPRESETRECLAMACI = getCampoNumerico(request, "TPRESETRECLAMACI");
			String pPPER_TLUGEXPEDICION = getCampoTextual(request, "PER_TLUGEXPEDICION");
			String pPPER_TLUGNACIMI = getCampoTextual(request, "PER_TLUGNACIMI");
			String pPPER_TNACION1 = getCampoTextual(request, "PER_TNACION1");
			String pPPER_TNACION2 = getCampoTextual(request, "PER_TNACION2");
			String pPPER_TPAIS = getCampoTextual(request, "PER_TPAIS");
			String pPPER_TDEPARTAMENT = getCampoTextual(request, "PER_TDEPARTAMENT");
			String pPPER_TCIUDAD = getCampoTextual(request, "PER_TCIUDAD");
			String pPEMPTPAIS = getCampoTextual(request, "EMPTPAIS");
			String pPEMPTDEPATAMENTO = getCampoTextual(request, "EMPTDEPATAMENTO");
			String pPEMPTCIUDAD = getCampoTextual(request, "EMPTCIUDAD");
			String pPEMPTPAISUC = getCampoTextual(request, "EMPTPAISUC");
			String pPEMPTDEPATAMENTOSUC = getCampoTextual(request, "EMPTDEPATAMENTOSUC");
			String pPEMPTCIUDADSUC = getCampoTextual(request, "EMPTCIUDADSUC");
			String pPEMPTLUGNACI = getCampoTextual(request, "EMPTLUGNACI");
			String pPEMPTNACIONALI1 = getCampoTextual(request, "EMPTNACIONALI1");
			String pPEMPTNACIONALI2 = getCampoTextual(request, "EMPTNACIONALI2");
			BigDecimal pPCSUJETOOBLIFACION = getCampoNumerico(request, "CSUJETOOBLIFACION");
			String pTINDIQUEOBLIG = getCampoTextual(request, "TINDIQUEOBLIG");

			BigDecimal pPER_CDEPTOSOL = getCampoNumerico(request, "PER_CDEPTOSOL");
			String pPER_TDEPTOSOL = getCampoTextual(request, "PER_TDEPTOSOL");
			BigDecimal pPER_CCIUSOL = getCampoNumerico(request, "PER_CCIUSOL");
			String pPER_TCIUSOL = getCampoTextual(request, "PER_TCIUSOL");

			BigDecimal pPER_PAISEXPEDICION = getCampoNumerico(request, "PER_PAISEXPEDICION");
			String pPER_TPAISEXPEDICION = getCampoTextual(request, "PER_TPAISEXPEDICION");
			BigDecimal pPER_DEPEXPEDICION = getCampoNumerico(request, "PER_DEPEXPEDICION");
			String pPER_TDEPEXPEDICION = getCampoTextual(request, "PER_TDEPEXPEDICION");
			BigDecimal pPER_PAISLUGNACIMI = getCampoNumerico(request, "PER_PAISLUGNACIMI");
			String pPER_TPAISLUGNACIMI = getCampoTextual(request, "PER_TPAISLUGNACIMI");
			BigDecimal pPER_DEPLUGNACIMI = getCampoNumerico(request, "PER_DEPLUGNACIMI");
			String pPER_TDEPLUGNACIMI = getCampoTextual(request, "PER_TDEPLUGNACIMI");
			BigDecimal pEMP_PAISEXPEDICION = getCampoNumerico(request, "EMP_PAISEXPEDICION");
			String pEMP_TPAISEXPEDICION = getCampoTextual(request, "EMP_TPAISEXPEDICION");
			BigDecimal pEMP_DEPEXPEDICION = getCampoNumerico(request, "EMP_DEPEXPEDICION");
			String pEMP_TDEPEXPEDICION = getCampoTextual(request, "EMP_TDEPEXPEDICION");
			BigDecimal pEMP_PAISLUGNACIMI = getCampoNumerico(request, "EMP_PAISLUGNACIMI");
			String pEMP_TPAISLUGNACIMI = getCampoTextual(request, "EMP_TPAISLUGNACIMI");
			BigDecimal pEMP_DEPLUGNACIMI = getCampoNumerico(request, "EMP_DEPLUGNACIMI");
			String pEMP_TDEPLUGNACIMI = getCampoTextual(request, "EMP_TDEPLUGNACIMI");
			BigDecimal pEMP_LUGNACIMI = getCampoNumerico(request, "EMP_LUGNACIMI");
			String pEMP_TLUGNACIMI = getCampoTextual(request, "EMP_TLUGNACIMI");
			Date pEMP_FEXPEDICION = AxisBaseService.stringToSqlDate(this.getCampoTextual(request, "EMP_FEXPEDICION"),
					"dd/MM/yyyy");
			BigDecimal pEMP_LUGEXPEDICION = getCampoNumerico(request, "EMP_LUGEXPEDICION");
			String pEMP_TLUGEXPEDICION = getCampoTextual(request, "EMP_TLUGEXPEDICION");
			BigDecimal pPER_NACION2 = getCampoNumerico(request, "PER_NACION2");

			String pPPER_PCSUCURSAL = getCampoTextual(request, "PER_PCSUCURSAL");
			BigDecimal pPPER_PCCIUSOL = getCampoNumerico(request, "PER_PCCIUSOL");
			BigDecimal pPPER_PCTIPSOL = getCampoNumerico(request, "PER_PCTIPSOL");
			BigDecimal pPPER_PCSECTOR = getCampoNumerico(request, "PER_CSECTOR");
			String pPPER_PCTIPACT = getCampoTextual(request, "PER_PCTIPACT");
			BigDecimal pPPER_PCCIUOFC = getCampoNumerico(request, "PER_PCCIUOFC");
			BigDecimal pPPER_PCDEPOFC = getCampoNumerico(request, "PER_PCDEPOFC");
			String pPEMP_TMAILREPL = getCampoTextual(request, "EMP_TMAILREPL");
			String pPEMP_TDIRSREPL = getCampoTextual(request, "EMP_TDIRSREPL");
			BigDecimal pPEMP_CCIURREPL = getCampoNumerico(request, "EMP_CCIURREPL");
			String pPEMP_TCIURREPL = getCampoTextual(request, "EMP_TCIURREPL");
			BigDecimal pPEMP_CDEPRREPL = getCampoNumerico(request, "EMP_CDEPRREPL");
			String pPEMP_TDEPRREPL = getCampoTextual(request, "EMP_TDEPRREPL");
			BigDecimal pPEMP_CPAIRREPL = getCampoNumerico(request, "EMP_CPAIRREPL");
			String pPEMP_TPAIRREPL = getCampoTextual(request, "EMP_TPAIRREPL");
			BigDecimal pPEMP_TTELREPL = getCampoNumerico(request, "TTELREPL");
			BigDecimal pPEMP_TCELUREPL = getCampoNumerico(request, "TCELUREPL");

			BigDecimal pPCDEPTOENTREV = getCampoNumerico(request, "CDEPTOENTREV");
			String pPTDEPTOENTREV = getCampoTextual(request, "TDEPTOENTREV");
			BigDecimal pPCCIUENTREV = getCampoNumerico(request, "CCIUENTREV");
			String pPTCIUENTREV = getCampoTextual(request, "TCIUENTREV");
			Date pPFENTREVISTA = AxisBaseService.stringToSqlDate(getCampoTextual(request, "FENTREVISTA"), "dd/MM/yyyy");
			String pPTHORAENTREV = getCampoTextual(request, "THORAENTREV");
			String pPTAGENENTREV = getCampoTextual(request, "TAGENENTREV");
			String pPTASESENTREV = getCampoTextual(request, "TASESENTREV");
			String pPTOBSEENTREV = getCampoTextual(request, "TOBSEENTREV");
			BigDecimal pPCRESTENTREV = getCampoNumerico(request, "CRESTENTREV");
			String pPTOBSECONFIR = getCampoTextual(request, "TOBSECONFIR");
			String pPTHORACONFIR = getCampoTextual(request, "THORACONFIR");
			String pPTEMPLCONFIR = getCampoTextual(request, "TEMPLCONFIR");
			String pPCORIGENFON = getCampoTextual(request, "CORIGENFON"); // CP0416M_SYS_PERS 18/12/2018 ACL - Se agrega
																			// el campo corigen
			BigDecimal pPCCLAUSULA1 = getCampoNumerico(request, "CCLAUSULA1"); // TCS-9 AP 12/02/2019
			BigDecimal pPCCLAUSULA2 = getCampoNumerico(request, "CCLAUSULA2"); // TCS-9 AP 12/02/2019
			BigDecimal pPCCONFIR = getCampoNumerico(request, "CCONFIR");// IAXIS-3287 01/04/2019

			Map map = pac_IAX_PERSONA.ejecutaPAC_IAX_PERSONA__F_SET_DATSARLATF(pPSSARLAFT, pPFRADICA, pPSPERSON,
					pPFDILIGENCIA, pPCAUTTRADAT, pPCRUTFCC, pPCESTCONF, pPFCONFIR, pPCVINCULACION, pPTVINCULACION,
					pPER_CDEPTOSOL, pPER_TDEPTOSOL, pPER_CCIUSOL, pPER_TCIUSOL, pPCVINTOMASE, pPTVINTOMASE,
					pPCVINTOMBEN, pPTVINTOMBEM, pPCVINASEBEN, pPTVINASEBEM, pPCACTIPPAL, pPPER_SECTORPPAL, pPNCIIUPPAL,
					pPTCCIIUPPAL, pPPERTIPOACTIVPPAL, pPTOCUPACION, pPTCARGO, pPTEMPRESA, pPTDIREMPRESA,
					pPER_CDEPTOOFIC, pPER_TDEPTOOFIC, pPER_CCIUOFIC, pPER_TCIUOFIC, pPTTELEMPRESA, pPCACTISEC,
					pPNCIIUSEC, pPTCCIIUSEC, pPTDIRSEC, pPTTELSEC, pPTPRODSERVCOM, pPIINGRESOS, pPIACTIVOS,
					pPIPATRIMONIO, pPIEGRESOS, pPIPASIVOS, pPIOTROINGRESO, pPTCONCOTRING, pPCMANRECPUB, pPCPODPUB,
					pPCRECPUB, pPCVINPERPUB, pPTVINPERPUB, pPCDECTRIBEXT, pPTDECTRIBEXT, pPTORIGFOND, pPCTRAXMODEXT,
					pPTTRAXMODEXT, pPCPRODFINEXT, pPCCTAMODEXT, pPTOTRASOPER, pPCRECLINDSEG, pPTCIUDADSUC, pPTPAISUC,
					pPTDEPATAMENTOSUC, pPTCIUDAD, pPTDEPATAMENTO, pPTPAIS, pPTLUGAREXPEDIDOC, pPRESOCIEDAD,
					pPTNACIONALI2, pPNGRADOPOD, pPNGOZREC, pPNPARTICIPA, pPNVINCULO, pPNTIPDOC, pPFEXPEDICDOC,
					pPFNACIMIENTO, pPNRAZONSO, pPTNIT, pPTDV, pPTOFICINAPRI, pPTTELEFONO, pPTFAX, pPTSUCURSAL,
					pPTTELEFONOSUC, pPTFAXSUC, pPCTIPOEMP, pPTCUALTEMP, pPTSECTOR, pPCCIIU, pPTACTIACA, pPTMAILJURID,
					pPTREPRESENTANLE, pPTSEGAPE, pPTNOMBRES, pPTNUMDOC, pPTLUGNACI, pPTNACIONALI1, pPTINDIQUEVIN,
					pPPER_PAPELLIDO, pPPER_SAPELLIDO, pPPER_NOMBRES, pPPER_TIPDOCUMENT, pPPER_DOCUMENT,
					pPPER_FEXPEDICION, pPPER_LUGEXPEDICION, pPPER_FNACIMI, pPPER_LUGNACIMI, pPPER_NACION1,
					pPPER_DIRERECI, pPPER_PAIS, pPPER_CIUDAD, pPPER_DEPARTAMENT, pPPER_EMAIL, pPPER_TELEFONO,
					pPPER_CELULAR, pPNRECPUB, pPTPRESETRECLAMACI, pPPER_TLUGEXPEDICION, pPPER_TLUGNACIMI,
					pPPER_TNACION1, pPPER_TNACION2, pPPER_TPAIS, pPPER_TDEPARTAMENT, pPPER_TCIUDAD, pPEMPTPAIS,
					pPEMPTDEPATAMENTO, pPEMPTCIUDAD, pPEMPTPAISUC, pPEMPTDEPATAMENTOSUC, pPEMPTCIUDADSUC, pPEMPTLUGNACI,
					pPEMPTNACIONALI1, pPEMPTNACIONALI2, pPCSUJETOOBLIFACION, pTINDIQUEOBLIG, pPER_PAISEXPEDICION,
					pPER_TPAISEXPEDICION, pPER_DEPEXPEDICION, pPER_TDEPEXPEDICION, pPER_PAISLUGNACIMI,
					pPER_TPAISLUGNACIMI, pPER_DEPLUGNACIMI, pPER_TDEPLUGNACIMI, pEMP_PAISEXPEDICION,
					pEMP_TPAISEXPEDICION, pEMP_DEPEXPEDICION, pEMP_TDEPEXPEDICION, pEMP_PAISLUGNACIMI,
					pEMP_TPAISLUGNACIMI, pEMP_DEPLUGNACIMI, pEMP_TDEPLUGNACIMI, pEMP_LUGNACIMI, pEMP_TLUGNACIMI,
					pEMP_FEXPEDICION, pEMP_LUGEXPEDICION, pEMP_TLUGEXPEDICION, pPER_NACION2, pPPER_PCCIUSOL,
					pPPER_PCSUCURSAL, pPPER_PCTIPSOL, pPPER_PCSECTOR, pPPER_PCTIPACT, pPPER_PCCIUOFC, pPPER_PCDEPOFC,
					pPEMP_TMAILREPL, pPEMP_TDIRSREPL, pPEMP_CCIURREPL, pPEMP_TCIURREPL, pPEMP_CDEPRREPL,
					pPEMP_TDEPRREPL, pPEMP_CPAIRREPL, pPEMP_TPAIRREPL, pPEMP_TTELREPL, pPEMP_TCELUREPL, pPCDEPTOENTREV,
					pPTDEPTOENTREV, pPCCIUENTREV, pPTCIUENTREV, pPFENTREVISTA, pPTHORAENTREV, pPTAGENENTREV,
					pPTASESENTREV, pPTOBSEENTREV, pPCRESTENTREV, pPTOBSECONFIR, pPTHORACONFIR, pPTEMPLCONFIR,
					pPCORIGENFON, pPCCLAUSULA1, pPCCLAUSULA2, // TCS-9 AP 12/02/2019
					pPCCONFIR);// IAXIS-3287 01/04/2019

			tratarRETURNyMENSAJES(request, map);
		} catch (Exception e) {
			logger.error("Error en el servicio Axisper047Service - metodo m_aceptar", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	/* JAVENDANO CONF 239 */
	/*
	 * *****************************************************************************
	 * ************
	 */
	/*
	 * ********************************** HISTRICO LISTAS
	 * ************************************
	 */
	/*
	 * *****************************************************************************
	 * ************
	 */
	public void cargarHistoricoLRE(HttpServletRequest request, Axisper009Action thisAction) {
		logger.debug("Axisper009Service cargarHistoricoLRE");

		Map persona = (Map) request.getAttribute("dades_persona");
		String pPNNUMIDE = "";
		if (persona != null) {
			pPNNUMIDE = (String) persona.get("NNUMIDE");
		}
		try {
			PAC_IAX_LISTASRESTRINGIDA pac_axis_listaRestringida = new PAC_IAX_LISTASRESTRINGIDA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			Map map = pac_axis_listaRestringida.ejecutaPAC_IAX_LISTASRESTRINGIDA__F_GET_HISTORICO_PERSONA(pPNNUMIDE);
			logger.debug(map);
			request.setAttribute("T_IAX_LRE", (List) tratarRETURNyMENSAJES(request, map));
		} catch (Exception e) {
			logger.error("Error en el servicio Axisper009Service - mtodo cargarHistoricoLRE", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}

		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));

	}

	/* CONF-347-20161101-RCS - Ini */
	public void m_borrar_agenda(HttpServletRequest request, Axisper009Action thisAction) {

		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {

			BigDecimal IDOBSS = getHiddenCampoNumerico(request, "IDOBS");

			// Llamamos a la parte de consulta de la funcion
			Map map = new PAC_IAX_AGENDA((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_AGENDA__F_DEL_OBSERVACION(IDOBSS);
			BigDecimal resultado = (BigDecimal) tratarRETURNyMENSAJES(request, map);

		} catch (Exception e) {
			logger.error("Error en el mtodo Axissin006 cargarCombos", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {

			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}

	}

	/* CONF-347-20161101-RCS - Fin */
	/* INI--WAJ */
	public void m_eliminarIMPUESTO(HttpServletRequest request, Axisper009Action thisAction) {
		logger.debug("Axisper009Service m_eliminarIMPUESTO");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		try {
			BigDecimal SPERSONSelected = null;
			BigDecimal CTIPINDSelected = null;
			try {
				SPERSONSelected = new BigDecimal(String.valueOf(request.getParameter("SPERSONSelected")));
				CTIPINDSelected = new BigDecimal(String.valueOf(request.getParameter("CTIPINDSelected")));
			} catch (Exception ex) {
				SPERSONSelected = null;
			}

			PAC_IAX_PERSONA pac_axis_persona = new PAC_IAX_PERSONA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map map = pac_axis_persona.ejecutaPAC_IAX_PERSONA__F_DEL_IMPUESTO(SPERSONSelected, CTIPINDSelected);
			logger.debug(map);
			tratarRETURNyMENSAJES(request, map);
		} catch (Exception e) {
			logger.error("Error en el mtodo Axisper009Service.m_eliminarIMPUESTO", e);
			thisAction.guardarMensaje(request, "1000052", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	/* FIN--WAJ */
	// INI IAXIS-3670 16/04/2019 AP
	public void m_validar_Consorcio(HttpServletRequest request) {
		logger.debug("Axisper009Service m_validar_Consorcio");

		try {
			UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
			Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

			BigDecimal PSPERSON = getCampoNumerico(request, "SPERSON");
			BigDecimal RETORNO = BigDecimal.ONE;

			PAC_IAX_PERSONA pac_iax_persona = new PAC_IAX_PERSONA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			if (!isEmpty(PSPERSON)) {
				Map map = pac_iax_persona.ejecutaPAC_IAX_PERSONA__F_VALIDA_CONSORCIOS(PSPERSON);
				this.tratarRETURNyMENSAJES(request, map);
				RETORNO = (BigDecimal) map.get("RETURN");
				// INI IAXIS-3670 10/02/2020 CJMR
				// formdata.put("RETORNO", RETORNO);
			} else {
				RETORNO = BigDecimal.ZERO;
			}
			formdata.put("RETORNO", RETORNO);
			// FIN IAXIS-3670 10/02/2020 CJMR

		} catch (Exception e) {
			logger.error("Error en el servicio Axisper009Service m_validar_Consorcio", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
	}
	// FIN IAXIS-3670 16/04/2019 AP
}
