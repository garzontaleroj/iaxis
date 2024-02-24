package axis.service.axis;

import java.math.BigDecimal;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.Date;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.cache.AxisCodeWizard;
import axis.jdbc.PAC_IAX_DESCVALORES;
import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.jdbc.PAC_IAX_PRODUCCION;
import axis.jdbc.PAC_IAX_PRODUCCION_AUT;
import axis.jdbc.PAC_IAX_SIMULACIONES;
import axis.jdbc.PAC_IAX_VALIDACIONES;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.control.axis.Axisctr061Action;
import axis.mvc.model.UsuarioBean;
import axis.util.Constantes;
import axis.util.ConversionUtil;

/**
 * Axisctr061Service.java 10/03/2009
 * 
 * @since Java 5.0
 */
public class Axisctr061Service extends AxisBaseService {
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
		logger.debug("Axisctr061Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {

			logger.debug("----> modo:" + AbstractDispatchAction.topPila(request, "CMODO"));
			formdata.put("CMODO", AbstractDispatchAction.topPila(request, "CMODO"));
			formdata.put("DONDE", getCampoTextual(request, "DONDE"));

			PAC_IAX_PRODUCCION_AUT pacIaxProduccionAut = new PAC_IAX_PRODUCCION_AUT(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			BigDecimal NRIESGO = (BigDecimal) AbstractDispatchAction.topPila(request, "NRIESGO");

			if (isEmpty(NRIESGO))
				NRIESGO = BigDecimal.ONE;

			/* Leer todos los conductores */
			Map map = pacIaxProduccionAut.ejecutaPAC_IAX_PRODUCCION_AUT__F_LEE_CONDUCTORES(NRIESGO);
			logger.debug(map);
			List<Map> T_IAX_AUTCONDUCTORES = (List<Map>) tratarRETURNyMENSAJES(request, map);
			request.setAttribute("T_IAX_AUTCONDUCTORES", T_IAX_AUTCONDUCTORES);

			// Pillamos el numero de asegurados de base de datos
			Map asegurados = pacIaxProduccionAut.ejecutaPAC_IAX_PRODUCCION_AUT__F_LEEASEGURADOS(NRIESGO);
			List<Map> T_IAX_ASEGURADOS = (List<Map>) tratarRETURNyMENSAJES(request, asegurados);
			Integer numAsegurados = 0;
			if (T_IAX_ASEGURADOS != null) {
				numAsegurados = T_IAX_ASEGURADOS.size();
			}

			// Vamos a comprobar que haya al menos un asegurado que sea persona fisica, si
			// todas son juridicas no mostraremos la opcion "asegurado como conductor"
			boolean hayPersonaFisica = false;
			if (T_IAX_ASEGURADOS != null) {
				for (Map asegurado : T_IAX_ASEGURADOS) {
					Map ob_asegurado = (HashMap) asegurado.get("OB_IAX_ASEGURADOS");
					BigDecimal ctipper = (BigDecimal) ob_asegurado.get("CTIPPER");
					if (ctipper.equals(new BigDecimal("1"))) {
						hayPersonaFisica = true;
					} else {
						// Si es persona juridica no contara como asegurado a tener en cuenta en el
						// raido button
						numAsegurados = numAsegurados - 1;
					}
				}
			}
			request.setAttribute("hayPersonaFisica", hayPersonaFisica);

			/* Recuperar info TOMADOR 0 */
			Map tomador0 = m_lee_datos_tomador(request);
			boolean tomadorIsAseg = true;
			if (!isEmpty(tomador0))
				tomadorIsAseg = BigDecimal.ONE.equals(tomador0.get("ISASEG"));

			// Si hay m�s de un asegurado, ponemos tomadorIsAseg=false, as� se ve el radio
			// button de marcar el asegurado
			if (numAsegurados != null && numAsegurados > 1 && tomadorIsAseg == true) {
				tomadorIsAseg = false;
			}

			// Si ISASEG == 0, mostramos la pregunta de "Propietario".
			// Si ISASEG == 1, no hacemos ninguna gesti�n de Propietario.
			request.setAttribute("tomadorIsAseg", tomadorIsAseg);

			/* Recuperar info ASEGURADO 0 */
			Map asegurado0 = new HashMap();
			if (tomador0 != null) {
				asegurado0 = m_lee_datos_asegurado_no_tomador(request, (BigDecimal) tomador0.get("SPERSON"));
			} else {
				asegurado0 = m_lee_datos_asegurado(request);
			}

			/* Consultar info de Conductores en relaci�n al Tomador y al Asegurado */
			if (!isEmpty(T_IAX_AUTCONDUCTORES)) {
				BigDecimal SPERSONtomador = new BigDecimal(0);
				if (!isEmpty(tomador0) && !isEmpty(tomador0.get("SPERSON"))) {
					SPERSONtomador = (BigDecimal) tomador0.get("SPERSON");
				} else {
					request.setAttribute("tomVacio", new BigDecimal(1));

				}
				BigDecimal SPERSONasegurado = new BigDecimal(0);
				if (!isEmpty(asegurado0) && !isEmpty(asegurado0.get("SPERSON"))) {
					SPERSONasegurado = (BigDecimal) asegurado0.get("SPERSON");

				} else {
					request.setAttribute("asegVacio", new BigDecimal(1));
				}

				for (Map conductor : T_IAX_AUTCONDUCTORES) {
					conductor = (Map) conductor.get("OB_IAX_AUTCONDUCTORES");
					BigDecimal NORDEN = (BigDecimal) conductor.get("NORDEN");
					BigDecimal SPERSONconductor = (BigDecimal) conductor.get("SPERSON");

					if (!isEmpty(SPERSONconductor) && SPERSONconductor.equals(SPERSONtomador)) {
						// Miramos si el conductor es el tomador
						conductor.put("ES_TOMADOR", true);
						// Indicar a la pantalla, si el tomador es o no un conductor ocasional.
						request.setAttribute("tomadorEsConductorOcasional", !BigDecimal.ZERO.equals(NORDEN));
					}

					if (!tomadorIsAseg && !isEmpty(SPERSONconductor) && SPERSONconductor.equals(SPERSONasegurado)) {
						// Miramos si el conductor es el asegurado
						conductor.put("ES_PROPIETARIO", true);
						// Indicar a la pantalla, si el propietario es o no un conductor ocasional.
						request.setAttribute("propietarioEsConductorOcasional", !BigDecimal.ZERO.equals(NORDEN));
					}

					// Si no hay ningun conductor seleccionado, marcarlo para visualizar su detalle.
					// (S�lo para conductores ocasionales)
					if (!BigDecimal.ZERO.equals(NORDEN) && isEmpty(getCampoNumerico(request, "SELECTED_NORDEN")))
						formdata.put("SELECTED_NORDEN", NORDEN);

				}

				/* Establecer conductor habitual, si lo hay */
				Map CONDUCTOR_HABITUAL = getObjetoDeLista(T_IAX_AUTCONDUCTORES, "0", "NORDEN", "OB_IAX_AUTCONDUCTORES");

				// Ponemos el conductor habitual en su propio atributo, y lo borramos
				// de la lista (ya que lo mostraremos a parte, no en el multiregistro).
				if (!isEmpty(CONDUCTOR_HABITUAL)) {
					request.setAttribute("CONDUCTOR_HABITUAL", CONDUCTOR_HABITUAL);
					T_IAX_AUTCONDUCTORES.remove(0);

					Map mmm = this.dbGetLstDomiPerson(request, usuario, (BigDecimal) CONDUCTOR_HABITUAL.get("SPERSON"));
					logger.debug("--> direcciones:" + mmm);
					ArrayList direcciones = (ArrayList) tratarRETURNyMENSAJES(request, mmm);
					formdata.put("lstdomicilios", direcciones);

					HashMap conductor = (HashMap) CONDUCTOR_HABITUAL.get("PERSONA");
					ArrayList OB_IAX_DIRECCIONES = (ArrayList) conductor.get("DIRECCIONES");
					BigDecimal CDOMICI = (BigDecimal) CONDUCTOR_HABITUAL.get("CDOMICI");
					logger.debug("---> CDOMICI:" + CDOMICI);
					logger.debug("---> OB_IAX_DIRECCIONES:" + OB_IAX_DIRECCIONES);
					if (CDOMICI == null) {
						mmm = this.dbGetLstDomiPerson(request, usuario, (BigDecimal) tomador0.get("SPERSON"));
						direcciones = (ArrayList) tratarRETURNyMENSAJES(request, mmm);
						if (direcciones != null && direcciones.size() > 0)
							CDOMICI = (BigDecimal) ((HashMap) direcciones.get(0)).get("CDOMICI");
					}
					if (!isEmpty(OB_IAX_DIRECCIONES)) {

						for (int i = 0; i < OB_IAX_DIRECCIONES.size(); i++) {

							HashMap dire = (HashMap) OB_IAX_DIRECCIONES.get(i);
							logger.debug("---> dire:" + dire);
							HashMap OB_IAX_DIRECCIONE = (HashMap) dire.get("OB_IAX_DIRECCIONES");

							if (OB_IAX_DIRECCIONE.get("CDOMICI").equals(CDOMICI)) {
								formdata.put("CPAIS", OB_IAX_DIRECCIONE.get("CPAIS"));
								formdata.put("TPAIS", OB_IAX_DIRECCIONE.get("TPAIS"));
								formdata.put("CPROVIN", OB_IAX_DIRECCIONE.get("CPROVIN"));
								formdata.put("TPROVIN", OB_IAX_DIRECCIONE.get("TPROVIN"));
								formdata.put("CPOBLAC", OB_IAX_DIRECCIONE.get("CPOBLAC"));
								formdata.put("TPOBLAC", OB_IAX_DIRECCIONE.get("TPOBLAC"));
								break;
							}
						}
					}
				}

				/* Ver si queremos visualizar el detalle de alg�n conductor */
				getDetalleConductor(request, T_IAX_AUTCONDUCTORES);
			} else {

				if (!isEmpty(tomador0) && !isEmpty(tomador0.get("SPERSON"))) {
					request.setAttribute("tomVacio", new BigDecimal(0));
					BigDecimal SPRODUC = (BigDecimal) AbstractDispatchAction.topPila(request, "SPRODUC");
					HashMap map2 = pacIaxProduccionAut.ejecutaPAC_IAX_PRODUCCION_AUT__F_SET_CONDUCTOR_TOMADOR(NRIESGO,
							new BigDecimal(0), (BigDecimal) tomador0.get("SPERSON"), SPRODUC);
					tratarRETURNyMENSAJES(request, map2);
					if (map2.get("RETURN") != null && map2.get("RETURN").equals(BigDecimal.ZERO)) {
						map2 = pacIaxProduccionAut.ejecutaPAC_IAX_PRODUCCION_AUT__F_LEE_CONDUCTORES(NRIESGO);
						logger.debug(map2);
						T_IAX_AUTCONDUCTORES = (List<Map>) tratarRETURNyMENSAJES(request, map2);
						request.setAttribute("T_IAX_AUTCONDUCTORES", T_IAX_AUTCONDUCTORES);
						if (!isEmpty(T_IAX_AUTCONDUCTORES)) {
							Map CONDUCTOR_HABITUAL = getObjetoDeLista(T_IAX_AUTCONDUCTORES, "0", "NORDEN",
									"OB_IAX_AUTCONDUCTORES");
							T_IAX_AUTCONDUCTORES.remove(0);
							CONDUCTOR_HABITUAL.put("ES_TOMADOR", true);
							request.setAttribute("CONDUCTOR_HABITUAL", CONDUCTOR_HABITUAL);
							Map mmm = this.dbGetLstDomiPerson(request, usuario,
									(BigDecimal) CONDUCTOR_HABITUAL.get("SPERSON"));
							logger.debug("--> direcciones CONDUCTOR_HABITUAL-TOMADOR:" + mmm);
							formdata.put("lstdomicilios", (ArrayList) tratarRETURNyMENSAJES(request, mmm));
						}
					}
				} else {
					request.setAttribute("tomVacio", new BigDecimal(1));
				}
				if (!isEmpty(asegurado0) && !isEmpty(asegurado0.get("SPERSON"))) {
					request.setAttribute("asegVacio", new BigDecimal(0));
				} else {
					request.setAttribute("asegVacio", new BigDecimal(1));
				}

			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr061Service - m�todo m_form", e);
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
	 * Recupera un determinado conductor de la lista T_IAX_AUTCONDUCTORES Dado un
	 * determinado NORDEN Y lo pone en el request attribute "CONDUCTOR_OCASIONAL"
	 * 
	 * @param request
	 */
	@SuppressWarnings("all")
	private void getDetalleConductor(HttpServletRequest request, List<Map> T_IAX_AUTCONDUCTORES) {
		logger.debug("Axisctr061Service getDetalleConductor");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {

			BigDecimal SELECTED_NORDEN = getCampoNumerico(request, "SELECTED_NORDEN");

			if (isEmpty(SELECTED_NORDEN) && !isEmpty(T_IAX_AUTCONDUCTORES) && T_IAX_AUTCONDUCTORES.size() >= 1)
				// Si no hay ninguno seleccionado, seleccionar el primero
				SELECTED_NORDEN = (BigDecimal) ((Map) T_IAX_AUTCONDUCTORES.get(0).get("OB_IAX_AUTCONDUCTORES"))
						.get("NORDEN");

			if (!isEmpty(SELECTED_NORDEN)) {
				request.setAttribute("CONDUCTOR_OCASIONAL", getObjetoDeLista(T_IAX_AUTCONDUCTORES,
						SELECTED_NORDEN.toString(), "NORDEN", "OB_IAX_AUTCONDUCTORES"));

				Map conductor = getObjetoDeLista(T_IAX_AUTCONDUCTORES, SELECTED_NORDEN.toString(), "NORDEN",
						"OB_IAX_AUTCONDUCTORES");

				logger.debug("conductor ocasional:" + conductor);

				if (!isEmpty(conductor)) {
					formdata.put("CDOMICIOCA", conductor.get("CDOMICI"));
					if (!isEmpty(conductor.get("SPERSON"))) {
						Map mmm = this.dbGetLstDomiPerson(request, usuario, (BigDecimal) conductor.get("SPERSON"));
						ArrayList direcciones = (ArrayList) tratarRETURNyMENSAJES(request, mmm);
						formdata.put("lstdomioca", direcciones);
					}
				}
			}
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr061Service - m�todo getDetalleConductor", e);
			AbstractDispatchAction.guardarMensaje(request,
					"verbatim:<b>" + e.getClass().getName() + ":</b> " + e.getLocalizedMessage(),
					new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

	/**
	 * 
	 * @param request
	 * @return Un objeto tomador
	 */
	@SuppressWarnings("all")
	public Map m_lee_datos_tomador(HttpServletRequest request, List<Map> T_IAX_TOMADORES) {
		logger.debug("Axisctr061Service m_lee_datos_tomador");

		try {

			// TODO: Suposici�n de que s�lo hay un tomador
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
			if (!isEmpty(T_IAX_TOMADORES) && T_IAX_TOMADORES.size() > 0) {
				return (Map) T_IAX_TOMADORES.get(0).get("OB_IAX_TOMADORES");
			}
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
			return null;

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr061Service - m�todo m_lee_datos_tomador", e);
			AbstractDispatchAction.guardarMensaje(request,
					"verbatim:<b>" + e.getClass().getName() + ":</b> " + e.getLocalizedMessage(),
					new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
			return null;
		}
	}

	/**
	 * 
	 * @param request
	 * @return Un objeto tomador
	 */
	@SuppressWarnings("all")
	public Map m_lee_datos_tomador(HttpServletRequest request) {
		logger.debug("Axisctr061Service m_lee_datos_tomador");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {

			Map map = new PAC_IAX_PRODUCCION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_PRODUCCION__F_LEETOMADORES();
			logger.debug(map);
			List<Map> T_IAX_TOMADORES = (List<Map>) tratarRETURNyMENSAJES(request, map);
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
			return m_lee_datos_tomador(request, T_IAX_TOMADORES);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr061Service - m�todo m_lee_datos_tomador", e);
			AbstractDispatchAction.guardarMensaje(request,
					"verbatim:<b>" + e.getClass().getName() + ":</b> " + e.getLocalizedMessage(),
					new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
			return null;
		}
	}

	/**
	 * 
	 * @param request
	 * @return Un objeto asegurado
	 */
	@SuppressWarnings("all")
	public Map m_lee_datos_asegurado(HttpServletRequest request) {
		logger.debug("Axisctr061Service m_lee_datos_asegurado");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {

			BigDecimal NRIESGO = (BigDecimal) AbstractDispatchAction.topPila(request, "NRIESGO");

			if (isEmpty(NRIESGO))
				NRIESGO = BigDecimal.ONE;

			// TODO: Descomentar esta llamada, cuando se pueda incluir en PAC_IAX_PRODUCCION
			// Map map = new
			// PAC_IAX_PRODUCCION((java.sql.Connection)request.getAttribute(Constantes.DB01CONN)).ejecutaPAC_IAX_PRODUCCION__F_LEEULTASEGURADO(NRIESGO);
			Map map = ejecutaPAC_IAX_PRODUCCION__F_LEEULTASEGURADO(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN), NRIESGO);
			logger.debug(map);
			Map OB_IAX_ASEGURADOS = (Map) tratarRETURNyMENSAJES(request, map);
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
			return OB_IAX_ASEGURADOS;

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr061Service - m�todo m_lee_datos_asegurado", e);
			AbstractDispatchAction.guardarMensaje(request,
					"verbatim:<b>" + e.getClass().getName() + ":</b> " + e.getLocalizedMessage(),
					new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
			return null;
		}
	}

	/**
	 * 
	 * @param request
	 * @return Un objeto asegurado
	 */
	@SuppressWarnings("all")
	public Map m_lee_datos_asegurado_no_tomador(HttpServletRequest request, BigDecimal NTOMADOR) {
		logger.debug("Axisctr061Service m_lee_datos_asegurado");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {

			BigDecimal NRIESGO = (BigDecimal) AbstractDispatchAction.topPila(request, "NRIESGO");

			if (isEmpty(NRIESGO))
				NRIESGO = BigDecimal.ONE;

			// TODO: Descomentar esta llamada, cuando se pueda incluir en PAC_IAX_PRODUCCION
			// Map map = new
			// PAC_IAX_PRODUCCION((java.sql.Connection)request.getAttribute(Constantes.DB01CONN)).ejecutaPAC_IAX_PRODUCCION__F_LEEULTASEGURADO(NRIESGO);
			Map map = new PAC_IAX_PRODUCCION_AUT((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_PRODUCCION_AUT__F_LEEASEGURADONOTOMADOR(NRIESGO, NTOMADOR);

			logger.debug(map);
			Map OB_IAX_ASEGURADOS = (Map) tratarRETURNyMENSAJES(request, map);
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
			return OB_IAX_ASEGURADOS;

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr061Service - m�todo m_lee_datos_asegurado", e);
			AbstractDispatchAction.guardarMensaje(request,
					"verbatim:<b>" + e.getClass().getName() + ":</b> " + e.getLocalizedMessage(),
					new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
			return null;
		}
	}

	/**
	 * TODO - To be deprecated Esto debe ir en PAC_IAX_PRODUCCION.java, cuando est�
	 * libre.
	 * 
	 * @param pPNRIESGO
	 * @return
	 * @throws Exception
	 */
	private HashMap callPAC_IAX_PRODUCCION__F_LEEULTASEGURADO(Connection conn, java.math.BigDecimal pPNRIESGO)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_PRODUCCION.F_LEEULTASEGURADO(?, ?)}";

		Object sIN[] = new String[] { "pPNRIESGO" };
		Object pIN[] = new Object[] { pPNRIESGO };
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
		cStmt.setObject(3, pPNRIESGO);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.STRUCT,
				UsuarioBean.fixOwner(USERNAME, "OB_IAX_ASEGURADOS".toUpperCase())); // Valor de "RETURN"
		cStmt.registerOutParameter(2, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES"
		cStmt.execute();
		HashMap retVal = new HashMap();
		try {
			retVal.put("RETURN", cStmt.getObject(1));
		} catch (SQLException e) {
			retVal.put("RETURN", null);
		}
		try {
			retVal.put("MENSAJES", cStmt.getObject(2));
		} catch (SQLException e) {
			retVal.put("MENSAJES", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal); // ecg20110914 AXIS-WLS1SERVER . mover
																	// convertOracleObjects antes del close
		cStmt.close();
		return retVal;
	}

	/**
	 * TODO - To be deprecated Esto debe ir en PAC_IAX_PRODUCCION.java, cuando est�
	 * libre.
	 * 
	 * @param conn
	 * @param pPNRIESGO
	 * @return
	 * @throws Exception
	 */
	public HashMap ejecutaPAC_IAX_PRODUCCION__F_LEEULTASEGURADO(Connection conn, java.math.BigDecimal pPNRIESGO)
			throws Exception {
		return this.callPAC_IAX_PRODUCCION__F_LEEULTASEGURADO(conn, pPNRIESGO);
	}
	// --END-PAC_IAX_PRODUCCION.F_LEEULTASEGURADO

	public void m_set_conductor_simul(HttpServletRequest request) {
		logger.debug("Axisctr061Service m_set_conductor_simul");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {

			BigDecimal NRIESGO = (BigDecimal) AbstractDispatchAction.topPila(request, "NRIESGO");

			if (isEmpty(NRIESGO))
				NRIESGO = BigDecimal.ONE;

			BigDecimal SPERSON = getCampoNumerico(request, "SPERSONBUS");
			String TNOMBRE = getCampoTextual(request, "TNOMBRE");
			String TNOMBRE1 = getCampoTextual(request, "TNOMBRE1");
			String TNOMBRE2 = getCampoTextual(request, "TNOMBRE2");
			String TAPELLI1 = getCampoTextual(request, "TAPELLI1");
			String TAPELLI2 = getCampoTextual(request, "TAPELLI2");
			BigDecimal CTIPIDE = getCampoNumerico(request, "CTIPIDE"); // tipo de documento
			BigDecimal TIDENTI = getCampoNumerico(request, "TIDENTI"); // tipo persona
			BigDecimal CSEXPER = getCampoNumerico(request, "CSEXPER");
			BigDecimal CDOMICI = getCampoNumerico(request, "CDOMICI");
			BigDecimal CPAIS = getCampoNumerico(request, "CPAIS");
			BigDecimal CPROVIN = getCampoNumerico(request, "CPROVIN");
			BigDecimal CPOBLAC = getCampoNumerico(request, "CPOBLAC");
			BigDecimal NORDEN = getCampoNumerico(request, "SELECTED_NORDEN");
			BigDecimal CPRINCIPAL = getCampoNumerico(request, "CPRINCIPAL");
			BigDecimal COCUPACION = getCampoNumerico(request, "COCUPACION");

			String fecha = getCampoTextual(request, "FNACIMI");
			String NNUMNIF = getCampoTextual(request, "NNUMNIF");
			java.sql.Date FNACIMI = this.stringToSqlDate(fecha, "dd/MM/yyyy");

			// Recoger dato SPERSON DE SESION
			if (isEmpty(SPERSON)) {
				SPERSON = new BigDecimal(0);
			}
			BigDecimal CDOMICIx = getCampoNumerico(request, "CDOMICIx");
			logger.debug("CDOMICIx:" + CDOMICIx);

			BigDecimal NPUNTOS = getCampoNumerico(request, "NPUNTOS");
			Date FCARNET = stringToSqlDate(getCampoTextual(request, "FCARNET"));
			BigDecimal EXPER_MANUAL = getCampoNumerico(request, "EXPER_MANUAL");
			BigDecimal EXPER_CEXPER = getCampoNumerico(request, "EXPER_CEXPER");

			BigDecimal EXPER_SINIE = getCampoNumerico(request, "EXPER_SINIE");
			BigDecimal EXPER_SINIE_MANUAL = getCampoNumerico(request, "EXPER_SINIE_MANUAL");

			Map map = new PAC_IAX_SIMULACIONES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_SIMULACIONES__F_GRABACONDUCTORES(NRIESGO, new BigDecimal(0), // NORDEN,
							SPERSON, CSEXPER, FNACIMI, NNUMNIF, TNOMBRE, TNOMBRE1, TNOMBRE2, TAPELLI1, TAPELLI2,
							CTIPIDE, TIDENTI, CPRINCIPAL, isEmpty(CDOMICI) ? CDOMICIx : CDOMICI, CPAIS, CPROVIN,
							CPOBLAC, COCUPACION, EXPER_MANUAL, EXPER_CEXPER, EXPER_SINIE, EXPER_SINIE_MANUAL, NPUNTOS,
							FCARNET);

			logger.debug(map);
			tratarRETURNyMENSAJES(request, map);
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr061Service - m�todo m_set_conductor_simul", e);
			AbstractDispatchAction.guardarMensaje(request,
					"verbatim:<b>" + e.getClass().getName() + ":</b> " + e.getLocalizedMessage(),
					new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

	/**
	 * Graba un conductor.
	 * 
	 * @param request
	 */
	@SuppressWarnings("all")
	public void m_set_conductor(HttpServletRequest request) {
		logger.debug("Axisctr061Service m_set_conductor");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {
			BigDecimal NRIESGO = (BigDecimal) AbstractDispatchAction.topPila(request, "NRIESGO");

			if (isEmpty(NRIESGO))
				NRIESGO = BigDecimal.ONE;

			BigDecimal NORDEN = getCampoNumerico(request, "NORDEN");

			BigDecimal SPERSON = getCampoNumerico(request, "SPERSON");
			Date FNACIMI = null;
			BigDecimal NPUNTOS = null;
			Date FCARNET = null;
			BigDecimal CSEXO = null;
			BigDecimal CDOMICI = getCampoNumerico(request, "CDOMICI");
			BigDecimal CPRINCIPAL = getCampoNumerico(request, "CPRINCIPAL");

			// BUG 0026923/0151408 - JSV (26/08/2013) - INI
			BigDecimal EXPER_MANUAL = null;
			BigDecimal EXPER_CEXPER = null;
			if (NORDEN != null) {
				EXPER_MANUAL = getCampoNumerico(request, "EXPER_MANUAL");
				EXPER_CEXPER = getCampoNumerico(request, "EXPER_CEXPER");
			}
			// BUG 0026923/0151408 - JSV (26/08/2013) - FIN

			BigDecimal EXPER_SINIE = getCampoNumerico(request, "EXPER_SINIE");
			BigDecimal EXPER_SINIE_MANUAL = getCampoNumerico(request, "EXPER_SINIE_MANUAL");

			Map map = new PAC_IAX_PRODUCCION_AUT((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_PRODUCCION_AUT__F_SET_CONDUCTOR(NRIESGO, NORDEN, SPERSON, FNACIMI, NPUNTOS, FCARNET,
							CSEXO, CDOMICI, CPRINCIPAL, EXPER_MANUAL, EXPER_CEXPER, EXPER_SINIE, EXPER_SINIE_MANUAL);

			logger.debug(map);
			tratarRETURNyMENSAJES(request, map);
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr061Service - m�todo m_set_conductor", e);
			AbstractDispatchAction.guardarMensaje(request,
					"verbatim:<b>" + e.getClass().getName() + ":</b> " + e.getLocalizedMessage(),
					new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

	/**
	 * Graba un conductor, v�a Ajax.
	 * 
	 * @param request
	 */
	@SuppressWarnings("all")
	public void m_ajax_set_conductor(HttpServletRequest request) {
		logger.debug("Axisctr061Service m_ajax_set_conductor");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();

		try {

			// Grabar conductor
			BigDecimal NRIESGO = (BigDecimal) AbstractDispatchAction.topPila(request, "NRIESGO");

			if (isEmpty(NRIESGO))
				NRIESGO = BigDecimal.ONE;

			BigDecimal NORDEN = getCampoNumerico(request, "NORDEN");
			BigDecimal SPERSON = getCampoNumerico(request, "SPERSON");
			Date FNACIMI = stringToSqlDate(getCampoTextual(request, "FNACIMI"));
			BigDecimal NPUNTOS = getCampoNumerico(request, "NPUNTOS");
			Date FCARNET = stringToSqlDate(getCampoTextual(request, "FCARNET"));
			BigDecimal CSEXO = getCampoNumerico(request, "CSEXO");
			BigDecimal CDOMICI = getCampoNumerico(request, "CDOMICI");
			BigDecimal CPRINCIPAL = getCampoNumerico(request, "CPRINCIPAL");
			BigDecimal EXPER_MANUAL = getCampoNumerico(request, "EXPER_MANUAL");
			BigDecimal EXPER_CEXPER = getCampoNumerico(request, "EXPER_CEXPER");

			BigDecimal EXPER_SINIE = getCampoNumerico(request, "EXPER_SINIE");
			BigDecimal EXPER_SINIE_MANUAL = getCampoNumerico(request, "EXPER_SINIE_MANUAL");

			Map map = new PAC_IAX_PRODUCCION_AUT((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_PRODUCCION_AUT__F_SET_CONDUCTOR(NRIESGO, NORDEN, SPERSON, FNACIMI, NPUNTOS, FCARNET,
							CSEXO, CDOMICI, CPRINCIPAL, EXPER_MANUAL, EXPER_CEXPER, EXPER_SINIE, EXPER_SINIE_MANUAL);

			logger.debug(map);
			ajax.rellenarPlAContenedorAjax(map);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr061Service - m�todo m_ajax_set_conductor", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	/**
	 * Elimina un conductor.
	 * 
	 * @param request
	 */
	@SuppressWarnings("all")
	public void m_eliminar_conductor(HttpServletRequest request) {
		logger.debug("Axisctr061Service m_eliminar_conductor");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {

			BigDecimal NRIESGO = (BigDecimal) AbstractDispatchAction.topPila(request, "NRIESGO");

			if (isEmpty(NRIESGO))
				NRIESGO = BigDecimal.ONE;

			BigDecimal NORDEN = getCampoNumerico(request, "NORDEN");
			BigDecimal SPERSON = getCampoNumerico(request, "SPERSON");

			Map map = new PAC_IAX_PRODUCCION_AUT((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_PRODUCCION_AUT__F_ELIMINA_CONDUCTOR(NRIESGO, SPERSON, NORDEN);

			logger.debug(map);
			tratarRETURNyMENSAJES(request, map);
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr061Service - m�todo m_eliminar_conductor", e);
			AbstractDispatchAction.guardarMensaje(request,
					"verbatim:<b>" + e.getClass().getName() + ":</b> " + e.getLocalizedMessage(),
					new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

	/**
	 * 
	 * @param request
	 * @param direccion
	 */
	@SuppressWarnings("all")
	public void m_navegar(HttpServletRequest request, BigDecimal direccion) {
		logger.debug("Axisctr061Service m_navegar");

		try {

			if (Constantes.SIGUIENTE.equals(direccion) && !m_siguiente(request))
				return;
			if (Constantes.ANTERIOR.equals(direccion) && !m_anterior(request))
				return;

			request.setAttribute(Constantes.FORWARDACTION,
					AxisCodeWizard.findForward(request, direccion, whoami(this), null));
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr061Service - m�todo m_navegar", e);
			AbstractDispatchAction.guardarMensaje(request,
					"verbatim:<b>" + e.getClass().getName() + ":</b> " + e.getLocalizedMessage(),
					new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

	/**
	 * 
	 * @param request
	 * @return true o false indicando si la grabaci�n del conductor es OK.
	 */
	@SuppressWarnings("all")
	private boolean m_siguiente(HttpServletRequest request) {
		logger.debug("Axisctr061Service m_siguiente");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		boolean result = true;

		try {
			HashMap m = this.f_Get_Avisos(request, this.whoami(this));
			BigDecimal pRETURN = (BigDecimal) this.tratarRETURNyMENSAJES(request, m);
			request.setAttribute("PLSTAVISOS", m.get("PLSTAVISOS"));

			if (pRETURN != null && pRETURN.intValue() != 1) {
				// Grabar conductor principal
				BigDecimal NRIESGO = (BigDecimal) AbstractDispatchAction.topPila(request, "NRIESGO");

				if (isEmpty(NRIESGO))
					NRIESGO = BigDecimal.ONE;

				/* Leer todos los conductores */
				PAC_IAX_PRODUCCION_AUT pacIaxProduccionAut = new PAC_IAX_PRODUCCION_AUT(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
				Map map = pacIaxProduccionAut.ejecutaPAC_IAX_PRODUCCION_AUT__F_LEE_CONDUCTORES(NRIESGO);
				logger.debug(map);
				List<Map> T_IAX_AUTCONDUCTORES = (List<Map>) tratarRETURNyMENSAJES(request, map);
				if (T_IAX_AUTCONDUCTORES != null && T_IAX_AUTCONDUCTORES.size() > 0) {

					for (Map conductores : T_IAX_AUTCONDUCTORES) {

						BigDecimal SPERSON = (BigDecimal) ((Map) conductores.get("OB_IAX_AUTCONDUCTORES"))
								.get("SPERSON");
						BigDecimal NPUNTOS = (BigDecimal) ((Map) conductores.get("OB_IAX_AUTCONDUCTORES"))
								.get("NPUNTOS");
						BigDecimal CPRINCIPAL = (BigDecimal) ((Map) conductores.get("OB_IAX_AUTCONDUCTORES"))
								.get("CPRINCIPAL");
						BigDecimal NORDEN = (BigDecimal) ((Map) conductores.get("OB_IAX_AUTCONDUCTORES")).get("NORDEN");
						BigDecimal CDOMICI = (BigDecimal) ((Map) conductores.get("OB_IAX_AUTCONDUCTORES"))
								.get("CDOMICI");
						java.sql.Timestamp FCARNETSTAMP = (java.sql.Timestamp) ((Map) conductores
								.get("OB_IAX_AUTCONDUCTORES")).get("FCARNET");
						Date FCARNET = FCARNETSTAMP != null ? new Date(FCARNETSTAMP.getTime()) : null;
						BigDecimal EXPER_MANUAL = (BigDecimal) ((Map) conductores.get("OB_IAX_AUTCONDUCTORES"))
								.get("EXPER_MANUAL");
						BigDecimal EXPER_CEXPER = (BigDecimal) ((Map) conductores.get("OB_IAX_AUTCONDUCTORES"))
								.get("EXPER_CEXPER");
						BigDecimal EXPER_SINIE = (BigDecimal) ((Map) conductores.get("OB_IAX_AUTCONDUCTORES"))
								.get("EXPER_SINIE");
						BigDecimal EXPER_SINIE_MANUAL = (BigDecimal) ((Map) conductores.get("OB_IAX_AUTCONDUCTORES"))
								.get("EXPER_SINIE_MANUAL");

						if (BigDecimal.ONE.equals(CPRINCIPAL)) {
							FCARNET = stringToSqlDate(getCampoTextual(request, "FCARNET"));
							CDOMICI = getHiddenCampoNumerico(request, "CDOMICI");
							EXPER_MANUAL = getCampoNumerico(request, "EXPER_MANUAL");
							EXPER_CEXPER = getCampoNumerico(request, "EXPER_CEXPER");
							EXPER_SINIE = getCampoNumerico(request, "EXPER_SINIE");
							EXPER_SINIE_MANUAL = getCampoNumerico(request, "EXPER_SINIE_MANUAL");
						} else {
							BigDecimal idConductorOcasional = (BigDecimal) getCampoNumerico(request, "radioConductor");
							if (NORDEN.equals(idConductorOcasional)) {
								FCARNET = stringToSqlDate(getCampoTextual(request, "FCARNET_OCASIONAL"));
								CDOMICI = getCampoNumerico(request, "CDOMICIOCA");
							}
						}

						map = new PAC_IAX_PRODUCCION_AUT(
								(java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
								.ejecutaPAC_IAX_PRODUCCION_AUT__F_GRABACONDUCTORES(NRIESGO, SPERSON, NPUNTOS, FCARNET,
										CDOMICI, CPRINCIPAL, EXPER_MANUAL, EXPER_CEXPER, EXPER_SINIE,
										EXPER_SINIE_MANUAL, NORDEN);

						logger.debug(map);
					}

					m = new PAC_IAX_VALIDACIONES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
							.ejecutaPAC_IAX_VALIDACIONES__F_VALIDACONDUCTORES();
					tratarRETURNyMENSAJES(request, m);

					result = BigDecimal.ZERO.equals(tratarRETURNyMENSAJES(request, map));
				}
			} else {
				result = false;
			}
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
			return result;

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr061Service - m�todo m_siguiente", e);
			AbstractDispatchAction.guardarMensaje(request,
					"verbatim:<b>" + e.getClass().getName() + ":</b> " + e.getLocalizedMessage(),
					new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
			return false;
		}
	}

	/**
	 * 
	 * @param request
	 * @return true o false indicando si la grabaci�n del conductor es OK.
	 */
	@SuppressWarnings("all")
	private boolean m_anterior(HttpServletRequest request) {
		logger.debug("Axisctr061Service m_anterior");
		boolean result = true;
		try {
			BigDecimal NRIESGO = (BigDecimal) AbstractDispatchAction.topPila(request, "NRIESGO");
			if (isEmpty(NRIESGO))
				NRIESGO = BigDecimal.ONE;

			/* Leer todos los conductores */
			PAC_IAX_PRODUCCION_AUT pacIaxProduccionAut = new PAC_IAX_PRODUCCION_AUT(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map map = pacIaxProduccionAut.ejecutaPAC_IAX_PRODUCCION_AUT__F_LEE_CONDUCTORES(NRIESGO);
			logger.debug(map);
			List<Map> T_IAX_AUTCONDUCTORES = (List<Map>) tratarRETURNyMENSAJES(request, map);
			if (T_IAX_AUTCONDUCTORES != null && T_IAX_AUTCONDUCTORES.size() > 0) {

				for (Map conductores : T_IAX_AUTCONDUCTORES) {

					BigDecimal SPERSON = (BigDecimal) ((Map) conductores.get("OB_IAX_AUTCONDUCTORES")).get("SPERSON");
					BigDecimal NPUNTOS = (BigDecimal) ((Map) conductores.get("OB_IAX_AUTCONDUCTORES")).get("NPUNTOS");
					BigDecimal CPRINCIPAL = (BigDecimal) ((Map) conductores.get("OB_IAX_AUTCONDUCTORES"))
							.get("CPRINCIPAL");
					BigDecimal NORDEN = (BigDecimal) ((Map) conductores.get("OB_IAX_AUTCONDUCTORES")).get("NORDEN");
					BigDecimal CDOMICI = (BigDecimal) ((Map) conductores.get("OB_IAX_AUTCONDUCTORES")).get("CDOMICI");
					java.sql.Timestamp FCARNETSTAMP = (java.sql.Timestamp) ((Map) conductores
							.get("OB_IAX_AUTCONDUCTORES")).get("FCARNET");
					Date FCARNET = FCARNETSTAMP != null ? new Date(FCARNETSTAMP.getTime()) : null;
					BigDecimal EXPER_MANUAL = (BigDecimal) ((Map) conductores.get("OB_IAX_AUTCONDUCTORES"))
							.get("EXPER_MANUAL");
					BigDecimal EXPER_CEXPER = (BigDecimal) ((Map) conductores.get("OB_IAX_AUTCONDUCTORES"))
							.get("EXPER_CEXPER");
					BigDecimal EXPER_SINIE = (BigDecimal) ((Map) conductores.get("OB_IAX_AUTCONDUCTORES"))
							.get("EXPER_SINIE");
					BigDecimal EXPER_SINIE_MANUAL = (BigDecimal) ((Map) conductores.get("OB_IAX_AUTCONDUCTORES"))
							.get("EXPER_SINIE_MANUAL");

					if (BigDecimal.ONE.equals(CPRINCIPAL)) {
						FCARNET = stringToSqlDate(getCampoTextual(request, "FCARNET"));
						CDOMICI = getHiddenCampoNumerico(request, "CDOMICI");
						EXPER_MANUAL = getCampoNumerico(request, "EXPER_MANUAL");
						EXPER_CEXPER = getCampoNumerico(request, "EXPER_CEXPER");
						EXPER_SINIE = getCampoNumerico(request, "EXPER_SINIE");
						EXPER_SINIE_MANUAL = getCampoNumerico(request, "EXPER_SINIE_MANUAL");
					} else {
						BigDecimal idConductorOcasional = (BigDecimal) getCampoNumerico(request, "radioConductor");
						if (NORDEN.equals(idConductorOcasional)) {
							FCARNET = stringToSqlDate(getCampoTextual(request, "FCARNET_OCASIONAL"));
							CDOMICI = getCampoNumerico(request, "CDOMICIOCA");
						}
					}

					map = new PAC_IAX_PRODUCCION_AUT((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
							.ejecutaPAC_IAX_PRODUCCION_AUT__F_GRABACONDUCTORES(NRIESGO, SPERSON, NPUNTOS, FCARNET,
									CDOMICI, CPRINCIPAL, EXPER_MANUAL, EXPER_CEXPER, EXPER_SINIE, EXPER_SINIE_MANUAL,
									NORDEN);

					logger.debug(map);
				}
				this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));

				HashMap m = new PAC_IAX_VALIDACIONES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_VALIDACIONES__F_VALIDACONDUCTORES();
				tratarRETURNyMENSAJES(request, m);
				result = BigDecimal.ZERO.equals(tratarRETURNyMENSAJES(request, map));
			}
			return result;
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr061Service - m�todo m_siguiente", e);
			AbstractDispatchAction.guardarMensaje(request,
					"verbatim:<b>" + e.getClass().getName() + ":</b> " + e.getLocalizedMessage(),
					new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
			return false;
		}
	}

	/**
	 * Lee la lista de domilios de una persona.
	 * 
	 * @param usuario
	 * @param SPERSON
	 * @return
	 * @throws Exception
	 */
	private Map dbGetLstDomiPerson(HttpServletRequest request, UsuarioBean usuario, BigDecimal SPERSON)
			throws Exception {
		Map map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTDOMIPERSON(SPERSON);
		logger.debug(map);
		return map;
	}

	private BigDecimal getCdomici(HttpServletRequest request, ArrayList<HashMap> domicilios) {

		// DIRECCIONES=[{OB_IAX_DIRECCIONES={
		try {
			BigDecimal CDOMICI = null;
			if (!isEmpty(domicilios) && domicilios.size() > 0) {
				logger.debug("domicilios-->" + domicilios);
				for (HashMap dom : domicilios) {
					logger.debug("dom-->" + dom);
					logger.debug("CDOMICI:" + dom.get("CDOMICI"));
					HashMap m = (HashMap) dom.get("OB_IAX_DIRECCIONES");
					CDOMICI = new BigDecimal(String.valueOf(m.get("CDOMICI")));
				}

			}
			return CDOMICI;
		} catch (Exception e) {
			return null;
		}

	}

	public void m_guardar_simulacion(HttpServletRequest request) {
		logger.debug("Axisctr061Service m_guardar_simulacion");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {
			HashMap m = this.f_Get_Avisos(request, this.whoami(this));
			BigDecimal pRETURN = (BigDecimal) this.tratarRETURNyMENSAJES(request, m);
			request.setAttribute("PLSTAVISOS", m.get("PLSTAVISOS"));

			if (pRETURN != null && pRETURN.intValue() != 1) {
				// Grabar conductor principal
				BigDecimal NRIESGO = (BigDecimal) AbstractDispatchAction.topPila(request, "NRIESGO");

				if (isEmpty(NRIESGO))
					NRIESGO = BigDecimal.ONE;

				BigDecimal SPERSON = getCampoNumerico(request, "SPERSON");
				BigDecimal NPUNTOS = getCampoNumerico(request, "NPUNTOS");
				Date FCARNET = stringToSqlDate(getCampoTextual(request, "FCARNET"));

				BigDecimal CDOMICI = getCampoNumerico(request, "CDOMICI");
				BigDecimal EXPER_MANUAL = getCampoNumerico(request, "EXPER_MANUAL");
				BigDecimal EXPER_CEXPER = getCampoNumerico(request, "EXPER_CEXPER");
				BigDecimal EXPER_SINIE = getCampoNumerico(request, "EXPER_SINIE");
				BigDecimal EXPER_SINIE_MANUAL = getCampoNumerico(request, "EXPER_SINIE_MANUAL");
				/*
				 * Map map = new
				 * PAC_IAX_PRODUCCION_AUT((java.sql.Connection)request.getAttribute(Constantes.
				 * DB01CONN)).ejecutaPAC_IAX_PRODUCCION_AUT__F_GRABACONDUCTORES(NRIESGO,
				 * SPERSON, NPUNTOS, FCARNET, CDOMICI, new BigDecimal(1), EXPER_MANUAL,
				 * EXPER_CEXPER);
				 * 
				 * logger.debug(map);
				 */

				String TNOMBRE = getCampoTextual(request, "TNOMBRE");
				String TNOMBRE1 = getCampoTextual(request, "TNOMBRE1");
				String TNOMBRE2 = getCampoTextual(request, "TNOMBRE2");
				String TAPELLI1 = getCampoTextual(request, "TAPELLI1");
				String TAPELLI2 = getCampoTextual(request, "TAPELLI2");
				BigDecimal CTIPIDE = getCampoNumerico(request, "CTIPIDE"); // tipo de documento
				BigDecimal TIDENTI = getCampoNumerico(request, "TIDENTI"); // tipo persona
				BigDecimal CSEXPER = getCampoNumerico(request, "CSEXPER");
				BigDecimal CPAIS = getCampoNumerico(request, "CPAIS");
				BigDecimal CPROVIN = getCampoNumerico(request, "CPROVIN");
				BigDecimal CPOBLAC = getCampoNumerico(request, "CPOBLAC");
				BigDecimal NORDEN = getCampoNumerico(request, "SELECTED_NORDEN");
				BigDecimal CPRINCIPAL = getCampoNumerico(request, "CPRINCIPAL");
				BigDecimal COCUPACION = getCampoNumerico(request, "COCUPACION");

				String fecha = getCampoTextual(request, "FNACIMI");
				String NNUMNIF = getCampoTextual(request, "NNUMNIF");
				java.sql.Date FNACIMI = this.stringToSqlDate(fecha, "dd/MM/yyyy");

				// Recoger dato SPERSON DE SESION
				if (isEmpty(SPERSON)) {
					SPERSON = new BigDecimal(0);
				}

				Map map = new PAC_IAX_SIMULACIONES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_SIMULACIONES__F_GRABACONDUCTORES(NRIESGO, new BigDecimal(0), SPERSON, CSEXPER,
								FNACIMI, NNUMNIF, TNOMBRE, TNOMBRE1, TNOMBRE2, TAPELLI1, TAPELLI2, CTIPIDE, TIDENTI,
								new BigDecimal(1), null, // CDOMICI,
								CPAIS, CPROVIN, CPOBLAC, COCUPACION, EXPER_MANUAL, EXPER_CEXPER, EXPER_SINIE,
								EXPER_SINIE_MANUAL, NPUNTOS, FCARNET);

				logger.debug(map);
				tratarRETURNyMENSAJES(request, map);

				this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
				if (BigDecimal.ZERO.equals(tratarRETURNyMENSAJES(request, map)))
					formdata.put("OK", "0");
			} else {
				this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));

			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr061Service - m�todo m_guardar_simulacion", e);
			AbstractDispatchAction.guardarMensaje(request,
					"verbatim:<b>" + e.getClass().getName() + ":</b> " + e.getLocalizedMessage(),
					new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);

		}
	}

	private Map dbEliminaTomador(HttpServletRequest request, UsuarioBean usuario, BigDecimal SPERSON) throws Exception {
		Map map = new PAC_IAX_SIMULACIONES(((java.sql.Connection) request.getAttribute(Constantes.DB01CONN)))
				.ejecutaPAC_IAX_SIMULACIONES__F_ELIMINATOMADOR(SPERSON);
		logger.debug(map);
		return map;
	}

	public void m_gestion_tomador_json(HttpServletRequest request, AbstractDispatchAction thisAction) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		AjaxContainerService ajax = new AjaxContainerService();
		try {
			HashMap miDataObject = new HashMap();

			BigDecimal istom = getCampoNumerico(request, "ISTOM");
			BigDecimal SPERSON = getCampoNumerico(request, "SPERSON");

			Map m = new HashMap();
			if (!isEmpty(istom) && istom.intValue() == 0) {
				m = this.dbEliminaTomador(request, usuario, SPERSON);
				logger.debug(m);

			} else {
				if (!isEmpty(istom) && istom.intValue() == 1) {
					m = new PAC_IAX_SIMULACIONES(((java.sql.Connection) request.getAttribute(Constantes.DB01CONN)))
							.ejecutaPAC_IAX_SIMULACIONES__F_INSERTTOMADORES(SPERSON);
					logger.debug(m);
				}

			}
			miDataObject.put("resultado", m);
			miDataObject.put("retorno", this.tratarRETURNyMENSAJES(request, m));
			ajax.rellenarPlAContenedorAjax(m);

			request.setAttribute(Constantes.AJAXCONTAINER, miDataObject);
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr061Service - m�todo m_gestion_tomador", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

	public void m_ajax_direccion(HttpServletRequest request, Axisctr061Action thisAction) {
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
			logger.error("Error en el servicio Axisper005Service - m�todo m_ajax_direccion", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

}
