package axis.service.axis;

import java.math.BigDecimal;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.Date;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_GESTIONBPM;
import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.jdbc.PAC_IAX_PRODUCCION;
import axis.jdbc.PAC_IAX_REHABILITA;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.control.axis.Axisctr072Action;
import axis.mvc.model.UsuarioBean;
import axis.util.Constantes;
import axis.util.ConversionUtil;

/**
 * Axisctr072Service.java 20/05/2009
 * 
 * @since Java 5.0
 */
public class Axisctr072Service extends AxisBaseService {
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
	public void m_form(HttpServletRequest request, Axisctr072Action thisAction) {
		logger.debug("Axisctr072Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {

			BigDecimal SSEGURO = getCampoNumerico(request, "SSEGURO");

			if (!isEmpty(SSEGURO)) {

				PAC_IAX_REHABILITA pacIaxRehabilita = new PAC_IAX_REHABILITA(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
				PAC_IAX_PRODUCCION pacIaxProduccion = new PAC_IAX_PRODUCCION(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
				Map map = pacIaxProduccion.ejecutaPAC_IAX_PRODUCCION__F_GET_DATPOLIZA(SSEGURO);
				logger.debug(map);
				Map datosPoliza = (Map) tratarRETURNyMENSAJES(request, map);
				// BUG 39659 28/01/2016(abans de guardarlo a la request aegim el nou camp)
				BigDecimal nrenovcolm = null;
				if (!isEmpty(datosPoliza.get("NANUALI"))) {
					nrenovcolm = ((BigDecimal) datosPoliza.get("NANUALI")).add(new BigDecimal(-1));
				}
				datosPoliza.put("NRENOVCOLM", nrenovcolm);
				// Fi 39659
				request.setAttribute("datosPoliza", datosPoliza);
				map = pacIaxProduccion.ejecutaPAC_IAX_PRODUCCION__F_SET_CONSULTAPOLIZA(SSEGURO);
				logger.debug(map);
				AbstractDispatchAction.topPila(request, "SPRODUC", datosPoliza.get("SPRODUC"));

				if (BigDecimal.ZERO.equals(tratarRETURNyMENSAJES(request, map))) {

					map = pacIaxProduccion.ejecutaPAC_IAX_PRODUCCION__F_LEETOMADORES();
					logger.debug(map);
					request.setAttribute("T_IAX_TOMADORES", tratarRETURNyMENSAJES(request, map));

					BigDecimal NRIESGO = (BigDecimal) AbstractDispatchAction.topPila(request, "NRIESGO");

					// map =
					// pacIaxProduccion.ejecutaPAC_IAX_PRODUCCION__F_LEEASEGURADOS(!isEmpty(NRIESGO)
					// ? NRIESGO : BigDecimal.ONE, (BigDecimal)datosPoliza.get("SPRODUC"));
					map = pacIaxProduccion.ejecutaPAC_IAX_PRODUCCION__F_GET_GESTRIESGOS();
					logger.debug(map);
					request.setAttribute("T_IAX_ASEGURADOS", tratarRETURNyMENSAJES(request, map));

					if (!isEmpty(datosPoliza)) {

						// Recuperar el nombre del agente
						BigDecimal CAGENTE = (BigDecimal) datosPoliza.get("CAGENTE");
						if (!isEmpty(CAGENTE)) {
							try {
								// M�todo "a pi��n"
								datosPoliza
										.put("TAGENTE",
												((Map) ((List) tratarRETURNyMENSAJES(request, new PAC_IAX_LISTVALORES(
														(java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
														.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTAGENTES(null, null,
																CAGENTE.toString(), BigDecimal.ONE)))
														.get(0)).get("NOMBRE"));
							} catch (Exception e) {
								logger.debug("No se ha encontrado el nombre del agente '" + CAGENTE + "'.");
							}
						}

						map = pacIaxRehabilita.ejecutaPAC_IAX_REHABILITA__F_GET_FSUPLEM(SSEGURO);
						logger.debug(map);
						datosPoliza.put("FSUPLEM", tratarRETURNyMENSAJES(request, map));
						Boolean grabarOk = (Boolean) request.getAttribute("grabarOk");
						// 09/09/2014 CMP. validacio no correcta?
						if (grabarOk != null && grabarOk.booleanValue()) {
							datosPoliza.put("TMOTIVO", "");
						} else {

							map = pacIaxRehabilita.ejecutaPAC_IAX_REHABILITA__F_GET_MOTANUL(SSEGURO);
							logger.debug(map);
							datosPoliza.put("TMOTIVO", tratarRETURNyMENSAJES(request, map));

						}

						map = this.ejecutaPAC_IAX_LISTVALORES__F_GET_MOTIVOSREHAB(
								(java.sql.Connection) request.getAttribute(Constantes.DB01CONN),
								(BigDecimal) datosPoliza.get("SPRODUC"));
						logger.debug(map);
						request.setAttribute("LST_MOTIVOSREHAB", tratarRETURNyMENSAJES(request, map, false));

						map = pacIaxRehabilita.ejecutaPAC_IAX_REHABILITA__F_GET_PREGUNTA(SSEGURO);
						logger.debug(map);
						request.setAttribute("PREGUNTA", tratarRETURNyMENSAJES(request, map));
					}
				}
				// ini BPM
				BigDecimal NCASO_BPM = this.getCampoNumerico(request, "NCASO_BPM");
				if (isEmpty(NCASO_BPM)) {
					PAC_IAX_GESTIONBPM pac_iax_gestionbpm = new PAC_IAX_GESTIONBPM(
							(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
					BigDecimal NPOLIZA = (BigDecimal) datosPoliza.get("NPOLIZA");
					BigDecimal NCERTIF = (BigDecimal) datosPoliza.get("NCERTIF");
					map = pac_iax_gestionbpm.ejecutaPAC_IAX_GESTIONBPM__F_GET_CASO_BPM(NPOLIZA, NCERTIF,
							"REHABILITACION");
					logger.debug(map);
					tratarRETURNyMENSAJES(request, map);
					HashMap CASOBPM = (HashMap) map.get("PCASOBPM");
					request.setAttribute("NNUMCASO", CASOBPM.get("NNUMCASO") == null ? request.getAttribute("NNUMCASO")
							: CASOBPM.get("NNUMCASO"));
					request.setAttribute("NCASO_BPM",
							CASOBPM.get("NCASO_BPM") == null ? request.getAttribute("NCASO_BPM")
									: CASOBPM.get("NCASO_BPM"));
					request.setAttribute("NSOLICI_BPM",
							CASOBPM.get("NSOLICI_BPM") == null ? request.getAttribute("NSOLICI_BPM")
									: CASOBPM.get("NSOLICI_BPM"));
					request.setAttribute("TNOMCOM",
							CASOBPM.get("TNOMCOM") == null ? request.getAttribute("TNOMCOM") : CASOBPM.get("TNOMCOM"));
				}
				// fi BPM
			}
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr072Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
		// this.c_onfigForm(request, whoami(this));
		// this.c_argaDependencias(request, (List)request.getAttribute("DEPENDENCIAS"));
	}

	// --START-PAC_IAX_LISTVALORES.F_GET_MOTIVOSREHAB(PSPRODUC)

	private HashMap callPAC_IAX_LISTVALORES__F_GET_MOTIVOSREHAB(Connection conn, java.math.BigDecimal pPSPRODUC)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_LISTVALORES.F_GET_MOTIVOSREHAB(?, ?)}";

		Object sIN[] = new String[] { "pPSPRODUC" };
		Object pIN[] = new Object[] { pPSPRODUC };
		StringBuffer sB = new StringBuffer();
		sB.append("callQuery:").append(callQuery).append(", parametros:");
		for (int i = 0; i < sIN.length; i++) {
			sB.append(sIN[i]).append("=").append(pIN[i]);
			if (i < sIN.length - 1)
				sB.append(", ");
		}
		logger.debug(sB.toString());

		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSPRODUC);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.CURSOR); // Valor de "RETURN"
		cStmt.registerOutParameter(3, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES"
		cStmt.execute();
		HashMap retVal = new HashMap();
		try {
			retVal.put("RETURN", cStmt.getObject(1));
		} catch (SQLException e) {
			retVal.put("RETURN", null);
		}
		try {
			retVal.put("MENSAJES", cStmt.getObject(3));
		} catch (SQLException e) {
			retVal.put("MENSAJES", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal);// ecg20110914 AXIS-WLS1SERVER . mover
																	// convertOracleObjects antes del close
		cStmt.close();
		return retVal;
	}

	public HashMap ejecutaPAC_IAX_LISTVALORES__F_GET_MOTIVOSREHAB(Connection conn, java.math.BigDecimal pPSPRODUC)
			throws Exception {
		return this.callPAC_IAX_LISTVALORES__F_GET_MOTIVOSREHAB(conn, pPSPRODUC);
	}
	// --END-PAC_IAX_LISTVALORES.F_GET_MOTIVOSREHAB

	/**
	 * 
	 * @param request
	 * @return true o false indicando si la actualitzaci�n de la p�liza.
	 */
	@SuppressWarnings("all")
	public void m_rehabilitar(HttpServletRequest request, Axisctr072Action thisAction) {
		logger.debug("Axisctr061Service m_siguiente");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map map = new HashMap();

		try {
			HashMap m = this.f_Get_Avisos(request, this.whoami(this));
			BigDecimal pRETURN = (BigDecimal) this.tratarRETURNyMENSAJES(request, m);
			request.setAttribute("PLSTAVISOS", m.get("PLSTAVISOS"));

			if (pRETURN != null && pRETURN.intValue() != 1) {

				// INI VALIDA DATOS BPM
				BigDecimal NNUMCASO = getCampoNumerico(request, "NNUMCASO");
				BigDecimal NCASO_BPM = getCampoNumerico(request, "NCASO_BPM");
				BigDecimal NSOLICI_BPM = getCampoNumerico(request, "NSOLICI_BPM");
				String TNOMCOM = getCampoTextual(request, "TNOMCOM");
				// para mantener en pantalla los datos de BPM, se guardan en la request
				request.setAttribute("NNUMCASO", NNUMCASO);
				request.setAttribute("NCASO_BPM", NCASO_BPM);
				request.setAttribute("NSOLICI_BPM", NSOLICI_BPM);
				request.setAttribute("TNOMCOM", TNOMCOM);

				BigDecimal SPRODUC = getCampoNumerico(request, "SPRODUC");
				BigDecimal NPOLIZA = getCampoNumerico(request, "NPOLIZA");
				BigDecimal NCERTIF = getCampoNumerico(request, "NCERTIF");

				m = new PAC_IAX_GESTIONBPM((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_GESTIONBPM__F2_VALIDA_DATOSBPM(NCASO_BPM, NSOLICI_BPM, SPRODUC, NPOLIZA,
								NCERTIF, "REHABILITACION");
				pRETURN = (BigDecimal) this.tratarRETURNyMENSAJES(request, m);
				logger.debug(m);
				// FIN VALIDA DATOS BPM
				if (pRETURN != null && BigDecimal.ZERO.equals(pRETURN)) {

					PAC_IAX_REHABILITA pacIaxRehabilita = new PAC_IAX_REHABILITA(
							(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
					BigDecimal SSEGURO = getCampoNumerico(request, "SSEGURO");
					BigDecimal CMOTMOV = getCampoNumerico(request, "CMOTMOV");
					BigDecimal ANULA_EXTORN = getCampoNumerico(request, "ANULA_EXTORN");

					map = pacIaxRehabilita.ejecutaPAC_IAX_REHABILITA__F_REHABILITAPOL(SSEGURO, CMOTMOV, ANULA_EXTORN);
					logger.debug(map);
					pRETURN = (BigDecimal) tratarRETURNyMENSAJES(request, map);
					request.setAttribute("grabarOk", BigDecimal.ZERO.equals(pRETURN));
					if (pRETURN != null && BigDecimal.ZERO.equals(pRETURN)) {

						// INI BPM --> INFORMAR DATOS EN CASOS_BPMSEG
						m = new PAC_IAX_GESTIONBPM((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
								.ejecutaPAC_IAX_GESTIONBPM__F_TRATA_MOVPOLIZA(SSEGURO, null, NCASO_BPM, NSOLICI_BPM,
										NNUMCASO);
						logger.debug(m);
						pRETURN = (BigDecimal) this.tratarRETURNyMENSAJES(request, m);
						// FIN BPM --> INFORMAR DATOS EN CASOS_BPMSEG
					}
				}
			}
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr072Service - m�todo m_rehabilitar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
		// this.c_onfigForm(request, whoami(this));
		// this.c_argaDependencias(request, (List)request.getAttribute("DEPENDENCIAS"));
	}

	public void m_sol_rehabilitar(HttpServletRequest request, Axisctr072Action thisAction) {
		logger.debug("Axisctr061Service m_siguiente");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map map = new HashMap();

		try {

			PAC_IAX_REHABILITA pacIaxRehabilita = new PAC_IAX_REHABILITA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			BigDecimal SSEGURO = getCampoNumerico(request, "SSEGURO");
			BigDecimal CMOTMOV = getCampoNumerico(request, "CMOTMOV");
			BigDecimal NRIESGO = getCampoNumerico(request, "NRIESGO");
			Date FREHAB = stringToSqlDate(getCampoTextual(request, "FREHAB"));
			String TOBSERV = getCampoTextual(request, "TOBSERV");

			BigDecimal NNUMCASO = getCampoNumerico(request, "NNUMCASO");
			BigDecimal NCASO_BPM = getCampoNumerico(request, "NCASO_BPM");
			BigDecimal NSOLICI_BPM = getCampoNumerico(request, "NSOLICI_BPM");
			String TNOMCOM = getCampoTextual(request, "TNOMCOM");
			// para mantener en pantalla los datos de BPM se guardan en la request
			request.setAttribute("NNUMCASO", NNUMCASO);
			request.setAttribute("NCASO_BPM", NCASO_BPM);
			request.setAttribute("NSOLICI_BPM", NSOLICI_BPM);
			request.setAttribute("TNOMCOM", TNOMCOM);

			map = pacIaxRehabilita.ejecutaPAC_IAX_REHABILITA__F_SET_SOLREHAB(SSEGURO, CMOTMOV, NRIESGO, FREHAB,
					TOBSERV);
			logger.debug(map);
			request.setAttribute("grabarOk", BigDecimal.ZERO.equals(tratarRETURNyMENSAJES(request, map)));

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr072Service - m�todo m_rehabilitar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);

		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}

	public void m_ajax_cargar_casobpm(HttpServletRequest request) {
		logger.debug("Axisctr072Service m_ajax_cargar_casobpm");
		AjaxContainerService ajax = new AjaxContainerService();

		try {
			BigDecimal NCASO_BPM = getCampoNumerico(request, "NCASO_BPM");
			BigDecimal NSOLICI_BPM = getCampoNumerico(request, "NSOLICI_BPM");
			BigDecimal NNUMCASO = getCampoNumerico(request, "NNUMCASO");

			PAC_IAX_GESTIONBPM pac_iax_gestionbpm = new PAC_IAX_GESTIONBPM(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			Map m = pac_iax_gestionbpm.ejecutaPAC_IAX_GESTIONBPM__F_GET_TOMCASO(NNUMCASO, NCASO_BPM, NSOLICI_BPM);
			logger.debug(m);
			ajax.rellenarPlAContenedorAjax(m);
			ajax.guardarContenidoFinalAContenedorAjax(m);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr072Service - m�todo  m_ajax_cargar_casobpm", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}
}
