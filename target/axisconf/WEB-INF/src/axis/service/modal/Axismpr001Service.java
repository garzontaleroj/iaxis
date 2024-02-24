package axis.service.modal;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.mvc.control.modal.Axismpr001Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

public class Axismpr001Service extends AxisBaseService {
	static Log logger = LogFactory.getLog(Axismpr001Service.class);

	public void m_form(HttpServletRequest request, Axismpr001Action thisAction) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {
			request.setAttribute("axismprbuscar1",
					this.tratarRETURNyMENSAJES(request,
							new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
									.ejecutaPAC_IAX_LISTVALORES__F_GET_PRODUCTOS(null, null, null)));
		} catch (Exception e) {
			logger.error("Error en el servicio Axismpr001Service - m�todo m_init", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

}