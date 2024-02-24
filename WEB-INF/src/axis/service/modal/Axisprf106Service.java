package axis.service.modal;

import java.math.BigDecimal;
import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.jdbc.PAC_IAX_PROF;
import axis.mvc.control.modal.Axisprf106Action;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

public class Axisprf106Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	public void m_init(HttpServletRequest request, Axisprf106Action thisAction) {
		try {
		} catch (Exception e) {
			thisAction.guardarMensaje(request, "1000060", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}

	public void m_form(HttpServletRequest request, Axisprf106Action thisAction) {
		logger.debug("Axisprf106Service m_form");
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {
			PAC_IAX_LISTVALORES pac_iax_listvalores = new PAC_IAX_LISTVALORES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(742));

			logger.debug(map);
			List ESTADOSCONVENIO = (List) tratarRETURNyMENSAJES(request, map, false);
			formdata.put("ESTADOSCONVENIO", ESTADOSCONVENIO);

			BigDecimal SPROFES = new BigDecimal(request.getParameter("pSPROFES"));
			BigDecimal SCONVEN = new BigDecimal(request.getParameter("pSCONVEN"));
			formdata.put("SPROFES", SPROFES);
			formdata.put("SCONVEN", SCONVEN);
		} catch (Exception e) {
			logger.error("Error en el servicio axisprf106Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000060", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}

	public void guardar(HttpServletRequest request, Axisprf106Action thisAction) {
		logger.debug("Axisprf106Service guardar");
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);

		try {
			BigDecimal pSCONVEN = this.getCampoNumerico(request, "pSCONVEN");
			BigDecimal pCESTADO = this.getCampoNumerico(request, "CESTADO");
			Date pFESTADO = this.stringToSqlDate(this.getCampoTextual(request, "FESTADO"));
			String pTOBSERVACIONES = this.getCampoTextual(request, "TOBSERVACIONES");

			PAC_IAX_PROF pac_iax_prof = new PAC_IAX_PROF(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			Map map = pac_iax_prof.ejecutaPAC_IAX_PROF__F_SET_ESTADO_CONVENIO(pSCONVEN, pCESTADO, (Date) pFESTADO,
					pTOBSERVACIONES);

			if (((BigDecimal) tratarRETURNyMENSAJES(request, map)).intValue() == 0) {
				formdata.put("guardat", "0");
			} else {
				formdata.put("guardat", "1");
				cargarListas(request);
			}

			logger.debug("$$$$$$$$$$$$ fin guardar estado convenio pac_iax_prof: " + map);
		} catch (Exception e) {
			logger.error("Error en el servicio axisprf106Service - m�todo guardar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));

	}

	private void cargarListas(HttpServletRequest request) throws Exception {
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);

		PAC_IAX_LISTVALORES pac_iax_listvalores = new PAC_IAX_LISTVALORES(
				(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

		Map map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(742));
		logger.debug(map);
		List ESTADOSCONVENIO = (List) tratarRETURNyMENSAJES(request, map, false);
		formdata.put("ESTADOSCONVENIO", ESTADOSCONVENIO);
	}

}
