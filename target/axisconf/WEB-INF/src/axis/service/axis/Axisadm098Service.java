package axis.service.axis;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_TRANSFERENCIAS;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.control.axis.Axisadm098Action;
import axis.mvc.model.UsuarioBean;
import axis.util.Constantes;

public class Axisadm098Service extends AxisBaseService {

	Log logger = LogFactory.getLog(this.getClass());

	/**
	 * 
	 * @param request
	 */
	public void m_form(HttpServletRequest request) {
		logger.debug("Axisadm039Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		BigDecimal pPCAGENTE = this.getCampoNumerico(request, "CAGENTE");
		try {
			/*
			 * if(pPCAGENTE.equals("")){ this. m_buscarTransferencias(request); }
			 */

		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm039Service - m�todo m_form", e);

		} finally {
			AbstractDispatchAction.topPila(request, "EJECUTAR_A_SALIR",
					"PAC_IAX_TRANSFERENCIAS__F_LIMPIA_REMESASPREVIO");
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	/**
	 * 
	 * @param request
	 */
	public void m_buscarTransferencias(HttpServletRequest request) {
		logger.debug("Axisadm098Service m_buscarTransferencias");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {

			BigDecimal pPCAGENTE = this.getCampoNumerico(request, "CAGENTE");

			PAC_IAX_TRANSFERENCIAS pac_iax_transferencias = new PAC_IAX_TRANSFERENCIAS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			Map map1 = pac_iax_transferencias.ejecutaPAC_IAX_TRANSFERENCIAS__F_GET_TRANS_RETENIDA(pPCAGENTE);
			logger.debug(map1);

			if (((BigDecimal) this.tratarRETURNyMENSAJES(request, map1)).equals(BigDecimal.ZERO)) {
				ArrayList cur = (ArrayList) map1.get("PCURTRANSFERENCIAS");
				if (!isEmpty(cur) && cur.size() > 0) {
					formdata.put("transferenciasRetenidas", cur);
				}
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm098Service - m�todo m_buscar", e);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	/**
	 * @param request
	 * @param thisAction
	 */
	public void m_cancelarTransferencia(HttpServletRequest request, Axisadm098Action thisAction) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {
			BigDecimal pPSCLAVE = this.getCampoNumerico(request, "SCLAVE");

			PAC_IAX_TRANSFERENCIAS pac_iax_transferencias = new PAC_IAX_TRANSFERENCIAS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			Map map = pac_iax_transferencias.ejecutaPAC_IAX_TRANSFERENCIAS__F_TRANS_RET_CANCELA(pPSCLAVE);

			tratarRETURNyMENSAJES(request, map);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm098Service - m�todo m_actualizarPorcentajeCesion", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	/**
	 * @param request
	 * @param thisAction
	 */
	public void m_desbloquearTransferencia(HttpServletRequest request, Axisadm098Action thisAction) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {
			BigDecimal pPSCLAVE = this.getCampoNumerico(request, "SCLAVE");

			PAC_IAX_TRANSFERENCIAS pac_iax_transferencias = new PAC_IAX_TRANSFERENCIAS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			Map map = pac_iax_transferencias.ejecutaPAC_IAX_TRANSFERENCIAS__F_TRANS_RET_DESBLOQUEA(pPSCLAVE);

			tratarRETURNyMENSAJES(request, map);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm098Service - m�todo m_actualizarPorcentajeCesion", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

}
