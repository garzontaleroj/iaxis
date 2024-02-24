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
import axis.mvc.control.modal.Axisprf013Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

public class Axisprf013Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	public void m_init(HttpServletRequest request, Axisprf013Action thisAction) {
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		try {
			// this.cargaListaRamos(request);
		} catch (Exception e) {
			thisAction.guardarMensaje(request, "1000060", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}

	public void m_form(HttpServletRequest request, Axisprf013Action thisAction) {
		logger.debug("Axisprf013Service m_form");
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		// Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		try {
			PAC_IAX_PROF pac_iax_prof = new PAC_IAX_PROF(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			PAC_IAX_LISTVALORES pac_iax_listvalores = new PAC_IAX_LISTVALORES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			BigDecimal psprofes = this.getCampoNumerico(request, "pCodiProf");
			BigDecimal sperson = this.getCampoNumerico(request, "SPERSON");
			formdata.put("SPROFES", psprofes);
			formdata.put("SPERSON", sperson);

			Map map = pac_iax_prof.ejecutaPAC_IAX_PROF__F_GET_LSTTELEFONOS(sperson);
			logger.debug("++++map TELEFONOS-->" + map);
			List TELFSPROF = (List) tratarRETURNyMENSAJES(request, map, false);
			formdata.put("NMOVIL_SPERSON", TELFSPROF);

			map = pac_iax_prof.ejecutaPAC_IAX_PROF__F_GET_LSTEMAIL(sperson);
			logger.debug("++++map EMAIL-->" + map);
			List EMAILPROF = (List) tratarRETURNyMENSAJES(request, map, false);
			formdata.put("TEMAIL_SPERSON", EMAILPROF);

			String MODO = this.getCampoTextual(request, "MODO");
			formdata.put("MODO", MODO);

			if (MODO != null) {
				if (MODO.equalsIgnoreCase("modificar")) {
					formdata.put("TNOMBRE", this.getCampoTextual(request, "TNOMBRE"));
					formdata.put("CMAILCON", this.getCampoNumerico(request, "CMAILCON"));
					formdata.put("CTELCON", this.getCampoTextual(request, "CTELCON"));
					formdata.put("TCARGO", this.getCampoTextual(request, "TCARGO"));
					formdata.put("TNIF", this.getCampoTextual(request, "TNIF"));
				}
			}

			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		} catch (Exception e) {
			logger.error("Error en el servicio Axisprf013Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000060", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {

		}
	}

	public void guardar(HttpServletRequest request, Axisprf013Action thisAction) {
		logger.debug("Axisprf013Service guardar");
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map map = new HashMap();

		try {
			PAC_IAX_PROF pac_iax_prof = new PAC_IAX_PROF(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			BigDecimal pSPROFES = this.getCampoNumerico(request, "pCodiProf");
			BigDecimal pSPERSON = this.getCampoNumerico(request, "SPERSON");

			BigDecimal pNMOVIL = this.getCampoNumerico(request, "NMOVIL");
			BigDecimal pTEMAIL = this.getCampoNumerico(request, "TEMAIL");
			String pTCARG0 = this.getCampoTextual(request, "TCARG0");

			String MODO = this.getCampoTextual(request, "MODO");

			map = pac_iax_prof.ejecutaPAC_IAX_PROF__F_SET_REPRESENTANTE(pSPROFES, pSPERSON, pNMOVIL, pTEMAIL, pTCARG0);
			logger.debug("$$$$$$$$$$$$ fin pac_iax_prof: " + map);

			if (((BigDecimal) tratarRETURNyMENSAJES(request, map)).intValue() == 0) {
				formdata.put("guardat", "0");
			} else {
				formdata.put("guardat", "1");
			}

			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		} catch (Exception e) {
			logger.error("Error en el servicio Axisprf013Service - m�todo guardar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}
}
