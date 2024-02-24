//Revision:# N8CRChkP3yS3oh4ZTq5AUQ== #
package axis.service.axis;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_REA;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.model.UsuarioBean;
import axis.util.Constantes;

/**
 * Axisrea047Service.java 29/06/2009
 * 
 * @since Java 5.0
 */
public class Axisrea047Service extends AxisBaseService {
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
		logger.debug("Axisrea011aService m_form");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		PAC_IAX_REA pacIaxRea = new PAC_IAX_REA((java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
		try {
			BigDecimal pPPOLIZA = getCampoNumerico(request, "NPOLIZA");
			BigDecimal pPSSEGURO = getCampoNumerico(request, "SSEGURO");
			BigDecimal pPSPROCES = getCampoNumerico(request, "SPROCES");

			try {

				Map mc_porcentaje = pacIaxRea.ejecutaPAC_IAX_REA__F_GET_REASEGURO_X_GARANTIA("C", pPPOLIZA, pPSSEGURO,
						pPSPROCES, null);
				ArrayList<Map> lm_porcentaje = (ArrayList) tratarRETURNyMENSAJES(request, mc_porcentaje);
				Map<Integer, String> map_porcentaje = new HashMap<Integer, String>();
				Map<String, Map<Integer, String>> mapDetalle = new HashMap<String, Map<Integer, String>>();
				Map<Integer, String> map_det_val = new HashMap<Integer, String>();

				if (lm_porcentaje != null)
					for (Map m : lm_porcentaje) {
						map_porcentaje.put(Integer.valueOf(m.get("TRAMO").toString()), m.get("PORCESI").toString());

						if (mapDetalle.get(m.get("GARANT").toString()) != null) {
							map_det_val = mapDetalle.get(m.get("GARANT").toString());
							map_det_val.put(Integer.valueOf(m.get("TRAMO").toString()), m.get("VALASEG").toString());
							mapDetalle.put(m.get("GARANT").toString(), map_det_val);
						} else {
							map_det_val = new HashMap<Integer, String>();
							map_det_val.put(Integer.valueOf(m.get("TRAMO").toString()), m.get("VALASEG").toString());
							mapDetalle.put(m.get("GARANT").toString(), map_det_val);
						}

					}

				Map mapa = pacIaxRea.ejecutaPAC_IAX_REA__F_GET_REASEGURO_X_GARANTIA("X", pPPOLIZA, pPSSEGURO, null,
						null);
				logger.debug(mapa);

				request.setAttribute("MAP_PORCENTAJE", map_porcentaje);

				request.setAttribute("MAP_DETALLE_L1", mapDetalle);
			} catch (Exception e) {
				e.printStackTrace();
			}

			try {

				Map mc_porcentaje = pacIaxRea.ejecutaPAC_IAX_REA__F_GET_REASEGURO_X_GARANTIA("D", pPPOLIZA, pPSSEGURO,
						pPSPROCES, null);
				ArrayList<Map> lm_porcentaje = (ArrayList) tratarRETURNyMENSAJES(request, mc_porcentaje);
				Map<Integer, String> map_porcentaje = new HashMap<Integer, String>();
				Map<String, Map<Integer, String>> mapDetalle = new HashMap<String, Map<Integer, String>>();
				Map<Integer, String> map_det_val = new HashMap<Integer, String>();

				for (Map m : lm_porcentaje) {
					map_porcentaje.put(Integer.valueOf(m.get("TRAMO").toString()), m.get("PORCESI").toString());

					if (mapDetalle.get(m.get("GARANT").toString()) != null) {
						map_det_val = mapDetalle.get(m.get("GARANT").toString());
						map_det_val.put(Integer.valueOf(m.get("TRAMO").toString()), m.get("IMPCES").toString());
						mapDetalle.put(m.get("GARANT").toString(), map_det_val);
					} else {
						map_det_val = new HashMap<Integer, String>();
						map_det_val.put(Integer.valueOf(m.get("TRAMO").toString()), m.get("IMPCES").toString());
						mapDetalle.put(m.get("GARANT").toString(), map_det_val);
					}

				}

				request.setAttribute("MAP_PORCENTAJEL2", map_porcentaje);

				request.setAttribute("MAP_DETALLE_L2", mapDetalle);
			} catch (Exception e) {
				e.printStackTrace();
			}

			Map mapaRea = pacIaxRea.ejecutaPAC_IAX_REA__F_GET_REASEGURO_X_GARANTIA("E", pPPOLIZA, pPSSEGURO, pPSPROCES,
					null);
			Map mapaReaDet = pacIaxRea.ejecutaPAC_IAX_REA__F_GET_REASEGURO_X_GARANTIA("F", pPPOLIZA, pPSSEGURO,
					pPSPROCES, null);

			Map mapaCesFac = pacIaxRea.ejecutaPAC_IAX_REA__F_GET_REASEGURO_X_GARANTIA("G", pPPOLIZA, pPSSEGURO,
					pPSPROCES, null); // IAXIS-14737 19/01/2021
			ArrayList<Map> mrea = (ArrayList) tratarRETURNyMENSAJES(request, mapaRea);
			ArrayList<Map> lreadet = (ArrayList) tratarRETURNyMENSAJES(request, mapaReaDet);
			ArrayList<Map> lmapcesfac = (ArrayList) tratarRETURNyMENSAJES(request, mapaCesFac); // IAXIS-14737
																								// 19/01/2021
			if (lmapcesfac != null)
				for (Map m : lmapcesfac) {
					if (m.get("NCESFAC") != null)
						request.setAttribute("NCESFAC", m.get("NCESFAC"));
				}

			request.setAttribute("MREA", mrea);
			request.setAttribute("LREADET", lreadet);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisrea011aService - m�todo m_form", e);
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

}
