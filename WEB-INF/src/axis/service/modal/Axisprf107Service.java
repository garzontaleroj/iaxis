package axis.service.modal;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.jdbc.PAC_IAX_PROF;
import axis.mvc.control.modal.Axisprf107Action;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

public class Axisprf107Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	public void m_init(HttpServletRequest request, Axisprf107Action thisAction) {
		try {
		} catch (Exception e) {
			thisAction.guardarMensaje(request, "1000060", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}

	public void m_form(HttpServletRequest request, Axisprf107Action thisAction) {
		logger.debug("Axisprf107Service m_form");
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {
			PAC_IAX_LISTVALORES pac_iax_listvalores = new PAC_IAX_LISTVALORES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			Map map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(737));
			logger.debug(map);
			List VALORES = (List) tratarRETURNyMENSAJES(request, map, false);
			formdata.put("VALORES", VALORES);

			map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(738));
			logger.debug(map);
			List TIPO = (List) tratarRETURNyMENSAJES(request, map, false);
			formdata.put("TIPO", TIPO);

			BigDecimal STARIFA = new BigDecimal(request.getParameter("pSTARIFA"));
			formdata.put("STARIFA", STARIFA);

			String SERVICIOS = this.getCampoTextual(request, "SERVICIOS");
			formdata.put("SERVICIOS", SERVICIOS);

			BigDecimal CVALOR = this.getCampoNumerico(request, "CVALOR");
			formdata.put("CVALOR", CVALOR);
			BigDecimal CTIPO = this.getCampoNumerico(request, "CTIPO");
			formdata.put("CTIPO", CTIPO);

		} catch (Exception e) {
			logger.error("Error en el servicio axisprf107Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000060", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}

	public void guardar(HttpServletRequest request, Axisprf107Action thisAction) {
		logger.debug("Axisprf107Service guardar");
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);

		try {
			BigDecimal pCVALOR = this.getCampoNumerico(request, "CVALOR");
			BigDecimal pCTIPO = this.getCampoNumerico(request, "CTIPO");
			BigDecimal pNIMPORTE = this.getCampoNumerico(request, "NIMPORTE");
			BigDecimal pNPORCENT = this.getCampoNumerico(request, "NPORCENT");
			BigDecimal pSTARIFA = this.getCampoNumerico(request, "pSTARIFA");
			String pSERVICIOS = this.getCampoTextual(request, "pSERVICIOS");

			PAC_IAX_PROF pac_iax_prof = new PAC_IAX_PROF(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			Map map = pac_iax_prof.ejecutaPAC_IAX_PROF__F_ACTUALIZA_SERVICIOS(pSTARIFA, pSERVICIOS, pCVALOR, pCTIPO,
					pNIMPORTE, pNPORCENT);

			logger.debug(map);

			if (((BigDecimal) tratarRETURNyMENSAJES(request, map)).intValue() == 0) {
				formdata.put("guardat", "0");
			} else {
				formdata.put("guardat", "1");
				cargarListas(request);
			}
			formdata.put("STARIFA", pSTARIFA);
		} catch (Exception e) {
			logger.error("Error en el servicio axisprf107Service - m�todo guardar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));

	}

	private void cargarListas(HttpServletRequest request) throws Exception {
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);

		PAC_IAX_LISTVALORES pac_iax_listvalores = new PAC_IAX_LISTVALORES(
				(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

		Map map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(737));
		logger.debug(map);
		List VALORES = (List) tratarRETURNyMENSAJES(request, map, false);
		formdata.put("VALORES", VALORES);

		map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(738));
		logger.debug(map);
		List TIPO = (List) tratarRETURNyMENSAJES(request, map, false);
		formdata.put("TIPO", TIPO);
	}

}
