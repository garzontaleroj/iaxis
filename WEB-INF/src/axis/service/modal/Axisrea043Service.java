package axis.service.modal;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_PORCEN_PMD;
import axis.mvc.control.modal.Axisrea043Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

public class Axisrea043Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	/**
	 * Carga formulario
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_form(HttpServletRequest request, Axisrea043Action thisAction) {
		logger.debug("Axisrea043ervice m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		PAC_IAX_PORCEN_PMD pac_iax_forcen_pmd = new PAC_IAX_PORCEN_PMD(
				(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
		try {
			BigDecimal idCtto = getCampoNumerico(request, "ID_CTTO");
			BigDecimal idCabecera = null;
			if (idCtto != null) {
				formdata.put("IDCABECERA", idCtto);
				idCabecera = idCtto;
			} else {
				idCabecera = getCampoNumerico(request, "IDCABECERA");
			}
			Map map = pac_iax_forcen_pmd.ejecutaPAC_IAX_PORCEN_PMD__F_GET_PORCENTAJES_TRAMO_CTTO(idCabecera);
			List t_iax_porcen_tramo_ctto = (List) tratarRETURNyMENSAJES(request, map);
			formdata.put("T_IAX_PORCEN_TRAMO_CTTO", t_iax_porcen_tramo_ctto);

		} catch (Exception e) {
			logger.error("Error en el servicio axisrea043Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	/**
	 * Elimina porcentaje seleccionado
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_eliminar(HttpServletRequest request, Axisrea043Action thisAction) {
		logger.debug("Axisrea043ervice m_eliminar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		PAC_IAX_PORCEN_PMD pac_iax_forcen_pmd = new PAC_IAX_PORCEN_PMD(
				(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
		try {
			BigDecimal id = getCampoNumerico(request, "ID");
			BigDecimal idcabecera = getCampoNumerico(request, "IDCABECERA");
			tratarRETURNyMENSAJES(request,
					pac_iax_forcen_pmd.ejecutaPAC_IAX_PORCEN_PMD__F_DEL_PORCEN_TRAMO_CTTO(idcabecera, id));
		} catch (Exception e) {
			logger.error("Error en el servicio axisrea043Service - m�todo m_eliminar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}

	}

	/**
	 * Replica porcentajes al resto de productos
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_replicar(HttpServletRequest request, Axisrea043Action thisAction) {
		logger.debug("Axisrea043ervice m_replicar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		PAC_IAX_PORCEN_PMD pac_iax_forcen_pmd = new PAC_IAX_PORCEN_PMD(
				(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
		try {
			BigDecimal pPSCONTRA = getCampoNumerico(request, "SCONTRA");
			BigDecimal pPCTRAMO = getCampoNumerico(request, "CTRAMO");
			BigDecimal pPCRAMO = getCampoNumerico(request, "CRAMO");
			BigDecimal pPSPRODUC = getCampoNumerico(request, "SPRODUC");
			Map map = pac_iax_forcen_pmd.ejecutaPAC_IAX_PORCEN_PMD__F_REPLICAR_CUOTAS(pPSCONTRA, pPCTRAMO, pPCRAMO,
					pPSPRODUC);
			tratarRETURNyMENSAJES(request, map);
		} catch (Exception e) {
			logger.error("Error en el servicio axisrea043Service - m�todo m_replicar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}
}
