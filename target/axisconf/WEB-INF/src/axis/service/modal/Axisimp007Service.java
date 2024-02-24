package axis.service.modal;

import java.math.BigDecimal;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.jdbc.PAC_IAX_SIN_IMPUESTOS;
import axis.mvc.control.modal.Axisimp007Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AjaxContainerService;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

/**
 * Axisimp007Service.java
 * 
 * @author <a href="rkirchner@csi-ti.com">Roger Kirchner</a> 19/12/2008
 * @since Java 5.0
 */
public class Axisimp007Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE INICIALIZACION
	 *******************************************/
	/*********************************************************************************************************************/

	/**
	 * 
	 * @param request
	 */
	@SuppressWarnings("all")
	public void m_form(HttpServletRequest request, Axisimp007Action thisAction) {
		logger.debug("Axisimp007Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		PAC_IAX_LISTVALORES pac_axis_listValores = new PAC_IAX_LISTVALORES(
				(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

		try {

			BigDecimal CCONCEP = getCampoNumerico(request, "CCONCEP");
			formdata.put("CCONCEP", CCONCEP);

			// Recuperar lista de conceptos
			Map map = new PAC_IAX_SIN_IMPUESTOS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_SIN_IMPUESTOS__F_GET_LSTIMPUESTOS();
			logger.debug(map);
			formdata.put("LSTIMPUESTOS", tratarRETURNyMENSAJES(request, map));

			map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_GET_TIPPERSON();
			logger.debug(map);
			formdata.put("tipPerson", (List) tratarRETURNyMENSAJES(request, map));

			BigDecimal CTIPPER = getCampoNumerico(request, "CTIPPER");
			// Tipo de Persona Relacionada
			if (CTIPPER != null) {
				map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_GET_REGIMENFISCAL(CTIPPER);
				logger.debug(map);
				formdata.put("regFisc", (List) tratarRETURNyMENSAJES(request, map));

				BigDecimal CREGFISCAL = getCampoNumerico(request, "CREGFISCAL");
				formdata.put("CREGFISCAL", CREGFISCAL);
			}

			map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(1098));
			logger.debug("+++++LSTCTIPCAL: " + map);
			List LSTCTIPCAL = (List) tratarRETURNyMENSAJES(request, map, false);
			formdata.put("LSTCTIPCAL", LSTCTIPCAL);

			map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(1097));
			logger.debug("+++++LSTCBASECAL: " + map);
			List LSTCBASECAL = (List) tratarRETURNyMENSAJES(request, map, false);
			formdata.put("LSTCBASECAL", LSTCBASECAL);

			map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(1136));
			logger.debug("+++++LSTCLAVES: " + map);
			List LSTCLAVES = (List) tratarRETURNyMENSAJES(request, map, false);
			formdata.put("LSTCLAVES", LSTCLAVES);

			String MODO = this.getCampoTextual(request, "MODO");
			formdata.put("MODO", MODO);

			BigDecimal RECARGAR = new BigDecimal(1);

			if (request.getParameter("RECARGAR") != null) {
				RECARGAR = new BigDecimal(request.getParameter("RECARGAR"));
				formdata.put("RECARGAR", RECARGAR);
			}

			logger.debug("++++RECARGAR: " + RECARGAR);

			if (MODO != null) {
				if (MODO.equalsIgnoreCase("modificar") && !RECARGAR.equals(new BigDecimal(0))) {
					CCONCEP = new BigDecimal(request.getParameter("CCONCEP"));
					BigDecimal pCCODIMP = new BigDecimal(request.getParameter("CCODIMP"));
					BigDecimal pNORDIMP = new BigDecimal(request.getParameter("NORDIMP"));

					PAC_IAX_SIN_IMPUESTOS pac_iax_sin_impuestos = new PAC_IAX_SIN_IMPUESTOS(
							(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

					map = pac_iax_sin_impuestos.ejecutaPAC_IAX_SIN_IMPUESTOS__F_GET_IMPUESTO(CCONCEP, pCCODIMP,
							pNORDIMP);
					logger.debug("++++IMPUESTO: " + map);

					List l = (ArrayList) tratarRETURNyMENSAJES(request, map, false);
					Map m = (Map) l.get(0);

					/*
					 * formdata.put("CCODIMP",(BigDecimal)m.get("CCODIMP"));
					 * logger.debug("CCODIMP: "+m.get("CCODIMP"));
					 */

					formdata.put("TCONCEP", (String) m.get("TCONCEP"));
					logger.debug("TCONCEP: " + m.get("TCONCEP"));

					// formdata.put("NORDIMP",pNORDIMP);

					formdata.put("FDESDE", (Date) m.get("FVIGOR"));
					logger.debug("FDESDE: " + m.get("FVIGOR"));

					formdata.put("CTIPPER", (BigDecimal) m.get("CTIPPER"));
					logger.debug("CTIPPER: " + m.get("CTIPPER"));

					Map map2 = pac_axis_listValores
							.ejecutaPAC_IAX_LISTVALORES__F_GET_REGIMENFISCAL((BigDecimal) m.get("CTIPPER"));
					logger.debug(map2);
					formdata.put("regFisc", (List) tratarRETURNyMENSAJES(request, map2));

					formdata.put("CREGFIS", m.get("CREGFISCAL"));
					logger.debug("CREGFIS: " + m.get("CREGFISCAL"));

					if (((BigDecimal) m.get("CTIPCAL")).equals(new BigDecimal(1))) {
						logger.debug("CTIPCAL: " + 1);
						formdata.put("CTIPCAL", new BigDecimal(1));

						formdata.put("IFIJO", (BigDecimal) m.get("IFIJO"));
						logger.debug("IFIJO: " + m.get("IFIJO"));
					} else if (((BigDecimal) m.get("CTIPCAL")).equals(new BigDecimal(2))) {
						logger.debug("CTIPCAL: " + 2);
						formdata.put("CTIPCAL", new BigDecimal(2));

						formdata.put("CBASECAL", (BigDecimal) m.get("CBASECAL"));
						logger.debug("CBASECAL: " + m.get("CBASECAL"));

						formdata.put("CBASEMIN", (BigDecimal) m.get("CBASEMIN"));
						logger.debug("CBASEMIN: " + m.get("CBASEMIN"));

						formdata.put("CBASEMAX", (BigDecimal) m.get("CBASEMAX"));
						logger.debug("CBASEMAX: " + m.get("CBASEMAX"));

						formdata.put("NPORCEN", (BigDecimal) m.get("NPORCEN"));
						logger.debug("NPORCEN: " + m.get("NPORCEN"));

						formdata.put("IMIN", (BigDecimal) m.get("IMIN"));
						logger.debug("IMIN: " + m.get("IMIN"));

						formdata.put("IMAX", (BigDecimal) m.get("IMAX"));
						logger.debug("IMAX: " + m.get("IMAX"));
					} else if (((BigDecimal) m.get("CTIPCAL")).equals(new BigDecimal(3))) {
						logger.debug("CTIPCAL: " + 3);
						formdata.put("CTIPCAL", new BigDecimal(3));

						formdata.put("CSUBTAB", (BigDecimal) m.get("CSUBTAB"));
						logger.debug("CSUBTAB: " + m.get("CSUBTAB"));

						formdata.put("TSUBTABLA", (String) m.get("TSUBTABLA"));
						logger.debug("TSUBTABLA: " + m.get("TSUBTABLA"));
					}
				} else {
					String TCONCEP = getCampoTextual(request, "TCONCEP");
					formdata.put("TCONCEP", TCONCEP);
				}
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisimp007Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE ACTUALIZACI�N
	 ********************************************/
	/*********************************************************************************************************************/

	/**
	 * 
	 * @param request
	 */
	@SuppressWarnings("all")
	public void m_aceptar(HttpServletRequest request, Axisimp007Action thisAction) {
		logger.debug("Axisimp007Service m_aceptar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {

			BigDecimal pCCONCEP = getCampoNumerico(request, "CCONCEP");
			BigDecimal pCCODIMP = getCampoNumerico(request, "CCODIMP");
			BigDecimal pNORDIMP = getCampoNumerico(request, "NORDIMP");
			Date pFDESDE = this.stringToSqlDate(this.getCampoTextual(request, "FDESDE"));
			BigDecimal pCTIPPER = getCampoNumerico(request, "CTIPPER");
			BigDecimal pCREGFISCAL = getCampoNumerico(request, "CREGFISCAL");
			BigDecimal pCTIPCAL = getCampoNumerico(request, "CTIPCAL");
			BigDecimal pIFIJO = getCampoNumerico(request, "IFIJO");
			BigDecimal pCBASECAL = getCampoNumerico(request, "CBASECAL");
			BigDecimal pCBASEMIN = getCampoNumerico(request, "CBASEMIN");
			BigDecimal pCBASEMAX = getCampoNumerico(request, "CBASEMAX");
			BigDecimal pNPORCENT = getCampoNumerico(request, "NPORCENT");
			BigDecimal pIMIN = getCampoNumerico(request, "IMIN");
			BigDecimal pIMAX = getCampoNumerico(request, "IMAX");
			BigDecimal pCSUBTAB = getCampoNumerico(request, "CSUBTAB");

			String MODO = this.getCampoTextual(request, "MODO");
			formdata.put("MODO", MODO);

			if (MODO != null) {
				if (!MODO.equalsIgnoreCase("modificar")) {
					pNORDIMP = null;
				}
			}

			PAC_IAX_SIN_IMPUESTOS pac_iax_sin_impuestos = new PAC_IAX_SIN_IMPUESTOS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			Map map = pac_iax_sin_impuestos.ejecutaPAC_IAX_SIN_IMPUESTOS__F_SET_IMPUESTO(pCCONCEP, pCCODIMP, pFDESDE,
					pCTIPPER, pCREGFISCAL, pCTIPCAL, pIFIJO, pCBASECAL, pCBASEMIN, pCBASEMAX, pNPORCENT, pIMIN, pIMAX,
					pNORDIMP, pCSUBTAB);
			logger.debug(map);
			request.setAttribute("grabarOK", tratarRETURNyMENSAJES(request, map));

		} catch (Exception e) {
			logger.error("Error en el servicio Axisimp007Service - m�todo m_aceptar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	public void m_ajax_buscar_subtab(HttpServletRequest request) {
		logger.debug("Axisimp007Service m_ajax_buscar_subtab");
		AjaxContainerService ajax = new AjaxContainerService();

		try {
			ajax.guardarContenidoFinalAContenedorAjax(this.buscaSubtab(request));
		} catch (Exception e) {
			logger.error("Error en el servicio Axisimp007Service - m�todo m_ajax_buscar_subtab", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	private List buscaSubtab(HttpServletRequest request) throws Exception {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		AjaxContainerService ajax = new AjaxContainerService();

		PAC_IAX_SIN_IMPUESTOS pac_iax_sin_impuestos = new PAC_IAX_SIN_IMPUESTOS(
				(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

		BigDecimal CSUBTAB = getCampoNumerico(request, "CSUBTAB");
		logger.debug("---------- VALOR subtabla  :" + CSUBTAB);

		Map map = pac_iax_sin_impuestos.ejecutaPAC_IAX_SIN_IMPUESTOS__F_GET_TDESCRI_SUBTAB(CSUBTAB);
		logger.debug("++++map csubtab " + map);

		List listaSubtab = (List) ajax.rellenarPlAContenedorAjax(map);

		logger.debug("++++SUBTAB " + listaSubtab);
		return listaSubtab;
	}
}
