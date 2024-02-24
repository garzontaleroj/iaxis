package axis.service.axis;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_COMMON;
import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.jdbc.PAC_IAX_PERSONA;
import axis.jdbc.PAC_IAX_REDCOMERCIAL;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.model.UsuarioBean;
import axis.util.Constantes;

/**
 * Axisage002Service.java 08/10/2008
 * 
 * @author <a href="rkirchner@csi-ti.com">Roger Kirchner</a>
 * @since Java 5.0
 */
public class Axisage002Service extends AxisBaseService {
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
		logger.debug("Axisage002Service m_form");

		try {
			request.getSession().setAttribute("RED_DummyCodeAgent", new BigDecimal(-999));

		} catch (Exception e) {
			logger.error("Error en el servicio Axisage002Service - m�todo m_form", e);
			AbstractDispatchAction.guardarMensaje(request,
					"verbatim:<b>" + e.getClass().getName() + ":</b> " + e.getLocalizedMessage(),
					new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
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
	public void m_cargarDetalleAgente(HttpServletRequest request) {
		logger.debug("Axisage002Service m_cargarDetalleAgente");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {
			BigDecimal CAGENTE = getCampoNumerico(request, "CAGENTE");

			/* LISTVALORES */
			PAC_IAX_LISTVALORES pac_iax_listvalores = new PAC_IAX_LISTVALORES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map LISTVALORES = new HashMap();

			if (!isEmpty(CAGENTE)) {
				if (CAGENTE.equals(request.getSession().getAttribute("RED_DummyCodeAgent")))
					CAGENTE = BigDecimal.ONE;

				PAC_IAX_REDCOMERCIAL pac_iax_redcomercial = new PAC_IAX_REDCOMERCIAL(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

				/* Cargar datos agente */
				Map map = pac_iax_redcomercial.ejecutaPAC_IAX_REDCOMERCIAL__F_GET_DATOSAGENTE(CAGENTE);
				logger.debug(map);

				tratarRETURNyMENSAJES(request, map);

				Map AGENTE = (Map) map.get("AGENTE");
				formdata.put("AGENTE", AGENTE);
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

				/* Tratamiento datos persona */
				// SPERSON del AGENTE
				BigDecimal SPERSON = !isEmpty(AGENTE) ? (BigDecimal) AGENTE.get("SPERSON") : null;

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

				/* LSTTIPOIVA */
				map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTTIPOIVA();
				logger.debug(map);
				LISTVALORES.put("LSTTIPOIVA", tratarRETURNyMENSAJES(request, map));

				/* LSTRETENCION */
				map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTRETENCION();
				logger.debug(map);
				LISTVALORES.put("LSTRETENCION", tratarRETURNyMENSAJES(request, map));

				/* LSTAGECOMISION */
				map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTAGECOMISION(new BigDecimal(1));
				logger.debug(map);
				LISTVALORES.put("LSTAGECOMISION", tratarRETURNyMENSAJES(request, map));
				// Ini BUG 24640 - 14/11/2012 - ECP - Sobrecomisi�n
				/* LSTAGESOBRECOMISION */
				map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTAGECOMISION(new BigDecimal(2));
				logger.debug(map);
				LISTVALORES.put("LSTAGESOBRECOMISION", tratarRETURNyMENSAJES(request, map, false));
				// Fin BUG 24640 - 14/11/2012 - ECP - Sobrecomisi�n
				/* LSTESTADOAGENTE */
				map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTESTADOAGENTE(null, null, null, null);
				logger.debug(map);
				LISTVALORES.put("LSTESTADOAGENTE", tratarRETURNyMENSAJES(request, map));

				/* LSTTIPOAGENTE */
				map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTTIPOAGENTE();
				logger.debug(map);
				LISTVALORES.put("LSTTIPOAGENTE", tratarRETURNyMENSAJES(request, map));

				formdata.put("LISTVALORES", LISTVALORES);
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisage002Service - m�todo m_cargarDetalleAgente", e);
			AbstractDispatchAction.guardarMensaje(request,
					"verbatim:<b>" + e.getClass().getName() + ":</b> " + e.getLocalizedMessage(),
					new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

}
