package axis.service.modal;

import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.mvc.control.modal.Axisctr023Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

public class Axisctr023Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());
	SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");

	public void m_init(HttpServletRequest request, Axisctr023Action thisAction) {
		logger.debug("Axisctr023Service m_init");

		try {
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr023Service - m�todo m_init", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE INICIALIZACION
	 *******************************************/
	/*********************************************************************************************************************/

	public void m_form(HttpServletRequest request, Axisctr023Action thisAction) {
		logger.debug("Axisctr023Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);

		try {

			PAC_IAX_LISTVALORES pacIaxLista = new PAC_IAX_LISTVALORES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			String NRECIBO = getCampoTextual(request, "NRECIBO");
			request.setAttribute("NRECIBO", NRECIBO);

			HashMap m = null;
			// Cargar datos de gestion //
			m = pacIaxLista.ejecutaPAC_IAX_LISTVALORES__F_GET_TIPOCOBRO();
			List axisctr023_tipoCobro = (List) tratarRETURNyMENSAJES(request, m);
			request.setAttribute("axisctr023_tipoCobro", axisctr023_tipoCobro);

			m = pacIaxLista.ejecutaPAC_IAX_LISTVALORES__F_GET_TIPCCC();
			List axisctr023_tipoCuenta = (List) tratarRETURNyMENSAJES(request, m);
			request.setAttribute("axisctr023_tipoCuenta", axisctr023_tipoCuenta);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr023Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

	public void m_cerrar(HttpServletRequest request, Axisctr023Action thisAction) {
		logger.debug("Axisctr023Service m_cerrar");
		try {

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr023Service - m�todo m_cerrar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

}