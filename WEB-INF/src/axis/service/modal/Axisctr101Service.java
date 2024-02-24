//Revision:# 6Lg1fjFFTc1A4ehrVi6c5A== #
package axis.service.modal;

import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.jdbc.PAC_IAX_PERSONA;
import axis.jdbc.PAC_IAX_PRODUCCION;
import axis.jdbc.PAC_IAX_PRODUCCION_AUT;
import axis.jdbc.PAC_IAX_SIMULACIONES;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.control.modal.Axisctr101Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AjaxContainerService;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

public class Axisctr101Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());
	SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");

	public void m_init(HttpServletRequest request, Axisctr101Action thisAction) {
		logger.debug("Axisctr101Service m_init");

		try {
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr101Service - m�todo m_init", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {

			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE INICIALIZACION
	 *******************************************/
	/*********************************************************************************************************************/

	public void m_form(HttpServletRequest request, Axisctr101Action thisAction) {
		logger.debug("Axisctr101Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		boolean selectedPerson = true;

		try {
			BigDecimal TIPO = this.getCampoNumerico(request, "TIPO");
			formdata.put("TIPO", TIPO);
			String SPERSON2MODIFY_ = this.getCampoTextual(request, "SPERSON2MODIFY");
			formdata.put("SPERSON2MODIFY", SPERSON2MODIFY_);
			if ((SPERSON2MODIFY_ != null)
					&& ((!SPERSON2MODIFY_.equals("")) && (!SPERSON2MODIFY_.toLowerCase().equals("null")))) {
				request.getSession().setAttribute("SPERSON2MODIFY", SPERSON2MODIFY_ + "");
			} else {
				request.getSession().setAttribute("SPERSON2MODIFY", null);
			}

			String CMODOASEGU = (String) request.getSession().getAttribute("CMODOASEGU");
			formdata.put("CMODOASEGU", CMODOASEGU);

			// Al cargar este formulario se llamar� a la funci�n con un n�mero de riesgo
			// Si se le llama desde el bot�n anyadir el NRIESGO=0
			// Si se llama desde la tabla el NRIESGO ser� igual al del riesgo seleccionado
			String NRIESGO = getCampoTextual(request, "NRIESGO");
			BigDecimal SPERSON = getCampoNumerico(request, "SPERSON");

			if ((SPERSON2MODIFY_ != null) && (SPERSON == null)) {
				SPERSON = new BigDecimal(SPERSON2MODIFY_);
				request.getSession().setAttribute("SPERSON", SPERSON);
			}
			logger.debug("SPERSON : " + SPERSON);
			PAC_IAX_SIMULACIONES pacIaxSimulacion = new PAC_IAX_SIMULACIONES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			PAC_IAX_PRODUCCION pacIaxproduccion = new PAC_IAX_PRODUCCION(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			PAC_IAX_PERSONA pacIaxpersona = new PAC_IAX_PERSONA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			HashMap m = null;
			// Cargar datos de gestion //
			BigDecimal pNRIESGO = null;

			if (NRIESGO != null) {
				pNRIESGO = new BigDecimal(NRIESGO);
			} else
				pNRIESGO = (BigDecimal) AbstractDispatchAction.topPila(request, "NRIESGO");

			BigDecimal NORDEN = this.getCampoNumerico(request, "NORDEN");

			Map axisctr101_datosPersona = new HashMap();
			if ((TIPO != null) && (TIPO.intValue() == 1)) {
				if (!isEmpty(SPERSON)) {
					m = pacIaxproduccion.ejecutaPAC_IAX_PRODUCCION__F_GET_TOMADOR(SPERSON);
					axisctr101_datosPersona = (Map) tratarRETURNyMENSAJES(request, m);
				}
			} else {
				if ((TIPO != null) && (TIPO.intValue() == 2)) {

					m = pacIaxSimulacion.ejecutaPAC_IAX_SIMULACIONES__F_GET_ASEGURADO(pNRIESGO, SPERSON);
					axisctr101_datosPersona = (Map) tratarRETURNyMENSAJES(request, m);

				} else if ((TIPO != null) && (TIPO.intValue() == 3)) {

					/*
					 * m=
					 * pacIaxproduccion.ejecutaPAC_IAX_PRODUCCION__F_GET_BENEIDENT_R(pNRIESGO,NORDEN
					 * ); logger.debug(m);
					 */
					if (!isEmpty(SPERSON)) {
						m = pacIaxpersona.ejecutaPAC_IAX_PERSONA__F_GET_ESTPERSONA(SPERSON, usuario.getCagente());
						BigDecimal ok = (BigDecimal) tratarRETURNyMENSAJES(request, m);
						if (ok.intValue() == 0) {

							HashMap persona = (HashMap) m.get("OBPERSONA");
							logger.debug("persona-->" + persona);
							axisctr101_datosPersona = persona;
						}
					}

				}

			}
			logger.debug(m);
			if (!isEmpty(m) && m.get("RETURN") != null) {

				// Map axisctr101_datosPersona = (Map) tratarRETURNyMENSAJES (request, m);
				// request.setAttribute("axisctr101_datosPersona",axisctr101_datosPersona);
				formdata.putAll(axisctr101_datosPersona);
				BigDecimal SPERSON2MODIFY = (BigDecimal) axisctr101_datosPersona.get("SPERSON");
				if (!isEmpty(SPERSON2MODIFY)) {
					PAC_IAX_PERSONA PAC_IAX_PERSONA = new PAC_IAX_PERSONA(
							(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

					Map map = PAC_IAX_PERSONA.ejecutaPAC_IAX_PERSONA__F_GET_ESTDIRECCIONES(SPERSON2MODIFY, null);

					logger.debug(map);
					if (map.get("PDIRECCIONES") != null && ((ArrayList) map.get("PDIRECCIONES")).size() > 0) {

						HashMap direccion = (HashMap) ((HashMap) ((ArrayList) map.get("PDIRECCIONES")).get(0))
								.get("OB_IAX_DIRECCIONES");
						map = PAC_IAX_PERSONA.ejecutaPAC_IAX_PERSONA__F_GET_ESTDIRECCION(SPERSON2MODIFY,
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
				}
				// request.getSession().setAttribute("axisctr100_selectedPerson",selectedPerson);
				// //dejamos en sesion Ventana Repetida -> Datos protegidos
				request.getSession().setAttribute("axisctr100_selectedPerson", selectedPerson); // dejamos en sesion
																								// Ventana Repetida ->
																								// Datos protegidos
				request.getSession().setAttribute("SPERSON", SPERSON2MODIFY);
				request.getSession().setAttribute("SPERSON2MODIFY", SPERSON2MODIFY); // dejamos en sesion el
																						// sPersonAntiguo
				formdata.put("SPERSON2MODIFY", SPERSON2MODIFY);
				logger.debug(axisctr101_datosPersona);

			}

			// Lista profesiones
			PAC_IAX_LISTVALORES pac_axis_listValores = new PAC_IAX_LISTVALORES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			Map map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTPROFESIONES(new BigDecimal(0));
			logger.debug(map);
			formdata.put("lstProfesiones", (List) tratarRETURNyMENSAJES(request, map, false));

			// Lista pa�ses
			Map listValores = new HashMap();
			map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTPAISES();
			logger.debug(map);
			listValores.put("lstPaises", (List) tratarRETURNyMENSAJES(request, map, false));
			formdata.put("listValores", listValores);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr101Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));

		}
	}

	private Map dbGetLstDomiPerson(HttpServletRequest request, UsuarioBean usuario, BigDecimal SPERSON)
			throws Exception {
		Map map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTDOMIPERSON(SPERSON);
		logger.debug(map);
		return map;
	}

	public void m_cerrar(HttpServletRequest request, Axisctr101Action thisAction) {
		logger.debug("Axisctr101Service m_cerrar");
		try {

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr101Service - m�todo m_cerrar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	public void m_buscar_datos_persona(HttpServletRequest request, Axisctr101Action thisAction) {
		logger.debug("Axisctr101Service m_buscar_datos_persona");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		boolean selectedPerson = true;
		try {
			BigDecimal TIPO = this.getCampoNumerico(request, "TIPO");
			logger.debug("--->TIPO:" + TIPO);
			formdata.put("TIPO", TIPO);
			// carga los valores de los combos
			m_cargar_valores(request, thisAction);
			// carga los valores si los hay de la persona seleccionada en Axisper001
			PAC_IAX_PRODUCCION pacIaxProduccion = new PAC_IAX_PRODUCCION(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			PAC_IAX_PERSONA pacIaxPersona = new PAC_IAX_PERSONA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			PAC_IAX_PRODUCCION_AUT pacIaxProduccionAut = new PAC_IAX_PRODUCCION_AUT(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			HashMap m = null;
			// Obtener los datos de la persona
			String SPERSON = getCampoTextual(request, "SPERSON");
			request.getSession().setAttribute("SPERSON", SPERSON);
			request.getSession().setAttribute("SPERSON2MODIFY", SPERSON);
			// BigDecimal NRIESGO = (BigDecimal) AbstractDispatchAction.topPila(request,
			// "NRIESGO");
			BigDecimal NRIESGO = isEmpty(AbstractDispatchAction.topPila(request, "NRIESGO")) ? new BigDecimal(1)
					: (BigDecimal) AbstractDispatchAction.topPila(request, "NRIESGO");
			BigDecimal NORDEN = this.getCampoNumerico(request, "NORDEN");

			HashMap aviso = this.f_Get_Avisos(request, this.whoami(this));
			logger.debug(aviso);
			BigDecimal pRETURN = (BigDecimal) this.tratarRETURNyMENSAJES(request, aviso);
			request.setAttribute("PLSTAVISOS", aviso.get("PLSTAVISOS"));

			if (pRETURN != null && pRETURN.intValue() != 1) {

				if ((TIPO != null) && (TIPO.intValue() == 1)) {
					m = pacIaxProduccion.ejecutaPAC_IAX_PRODUCCION__F_INSERTTOMADORES(new BigDecimal(SPERSON));
				} else {
					if ((TIPO != null) && (TIPO.intValue() == 2))
						m = pacIaxProduccion.ejecutaPAC_IAX_PRODUCCION__F_INSERTASEGURADO(new BigDecimal(SPERSON),
								null);
					else {
						if ((TIPO != null) && (TIPO.intValue() == 3)) {
							m = pacIaxProduccion.ejecutaPAC_IAX_PRODUCCION__F_INSERT_BENEIDENT_R(NRIESGO,
									new BigDecimal(SPERSON));
							BigDecimal ok = (BigDecimal) tratarRETURNyMENSAJES(request, m);
							if (ok.intValue() == 0) {

								NORDEN = (BigDecimal) m.get("PNORDEN");
								formdata.put("NORDEN", NORDEN);
							}
						}
						if ((TIPO != null) && (TIPO.intValue() == 4)) {
							HashMap personas = null;
							if (!this.isEmpty(SPERSON)) {
								m = pacIaxPersona.ejecutaPAC_IAX_PERSONA__F_GET_ESTPERSONA(new BigDecimal(SPERSON),
										usuario.getCagente());
								logger.debug(m);
								BigDecimal okk = (BigDecimal) tratarRETURNyMENSAJES(request, m);
								if (okk.intValue() == 0) {

									personas = (HashMap) m.get("OBPERSONA");
									logger.debug("persona-->" + personas);

								}
							}

							java.sql.Date FNACIMI = null;
							if (!isEmpty(personas.get("FNACIMI")))
								FNACIMI = new java.sql.Date(((java.sql.Timestamp) personas.get("FNACIMI")).getTime());
							BigDecimal CSEXPER = (BigDecimal) personas.get("CSEXPER");
							BigDecimal CDOMICI = null;
							PAC_IAX_PERSONA PAC_IAX_PERSONA = new PAC_IAX_PERSONA(
									(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

							Map map = PAC_IAX_PERSONA
									.ejecutaPAC_IAX_PERSONA__F_GET_ESTDIRECCIONES(new BigDecimal(SPERSON), null);

							logger.debug(map);
							if (map.get("PDIRECCIONES") != null && ((ArrayList) map.get("PDIRECCIONES")).size() > 0) {

								HashMap direccion = (HashMap) ((HashMap) ((ArrayList) map.get("PDIRECCIONES")).get(0))
										.get("OB_IAX_DIRECCIONES");
								map = PAC_IAX_PERSONA.ejecutaPAC_IAX_PERSONA__F_GET_ESTDIRECCION(
										new BigDecimal(SPERSON),
										new BigDecimal(String.valueOf(direccion.get("CDOMICI"))));
								logger.debug(map);
								CDOMICI = new BigDecimal(String.valueOf(direccion.get("CDOMICI")));

							}

							m = pacIaxProduccionAut.ejecutaPAC_IAX_PRODUCCION_AUT__F_SET_CONDUCTOR(NRIESGO,
									new BigDecimal(0), new BigDecimal(SPERSON), FNACIMI, null, null, CSEXPER, CDOMICI,
									new BigDecimal(1), null, null, null, null);

						}
					}

				}
			}
			if (!isEmpty(m)) {
				BigDecimal resultado_insert = (BigDecimal) tratarRETURNyMENSAJES(request, m);
				logger.debug(resultado_insert);
				Map axisctr101_datosPersona = new HashMap();
				if (resultado_insert.intValue() == 0) {

					if ((TIPO != null) && (TIPO.intValue() == 1)) {
						if (!isEmpty(SPERSON)) {
							m = pacIaxProduccion.ejecutaPAC_IAX_PRODUCCION__F_GET_TOMADOR(new BigDecimal(SPERSON));
							axisctr101_datosPersona = (Map) tratarRETURNyMENSAJES(request, m);
						}
					} else {
						if ((TIPO != null) && (TIPO.intValue() == 2)) {
							m = pacIaxProduccion.ejecutaPAC_IAX_PRODUCCION__F_GET_ASEGURADO(new BigDecimal(SPERSON));
							axisctr101_datosPersona = (Map) tratarRETURNyMENSAJES(request, m);
						} else if ((TIPO != null) && (TIPO.intValue() == 3)) {
							m = pacIaxProduccion.ejecutaPAC_IAX_PRODUCCION__F_GET_BENEIDENT_R(NRIESGO, NORDEN);
							logger.debug(m);
							if (!this.isEmpty(SPERSON)) {
								m = pacIaxPersona.ejecutaPAC_IAX_PERSONA__F_GET_ESTPERSONA(new BigDecimal(SPERSON),
										usuario.getCagente());
								BigDecimal ok = (BigDecimal) tratarRETURNyMENSAJES(request, m);
								if (ok.intValue() == 0) {

									HashMap persona = (HashMap) m.get("OBPERSONA");
									logger.debug("persona-->" + persona);
									axisctr101_datosPersona = persona;
								}
							}
						}
						if ((TIPO != null) && (TIPO.intValue() == 4)) {
							if (!this.isEmpty(SPERSON)) {
								m = pacIaxPersona.ejecutaPAC_IAX_PERSONA__F_GET_ESTPERSONA(new BigDecimal(SPERSON),
										usuario.getCagente());
								BigDecimal ok = (BigDecimal) tratarRETURNyMENSAJES(request, m);
								if (ok.intValue() == 0) {

									HashMap persona = (HashMap) m.get("OBPERSONA");
									logger.debug("persona-->" + persona);
									axisctr101_datosPersona = persona;
								}
							}
						}
					}

					if (!isEmpty(SPERSON)) {
						PAC_IAX_PERSONA PAC_IAX_PERSONA = new PAC_IAX_PERSONA(
								(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

						Map map = PAC_IAX_PERSONA.ejecutaPAC_IAX_PERSONA__F_GET_ESTDIRECCIONES(new BigDecimal(SPERSON),
								null);

						logger.debug(map);
						if (map.get("PDIRECCIONES") != null && ((ArrayList) map.get("PDIRECCIONES")).size() > 0) {

							HashMap direccion = (HashMap) ((HashMap) ((ArrayList) map.get("PDIRECCIONES")).get(0))
									.get("OB_IAX_DIRECCIONES");
							map = PAC_IAX_PERSONA.ejecutaPAC_IAX_PERSONA__F_GET_ESTDIRECCION(new BigDecimal(SPERSON),
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
					}
					// request.setAttribute("axisctr101_datosPersona",axisctr101_datosPersona);
					formdata.putAll(axisctr101_datosPersona);
					request.getSession().setAttribute("axisctr100_selectedPerson", selectedPerson + ""); // Se ha
																											// seleccionado
																											// una
																											// persona
					formdata.put("axisctr100_selectedPerson", selectedPerson + ""); // Se ha seleccionado una persona
					logger.debug(axisctr101_datosPersona);
				} else
					request.getSession().removeAttribute("SPERSON2MODIFY");

			}
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr101Service - m�todo m_buscar_datos_persona", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	public void m_modificar_datos_persona(HttpServletRequest request, Axisctr101Action thisAction) {
		logger.debug("Axisctr101Service m_modificar_datos_persona");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		boolean selectedPerson = true;
		try {
			BigDecimal TIPO = this.getCampoNumerico(request, "TIPO");
			formdata.put("TIPO", TIPO);
			// carga los valores de los combos
			m_cargar_valores(request, thisAction);
			// carga los valores si los hay de la persona seleccionada en Axisper001
			PAC_IAX_PRODUCCION pacIaxProduccion = new PAC_IAX_PRODUCCION(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			PAC_IAX_PERSONA pacIaxPersona = new PAC_IAX_PERSONA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			HashMap m = null;
			// Obtener los datos de la persona
			String SPERSON = getCampoTextual(request, "SPERSON");
			String SPERSON2MODIFY = getCampoTextual(request, "SPERSON2MODIFY");
			String SPERSONAUX = "";
			if (!isEmpty(request.getSession().getAttribute("SPERSON2MODIFY")))
				SPERSONAUX = String.valueOf(request.getSession().getAttribute("SPERSON2MODIFY"));

			HashMap aviso = this.f_Get_Avisos(request, this.whoami(this));
			BigDecimal pRETURN = (BigDecimal) this.tratarRETURNyMENSAJES(request, aviso);
			request.setAttribute("PLSTAVISOS", aviso.get("PLSTAVISOS"));
			// BigDecimal NRIESGO = (BigDecimal) AbstractDispatchAction.topPila(request,
			// "NRIESGO");
			BigDecimal NRIESGO = isEmpty(AbstractDispatchAction.topPila(request, "NRIESGO")) ? new BigDecimal(1)
					: (BigDecimal) AbstractDispatchAction.topPila(request, "NRIESGO");
			BigDecimal NORDEN = this.getCampoNumerico(request, "NORDEN");
			BigDecimal CDOMICI = this.getCampoNumerico(request, "CDOMICI");

			if (pRETURN != null && pRETURN.intValue() != 1) {

				if ((SPERSON2MODIFY != null) && (SPERSON2MODIFY.length() <= 0)) {
					SPERSON2MODIFY = SPERSONAUX;
				}

				if ((SPERSON != null) && (SPERSON.length() <= 0)) {
					SPERSON = SPERSONAUX;
					request.getSession().setAttribute("SPERSON", SPERSON);
				}

				request.getSession().setAttribute("SPERSON", SPERSON);
				if ((TIPO != null) && (TIPO.intValue() == 1)) {
					m = pacIaxProduccion.ejecutaPAC_IAX_PRODUCCION__F_CAMBIARPERSONATOMASE(
							new BigDecimal(SPERSON2MODIFY), new BigDecimal(SPERSON), "T");
				} else {
					if ((TIPO != null) && (TIPO.intValue() == 2))
						m = pacIaxProduccion.ejecutaPAC_IAX_PRODUCCION__F_CAMBIARPERSONATOMASE(
								new BigDecimal(SPERSON2MODIFY), new BigDecimal(SPERSON), "A");
					else if ((TIPO != null) && (TIPO.intValue() == 3)) {

						m = pacIaxProduccion.ejecutaPAC_IAX_PRODUCCION__F_ELIMINAR_BENEIDENT_R(NRIESGO, NORDEN);
						logger.debug(m);

						m = pacIaxProduccion.ejecutaPAC_IAX_PRODUCCION__F_INSERT_BENEIDENT_R(NRIESGO,
								new BigDecimal(SPERSON2MODIFY));
						BigDecimal ok = (BigDecimal) tratarRETURNyMENSAJES(request, m);
						if (ok.intValue() == 0) {

							NORDEN = (BigDecimal) m.get("PNORDEN");
						}
					}
					if ((TIPO != null) && (TIPO.intValue() == 4)) {
						m = new PAC_IAX_SIMULACIONES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
								.ejecutaPAC_IAX_SIMULACIONES__F_GRABACONDUCTORES(NRIESGO, new BigDecimal(0),
										new BigDecimal(SPERSON), null, null, null, null, null, null, null, null, null,
										null, null, CDOMICI, null, null, null, null, null, null, null, null, null,
										null);

					}
				}

				BigDecimal resultado_insert = (BigDecimal) tratarRETURNyMENSAJES(request, m);
				logger.debug(resultado_insert);
				Map axisctr101_datosPersona = new HashMap();
				if (resultado_insert.intValue() == 0 || SPERSON.equals(SPERSON2MODIFY)) {
					if ((TIPO != null) && (TIPO.intValue() == 1)) {
						if (!isEmpty(SPERSON)) {
							m = pacIaxProduccion.ejecutaPAC_IAX_PRODUCCION__F_GET_TOMADOR(new BigDecimal(SPERSON));
							axisctr101_datosPersona = (Map) tratarRETURNyMENSAJES(request, m);
						}
					} else {
						if ((TIPO != null) && (TIPO.intValue() == 2)) {
							m = pacIaxProduccion.ejecutaPAC_IAX_PRODUCCION__F_GET_ASEGURADO(new BigDecimal(SPERSON));
							axisctr101_datosPersona = (Map) tratarRETURNyMENSAJES(request, m);
						} else if ((TIPO != null) && (TIPO.intValue() == 3)) {
							m = pacIaxProduccion.ejecutaPAC_IAX_PRODUCCION__F_GET_BENEIDENT_R(NRIESGO, NORDEN);
							logger.debug(m);

							m = pacIaxPersona.ejecutaPAC_IAX_PERSONA__F_GET_ESTPERSONA(new BigDecimal(SPERSON),
									usuario.getCagente());
							BigDecimal ok = (BigDecimal) tratarRETURNyMENSAJES(request, m);
							if (ok.intValue() == 0) {

								HashMap persona = (HashMap) m.get("OBPERSONA");
								logger.debug("persona-->" + persona);
								axisctr101_datosPersona = persona;
							}

						}
						if ((TIPO != null) && (TIPO.intValue() == 4)) {
							if (!this.isEmpty(SPERSON)) {
								m = pacIaxPersona.ejecutaPAC_IAX_PERSONA__F_GET_ESTPERSONA(new BigDecimal(SPERSON),
										usuario.getCagente());
								BigDecimal ok = (BigDecimal) tratarRETURNyMENSAJES(request, m);
								if (ok.intValue() == 0) {

									HashMap persona = (HashMap) m.get("OBPERSONA");
									logger.debug("persona-->" + persona);
									axisctr101_datosPersona = persona;
								}
							}
						}
					}

					// request.setAttribute("axisctr101_datosPersona",axisctr101_datosPersona);
					formdata.putAll(axisctr101_datosPersona);
					request.getSession().setAttribute("axisctr100_selectedPerson", selectedPerson + ""); // Se ha
																											// seleccionado
																											// una
																											// persona
					////////////////
					request.getSession().setAttribute("SPERSON2MODIFY", SPERSON);
					////////////////
					logger.debug(axisctr101_datosPersona);
					if (!isEmpty(SPERSON)) {
						PAC_IAX_PERSONA PAC_IAX_PERSONA = new PAC_IAX_PERSONA(
								(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

						Map map = PAC_IAX_PERSONA.ejecutaPAC_IAX_PERSONA__F_GET_ESTDIRECCIONES(new BigDecimal(SPERSON),
								null);

						logger.debug(map);
						if (map.get("PDIRECCIONES") != null && ((ArrayList) map.get("PDIRECCIONES")).size() > 0) {

							HashMap direccion = (HashMap) ((HashMap) ((ArrayList) map.get("PDIRECCIONES")).get(0))
									.get("OB_IAX_DIRECCIONES");
							map = PAC_IAX_PERSONA.ejecutaPAC_IAX_PERSONA__F_GET_ESTDIRECCION(new BigDecimal(SPERSON),
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
					}
				} else {
					request.getSession().removeAttribute("SPERSON2MODIFY");
				}

			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr101Service - m�todo m_modificar_datos_persona", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	public void m_cargar_valores(HttpServletRequest request, Axisctr101Action thisAction) {
		logger.debug("Axisctr101Service m_cargar_valores");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {
			String SPERSON = this.getCampoTextual(request, "SPERSON");
			request.getSession().setAttribute("SPERSON", SPERSON);

			BigDecimal TIPO = this.getCampoNumerico(request, "TIPO");
			formdata.put("TIPO", TIPO);
			PAC_IAX_LISTVALORES pacIaxValores = new PAC_IAX_LISTVALORES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			HashMap m = null;
			// cargar combo sexo
			m = pacIaxValores.ejecutaPAC_IAX_LISTVALORES__F_GET_TIPSEXO();
			List axisctr100_comboSexo = (List) tratarRETURNyMENSAJES(request, m);
			request.setAttribute("axisctr100_comboSexo", axisctr100_comboSexo);
			logger.debug(axisctr100_comboSexo);

			m = pacIaxValores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(12));
			List axisctr100_comboEstados = (List) tratarRETURNyMENSAJES(request, m);
			request.setAttribute("axisctr100_comboEstados", axisctr100_comboEstados);
			logger.debug(axisctr100_comboEstados);

			// cargar combo tipo Id

			BigDecimal TIDENTI = getCampoNumerico(request, "TIDENTI");
			m = pacIaxValores.ejecutaPAC_IAX_LISTVALORES__F_GET_TIPDOCUM_TIPPER(TIDENTI);
			List axisctr100_comboTipoDocu = (List) tratarRETURNyMENSAJES(request, m);
			request.setAttribute("axisctr100_comboTipoDocu", axisctr100_comboTipoDocu);
			logger.debug(axisctr100_comboTipoDocu);
			// cargar combo tipo Persona
			m = pacIaxValores.ejecutaPAC_IAX_LISTVALORES__F_GET_TIPPERSON();
			List axisctr100_comboTipoPer = (List) tratarRETURNyMENSAJES(request, m);
			request.setAttribute("axisctr100_comboTipoPer", axisctr100_comboTipoPer);
			logger.debug(axisctr100_comboTipoPer);

			// Lista pa�ses
			Map listValores = new HashMap();
			Map map = pacIaxValores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTPAISES();
			logger.debug(map);
			listValores.put("lstPaises", (List) tratarRETURNyMENSAJES(request, map, false));
			formdata.put("listValores", listValores);

			// Lista profesiones

			map = pacIaxValores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTPROFESIONES(new BigDecimal(0));
			logger.debug(map);
			formdata.put("lstProfesiones", (List) tratarRETURNyMENSAJES(request, map, false));

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr101Service - m�todo m_guardar_riesgo", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	public void m_borrar_persona(HttpServletRequest request, Axisctr101Action thisAction) {

		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);

		try {

			String SPERSON2MODIFY = getCampoTextual(request, "SPERSON2MODIFY");
			// Eliminar Riesgo de la BBDD //
			request.getSession().setAttribute("SPERSON2MODIFY", SPERSON2MODIFY);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr101Service - m�todo m_borrar_persona", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);

		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}

		// return new BigDecimal(0);
	}

	public void m_buscar_avisos(HttpServletRequest request, Axisctr101Action thisAction) {
		logger.debug("Axisctr101Service m_buscar_avisos");
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {
			// String SEGUIR = getCampoTextual (request, "SEGUIR");
			// if ("ko".equals(SEGUIR)){
			// formdata.put("SEGUIR",new String("ko"));
			// }else{
			HashMap m = this.f_Get_Avisos(request, this.whoami(this));
			BigDecimal pRETURN = (BigDecimal) this.tratarRETURNyMENSAJES(request, m);
			request.setAttribute("PLSTAVISOS", m.get("PLSTAVISOS"));

			if (pRETURN != null && pRETURN.intValue() != 1) {
				formdata.put("SEGUIR", new String("ok"));
			} else
				formdata.put("SEGUIR", new String("ko"));
			request.getSession().setAttribute("CMODOASEGU", "SIMULACION");
			// }
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr101Service - m�todo m_buscar_avisos", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	public void m_ajax_actualitza_ctipper(HttpServletRequest request) {
		logger.debug("Axisctr101Service m_ajax_actualitza_ctipper");
		AjaxContainerService ajax = new AjaxContainerService();
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {

			BigDecimal TIDENTI = getCampoNumerico(request, "TIDENTI");
			PAC_IAX_LISTVALORES pacIaxValores = new PAC_IAX_LISTVALORES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map m = pacIaxValores.ejecutaPAC_IAX_LISTVALORES__F_GET_TIPDOCUM_TIPPER(TIDENTI);
			List axisctr100_comboTipoDocu = (List) tratarRETURNyMENSAJES(request, m);
			ajax.guardarContenidoFinalAContenedorAjax(axisctr100_comboTipoDocu);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr001Service - m�todo m_ajax_busqueda_productos", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

}
