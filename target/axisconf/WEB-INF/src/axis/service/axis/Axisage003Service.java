//Revision:# 6Lg1fjFFTc1A4ehrVi6c5A== #
package axis.service.axis;

import java.math.BigDecimal;
import java.sql.Date;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.csi_ti.security.aes.AESUtil;

import axis.jdbc.PAC_IAX_AGE_DATOS;
import axis.jdbc.PAC_IAX_AGE_PROPIEDADES;
import axis.jdbc.PAC_IAX_AVISOS;
import axis.jdbc.PAC_IAX_COMMON;
import axis.jdbc.PAC_IAX_DESCVALORES;
import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.jdbc.PAC_IAX_PARAM;
import axis.jdbc.PAC_IAX_PERSONA;
import axis.jdbc.PAC_IAX_REDCOMERCIAL;
import axis.jdbc.PAC_IAX_SIN_AGENTES;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.control.axis.Axisage003Action;
import axis.mvc.model.UsuarioBean;
import axis.util.Constantes;

/**
 * Axisage003Service.java 22/12/2008
 * 
 * @author <a href="rkirchner@csi-ti.com">Roger Kirchner</a>
 * @since Java 5.0
 */
public class Axisage003Service extends AxisBaseService {
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
	@SuppressWarnings("all")
	public void m_form(HttpServletRequest request) {
		logger.debug("Axisage003Service m_form");

		try {
			// Inici bug 20388
			String CMODO = (String) AbstractDispatchAction.topPila(request, "CMODO");
			String CSUB_INF = (String) AbstractDispatchAction.topPila(request, "CSUB_INF");
			if ((CSUB_INF == null) || (!CSUB_INF.equals("1"))) {
				AbstractDispatchAction.topPila(request, "CSUB_INF", "1");
				AbstractDispatchAction.topPila(request, "CMODO_SUB", CMODO);
			} else {
				String CMODO_SUB = (String) AbstractDispatchAction.topPila(request, "CMODO_SUB");
				AbstractDispatchAction.topPila(request, "CMODO", CMODO_SUB);
			}
			// Fi bug 20388

			UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
			Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
			formdata.put("CMODO", CMODO);

			BigDecimal CAGENTE_SIN = getCampoNumerico(request, "CAGENTE_SIN");
			if (isEmpty(CAGENTE_SIN) && !isEmpty(request.getParameter("CAGENTE_SIN")))
				CAGENTE_SIN = new BigDecimal(String.valueOf(request.getParameter("CAGENTE_SIN")));
			BigDecimal CAGENTE = getCampoNumerico(request, "CAGENTE");
			if (!isEmpty(CAGENTE_SIN)) {
				CAGENTE = CAGENTE_SIN;
				formdata.put("CAGENTE", CAGENTE);
			}

			BigDecimal RED_DummyCodeAgent = (BigDecimal) request.getSession().getAttribute("RED_DummyCodeAgent");

			String isEdit = getCampoTextual(request, "isEdit");
			if ((isEmpty(isEdit)) && (request.getAttribute("isEdit") != null)) {
				isEdit = (String) request.getAttribute("isEdit");
			}
			if (RED_DummyCodeAgent != null && RED_DummyCodeAgent.equals(CAGENTE))
				CAGENTE = BigDecimal.ONE;

			/* LISTVALORES */
			PAC_IAX_LISTVALORES pac_iax_listvalores = new PAC_IAX_LISTVALORES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			PAC_IAX_REDCOMERCIAL pac_iax_redcomercial = new PAC_IAX_REDCOMERCIAL(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			PAC_IAX_AGE_PROPIEDADES pac_iax_age_propiedades = new PAC_IAX_AGE_PROPIEDADES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			PAC_IAX_DESCVALORES pac_iax_descvalores = new PAC_IAX_DESCVALORES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			PAC_IAX_SIN_AGENTES pac_iax_sin_agentes = new PAC_IAX_SIN_AGENTES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));// bfp bug 21524
			Map LISTVALORES = new HashMap();

			Map AGENTE = new HashMap();
			BigDecimal CEMPRES = null;
			logger.debug("CAGENTE : " + CAGENTE);
			logger.debug("isEdit : " + isEdit);
			if (!isEmpty(CAGENTE) && !isEmpty(isEdit)) {
				/* Cargar datos agente */
				Map map = pac_iax_redcomercial.ejecutaPAC_IAX_REDCOMERCIAL__F_GET_DATOSAGENTE(CAGENTE);
				logger.debug(map);
				tratarRETURNyMENSAJES(request, map, false);

				AGENTE = (Map) map.get("AGENTE");
				formdata.put("CONTRATOS", map.get("CONTRATOS"));
				formdata.put("contratoOK", false);

				/* Cargar hist�rico red comercial */
				if (!isEmpty(map.get("CONTRATOS"))) {
					Map OB_IAX_CONTRATOS = (Map) ((List) map.get("CONTRATOS")).get(0);
					if (!isEmpty(OB_IAX_CONTRATOS)) {
						OB_IAX_CONTRATOS = (Map) OB_IAX_CONTRATOS.get("OB_IAX_CONTRATOS");
						if (!isEmpty(OB_IAX_CONTRATOS)) {
							// Cargar el hist�rico de la empresa seleccionada. Si no hay ninguna, cargar el
							// hist�rico de la primera empresa del multireg. de CONTRATOS
							CEMPRES = !isEmpty(formdata.get("CEMPRES"))
									? new BigDecimal((String) formdata.get("CEMPRES"))
									: usuario.getCempres();
							map = pac_iax_redcomercial.ejecutaPAC_IAX_REDCOMERCIAL__F_GET_REDCOMERCIAL(CAGENTE,
									CEMPRES);
							logger.debug(map);
							formdata.put("HISTORICO", tratarRETURNyMENSAJES(request, map, false));
							formdata.put("CEMPRES", CEMPRES);
							formdata.put("contratoOK", true);
						}
					}
				}

				/* Cargamos los contactos */
				Map m = pac_iax_redcomercial.ejecutaPAC_IAX_REDCOMERCIAL__F_GET_CONTACTOSAGE(CAGENTE);
				logger.debug("---> contactos:" + m);
				formdata.put("CONTACTOS", tratarRETURNyMENSAJES(request, m, false));

				/* Cargamos los documentos */
				m = pac_iax_redcomercial.ejecutaPAC_IAX_REDCOMERCIAL__F_GET_DOCUMENTACION(CAGENTE);
				logger.debug("----> documentos:" + m);
				tratarRETURNyMENSAJES(request, m);
				formdata.put("DOCUMENTOS", m.get("PTDOCAGENTE"));

				m = pac_iax_age_propiedades.ejecutaPAC_IAX_AGE_PROPIEDADES__F_GET_PARAGENTE(CAGENTE, new BigDecimal(0));
				logger.debug("----> propiedades:" + m);
				tratarRETURNyMENSAJES(request, m);
				formdata.put("PROPIEDADES", m.get("PCUR"));
				// bfp bug 21524 ini
				/* Recuperamos informacion de los actores del siniestro */
				/* LST AGENTES */
				PAC_IAX_SIN_AGENTES lst_agentes = new PAC_IAX_SIN_AGENTES(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
				java.util.Date FECHA_INIT = new java.util.Date();
				Date FECHA = new Date(FECHA_INIT.getTime());
				Map mapa_actores = lst_agentes.ejecutaPAC_IAX_AGE_SINIESTROS__F_GET_ACTORES(FECHA, CAGENTE);
				logger.debug(mapa_actores);
				formdata.put("LSTACTORES", tratarRETURNyMENSAJES(request, mapa_actores, false));
				// bfp bug 21524 fi

				m = pac_iax_redcomercial.ejecutaPAC_IAX_REDCOMERCIAL__F_GET_DESCUENTOVIG_AGENTE(CAGENTE,
						new BigDecimal(1));
				logger.debug("----> DESCUENTOSVIG:" + m);

				if (!isEmpty(m.get("RETURN"))) {
					Map descvig = (Map) ((List) m.get("RETURN")).get(0);
					logger.debug("----> DESCUENTOSVIG:" + descvig);
					if (!isEmpty(descvig)) {
						formdata.put("CDESC", descvig.get("CDESC"));
						formdata.put("FINIVIGDESC", descvig.get("FINIVIG"));
						formdata.put("FFINVIGDESC", descvig.get("FFINVIG"));
					}
				}

				m = pac_iax_redcomercial.ejecutaPAC_IAX_REDCOMERCIAL__F_BUSCA_PADRE(null, CAGENTE, new BigDecimal(3),
						null);// Delegaci�
				logger.debug(m);
				if (!isEmpty(tratarRETURNyMENSAJES(request, m, false))) {
					formdata.put("CAGENTE_DELEGACIO", tratarRETURNyMENSAJES(request, m, false));
					formdata.put("TAGENTE_DELEGACIO", m.get("PTAGENTE"));
				}

				m = pac_iax_redcomercial.ejecutaPAC_IAX_REDCOMERCIAL__F_BUSCA_PADRE(null, CAGENTE, new BigDecimal(4),
						null);// Ejecutivo Comercial
				logger.debug(m);
				if (!isEmpty(tratarRETURNyMENSAJES(request, m, false))) {
					formdata.put("CAGENTE_EJCOMERCIAL", tratarRETURNyMENSAJES(request, m, false));
					formdata.put("TAGENTE_EJCOMERCIAL", m.get("PTAGENTE"));
				}
			} else {

				BigDecimal RESETFORM = getCampoNumerico(request, "RESETFORM");
				if (!isEmpty(RESETFORM)) {
					Map map = pac_iax_redcomercial.ejecutaPAC_IAX_REDCOMERCIAL__F_GET_DATOSAGENTE(CAGENTE);
					logger.debug("--null--" + map);
					tratarRETURNyMENSAJES(request, map, false);
					formdata.put("CAGENTE_DELEGACIO", "");
					formdata.put("TAGENTE_DELEGACIO", "");
					formdata.put("CAGENTE_EJCOMERCIAL", "");
					formdata.put("TAGENTE_EJCOMERCIAL", "");

					if (!isEmpty(map.get("AGENTE")))
						AGENTE = (Map) map.get("AGENTE");

					formdata.putAll(AGENTE);
				}

			}

			// Inicio tarefa 4077 - Borduchi

			/* LST USERS */

			// AXIS-4975

			/*
			 * BigDecimal SPERSON = !isEmpty(formdata.get("SPERSON")) ?
			 * getCampoNumerico(request, "SPERSON") : (!isEmpty(AGENTE) ? (BigDecimal)
			 * AGENTE.get("SPERSON") : null) ;
			 */

			BigDecimal SPERSON = !isEmpty(AGENTE) ? (BigDecimal) AGENTE.get("SPERSON")
					: (!isEmpty(formdata.get("SPERSON")) ? getCampoNumerico(request, "SPERSON") : null);
			// AXIS-4975
			Map map_usuarios = pac_iax_redcomercial.ejecutaPAC_IAX_REDCOMERCIAL__F_GET_USERS(SPERSON,
					usuario.getCidioma());
			logger.debug("----> usuarios:" + map_usuarios);
			tratarRETURNyMENSAJES(request, map_usuarios);
			formdata.put("USUARIOS", map_usuarios.get("RETURN"));

			// Fin tarefa 4077 - Borduchi

			/* Tratamiento datos persona */
			if (!isEmpty(SPERSON)) {

				/* Inicio Bug 41274/230805 - 23/03/2016 - AMC */
				AGENTE.put("SPERSON", SPERSON);

				/* LSTDOMIPERSON */
				Map map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTDOMIPERSON(SPERSON);
				logger.debug(map);
				LISTVALORES.put("LSTDOMIPERSON", tratarRETURNyMENSAJES(request, map, false));

				// inicio modificacion bartolo herrera 26-02-2019
				PAC_IAX_PERSONA pac_axis_persona = new PAC_IAX_PERSONA(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
				Map mapVinPer = pac_axis_persona.ejecutaPAC_IAX_PERSONA__F_GET_TIPO_VINCULACION_PERSONA(SPERSON);
				List tipoVinculacion = (List) tratarRETURNyMENSAJES(request, mapVinPer);
				String CODSUBVINCULO = "-2147483648", TTIPIVA = "";
				if (tipoVinculacion != null) {
					Map aux = (Map) tipoVinculacion.get(0);
					if (!isEmpty(aux.get("CODSUBVINCULO")))
						CODSUBVINCULO = aux.get("CODSUBVINCULO").toString();

					if (!isEmpty(aux.get("TTIPIVA")))
						TTIPIVA = aux.get("TTIPIVA").toString();
				}

				formdata.put("CTIPAGE", CODSUBVINCULO);
				formdata.put("CDESCRIIVA", TTIPIVA);

				// fin modificacion bartolo herrera 26-02-2019

				PAC_IAX_PERSONA pacIaxPersona = new PAC_IAX_PERSONA(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
				/* Recuperaci�n datos persona */
				// TCS_1569B - ACL - 01/02/2019 - Se agrega llamado a nueva funcion
				BigDecimal CTIPAGE = getCampoNumerico(request, "CTIPAGE");
				map = pacIaxPersona.ejecutaPAC_IAX_PERSONA__F_GET_PERSONA_PUBLICA_IMP(SPERSON, CTIPAGE);
				// map = pacIaxPersona.ejecutaPAC_IAX_PERSONA__F_GET_PERSONA_PUBLICA(SPERSON);
				logger.debug(map);

				if (BigDecimal.ZERO.equals(tratarRETURNyMENSAJES(request, map, false))) {
					Map OBPERSONA = (Map) map.get("OBPERSONA");

					if (!isEmpty(OBPERSONA)) {
						if (isEmpty(AGENTE))
							AGENTE = new HashMap();
						// Establecer nuevo nombre
						if (!isEmpty(OBPERSONA.get("TNOMBRE")) || !isEmpty(OBPERSONA.get("TAPELLI1")))
							AGENTE.put("TNOMBRE", (OBPERSONA.get("TAPELLI1") + " " + OBPERSONA.get("TAPELLI2") + " "
									+ OBPERSONA.get("TNOMBRE")).replaceAll("null", "").trim());

						// Establecer nuevo NIF
						if (!isEmpty(OBPERSONA.get("NNUMIDE")))
							AGENTE.put("NNIF", OBPERSONA.get("NNUMIDE"));

						// Recuperar CAGENTE de la persona, por si queremos saltar a Consulta de
						// Personas
						AGENTE.put("CAGENTE_PERSONA", OBPERSONA.get("CAGENTE"));
						// TCS_1569B - ACL - 01/02/2019 - Se agregan campos de impuestos
						if (isEmpty(AGENTE.get("CDESCRIIVA")) || AGENTE.get("CDESCRIIVA") == null
								|| AGENTE.get("CDESCRIIVA").equals("null")) {
							AGENTE.put("CDESCRIIVA", OBPERSONA.get("TSIGLAS"));
						}
						if (isEmpty(AGENTE.get("DESCRICRETENC"))) {
							AGENTE.put("DESCRICRETENC", OBPERSONA.get("TESTPERLOPD"));
						}
						if (isEmpty(AGENTE.get("DESCRIFUENTE"))) {
							AGENTE.put("DESCRIFUENTE", OBPERSONA.get("TOCUPACION"));
						}
						// Cuentas Bancarias Persona
						List<Map> CCC = new ArrayList<Map>();
						if (!isEmpty(CCC = (List) OBPERSONA.get("CCC"))) {
							for (Map OB_IAX_CCC : CCC) {
								// Formatear cada cuenta bancaria
								OB_IAX_CCC = (Map) OB_IAX_CCC.get("OB_IAX_CCC");
								BigDecimal CTIPBAN = (BigDecimal) OB_IAX_CCC.get("CTIPBAN");
								String CBANCAR = (String) OB_IAX_CCC.get("CBANCAR");

								if (!isEmpty(CTIPBAN) && !isEmpty(CBANCAR)) {
									OB_IAX_CCC.put("CBANCARFORMAT",
											tratarRETURNyMENSAJES(request, new PAC_IAX_COMMON(
													(java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
													.ejecutaPAC_IAX_COMMON__F_FORMATCCC(CTIPBAN, CBANCAR), false));
								}
							}

							AGENTE.put("CCC", CCC);
						}

						// Cuentas Gesti�n Persona
						List<Map> CCCG = new ArrayList<Map>();
						if (!isEmpty(CCCG = (List) OBPERSONA.get("CCC"))) {
							for (Map OB_IAX_CCC : CCCG) {
								// Formatear cada cuenta bancaria
								OB_IAX_CCC = (Map) OB_IAX_CCC.get("OB_IAX_CCC");
								BigDecimal CTIPBAN = (BigDecimal) OB_IAX_CCC.get("CTIPBAN");
								String CBANCAR = (String) OB_IAX_CCC.get("CBANCAR");

								if (!isEmpty(CTIPBAN) && !isEmpty(CBANCAR)) {
									OB_IAX_CCC.put("CBANCARFORMAT",
											tratarRETURNyMENSAJES(request, new PAC_IAX_COMMON(
													(java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
													.ejecutaPAC_IAX_COMMON__F_FORMATCCC(CTIPBAN, CBANCAR), false));
								}
							}

							AGENTE.put("CCCG", CCCG);
						}

						// Recuperar fechas
						AGENTE.put("CTIPPER", OBPERSONA.get("CTIPPER"));
						AGENTE.put("FNACIMI", OBPERSONA.get("FNACIMI"));

						AGENTE.put("CIDIOMA_AGENTE", OBPERSONA.get("CIDIOMA"));

						// Recuperar retencion
						BigDecimal cretenc = (BigDecimal) AGENTE.get("CRETENC");
						logger.debug("--> retencion:" + cretenc);
						if (isEmpty(cretenc)) {
							Map m = pac_iax_redcomercial.ejecutaPAC_IAX_REDCOMERCIAL__F_GET_RETENCION(SPERSON);
							logger.debug("--> retencion:" + m);
							tratarRETURNyMENSAJES(request, m);
							formdata.put("CRETENC_FIN", m.get("PCRETENC"));
						}
					}
				}
			}

			Map map_des = pac_iax_descvalores
					.ejecutaPAC_IAX_DESCVALORES__F_GET_DESCIDIOMA((BigDecimal) AGENTE.get("CIDIOMA_AGENTE"));
			logger.debug(map_des);
			if (!isEmpty(map_des) && !isEmpty(map_des.get("RETURN")) && !"**".equals((String) map_des.get("RETURN"))) {
				AGENTE.put("TIDIOMA_AGENTE", map_des.get("RETURN"));
			} else {
				AGENTE.put("TIDIOMA_AGENTE", "");
			}

			formdata.putAll(AGENTE);

			/* LSTTIPOIVA */
			Map map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTTIPOIVA();
			logger.debug(map);
			LISTVALORES.put("LSTTIPOIVA", tratarRETURNyMENSAJES(request, map, false));

			/* LSTRETENCION */
			map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTRETENCION();
			logger.debug(map);
			LISTVALORES.put("LSTRETENCION", tratarRETURNyMENSAJES(request, map, false));

			/* LSTAGECOMISION */
			map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTAGECOMISION(new BigDecimal(1));
			logger.debug(map);
			LISTVALORES.put("LSTAGECOMISION", tratarRETURNyMENSAJES(request, map, false));

			/* LSTAGECOMISION */
			map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTAGEDESCUENTO();
			logger.debug(map);
			LISTVALORES.put("LSTAGEDESCUENTO", tratarRETURNyMENSAJES(request, map, false));

			/* LSTAGESOBRECOMISION */
			map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTAGECOMISION(new BigDecimal(2));
			logger.debug(map);
			LISTVALORES.put("LSTAGESOBRECOMISION", tratarRETURNyMENSAJES(request, map, false));

			/* LSTESTADOAGENTE */

			BigDecimal CTIPAGE = getCampoNumerico(request, "CTIPAGE");
			BigDecimal CACTIVO = getCampoNumerico(request, "CACTIVO");
			map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTESTADOAGENTE(usuario.getCempres(),
					new BigDecimal(30), CTIPAGE, CACTIVO);
			logger.debug(map);
			LISTVALORES.put("LSTESTADOAGENTE", tratarRETURNyMENSAJES(request, map, false));

			/* LSTTIPOAGENTE */
			map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTTIPOAGENTE();
			logger.debug(map);
			LISTVALORES.put("LSTTIPOAGENTE", tratarRETURNyMENSAJES(request, map, false));

			/* LSTCTIPADN */
			map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(370));
			logger.debug(map);
			LISTVALORES.put("LSTCTIPADN", tratarRETURNyMENSAJES(request, map, false));

			/* LSTCTIPINT */
			map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(371));
			logger.debug(map);
			LISTVALORES.put("LSTCTIPINT", tratarRETURNyMENSAJES(request, map, false));

			/* LSTCLIQUIDO */
			map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(372));
			logger.debug(map);
			LISTVALORES.put("LSTCLIQUIDO", tratarRETURNyMENSAJES(request, map, false));

			/* LSTCIDONEIDAD */
			map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(373));
			logger.debug(map);
			LISTVALORES.put("LSTCIDONEIDAD", tratarRETURNyMENSAJES(request, map, false));

			/* LSTCCOMPANI */
			map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_CIAPRODUCTOS();
			logger.debug(map);
			LISTVALORES.put("LSTCCOMPANI", tratarRETURNyMENSAJES(request, map, false));

			/* LSTCOFIPROPIA */
			map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(374));
			logger.debug(map);
			LISTVALORES.put("LSTCOFIPROPIA", tratarRETURNyMENSAJES(request, map, false));

			/* LSTCCLASIF */
			map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(375));
			logger.debug(map);
			LISTVALORES.put("LSTCCLASIF", tratarRETURNyMENSAJES(request, map, false));

			/* Bug 21425/109832 - 20/03/2012 - AMC */
			map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(1062));
			logger.debug(map);
			LISTVALORES.put("LSTCTIPMED", tratarRETURNyMENSAJES(request, map, false));

			map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(1063));
			logger.debug(map);
			LISTVALORES.put("LSTTIPRETRIB", tratarRETURNyMENSAJES(request, map, false));

