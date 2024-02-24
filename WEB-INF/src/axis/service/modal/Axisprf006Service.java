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
import axis.mvc.control.modal.Axisprf006Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

public class Axisprf006Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	public void m_init(HttpServletRequest request, Axisprf006Action thisAction) {
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

	public void m_form(HttpServletRequest request, Axisprf006Action thisAction) {
		logger.debug("Axisprf006Service m_form");
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		// Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		try {
			PAC_IAX_LISTVALORES pac_iax_listvalores = new PAC_IAX_LISTVALORES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map LISTVALORES = new HashMap();
			// Map map = new
			// PAC_IAX_LISTVALORES((java.sql.Connection)request.getAttribute(Constantes.DB01CONN)).ejecutaPAC_IAX_LISTVALORES__F_GET_ESTADOSSINI();
			Map map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(742));

			logger.debug(map);
			List ESTADOSPROVEEDOR = (List) tratarRETURNyMENSAJES(request, map, false);
			formdata.put("ESTADOSPROVEEDOR", ESTADOSPROVEEDOR);

			Map motivosBaja = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(1066));
			logger.debug(motivosBaja);
			LISTVALORES.put("LSTCMOTBAJA", tratarRETURNyMENSAJES(request, motivosBaja, false));

			formdata.put("LISTVALORES", LISTVALORES);
		} catch (Exception e) {
			logger.error("Error en el servicio axisprf006Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000060", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}

	public void guardar(HttpServletRequest request, Axisprf006Action thisAction) {
		logger.debug("Axisprf006Service guardar");
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		// Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {
			BigDecimal pPsrofes = this.getCampoNumerico(request, "pCodiProf");
			BigDecimal pCESTPRF = this.getCampoNumerico(request, "CESTPRF");
			Date pFESTADO = this.stringToSqlDate(this.getCampoTextual(request, "FESTADO"));
			BigDecimal pCMOTBAJA = this.getCampoNumerico(request, "CMOTBAJA");
			String pTOBSERVACIONES = this.getCampoTextual(request, "TOBSERVACIONES");

			Map map = new PAC_IAX_PROF((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_PROF__F_SET_ESTADO(pPsrofes, pCESTPRF, (Date) pFESTADO, pCMOTBAJA, pTOBSERVACIONES);

			if (((BigDecimal) tratarRETURNyMENSAJES(request, map)).intValue() == 0) {
				formdata.put("guardat", "0");
			} else {
				formdata.put("guardat", "1");
				cargarListas(request);
			}

			logger.debug("$$$$$$$$$$$$ fin pac_iax_prof: " + map);
		} catch (Exception e) {
			logger.error("Error en el servicio axisprf006Service - m�todo guardar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));

	}

	private void cargarListas(HttpServletRequest request) throws Exception {
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);

		PAC_IAX_LISTVALORES pac_iax_listvalores = new PAC_IAX_LISTVALORES(
				(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
		Map LISTVALORES = new HashMap();
		// Map map = new
		// PAC_IAX_LISTVALORES((java.sql.Connection)request.getAttribute(Constantes.DB01CONN)).ejecutaPAC_IAX_LISTVALORES__F_GET_ESTADOSSINI();
		Map map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(742));

		logger.debug(map);
		List ESTADOSPROVEEDOR = (List) tratarRETURNyMENSAJES(request, map, false);
		formdata.put("ESTADOSPROVEEDOR", ESTADOSPROVEEDOR);

		Map motivosBaja = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(1066));
		logger.debug(motivosBaja);
		LISTVALORES.put("LSTCMOTBAJA", tratarRETURNyMENSAJES(request, motivosBaja, false));

		formdata.put("LISTVALORES", LISTVALORES);
	}

}
