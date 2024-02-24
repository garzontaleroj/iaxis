package axis.service.modal;

import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_SINIESTROS;
import axis.mvc.control.modal.Axissin046Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

public class Axissin046Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());
	SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");

	/**
	 * M�todo que se llama al inicio de este flujo. Realiza la carga inicial de los
	 * datos de los combos.
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_form(HttpServletRequest request, Axissin046Action thisAction) {
		logger.debug("Axissin046Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {
			BigDecimal SSEGURO = getCampoNumerico(request, "SSEGURO");
			BigDecimal NSINIES = getCampoNumerico(request, "NSINIES");
			BigDecimal NRIESGO = getCampoNumerico(request, "NRIESGO");
			BigDecimal CCAUSIN = getCampoNumerico(request, "CCAUSIN");
			BigDecimal CMOTSIN = getCampoNumerico(request, "CMOTSIN");
			java.sql.Date FSINIES = this.stringToSqlDate(getCampoTextual(request, "FSINIES"));
			BigDecimal ctipres = getCampoNumerico(request, "CESTTRA");
			BigDecimal pctipgas = getCampoNumerico(request, "CTIPGAS");
			String pnsinies = isEmpty(getCampoTextual(request, "NSINIES")) ? String.valueOf(NSINIES)
					: getCampoTextual(request, "NSINIES");
			BigDecimal pntramit = getCampoNumerico(request, "NTRAMIT");
			BigDecimal pctipres = getCampoNumerico(request, "CTIPRES");
			BigDecimal pnmovres = getCampoNumerico(request, "NMOVRES");
			BigDecimal pcgarant = isEmpty(getCampoNumerico(request, "CGARANT")) ? getCampoNumerico(request, "VGARANTIA")
					: getCampoNumerico(request, "CGARANT");
			PAC_IAX_SINIESTROS pac_axis_siniestros = new PAC_IAX_SINIESTROS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

		} catch (Exception e) {
			logger.error("Error en el servicio Axispro004Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

}
