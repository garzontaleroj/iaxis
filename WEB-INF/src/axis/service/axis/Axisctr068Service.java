//Revision:# 5PYAoyz1euuZCW9XIEfDpw== #
package axis.service.axis;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAXPAR_PRODUCTOS;
import axis.jdbc.PAC_IAX_BLOQUEO;
import axis.jdbc.PAC_IAX_DATOSCTASEGURO;
import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.jdbc.PAC_IAX_OBTENERDATOS;
import axis.jdbc.PAC_IAX_PRODUCCION;
import axis.jdbc.PAC_IAX_SUSPENSION;
import axis.jdbc.SINPAQUETE;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.control.axis.Axisctr068Action;
import axis.mvc.model.UsuarioBean;
import axis.util.Constantes;

/**
 * Axisctr068Service.java 13/03/2009
 * 
 * @since Java 5.0
 */
@SuppressWarnings("all")
public class Axisctr068Service extends AxisBaseService {
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
		logger.debug("Axisctr068Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		int nPignoraciones = 0;
		try {

			PAC_IAX_PRODUCCION pacIaxProduccion = new PAC_IAX_PRODUCCION(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			PAC_IAX_BLOQUEO pacIaxBloqueo = new PAC_IAX_BLOQUEO(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			PAC_IAXPAR_PRODUCTOS pacIaxparProductos = new PAC_IAXPAR_PRODUCTOS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			PAC_IAX_OBTENERDATOS pacIaxObtenerDatos = new PAC_IAX_OBTENERDATOS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			PAC_IAX_DATOSCTASEGURO pacIaxDatosCtaSeguro = new PAC_IAX_DATOSCTASEGURO(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			BigDecimal SSEGURO = getCampoNumerico(request, "SSEGURO");

			String CMODO = (String) AbstractDispatchAction.topPila(request, "CMODO");
			String CMODOx = (String) AbstractDispatchAction.topPila(request, "CMODOx");

			if (!isEmpty(CMODO) && isEmpty(CMODOx))
				AbstractDispatchAction.topPila(request, "CMODOx", CMODO);

			if (!isEmpty(CMODOx))
				AbstractDispatchAction.topPila(request, "CMODO", CMODOx);

			CMODO = (String) AbstractDispatchAction.topPila(request, "CMODO");

			if (!isEmpty(SSEGURO)) {
				Map map = pacIaxProduccion.ejecutaPAC_IAX_PRODUCCION__F_SET_CONSULTAPOLIZA(SSEGURO);
				logger.debug(map);
				BigDecimal SPRODUC = null;

				if (BigDecimal.ZERO.equals(tratarRETURNyMENSAJES(request, map))) {
					map = pacIaxProduccion.ejecutaPAC_IAX_PRODUCCION__F_GET_DATPOLIZA(SSEGURO);
					logger.debug(map);
					Map datosPoliza = (Map) tratarRETURNyMENSAJES(request, map);
					formdata.put("datosPoliza", datosPoliza);

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
						// Bug 39892/223715
						SPRODUC = (BigDecimal) datosPoliza.get("SPRODUC");
					}

					map = pacIaxProduccion.ejecutaPAC_IAX_PRODUCCION__F_LEETOMADORES();
					logger.debug(map);
					formdata.put("T_IAX_TOMADORES", tratarRETURNyMENSAJES(request, map));

					map = pacIaxProduccion.ejecutaPAC_IAX_PRODUCCION__F_GET_GESTRIESGOS();
					logger.debug(map);
					List<Map> T_IAX_GESTRIESGOS = (List) tratarRETURNyMENSAJES(request, map, false);
					formdata.put("T_IAX_GESTRIESGOS", T_IAX_GESTRIESGOS);

					// Bug 39892/223715
					BigDecimal NRIESGO = new BigDecimal(0);
					String TASEGURADOS = "";
					if (!isEmpty(T_IAX_GESTRIESGOS)) {
						for (Map Mriesgos : T_IAX_GESTRIESGOS) {
							NRIESGO = (BigDecimal) ((Map) Mriesgos.get("OB_IAX_GESTRIESGOS")).get("NRIESGO");
							Map mapase = pacIaxProduccion.ejecutaPAC_IAX_PRODUCCION__F_LEEASEGURADOS(NRIESGO, SPRODUC);
							List<Map> T_IAX_ASEGURADOS = (List) tratarRETURNyMENSAJES(request, mapase, false);
							if (!isEmpty(T_IAX_ASEGURADOS)) {
								for (Map Masegurados : T_IAX_ASEGURADOS) {
									String TNOMBRE = (String) ((Map) Masegurados.get("OB_IAX_ASEGURADOS"))
											.get("TNOMBRE");
									String TAPELLI1 = (String) ((Map) Masegurados.get("OB_IAX_ASEGURADOS"))
											.get("TAPELLI1");
									String TAPELLI2 = (String) ((Map) Masegurados.get("OB_IAX_ASEGURADOS"))
											.get("TAPELLI2");

									if (isEmpty(TASEGURADOS)) {
										if (!isEmpty(TNOMBRE)) {
											TASEGURADOS = TNOMBRE;
										}
										if (!isEmpty(TAPELLI1)) {
											TASEGURADOS = TASEGURADOS + " " + TAPELLI1;
										}
										if (!isEmpty(TAPELLI2)) {
											TASEGURADOS = TASEGURADOS + " " + TAPELLI2;
										}
									} else {
										if (!isEmpty(TNOMBRE)) {
											TASEGURADOS = TASEGURADOS + "," + TNOMBRE;
										}
										if (!isEmpty(TAPELLI1)) {
											TASEGURADOS = TASEGURADOS + " " + TAPELLI1;
										}
										if (!isEmpty(TAPELLI2)) {
											TASEGURADOS = TASEGURADOS + " " + TAPELLI2;
										}
									}
								}
							}
						}
					}
					formdata.put("TASEGURADOS", TASEGURADOS);

					map = pacIaxparProductos.ejecutaPAC_IAXPAR_PRODUCTOS__F_GET_GARANTIAS(NRIESGO);
					tratarRETURNyMENSAJES(request, map, false);
					ArrayList garantiaspol = (ArrayList) map.get("RETURN");
					BigDecimal CGARANT = null;
					if (!isEmpty(garantiaspol)) {
						CGARANT = (BigDecimal) ((Map) ((Map) garantiaspol.get(0)).get("OB_IAXPAR_GARANTIAS"))
								.get("CGARANT");
					}
					if (!isEmpty(CGARANT)) {
						map = pacIaxObtenerDatos.ejecutaPAC_IAX_OBTENERDATOS__F_LEECAPITAL(SSEGURO, NRIESGO, CGARANT,
								new String("REAL"));
						BigDecimal icapital = (BigDecimal) tratarRETURNyMENSAJES(request, map);
						formdata.put("ICAPITAL", icapital);
					}
					// Fin Bug 39892/223715

					map = pacIaxProduccion.ejecutaPAC_IAX_PRODUCCION__F_GET_MVTPOLIZA();
					logger.debug(map);
					formdata.put("T_IAX_MVTPOLIZA", tratarRETURNyMENSAJES(request, map));

					// Bug 27766. Obtener polizas pignoradas
					map = pacIaxBloqueo.ejecutaPAC_IAX_BLOQUEO__F_GET_BLOQUEOS(SSEGURO);
					logger.debug(map);
					List T_IAX_MVTPOLIZAPIGNORADA = (List) tratarRETURNyMENSAJES(request, map);
					if (T_IAX_MVTPOLIZAPIGNORADA != null) {
						nPignoraciones = T_IAX_MVTPOLIZAPIGNORADA.size();
					}
					formdata.put("T_IAX_MVTPOLIZAPIGNORADA", T_IAX_MVTPOLIZAPIGNORADA);

					HashMap aux = (HashMap) formdata.get("datosPoliza");
					SPRODUC = (BigDecimal) aux.get("SPRODUC");
					logger.debug("======> SPRODUC: " + SPRODUC);
					// Comprueba si es multipignoraci�n
					SINPAQUETE sinpaquete = new SINPAQUETE(
							(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
					map = sinpaquete.ejecutaF_PARPRODUCTOS_V((BigDecimal) SPRODUC, "CPIGNOMULT");
					logger.debug("---> PIGNORACIONMULTIPLE:" + map);
					if (map.get("RETURN") != null) {
						if (map.get("RETURN").equals(new BigDecimal("2")))
							formdata.put("PIGNORACIONMULTIPLE", "true");
						else
							formdata.put("PIGNORACIONMULTIPLE", "false");
					} else {
						formdata.put("PIGNORACIONMULTIPLE", "false");
					}

					// Fin Bug 27766.

					// Obtener detalles del recibo Bug 24450/131928 - 10/12/2012 - MLUIS
					map = pacIaxProduccion.ejecutaPAC_IAX_PRODUCCION__F_GET_RECIBOS();
					logger.debug(map);
					formdata.put("T_IAX_RECIBOS", tratarRETURNyMENSAJES(request, map, false));

					java.util.Date d = new java.util.Date();
					java.sql.Date sqlDate = new java.sql.Date(d.getTime());

					Map datoseconomicos = pacIaxDatosCtaSeguro.ejecutaPAC_IAX_DATOSCTASEGURO__F_OBTDATECON(SSEGURO,
							NRIESGO, sqlDate);
					logger.debug(datoseconomicos);

					Map OB_IAX_DATOSECONOMICOS = (Map) tratarRETURNyMENSAJES(request, datoseconomicos, false);
					formdata.put("OB_IAX_DATOSECONOMICOS", OB_IAX_DATOSECONOMICOS);
				}
			}

			// Visibilidad botones
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));

			logger.debug("CMODO-->" + CMODO);
			if (!isEmpty(CMODO) && !CMODO.equals("SUSPENSION")) {
				Map configForm = (Map) request.getAttribute(Constantes.CONFIGFORM);

				String[] botones = { "BOT_BLOQUEAR", "BOT_DESBLOQUEAR", "BOT_PIGNORAR", "BOT_DESPIGNORAR", };

				for (int i = 0; i < botones.length; i++) {
					if (!isEmpty(SSEGURO)) {
						Map map = new PAC_IAX_BLOQUEO((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
								.ejecutaPAC_IAX_BLOQUEO__F_VALIDA_CREA_MOV(SSEGURO, botones[i]);
						logger.debug(map);
						if (botones[i].equals("BOT_DESPIGNORAR") && nPignoraciones != 1) {
							configForm.put("axisctr068__" + botones[i] + "__visible", "false");
						} else if (botones[i].equals("BOT_DESPIGNORAR") && nPignoraciones == 1) {

							String respetaCfg = (String) configForm.get("axisctr068__" + botones[i] + "__visible");

							if (isEmpty(respetaCfg) || respetaCfg.equalsIgnoreCase("true")) {
								configForm.put("axisctr068__" + botones[i] + "__visible", "true");

							}
						} else {

							String respetaCfg = (String) configForm.get("axisctr068__" + botones[i] + "__visible");

							if (isEmpty(respetaCfg) || respetaCfg.equalsIgnoreCase("true")) {
								configForm.put("axisctr068__" + botones[i] + "__visible",
										BigDecimal.ZERO.equals(map.get("RETURN")) ? "true" : "false");

							}

						}
					} else {
						configForm.put("axisctr068__" + botones[i] + "__visible", "false");
					}
				}

				if (isEmpty(SSEGURO)) {
					configForm.put("axisctr068__BOT_CONSULTAPOLIZA__visible", "false");
				}
			} else {
				PAC_IAX_SUSPENSION pacIaxSuspension = new PAC_IAX_SUSPENSION(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

				Map mmm = pacIaxSuspension.ejecutaPAC_IAX_SUSPENSION__F_GET_PROX_MOV((SSEGURO));
				logger.debug(mmm);
				formdata.put("PROXCMOTMOV", this.tratarRETURNyMENSAJES(request, mmm));
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr068Service - m�todo m_form", e);
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

	public void m_consultar(HttpServletRequest request, Axisctr068Action thisAction) {

		logger.debug("Axisctr068Service m_consultar");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {
			this.formattingNumericValues(request);
			thisAction.topPila(request, "formdata_axisctr068", formdata);
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr068Service - m�todo m_consultar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}

	public void m_volver(HttpServletRequest request, Axisctr068Action thisAction) {

		logger.debug("Axisctr068Service m_volver");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {
			Map formdata_axisctr068 = (Map) thisAction.removeTopPila(request, "formdata_axisctr068");
			if (!isEmpty(formdata_axisctr068))
				formdata.putAll(formdata_axisctr068);
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr068Service - m�todo m_volver", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}

}
