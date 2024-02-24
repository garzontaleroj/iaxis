package axis.service.modal;

import java.math.BigDecimal;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

/**
 * CONSULTA GARANT�AS
 */
public class Axisdesc012Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	public void m_init(HttpServletRequest request) {
		logger.debug("Axisdesc012Service m_buscar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {
			/*
			 * BigDecimal CEMPRES=this.getCampoNumerico(request, "CEMPRES"); if
			 * (isEmpty(CEMPRES)) { CEMPRES=usuario.getCempres(); } if (isEmpty(CEMPRES)) {
			 * formdata.put("CEMPRES", CEMPRES.toString()); }
			 */

		} catch (Exception e) {
			logger.error("Error.", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		} finally {
			// ver m_form: this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	public void m_buscar(HttpServletRequest request) {
		logger.debug("Axisdesc012Service m_buscar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {
			// SINPAQUETE sinpaquete=new
			// SINPAQUETE((Connection)request.getAttribute(Constantes.DB01CONN));

			// PAC_IAX_MNTGARANTIAS pac_iax_mntgarantias=new
			// PAC_IAX_MNTGARANTIAS((Connection)request.getAttribute(Constantes.DB01CONN));

			Map map = null;
			BigDecimal CGARAN = getCampoNumerico(request, "CGARAN");
			// BigDecimal CDGS=getCampoNumerico(request, "CDGS");
			String TGARAN = getCampoTextual(request, "TGARAN");
			// String TROTGA = getCampoTextual(request,"TROTGA");

			logger.debug(CGARAN);

			// Map mapa_resultado =
			// pac_iax_coa.ejecutaPAC_IAX_COA__F_GET_CTACOASEGURO(CEMPRES, CCOMPANI, CRAMO,
			// SPRODUC, FCIERRE, SSEGURO);
			// Map mapa_resultado =
			// pac_iax_mntgarantias.ejecutaPAC_IAX_MNTGARANTIAS__F_GET_GARANTIAS(CGARAN,
			// TGARAN);

			// logger.debug(mapa_resultado);
			/*
			 * List RETURN = (List)tratarRETURNyMENSAJES(request, mapa_resultado); if
			 * (!isEmpty(RETURN)) { request.setAttribute("MNTGARANTIAS",
			 * tratarRETURNyMENSAJES(request, mapa_resultado)); } else { // No hay registros
			 * AbstractDispatchAction.guardarMensaje(request, "1000254", null,
			 * Constantes.MENSAJE_INFO); }
			 */

		} catch (Exception e) {
			logger.error("Error en el servicio Axisdesc012Service - m�todo m_buscar", e);
			AbstractDispatchAction.guardarMensaje(request,
					"verbatim:<b>" + e.getClass().getName() + ":</b> " + e.getLocalizedMessage(),
					new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			// ver m_form: this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	public void m_form(HttpServletRequest request) {
		logger.debug("Axisdesc012Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {

		} catch (Exception e) {
			logger.error("Error en el servicio Axisdesc012Service - m�todo m_form", e);
			AbstractDispatchAction.guardarMensaje(request,
					"verbatim:<b>" + e.getClass().getName() + ":</b> " + e.getLocalizedMessage(),
					new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

}
