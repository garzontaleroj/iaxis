package axis.service.modal;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_EVENTOS_SIN;
import axis.mvc.control.modal.Axissin036Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

//import axis.jdbc.PAC_IAX_LISTVALORES;

/**
 * Axissin036Service.java
 * 
 * @author <a href="mailto:amartinez@csi-ti.com">Alex Martinez</a>
 */
public class Axissin036Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE INICIALIZACION
	 *******************************************/
	/*********************************************************************************************************************/

	public void m_init(HttpServletRequest request, Axissin036Action thisAction) {
		logger.debug("Axissin036Service m_init");
		try {

		} catch (Exception e) {
			logger.error("Error en el servicio Axissin036Service - m�todo m_init", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

	public void m_form(HttpServletRequest request, Axissin036Action thisAction) {
		logger.debug("Axissin036Service m_form");
		try {

			UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
			Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

			String PCEVENTO = getCampoTextual(request, "CEVENTO");

			Map map = new PAC_IAX_EVENTOS_SIN((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_EVENTOS_SIN__F_GET_EVENTO(PCEVENTO);
			logger.debug(map);

			request.setAttribute("LISTAIDIOMAS", (List) map.get("PDESEVENTOS"));
			formdata.put("FECHAINI", map.get("PFINIEVE"));
			formdata.put("FECHAFIN", map.get("PFFINEVE"));

			tratarRETURNyMENSAJES(request, map);

		} catch (Exception e) {
			logger.error("Error en el servicio Axissin036Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

	public void m_grabar_cabecera(HttpServletRequest request, Axissin036Action thisAction) {
		logger.debug("Axissin036Service m_grabar_cabecera");
		try {

			UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
			Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

			String CODEVENTO = getCampoTextual(request, "CODEVENTO");
			String CEVENTO = getCampoTextual(request, "CEVENTO");

			String CODIEVENTO = isEmpty(CEVENTO) ? CODEVENTO : CEVENTO;

			java.sql.Date FECHAINI = null;
			FECHAINI = AxisBaseService.stringToSqlDate(getCampoTextual(request, "FECHAINI"));

			java.sql.Date FECHAFIN = null;
			FECHAFIN = AxisBaseService.stringToSqlDate(getCampoTextual(request, "FECHAFIN"));

			Map map = new PAC_IAX_EVENTOS_SIN((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_EVENTOS_SIN__F_SET_CODEVENTO(CODIEVENTO, FECHAINI, FECHAFIN);
			logger.debug(map);
			tratarRETURNyMENSAJES(request, map);

		} catch (Exception e) {
			logger.error("Error en el servicio Axissin036Service - m�todo  m_grabar_cabecera", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

	public void m_grabar_detalle(HttpServletRequest request, Axissin036Action thisAction) {
		logger.debug("Axissin036Service m_grabar_detalle");
		try {

			UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
			Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

			String CODEVENTO = getCampoTextual(request, "PCEVENTO");
			BigDecimal CIDIOMA = getCampoNumerico(request, "PCIDIOMA");
			String TTITEVE = getCampoTextual(request, "PTTITEVE");
			String TEVENTO = getCampoTextual(request, "PTEVENTO");
			String CAMPO = getCampoTextual(request, "CAMPO");

			Map map = new PAC_IAX_EVENTOS_SIN((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_EVENTOS_SIN__F_SET_DESEVENTO(CODEVENTO, TTITEVE, TEVENTO, CIDIOMA);
			logger.debug(map);
			tratarRETURNyMENSAJES(request, map);

			formdata.put("CEVENTO", CODEVENTO);
			formdata.put("CAMPO", CAMPO);

		} catch (Exception e) {
			logger.error("Error en el servicio Axissin036Service - m_grabar_detalle", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

}
