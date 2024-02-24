package axis.service.modal;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_PROF;
import axis.mvc.control.modal.Axisprf103Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

public class Axisprf103Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	public void m_init(HttpServletRequest request, Axisprf103Action thisAction) {
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		try {
		} catch (Exception e) {
			thisAction.guardarMensaje(request, "1000060", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}

	public void m_form(HttpServletRequest request, Axisprf103Action thisAction) {
		logger.debug("Axisprf103Service m_form");
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);

		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		PAC_IAX_PROF pac_axis_prof = new PAC_IAX_PROF((java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

		try {
			BigDecimal STARIFA = new BigDecimal(request.getParameter("STARIFA"));
			logger.debug("++++STARIFA: " + STARIFA);
			formdata.put("STARIFA", STARIFA);

			String MODO = this.getCampoTextual(request, "MODO");

			if (MODO != null && MODO.equals("modificar")) {
				Map map = pac_axis_prof.ejecutaPAC_IAX_PROF__F_GET_TARIFA(STARIFA);
				logger.debug("++++TARIFA: " + map);
				formdata.put("OBIAXTARI", map.get("TARIFA"));
			}

			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		} catch (Exception e) {
			logger.error("Error en el servicio Axisprf103Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000060", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {

		}
	}

	public void m_traspaso_tarifa(HttpServletRequest request, Axisprf103Action thisAction) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);

		try {
			// Recuperar tarifa a buscar
			BigDecimal STARIFA = getCampoNumerico(request, "pSTARIFA");

			formdata.put("STARIFA_OUT", STARIFA);
		} catch (Exception e) {
			logger.error("Error", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
	}

	public void m_guardar(HttpServletRequest request, Axisprf103Action thisAction) {
		logger.debug("Axisprf103Service m_guardar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {
			PAC_IAX_PROF pac_axis_prof = new PAC_IAX_PROF(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			request.setAttribute("OK", "!OK");

			BigDecimal STARIFA = new BigDecimal(request.getParameter("STARIFA"));
			logger.debug("++++STARIFA-->" + STARIFA);

			String TDESCRI = getCampoTextual(request, "TDESCRI");
			logger.debug("++++TDESCRI-->" + TDESCRI);

			Map map = pac_axis_prof.ejecutaPAC_IAX_PROF__F_SET_TARIFA(STARIFA, TDESCRI);

			logger.debug(map);
			formdata.put("STARIFA_OUT", STARIFA);
			formdata.put("TTARIFA", TDESCRI);

			if (((BigDecimal) tratarRETURNyMENSAJES(request, map)).intValue() == 0) {
				request.setAttribute("OK", "OK"); // guardamos, etc y no ha habido error
			}
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		} catch (Exception e) {
			logger.error("Error en el servicio Axisprf103Service - m�todo m_guardar", e);
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
			thisAction.guardarMensaje(request, "1000052", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}
}
