//Revision:# SKSFky5/icERvLC5Eawcpg== #
package axis.service.modal;

import java.math.BigDecimal;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.cache.AxisCodeWizard;
import axis.jdbc.PAC_IAX_BLOQUEO;
import axis.jdbc.PAC_IAX_GESTIONPROPUESTA;
import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.jdbc.PAC_IAX_PRODUCCION;
import axis.jdbc.PAC_IAX_SUPLEMENTOS;
import axis.jdbc.PAC_IAX_SUSPENSION;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.control.modal.Axisctr069Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AjaxContainerService;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

/**
 * Axisctr069Service.java 13/03/2009
 * 
 * @since Java 5.0
 */
@SuppressWarnings("all")
public class Axisctr069Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE INICIALIZACION
	 *******************************************/
	/*********************************************************************************************************************/

	/**
	 * 
	 * @param request
	 */
	public void m_form(HttpServletRequest request) {
		logger.debug("Axisctr069Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {

			PAC_IAX_BLOQUEO pacIaxBloqueo = new PAC_IAX_BLOQUEO(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			PAC_IAX_SUSPENSION pacIaxSuspension = new PAC_IAX_SUSPENSION(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			PAC_IAX_PRODUCCION pacIaxProduccion = new PAC_IAX_PRODUCCION(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			PAC_IAX_SUPLEMENTOS pacIaxSuplementos = new PAC_IAX_SUPLEMENTOS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			// CONF-274- 20161125 -JLTS- Se adiciona el SSEGURO a la pila
			AbstractDispatchAction.topPila(request, "SSEGURO", getCampoNumerico(request, "SSEGURO"));
			BigDecimal SSEGURO = getCampoNumerico(request, "SSEGURO");
			// -- CONF-274- 20161125 -JLTS- Ini
			BigDecimal CMOTMOV_AUX = getCampoNumerico(request, "CMOTMOV");
			String TMOTMOV_AUX = null;
			if (CMOTMOV_AUX != null) {
				if (CMOTMOV_AUX.equals(new BigDecimal(141))) {
					TMOTMOV_AUX = "BOT_REINICIAR_141";
				}
			}
			String TMOTMOV = (getCampoTextual(request, "TMOTMOV") != null) ? getCampoTextual(request, "TMOTMOV")
					: TMOTMOV_AUX;
			// -- CONF-274- 20161125 -JLTS- Fin
			// Bug 27766

			String modo = getCampoTextual(request, "LMODO");
			BigDecimal NMOVIMI = getCampoNumerico(request, "NMOVIMI");
			// BigDecimal CMOTMOV=new BigDecimal("261"); //=getCampoNumerico(request,
			// "CMOTMOV");
			BigDecimal CMOTMOV = getCampoNumerico(request, "pCMOTMOV");
			// Fin Bug 27766
			BigDecimal PRIMERA = (getCampoNumerico(request, "PRIMERA") != null) ? getCampoNumerico(request, "PRIMERA")
					: new BigDecimal(0);
			formdata.put("pPRIMERA", PRIMERA);
			BigDecimal v_motmov = null;

			if (modo == null) {
				// if (!modo.equals("MODIF_BENEF")){

				modo = "SUPLEMENTO_";

				if ("BOT_BLOQUEAR".equals(TMOTMOV)) {
					modo += "262";
					// Bug 27766
					CMOTMOV = new BigDecimal("262");
				}

				if ("BOT_DESBLOQUEAR".equals(TMOTMOV)) {
					modo += "264";
					// Bug 27766
					CMOTMOV = new BigDecimal("264");
				}

				if ("BOT_PIGNORAR".equals(TMOTMOV)) {
					modo += "261";
					CMOTMOV = new BigDecimal("261");
				}

				if ("BOT_DESPIGNORAR".equals(TMOTMOV)) {
					modo += "263";
					CMOTMOV = new BigDecimal("263");
				}

				if ("BOT_SUSPENDER".equals(TMOTMOV)) {
					modo += "391";
					v_motmov = new BigDecimal(391);
					// CONF-274 - 20161109 - JLTS -- Adici�n CMOVMOV(391) - Ini
					CMOTMOV = new BigDecimal("391");
					// CONF-274 - 20161109 - JLTS -- Adici�n CMOVMOV(391) - Fin
				}
				// CONF-274- 20161125 -JLTS- Se adiciona el bot�n BOT_REINICIAR_141
				if ("BOT_REINICIAR".equals(TMOTMOV) || "BOT_REINICIAR_141".equals(TMOTMOV)) {
					// CONF-274- 20161125 -JLTS- Ini
					if (TMOTMOV_AUX != null) {
						modo += "141";
						v_motmov = new BigDecimal(141);
						CMOTMOV = new BigDecimal("141");
					} else {
						// CONF-274- 20161125 -JLTS- Fin
						modo += "392";
						v_motmov = new BigDecimal(392);
						// CONF-274 - 20161109 - JLTS -- Adici�n CMOVMOV(392) - Ini
						CMOTMOV = new BigDecimal("392");
						// CONF-274 - 20161109 - JLTS -- Adici�n CMOVMOV(392) - Fin
					} // CONF-274- 20161125 -JLTS
				}

			} else if (modo.equals("ALTA_BENEF") || modo.equals("ELIMINAR_BENEF")) {
				if ("BOT_PIGNORAR".equals(TMOTMOV)) {
					CMOTMOV = new BigDecimal("261");
				}

				if ("BOT_DESPIGNORAR".equals(TMOTMOV)) {
					CMOTMOV = new BigDecimal("263");
				}
			}
			if (CMOTMOV != null) {
				formdata.put("LMODO", CMOTMOV);
				formdata.put("TMOTMOV", TMOTMOV); // CONF-274 - 20161109 - JLTS

				if (CMOTMOV.equals(new BigDecimal(261))) {
					AbstractDispatchAction.topPila(request, "CMODO", "SUPLEMENTO_261");
				} else if (CMOTMOV.equals(new BigDecimal(263))) {
					AbstractDispatchAction.topPila(request, "CMODO", "SUPLEMENTO_263");
				}
				// CONF-274 - 20161109 - JLTS -- Adici�n CMOVMOV(391,392) - Ini
				else if (CMOTMOV.equals(new BigDecimal(391))) {
					AbstractDispatchAction.topPila(request, "CMODO", "SUPLEMENTO_391");
				} else if (CMOTMOV.equals(new BigDecimal(392))) {
					AbstractDispatchAction.topPila(request, "CMODO", "SUPLEMENTO_392");
				} else if (CMOTMOV.equals(new BigDecimal(141))) {
					AbstractDispatchAction.topPila(request, "CMODO", "SUPLEMENTO_141");
				}
				// CONF-274 - 20161109 - JLTS -- Adici�n CMOVMOV(391,392) - Fin
			}

			logger.debug("---------------------------------------->Modo: " + modo);
			BigDecimal SPERSON = getCampoNumerico(request, "SPERSON");
			BigDecimal COPCIONAL = getCampoNumerico(request, "COPCIONAL");
			BigDecimal NRANGO = getCampoNumerico(request, "NRANGO");
			BigDecimal NCOLATER = getCampoNumerico(request, "NCOLATER");

			// Inicio BUG: 0034603: Field Name labels - Pledges
			Map listValores = new HashMap();
			PAC_IAX_LISTVALORES pac_axis_listValores = new PAC_IAX_LISTVALORES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			Map map3 = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_GET_RANK_PLEDGE();
			listValores.put("rankPledge", (List) tratarRETURNyMENSAJES(request, map3, false));
			formdata.put("listValores", listValores);

			Map map4 = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_GET_TIPO_CAUSA(CMOTMOV);
			listValores.put("tipoCausa", (List) tratarRETURNyMENSAJES(request, map4, false));
			formdata.put("listValores", listValores);
			// Fin BUG: 0034603: Field Name labels - Pledges

			if (!isEmpty(SSEGURO) && !isEmpty(TMOTMOV)) {
				Map map = new HashMap();
				// CONF-274- 20161125 -JLTS - Ini
				if ("BOT_REINICIAR".equals(TMOTMOV) || "BOT_SUSPENDER".equals(TMOTMOV)
						|| "BOT_REINICIAR_141".equals(TMOTMOV))
					if ("BOT_REINICIAR_141".equals(TMOTMOV)) {
						if (map != null) {
							map = pacIaxSuspension.ejecutaPAC_IAX_SUSPENSION__F_GET_MOV(SSEGURO, TMOTMOV);
						}
					} else
						map = pacIaxSuspension.ejecutaPAC_IAX_SUSPENSION__F_GET_MOV(SSEGURO, TMOTMOV);
				else
					map = pacIaxBloqueo.ejecutaPAC_IAX_BLOQUEO__F_GET_MOV(SSEGURO, TMOTMOV, NMOVIMI);

				// CONF-274- 20161125 -JLTS - Fin

				logger.debug(map);
				List<Map> datos = (List<Map>) tratarRETURNyMENSAJES(request, map);

				if (!isEmpty(datos) && datos.size() >= 1) {
					/*
					 * Bug 24450/131928 En el reinicio por defecto deber�a traer la fecha de
					 * renovaci�n (fcaranu) de la p�liza (ahora trae NULL). 10/12/2012 MLUIS
					 */
					if (datos.get(0).get("FFINAL") == null) {
						String FFINAL = getCampoTextual(request, "FCARANU");
						datos.get(0).put("FFINAL", stringToSqlDate(FFINAL));
					}

					formdata.putAll(datos.get(0));
					// CONF-274- 20161125 -JLTS - Se adiciona BOT_REINICIAR_141
					if (!"BOT_REINICIAR_141".equals(TMOTMOV) && !"BOT_REINICIAR".equals(TMOTMOV)
							&& !"BOT_SUSPENDER".equals(TMOTMOV)) {
						BigDecimal NBLOQUEO = (BigDecimal) datos.get(0).get("NBLOQUEO");

						map = pacIaxBloqueo.ejecutaPAC_IAX_BLOQUEO__F_GET_TEXTDESBLOQ(SSEGURO, TMOTMOV, NBLOQUEO);
						logger.debug(map);
						// formdata.put("TTEXTO", tratarRETURNyMENSAJES(request, map));
						formdata.put("TTEXTO2", tratarRETURNyMENSAJES(request, map));

					}
				}

				if (CMOTMOV == null) {
					CMOTMOV = this.getCampoNumerico(request, "pCMOTMOV");
				}
				// Bug 27766
				// map= pacIaxBloqueo.ejecutaPAC_IAX_BLOQUEO__F_GET_PIGNORADORES(SSEGURO,
				// CMOTMOV, modo, NMOVIMI);
				if (modo.equals("ALTA_BENEF") || modo.equals("ELIMINAR_BENEF")) {
					map = pacIaxBloqueo.ejecutaPAC_IAX_BLOQUEO__F_GET_PIGNORADORES(SSEGURO, CMOTMOV, modo, NMOVIMI);
				} else {
					map = pacIaxBloqueo.ejecutaPAC_IAX_BLOQUEO__F_GET_PIGNORADORES(SSEGURO, CMOTMOV, null, NMOVIMI);
				}
				logger.debug("map" + map);
				formdata.put("LSTSPERSON", tratarRETURNyMENSAJES(request, map));

			}

			/* Inicializamos una propuesta de suplemento para meter alli la documentaci�n */
			BigDecimal SSEGURO_OUT = null;
			BigDecimal pNMOVIMI_OUT = null;
			BigDecimal SSEGURO_REI = null;
			BigDecimal pNMOVIMI_REI = null;

			if (PRIMERA.intValue() == 1) {
				PAC_IAX_GESTIONPROPUESTA pacIaxGestionPropuesta = new PAC_IAX_GESTIONPROPUESTA(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

				String CMODO = "MODIF_PROP_245";
				String CFORM = "AXISCTR034";
				String CCAMPO = "MODIF_PROP_288";
				Map map = pacIaxGestionPropuesta.ejecutaPAC_IAX_GESTIONPROPUESTA__F_INICIALIZAR_MODIFICACION(SSEGURO,
						CMODO, CFORM, CCAMPO);
				logger.debug("*********************************************************** map 0 " + map);

				if (BigDecimal.ZERO.equals(tratarRETURNyMENSAJES(request, map))) {
					logger.debug("*********************************************************** map " + map);
					AbstractDispatchAction.topPila(request, "SSEGURO", map.get("OESTSSEGURO"));
					AbstractDispatchAction.topPila(request, "MOVIMI", map.get("ONMOVIMI"));
				}

				SSEGURO_OUT = (BigDecimal) map.get("OESTSSEGURO");
				pNMOVIMI_OUT = (BigDecimal) map.get("ONMOVIMI");

				Map map2 = pacIaxSuplementos.ejecutaPAC_IAX_SUPLEMENTOS__F_INS_EST_SUSPENSION(
						(BigDecimal) map.get("OESTSSEGURO"), (BigDecimal) map.get("ONMOVIMI"), v_motmov);
			} else if ("BOT_REINICIAR_141".equals(TMOTMOV)) {

				// String CMODO = "MODIF_PROP_245";
				String CMODO = "SUPLEMENTO_141";
				String CFORM = "AXISCTR034";
				String CCAMPO = "MODIF_PROP_288";

				Map m = pacIaxProduccion.ejecutaPAC_IAX_PRODUCCION__F_GET_DATPOLIZA(null);
				logger.debug("DATOS POLIZA: " + m);
				tratarRETURNyMENSAJES(request, m);
				Map datos_poliza = (Map) m.get("RETURN");
				SSEGURO_REI = (BigDecimal) datos_poliza.get("SSEGURO");// cambio damian inicio
				pNMOVIMI_REI = null;

				Map m8 = pacIaxProduccion.ejecutaPAC_IAX_PRODUCCION__F_GET_DATPOLIZA(SSEGURO);
				PAC_IAX_GESTIONPROPUESTA pacIaxGestionPropuesta = new PAC_IAX_GESTIONPROPUESTA(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
				logger.debug("DATOS POLIZA: " + m8);

				Map m9 = pacIaxGestionPropuesta.ejecutaPAC_IAX_GESTIONPROPUESTA__F_GET_REI_NMOVIMI(SSEGURO_REI,
						CMOTMOV);
				logger.debug("DATOS POLIZA: " + m9);
				tratarRETURNyMENSAJES(request, m9);
				// Map outNmovimi = (Map) ;

				Map map2 = pacIaxSuplementos.ejecutaPAC_IAX_SUPLEMENTOS__F_INS_EST_SUSPENSION(SSEGURO_REI,
						(BigDecimal) m9.get("OUTNMOVIMI"), CMOTMOV);
				tratarRETURNyMENSAJES(request, map2);
			} else {
				// SSEGURO_OUT = (BigDecimal) AbstractDispatchAction.topPila(request,
				// "SSEGURO");
				SSEGURO_OUT = getCampoNumerico(request, "SSEGURO_OUT");

				pNMOVIMI_OUT = (BigDecimal) AbstractDispatchAction.topPila(request, "MOVIMI");
				SSEGURO_REI = getCampoNumerico(request, "SSEGURO_REI");// conf786
				pNMOVIMI_REI = (BigDecimal) AbstractDispatchAction.topPila(request, "MOVIMI");// cambio damian fin

			}
			logger.debug("SSEGURO_OUT: " + SSEGURO_OUT);
			formdata.put("SSEGURO_OUT", SSEGURO_OUT);
			formdata.put("SSEGURO_REI", SSEGURO_REI);// Conf786
			logger.debug("pNMOVIMI_OUT: " + pNMOVIMI_OUT);

			Map m = pacIaxProduccion.ejecutaPAC_IAX_PRODUCCION__F_GET_DATPOLIZA(null);
			logger.debug("DATOS POLIZA: " + m);
			tratarRETURNyMENSAJES(request, m);
			Map datos_poliza = (Map) m.get("RETURN");

			BigDecimal SPRODUC = (BigDecimal) AbstractDispatchAction.topPila(request, "SPRODUC");
			if (SPRODUC == null) {
				m = pacIaxProduccion.ejecutaPAC_IAX_PRODUCCION__F_GET_PRODUCTO();
				logger.debug(m);
				SPRODUC = (BigDecimal) tratarRETURNyMENSAJES(request, m);
			}

			// BigDecimal SSEGURO_OUT = (BigDecimal)map.get("OESTSSEGURO");
			// BigDecimal pCACTIVI_OUT = new BigDecimal(0);
			BigDecimal pCACTIVI_OUT = (datos_poliza.get("CACTIVI") != null) ? (BigDecimal) datos_poliza.get("CACTIVI")
					: null;
			// BigDecimal pNMOVIMI_OUT = (BigDecimal)map.get("ONMOVIMI");

			/* conf786 inicio */
			if ("BOT_REINICIAR_141".equals(TMOTMOV)) {////////////// cambio damian inicio
				Map mdocrequi = pacIaxProduccion.ejecutaPAC_IAX_PRODUCCION__F_LEEDOCREQUERIDA(SPRODUC, SSEGURO_REI,
						pCACTIVI_OUT, pNMOVIMI_REI);
				formdata.put("pCMOTMOV", CMOTMOV);
				logger.debug("ejecutaPAC_IAX_PRODUCCION__F_LEEDOCREQUERIDA:" + mdocrequi);
				request.setAttribute("docu_requerida", tratarRETURNyMENSAJES(request, mdocrequi, false));
			} else {
				Map mdocrequi = pacIaxProduccion.ejecutaPAC_IAX_PRODUCCION__F_LEEDOCREQUERIDA(SPRODUC, SSEGURO_OUT,
						pCACTIVI_OUT, pNMOVIMI_OUT);
				formdata.put("pCMOTMOV", CMOTMOV);
				logger.debug("ejecutaPAC_IAX_PRODUCCION__F_LEEDOCREQUERIDA:" + mdocrequi);
				request.setAttribute("docu_requerida", tratarRETURNyMENSAJES(request, mdocrequi, false));
			} ////////////// conf786 fin
			// Map mdocrequi =
			// pacIaxProduccion.ejecutaPAC_IAX_PRODUCCION__F_LEEDOCREQUERIDA(SPRODUC,
			// SSEGURO_OUT, pCACTIVI_OUT, pNMOVIMI_OUT);
			// formdata.put("pCMOTMOV", CMOTMOV);
			// logger.debug("ejecutaPAC_IAX_PRODUCCION__F_LEEDOCREQUERIDA:"+ mdocrequi);
			// request.setAttribute("docu_requerida",tratarRETURNyMENSAJES(request,
			// mdocrequi, false));

			if ("axis.noNew".equals(formdata.get("MODO"))) {
				formdata.put("isNew", "false");
			} else {
				formdata.put("isNew", "true");

			}
			if (!"true".equals(formdata.get("isNew"))) {

				String TTEXTO_GET = getCampoTextual(request, "TTEXTO");
				BigDecimal SSEGURO_GET = getCampoNumerico(request, "SSEGURO");
				BigDecimal NCOLATER_GET = getCampoNumerico(request, "NCOLATER");
				BigDecimal NRANGO_GET = getCampoNumerico(request, "NRANGO");
				BigDecimal SPERSON_GET = getCampoNumerico(request, "SPERSON");
				BigDecimal CUSUMOV_GET = getCampoNumerico(request, "CUSUMOV");
				BigDecimal NMOVIMI_GET = getCampoNumerico(request, "NMOVIMI");
				BigDecimal CTIPO_GET = getCampoNumerico(request, "CTIPO");
				String TRANGO_GET = getCampoTextual(request, "TRANGO");

				java.util.Date FINICIO_GET = null;
				if (formdata.get("FINICIO") != null && formdata.get("FINICIO") instanceof java.util.Date) {

					FINICIO_GET = (java.util.Date) formdata.get("FINICIO");
				} else if (formdata.get("FINICIO") instanceof String) {

					String date = (String) formdata.get("FINICIO");
					try {
						SimpleDateFormat dt = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.S");
						FINICIO_GET = dt.parse(date);

					} catch (Exception e) {
						SimpleDateFormat dt = new SimpleDateFormat("yyyy-MM-dd");
						FINICIO_GET = dt.parse(date);
					}
				}

				formdata.put("TTEXTO", TTEXTO_GET);
				formdata.put("NRANGO", NRANGO_GET);
				formdata.put("SPERSON", SPERSON_GET);
				formdata.put("CUSUMOV", CUSUMOV_GET);
				formdata.put("FINICIO", FINICIO_GET);
				formdata.put("NCOLATER", NCOLATER_GET);
				formdata.put("NMOVIMI", NMOVIMI_GET);
				formdata.put("CTIPOCAUSA", CTIPO_GET);

				formdata.put("TTEXTO_ANT", TTEXTO_GET);
				formdata.put("NRANGO_ANT", NRANGO_GET);
				formdata.put("SPERSON_ANT", SPERSON_GET);
				formdata.put("CUSUMOV_ANT", CUSUMOV_GET);
				formdata.put("FINICIO_ANT", FINICIO_GET);
				formdata.put("NCOLATER_ANT", NCOLATER_GET);
				formdata.put("NMOVIMI_ANT", NMOVIMI_GET);
				formdata.put("SSEGURO_ANT", SSEGURO_GET);

			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr069Service - m�todo m_form", e);
			AbstractDispatchAction.guardarMensaje(request,
					"verbatim:<b>" + e.getClass().getName() + ":</b> " + e.getLocalizedMessage(),
					new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));

		}
	}

	/*********************************************************************************************************************/
	/************************************************
	 * M�TODOS DE ACTUALIZACI�N
	 *******************************************/
	/*********************************************************************************************************************/

	/**
	 * 
	 * @param request
	 */
	public void m_aceptar(HttpServletRequest request) {
		logger.debug("Axisctr069Service m_aceptar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {
			HashMap aviso = this.f_Get_Avisos(request, this.whoami(this));
			BigDecimal pRETURN = (BigDecimal) this.tratarRETURNyMENSAJES(request, aviso);
			request.setAttribute("PLSTAVISOS", aviso.get("PLSTAVISOS"));
			if (pRETURN != null && pRETURN.intValue() != 1) {
				PAC_IAX_BLOQUEO pacIaxBloqueo = new PAC_IAX_BLOQUEO(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
				PAC_IAX_SUSPENSION pacIaxSuspension = new PAC_IAX_SUSPENSION(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

				BigDecimal SSEGURO = getCampoNumerico(request, "SSEGURO");
				String TMOTMOV = getCampoTextual(request, "TMOTMOV");
				Date FINICIO = stringToSqlDate(getCampoTextual(request, "FINICIO"));
				Date FFINAL = stringToSqlDate(getCampoTextual(request, "FFINAL"));
				String TTEXTO = getCampoTextual(request, "TTEXTO");
				String TTEXTO2 = getCampoTextual(request, "TTEXTO2");

				BigDecimal NCAUSA = BigDecimal.ZERO;
				if (getCampoNumerico(request, "NCAUSA") != null) {
					NCAUSA = getCampoNumerico(request, "NCAUSA");
				}

				BigDecimal IIMPORTE = BigDecimal.ZERO;
				if (getCampoNumerico(request, "IIMPORTE") != null) {
					IIMPORTE = getCampoNumerico(request, "IIMPORTE");
				}

				BigDecimal SPERSON = BigDecimal.ZERO;
				if (getCampoNumerico(request, "SPERSON") != null) {
					SPERSON = getCampoNumerico(request, "SPERSON");
				}

				BigDecimal SPERSON263 = BigDecimal.ZERO;
				if (getCampoNumerico(request, "SPERSON263") != null) {
					SPERSON263 = getCampoNumerico(request, "SPERSON263");
				}

				Map map = new HashMap();
				// bug_27766 a�ado nuevos campos a la p�gina

				BigDecimal COPCIONAL;
				if (getCampoNumerico(request, "COPCIONAL") == null) {
					COPCIONAL = BigDecimal.ZERO;
				} else {
					COPCIONAL = getCampoNumerico(request, "COPCIONAL");
				}

				BigDecimal NCOLATER = BigDecimal.ZERO;
				if (getCampoNumerico(request, "NCOLATER") != null) {
					NCOLATER = getCampoNumerico(request, "NCOLATER");
				}

				BigDecimal NRANGO = BigDecimal.ZERO;
				if (getCampoNumerico(request, "NRANGO") != null) {
					NRANGO = getCampoNumerico(request, "NRANGO");
				}

				String MODO = getCampoTextual(request, "LMODO");

				BigDecimal NMOVIMI = BigDecimal.ZERO;
				if (getCampoNumerico(request, "NMOVIMI") != null) {
					NMOVIMI = getCampoNumerico(request, "NMOVIMI");
				}

				if ("BOT_DESPIGNORAR".equals("TMOTMOV")) {
					SPERSON = SPERSON263;
				}

				if (!isEmpty(TMOTMOV) && ("BOT_REINICIAR".equals(TMOTMOV) || "BOT_SUSPENDER".equals(TMOTMOV)))
					map = pacIaxSuspension.ejecutaPAC_IAX_SUSPENSION__F_SET_MOV(SSEGURO, TMOTMOV, FINICIO, FFINAL,
							TTEXTO, TTEXTO2);
				else

				if ("true".equals(formdata.get("isNew"))) {

					map = pacIaxBloqueo.ejecutaPAC_IAX_BLOQUEO__F_SET_MOV(SSEGURO, TMOTMOV, FINICIO, FFINAL, TTEXTO,
							TTEXTO2, IIMPORTE, SPERSON, COPCIONAL, NRANGO, NCOLATER, NMOVIMI, MODO, NCAUSA);
				} else {
					String TTEXTO_ANT = getCampoTextual(request, "TTEXTO_ANT");

					BigDecimal NCOLATER_ANT = getCampoNumerico(request, "NCOLATER_ANT");
					BigDecimal NRANGO_ANT = getCampoNumerico(request, "NRANGO_ANT");
					BigDecimal SPERSON_ANT = getCampoNumerico(request, "SPERSON_ANT");
					Date FINICIO_ANT = stringToSqlDate(getCampoTextual(request, "FINICIO_ANT"));
					map = pacIaxBloqueo.ejecutaPAC_IAX_BLOQUEO__F_UPDATE_PLEDGED(SSEGURO, "261", NMOVIMI, TTEXTO_ANT,
							SPERSON_ANT, NRANGO_ANT, NCOLATER_ANT, FINICIO_ANT, TTEXTO, SPERSON, NRANGO, NCOLATER,
							FINICIO);
				}

				logger.debug(map);
				request.setAttribute("guardarOK", BigDecimal.ZERO.equals(tratarRETURNyMENSAJES(request, map)));

				if (!request.getAttribute("guardarOK").equals("true")) {
					formdata.put("NMOVIMI", formdata.get("NMOVIMI"));

				}

				if (map.get("RETURN").equals(new BigDecimal(0))) {

					formdata.put("IMP", "impOk");

				}

				/*
				 * if(request.getAttribute("guardarOK").equals(0)){
				 * formdata.put("NMOVIMI",formdata.get("NMOVIMI"));
				 * 
				 * 
				 * }
				 */

				String mensj = (String) ((Map) ((Map) ((List) map.get("MENSAJES")).get(0)).get("OB_IAX_MENSAJES"))
						.get("TERROR");

				request.setAttribute("MENSAJE", mensj.replace("'", "�"));

				formdata.put("IIMPORTE", IIMPORTE);
			}
			// m_ajax_deleteTemporales(request);
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr069Service - m�todo m_aceptar", e);
			AbstractDispatchAction.guardarMensaje(request,
					"verbatim:<b>" + e.getClass().getName() + ":</b> " + e.getLocalizedMessage(),
					new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));

	}

	/**
	 * Added for back button (IAXIS-4321) PK-16/06/2019 Start
	 */
	public void m_anterior(HttpServletRequest request, AbstractDispatchAction thisAction) {
		logger.debug("Axisctr024Service m_anterior");
		try {
			if (!Boolean.valueOf(true).equals(request.getAttribute("multiPantalla")))
				request.setAttribute(Constantes.FORWARDACTION,
						AxisCodeWizard.findForward(request, Constantes.ANTERIOR, whoami(this), null));
		} catch (Exception e) {
			AbstractDispatchAction.guardarMensaje(request, "1000050", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
			this.f_Cargar_Propiedades_Pantalla(request, AxisBaseService.whoami(this));
		}
	}

	/** Added for back button (IAXIS-4321) PK-16/06/2019 End */

	public void ajax_adjuntar(HttpServletRequest request, Axisctr069Action thisAction) {
		logger.debug("Axisadm004Service ajax_adjuntar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		boolean trobat = false;
		try {
			BigDecimal pSEQDOCU = getCampoNumerico(request, "SEQDOCU") != null ? getCampoNumerico(request, "SEQDOCU")
					: null;
			BigDecimal pCDOCUME = getCampoNumerico(request, "CDOCUME");
			BigDecimal pCCLASE = getCampoNumerico(request, "CCLASE");
			BigDecimal pNORDEN = getCampoNumerico(request, "NORDEN");
			BigDecimal pPADJUNTADO = getCampoNumerico(request, "checked");

			// bug RSC 27/11/2012
			BigDecimal pNRIESGO = getCampoNumerico(request, "NRIESGO");
			BigDecimal pSPERSON = getCampoNumerico(request, "SPERSON");
			// fi bug RSC 27/11/2012

			String pPTFILENAME, pPTDESCRIP = null;
			BigDecimal pPNRIESGO, pPNINQAVAL, pPCDOCUME, pPCTIPDOC, pPCCLASE, pPNORDEN, pPSEQDOCU, pPSPERSON = null,
					pPCTIPBEN;

			PAC_IAX_PRODUCCION pacIaxProduccion = new PAC_IAX_PRODUCCION(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			Map mdocrequi = null;
			Map m = pacIaxProduccion.ejecutaPAC_IAX_PRODUCCION__F_GET_DATPOLIZA(null);
			tratarRETURNyMENSAJES(request, m);
			Map datos_poliza = (Map) m.get("RETURN");
			BigDecimal SPRODUC = (BigDecimal) AbstractDispatchAction.topPila(request, "SPRODUC");
			if (SPRODUC == null) {
				m = pacIaxProduccion.ejecutaPAC_IAX_PRODUCCION__F_GET_PRODUCTO();
				logger.debug(m);
				SPRODUC = (BigDecimal) tratarRETURNyMENSAJES(request, m);
			}

			BigDecimal SSEGURO_OUT = (BigDecimal) AbstractDispatchAction.topPila(request, "SSEGURO");
			BigDecimal pNMOVIMI_OUT = (BigDecimal) AbstractDispatchAction.topPila(request, "NMOVIMI");
			// BigDecimal pCACTIVI_OUT = new BigDecimal(0);
			BigDecimal pCACTIVI_OUT = (datos_poliza.get("CACTIVI") != null) ? (BigDecimal) datos_poliza.get("CACTIVI")
					: null;
			mdocrequi = pacIaxProduccion.ejecutaPAC_IAX_PRODUCCION__F_LEEDOCREQUERIDA(SPRODUC, SSEGURO_OUT,
					pCACTIVI_OUT, pNMOVIMI_OUT);

			if (mdocrequi.get("RETURN") != null) {
				List documents = (List) tratarRETURNyMENSAJES(request, mdocrequi, false);
				if (documents.size() > 0) {
					for (int i = 0; documents.size() > i; i++) {
						if (documents.get(i) != null) {
							if (((HashMap) (documents.get(i))).get("OB_IAX_DOCREQUERIDA") != null) {
								if (((HashMap) (((HashMap) (documents.get(i))).get("OB_IAX_DOCREQUERIDA")))
										.get("CDOCUME") != null) {
									if (pSEQDOCU != null) {
										if (pSEQDOCU.equals(
												((HashMap) (((HashMap) (documents.get(i))).get("OB_IAX_DOCREQUERIDA")))
														.get("SEQDOCU"))) {
											trobat = true;
										}
									} else if (pCDOCUME.equals(
											((HashMap) (((HashMap) (documents.get(i))).get("OB_IAX_DOCREQUERIDA")))
													.get("CDOCUME"))) {
										if (pCCLASE.equals(
												((HashMap) (((HashMap) (documents.get(i))).get("OB_IAX_DOCREQUERIDA")))
														.get("CCLASE"))) {
											if (pNORDEN.equals(((HashMap) (((HashMap) (documents.get(i)))
													.get("OB_IAX_DOCREQUERIDA"))).get("NORDEN"))) {

												// bug RSC 27/11/2012
												if (pNRIESGO != null) {
													if (pNRIESGO.equals(((HashMap) (((HashMap) (documents.get(i)))
															.get("OB_IAX_DOCREQUERIDA"))).get("NRIESGO"))) {

														if (pSPERSON != null) {
															if (pSPERSON
																	.equals(((HashMap) (((HashMap) (documents.get(i)))
																			.get("OB_IAX_DOCREQUERIDA")))
																			.get("SPERSON"))) {

																trobat = true;
															}
														} else {
															trobat = true;
														}
													}
												} else {
													trobat = true;
												}
											}
										}
									}
									if (trobat) {
										trobat = false;
										pPTFILENAME = ((HashMap) (((HashMap) (documents.get(i)))
												.get("OB_IAX_DOCREQUERIDA"))).get("TFILENAME") != null
														? (String) ((HashMap) (((HashMap) (documents.get(i)))
																.get("OB_IAX_DOCREQUERIDA"))).get("TFILENAME")
														: null;
										pPTDESCRIP = ((HashMap) (((HashMap) (documents.get(i)))
												.get("OB_IAX_DOCREQUERIDA"))).get("TDESCRIP") != null
														? (String) ((HashMap) (((HashMap) (documents.get(i)))
																.get("OB_IAX_DOCREQUERIDA"))).get("TDESCRIP")
														: null;
										pPNRIESGO = ((HashMap) (((HashMap) (documents.get(i)))
												.get("OB_IAX_DOCREQUERIDA"))).get("NRIESGO") != null
														? (BigDecimal) ((HashMap) (((HashMap) (documents.get(i)))
																.get("OB_IAX_DOCREQUERIDA"))).get("NRIESGO")
														: null;
										pPNINQAVAL = ((HashMap) (((HashMap) (documents.get(i)))
												.get("OB_IAX_DOCREQUERIDA"))).get("NINQAVAL") != null
														? (BigDecimal) ((HashMap) (((HashMap) (documents.get(i)))
																.get("OB_IAX_DOCREQUERIDA"))).get("NINQAVAL")
														: null;
										pPCDOCUME = ((HashMap) (((HashMap) (documents.get(i)))
												.get("OB_IAX_DOCREQUERIDA"))).get("CDOCUME") != null
														? (BigDecimal) ((HashMap) (((HashMap) (documents.get(i)))
																.get("OB_IAX_DOCREQUERIDA"))).get("CDOCUME")
														: null;
										pPCTIPDOC = ((HashMap) (((HashMap) (documents.get(i)))
												.get("OB_IAX_DOCREQUERIDA"))).get("CTIPDOC") != null
														? (BigDecimal) ((HashMap) (((HashMap) (documents.get(i)))
																.get("OB_IAX_DOCREQUERIDA"))).get("CTIPDOC")
														: null;
										pPCCLASE = ((HashMap) (((HashMap) (documents.get(i)))
												.get("OB_IAX_DOCREQUERIDA"))).get("CCLASE") != null
														? (BigDecimal) ((HashMap) (((HashMap) (documents.get(i)))
																.get("OB_IAX_DOCREQUERIDA"))).get("CCLASE")
														: null;
										pPNORDEN = ((HashMap) (((HashMap) (documents.get(i)))
												.get("OB_IAX_DOCREQUERIDA"))).get("NORDEN") != null
														? (BigDecimal) ((HashMap) (((HashMap) (documents.get(i)))
																.get("OB_IAX_DOCREQUERIDA"))).get("NORDEN")
														: null;
										pPSEQDOCU = ((HashMap) (((HashMap) (documents.get(i)))
												.get("OB_IAX_DOCREQUERIDA"))).get("SEQDOCU") != null
														? (BigDecimal) ((HashMap) (((HashMap) (documents.get(i)))
																.get("OB_IAX_DOCREQUERIDA"))).get("SEQDOCU")
														: null;
										pPSPERSON = ((HashMap) (((HashMap) (documents.get(i)))
												.get("OB_IAX_DOCREQUERIDA"))).get("SPERSON") != null
														? (BigDecimal) ((HashMap) (((HashMap) (documents.get(i)))
																.get("OB_IAX_DOCREQUERIDA"))).get("SPERSON")
														: null;
										pPCTIPBEN = ((HashMap) (((HashMap) (documents.get(i)))
												.get("OB_IAX_DOCREQUERIDA"))).get("CTIPBEN") != null
														? (BigDecimal) ((HashMap) (((HashMap) (documents.get(i)))
																.get("OB_IAX_DOCREQUERIDA"))).get("CTIPBEN")
														: null;

										// Map mgrabar =
										// pacIaxProduccion.ejecutaPAC_IAX_PRODUCCION__F_GRABARDOCREQUERIDA(pPSEQDOCU,
										// SPRODUC,sseguro, pCACTIVI, pNMOVIMI,pPNRIESGO,pPNINQAVAL, pPCDOCUME,
										// pPCTIPDOC, pPCCLASE, pPNORDEN, pPTDESCRIP, pPTFILENAME, pPADJUNTADO);
										Map mgrabar = pacIaxProduccion.ejecutaPAC_IAX_PRODUCCION__F_GRABARDOCREQUERIDA(
												pPSEQDOCU, SPRODUC, SSEGURO_OUT, pCACTIVI_OUT, pNMOVIMI_OUT, pPNRIESGO,
												pPNINQAVAL, pPCDOCUME, pPCTIPDOC, pPCCLASE, pPNORDEN, pPTDESCRIP,
												pPTFILENAME, pPADJUNTADO, pPSPERSON, pPCTIPBEN);

										/*
										 * if (SSEGURO_OUT != null){ mgrabar =
										 * pacIaxProduccion.ejecutaPAC_IAX_PRODUCCION__F_GRABARDOCREQUERIDA(pPSEQDOCU,
										 * SPRODUC, SSEGURO_OUT, pCACTIVI_OUT, pNMOVIMI_OUT, pPNRIESGO,pPNINQAVAL,
										 * pPCDOCUME, pPCTIPDOC, pPCCLASE, pPNORDEN, pPTDESCRIP, pPTFILENAME,
										 * pPADJUNTADO, pPSPERSON); }else{ BigDecimal MOVIMI =
										 * (BigDecimal)AbstractDispatchAction.topPila(request, "MOVIMI"); if (MOVIMI !=
										 * null){ mgrabar =
										 * pacIaxProduccion.ejecutaPAC_IAX_PRODUCCION__F_GRABARDOCREQUERIDA(pPSEQDOCU,
										 * SPRODUC,sseguro, pCACTIVI, MOVIMI, pPNRIESGO, pPNINQAVAL, pPCDOCUME,
										 * pPCTIPDOC, pPCCLASE, pPNORDEN, pPTDESCRIP, pPTFILENAME, pPADJUNTADO,
										 * pPSPERSON); }else{ mgrabar =
										 * pacIaxProduccion.ejecutaPAC_IAX_PRODUCCION__F_GRABARDOCREQUERIDA(pPSEQDOCU,
										 * SPRODUC,sseguro, pCACTIVI, pNMOVIMI,pPNRIESGO,pPNINQAVAL, pPCDOCUME,
										 * pPCTIPDOC, pPCCLASE, pPNORDEN, pPTDESCRIP, pPTFILENAME, pPADJUNTADO,
										 * pPSPERSON); } }
										 */
										i = documents.size();
									}
								}
							}
						}
					}
				}
			}

			logger.debug("ejecutaPAC_IAX_PRODUCCION__F_LEEDOCREQUERIDA:" + mdocrequi);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisper005Service - m�todo ajax_adjuntar", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	public void m_ajax_deleteTemporales(HttpServletRequest request) {
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		BigDecimal PRIMERA = (getCampoNumerico(request, "pPRIMERA") != null) ? getCampoNumerico(request, "pPRIMERA")
				: (BigDecimal) formdata.get("pPRIMERA");
		BigDecimal SSEGURO_OUT = (getCampoNumerico(request, "SSEGURO_OUT") != null)
				? getCampoNumerico(request, "SSEGURO_OUT")
				: null;
		logger.debug("deleteTemporales, PRIMERA " + PRIMERA + " SSEGURO" + SSEGURO_OUT);
		AjaxContainerService ajax = new AjaxContainerService();
		try {
			if ((PRIMERA == null ? 0 : PRIMERA.intValue()) == 1 && SSEGURO_OUT != null) {
				PAC_IAX_GESTIONPROPUESTA pacIaxGestionPropuesta = new PAC_IAX_GESTIONPROPUESTA(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

				Map map = pacIaxGestionPropuesta.ejecutaPAC_IAX_GESTIONPROPUESTA__LIMPIARTEMPORALES(SSEGURO_OUT);

			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			logger.error("Error en deleteTemporales, PRIMERA " + PRIMERA + " SSEGURO" + SSEGURO_OUT, e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}
	// CONF-274- 20161125 -JLTS - Ini

	public void m_siguiente(HttpServletRequest request, Axisctr069Action thisAction) {
		logger.debug("Axisctr069Service m_siguiente");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		// BUG: 24685 2012-02-06 AEG preimpresos
		try {
			HashMap aviso = this.f_Get_Avisos(request, this.whoami(this));
			BigDecimal pRETURN = (BigDecimal) this.tratarRETURNyMENSAJES(request, aviso);
			request.setAttribute("PLSTAVISOS", aviso.get("PLSTAVISOS"));

			Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
			formdata.put("NDIAS_SUSP", getCampoNumerico(request, "NDIAS_SUSP"));

			if (!Boolean.valueOf(true).equals(request.getAttribute("multiPantalla")))
				// No hace falta buscar el forward si estamos en multi-pantalla, lo buscar� la
				// AXCTR027
				request.setAttribute(Constantes.FORWARDACTION,
						AxisCodeWizard.findForward(request, Constantes.SIGUIENTE, whoami(this), null));
		} catch (Exception e) {
			// logger.error("Error en el servicio Axisctr004Service - m�todo m_validar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);

			// Gesti�n de campos y dependencias
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
		m_guardarReinicio(request, thisAction);
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	public void m_guardarReinicio(HttpServletRequest request, AbstractDispatchAction thisAction) {
		logger.debug("Axisctr069Service m_guardarReinicio");

		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {

			PAC_IAX_PRODUCCION pac_iax_produccion = new PAC_IAX_PRODUCCION(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			BigDecimal SSEGURO = getCampoNumerico(request, "SSEGURO");
			logger.debug("SSEGURO-" + SSEGURO);
			BigDecimal SSEGURO_OUT = (BigDecimal) AbstractDispatchAction.topPila(request, "SSEGURO_OUT");
			logger.debug("SSEGURO_OUT" + SSEGURO_OUT);
			Date FINICIO = AxisBaseService.stringToSqlDate(getCampoTextual(request, "FINICIO"));
			logger.debug("FINICIO-" + FINICIO);
			Date FFINAL = AxisBaseService.stringToSqlDate(getCampoTextual(request, "FFINAL"));
			logger.debug("FFINAL-" + FFINAL);
			String TTEXTO2 = this.getCampoTextual(request, "TTEXTO2");
			logger.debug("TTEXTO2-" + TTEXTO2);
			BigDecimal CMOTMOV = getCampoNumerico(request, "pCMOTMOV");
			logger.debug("CMOTMOV-" + CMOTMOV);
			BigDecimal NMOVIMI = getCampoNumerico(request, "NMOVIMI");
			logger.debug("NMOVIMI-" + NMOVIMI);

			Map map = // seleccionar
					pac_iax_produccion.ejecutaPAC_IAX_PRODUCCION__F_SET_REINICIO(SSEGURO_OUT, FINICIO, FFINAL, TTEXTO2,
							CMOTMOV, NMOVIMI);
			logger.debug(map);
		}

		catch (Exception e) {
			// logger.error("Error en el servicio Axisctr669Service - m�todo
			// m_guardarReinicio", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {

			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));

		}

	}

	// CONF-274- 20161125 -JLTS - Fin
}
