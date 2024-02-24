package axis.service.axis;

import java.math.BigDecimal;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_GESTION_REC;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.model.UsuarioBean;
import axis.util.Constantes;

/**
 * Axisctr054Service.java 15/01/2009
 * 
 * @since Java 5.0
 */
public class Axisctr054Service extends AxisBaseService {
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
		logger.debug("Axisctr054Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr054Service - m�todo m_form", e);
			AbstractDispatchAction.guardarMensaje(request,
					"verbatim:<b>" + e.getClass().getName() + ":</b> " + e.getLocalizedMessage(),
					new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE ACTUALIZACI�N
	 ********************************************/
	/*********************************************************************************************************************/

	/**
	 * 
	 * @param request
	 */
	@SuppressWarnings("all")
	public void m_imprimir(HttpServletRequest request) {
		logger.debug("Axisctr054Service m_imprimir");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {

			BigDecimal CAGENTE = getCampoNumerico(request, "CAGENTE");
			java.sql.Date DATAINI = stringToSqlDate(getCampoTextual(request, "DATAINI"));
			java.sql.Date DATAFIN = stringToSqlDate(getCampoTextual(request, "DATAFIN"));
			BigDecimal CIDIOMA = usuario.getCidioma();

			PAC_IAX_GESTION_REC pacIaxGestionRec = new PAC_IAX_GESTION_REC(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map map = pacIaxGestionRec.ejecutaPAC_IAX_GESTION_REC__F_IMPRESION_REGISTRO_MAN(CAGENTE, DATAINI, DATAFIN,
					CIDIOMA);
			logger.debug(map);

			if (BigDecimal.ZERO.equals(tratarRETURNyMENSAJES(request, map))) {
				request.getSession().setAttribute("FICHERO1", map.get("PFICHERO1"));
				request.getSession().setAttribute("FICHERO2", map.get("PFICHERO2"));
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr054Service - m�todo m_imprimir", e);
			AbstractDispatchAction.guardarMensaje(request,
					"verbatim:<b>" + e.getClass().getName() + ":</b> " + e.getLocalizedMessage(),
					new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

}
