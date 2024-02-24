//Revision:# 6Lg1fjFFTc1A4ehrVi6c5A== #
package axis.service.modal;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_COMPANIAS;
import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.jdbc.PAC_IAX_PRODUCCION;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.control.modal.Axiscoa004Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AjaxContainerService;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

/**
 * Axiscoa004Service.java 04/06/2008
 * 
 * @author <a href="rkirchner@csi-ti.com">Roger Kirchner</a>
 * @since Java 5.0
 */
public class Axiscoa004Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE INICIALIZACION
	 *******************************************/

	/*********************************************************************************************************************/
	class

	e_cia_repetido extends Exception {
	}

	/**
	 * 
	 * @param request
	 */
	@SuppressWarnings("all")
	public void m_form(HttpServletRequest request) {
		logger.debug("Axiscoa004Service m_form");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		ArrayList lstcompanias = (ArrayList) request.getSession().getAttribute("LSTCOMPANIAS");
		try {

			PAC_IAX_LISTVALORES pac_iax_listvalores = new PAC_IAX_LISTVALORES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			PAC_IAX_PRODUCCION pac_iax_produccion = new PAC_IAX_PRODUCCION(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			Map map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_COASEGURADORAS();
			List companias = (List) tratarRETURNyMENSAJES(request, map, false);
			formdata.put("companias", companias);

			BigDecimal CTIPCOA = getCampoNumerico(request, "CTIPCOA");
			BigDecimal PLOCCOA1 = getCampoNumerico(request, "PLOCCOA1");
			String CARGAR = getCampoTextual(request, "CARGAR");

			formdata.put("CTIPCOA", CTIPCOA);
			formdata.put("PLOCCOA1", PLOCCOA1);

			logger.debug("---> CARGAR:" + CARGAR);
			if (!isEmpty(CARGAR) && CARGAR.equals("true")) {
				map = pac_iax_produccion.ejecutaPAC_IAX_PRODUCCION__F_LEEDETCOASEGURO();
				logger.debug("---> cuadro:" + map);
				tratarRETURNyMENSAJES(request, map);
				HashMap m = (HashMap) map.get("RETURN");
				logger.debug("---> m:" + m);
				if (!isEmpty(m)) {
					ArrayList lstcompanias2 = (ArrayList) m.get("COACEDIDO");
					if (isEmpty(lstcompanias)) {
						request.getSession().setAttribute("LSTCOMPANIAS", lstcompanias2);
					}
				}
			}

			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));

		} catch (Exception e) {
			logger.error("Error en el servicio Axiscoa004Service - m�todo m_form", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
	}

	public void m_buscar_cia(HttpServletRequest request, Axiscoa004Action thisAction) {
		logger.debug("Axiscoa004Service m_buscar_cia");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {

			PAC_IAX_COMPANIAS pac_iax_companias = new PAC_IAX_COMPANIAS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			// Exception e_cia_repetido;
			BigDecimal CCOMPANIA = getCampoNumerico(request, "CCOMPANIA");
			String TCOMPANIA = getCampoTextual(request, "TCOMPANIA");

			ArrayList lstcompanias = (ArrayList) request.getSession().getAttribute("LSTCOMPANIAS");
			if (isEmpty(lstcompanias)) {
				lstcompanias = new ArrayList();
			} else {
				HashMap r = new HashMap();
				for (int i = 0; i < lstcompanias.size(); i++) {
					r = (HashMap) lstcompanias.get(i);
					HashMap rr = (HashMap) r.get("OB_IAX_COACEDIDO");
					logger.debug("---> rr:" + rr);
					BigDecimal ccompania = (BigDecimal) rr.get("CCOMPAN");
					if (ccompania.equals(CCOMPANIA)) {
						throw new e_cia_repetido();

					}
				}
			}

			if (!isEmpty(CCOMPANIA)) {

				Map m = pac_iax_companias.ejecutaPAC_IAX_COMPANIAS__F_GET_COMPANIA(CCOMPANIA, null, null);
				logger.debug("----> compa�ia:" + m);

				Map OB_IAX_COACEDIDO = new HashMap();
				Map compani = new HashMap();
				compani.put("CCOMPAN", CCOMPANIA);
				compani.put("TCOMPAN", TCOMPANIA);
				compani.put("PCESCOA", null);
				compani.put("PCOMCON", null);

				BigDecimal firstPCOMGAS = getCampoNumerico(request, "firstPCOMGAS");
				if (firstPCOMGAS != null) {
					compani.put("PCOMGAS", firstPCOMGAS);
				} else {
					compani.put("PCOMGAS", (BigDecimal) ((HashMap) (m.get("RETURN"))).get("GASTDEF"));
				}
				compani.put("PCOMCOA", null);
				logger.debug("compani: " + compani);
				OB_IAX_COACEDIDO.put("OB_IAX_COACEDIDO", compani);
				lstcompanias.add(OB_IAX_COACEDIDO);
				logger.debug("lstcompanias: " + lstcompanias);
			}

			request.getSession().setAttribute("LSTCOMPANIAS", lstcompanias);

			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));

		} catch (e_cia_repetido ex) {
			thisAction.guardarMensaje(request, "9904147", new Object[] { null }, Constantes.MENSAJE_ERROR);
		} catch (Exception e) {
			logger.error("Error en el servicio Axiscoa0045Service - m�todo m_buscar_cia", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

	public void m_cancelar(HttpServletRequest request, Axiscoa004Action thisAction) {
		logger.debug("Axiscoa004Service m_buscar_cia");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {

			request.getSession().removeAttribute("LSTCOMPANIAS");

		} catch (Exception e) {
			logger.error("Error en el servicio Axiscoa0045Service - m�todo m_cancelar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

	public void m_ajax_insertval(HttpServletRequest request) {
		logger.debug("Axiscoa004Service m_ajax_insertval");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();
		try {

			BigDecimal CCOMPANIA = getCampoNumerico(request, "CCOMPANIA");
			String campo = getCampoTextual(request, "CAMPO");
			BigDecimal valor = getCampoNumerico(request, "VALOR");

			ArrayList lstcompanias = (ArrayList) request.getSession().getAttribute("LSTCOMPANIAS");
			logger.debug("---> lstcompanias:" + lstcompanias);
			if (!isEmpty(lstcompanias)) {

				HashMap r = new HashMap();
				for (int i = 0; i < lstcompanias.size(); i++) {
					r = (HashMap) lstcompanias.get(i);
					HashMap rr = (HashMap) r.get("OB_IAX_COACEDIDO");
					logger.debug("---> rr:" + rr);
					BigDecimal ccompania = (BigDecimal) rr.get("CCOMPAN");
					if (ccompania.equals(CCOMPANIA)) {
						rr.put(campo, valor);
						Map OB_IAX_COACEDIDO = new HashMap();
						OB_IAX_COACEDIDO.put("OB_IAX_COACEDIDO", rr);
						lstcompanias.set(i, OB_IAX_COACEDIDO);
						logger.debug("---> lstcompanias:" + lstcompanias);
					}
				}
			}

			request.getSession().setAttribute("LSTCOMPANIAS", lstcompanias);
			ajax.guardarContenidoFinalAContenedorAjax(lstcompanias);
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr004Service - m�todo m_ajax_insertval", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	public void m_borrar_cia(HttpServletRequest request, Axiscoa004Action thisAction) {
		logger.debug("Axiscoa004Service m_buscar_cia");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {

			PAC_IAX_PRODUCCION pac_iax_produccion = new PAC_IAX_PRODUCCION(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			BigDecimal CCOMPANIA = getCampoNumerico(request, "CCOMPANIA");

			ArrayList lstcompanias = (ArrayList) request.getSession().getAttribute("LSTCOMPANIAS");
			if (!isEmpty(lstcompanias)) {
				logger.debug("---> lstcompanias:" + lstcompanias);
				HashMap r = new HashMap();
				for (int i = 0; i < lstcompanias.size(); i++) {
					r = (HashMap) lstcompanias.get(i);
					HashMap rr = (HashMap) r.get("OB_IAX_COACEDIDO");
					logger.debug("---> rr:" + rr);
					BigDecimal ccompania = (BigDecimal) rr.get("CCOMPAN");
					logger.debug("---> ccompania:" + ccompania + " CCOMPANIA:" + CCOMPANIA);
					if (ccompania.equals(CCOMPANIA)) {
						lstcompanias.remove(i);
						Map m = pac_iax_produccion.ejecutaPAC_IAX_PRODUCCION__F_BORRARDETCUADROCOASEGURO(CCOMPANIA);
						logger.debug(m);
						tratarRETURNyMENSAJES(request, m);
						break;
					}
				}
				logger.debug("---> lstcompanias:" + lstcompanias);
				if (isEmpty(lstcompanias)) {
					formdata.put("BORRADO", 1);
				}
			}

			request.getSession().setAttribute("LSTCOMPANIAS", lstcompanias);
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));

		}

		catch (Exception e) {
			logger.error("Error en el servicio Axiscoa0045Service - m�todo m_buscar_cia", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

	public void m_guardarcuadro(HttpServletRequest request, Axiscoa004Action thisAction) {
		logger.debug("Axiscoa004Service m_guardarcuadro");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {

			PAC_IAX_PRODUCCION pac_iax_produccion = new PAC_IAX_PRODUCCION(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			ArrayList lstcompanias = (ArrayList) request.getSession().getAttribute("LSTCOMPANIAS");
			if (!isEmpty(lstcompanias)) {

				HashMap r = new HashMap();
				Map map = new HashMap();

				BigDecimal PTIPOCOA = getCampoNumerico(request, "CTIPCOA");
				request.getSession().setAttribute("CTIPCOA", PTIPOCOA);
				BigDecimal PCTLOCAL = getCampoNumerico(request, "PLOCCOA1");

				map = pac_iax_produccion.ejecutaPAC_IAX_PRODUCCION__F_GRABACUADROCOASEGURO(PTIPOCOA, PCTLOCAL, null,
						null, null);
				tratarRETURNyMENSAJES(request, map);
				logger.debug("---> lstcompanias:" + lstcompanias);

				for (int i = 0; i < lstcompanias.size(); i++) {

					r = (HashMap) lstcompanias.get(i);
					logger.debug("---> r:" + r);
					HashMap rr = (HashMap) r.get("OB_IAX_COACEDIDO");
					logger.debug("---> rr:" + rr);
					BigDecimal PCCOMPAN = (BigDecimal) (rr.get("CCOMPAN"));
					BigDecimal PCESCOA = (BigDecimal) (rr.get("PCESCOA"));
					BigDecimal PCOMCOA = (BigDecimal) (rr.get("PCOMCOA"));
					BigDecimal PCOMCON = (BigDecimal) (rr.get("PCOMCON"));
					BigDecimal PCOMGAS = (BigDecimal) (rr.get("PCOMGAS"));

					map = pac_iax_produccion.ejecutaPAC_IAX_PRODUCCION__F_GRABADETCUADROCOASEGURO(PCCOMPAN, PCESCOA,
							PCOMCOA, PCOMCON, PCOMGAS);
					logger.debug(map);
					tratarRETURNyMENSAJES(request, map);
					if (map.get("RETURN").equals(new BigDecimal(1))) {
						formdata.put("OK", new BigDecimal(1));
						break;
					} else {
						formdata.put("OK", new BigDecimal(0));
					}
				}
			} else {

				Map map = new HashMap();

				BigDecimal PTIPOCOA = getCampoNumerico(request, "CTIPCOA");
				BigDecimal PCTLOCAL = getCampoNumerico(request, "PLOCCOA1");

				map = pac_iax_produccion.ejecutaPAC_IAX_PRODUCCION__F_GRABACUADROCOASEGURO(PTIPOCOA, PCTLOCAL, null,
						null, null);
				tratarRETURNyMENSAJES(request, map);
				logger.debug("---> lstcompanias:" + lstcompanias);
				if (map.get("RETURN").equals(new BigDecimal(1))) {
					formdata.put("OK", new BigDecimal(1));
				} else {
					formdata.put("OK", new BigDecimal(0));
				}
			}

			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));

		}

		catch (Exception e) {
			logger.error("Error en el servicio Axiscoa0045Service - m�todo m_buscar_cia", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}
}
