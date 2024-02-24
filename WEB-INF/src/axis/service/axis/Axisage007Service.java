//Revision:# 6Lg1fjFFTc1A4ehrVi6c5A== #
package axis.service.axis;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_AGENDA;
import axis.jdbc.PAC_IAX_AGE_PROPIEDADES;
import axis.jdbc.PAC_IAX_COMMON;
import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.jdbc.PAC_IAX_PERSONA;
import axis.jdbc.PAC_IAX_REDCOMERCIAL;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.control.axis.Axisage007Action;
import axis.mvc.model.UsuarioBean;
import axis.util.Constantes;

/**
 * Axisage006Service.java 29/12/2008
 * 
 * @author <a href="rkirchner@csi-ti.com">Roger Kirchner</a>
 * @since Java 5.0
 */
public class Axisage007Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE INICIALIZACION
	 *******************************************/
	/*********************************************************************************************************************/
	private String getInfoString(HttpServletRequest request) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {
			StringBuffer cadena = new StringBuffer();

			Enumeration enumera = request.getParameterNames();
			while (enumera.hasMoreElements()) {
				String fieldName = (String) enumera.nextElement();
				String[] todos_valores = request.getParameterValues(fieldName);
				for (int i = 0; i < todos_valores.length; i++) {
					String fieldValue = todos_valores[i];

					if (!isEmpty(fieldValue) && !fieldValue.equals("undefined")) {
						if (i == 0)
							cadena.append("#").append(fieldName).append(";").append(fieldValue);
						else
							cadena.append("#").append(fieldName).append("__").append(i).append(";").append(fieldValue);
					}

				}
			}

			return cadena.append("#").toString();
		} catch (Exception e) {
			logger.debug("error : " + e.getMessage());
			return "";
		}
	}

	/**
	 * 
	 * @param request
	 */
	@SuppressWarnings("all")
	public void m_form(HttpServletRequest request) {
		logger.debug("Axisage007Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {
			String BCAGENTE = request.getParameter("CAGENTE"); // CELSO 05/06/2019 IAXIS-4219
			// BigDecimal CAGENTE = getCampoNumerico(request, "CAGENTE"); //CELSO 05/06/2019
			// IAXIS-4219
			BigDecimal CAGENTE = stringToBigDecimal(BCAGENTE); // CELSO 05/06/2019 IAXIS-4219

			/* LISTVALORES */
			PAC_IAX_LISTVALORES pac_iax_listvalores = new PAC_IAX_LISTVALORES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map LISTVALORES = new HashMap();

			if (!isEmpty(CAGENTE)) {
				if (CAGENTE.equals(request.getSession().getAttribute("RED_DummyCodeAgent")))
					CAGENTE = BigDecimal.ONE;

				PAC_IAX_REDCOMERCIAL pac_iax_redcomercial = new PAC_IAX_REDCOMERCIAL(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
				PAC_IAX_AGE_PROPIEDADES pac_iax_age_propiedades = new PAC_IAX_AGE_PROPIEDADES(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
				/* Cargar datos agente */
				Map map = pac_iax_redcomercial.ejecutaPAC_IAX_REDCOMERCIAL__F_GET_DATOSAGENTE(CAGENTE);
				logger.debug(map);

				tratarRETURNyMENSAJES(request, map);

				Map AGENTE = (Map) map.get("AGENTE");
				formdata.put("CONTRATOS", map.get("CONTRATOS"));

				/* Cargar hist�rico red comercial */
				if (!isEmpty(map.get("CONTRATOS"))) {
					Map OB_IAX_CONTRATOS = (Map) ((List) map.get("CONTRATOS")).get(0);
					if (!isEmpty(OB_IAX_CONTRATOS)) {
						OB_IAX_CONTRATOS = (Map) OB_IAX_CONTRATOS.get("OB_IAX_CONTRATOS");
						if (!isEmpty(OB_IAX_CONTRATOS)) {
							// Cargar el hist�rico de la empresa seleccionada. Si no hay ninguna, cargar el
							// hist�rico de la primera empresa del multireg. de CONTRATOS
							BigDecimal CEMPRES = !isEmpty(formdata.get("CEMPRES"))
									? new BigDecimal((String) formdata.get("CEMPRES"))
									: (BigDecimal) OB_IAX_CONTRATOS.get("CEMPRES");
							map = pac_iax_redcomercial.ejecutaPAC_IAX_REDCOMERCIAL__F_GET_REDCOMERCIAL(CAGENTE,
									CEMPRES);
							logger.debug(map);
							formdata.put("HISTORICO", tratarRETURNyMENSAJES(request, map));
							formdata.put("CEMPRES", CEMPRES);
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

				/* Tratamiento datos persona */
				// SPERSON del AGENTE
				BigDecimal SPERSON = (BigDecimal) AGENTE.get("SPERSON");

				if (!isEmpty(SPERSON)) {
					/* LSTDOMIPERSON */
					map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTDOMIPERSON(SPERSON);
					logger.debug(map);
					LISTVALORES.put("LSTDOMIPERSON", tratarRETURNyMENSAJES(request, map));

					/* Datos de la persona */

					PAC_IAX_PERSONA pacIaxPersona = new PAC_IAX_PERSONA(
							(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
					map = pacIaxPersona.ejecutaPAC_IAX_PERSONA__F_GET_PERSONA_PUBLICA(SPERSON);
					logger.debug(map);

					if (BigDecimal.ZERO.equals(tratarRETURNyMENSAJES(request, map))) {
						Map OBPERSONA = (Map) map.get("OBPERSONA");

						if (!isEmpty(OBPERSONA)) {
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
														.ejecutaPAC_IAX_COMMON__F_FORMATCCC(CTIPBAN, CBANCAR)));
									}
								}

								AGENTE.put("CCC", CCC);
							}
						}
					}
				}

				formdata.put("AGENTE", AGENTE);
				formdata.putAll(AGENTE);
			}

			/* LSTTIPOIVA */
			Map map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTTIPOIVA();
			logger.debug(map);
			LISTVALORES.put("LSTTIPOIVA", tratarRETURNyMENSAJES(request, map));

			/* LSTRETENCION */
			map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTRETENCION();
			logger.debug(map);
			LISTVALORES.put("LSTRETENCION", tratarRETURNyMENSAJES(request, map));

			/* LSTAGECOMISION */
			map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTAGECOMISION(null);
			logger.debug(map);
			LISTVALORES.put("LSTAGECOMISION", tratarRETURNyMENSAJES(request, map));

			/* LSTAGESOBRECOMISION */
			map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTAGECOMISION(new BigDecimal(2));
			logger.debug(map);
			LISTVALORES.put("LSTAGESOBRECOMISION", tratarRETURNyMENSAJES(request, map, false));

			/* LSTESTADOAGENTE */
			map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTESTADOAGENTE(null, null, null, null);
			logger.debug(map);
			LISTVALORES.put("LSTESTADOAGENTE", tratarRETURNyMENSAJES(request, map));

			/* LSTTIPOAGENTE */
			map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTTIPOAGENTE();
			logger.debug(map);
			LISTVALORES.put("LSTTIPOAGENTE", tratarRETURNyMENSAJES(request, map));

			/* bug 20198 */

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

			formdata.put("LISTVALORES", LISTVALORES);

			if (!isEmpty(CAGENTE)) {
				// CARGAMOS LA AGENDA TAREAS DE USUARIOS
				/* Bug 18176 - ICV - 05/04/2011 */
				PAC_IAX_AGENDA pacIaxAgenda = new PAC_IAX_AGENDA(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
				map = pacIaxAgenda.ejecutaPAC_IAX_AGENDA__F_GET_LSTAPUNTES(null, null, new BigDecimal("3"),
						CAGENTE.toString(), null, null, null, null, null, null, null, null, null, null, null, null,
						null, null, null);
				BigDecimal resultado = (BigDecimal) tratarRETURNyMENSAJES(request, map, false);
				if (resultado.intValue() == 0) {
					ArrayList lista_agenda = (ArrayList) map.get("PLSTAGENDA");
					request.setAttribute("lstagdagenda", lista_agenda);
				}
			}

			/*
			 * CARGAMOS LA AGENDA del agente /* Bug 0018397 - XPL - 29/04/2011
			 */
			PAC_IAX_AGENDA paciaxagenda = new PAC_IAX_AGENDA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			String pParam = this.getInfoString(request);
			Map m = paciaxagenda.ejecutaPAC_IAX_AGENDA__F_GET_LSTAGDOBS(new BigDecimal(3), // agenda de agentes
					null, pParam);
			logger.debug(m);
			BigDecimal ok = (isEmpty(this.tratarRETURNyMENSAJES(request, m))) ? new BigDecimal(0)
					: (BigDecimal) this.tratarRETURNyMENSAJES(request, m);
			if (ok.intValue() == 0) {
				formdata.put("PLSTAGENDA", m.get("PLSTAGDOBS"));
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisage007Service - m�todo m_form", e);
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
	public void m_borrar_agenda(HttpServletRequest request, Axisage007Action thisAction) {

		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {

			BigDecimal IDOBS = getCampoNumerico(request, "IDOBS");

			// Llamamos a la parte de consulta de la funcion
			Map map = new PAC_IAX_AGENDA((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_AGENDA__F_DEL_OBSERVACION(IDOBS);
			BigDecimal resultado = (BigDecimal) tratarRETURNyMENSAJES(request, map);

		} catch (Exception e) {
			logger.error("Error en el m�todo Axisadm003Action m_borrar_agenda", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {

			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}

	}
}
