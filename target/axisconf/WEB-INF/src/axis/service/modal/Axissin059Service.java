package axis.service.modal;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_SINIESTROS;
import axis.mvc.control.modal.Axissin059Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

public class Axissin059Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	public void m_init(HttpServletRequest request, Axissin059Action thisAction) {
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		try {
		} catch (Exception e) {
			thisAction.guardarMensaje(request, "1000060", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}

	public void m_form(HttpServletRequest request, Axissin059Action thisAction) {
		logger.debug("Axissin059Service m_form");
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		try {
			BigDecimal pCBANCO = this.getCampoNumerico(request, "CBANCO");
			logger.debug("++++CBANCO: " + pCBANCO);
			formdata.put("CBANCO", pCBANCO);

		} catch (Exception e) {
			logger.error("Error en el servicio Axissin059Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000060", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}

	public void m_busqueda_oficinas(HttpServletRequest request, Axissin059Action thisAction) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);

		try {

			BigDecimal pCBANCO = getCampoNumerico(request, "CBANCO");
			BigDecimal pCOFICI = getCampoNumerico(request, "COFICI");
			String pTOFICI = getCampoTextual(request, "TOFICI");

			if (formdata.get("paginar") == null) {
				request.getSession().removeAttribute("Axissin059_listaOficinas");
				PAC_IAX_SINIESTROS PAC_IAX_SINIESTROS = new PAC_IAX_SINIESTROS(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

				Map map = new HashMap();

				map = PAC_IAX_SINIESTROS.ejecutaPAC_IAX_SINIESTROS__F_GET_LSTOFICINAS(pCBANCO, pCOFICI, pTOFICI);

				logger.debug(map);

				request.getSession().setAttribute("axissin059_listaOficinas",
						(ArrayList) tratarRETURNyMENSAJES(request, map, false));
			}
		} catch (Exception e) {
			logger.error("Error", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}

		this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
	}

}
