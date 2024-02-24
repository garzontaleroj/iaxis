package axis.service.modal;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAXPAR_PRODUCTOS;
import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.jdbc.PAC_IAX_MNTPROD;
import axis.mvc.control.modal.Axispro013Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

public class Axispro013Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE INICIALIZACION
	 *******************************************/
	/*********************************************************************************************************************/

	/**
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_form(HttpServletRequest request, Axispro013Action thisAction) {
		logger.debug("Axispro013Service m_form");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		try {
			/* Cargar productos */

			Map map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES__F_GET_PRODUCTOS(null, null, null);
			logger.debug(map);
			List PRODUCTOS = (List) tratarRETURNyMENSAJES(request, map);
			formdata.put("PRODUCTOS", PRODUCTOS);

			if (request.getAttribute("PRODUCTO_CARGADO") == null)
				m_cargarProducto(request, thisAction);

		} catch (Exception e) {
			logger.error("Error en el servicio Axispro013Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE ACTUALIZACION
	 ********************************************/
	/*********************************************************************************************************************/

	/**
	 * 
	 * @param request
	 * @param thisAction
	 * @throws Exception
	 */
	public void m_cargarProducto(HttpServletRequest request, Axispro013Action thisAction) {
		logger.debug("Axispro013Service m_cargarProducto");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {
			BigDecimal SPRODUC = getCampoNumerico(request, "SPRODUC");
			if (!isEmpty(SPRODUC)) {
				formdata.put("SPRODUC", SPRODUC);
				Map map = new PAC_IAXPAR_PRODUCTOS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAXPAR_PRODUCTOS__F_GET_IDENTPROD(SPRODUC);
				logger.debug(map);
				if (!isEmpty(map) && new BigDecimal(0).equals(tratarRETURNyMENSAJES(request, map))) {
					formdata.put("PCRAMO", map.get("PCRAMO"));
					formdata.put("PCMODALI", map.get("PCMODALI"));
					formdata.put("PCTIPSEG", map.get("PCTIPSEG"));
					formdata.put("PCCOLECT", map.get("PCCOLECT"));
				}
				request.setAttribute("PRODUCTO_CARGADO", Boolean.valueOf(true));
			}
		} catch (Exception e) {
			logger.error("Error en el servicio Axispro013Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

	/**
	 * @param request
	 * @param thisAction
	 */
	public void m_duplicar(HttpServletRequest request, Axispro013Action thisAction) {
		logger.debug("Axispro013Service m_duplicar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		try {
			BigDecimal PRAMORIG = getCampoNumerico(request, "PCRAMO");
			BigDecimal PMODALIORIG = getCampoNumerico(request, "PCMODALI");
			BigDecimal PTISEGORIG = getCampoNumerico(request, "PCTIPSEG");
			BigDecimal PCOLECTORIG = getCampoNumerico(request, "PCCOLECT");
			BigDecimal PRAMDEST = getCampoNumerico(request, "PRAMDEST");
			BigDecimal PMODALIDEST = getCampoNumerico(request, "PMODALIDEST");
			BigDecimal PTIPSEGDEST = getCampoNumerico(request, "PTIPSEGDEST");
			BigDecimal PCOLECTDEST = getCampoNumerico(request, "PCOLECTDEST");
			BigDecimal PSALIDA = getCampoNumerico(request, "PSALIDA");

			Map map = new PAC_IAX_MNTPROD((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_MNTPROD__F_DUPLICARPROD(PRAMORIG, PMODALIORIG, PTISEGORIG, PCOLECTORIG, PRAMDEST,
							PMODALIDEST, PTIPSEGDEST, PCOLECTDEST, PSALIDA);

			logger.debug(map);
			tratarRETURNyMENSAJES(request, map);

		} catch (Exception e) {
			logger.error("Error en el servicio Axispro013Service - m�todo m_duplicar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

}
