//Revision:# PuGJU0W7sO4UVuKoUXYs5A== #
package axis.service.modal;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_DEVOLUCIONES;
import axis.jdbc.PAC_IAX_DOCREQUERIDA;
import axis.jdbc.PAC_IAX_PRODUCCION;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AjaxContainerService;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

public class Axisctr174Service extends AxisBaseService {
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
		logger.debug("Axisctr174Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		boolean trobat = false;
		HashMap mtrobat = null;
		try {
			BigDecimal pSEQDOCU = getCampoNumerico(request, "SEQDOCU") != null ? getCampoNumerico(request, "SEQDOCU")
					: null;
			BigDecimal pCDOCUME = getCampoNumerico(request, "CDOCUME");
			BigDecimal pCCLASE = getCampoNumerico(request, "CCLASE");
			BigDecimal pNORDEN = getCampoNumerico(request, "NORDEN");

			// bug RSC 27/11/2012
			BigDecimal pNRIESGO = getCampoNumerico(request, "NRIESGO");
			BigDecimal pSPERSON = getCampoNumerico(request, "SPERSON");
			// fi bug RSC 27/11/2012

			String pPTFILENAME, pPTDESCRIP = null;
			BigDecimal pPNRIESGO, pPNINQAVAL, pPCDOCUME, pPCTIPDOC, pPCCLASE, pPNORDEN, pPSEQDOCU = null;

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
			String DOCREQUERIDA_SEG = (String) AbstractDispatchAction.topPila(request, "DOCREQUERIDA_SEG") != null
					? (String) AbstractDispatchAction.topPila(request, "DOCREQUERIDA_SEG")
					: null;
			BigDecimal sseguro = (datos_poliza.get("SSEGURO") != null) ? (BigDecimal) datos_poliza.get("SSEGURO")
					: null;
			BigDecimal pCACTIVI = (datos_poliza.get("CACTIVI") != null) ? (BigDecimal) datos_poliza.get("CACTIVI")
					: null;
			// BigDecimal pNMOVIMI= (datos_poliza.get("NMOVIMI") != null) ?
			// (BigDecimal)datos_poliza.get("NMOVIMI") : new BigDecimal(1);
			BigDecimal pNMOVIMI = null;

			// Recuperem les dades
			Map mdocrequi;
			if (!isEmpty(DOCREQUERIDA_SEG))
				mdocrequi = pacIaxDocrequerida.ejecutaPAC_IAX_DOCREQUERIDA__F_GET_DOCUREQUERIDA(sseguro,
						new BigDecimal(1));
			else
				mdocrequi = pacIaxProduccion.ejecutaPAC_IAX_PRODUCCION__F_LEEDOCREQUERIDA(SPRODUC, sseguro, pCACTIVI,
						pNMOVIMI);

			if (mdocrequi.get("RETURN") != null) {
				List documents = (List) tratarRETURNyMENSAJES(request, mdocrequi, false);
				if (documents.size() > 0) {
					for (int i = 0; documents.size() > i; i++) {
						if (documents.get(i) != null) {
							if (((HashMap) (documents.get(i))).get("OB_IAX_DOCREQUERIDA") != null) {
								if (((HashMap) (((HashMap) (documents.get(i))).get("OB_IAX_DOCREQUERIDA")))
										.get("CDOCUME") != null) {
									if ((pSEQDOCU != null) && (pSEQDOCU.equals(
											((HashMap) (((HashMap) (documents.get(i))).get("OB_IAX_DOCREQUERIDA")))
													.get("SEQDOCU")))) {
										trobat = true;
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
										mtrobat = (HashMap) ((HashMap) (documents.get(i))).get("OB_IAX_DOCREQUERIDA");
										i = documents.size();
									}
								}
							}
						}
					}
				}
			}
			request.setAttribute("OB_IAX_DOCREQUERIDA", mtrobat);
			logger.debug("OB_IAX_DOCREQUERIDA:" + mtrobat);

			BigDecimal subido = getHiddenCampoNumerico(request, "subido");
			request.setAttribute("subido", subido);
			logger.debug("subido:" + subido);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisper005Service - m�todo ajax_adjuntar", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	public void m_ejecutar(HttpServletRequest request) {
		logger.debug("Axisctr174Service m_ejecutar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {

			PAC_IAX_DEVOLUCIONES pac_iax_devoluciones = new PAC_IAX_DEVOLUCIONES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			Map map1 = pac_iax_devoluciones.ejecutaPAC_IAX_DEVOLUCIONES__F_EXEC_DEVOLU();
			logger.debug(map1);
			tratarRETURNyMENSAJES(request, map1);
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr174Service - m�todo m_ejecutar", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
	}

}
