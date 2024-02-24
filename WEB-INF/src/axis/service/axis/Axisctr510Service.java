package axis.service.axis;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.cache.AxisCodeWizard;
import axis.jdbc.PAC_IAX_PRODUCCION;
import axis.jdbc.PAC_IAX_SUPLEMENTOS;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.model.UsuarioBean;
import axis.util.Constantes;

public class Axisctr510Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	public void m_form(HttpServletRequest request, AbstractDispatchAction thisAction) {
		logger.debug("Axisctr510Service m_form");

		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		Map datosGestion = new HashMap();

		try {

			UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
			PAC_IAX_PRODUCCION pac_iax_produccion = new PAC_IAX_PRODUCCION(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map map = pac_iax_produccion.ejecutaPAC_IAX_PRODUCCION__F_LEEDATOSGESTION();
			logger.debug("gestion-->" + map);
			datosGestion = (Map) tratarRETURNyMENSAJES(request, map);

			formdata.put("FEFECTO", datosGestion.get("FEFECTO"));

			request.getSession().setAttribute("datosGestion", !isEmpty(datosGestion) ? datosGestion : new HashMap());

		} catch (Exception e) {
			// logger.error("Error en el servicio Axisctr004Service - mtodo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));

		}

	}

	/**
	 * Added for back button (IAXIS-4321) PK-16/06/2019 Start
	 */
	public void m_anterior(HttpServletRequest request, AbstractDispatchAction thisAction) {
		logger.debug("Axisctr024Service m_anterior");
		try {
			if (!Boolean.valueOf(true).equals(request.getAttribute("multiPantalla")))
				request.setAttribute(Constantes.FORWARDACTION,
						AxisCodeWizard.findForward(request, Constantes.ANTERIOR, whoami(this), null));
		} catch (Exception e) {
			AbstractDispatchAction.guardarMensaje(request, "1000050", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
			this.f_Cargar_Propiedades_Pantalla(request, AxisBaseService.whoami(this));
		}
	}

	/** Added for back button (IAXIS-4321) PK-16/06/2019 End */

	public void m_siguiente(HttpServletRequest request, AbstractDispatchAction thisAction) {
		logger.debug("Axisctr510Service m_siguiente");

		try {
			Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

			java.sql.Date FEFETRASVIG = stringToSqlDate(getCampoTextual(request, "FEFETRASVIG"), "dd/MM/yyyy");
			BigDecimal NDIAS = getCampoNumerico(request, "NDIAS");
			BigDecimal NMESES = getCampoNumerico(request, "NMESES");
			BigDecimal NANOS = getCampoNumerico(request, "NANOS");
			PAC_IAX_SUPLEMENTOS pac_iax_suplementos = new PAC_IAX_SUPLEMENTOS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map map = pac_iax_suplementos.ejecutaPAC_IAX_SUPLEMENTOS__F_TRASLADA_VIGENCIA(NDIAS, NMESES, NANOS);
			tratarRETURNyMENSAJES(request, map);

			formdata.put("NDIAS", NDIAS);
			formdata.put("NMESES", NMESES);
			formdata.put("NA�OS", NANOS);

		} catch (Exception e) {
			// logger.error("Error en el servicio Axisctr510Service - mtodo m_siguiente",
			// e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));

		}
	}

}
