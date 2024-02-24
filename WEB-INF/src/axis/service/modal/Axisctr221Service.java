//Revision:# SBtk3ItEO5uHqRV8rZ/b9g== #
package axis.service.modal;

import java.math.BigDecimal;
import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_GESTIONPROPUESTA;
import axis.jdbc.PAC_IAX_PRODUCCION;
import axis.jdbc.PAC_IAX_SUPLEMENTOS;
import axis.jdbc.PAC_IAX_SUSPENSION;
import axis.mvc.control.AbstractDispatchAction;
//import axis.mvc.control.modal.Axisctr069Action;
import axis.mvc.control.modal.Axisctr221Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AjaxContainerService;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

/**
 * Axisctr221Service.java 14/05/2015
 * 
 * @since Java 5.0
 */
@SuppressWarnings("all")
public class Axisctr221Service extends AxisBaseService {
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
		logger.debug("Axisctr221Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {

			// PAC_IAX_BLOQUEO pacIaxBloqueo=new
			// PAC_IAX_BLOQUEO((java.sql.Connection)request.getAttribute(Constantes.DB01CONN));
			PAC_IAX_SUSPENSION pacIaxSuspension = new PAC_IAX_SUSPENSION(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			PAC_IAX_PRODUCCION pacIaxProduccion = new PAC_IAX_PRODUCCION(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			PAC_IAX_SUPLEMENTOS pacIaxSuplementos = new PAC_IAX_SUPLEMENTOS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			BigDecimal SSEGURO = getCampoNumerico(request, "SSEGURO");
			String TMOTMOV = getCampoTextual(request, "TMOTMOV");
			BigDecimal PRIMERA = (getCampoNumerico(request, "PRIMERA") != null) ? getCampoNumerico(request, "PRIMERA")
					: new BigDecimal(0);
			formdata.put("pPRIMERA", PRIMERA);
			String modo = "SUPLEMENTO_";
			BigDecimal v_motmov = null;

			if ("BOT_BLOQUEAR".equals(TMOTMOV)) {
				modo += "262";
			}

			if ("BOT_DESBLOQUEAR".equals(TMOTMOV)) {
				modo += "264";
			}

			if ("BOT_PIGNORAR".equals(TMOTMOV)) {
				modo += "261";
			}

			if ("BOT_DESPIGNORAR".equals(TMOTMOV)) {
				modo += "263";
			}

			if ("BOT_SUSPENDER".equals(TMOTMOV)) {
				modo += "391";
				v_motmov = new BigDecimal(391);
			}

			if ("BOT_REINICIAR".equals(TMOTMOV)) {
				modo += "392";
				v_motmov = new BigDecimal(392);
			}

			AbstractDispatchAction.topPila(request, "CMODO", modo);

			if (!isEmpty(SSEGURO) && !isEmpty(TMOTMOV)) {
				Map map = new HashMap();
				if ("BOT_REINICIAR".equals(TMOTMOV) || "BOT_SUSPENDER".equals(TMOTMOV))
					map = pacIaxSuspension.ejecutaPAC_IAX_SUSPENSION__F_GET_MOV(SSEGURO, TMOTMOV);
				/*
				 * else map=pacIaxBloqueo.ejecutaPAC_IAX_BLOQUEO__F_GET_MOV(SSEGURO, TMOTMOV);
				 */

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

					if (!"BOT_REINICIAR".equals(TMOTMOV) && !"BOT_SUSPENDER".equals(TMOTMOV)) {
						BigDecimal NBLOQUEO = (BigDecimal) datos.get(0).get("NBLOQUEO");

						// map=pacIaxBloqueo.ejecutaPAC_IAX_BLOQUEO__F_GET_TEXTDESBLOQ(SSEGURO, TMOTMOV,
						// NBLOQUEO);
						logger.debug(map);
						// formdata.put("TTEXTO", tratarRETURNyMENSAJES(request, map));
						formdata.put("TTEXTO2", tratarRETURNyMENSAJES(request, map));

					}
				}
			}

			/* Inicializamos una propuesta de suplemento para meter alli la documentaci�n */
			BigDecimal SSEGURO_OUT = null;
			BigDecimal pNMOVIMI_OUT = null;
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
			} else {
				SSEGURO_OUT = (BigDecimal) AbstractDispatchAction.topPila(request, "SSEGURO");
				pNMOVIMI_OUT = (BigDecimal) AbstractDispatchAction.topPila(request, "MOVIMI");
			}
			logger.debug("SSEGURO_OUT: " + SSEGURO_OUT);
			formdata.put("SSEGURO_OUT", SSEGURO_OUT);
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
			Map mdocrequi = pacIaxProduccion.ejecutaPAC_IAX_PRODUCCION__F_LEEDOCREQUERIDA(SPRODUC, SSEGURO_OUT,
					pCACTIVI_OUT, pNMOVIMI_OUT);

			logger.debug("ejecutaPAC_IAX_PRODUCCION__F_LEEDOCREQUERIDA:" + mdocrequi);
			request.setAttribute("docu_requerida", tratarRETURNyMENSAJES(request, mdocrequi, false));
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
		logger.debug("Axisctr221Service m_aceptar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {

			// PAC_IAX_BLOQUEO pacIaxBloqueo=new
			// PAC_IAX_BLOQUEO((java.sql.Connection)request.getAttribute(Constantes.DB01CONN));
			PAC_IAX_SUSPENSION pacIaxSuspension = new PAC_IAX_SUSPENSION(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			BigDecimal SSEGURO = getCampoNumerico(request, "SSEGURO");
			String TMOTMOV = getCampoTextual(request, "TMOTMOV");
			Date FINICIO = stringToSqlDate(getCampoTextual(request, "FINICIO"));
			Date FFINAL = stringToSqlDate(getCampoTextual(request, "FFINAL"));
			String TTEXTO = getCampoTextual(request, "TTEXTO");
			String TTEXTO2 = getCampoTextual(request, "TTEXTO2");
			BigDecimal IIMPORTE = getCampoNumerico(request, "IIMPORTE");
			Map map = new HashMap();

			if (!isEmpty(TMOTMOV) && ("BOT_REINICIAR".equals(TMOTMOV) || "BOT_SUSPENDER".equals(TMOTMOV)))
				map = pacIaxSuspension.ejecutaPAC_IAX_SUSPENSION__F_SET_MOV(SSEGURO, TMOTMOV, FINICIO, FFINAL, TTEXTO,
						TTEXTO2);
			/*
			 * else map=pacIaxBloqueo.ejecutaPAC_IAX_BLOQUEO__F_SET_MOV(SSEGURO, TMOTMOV,
			 * FINICIO, FFINAL, TTEXTO, TTEXTO2, IIMPORTE);
			 */

			logger.debug(map);
			request.setAttribute("guardarOK", BigDecimal.ZERO.equals(tratarRETURNyMENSAJES(request, map)));
			String mensj = (String) ((Map) ((Map) ((List) map.get("MENSAJES")).get(0)).get("OB_IAX_MENSAJES"))
					.get("TERROR");

			request.setAttribute("MENSAJE", mensj.replace("'", "�"));

			formdata.put("IIMPORTE", IIMPORTE);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr221Service - m�todo m_aceptar", e);
			AbstractDispatchAction.guardarMensaje(request,
					"verbatim:<b>" + e.getClass().getName() + ":</b> " + e.getLocalizedMessage(),
					new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));

	}

	public void ajax_adjuntar(HttpServletRequest request, Axisctr221Action thisAction) {
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
}