			map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(1064));
			logger.debug(map);
			LISTVALORES.put("LSTAGRUPADOR", tratarRETURNyMENSAJES(request, map, false));

			map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(1065));
			logger.debug(map);
			LISTVALORES.put("LSTCACTPRINCIPAL", tratarRETURNyMENSAJES(request, map, false));

			map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(1066));
			logger.debug(map);
			LISTVALORES.put("LSTCMOTBAJA", tratarRETURNyMENSAJES(request, map, false));

			map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(1067));
			logger.debug(map);
			LISTVALORES.put("LSTCBLOQUEO", tratarRETURNyMENSAJES(request, map, false));

			map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(1069));
			logger.debug(map);
			LISTVALORES.put("LSTINCIDENCIAS", tratarRETURNyMENSAJES(request, map, false));

			map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(1070));
			logger.debug(map);
			LISTVALORES.put("LSTRATING", tratarRETURNyMENSAJES(request, map, false));

			map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(1071));
			logger.debug(map);
			LISTVALORES.put("LSTRESOLUCION", tratarRETURNyMENSAJES(request, map, false));

			map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(1068));
			logger.debug(map);
			LISTVALORES.put("LSTACTIVIMED", tratarRETURNyMENSAJES(request, map, false));

			// bug_27949
			map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(1139));
			logger.debug(map);

			if (formdata.get("CCLANEG") == null || formdata.get("CCLANEG").toString().trim().equals("")) {
				LISTVALORES.put("LSTCLASNEGOCIO", tratarRETURNyMENSAJES(request, map, false));
			} else {
				List listaPrevia = (List) tratarRETURNyMENSAJES(request, map, false);
				String numeros = formdata.get("CCLANEG").toString();
				String[] CCLANEG_Array = numeros.split("\\|");

				for (int i = 0; i < listaPrevia.size(); i++) {
					HashMap hmRegistro = (HashMap) listaPrevia.get(i);
					if (CCLANEG_Array[i].equals("1")) {
						hmRegistro.put("LSTCLASNEGOCIO_RESULT", true);
					} else {
						hmRegistro.put("LSTCLASNEGOCIO_RESULT", false);
					}
				}
				LISTVALORES.put("LSTCLASNEGOCIO", listaPrevia);
			}

			// IAXIS-14479 BJHB 26/10/2020
			map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_SUCURSALES();
			logger.debug(map);
			LISTVALORES.put("LSTSUCURSALES", tratarRETURNyMENSAJES(request, map, false));
			// IAXIS-14479 BJHB 26/10/2020

			formdata.put("LISTVALORES", LISTVALORES);

			/* Bug 19049/89656- 15/07/2011 - AMC */
			PAC_IAX_PARAM pac_iax_param = new PAC_IAX_PARAM(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map m = pac_iax_param.ejecutaPAC_IAX_PARAM__F_PAREMPRESA_N(new String("CODAGENTEAUT"), CEMPRES);
			logger.debug("---> CODAGENTEAUT:" + m);
			formdata.put("CODAGENTEAUT", tratarRETURNyMENSAJES(request, m, false));

			/* COMBOS COMISIONES ESPECIALES */
			Map meses = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTMESES();
			formdata.put("lstMeses", tratarRETURNyMENSAJES(request, meses));

			Map lstCtipcal = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(220));
			formdata.put("lstCtipcal", tratarRETURNyMENSAJES(request, lstCtipcal));

			Map lstCforcal = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(221));
			formdata.put("lstCforcal", tratarRETURNyMENSAJES(request, lstCforcal));

			/* COMBOS COMISIONES ESPECIALES BUSINESS INCENTIVE SCHEME */

			Map mesesB = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTMESES();
			formdata.put("lstMesesB", tratarRETURNyMENSAJES(request, mesesB));

			Map lstCtipcalB = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(220));
			formdata.put("lstCtipcalB", tratarRETURNyMENSAJES(request, lstCtipcalB));

			Map lstCforcalB = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(221));
			formdata.put("lstCforcalB", tratarRETURNyMENSAJES(request, lstCforcalB));

			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		} catch (Exception e) {
			logger.error("Error en el servicio Axisage003Service - m�todo m_form", e);
			AbstractDispatchAction.guardarMensaje(request,
					"verbatim:<b>" + e.getClass().getName() + ":</b> " + e.getLocalizedMessage(),
					new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
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
	@SuppressWarnings("all")
	public void m_actualizar_redcomercial(HttpServletRequest request) {
		logger.debug("Axisage003Service m_actualizar_redcomercial");
		AjaxContainerService ajax = new AjaxContainerService();

		try {
			UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
			Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

			PAC_IAX_REDCOMERCIAL pac_iax_redcomercial = new PAC_IAX_REDCOMERCIAL(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			BigDecimal CAGENTE = getCampoNumerico(request, "CAGENTE");
			BigDecimal CEMPRES = getCampoNumerico(request, "CEMPRES");

			/* Cargar hist�rico red comercial */
			Map map = pac_iax_redcomercial.ejecutaPAC_IAX_REDCOMERCIAL__F_GET_REDCOMERCIAL(CAGENTE, CEMPRES);
			logger.debug(map);
			List HISTORICO = (List) ajax.rellenarPlAContenedorAjax(map);
			ajax.guardarContenidoFinalAContenedorAjax(HISTORICO);
			formdata.put("HISTORICO", HISTORICO);

			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr034Service - m�todo m_actualizar_redcomercial", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	/**
	 * Realiza una b�squeda del literal de Agente, en funci�n de su c�digo, por
	 * Ajax.
	 * 
	 * @param request El HttpServletRequest que contiene la petici�n del cliente
	 *                web.
	 */
	public void m_ajax_actualizar_agente(HttpServletRequest request) {
		logger.debug("Axisage003Service m_ajax_actualizar_agente");
		AjaxContainerService ajax = new AjaxContainerService();
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {
			BigDecimal CAGENTE = getCampoNumerico(request, "CAGEDEP");
			String TIPO = getCampoTextual(request, "TIPO");
			Map agente = null;

			if (!isEmpty(CAGENTE)) {
				Map map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTAGENTES_COND(null, null, CAGENTE, BigDecimal.ONE, TIPO);

				logger.debug(map);
				List<Map> listAgentes = (List<Map>) tratarRETURNyMENSAJES(request, map, false);

				if (!isEmpty(listAgentes))
					agente = listAgentes.get(0);

				ajax.rellenarPlAContenedorAjax(map);
			}

			ajax.guardarContenidoFinalAContenedorAjax(agente);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisage005Service - m�todo m_ajax_actualizar_agente", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	/**
	 * 
	 * @param request
	 */
	@SuppressWarnings("all")
	public void m_aceptar(HttpServletRequest request) {
		AESUtil encryptedVal = new AESUtil();
		logger.debug("Axisage003Service m_aceptar");

		try {
			UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
			Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
			BigDecimal CACTIVO = getCampoNumerico(request, "CACTIVO");
			Map formdata2 = new HashMap();
			formdata2 = formdata;
			PAC_IAX_REDCOMERCIAL pac_iax_redcomercial = new PAC_IAX_REDCOMERCIAL(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			BigDecimal CAGENTE = getCampoNumerico(request, "CAGENTE");
			BigDecimal COBLCCC = getCampoNumerico(request, "COBLCCC");
			BigDecimal CRETENC = isEmpty(getCampoNumerico(request, "CRETENC"))
					? getCampoNumerico(request, "CRETENC_FIN")
					: getCampoNumerico(request, "CRETENC");
			BigDecimal CTIPIVA = getCampoNumerico(request, "CTIPIVA");
			BigDecimal SPERSON = getCampoNumerico(request, "SPERSON");
			BigDecimal CCOMISI = getCampoNumerico(request, "CCOMISI");
			BigDecimal CDESC = getCampoNumerico(request, "CDESC");
			BigDecimal CTIPAGE = getCampoNumerico(request, "CTIPAGE");
			CACTIVO = getCampoNumerico(request, "CACTIVO");
			BigDecimal CDOMICI = getCampoNumerico(request, "CDOMICI");
			String CBANCAR = isEmpty(getCampoTextual(request, "CBANCAR")) ? getCampoTextual(request, "CBANCAR_FIN")
					: getCampoTextual(request, "CBANCAR");
			String NCOLEGI = getCampoTextual(request, "NCOLEGI");
			java.sql.Date FBAJAGE = stringToSqlDate(getCampoTextual(request, "FBAJAGE"));
			BigDecimal CTIPBAN = null;
			//
			java.sql.Date FINIVIGCOM = stringToSqlDate(getCampoTextual(request, "FINIVIGCOM"));
			java.sql.Date FINIVIGDESC = stringToSqlDate(getCampoTextual(request, "FINIVIGDESC"));
			BigDecimal CSOBRECOMISI = getCampoNumerico(request, "CSOBRECOMISI");
			java.sql.Date FINIVIGSOBRECOM = stringToSqlDate(getCampoTextual(request, "FINIVIGSOBRECOM"));
			java.sql.Date FFINVIGSOBRECOM = stringToSqlDate(getCampoTextual(request, "FFINVIGSOBRECOM"));
			String TALIAS = getCampoTextual(request, "TALIAS");
			BigDecimal CTIPADN = getCampoNumerico(request, "CTIPADN");
			BigDecimal CAGEDEP = getCampoNumerico(request, "CAGEDEP");
			BigDecimal CTIPINT = getCampoNumerico(request, "CTIPINT");
			BigDecimal CAGECLAVE = getCampoNumerico(request, "CAGECLAVE");
			BigDecimal CLIQUIDO = getCampoNumerico(request, "CLIQUIDO");
			BigDecimal COFERMERCAN = getCampoNumerico(request, "COFERMERCAN");
			java.sql.Date FRECEPCONTRA = stringToSqlDate(getCampoTextual(request, "FRECEPCONTRA"));
			BigDecimal CIDONEIDAD = getCampoNumerico(request, "CIDONEIDAD");
			BigDecimal CCOMPANI = getCampoNumerico(request, "CCOMPANI");
			BigDecimal COFIPROPIA = getCampoNumerico(request, "COFIPROPIA");
			BigDecimal CCLASIF = getCampoNumerico(request, "CCLASIF");
			BigDecimal NPLANPAGO = getCampoNumerico(request, "NPLANPAGO");
			BigDecimal NNOTARIA = getCampoNumerico(request, "NNOTARIA");
			BigDecimal encrypt_CBANCAR = getCampoNumerico(request, "encrypt_CBANCAR");
			String CCODCON = getCampoTextual(request, "CCODCON");
			String CLAVEINTER = getCampoTextual(request, "CLAVEINTER"); // TCS_1 - ACL - 16/01/2019
			// TCS_1569B - ACL - 01/02/2019 - Se agregan campos de impuestos
			String CDESCRIIVA = getCampoTextual(request, "CDESCRIIVA");
			String DESCRICRETENC = getCampoTextual(request, "DESCRICRETENC");
			String DESCRIFUENTE = getCampoTextual(request, "DESCRIFUENTE");
			String CDESCRIICA = getCampoTextual(request, "CDESCRIICA");
			BigDecimal CEXPIDE = getCampoNumerico(request, "CEXPIDE");

			// String TCIUDADNOTARIA = getCampoTextual(request, "TCIUDADNOTARIA");

			BigDecimal CPOBLAC = getCampoNumerico(request, "CPOBLAC");
			BigDecimal CPROVIN = getCampoNumerico(request, "CPROVIN");

			BigDecimal NESCRITURA = getCampoNumerico(request, "NESCRITURA");
			java.sql.Date FALTASOC = stringToSqlDate(getCampoTextual(request, "FALTASOC"));
			String TGERENTE = getCampoTextual(request, "TGERENTE");
			String TCAMARACOMERCIO = getCampoTextual(request, "TCAMARACOMERCIO");
			// Inici BFP bug 20999 25/01/2012 Comisi�n Indirecta
			BigDecimal CCOMISI_INDIRECT = getCampoNumerico(request, "CCOMISI_INDIRECT");
			logger.debug("CCOMISI_INDIRECT :" + CCOMISI_INDIRECT);
			java.sql.Date FINIVIGCOM_INDIRECT = stringToSqlDate(getCampoTextual(request, "FINIVIGCOM_INDIRECT"));
			// Fi BFP bug 20999 25/01/2012 Comisi�n Indirecta
			if (!isEmpty(CBANCAR)) {
				String[] splittedCBANCAR = CBANCAR.split("@@");
				CBANCAR = splittedCBANCAR[0];
				CTIPBAN = new BigDecimal(splittedCBANCAR[1]);
				if (!isEmpty(encrypt_CBANCAR) && encrypt_CBANCAR.intValue() == 1) {
					CBANCAR = encryptedVal.decrypt(CBANCAR);

					logger.debug("[Axisage003] [CBANCAR]: " + CBANCAR);
				}

				if (!isEmpty(CBANCAR))
					// Quitamos siempre los guiones
					CBANCAR = CBANCAR.replaceAll("-", "");
			}

			// Bug 21425/109832 - 21/03/2012 - AMC
			BigDecimal CTIPMED = getCampoNumerico(request, "CTIPMED");
			String TNOMCOM = getCampoTextual(request, "TNOMCOM");
			BigDecimal CDOMCOM = getCampoNumerico(request, "CDOMCOM");
			BigDecimal CTIPRETRIB = getCampoNumerico(request, "CTIPRETRIB");
			BigDecimal CMOTBAJA = getCampoNumerico(request, "CMOTBAJA");
			BigDecimal CBLOQUEO = getCampoNumerico(request, "CBLOQUEO");
			String NREGDGS = getCampoTextual(request, "NREGDGS");
			Date FINSDGS = stringToSqlDate(getCampoTextual(request, "FINSDGS"));
			BigDecimal CREBCONTDGS = getCampoNumerico(request, "CREBCONTDGS");
			BigDecimal AGRUPADOR = getCampoNumerico(request, "AGRUPADOR");
			BigDecimal CACTIVIDAD = getCampoNumerico(request, "CACTIVIDAD");
			BigDecimal CTIPOACTIV = getCampoNumerico(request, "CTIPOACTIV");
			BigDecimal PRETENCION = getCampoNumerico(request, "PRETENCION");
			BigDecimal CINCIDENCIA = getCampoNumerico(request, "CINCIDENCIA");
			BigDecimal CRATING = getCampoNumerico(request, "CRATING");
			String TVALORACION = getCampoTextual(request, "TVALORACION");
			BigDecimal CRESOLUCION = getCampoNumerico(request, "CRESOLUCION");
			Date FFINCREDITO = stringToSqlDate(getCampoTextual(request, "FFINCREDITO"));
			BigDecimal NLIMCREDITO = getCampoNumerico(request, "NLIMCREDITO");
			String TCOMENTARIOS = getCampoTextual(request, "TCOMENTARIOS");
			java.sql.Date FFINVIGCOM = stringToSqlDate(getCampoTextual(request, "FFINVIGCOM"));
			java.sql.Date FFINVIGDESC = stringToSqlDate(getCampoTextual(request, "FFINVIGDESC"));
			java.sql.Date FFINVIGCOM_INDIRECT = stringToSqlDate(getCampoTextual(request, "FFINVIGCOM_INDIRECT"));
			// bug_27949 (21/11/2013): a�ado los siguientes campos:
			Date FULTREV = stringToSqlDate(getCampoTextual(request, "FULTREV"));
			Date FULTCKC = stringToSqlDate(getCampoTextual(request, "FULTCKC"));
			BigDecimal CTIPBANG = getCampoNumerico(request, "CTIPBANG");
			String CBANGES = getCampoTextual(request, "CBANGES");
			String CCLANEG = getCampoTextual(request, "CCLANEG");
			BigDecimal CTIPAGE_LIQUIDA = getCampoNumerico(request, "CTIPAGE_LIQUIDA");
			System.out.println("\n\n ctipage_liquida:" + CTIPAGE_LIQUIDA);
			BigDecimal encrypt_CBANGES = getCampoNumerico(request, "encrypt_CBANGES");
			BigDecimal iobjetivo = getCampoNumerico(request, "IOBJETIVO");
			BigDecimal ibonifica = getCampoNumerico(request, "IBONIFICA");
			BigDecimal pcomextr = getCampoNumerico(request, "PCOMEXTR");
			BigDecimal ctipcal = getCampoNumerico(request, "CTIPCAL");
			BigDecimal cforcal = getCampoNumerico(request, "CFORCAL");
			BigDecimal cmespag = getCampoNumerico(request, "CMESPAG");
			BigDecimal pcomextrov = getCampoNumerico(request, "PCOMEXTROV");
			BigDecimal ppersisten = getCampoNumerico(request, "PPERSISTEN");
			BigDecimal pcompers = getCampoNumerico(request, "PCOMPERS");
			BigDecimal pctipcalb = getCampoNumerico(request, "CTIPCALB");
			BigDecimal pcforcalb = getCampoNumerico(request, "CFORCALB");
			BigDecimal pcmespagb = getCampoNumerico(request, "CMESPAGB");
			BigDecimal pcombusi = getCampoNumerico(request, "PCOMBUSI");
			BigDecimal pilimiteb = getCampoNumerico(request, "ILIMITEB");
			// AAC_INI-CONF_379-20160927
			BigDecimal CORTEPROD = getCampoNumerico(request, "CORTEPROD");
			// AAC_FI-CONF_379-20160927

			// IAXIS-14479 BARTOLO
			BigDecimal CSUC_FAC = getCampoNumerico(request, "CSUC_FAC");
			// IAXIS-14479
           
           // POST-71 BJHB/PAY-TCS 16-06-2022 FIN 
            BigDecimal CSUC_CAU = getCampoNumerico(request,"CSUC_CAU");
            // POST-71 BJHB/PAY-TCS 16-06-2022 FIN 
            
			// bug_27949 (21/11/2013).

			if (!isEmpty(CBANGES)) {
				String[] splittedCBANGES = CBANGES.split("@@");
				CBANGES = splittedCBANGES[0];
				CTIPBANG = new BigDecimal(splittedCBANGES[1]);
				if (!isEmpty(encrypt_CBANGES) && encrypt_CBANGES.intValue() == 1) {
					CBANGES = encryptedVal.decrypt(CBANGES);

					logger.debug("[Axisage003] [CBANGES]: " + CBANGES);
				}

				if (!isEmpty(CBANGES))
					// Quitamos siempre los guiones
					CBANGES = CBANGES.replaceAll("-", "");
			}

			String isEdit = (String) formdata.get("isEdit");
			BigDecimal pPMODIFICA = null;
			if ((isEmpty(isEdit)) && (request.getAttribute("isEdit") != null)) {
				isEdit = (String) request.getAttribute("isEdit");
			}
			if (isEdit.equals("true")) {
				pPMODIFICA = new BigDecimal(1);
			} else {
				pPMODIFICA = new BigDecimal(0);
			}
			//

			HashMap aviso = this.f_Get_Avisos(request, this.whoami(this));
			BigDecimal pRETURN = (BigDecimal) this.tratarRETURNyMENSAJES(request, aviso);
			request.setAttribute("PLSTAVISOS", aviso.get("PLSTAVISOS"));

			if (pRETURN != null && pRETURN.intValue() != 1) {

				// bug_27949 (21/11/2013). Divido la funcion f_set_agente en dos.
				// TCS_1569B - ACL - 01/02/2019 - Se agregan campos de impuestos
				Map map = pac_iax_redcomercial.ejecutaPAC_IAX_REDCOMERCIAL__F_SET_AGENTE(CAGENTE, CRETENC, CTIPIVA,
						SPERSON, CCOMISI, CDESC, CTIPAGE, CACTIVO, CDOMICI, CBANCAR, NCOLEGI, FBAJAGE, CTIPBAN,
						FINIVIGCOM, FFINVIGCOM, FINIVIGDESC, FFINVIGDESC, CSOBRECOMISI, FINIVIGSOBRECOM,
						FFINVIGSOBRECOM, TALIAS, CLIQUIDO, CCOMISI_INDIRECT, FINIVIGCOM_INDIRECT, FFINVIGCOM_INDIRECT,
						CTIPMED, TNOMCOM, CDOMCOM, CTIPRETRIB, CMOTBAJA, CBLOQUEO, NREGDGS, FINSDGS, CREBCONTDGS,
						COBLCCC, CCODCON, CLAVEINTER, CDESCRIIVA, DESCRICRETENC, DESCRIFUENTE, CDESCRIICA, CTIPINT,
						CSUC_FAC, 
                        CSUC_CAU,//POST-71 BJHB/PAY-TCS 16-06-2022
                        pPMODIFICA // TCS_1 - ACL - 16/01/2019 Se agrega campo CLAVEINTER
				);// Inici BFP bug 20999 25/01/2012 Comisi�n Indirecta*/

				logger.debug(map);

				if (BigDecimal.ZERO.equals(tratarRETURNyMENSAJES(request, map, false))) {
					BigDecimal PCAGENTE_OUT = (BigDecimal) map.get("PCAGENTE_OUT");
					formdata.put("CAGENTE", PCAGENTE_OUT);
					request.setAttribute("CAGENTE", PCAGENTE_OUT);
					aviso = this.f_Get_Avisos_003(request, this.whoami(this), PCAGENTE_OUT);

					logger.debug("avisoxx ::" + aviso);

					// bug 30638/170237 - 19/03/2014 - AMC
					Map map2 = pac_iax_redcomercial.ejecutaPAC_IAX_REDCOMERCIAL__F_SET_AGENTE_COMP(
							isEmpty(CAGENTE) ? PCAGENTE_OUT : CAGENTE, CTIPADN, CAGEDEP, CTIPINT, CAGECLAVE,
							COFERMERCAN, FRECEPCONTRA, CIDONEIDAD, CCOMPANI, COFIPROPIA, CCLASIF, NPLANPAGO, NNOTARIA,
							CPROVIN, CPOBLAC, NESCRITURA, FALTASOC, TGERENTE, TCAMARACOMERCIO, AGRUPADOR, CACTIVIDAD,
							CTIPOACTIV, PRETENCION, CINCIDENCIA, CRATING, TVALORACION, CRESOLUCION, FFINCREDITO,
							NLIMCREDITO, TCOMENTARIOS, FULTREV, FULTCKC, CTIPBANG, CBANGES, CCLANEG, CTIPAGE_LIQUIDA,
							iobjetivo, ibonifica, pcomextr, ctipcal, cforcal, cmespag, pcomextrov, ppersisten, pcompers,
							pctipcalb, pcforcalb, pcmespagb, pcombusi, pilimiteb, CEXPIDE
							// AAC_INI-CONF_379-20160927
							, CORTEPROD
					// AAC_FI-CONF_379-20160927
					);

					logger.debug(map2);

					if (BigDecimal.ZERO.equals(tratarRETURNyMENSAJES(request, map2, false))) {
						formdata.put("grabarOK", true);
						formdata.put("isEdit", true);
						request.setAttribute("isEdit", "true");
						m_form(request);
					} else {
						request.setAttribute("isEdit", "true");
						m_form(request);
						// Sobreescribim els que hi ha per pantalla en cas d'error

						formdata.putAll(formdata2);
					}

				} else {
					request.setAttribute("isEdit", null);
					m_form(request);
					// Sobreescribim els que hi ha per pantalla en cas d'error

					formdata.putAll(formdata2);
				}
			} else {
				request.setAttribute("isEdit", null);
				m_form(request);
				// Sobreescribim els que hi ha per pantalla en cas d'error

				formdata.putAll(formdata2);
			}
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		} catch (Exception e) {
			logger.error("Error en el servicio Axisage003Service - m�todo m_aceptar", e);
			AbstractDispatchAction.guardarMensaje(request,
					"verbatim:<b>" + e.getClass().getName() + ":</b> " + e.getLocalizedMessage(),
					new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

	/**
	 * 
	 * @param request
	 */
	@SuppressWarnings("all")
	public void m_busca_codagente(HttpServletRequest request) {
		logger.debug("Axisage003Service m_busca_codagente");

		try {
			UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
			Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

			PAC_IAX_REDCOMERCIAL pac_iax_redcomercial = new PAC_IAX_REDCOMERCIAL(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			BigDecimal CTIPAGE = getCampoNumerico(request, "CTIPAGE");
			BigDecimal CEMPRES = getCampoNumerico(request, "CEMPRES");

			Map map = pac_iax_redcomercial.ejecutaPAC_IAX_REDCOMERCIAL__F_GET_CONTADOR_AGENTE(CEMPRES, CTIPAGE);
			tratarRETURNyMENSAJES(request, map, false);
			BigDecimal CAGENTE = (BigDecimal) map.get("PCONTADOR");
			logger.debug("----> contador:" + CAGENTE);
			formdata.put("CAGENTE", CAGENTE);

			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr034Service - m�todo m_actualizar_redcomercial", e);
		}
	}

	/**
	 * 
	 * @param request
	 */
	@SuppressWarnings("all")
	public void m_recargar(HttpServletRequest request) {
		logger.debug("Axisage003Service m_recargar");

		try {
			UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
			Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

			BigDecimal CAGENTE = getCampoNumerico(request, "CAGENTE");
			BigDecimal RED_DummyCodeAgent = (BigDecimal) request.getSession().getAttribute("RED_DummyCodeAgent");

			if (RED_DummyCodeAgent != null && RED_DummyCodeAgent.equals(CAGENTE))
				CAGENTE = BigDecimal.ONE;

			/* LISTVALORES */
			PAC_IAX_LISTVALORES pac_iax_listvalores = new PAC_IAX_LISTVALORES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map LISTVALORES = new HashMap();

			Map AGENTE = new HashMap();
			BigDecimal CEMPRES = getCampoNumerico(request, "CEMPRES");

			/* LSTTIPOIVA */
			Map map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTTIPOIVA();
			logger.debug(map);
			LISTVALORES.put("LSTTIPOIVA", tratarRETURNyMENSAJES(request, map, false));

			/* LSTRETENCION */
			map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTRETENCION();
			logger.debug(map);
			LISTVALORES.put("LSTRETENCION", tratarRETURNyMENSAJES(request, map, false));

			/* LSTAGECOMISION */
			map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTAGECOMISION(new BigDecimal(1));
			logger.debug(map);
			LISTVALORES.put("LSTAGECOMISION", tratarRETURNyMENSAJES(request, map, false));

			/* LSTAGESOBRECOMISION */
			map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTAGECOMISION(new BigDecimal(2));
			logger.debug(map);
			LISTVALORES.put("LSTAGESOBRECOMISION", tratarRETURNyMENSAJES(request, map, false));

			/* LSTESTADOAGENTE */
			map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTESTADOAGENTE(null, null, null, null);
			logger.debug(map);
			LISTVALORES.put("LSTESTADOAGENTE", tratarRETURNyMENSAJES(request, map, false));

			/* LSTTIPOAGENTE */
			map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTTIPOAGENTE();
			logger.debug(map);
			LISTVALORES.put("LSTTIPOAGENTE", tratarRETURNyMENSAJES(request, map, false));

			/* LSTCTIPADN */
			map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(370));
			logger.debug(map);
			LISTVALORES.put("LSTCTIPADN", tratarRETURNyMENSAJES(request, map, false));

			/* LSTCTIPINT */
			map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(371));
			logger.debug(map);
			LISTVALORES.put("LSTCTIPINT", tratarRETURNyMENSAJES(request, map));

			/* LSTCCLIQUIDO */
			map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(372));
			logger.debug(map);
			LISTVALORES.put("LSTCLIQUIDO", tratarRETURNyMENSAJES(request, map, false));

			/* LSTCIDONEIDAD */
			map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(373));
			logger.debug(map);
			LISTVALORES.put("LSTCIDONEIDAD", tratarRETURNyMENSAJES(request, map, false));
			/* LSTSPERCOMP */
			/*
			 * map = ALGO; logger.debug(map);
			 */
			LISTVALORES.put("LSTSPERCOMP", tratarRETURNyMENSAJES(request, map, false));

			/* LSTCOFIPROPIA */
			map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(374));
			logger.debug(map);
			LISTVALORES.put("LSTCOFIPROPIA", tratarRETURNyMENSAJES(request, map, false));

			/* LSTCCLASIF */
			map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(375));
			logger.debug(map);
			LISTVALORES.put("LSTCCLASIF", tratarRETURNyMENSAJES(request, map, false));

			/* Bug 21425/109832 - 20/03/2012 - AMC */
			map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(1062));
			logger.debug(map);
			LISTVALORES.put("LSTCTIPMED", tratarRETURNyMENSAJES(request, map, false));

			map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(1063));
			logger.debug(map);
			LISTVALORES.put("LSTTIPRETRIB", tratarRETURNyMENSAJES(request, map, false));

			map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(1064));
			logger.debug(map);
			LISTVALORES.put("LSTAGRUPADOR", tratarRETURNyMENSAJES(request, map, false));

			map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(1065));
			logger.debug(map);
			LISTVALORES.put("LSTCACTPRINCIPAL", tratarRETURNyMENSAJES(request, map, false));

			map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(1066));
			logger.debug(map);
			LISTVALORES.put("LSTCMOTBAJA", tratarRETURNyMENSAJES(request, map, false));

			map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(1067));
			logger.debug(map);
			LISTVALORES.put("LSTCBLOQUEO", tratarRETURNyMENSAJES(request, map, false));

			map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(1069));
			logger.debug(map);
			LISTVALORES.put("LSTINCIDENCIAS", tratarRETURNyMENSAJES(request, map, false));

			map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(1070));
			logger.debug(map);
			LISTVALORES.put("LSTRATING", tratarRETURNyMENSAJES(request, map, false));

			map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(1071));
			logger.debug(map);
			LISTVALORES.put("LSTRESOLUCION", tratarRETURNyMENSAJES(request, map, false));

			map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(1068));
			logger.debug(map);
			LISTVALORES.put("LSTACTIVIMED", tratarRETURNyMENSAJES(request, map, false));

			// bug_27949
			map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(8000921));
			logger.debug(map);
			LISTVALORES.put("LSTCLASNEGOCIO", tratarRETURNyMENSAJES(request, map, false));

			formdata.put("LISTVALORES", LISTVALORES);

			/* Bug 19049/89656- 15/07/2011 - AMC */
			// BigDecimal PCEMPRES = (BigDecimal)formdata.get("CEMPRES");
			PAC_IAX_PARAM pac_iax_param = new PAC_IAX_PARAM(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map m = pac_iax_param.ejecutaPAC_IAX_PARAM__F_PAREMPRESA_N(new String("CODAGENTEAUT"), CEMPRES);
			logger.debug("---> CODAGENTEAUT:" + m);
			formdata.put("CODAGENTEAUT", tratarRETURNyMENSAJES(request, m));

			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		} catch (Exception e) {
			logger.error("Error en el servicio Axisage003Service - m�todo m_recargar", e);
			AbstractDispatchAction.guardarMensaje(request,
					"verbatim:<b>" + e.getClass().getName() + ":</b> " + e.getLocalizedMessage(),
					new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

	public void m_delete_actor(HttpServletRequest request) {
		logger.debug("Axisage003Service m_delete_actor");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		try {
			BigDecimal CODIGO = getCampoNumerico(request, "CODIGO");
			// BigDecimal CODIGO = getCampoNumerico(request, "CODIGO");
			java.sql.Date FFIn = this.stringToSqlDate(this.getCampoTextual(request, "FFIN"));
			// PAC_IAX_SIN_AGENTES pac_iax_age_siniestros = new
			// PAC_IAX_SIN_AGENTES((java.sql.Connection)request.getAttribute(Constantes.DB01CONN));

			Map map = new PAC_IAX_SIN_AGENTES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_AGE_SINIESTROS__F_REMOVE_ACTOR(CODIGO);
			// BigDecimal resultado = (BigDecimal)tratarRETURNyMENSAJES(request,map);
			tratarRETURNyMENSAJES(request, map);
			logger.debug(map);

			this.m_form(request);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisage03Service - m�todo m_delete_prodpart", e);
			AbstractDispatchAction.guardarMensaje(request, "1000050", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	public void m_delete_prodpart(HttpServletRequest request) {
		logger.debug("Axisage003Service m_delete_prodpart");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		try {
			BigDecimal PCAGENTE = getCampoNumerico(request, "PCAGENTE");
			BigDecimal PSPRODUC = getCampoNumerico(request, "PSPRODUC");
			BigDecimal PCACTIVI = getCampoNumerico(request, "PCACTIVI");

			Map map = new PAC_IAX_REDCOMERCIAL((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_REDCOMERCIAL__F_DEL_PRODPARTICIPACION(PCAGENTE, PSPRODUC, PCACTIVI);
			// BigDecimal resultado = (BigDecimal)tratarRETURNyMENSAJES(request,map);
			tratarRETURNyMENSAJES(request, map);
			logger.debug(map);

			this.m_form(request);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisage03Service - m�todo m_delete_prodpart", e);
			AbstractDispatchAction.guardarMensaje(request, "1000050", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	public void m_delete_subvencion(HttpServletRequest request) {
		logger.debug("Axisage003Service m_delete_subvencion");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		try {
			BigDecimal PCAGENTE = getCampoNumerico(request, "PCAGENTE");
			BigDecimal PSPRODUC = getCampoNumerico(request, "PSPRODUC");
			BigDecimal PCACTIVI = getCampoNumerico(request, "PCACTIVI");

			Map map = new PAC_IAX_REDCOMERCIAL((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_REDCOMERCIAL__F_DEL_SUBVENCION(PCAGENTE, PSPRODUC, PCACTIVI);
			// BigDecimal resultado = (BigDecimal)tratarRETURNyMENSAJES(request,map);
			tratarRETURNyMENSAJES(request, map);
			logger.debug(map);

			this.m_form(request);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisage03Service - m�todo m_delete_prodpart", e);
			AbstractDispatchAction.guardarMensaje(request, "1000050", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	public void m_delete_soporte(HttpServletRequest request) {
		logger.debug("Axisage003Service m_delete_soporte");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		try {
			BigDecimal PCAGENTE = getCampoNumerico(request, "PCAGENTE");
			java.sql.Date PFINIVIG = this.stringToSqlDate(this.getCampoTextual(request, "PFINIVIG"));

			Map map = new PAC_IAX_REDCOMERCIAL((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_REDCOMERCIAL__F_DEL_SOPORTEARP(PCAGENTE, PFINIVIG);
			// BigDecimal resultado = (BigDecimal)tratarRETURNyMENSAJES(request,map);
			tratarRETURNyMENSAJES(request, map);
			logger.debug(map);

			this.m_form(request);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisage03Service - m�todo m_delete_soporte", e);
			AbstractDispatchAction.guardarMensaje(request, "1000050", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	public void m_ajax_direccion(HttpServletRequest request, Axisage003Action thisAction) {
		logger.debug("Axisage003Service m_ajax_direccion");
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
			logger.error("Error en el servicio Axisage003Service - m�todo m_ajax_direccion", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	public void m_ajax_busqueda_estados(HttpServletRequest request) {
		logger.debug("Axisage003Service m_ajax_busqueda_estados");
		AjaxContainerService ajax = new AjaxContainerService();
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {

			PAC_IAX_LISTVALORES pac_iax_listvalores = new PAC_IAX_LISTVALORES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			BigDecimal CTIPAGE = getCampoNumerico(request, "CTIPAGE");
			BigDecimal CACTIVO = getCampoNumerico(request, "CACTIVO");
			Map map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTESTADOAGENTE(usuario.getCempres(),
					new BigDecimal(30), CTIPAGE, CACTIVO);
			logger.debug(map);
			ajax.rellenarPlAContenedorAjax(map);
			ajax.guardarContenidoFinalAContenedorAjax(map);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisage003Service - m�todo m_ajax_busqueda_estados", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());

		}
	}

	/**
	 * 
	 * @param request
	 */
	@SuppressWarnings("all")
	public void m_consolidar_sub(HttpServletRequest request) {
		logger.debug("Axisage003Service m_consolidar_sub");
		AjaxContainerService ajax = new AjaxContainerService();

		try {
			UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
			Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

			PAC_IAX_REDCOMERCIAL pac_iax_redcomercial = new PAC_IAX_REDCOMERCIAL(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			BigDecimal CAGENTE = getCampoNumerico(request, "CAGENTE");
			BigDecimal PNPLANPAGO = getCampoNumerico(request, "NPLANPAGO");
			Map m = pac_iax_redcomercial.ejecutaPAC_IAX_REDCOMERCIAL__F_TRASPASAR_SUBVENCION(CAGENTE, PNPLANPAGO);

			logger.debug(m);
			tratarRETURNyMENSAJES(request, m);
		} catch (Exception e) {
			logger.error("Error en el servicio Axisage03Service - m�todo m_delete_soporte", e);
			AbstractDispatchAction.guardarMensaje(request, "1000050", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	public void m_delete_contacto(HttpServletRequest request) {
		logger.debug("Axisage003Service m_delete_soporte");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		try {
			BigDecimal PCAGENTE = getCampoNumerico(request, "PCAGENTE");
			BigDecimal NORDEN = getCampoNumerico(request, "NORDEN");

			Map map = new PAC_IAX_REDCOMERCIAL((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_REDCOMERCIAL__F_DEL_AGE_CONTACTO(PCAGENTE, NORDEN);
			// BigDecimal resultado = (BigDecimal)tratarRETURNyMENSAJES(request,map);
			tratarRETURNyMENSAJES(request, map);
			logger.debug(map);

			this.m_form(request);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisage03Service - m�todo m_delete_soporte", e);
			AbstractDispatchAction.guardarMensaje(request, "1000050", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	public void m_delete_entidadaseg(HttpServletRequest request) {
		logger.debug("Axisage003Service m_delete_entidadaseg");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		try {
			BigDecimal PCAGENTE = getCampoNumerico(request, "PCAGENTE");
			BigDecimal CTIPENTIDADASEG = getCampoNumerico(request, "PCTIPENTIDADASEG");

			Map map = new PAC_IAX_AGE_DATOS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_AGE_DATOS__F_DEL_ENTIDADASEG(PCAGENTE, CTIPENTIDADASEG);
			// BigDecimal resultado = (BigDecimal)tratarRETURNyMENSAJES(request,map);
			tratarRETURNyMENSAJES(request, map);
			logger.debug(map);

			this.m_form(request);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisage03Service - m�todo m_delete_entidadaseg", e);
			AbstractDispatchAction.guardarMensaje(request, "1000050", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	public void m_delete_banco(HttpServletRequest request) {
		logger.debug("Axisage003Service m_delete_banco");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		try {
			BigDecimal PCAGENTE = getCampoNumerico(request, "PCAGENTE");
			BigDecimal CTIPBANCO = getCampoNumerico(request, "PCTIPBANCO");

			Map map = new PAC_IAX_AGE_DATOS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_AGE_DATOS__F_DEL_BANCO(PCAGENTE, CTIPBANCO);
			// BigDecimal resultado = (BigDecimal)tratarRETURNyMENSAJES(request,map);
			tratarRETURNyMENSAJES(request, map);
			logger.debug(map);

			this.m_form(request);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisage03Service - m�todo m_delete_banco", e);
			AbstractDispatchAction.guardarMensaje(request, "1000050", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	public void m_delete_asociacion(HttpServletRequest request) {
		logger.debug("Axisage003Service m_delete_asociacion");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		try {
			BigDecimal PCAGENTE = getCampoNumerico(request, "PCAGENTE");
			BigDecimal CTIPASOCIACION = getCampoNumerico(request, "PCTIPASOCIACION");

			Map map = new PAC_IAX_AGE_DATOS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_AGE_DATOS__F_DEL_ASOCIACION(PCAGENTE, CTIPASOCIACION);
			// BigDecimal resultado = (BigDecimal)tratarRETURNyMENSAJES(request,map);
			tratarRETURNyMENSAJES(request, map);
			logger.debug(map);

			this.m_form(request);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisage03Service - m�todo m_delete_asociacion", e);
			AbstractDispatchAction.guardarMensaje(request, "1000050", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	public void m_delete_referencia(HttpServletRequest request) {
		logger.debug("Axisage003Service m_delete_referencia");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		try {
			BigDecimal PCAGENTE = getCampoNumerico(request, "PCAGENTE");
			BigDecimal NORDREFERENCIA = getCampoNumerico(request, "PNORDREFERENCIA");

			Map map = new PAC_IAX_AGE_DATOS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_AGE_DATOS__F_DEL_REFERENCIA(PCAGENTE, NORDREFERENCIA);
			// BigDecimal resultado = (BigDecimal)tratarRETURNyMENSAJES(request,map);
			tratarRETURNyMENSAJES(request, map);
			logger.debug(map);

			this.m_form(request);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisage03Service - m�todo m_delete_referencia", e);
			AbstractDispatchAction.guardarMensaje(request, "1000050", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	private HashMap f_Get_Avisos_003(HttpServletRequest request, String whoami, BigDecimal CAGENTE) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {
			PAC_IAX_AVISOS pacIaxAviso = new PAC_IAX_AVISOS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			String CMODO = (String) AbstractDispatchAction.topPila(request, "CMODO");
			BigDecimal CRAMO = (BigDecimal) AbstractDispatchAction.topPila(request, "CRAMO");
			BigDecimal SPRODUC = (BigDecimal) AbstractDispatchAction.topPila(request, "SPRODUC");
			BigDecimal SSEGURO = (BigDecimal) AbstractDispatchAction.topPila(request, "SSEGURO");
			BigDecimal NRIESGO = (BigDecimal) AbstractDispatchAction.topPila(request, "NRIESGO");

			request.setAttribute("SSEGURO", SSEGURO);
			request.setAttribute("NRIESGO", NRIESGO);

			String pparams = this.getInfoStringConcatenar_003(request, CAGENTE);
			logger.debug("1->" + pparams);

			HashMap m = pacIaxAviso.ejecutaPAC_IAX_AVISOS__F_GET_AVISOS(whoami.toUpperCase(), CMODO, CRAMO, SPRODUC,
					pparams);

			logger.debug(m);
			/*
			 * BigDecimal pRETURN = (BigDecimal)this.tratarRETURNyMENSAJES(request,m);
			 * 
			 * if (pRETURN != null) {
			 * request.setAttribute("PLSTAVISOS",m.get("PLSTAVISOS")); }
			 */
			return m;

		} catch (Exception e) {
			logger.error("avisos para f_Get_Avisos_031 " + whoami + " ha causado un error", e);
			return null;
		}

	}

	private String getInfoStringConcatenar_003(HttpServletRequest request, BigDecimal CAGENTE) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {
			StringBuffer cadena = new StringBuffer();
			request.setAttribute("CIDIOMA", usuario.getCidioma());

			Enumeration enumera = request.getParameterNames();

			while (enumera.hasMoreElements()) {
				String fieldName = (String) enumera.nextElement();
				logger.debug("fieldName -->" + fieldName);
				String[] todos_valores = request.getParameterValues(fieldName);
				for (int i = 0; i < todos_valores.length; i++) {
					String fieldValue = todos_valores[i];

					if (!fieldName.equals("TTITOBS") && !fieldName.equals("TOBS") && !isEmpty(fieldValue)
							&& !fieldValue.equals("undefined") && fieldName.indexOf("respuesta") == -1) {
						if (i == 0)
							cadena.append("#").append(fieldName).append(";").append(fieldValue);
						else
							cadena.append("#").append(fieldName).append("__").append(i).append(";").append(fieldValue);
					}

				}
			}

			enumera = request.getAttributeNames();

			while (enumera.hasMoreElements()) {
				String fieldName = (String) enumera.nextElement();
				logger.debug("fieldName attributos -->" + fieldName);
				String fieldValue = String.valueOf(request.getAttribute(fieldName));
				logger.debug("fieldValue attributos -->" + fieldValue);
				if (!fieldName.equals("TTITOBS") && fieldName.indexOf("respuesta") == -1 && !fieldName.equals("TOBS")
						&& !isEmpty(fieldValue) && !fieldValue.equals("undefined") && fieldName.indexOf("javax") == -1
						&& fieldName.indexOf("org") == -1 && fieldName.indexOf("__mensajes") == -1
						&& fieldName.indexOf("__forwardaction") == -1 && fieldName.indexOf("__formdata") == -1
						&& fieldName.indexOf("__configform") == -1 && fieldName.indexOf("DEPENDENCIAS") == -1
						&& fieldName.indexOf("DISPLAY_ITEMS") == -1 && fieldName.indexOf("DEPENDENCIA0") == -1) {
					cadena.append("#").append(fieldName).append(";").append(fieldValue);
				}
			}

			cadena.append("#").append("CIDIOMA").append(";").append(usuario.getCidioma());
			cadena.append("#").append("CAGENTE").append(";").append(CAGENTE);
			String c = cadena.append("#").toString();

			/*
			 * logger.debug("cadena avisos sin recorte -->"+cadena); if (c.length()>1999)
			 * c=c.substring(0, 1999);
			 */
			logger.debug("cadena avisos -->" + cadena);
			return c;
		} catch (Exception e) {
			logger.debug("error : " + e.getMessage());
			return "";
		}
	}

}
