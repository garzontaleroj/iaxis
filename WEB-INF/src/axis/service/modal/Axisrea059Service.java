package axis.service.modal;

import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_REA;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

/**
 * Axisrea059Service.java 22/04/2019
 * 
 * @author <a href="darodriguez.ext@confianza.com.co">Daniel Rodr�guez</a>
 */
public class Axisrea059Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());
	SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");

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
		logger.debug("Axisrea059Service m_form");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		try {

			BigDecimal PANIO = getCampoNumerico(request, "NANIO");
			BigDecimal PTRIM = getCampoNumerico(request, "NTRIM");

			PAC_IAX_REA pac_axis_rea = new PAC_IAX_REA((java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map mapa = pac_axis_rea.ejecutaPAC_IAX_REA__F_GET_HIST_PAT_TEC(PANIO, PTRIM);
			logger.debug(mapa);

			List lista = (List) tratarRETURNyMENSAJES(request, mapa);

			request.setAttribute("listatHist", lista);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisrea059Service - m�todo m_busqueda", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}
}
