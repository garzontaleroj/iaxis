//Revision:# txJqw1BJJRPKcOIoM6n1fQ== #

package axis.service.axis;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_DOCREQUERIDA;
import axis.jdbc.PAC_IAX_PRODUCCION;
import axis.jdbc.PAC_IAX_PSU;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.model.UsuarioBean;
import axis.util.Constantes;

/**
 * NOMBRE: Axisctr209Service.java Referencia:
 * http://mantis.srvcsi.com/view.php?id=27262#c149107
 *
 * REVISIONES: Ver Fecha Autor Descripci�n --------- ---------- ---------------
 * ------------------------------------ 1.0 16/08/2013 RCL Creaci�n clase
 */
public class Axisctr209Service extends AxisBaseService {

	Log logger = LogFactory.getLog(this.getClass());

	/**
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_miajaxjson(HttpServletRequest request, AbstractDispatchAction thisAction) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {
			Map map = null;// ejecutaPAC_IAX_LOQUESEA__F_TAL_Y_CUAL(PPARAMS);
			logger.debug("map:" + map);
			Object RETURN = this.tratarRETURNyMENSAJES(request, map);
			if (RETURN != null && RETURN.equals(BigDecimal.ZERO)) {
				thisAction.guardarMensaje(request, "111313", new Object[] {}, Constantes.MENSAJE_INFO);
			}
			request.setAttribute(Constantes.AJAXCONTAINER, map);
		} catch (Exception e) {
			logger.error("Error.", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		} finally {
			// this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	/**
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_init(HttpServletRequest request, AbstractDispatchAction thisAction) {
		logger.debug("Axisctr209Service m_init");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {
			// TODO:
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr209Service - m�todo m_init", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
	}

	/**
	 * M�todo que contiene las acciones a realizar para todos los puntos de entrada
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_form(HttpServletRequest request, AbstractDispatchAction thisAction) {
		logger.debug("Axisctr209Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {
			Map PRETEN_FILTRO_BUSQUEDA = (Map) request.getSession().getAttribute("PRETEN_FILTRO_BUSQUEDA");
			if (!isEmpty(PRETEN_FILTRO_BUSQUEDA)) {
				BigDecimal NPOLIZA = (BigDecimal) PRETEN_FILTRO_BUSQUEDA.get("NPOLIZA");
				if (!isEmpty(NPOLIZA)) {
					PAC_IAX_PSU pacIaxPsu = new PAC_IAX_PSU(
							(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
					PAC_IAX_PRODUCCION pacIaxProduccion = new PAC_IAX_PRODUCCION(
							(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

					HashMap mapPoliza = pacIaxProduccion.ejecutaPAC_IAX_PRODUCCION__F_CONSULTAPOLIZA(null, null,
							NPOLIZA, null, null, null, null, null, null, null, null, null, null, null, null,
							"AUTORIZA_MASIVO", null, null, null, null, null, null, null, null, null, null, null, null,
							null, null, null, null, null, null, null, null, null);
					logger.debug(mapPoliza);
					List plReturn = (List) tratarRETURNyMENSAJES(request, mapPoliza);

					for (int i = 0; i < plReturn.size(); i++) {
						BigDecimal SSEGURO = (BigDecimal) ((Map) plReturn.get(i)).get("SSEGURO");

						Map col_psu = pacIaxPsu.ejecutaPAC_IAX_PSU__F_GET_COLEC_PSU(SSEGURO, null, null, "POL");

						logger.debug("col_psu:" + col_psu);
						BigDecimal cestpol = new BigDecimal(0);
						formdata.put("CESTPOL_PSU", col_psu.get("P_CESTPOL"));

						if (!isEmpty(col_psu.get("P_CESTPOL"))) {
							cestpol = new BigDecimal(String.valueOf(col_psu.get("P_CESTPOL")));
						}
						formdata.put("permiteModificar", new BigDecimal(0));
						/*
						 * if (cestpol.intValue() != 3) {
						 */
						if (!isEmpty(col_psu.get("P_CNIVELBPM"))) {
							BigDecimal CNIVELBPM = new BigDecimal(String.valueOf(col_psu.get("P_CNIVELBPM")));

							Map mm = pacIaxPsu.ejecutaPAC_IAX_PSU__F_NIVEL_USUARIO(SSEGURO, "POL");
							logger.debug(mm);
							BigDecimal CNIVEL_USU = new BigDecimal(0);

							if (!isEmpty(mm.get("P_NIVEL")))
								CNIVEL_USU = new BigDecimal(String.valueOf(mm.get("P_NIVEL")));

							if (CNIVEL_USU.intValue() < CNIVELBPM.intValue()) {
								formdata.put("permiteModificar", new BigDecimal(0));
								break;
							} else
								formdata.put("permiteModificar", new BigDecimal(1));
						}
						// }
					}
				}
			}
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr209Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
	}

	/**
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_aceptar(HttpServletRequest request, AbstractDispatchAction thisAction) {
		logger.debug("Axisctr209Service m_aceptar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {
			// TODO:
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr209Service - m�todo m_aceptar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		// ver m_form: this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
	}

	/**
	 * M�todo que comprueba si los seguros de la poliza tienen validaci�n requerida
	 * y pendiente de adjuntar.
	 * 
	 * @param request
	 */
	public void m_ajax_valdocrequerida(HttpServletRequest request) {
		logger.debug("Axisctr209Service m_ajax_valdocrequerida");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();

		try {
			String ccontrols = getCampoTextual(request, "CCONTROLS");
			String[] ccontrolsSplitted = ccontrols.split(";");

			List<String> ccontrolsSelected = new ArrayList<String>();
			Collections.addAll(ccontrolsSelected, ccontrolsSplitted);

			////////////////// DATOS POLIZA //////////////
			PAC_IAX_PRODUCCION pacIaxProduccion = new PAC_IAX_PRODUCCION(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			PAC_IAX_DOCREQUERIDA pacIaxrequerida = new PAC_IAX_DOCREQUERIDA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			PAC_IAX_PSU pacIaxPsu = new PAC_IAX_PSU((java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			BigDecimal NPOLIZA = getCampoNumerico(request, "NPOLIZA");
			HashMap mapPoliza = pacIaxProduccion.ejecutaPAC_IAX_PRODUCCION__F_CONSULTAPOLIZA(null, null, NPOLIZA, null,
					null, null, null, null, null, null, null, null, null, null, null, "AUTORIZA_MASIVO", null, null,
					null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null,
					null, null, null);
			logger.debug(mapPoliza);
			List plReturn = (List) tratarRETURNyMENSAJES(request, mapPoliza);

			for (int i = 0; i < plReturn.size(); i++) {
				BigDecimal pSSEGURO = (BigDecimal) ((Map) plReturn.get(i)).get("SSEGURO");

				HashMap datPoliza = pacIaxProduccion.ejecutaPAC_IAX_PRODUCCION__F_GET_DATPOLIZA(pSSEGURO);
				logger.debug("DATOS POLIZA: " + datPoliza);
				tratarRETURNyMENSAJES(request, datPoliza);
				Map datos_poliza = (Map) datPoliza.get("RETURN");

				// Borrem per si de cas el sseguro_out
				AbstractDispatchAction.topPila(request, "SSEGURO_OUT", null);
				BigDecimal pNMOVIMI = (datos_poliza.get("NMOVIMI") != null) ? (BigDecimal) datos_poliza.get("NMOVIMI")
						: new BigDecimal(1);
				BigDecimal pSPRODUC = (datos_poliza.get("SPRODUC") != null) ? (BigDecimal) datos_poliza.get("SPRODUC")
						: null;
				BigDecimal pCACTIVI = (datos_poliza.get("CACTIVI") != null) ? (BigDecimal) datos_poliza.get("CACTIVI")
						: null;

				Map col_psu = pacIaxPsu.ejecutaPAC_IAX_PSU__F_GET_COLEC_PSU(pSSEGURO, null, null, "POL");

				logger.debug("col_psu:" + col_psu);
				if (((BigDecimal) this.tratarRETURNyMENSAJES(request, col_psu)).intValue() == 0) {
					List colsPSU = (ArrayList) col_psu.get("P_TPSUS");
					if (colsPSU != null) {
						for (int j = 0; j < colsPSU.size(); j++) {
							BigDecimal cControl = (BigDecimal) ((Map) ((Map) colsPSU.get(j)).get("OB_IAX_PSU"))
									.get("CCONTROL");
							if (ccontrolsSelected.contains(cControl.toString())) {
								Map map = pacIaxrequerida.ejecutaPAC_IAX_DOCREQUERIDA__F_DOCREQ_PENDIENTE(pSSEGURO,
										pNMOVIMI, pSPRODUC, pCACTIVI);

								logger.debug("ejecutaPAC_IAX_DOCREQUERIDA__F_DOCREQ_PENDIENTE: " + map);

								ajax.rellenarPlAContenedorAjax(map);
								ajax.guardarContenidoFinalAContenedorAjax(map);

								Object RETURN = this.tratarRETURNyMENSAJES(request, map);
								if (RETURN != null && RETURN.equals(BigDecimal.ONE)) {
									ajax.guardarErrorAContenedorAjax(pSSEGURO.toString());
								}

								break;
							}
						}
					}
				}
			}
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr209Service - m�todo m_ajax_valdocrequerida", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	/**
	 * M�todo que elimina de la session los atributos que empiezan por PRETEN_
	 * 
	 * @param request
	 */
	public void borrarAtributosSession(HttpServletRequest request) {
		logger.debug("Axisctr209Service borrarAtributosSession");

		/* Quitar datos de otras b�squedas que hayan quedado en Session */
		Enumeration<String> attributeNames = request.getSession().getAttributeNames();

		while (attributeNames.hasMoreElements()) {
			String attribute = attributeNames.nextElement();
			if (attribute.startsWith("PRETEN_"))
				request.getSession().removeAttribute(attribute);
		}
		this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
	}

}
