//Revision:# PuGJU0W7sO4UVuKoUXYs5A== #
package axis.service.modal;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_CFG;
import axis.jdbc.PAC_IAX_DOCREQUERIDA;
import axis.jdbc.PAC_IAX_GESTIONPROPUESTA;
import axis.jdbc.PAC_IAX_PRODUCCION;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.control.modal.Axisctr173Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AjaxContainerService;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

public class Axisctr173Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	/**
	 * M�todo que se llama al inicio de este flujo. Realiza la carga inicial de los
	 * datos de los combos.
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_form(HttpServletRequest request, Axisctr173Action thisAction) {
		logger.debug("AXISSIN012Service m_guardar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		logger.debug("AXISSIN012Service m_form");

		try {
			PAC_IAX_PRODUCCION pacIaxProduccion = new PAC_IAX_PRODUCCION(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			PAC_IAX_DOCREQUERIDA pacIaxDocrequerida = new PAC_IAX_DOCREQUERIDA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			// PAC_IAX_PRODUCCION.f_set_consultapoliza ????

			String topUnder = (String) AbstractDispatchAction.topPila(request, "UNDERWRITING") != null
					? (String) AbstractDispatchAction.topPila(request, "UNDERWRITING")
					: this.getCampoTextual(request, "cmodoconsult");

			if (!isEmpty(topUnder)) {
				AbstractDispatchAction.topPila(request, "UNDERWRITING", topUnder);
				formdata.put("UNDERWRITING", topUnder);
			}
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

			BigDecimal sseguro = (datos_poliza.get("SSEGURO") != null) ? (BigDecimal) datos_poliza.get("SSEGURO")
					: null;
			BigDecimal pCACTIVI = (datos_poliza.get("CACTIVI") != null) ? (BigDecimal) datos_poliza.get("CACTIVI")
					: null;
			// BigDecimal pNMOVIMI= (datos_poliza.get("NMOVIMI") != null) ?
			// (BigDecimal)datos_poliza.get("NMOVIMI") : new BigDecimal(1);
			BigDecimal pNMOVIMI = (BigDecimal) AbstractDispatchAction.topPila(request, "MOVIMI");
			if (pNMOVIMI == null) {
				pNMOVIMI = (datos_poliza.get("NMOVIMI") != null) ? (BigDecimal) datos_poliza.get("NMOVIMI")
						: new BigDecimal(1);
			}

			logger.debug("m_form Axisctr173. sseguro: " + sseguro);
			logger.debug("m_form Axisctr173. SPRODUC: " + SPRODUC);
			logger.debug("m_form Axisctr173. pCACTIVI: " + pCACTIVI);
			logger.debug("m_form Axisctr173. pNMOVIMI: " + pNMOVIMI);

			String DOCREQUERIDA_SEG = (String) AbstractDispatchAction.topPila(request, "DOCREQUERIDA_SEG") != null
					? (String) AbstractDispatchAction.topPila(request, "DOCREQUERIDA_SEG")
					: null;
			Map mdocrequi = null;
			BigDecimal SSEGURO_OUT = (BigDecimal) AbstractDispatchAction.topPila(request, "SSEGURO_OUT");
			logger.debug("m_form Axisctr173. SSEGURO_OUT: " + SSEGURO_OUT);

			if (!isEmpty(DOCREQUERIDA_SEG)) {
				mdocrequi = pacIaxDocrequerida.ejecutaPAC_IAX_DOCREQUERIDA__F_GET_DOCUREQUERIDA(sseguro,
						new BigDecimal(1));
			} else {
				if (SSEGURO_OUT != null) {
					BigDecimal pNMOVIMI_OUT = (BigDecimal) AbstractDispatchAction.topPila(request, "NMOVIMI");
					BigDecimal pCACTIVI_OUT = new BigDecimal(0);
					mdocrequi = pacIaxProduccion.ejecutaPAC_IAX_PRODUCCION__F_LEEDOCREQUERIDA(SPRODUC, SSEGURO_OUT,
							pCACTIVI_OUT, pNMOVIMI_OUT);
				} else {
					mdocrequi = pacIaxProduccion.ejecutaPAC_IAX_PRODUCCION__F_LEEDOCREQUERIDA(SPRODUC, sseguro,
							pCACTIVI, pNMOVIMI);
				}
			}

			logger.debug("ejecutaPAC_IAX_PRODUCCION__F_LEEDOCREQUERIDA:" + mdocrequi);
			request.setAttribute("docu_requerida", tratarRETURNyMENSAJES(request, mdocrequi, false));

			BigDecimal modificado = getHiddenCampoNumerico(request, "modificado");
			request.setAttribute("modificado", modificado);
			logger.debug("modificado:" + modificado);
		} catch (Exception e) {
			logger.error("Error en el servicio Axispro004Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}

	public void ajax_adjuntar(HttpServletRequest request, Axisctr173Action thisAction) {
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
			BigDecimal pCRECIBIDO = getCampoNumerico(request, "CRECIBIDO");

			// bug RSC 27/11/2012
			BigDecimal pNRIESGO = getCampoNumerico(request, "NRIESGO");
			BigDecimal pSPERSON = getCampoNumerico(request, "SPERSON");
			// fi bug RSC 27/11/2012

			String pPTFILENAME, pPTDESCRIP = null;
			BigDecimal pPNRIESGO, pPNINQAVAL, pPCDOCUME, pPCTIPDOC, pPCCLASE, pPNORDEN, pPSEQDOCU, pPSPERSON = null,
					pPCTIPBEN;

			PAC_IAX_PRODUCCION pacIaxProduccion = new PAC_IAX_PRODUCCION(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			PAC_IAX_DOCREQUERIDA pacIaxDocrequerida = new PAC_IAX_DOCREQUERIDA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
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

			BigDecimal sseguro = (datos_poliza.get("SSEGURO") != null) ? (BigDecimal) datos_poliza.get("SSEGURO")
					: null;
			BigDecimal pCACTIVI = (datos_poliza.get("CACTIVI") != null) ? (BigDecimal) datos_poliza.get("CACTIVI")
					: null;
			BigDecimal pNMOVIMI = (datos_poliza.get("NMOVIMI") != null) ? (BigDecimal) datos_poliza.get("NMOVIMI")
					: new BigDecimal(1);

			// Recuperem les dades
			// Map mdocrequi =
			// pacIaxProduccion.ejecutaPAC_IAX_PRODUCCION__F_LEEDOCREQUERIDA(SPRODUC,sseguro,
			// pCACTIVI, pNMOVIMI);

			Map mdocrequi = null;
			BigDecimal SSEGURO_OUT = (BigDecimal) AbstractDispatchAction.topPila(request, "SSEGURO_OUT");
			String DOCREQUERIDA_SEG = (String) AbstractDispatchAction.topPila(request, "DOCREQUERIDA_SEG") != null
					? (String) AbstractDispatchAction.topPila(request, "DOCREQUERIDA_SEG")
					: null;
			BigDecimal pNMOVIMI_OUT = null;
			BigDecimal pCACTIVI_OUT = null;
			if (!isEmpty(DOCREQUERIDA_SEG)) {
				mdocrequi = pacIaxDocrequerida.ejecutaPAC_IAX_DOCREQUERIDA__F_GET_DOCUREQUERIDA(sseguro,
						new BigDecimal(1));
			} else {
				if (SSEGURO_OUT != null) {
					pNMOVIMI_OUT = (BigDecimal) AbstractDispatchAction.topPila(request, "NMOVIMI");
					pCACTIVI_OUT = new BigDecimal(0);
					mdocrequi = pacIaxProduccion.ejecutaPAC_IAX_PRODUCCION__F_LEEDOCREQUERIDA(SPRODUC, SSEGURO_OUT,
							pCACTIVI_OUT, pNMOVIMI_OUT);
				} else {
					BigDecimal MOVIMI = (BigDecimal) AbstractDispatchAction.topPila(request, "MOVIMI");
					if (MOVIMI != null) {
						mdocrequi = pacIaxProduccion.ejecutaPAC_IAX_PRODUCCION__F_LEEDOCREQUERIDA(SPRODUC, sseguro,
								pCACTIVI, MOVIMI);
					} else {
						mdocrequi = pacIaxProduccion.ejecutaPAC_IAX_PRODUCCION__F_LEEDOCREQUERIDA(SPRODUC, sseguro,
								pCACTIVI, pNMOVIMI);
					}
				}
			}
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
										Map mgrabar = null;
										if (!isEmpty(DOCREQUERIDA_SEG)) {
											mgrabar = pacIaxDocrequerida
													.ejecutaPAC_IAX_DOCREQUERIDA__F_GRABARDOCREQUERIDAPOL(pPSEQDOCU,
															SPRODUC, sseguro, pCACTIVI, new BigDecimal(1), pPNRIESGO,
															pPNINQAVAL, pPCDOCUME, pPCTIPDOC, pPCCLASE, pPNORDEN,
															pPTDESCRIP, pPTFILENAME, pPADJUNTADO, pCRECIBIDO);
										} else {
											if (SSEGURO_OUT != null) {
												mgrabar = pacIaxProduccion
														.ejecutaPAC_IAX_PRODUCCION__F_GRABARDOCREQUERIDA(pPSEQDOCU,
																SPRODUC, SSEGURO_OUT, pCACTIVI_OUT, pNMOVIMI_OUT,
																pPNRIESGO, pPNINQAVAL, pPCDOCUME, pPCTIPDOC, pPCCLASE,
																pPNORDEN, pPTDESCRIP, pPTFILENAME, pPADJUNTADO,
																pPSPERSON, pPCTIPBEN);
											} else {
												BigDecimal MOVIMI = (BigDecimal) AbstractDispatchAction.topPila(request,
														"MOVIMI");
												if (MOVIMI != null) {
													mgrabar = pacIaxProduccion
															.ejecutaPAC_IAX_PRODUCCION__F_GRABARDOCREQUERIDA(pPSEQDOCU,
																	SPRODUC, sseguro, pCACTIVI, MOVIMI, pPNRIESGO,
																	pPNINQAVAL, pPCDOCUME, pPCTIPDOC, pPCCLASE,
																	pPNORDEN, pPTDESCRIP, pPTFILENAME, pPADJUNTADO,
																	pPSPERSON, pPCTIPBEN);
												} else {
													mgrabar = pacIaxProduccion
															.ejecutaPAC_IAX_PRODUCCION__F_GRABARDOCREQUERIDA(pPSEQDOCU,
																	SPRODUC, sseguro, pCACTIVI, pNMOVIMI, pPNRIESGO,
																	pPNINQAVAL, pPCDOCUME, pPCTIPDOC, pPCCLASE,
																	pPNORDEN, pPTDESCRIP, pPTFILENAME, pPADJUNTADO,
																	pPSPERSON, pPCTIPBEN);
												}
											}
										}
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

	public void m_retenida(HttpServletRequest request, Axisctr173Action thisAction) {
		logger.debug("Axisctr173 m_retenida");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {

			PAC_IAX_CFG pacIaxCfg = new PAC_IAX_CFG((java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			PAC_IAX_GESTIONPROPUESTA pacIaxGestionPropuesta = new PAC_IAX_GESTIONPROPUESTA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			BigDecimal SPRODUC = getCampoNumerico(request, "SPRODUC");
			BigDecimal SSEGURO = getCampoNumerico(request, "SSEGURO");
			String CCAMPO = getCampoTextual(request, "CCAMPO");
			// String CMODO = "BT_SOBREPRIMA".equals(CCAMPO) ? "MODIF_PROP_801":
			// "MODIF_PROP_288";
			String CMODO = "MODIF_PROP_245";
			String CFORM = "AXISCTR034";
			CCAMPO = "MODIF_PROP_288";
			Map map = pacIaxGestionPropuesta.ejecutaPAC_IAX_GESTIONPROPUESTA__F_INICIALIZAR_MODIFICACION(SSEGURO, CMODO,
					CFORM, CCAMPO);

			logger.debug(map);

			AbstractDispatchAction.topPila(request, "SPRODUC", SPRODUC);
			if (BigDecimal.ZERO.equals(tratarRETURNyMENSAJES(request, map))) {
				AbstractDispatchAction.topPila(request, "SSEGURO", map.get("OESTSSEGURO"));
				AbstractDispatchAction.topPila(request, "MOVIMI", map.get("ONMOVIMI"));
			}
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr034Service - m�todo m_modificar", e);
			AbstractDispatchAction.guardarMensaje(request,
					"verbatim:<b>" + e.getClass().getName() + ":</b> " + e.getLocalizedMessage(),
					new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

	public void m_docrequerida(HttpServletRequest request, Axisctr173Action thisAction) {
		logger.debug("Axisctr173 m_docrequerida");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {
			AbstractDispatchAction.topPila(request, "DOCREQUERIDA_SEG", "SEG");

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr173 - m�todo m_docrequerida", e);
			AbstractDispatchAction.guardarMensaje(request,
					"verbatim:<b>" + e.getClass().getName() + ":</b> " + e.getLocalizedMessage(),
					new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}

	}

}
