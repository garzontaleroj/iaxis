package axis.service.modal;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_SINIESTROS;
import axis.mvc.control.modal.Axissin037Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

//import axis.jdbc.PAC_IAX_LISTVALORES;

/**
 * Axissin037Service.java
 * 
 * @author <a href="mailto:amartinez@csi-ti.com">Alex Martinez</a>
 */
public class Axissin037Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE INICIALIZACION
	 *******************************************/
	/*********************************************************************************************************************/

	public void m_init(HttpServletRequest request, Axissin037Action thisAction) {
		logger.debug("Axissin037Service m_init");
		try {

		} catch (Exception e) {
			logger.error("Error en el servicio Axissin037Service - m�todo m_init", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);

		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}

	public void m_form(HttpServletRequest request, Axissin037Action thisAction) {
		logger.debug("Axissin037Service m_form");
		try {

			UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
			Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

			String nsiniestro = getCampoTextual(request, "NSINIES");
			BigDecimal ntramit = getCampoNumerico(request, "NTRAMIT");
			BigDecimal ctipres = getCampoNumerico(request, "CTIPRES");
			BigDecimal cgarant = getCampoNumerico(request, "CGARANT");
			BigDecimal nmovres = getCampoNumerico(request, "NMOVRES");
			BigDecimal sproduc = getCampoNumerico(request, "SPRODUC");
			BigDecimal cactivi = getCampoNumerico(request, "CACTIVI");
			BigDecimal ctipgas = getCampoNumerico(request, "CTIPGAS");
			String CMONRES = getCampoTextual(request, "CMONRES");

			Map map = null;
			formdata.put("GARANTIA", cgarant);
			map = new PAC_IAX_SINIESTROS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_SINIESTROS__F_GET_HISTRESERVAS(nsiniestro, ntramit, ctipres, ctipgas, cgarant,
							nmovres, sproduc, cactivi, CMONRES);

			logger.debug(map);

			request.setAttribute("LISTARESERVAS", (List) map.get("T_RESERVAS"));
			tratarRETURNyMENSAJES(request, map);
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));

		} catch (Exception e) {
			logger.error("Error en el servicio Axissin037Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}

}
