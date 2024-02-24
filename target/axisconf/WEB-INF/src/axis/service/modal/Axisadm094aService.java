package axis.service.modal;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.control.modal.Axisadm094aAction;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

public class Axisadm094aService extends AxisBaseService {
	Log log = LogFactory.getLog(this.getClass());

	/*********************************************************************************************************************/
	/************************************************
	 * MÉTODOS DE INICIALIZACIÓN
	 *******************************************/
	/*********************************************************************************************************************/

	public void m_init(HttpServletRequest request, Axisadm094aAction thisAction) {
		try {
			request.getSession().removeAttribute("axisper021_listaPersonas");
		} catch (Exception e) {
			log.error("Error", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

	/**
	 * Limpia la antigua lista de personas de sesión, en caso que hubiera, para
	 * poder realizar una búsqueda nueva.
	 * 
	 * @param request    El HttpServletRequest que contiene la petición del cliente
	 *                   web.
	 * @param thisAction Una Action abstracta desde donde se ha invocado el servicio
	 *                   (necesaria para el log).
	 */
	public void m_form(HttpServletRequest request, Axisadm094aAction thisAction) {
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);

		try {

			String donde = getCampoTextual(request, "DONDE");
			if (!isEmpty(donde)) {
				if (donde.equals(new String("AXISCOMI013")))
					AbstractDispatchAction.topPila(request, "CMODO", "ALTA_POLIZA");
			}

			this.cargarcombos(request, thisAction);
			String ORIGEN = getCampoTextual(request, "ORIGEN");
			formdata.put("ORIGEN", ORIGEN);
		} catch (Exception e) {
			log.error("Error", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
	}

	private void cargarcombos(HttpServletRequest request, Axisadm094aAction thisAction) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		Map listValores = new HashMap();
		try {
			PAC_IAX_LISTVALORES pac_axis_listValores = new PAC_IAX_LISTVALORES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			// Tipo de documento
			Map map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTPROCESOERR();
			listValores.put("autorize", (List) tratarRETURNyMENSAJES(request, map));

			formdata.put("listValores", listValores);
		} catch (Exception e) {
			log.error("Error", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}

	}

	public Axisadm094aService() {
		super();
	}

}
