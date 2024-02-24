package axis.service.modal;

import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_GESTIONES;
import axis.mvc.control.modal.Axissin047Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AjaxContainerService;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

public class Axissin047Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());
	SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");

	/**
	 * M�todo que se llama al inicio de este flujo. Realiza la carga inicial de los
	 * datos de los combos.
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_form(HttpServletRequest request, Axissin047Action thisAction) {
		logger.debug("Axissin047Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {
			cargarDatos(request);

		} catch (Exception e) {
			logger.error("Error en el servicio Axispro004Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	private void cargarDatos(HttpServletRequest request) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {
			String pnsinies = getCampoTextual(request, "NSINIES");
			BigDecimal pPNTRAMIT = getCampoNumerico(request, "NTRAMIT");
			if (pPNTRAMIT == null) {
				pPNTRAMIT = getCampoNumerico(request, "indexTramitacio");
			}
			BigDecimal pPCTIPGES = getCampoNumerico(request, "CTIPGES");
			BigDecimal pPCESTGES = getCampoNumerico(request, "CESTGES");
			BigDecimal pPCSUBGES = getCampoNumerico(request, "CSUBGES");
			BigDecimal pPSGESTIO = getCampoNumerico(request, "SGESTIO");

			java.sql.Date pPFECHA = stringToSqlDate(getCampoTextual(request, "FECHA"));

			PAC_IAX_GESTIONES pac_axis_gestiones = new PAC_IAX_GESTIONES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map m1 = pac_axis_gestiones.ejecutaPAC_IAX_GESTIONES__F_GET_LSTMOVIMIENTOS(pPCTIPGES, pPCESTGES, pPCSUBGES);
			logger.debug("ejecutaPAC_IAX_GESTIONES__F_GET_LSTLOCALIZACION devuelve:" + m1);
			List lstmovs = (List<Map>) tratarRETURNyMENSAJES(request, m1);
			formdata.put("lstmovs", lstmovs);
			formdata.put("SGESTIO", pPSGESTIO);
			formdata.put("CTIPGES", pPCTIPGES);
			formdata.put("CESTGES", pPCESTGES);
			formdata.put("CSUBGES", pPCSUBGES);
		} catch (Exception e) {
			logger.error("Error en el servicio Axissin045Service - m�todo cargarDatos", e);
		}
	}

	public void m_aceptar(HttpServletRequest request, Axissin047Action thisAction) {
		logger.debug("Axissin047Service m_aceptar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {
			BigDecimal pPSGESTIO = getCampoNumerico(request, "SGESTIO");
			BigDecimal pPCTIPGES = getCampoNumerico(request, "CTIPGES");
			BigDecimal pPCTIPMOV = getCampoNumerico(request, "CTIPMOV");
			BigDecimal pPCSUBGES = getCampoNumerico(request, "CSUBGES");
			BigDecimal pPCESTGES = getCampoNumerico(request, "CESTGES");
			pPCSUBGES = null;
			pPCESTGES = null;
			String pPTCOMENT = getCampoTextual(request, "TCOMENT");
			PAC_IAX_GESTIONES pac_axis_gestiones = new PAC_IAX_GESTIONES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map m1 = pac_axis_gestiones.ejecutaPAC_IAX_GESTIONES__F_SET_MOVGESTION(pPSGESTIO, pPCTIPMOV, pPCTIPGES,
					pPCESTGES, pPCSUBGES, pPTCOMENT);
			logger.debug("ejecutaPAC_IAX_GESTIONES__F_SET_MOVGESTION devuelve:" + m1);
			if (m1.get("RETURN").equals(new BigDecimal(0))) {
				formdata.put("OK", new BigDecimal(1));
			} else {
				tratarRETURNyMENSAJES(request, m1);
				cargarDatos(request);
			}
		} catch (Exception e) {
			logger.error("Error en el servicio Axispro004Service - m�todo m_aceptar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	public void m_ajax_usuario_permitido(HttpServletRequest request) {
		logger.debug("Axissin047Service m_ajax_usuario_permitido");
		AjaxContainerService ajax = new AjaxContainerService();
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {
			PAC_IAX_GESTIONES pac_axis_gestiones = new PAC_IAX_GESTIONES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			BigDecimal pPCTIPMOV = getCampoNumerico(request, "CTIPMOV");
			String pPNSINIES = request.getParameter("NSINIES");
			BigDecimal pPNTRAMIT = getCampoNumerico(request, "NTRAMIT");
			BigDecimal pPSGESTIO = getCampoNumerico(request, "SGESTIO");

			Map map = pac_axis_gestiones.ejecutaPAC_IAX_GESTIONES__F_USUARIO_PERMITIDO(pPNSINIES, pPNTRAMIT, pPSGESTIO,
					pPCTIPMOV);
			logger.debug("ejecutaPAC_IAX_GESTIONES__F_USUARIO_PERMITIDO devuelve: " + map);

			List plLista = new ArrayList();

			if (ajax.rellenarPlAContenedorAjax(map).equals(new BigDecimal(0))) {
				plLista.add(map);
			}
			logger.debug("lista ajax: " + plLista);

			ajax.guardarContenidoFinalAContenedorAjax(plLista);
		} catch (Exception e) {
			logger.error("Error en el servicio Axissin047Service - m�todo m_ajax_usuario_permitido", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}
}
