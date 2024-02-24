package axis.service.axis;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_COMMON;
import axis.jdbc.PAC_IAX_CTACLIENTE;
import axis.mvc.control.axis.Axisadm095Action;
import axis.mvc.model.UsuarioBean;
import axis.util.Constantes;

public class Axisadm095Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	public void m_init(HttpServletRequest request, Axisadm095Action thisAction) {

		logger.debug("Axisadm095Service m_init");
		try {
			request.getSession().removeAttribute("axisadm095_listaRecidi");

		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm095Service - m�todo m_init", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}

	}

	public void m_form(HttpServletRequest request, Axisadm095Action thisAction) {

		logger.debug("Axisadm095Service m_init");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		this.f_Cargar_Propiedades_Pantalla(request, whoami(this));

	}

	public void m_recargar(HttpServletRequest request, Axisadm095Action thisAction) {

		logger.debug("Axisadm095Service m_recargar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {
			BigDecimal SSEGURO = this.getCampoNumerico(request, "SSEGURO");
			if (!isEmpty(SSEGURO)) {
				PAC_IAX_COMMON pac_axis_common = new PAC_IAX_COMMON(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
				Map m = pac_axis_common.ejecutaPAC_IAX_COMMON__F_GET_NPOLIZA(SSEGURO, "POL");
				if (!isEmpty(m.get("ONPOLIZA")))
					formdata.put("CPOLICY", m.get("ONPOLIZA"));

			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm095Service - m�todo m_recargar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {

			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}

	}

	public void m_busqueda(HttpServletRequest request, Axisadm095Action thisAction) {

		logger.debug("Axisadm095Service m_busqueda");
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {
			BigDecimal SSEGURO = getCampoNumerico(request, "CPOLICY");
			if (formdata.get("paginar") == null) {

				request.getSession().removeAttribute("axisadm095_listaRecidi");
				Map map = new HashMap();
				PAC_IAX_CTACLIENTE pac_axis_ctacliente = new PAC_IAX_CTACLIENTE(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
				map = pac_axis_ctacliente.ejecutaPAC_IAX_CTACLIENTE__F_LEE_ULT_RE(SSEGURO);
				ArrayList list = new ArrayList();
				list.add(map);
				request.getSession().setAttribute("axisadm095_listaRecidi",
						(ArrayList) tratarRETURNyMENSAJES(request, map, false));
			}

		} catch (Exception e) {
			logger.error("Error", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}

	}

}
