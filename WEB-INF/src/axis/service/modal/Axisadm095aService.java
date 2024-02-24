package axis.service.modal;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_CTACLIENTE;
import axis.mvc.control.modal.Axisadm095aAction;
import axis.service.axis.AjaxContainerService;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

public class Axisadm095aService extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	public void m_init(HttpServletRequest request, Axisadm095aAction thisAction) {
		logger.debug("Axisadm095aService m_init");
		this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
	}

	public void m_form(HttpServletRequest request, Axisadm095aAction thisAction) {
		logger.debug("Axisadm095aService m_form");

		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {

			BigDecimal CEMPRES = this.getCampoNumerico(request, "CEMPRES");
			formdata.put("CEMPRES", CEMPRES);

			BigDecimal SPERSON = this.getCampoNumerico(request, "SPERSON");
			formdata.put("SPERSON", SPERSON);

			BigDecimal SSEGURO = this.getCampoNumerico(request, "SSEGURO");
			formdata.put("SSEGURO", SSEGURO);

			BigDecimal NNUMLIN = this.getCampoNumerico(request, "NNUMLIN");
			formdata.put("NNUMLIN", NNUMLIN);

			BigDecimal SPRODUC = this.getCampoNumerico(request, "SPRODUC");
			formdata.put("SPRODUC", SPRODUC);

			BigDecimal NPOLIZA = this.getCampoNumerico(request, "NPOLIZA");
			formdata.put("NPOLIZA", NPOLIZA);

			BigDecimal NREEMBO = this.getCampoNumerico(request, "NREEMBO");
			formdata.put("NREEMBO", NREEMBO);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm095aService - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000060", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}

	public void m_ajax_guardar(HttpServletRequest request, Axisadm095aAction thisAction) {
		logger.debug("Axisadm095aService m_ajax_guardar");

		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		AjaxContainerService ajax = new AjaxContainerService(request);
		Map map = new HashMap();
		try {

			BigDecimal CEMPRES = this.getCampoNumerico(request, "CEMPRES");
			formdata.put("CEMPRES", CEMPRES);

			BigDecimal SPERSON = this.getCampoNumerico(request, "SPERSON");
			formdata.put("SPERSON", SPERSON);

			BigDecimal SSEGURO = this.getCampoNumerico(request, "SSEGURO");
			formdata.put("SSEGURO", SSEGURO);

			BigDecimal NNUMLIN = this.getCampoNumerico(request, "NNUMLIN");
			formdata.put("NNUMLIN", NNUMLIN);

			BigDecimal SPRODUC = this.getCampoNumerico(request, "SPRODUC");
			formdata.put("SPRODUC", SPRODUC);

			BigDecimal NREEMBO = this.getCampoNumerico(request, "NREEMBO");
			formdata.put("NREEMBO", NREEMBO);

			PAC_IAX_CTACLIENTE pac_axis_ctacliente = new PAC_IAX_CTACLIENTE(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			map = pac_axis_ctacliente.ejecutaPAC_IAX_CTACLIENTE__F_UPD_NRE(CEMPRES, SPERSON, SSEGURO, NNUMLIN, NREEMBO);

			if (((BigDecimal) tratarRETURNyMENSAJES(request, map)).intValue() == 0) {
				formdata.put("GUARDADO", "0");
			} else {
				formdata.put("GUARDADO", "1");
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm095aService - m�todo m_ajax_guardar", e);
			formdata.put("GUARDADO", "1");
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			ajax.guardarContenidoFinalAContenedorAjax(formdata);
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());

		}
	}
}
