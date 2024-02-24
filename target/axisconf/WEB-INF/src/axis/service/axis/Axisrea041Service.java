package axis.service.axis;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.jdbc.PAC_IAX_PORCEN_PMD;
import axis.mvc.control.axis.Axisrea041Action;
import axis.mvc.model.UsuarioBean;
import axis.util.Constantes;

public class Axisrea041Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	/**
	 * Carga formulario
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_form(HttpServletRequest request, Axisrea041Action thisAction) {
		logger.debug("Axisrea041ervice m_form");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		PAC_IAX_PORCEN_PMD pac_iax_forcen_pmd = new PAC_IAX_PORCEN_PMD(
				(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
		PAC_IAX_LISTVALORES pacIaxListValores = new PAC_IAX_LISTVALORES(
				(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
		Map LSTVALORES = new HashMap();
		Map map = null;
		try {
			BigDecimal cramo = getCampoNumerico(request, "CRAMO");
			BigDecimal scontra = getCampoNumerico(request, "SCONTRA");
			BigDecimal nversio = getCampoNumerico(request, "NVERSIO");
			BigDecimal ctramo = getCampoNumerico(request, "CTRAMO");
			BigDecimal sproduc = getCampoNumerico(request, "SPRODUC");

			/* LISTVALORES */
			// Lista de ramos
			map = pacIaxListValores.ejecutaPAC_IAX_LISTVALORES__F_GET_RAMOS(null, usuario.getCempres());
			LSTVALORES.put("LSTRAMOS", tratarRETURNyMENSAJES(request, map));
			// Lista de productos
			if (cramo != null) {
				map = pacIaxListValores.ejecutaPAC_IAX_LISTVALORES__F_GET_PRODUCTOS(null, usuario.getCempres(), cramo);
				LSTVALORES.put("LSTPRODUCTOS", tratarRETURNyMENSAJES(request, map));
			}

			formdata.put("LSTVALORES", LSTVALORES);

			if (cramo != null || scontra != null || nversio != null || ctramo != null || sproduc != null) {
				map = pac_iax_forcen_pmd.ejecutaPAC_IAX_PORCEN_PMD__F_GET_CTTOSTRAMOSPRODUCTOS(scontra, nversio, cramo,
						ctramo, sproduc);
				List t_iax_ctto_tramo_producto = (List) tratarRETURNyMENSAJES(request, map);
				formdata.put("T_IAX_CTTO_TRAMO_PRODUCTO", t_iax_ctto_tramo_producto);
				logger.debug(map);
			}

		} catch (Exception e) {
			logger.error("Error en el servicio axisrea041Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	/**
	 * Elimina contrato seleccionado
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_eliminar(HttpServletRequest request, Axisrea041Action thisAction) {
		logger.debug("Axisrea041ervice m_eliminar");
		PAC_IAX_PORCEN_PMD pac_iax_forcen_pmd = new PAC_IAX_PORCEN_PMD(
				(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
		try {
			BigDecimal id = getCampoNumerico(request, "ID");
			tratarRETURNyMENSAJES(request, pac_iax_forcen_pmd.ejecutaPAC_IAX_PORCEN_PMD__F_DEL_CTTO_TRAMO_PRODUCTO(id));
		} catch (Exception e) {
			logger.error("Error en el servicio axisrea041Service - m�todo m_eliminar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}

	}

	/**
	 * Obtiene productos para el combo
	 * 
	 * @param request
	 */
	public void m_ajax_recuperar_productos(HttpServletRequest request) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();
		PAC_IAX_LISTVALORES pacIaxListValores = new PAC_IAX_LISTVALORES(
				(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
		try {
			BigDecimal pPCRAMO = getCampoNumerico(request, "CVALOR");
			if (!isEmpty(pPCRAMO)) {
				Map map = pacIaxListValores.ejecutaPAC_IAX_LISTVALORES__F_GET_PRODUCTOS(null, usuario.getCempres(),
						pPCRAMO);
				if (!isEmpty(map)) {
					List productos = (List) (List) ajax.rellenarPlAContenedorAjax(map);
					ajax.guardarContenidoFinalAContenedorAjax(productos);
				}
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisrea041Service - m�todo m_ajax_recuperar_productos", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	public void m_buscar(HttpServletRequest request, Axisrea041Action thisAction) {
		logger.debug("Axisrea041ervice m_buscar");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		PAC_IAX_PORCEN_PMD pac_iax_forcen_pmd = new PAC_IAX_PORCEN_PMD(
				(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

		try {
			BigDecimal scontra = getCampoNumerico(request, "SCONTRA");
			BigDecimal nversio = getCampoNumerico(request, "NVERSIO");
			BigDecimal ctramo = getCampoNumerico(request, "CTRAMO");
			BigDecimal cramo = getCampoNumerico(request, "CRAMO");
			BigDecimal sproduc = getCampoNumerico(request, "SPRODUC");

			Map map = pac_iax_forcen_pmd.ejecutaPAC_IAX_PORCEN_PMD__F_GET_CTTOSTRAMOSPRODUCTOS(scontra, nversio, cramo,
					ctramo, sproduc);
			List t_iax_ctto_tramo_producto = (List) tratarRETURNyMENSAJES(request, map);
			formdata.put("T_IAX_CTTO_TRAMO_PRODUCTO", t_iax_ctto_tramo_producto);
			logger.debug(map);

		} catch (Exception e) {
			logger.error("Error en el servicio axisrea041Service - m�todo m_buscar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}

	}

	public void m_limpiar(HttpServletRequest request, Axisrea041Action thisAction) {
		logger.debug("Axisrea041ervice m_limpiar");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {
			formdata.put("T_IAX_CTTO_TRAMO_PRODUCTO", null);
			formdata.put("SCONTRA", null);
			formdata.put("NVERSIO", null);
			formdata.put("CTRAMO", null);
			formdata.put("CRAMO", null);
			formdata.put("SPRODUC", null);
		} catch (Exception e) {
			logger.error("Error en el servicio axisrea041Service - m�todo m_limpiar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}

	}
}
