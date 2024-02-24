package axis.service.modal;

import java.math.BigDecimal;
import java.sql.Date;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_PORCEN_PMD;
import axis.mvc.control.modal.Axisrea044Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

public class Axisrea044Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());
	private final static String MODIFICAR = "MODIFICAR";
	private final static String ALTA = "ALTA";

	/**
	 * Carga formulario
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_form(HttpServletRequest request, Axisrea044Action thisAction) {
		logger.debug("Axisrea044ervice m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		PAC_IAX_PORCEN_PMD pac_iax_forcen_pmd = new PAC_IAX_PORCEN_PMD(
				(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
		try {
			String modo = getCampoTextual(request, "MODO");
			BigDecimal id = getCampoNumerico(request, "ID");
			BigDecimal idcabecera = getCampoNumerico(request, "IDCABECERA");

			if (MODIFICAR.equals(modo)) {
				Map map = map = (Map) tratarRETURNyMENSAJES(request,
						pac_iax_forcen_pmd.ejecutaPAC_IAX_PORCEN_PMD__F_GET_PORCEN_TRAMO_CTTO(idcabecera, id));
				formdata.put("IDCABECERA", map.get("IDCABECERA"));
				formdata.put("ID", map.get("ID"));
				formdata.put("PORCEN", map.get("PORCEN"));
				formdata.put("FPAGO", map.get("FPAGO"));
				logger.debug(map);

			}

		} catch (Exception e) {
			logger.error("Error en el servicio axisrea044Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}

	}

	/**
	 * Acepta un porcentanje
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_aceptar(HttpServletRequest request, Axisrea044Action thisAction) {
		logger.debug("Axisrea044ervice m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		PAC_IAX_PORCEN_PMD pac_iax_forcen_pmd = new PAC_IAX_PORCEN_PMD(
				(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
		try {
			BigDecimal id = getCampoNumerico(request, "ID");
			BigDecimal idcabecera = getCampoNumerico(request, "IDCABECERA");
			BigDecimal porcen = getCampoNumerico(request, "PORCEN");
			Date fpago = stringToSqlDate(getCampoTextual(request, "FPAGO"));
			if (porcen != null) {
				tratarRETURNyMENSAJES(request, pac_iax_forcen_pmd
						.ejecutaPAC_IAX_PORCEN_PMD__F_SET_PORCEN_TRAMO_CTTO(idcabecera, id, porcen, fpago));
			}
			formdata.put("PORCEN", null);
			formdata.put("FPAGO", null);
		} catch (Exception e) {
			logger.error("Error en el servicio axisrea044Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}

	}
}
