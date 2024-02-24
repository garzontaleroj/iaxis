package axis.service.modal;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_LISTVALORES_REA;
import axis.jdbc.PAC_IAX_MNTPROD;
import axis.jdbc.PAC_IAX_PORCEN_PMD;
import axis.jdbc.PAC_IAX_REA;
import axis.mvc.control.modal.Axisrea042Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AjaxContainerService;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

public class Axisrea042Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());
	private final static String MODIFICAR = "MODIFICAR";
	private final static String ALTA = "ALTA";

	/**
	 * Carga formulario
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_form(HttpServletRequest request, Axisrea042Action thisAction) {
		logger.debug("Axisrea041ervice m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		Map LSTVALORES = new HashMap();

		PAC_IAX_PORCEN_PMD pac_iax_forcen_pmd = new PAC_IAX_PORCEN_PMD(
				(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
		PAC_IAX_LISTVALORES_REA pac_iax_listvalores_Rea = new PAC_IAX_LISTVALORES_REA(
				(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
		PAC_IAX_REA pac_iax_rea = new PAC_IAX_REA((java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
		PAC_IAX_MNTPROD pac_iax_mntprod = new PAC_IAX_MNTPROD(
				(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
		Map map;
		try {
			BigDecimal scontra = getCampoNumerico(request, "SCONTRA");
			BigDecimal nversion = getCampoNumerico(request, "NVERSIO");
			BigDecimal cramo = getCampoNumerico(request, "CRAMO");

			/* LISTVALORES */
			// Lista de contratos
			map = pac_iax_listvalores_Rea.ejecutaPAC_IAX_LISTVALORES_REA__F_GET_CONTRATOS(usuario.getCempres());
			LSTVALORES.put("LSTCONTRATOS", tratarRETURNyMENSAJES(request, map));

			// Lista de tramos
			if (scontra != null && nversion != null) {
				LSTVALORES.put("LSTTRAMOS", getTramos(scontra, nversion, request));
			}

			// Lista de ramos
			if (scontra != null) {
				map = pac_iax_listvalores_Rea.ejecutaPAC_IAX_LISTVALORES_REA__F_GET_RAMOS_CONTRATO(usuario.getCempres(),
						scontra);
				LSTVALORES.put("LSTRAMOS", tratarRETURNyMENSAJES(request, map));
			}

			// Lista de productos
			if (cramo != null) {
				map = pac_iax_mntprod.ejecutaPAC_IAX_MNTPROD__F_GET_CONSULTA(usuario.getCempres(), cramo, null, null,
						null);
				LSTVALORES.put("LSTPRODUCTOS", tratarRETURNyMENSAJES(request, map));
			}

			formdata.put("LSTVALORES", LSTVALORES);

			String modo = getCampoTextual(request, "MODO");
			if (MODIFICAR.equals(modo)) {
				BigDecimal id = getCampoNumerico(request, "ID");
				map = (Map) tratarRETURNyMENSAJES(request,
						pac_iax_forcen_pmd.ejecutaPAC_IAX_PORCEN_PMD__F_GET_CTTO_TRAMO_PRODUCTO(id, scontra));
				formdata.put("NVERSIO", map.get("NVERSIO"));
				formdata.put("SCONTRA", map.get("SCONTRA"));
				formdata.put("CTRAMO", map.get("CTRAMO"));
				formdata.put("CRAMO", map.get("CRAMO"));
				formdata.put("ID", map.get("ID"));
				formdata.put("SPRODUC", map.get("SPRODUC"));
				formdata.put("PORCEN", map.get("PORCEN"));
			}

		} catch (Exception e) {
			logger.error("Error en el servicio axisrea042Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	/**
	 * Obtiene Tramos
	 * 
	 * @param scontra
	 * @param nversio
	 * @param request
	 * @return
	 * @throws Exception
	 */
	private List getTramos(BigDecimal scontra, BigDecimal nversio, HttpServletRequest request) throws Exception {
		List result = new ArrayList();
		PAC_IAX_REA pac_iax_rea = new PAC_IAX_REA((java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
		Map map = pac_iax_rea.ejecutaPAC_IAX_REA__F_GET_DETALLECAB_REA(scontra, nversio);
		map = (Map) tratarRETURNyMENSAJES(request, map);
		if (map != null) {
			List listaContratos = (ArrayList) map.get("CONTRATOS");
			if (listaContratos != null && listaContratos.size() > 0) {
				map = (Map) listaContratos.get(0);
				map = (Map) map.get("OB_IAX_CONTRATO_REA");
				if (map != null) {
					List listaTramos = (ArrayList) map.get("TTRAMOS");
					Iterator listaTramosIt = listaTramos.iterator();
					while (listaTramosIt.hasNext()) {
						map = (Map) listaTramosIt.next();
						Map tramo = new HashMap();
						tramo.put("CTRAMO", ((Map) map.get("OB_IAX_TRAMOS_REA")).get("CTRAMO"));
						tramo.put("TTRAMO", ((Map) map.get("OB_IAX_TRAMOS_REA")).get("TTRAMO"));
						result.add(tramo);
					}
				}
			}
		}
		return result;
	}

	/**
	 * Carga combo versi�n
	 * 
	 * @param request
	 */
	public void m_ajax_cargar_version(HttpServletRequest request) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();
		try {
			BigDecimal scontra = getCampoNumerico(request, "SCONTRA");
			if (scontra != null) {
				PAC_IAX_LISTVALORES_REA pac_iax_listvalores_Rea = new PAC_IAX_LISTVALORES_REA(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
				Map map = pac_iax_listvalores_Rea
						.ejecutaPAC_IAX_LISTVALORES_REA__F_GET_VERSIONVIGENTE_CONTRATO(usuario.getCempres(), scontra);
				List version = (List) (List) ajax.rellenarPlAContenedorAjax(map);
				ajax.guardarContenidoFinalAContenedorAjax(version);
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisrea042Service - m�todo m_ajax_cargar_version", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	/**
	 * Carga combo tramos
	 * 
	 * @param request
	 */
	public void m_ajax_cargar_tramos(HttpServletRequest request) {
		AjaxContainerService ajax = new AjaxContainerService();
		try {
			BigDecimal scontra = getCampoNumerico(request, "SCONTRA");
			BigDecimal nversio = getCampoNumerico(request, "NVERSIO");
			List tramos = getTramos(scontra, nversio, request);
			ajax.guardarContenidoFinalAContenedorAjax(tramos);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisrea042Service - m�todo m_ajax_cargar_tramos", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	/**
	 * Carga combo ramos
	 * 
	 * @param request
	 */
	public void m_ajax_cargar_ramos(HttpServletRequest request) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();
		try {
			BigDecimal scontra = getCampoNumerico(request, "SCONTRA");
			if (scontra != null) {
				PAC_IAX_LISTVALORES_REA pac_iax_listvalores_Rea = new PAC_IAX_LISTVALORES_REA(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
				Map map = pac_iax_listvalores_Rea
						.ejecutaPAC_IAX_LISTVALORES_REA__F_GET_RAMOS_CONTRATO(usuario.getCempres(), scontra);
				List ramos = (List) (List) ajax.rellenarPlAContenedorAjax(map);
				ajax.guardarContenidoFinalAContenedorAjax(ramos);
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisrea042Service - m�todo m_ajax_cargar_ramos", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	/**
	 * Carga combo productos
	 * 
	 * @param request
	 */
	public void m_ajax_cargar_productos(HttpServletRequest request) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();
		try {
			BigDecimal cramo = getCampoNumerico(request, "CRAMO");
			if (cramo != null) {
				PAC_IAX_MNTPROD pac_iax_mntprod = new PAC_IAX_MNTPROD(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
				Map map = pac_iax_mntprod.ejecutaPAC_IAX_MNTPROD__F_GET_CONSULTA(usuario.getCempres(), cramo, null,
						null, null);
				List productos = (List) (List) ajax.rellenarPlAContenedorAjax(map);
				ajax.guardarContenidoFinalAContenedorAjax(productos);
			}
		} catch (Exception e) {
			logger.error("Error en el servicio Axisrea042Service - m�todo m_ajax_cargar_productos", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	/**
	 * Acepta un contrato para insert o update
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_aceptar(HttpServletRequest request, Axisrea042Action thisAction) {
		logger.debug("Axisrea042ervice m_aceptar");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		PAC_IAX_PORCEN_PMD pac_iax_forcen_pmd = new PAC_IAX_PORCEN_PMD(
				(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
		try {
			BigDecimal pPSCONTRA = getCampoNumerico(request, "SCONTRA");
			BigDecimal pPNVERSIO = getCampoNumerico(request, "NVERSIO");
			BigDecimal pPCTRAMO = getCampoNumerico(request, "CTRAMO");
			BigDecimal pPCRAMO = getCampoNumerico(request, "CRAMO");
			BigDecimal pPSPRODUC = getCampoNumerico(request, "SPRODUC");
			Map map = pac_iax_forcen_pmd.ejecutaPAC_IAX_PORCEN_PMD__F_SET_CTTO_TRAMO_PRODUCTO(pPSCONTRA, pPNVERSIO,
					pPCTRAMO, pPCRAMO, pPSPRODUC);
			tratarRETURNyMENSAJES(request, map);

			BigDecimal newID = (BigDecimal) map.get("PCTTO_TRAMO_PRODUCTO_NEW");

			if (newID != null) {
				formdata.put("ID", newID);
			}

		} catch (Exception e) {
			logger.error("Error en el servicio axisrea042Service - m�todo m_aceptar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	/**
	 * copia contrato al resto de productos
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_copiar(HttpServletRequest request, Axisrea042Action thisAction) {
		logger.debug("Axisrea042ervice m_copiar");
		PAC_IAX_PORCEN_PMD pac_iax_forcen_pmd = new PAC_IAX_PORCEN_PMD(
				(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
		try {
			BigDecimal pPCRAMO = getCampoNumerico(request, "CRAMO");
			BigDecimal pPSPRODUC = getCampoNumerico(request, "SPRODUC");
			Map map = pac_iax_forcen_pmd.ejecutaPAC_IAX_PORCEN_PMD__F_COPIAR_CONFIG_PRODUCTO(pPCRAMO, pPSPRODUC);
			tratarRETURNyMENSAJES(request, map);
		} catch (Exception e) {
			logger.error("Error en el servicio axisrea042Service - m�todo m_copiar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}
}
