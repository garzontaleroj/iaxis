package axis.service.modal;

import java.math.BigDecimal;
import java.sql.Connection;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_IMPRESION;
import axis.mvc.control.modal.Axisctr186Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

/**
 * Axisctr186Service.java
 * 
 * @since Java 5.0
 */
public class Axisctr186Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE INICIALIZACION
	 *******************************************/
	/*********************************************************************************************************************/

	/**
	 * M�todo que se llama al inicio de este flujo. Puede servirnos para inicializar
	 * variables.
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_init(HttpServletRequest request, Axisctr186Action thisAction) {
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		try {

			logger.debug("formdata **********************************************" + formdata);

		} catch (Exception e) {
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}

	}

	/**
	 * 
	 * @param request
	 */
	@SuppressWarnings("all")
	public void m_form(HttpServletRequest request, Axisctr186Action thisAction) {
		logger.debug("Axisctr186Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {

			logger.debug("formdata **********************************************" + formdata);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr186Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {

			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));

		}
	}

	public void m_aceptar(HttpServletRequest request, Axisctr186Action thisAction) {
		logger.debug("Axisctr186Service m_aceptar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {

			BigDecimal resultado = new BigDecimal(1);

			PAC_IAX_IMPRESION pac_iax_impresion = new PAC_IAX_IMPRESION(
					(Connection) request.getAttribute(Constantes.DB01CONN));

			String IDDOC = getCampoTextual(request, "IDDOC");
			String TFICHERO = getHiddenCampoTextual(request, "TFICHERO");
			String CONFIRMA = getCampoTextual(request, "TCONFIRMA");
			String FIRMAB64 = getCampoTextual(request, "textRst");
			String CCODPLAN = getCampoTextual(request, "CCODPLAN");
			HashMap map = pac_iax_impresion.ejecutaPAC_IAX_IMPRESION__F_FIRMAR_DOC(IDDOC, TFICHERO, FIRMAB64, CONFIRMA,
					CCODPLAN);

			logger.debug(map);

			resultado = (BigDecimal) tratarRETURNyMENSAJES(request, map, false);

			if (resultado.intValue() == 0) {
				request.setAttribute("RESOK", new BigDecimal(0));
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr186Service - m�todo m_aceptar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			// m_cargarValors(request, thisAction);
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}
}
