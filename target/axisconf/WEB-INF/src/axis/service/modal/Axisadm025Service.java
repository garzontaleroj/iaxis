package axis.service.modal;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_CODA;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

/**
 * Axisadm025Service.java 19/02/2009
 * 
 * @since Java 5.0
 */
@SuppressWarnings("all")
public class Axisadm025Service extends AxisBaseService {
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
		logger.debug("Axisadm025Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {

			BigDecimal SPROCES = getCampoNumerico(request, "SPROCES");
			BigDecimal NNUMLIN = getCampoNumerico(request, "NNUMLIN");
			String CBANCAR1 = getCampoTextual(request, "CBANCAR1");
			BigDecimal NNUMORD = getCampoNumerico(request, "NNUMORD");
			BigDecimal RETURN_030 = getCampoNumerico(request, "RETURN_030");
			formdata.put("RETURN_030", RETURN_030);
			Map map = new PAC_IAX_CODA((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_CODA__F_GET_LINE_CODA(SPROCES, NNUMLIN, CBANCAR1, NNUMORD);
			logger.debug(map);

			if (BigDecimal.ZERO.equals(tratarRETURNyMENSAJES(request, map))) {
				Map DATOSCABECERA = new HashMap();
				DATOSCABECERA.putAll(map);
				request.setAttribute("DATOSCABECERA", DATOSCABECERA);
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm025Service - m�todo m_form", e);
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

	/**
	 * @param request
	 */
	public void m_buscar(HttpServletRequest request) {
		logger.debug("Axisadm025Service m_buscar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {

			String TNOMBRE = getCampoTextual(request, "TNOMBRE");
			String TDESCRIP = getCampoTextual(request, "TDESCRIP");
			BigDecimal NUMVIA = getCampoNumerico(request, "NNUMVIA");
			String CPOSTAL = getCampoTextual(request, "CPOSTAL");
			BigDecimal NPOLIZA = getCampoNumerico(request, "NPOLIZA");
			BigDecimal NRECIBO = getCampoNumerico(request, "NRECIBO");

			Map map = new PAC_IAX_CODA((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_CODA__F_BUSCA_TOMADORES(TNOMBRE, TDESCRIP, NUMVIA, CPOSTAL, NPOLIZA, NRECIBO);
			logger.debug(map);

			if (BigDecimal.ZERO.equals(tratarRETURNyMENSAJES(request, map)))
				request.setAttribute("LST_TOMADORES", map.get("P_REFCURSOR"));

		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm025Service - m�todo m_buscar", e);
			AbstractDispatchAction.guardarMensaje(request,
					"verbatim:<b>" + e.getClass().getName() + ":</b> " + e.getLocalizedMessage(),
					new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

}
