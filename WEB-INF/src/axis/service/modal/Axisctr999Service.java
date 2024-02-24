//Revision:# 6Lg1fjFFTc1A4ehrVi6c5A== #
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

import axis.jdbc.PAC_IAX_CAMPANAS;
import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.control.modal.Axisctr999Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AjaxContainerService;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

public class Axisctr999Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	public Axisctr999Service() {
		super();
	}

	/**
	 * Carga formulario En la lista de sesi�n axisctr999_garantias guarda todas las
	 * garantias de una empresa filtrada por la b�queda. En la lista de sesi�n
	 * axisctr999_garantiasCampa guarda las garantias seleccionadas para ser
	 * guardadas a la hora de aceptar
	 * 
	 * @param request
	 * @param axisctr999Action
	 */
	public void m_form(HttpServletRequest request, Axisctr999Action axisctr999Action) {
		logger.debug("Axisctr999Service m_form");
		PAC_IAX_LISTVALORES pacIaxListValores = new PAC_IAX_LISTVALORES(
				(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		Map LSTVALORES = new HashMap();
		Map map = null;
		try {
			// Vaciar tablas de la session
			/*
			 * CCODIGO se informa al abrir el modal, CCODIGO_CAMPA se informa con la primera
			 * b�squeda por lo que si CCODIGO!=CCODIGO_CAMPA se tienen que vaciar las listas
			 * de la pantalla que est�n en sesi�n por que pertenec�n a consultas anteriores
			 * a otras campa�as
			 */
			BigDecimal cCodigo = getCampoNumerico(request, "CCODIGO");
			BigDecimal cCodigoCampa = getCampoNumerico(request, "CCODIGO_CAMPA");
			if (!cCodigo.equals(cCodigoCampa)) {
				request.getSession().setAttribute("axisctr999_garantias", null);
				request.getSession().setAttribute("axisctr999_garantiasCampa", null);
			}

			BigDecimal pPCRAMO = getCampoNumerico(request, "CRAMO");
			BigDecimal pPSPRODUC = getCampoNumerico(request, "SPRODUC");
			BigDecimal pPCACTIVI = getCampoNumerico(request, "CACTIVI");

			/* LISTVALORES */
			// Lista de ramos
			map = pacIaxListValores.ejecutaPAC_IAX_LISTVALORES__F_GET_RAMOS(null, usuario.getCempres());
			LSTVALORES.put("LSTRAMOS", tratarRETURNyMENSAJES(request, map));
			// Lista de productos
			if (pPCRAMO != null) {
				map = pacIaxListValores.ejecutaPAC_IAX_LISTVALORES__F_GET_PRODUCTOS(null, usuario.getCempres(),
						pPCRAMO);
				LSTVALORES.put("LSTPRODUCTOS", tratarRETURNyMENSAJES(request, map));
			}
			// Lista de actividad
			if (pPSPRODUC != null && pPCRAMO != null) {
				map = pacIaxListValores.ejecutaPAC_IAX_LISTVALORES__F_GET_CACTIVI(pPSPRODUC, pPCRAMO);
				LSTVALORES.put("LSTACTIVIDAD", tratarRETURNyMENSAJES(request, map));
			}
			// lista de garantias
			if (pPSPRODUC != null && pPCRAMO != null && pPCACTIVI != null) {
				map = pacIaxListValores.ejecutaPAC_IAX_LISTVALORES__F_GET_CGARANT(pPSPRODUC, pPCRAMO, pPCACTIVI);
				LSTVALORES.put("LSTGARANTIAS", tratarRETURNyMENSAJES(request, map));
			}

			formdata.put("LSTVALORES", LSTVALORES);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr999Service - m�todo m_form", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}

	/**
	 * Busca garantias y productos seleccionadas en los combos
	 * 
	 * @param request
	 */
	public void m_buscar(HttpServletRequest request) {
		PAC_IAX_CAMPANAS pac_iax_campanas = new PAC_IAX_CAMPANAS(
				(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		BigDecimal pPCRAMO = getCampoNumerico(request, "CRAMO");
		BigDecimal pPSPRODUC = getCampoNumerico(request, "SPRODUC");
		BigDecimal pPCACTIVI = getCampoNumerico(request, "CACTIVI");
		BigDecimal pPCGARANT = getCampoNumerico(request, "CGARANT");
		try {
			// if (pPCRAMO != null || pPSPRODUC != null || pPCACTIVI != null || pPCGARANT !=
			// null) {
			// Garant�as de la campa�a
			BigDecimal cCodigo = getCampoNumerico(request, "CCODIGO");
			BigDecimal cCodigoCampa = getCampoNumerico(request, "CCODIGO_CAMPA");
			if (!cCodigo.equals(cCodigoCampa)) {
				Map map = pac_iax_campanas.ejecutaPAC_IAX_CAMPANAS__F_GET_CAMPAPRD(cCodigo);
				if (BigDecimal.ZERO.equals(tratarRETURNyMENSAJES(request, map))) {
					List productosCampa = (List) map.get("PLISTPROD");
					request.getSession().setAttribute("axisctr999_garantiasCampa", productosCampa);
				}
				formdata.put("CCODIGO_CAMPA", cCodigo);
			}

			// Garantias de la empresa
			Map map = pac_iax_campanas.ejecutaPAC_IAX_CAMPANAS__F_GET_PRODUCTOS_CAMPA(pPCRAMO, pPSPRODUC, pPCACTIVI,
					pPCGARANT);
			if (BigDecimal.ZERO.equals(tratarRETURNyMENSAJES(request, map))) {
				List productosList = (List) map.get("PLISTPROD");
				List selectedProductsLisr = new ArrayList();
				Iterator returnIt = productosList.iterator();
				while (returnIt.hasNext()) {
					Map prod = (HashMap) returnIt.next();
					BigDecimal cGarant = (BigDecimal) prod.get("CGARANT");
					prod.put("MARCAR", productoEnCampana(request, prod));
					selectedProductsLisr.add(prod);
				}
				request.getSession().setAttribute("axisctr999_garantias", selectedProductsLisr);
			}
			// }
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr999Service - m�todo m_form", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
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
			logger.error("Error en el servicio Axisctr999Service - m�todo m_ajax_recuperar_productos", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	/**
	 * Obtiene actividades para el combo
	 * 
	 * @param request
	 */
	public void m_ajax_recuperar_actividades(HttpServletRequest request) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();
		PAC_IAX_LISTVALORES pacIaxListValores = new PAC_IAX_LISTVALORES(
				(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
		try {
			BigDecimal pPCRAMO = getCampoNumerico(request, "CRAMO");
			BigDecimal pPSPRODUC = getCampoNumerico(request, "SPRODUC");
			if (!isEmpty(pPCRAMO) && !isEmpty(pPSPRODUC)) {
				Map map = pacIaxListValores.ejecutaPAC_IAX_LISTVALORES__F_GET_CACTIVI(pPSPRODUC, pPCRAMO);
				if (!isEmpty(map)) {
					List productos = (List) (List) ajax.rellenarPlAContenedorAjax(map);
					ajax.guardarContenidoFinalAContenedorAjax(productos);
				}
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr999Service - m�todo m_ajax_recuperar_actividades", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	/**
	 * Obtiene garantias para el combo
	 * 
	 * @param request
	 */
	public void m_ajax_recuperar_garantias(HttpServletRequest request) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();
		PAC_IAX_LISTVALORES pacIaxListValores = new PAC_IAX_LISTVALORES(
				(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
		try {
			BigDecimal pPCRAMO = getCampoNumerico(request, "CRAMO");
			BigDecimal pPSPRODUC = getCampoNumerico(request, "SPRODUC");
			BigDecimal pPCACTIVI = getCampoNumerico(request, "CACTIVI");
			if (!isEmpty(pPCRAMO) && !isEmpty(pPSPRODUC) && !isEmpty(pPCACTIVI)) {
				Map map = pacIaxListValores.ejecutaPAC_IAX_LISTVALORES__F_GET_CGARANT(pPSPRODUC, pPCRAMO, pPCACTIVI);
				if (!isEmpty(map)) {
					List productos = (List) (List) ajax.rellenarPlAContenedorAjax(map);
					ajax.guardarContenidoFinalAContenedorAjax(productos);
				}
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr999Service - m�todo m_ajax_recuperar_garantias", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	/**
	 * Por ajax marca MARCAR=1 o desmarca MARCAR=0 garantia y producto de la lista
	 * de sesi�n axisctr999_garantias
	 * 
	 * @param request
	 */
	public void m_marcar_json(HttpServletRequest request) {
		AjaxContainerService ajax = new AjaxContainerService();
		HashMap miDataObject = new HashMap();
		try {
			BigDecimal CGARANT = this.getCampoNumerico(request, "CGARANT");
			CGARANT = CGARANT != null ? CGARANT : new BigDecimal(-1);
			BigDecimal MARCAR = this.getCampoNumerico(request, "MARCAR");
			BigDecimal SPRODUC = this.getCampoNumerico(request, "SPRODUC");

			ArrayList garantiasResult = new ArrayList();
			List garantias = (ArrayList) request.getSession().getAttribute("axisctr999_garantias");
			Iterator garantiasIt = garantias.iterator();
			while (garantiasIt.hasNext()) {
				HashMap garantia = (HashMap) garantiasIt.next();
				BigDecimal CGARANTList = (BigDecimal) garantia.get("CGARANT");
				CGARANTList = CGARANTList != null ? CGARANTList : new BigDecimal(-1);
				BigDecimal SPRODUCList = (BigDecimal) garantia.get("SPRODUC");
				if (isEmpty(SPRODUC)) {
					garantia.put("MARCAR", MARCAR);
					procesaGarantia(request, garantia, MARCAR);
				} else if (CGARANTList.equals(CGARANT) && SPRODUCList.equals(SPRODUC)) {
					garantia.put("MARCAR", MARCAR);
					procesaGarantia(request, garantia, MARCAR);
				}
				garantiasResult.add(garantia);
			}
			request.getSession().setAttribute("axisctr999_garantias", garantiasResult);

			miDataObject.put("CGARANT", CGARANT);

			request.setAttribute(Constantes.AJAXCONTAINER, miDataObject);
		} catch (Exception e) {
			logger.error("Error.", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	/**
	 * Busca CGARANT en la lista de sesi�n axisctr999_garantiasCampa
	 * 
	 * @param request
	 * @param value   = CGARANT
	 * @return 1 encontrado, 0 no encontrado
	 */
	private BigDecimal productoEnCampana(HttpServletRequest request, Map prod) {
		BigDecimal cGarantList = (BigDecimal) prod.get("CGARANT");
		cGarantList = cGarantList != null ? cGarantList : new BigDecimal(-1);
		BigDecimal sproducList = (BigDecimal) prod.get("SPRODUC");
		List garantiasCampa = (ArrayList) request.getSession().getAttribute("axisctr999_garantiasCampa");
		Iterator garantiasCampaIt = garantiasCampa.iterator();
		while (garantiasCampaIt.hasNext()) {
			Map garantia = (Map) garantiasCampaIt.next();
			BigDecimal cGarantCampa = (BigDecimal) garantia.get("CGARANT");
			cGarantCampa = cGarantCampa != null ? cGarantCampa : new BigDecimal(-1);
			BigDecimal sproducCampa = (BigDecimal) garantia.get("SPRODUC");
			if (cGarantList.equals(cGarantCampa) && sproducList.equals(sproducCampa)) {
				return BigDecimal.ONE;
			}
		}
		return BigDecimal.ZERO;
	}

	/**
	 * Si la garantia MARCAR=0 elimina de la campa�a, si es MARCAR=1 a�ade a la
	 * campa�a
	 * 
	 * @param request
	 * @param garantia
	 * @param marcar
	 */
	private void procesaGarantia(HttpServletRequest request, HashMap garantia, BigDecimal marcar) {
		if (BigDecimal.ZERO.equals(marcar)) {
			delEnCampana(request, garantia);
		} else if (BigDecimal.ONE.equals(marcar)) {
			addEnCampana(request, garantia);
		}
	}

	/**
	 * En la lista de sesi�n axisctr999_garantiasCampa a�ade una garantia
	 * 
	 * @param request
	 * @param value
	 */
	private void addEnCampana(HttpServletRequest request, HashMap value) {
		List garantiasCampa = (ArrayList) request.getSession().getAttribute("axisctr999_garantiasCampa");
		List garantiasCampaResult = new ArrayList();
		Iterator garantiasCampaIt = garantiasCampa.iterator();
		Boolean encontrado = false;
		BigDecimal cGarant = (BigDecimal) value.get("CGARANT");
		BigDecimal sProduc = (BigDecimal) value.get("SPRODUC");
		while (garantiasCampaIt.hasNext()) {
			Map garantia = (Map) garantiasCampaIt.next();
			BigDecimal cGarantCampana = (BigDecimal) garantia.get("CGARANT");
			BigDecimal sProducCampana = (BigDecimal) garantia.get("SPRODUC");
			if (cGarantCampana != null && sProducCampana != null && cGarantCampana.equals(cGarant)
					&& sProducCampana.equals(sProduc)) {
				encontrado = true;
			}
			garantiasCampaResult.add(garantia);
		}
		if (!encontrado) {
			garantiasCampaResult.add(value);
		}
		request.getSession().setAttribute("axisctr999_garantiasCampa", garantiasCampaResult);
		logger.debug(garantiasCampaResult);
	}

	/**
	 * En la lista de sesi�n axisctr999_garantiasCampa elimina una garantia
	 * 
	 * @param request
	 * @param value
	 */
	private void delEnCampana(HttpServletRequest request, HashMap value) {
		List garantiasCampa = (ArrayList) request.getSession().getAttribute("axisctr999_garantiasCampa");
		List garantiasCampaResult = new ArrayList();
		Iterator garantiasCampaIt = garantiasCampa.iterator();
		BigDecimal cGarant = (BigDecimal) value.get("CGARANT");
		BigDecimal sProduc = (BigDecimal) value.get("SPRODUC");
		cGarant = cGarant != null ? cGarant : new BigDecimal(-1);
		while (garantiasCampaIt.hasNext()) {
			Map garantia = (Map) garantiasCampaIt.next();
			BigDecimal cGarantCampana = (BigDecimal) garantia.get("CGARANT");
			BigDecimal sProducCampana = (BigDecimal) garantia.get("SPRODUC");
			if (!(cGarantCampana != null && sProducCampana != null && cGarantCampana.equals(cGarant)
					&& sProducCampana.equals(sProduc))) {
				garantiasCampaResult.add(garantia);
			}
		}
		request.getSession().setAttribute("axisctr999_garantiasCampa", garantiasCampaResult);
		logger.debug(garantiasCampaResult);
	}

	/**
	 * Itera la lista de sesi�n axisctr999_garantiasCampa y guarda sus valores
	 * 
	 * @param request
	 * @param axisctr999Action
	 */
	public void m_aceptar(HttpServletRequest request, Axisctr999Action axisctr999Action) {
		PAC_IAX_CAMPANAS pac_iax_campanas = new PAC_IAX_CAMPANAS(
				(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {
			BigDecimal cCodigo = getCampoNumerico(request, "CCODIGO");
			List garantList = (List) request.getSession().getAttribute("axisctr999_garantiasCampa");
			Map map = pac_iax_campanas.ejecutaPAC_IAX_CAMPANAS__F_DEL_PRODUCTOS_CAMPA(cCodigo);
			if (BigDecimal.ZERO.equals(tratarRETURNyMENSAJES(request, map))) {
				if (garantList != null && garantList.size() > 0) {
					Iterator garantIt = garantList.iterator();
					while (garantIt.hasNext()) {
						Map garantMap = (Map) garantIt.next();
						logger.debug(garantMap);
						BigDecimal sproduc = (BigDecimal) garantMap.get("SPRODUC");
						BigDecimal cactivi = (BigDecimal) garantMap.get("CACTIVI");
						BigDecimal cgarant = (BigDecimal) garantMap.get("CGARANT");
						map = pac_iax_campanas.ejecutaPAC_IAX_CAMPANAS__F_SET_PRODUCTOS_CAMPA(cCodigo, sproduc, cactivi,
								cgarant);
						if (BigDecimal.ZERO.equals(tratarRETURNyMENSAJES(request, map))) {
							formdata.put("OK", "1");
						}
					}
					m_form(request, axisctr999Action);
				}
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axictr999Service - m�todo m_aceptar", e);
			AbstractDispatchAction.guardarMensaje(request,
					"verbatim:<b>" + e.getClass().getName() + ":</b> " + e.getLocalizedMessage(),
					new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}
}
