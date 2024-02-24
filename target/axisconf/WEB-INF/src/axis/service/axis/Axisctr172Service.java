package axis.service.axis;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.jdbc.PAC_IAX_PRODUCCION;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.model.UsuarioBean;
import axis.util.Constantes;

/**
 * Axisctr079Service.java
 * 
 * @author <a href="rkirchner@csi-ti.com">Roger Kirchner</a>
 * @since Java 5.0
 */
public class Axisctr172Service extends AxisBaseService {
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
		logger.debug("Axisctr172Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {
			// Recuperem les dades de la p�lissa
			BigDecimal SSEGURO = getCampoNumerico(request, "SSEGURO");
			// Si no ve informar obrirem la pantalla axisctr019 per buscar la p�lissa
			if (SSEGURO != null) {
				PAC_IAX_PRODUCCION pacIaxProduccion = new PAC_IAX_PRODUCCION(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
				PAC_IAX_LISTVALORES pac_iax_listvalores = new PAC_IAX_LISTVALORES(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
				Map mapPoliza = pacIaxProduccion.ejecutaPAC_IAX_PRODUCCION__F_SET_CONSULTAPOLIZA(SSEGURO);
				logger.debug(mapPoliza);
				tratarRETURNyMENSAJES(request, mapPoliza, false);
				// Recuperem les dades de la polissa
				Map mapDatPoliza = pacIaxProduccion.ejecutaPAC_IAX_PRODUCCION__F_GET_DATPOLIZA(SSEGURO);
				logger.debug(mapDatPoliza);
				Map datosPoliza = (Map) tratarRETURNyMENSAJES(request, mapDatPoliza, false);
				// Dades gesti�
				Map mapGestion = pacIaxProduccion.ejecutaPAC_IAX_PRODUCCION__F_LEEDATOSGESTION();
				logger.debug(mapGestion);
				Map datosGestion = (Map) tratarRETURNyMENSAJES(request, mapGestion, false);
				// Recuperem les comisions
				Map mapComision = new PAC_IAX_LISTVALORES(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTCOMISIONES();
				logger.debug(mapComision);
				List comisiones = (List) tratarRETURNyMENSAJES(request, mapComision);
				// Recuperem dades gesti� comisi�
				Map mapGesCom = new PAC_IAX_PRODUCCION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_PRODUCCION__F_LEEGESTIONCOMISION(null); // BUG 25214 - FAL - 09/01/2013
				logger.debug(mapGesCom);
				List gestionComisiones = (List) tratarRETURNyMENSAJES(request, mapGesCom);
				// Combo
				Map mapComisi = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTCOMISION();
				logger.debug(mapComisi);
				List lscomisi = (List) tratarRETURNyMENSAJES(request, mapComisi);

				// Merge de la segunda lista en la primera
				if (!isEmpty(gestionComisiones)) {
					for (int i = 0; i < gestionComisiones.size(); i++) {
						Map outerMap = (Map) gestionComisiones.get(i);
						Map OB_IAX_GSTCOMISION = (Map) outerMap.get("OB_IAX_GSTCOMISION");
						// A�adir en el objeto de comisiones el objeto gesti�n comisi�n
						if (!isEmpty(comisiones.get(i))) {
							Map COMISION = (Map) comisiones.get(i);
							COMISION.put("CMODCOM", (BigDecimal) OB_IAX_GSTCOMISION.get("CMODCOM"));
							COMISION.put("PCOMISI", (BigDecimal) OB_IAX_GSTCOMISION.get("PCOMISI"));
						}
					}
				}
				formdata.put("SSEGURO", SSEGURO);
				formdata.put("axisctr_datPoliza", !isEmpty(datosPoliza) ? datosPoliza : new HashMap());
				formdata.put("axisctr_datGestion", !isEmpty(mapGestion) ? mapGestion.get("RETURN") : new HashMap());
				formdata.put("axisctr_datComision", !isEmpty(mapComision) ? mapComision : new HashMap());
				formdata.put("axisctr_definicionComisiones", !isEmpty(comisiones) ? comisiones : new ArrayList());
				formdata.put("axisctr172_lscomisi", lscomisi);
			}
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr172Service - m�todo m_form", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
	}

}
