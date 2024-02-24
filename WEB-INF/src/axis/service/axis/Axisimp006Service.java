package axis.service.axis;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_SIN_IMPUESTOS;
import axis.mvc.control.axis.Axisimp006Action;
import axis.mvc.model.UsuarioBean;
import axis.util.Constantes;

public class Axisimp006Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	public void m_form(HttpServletRequest request, Axisimp006Action thisAction) {
		logger.debug("Axisimp006Service m_form");
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {
			this.m_load_data(request, thisAction);
		} catch (Exception e) {
			logger.error("Error en el servicio axisimp006Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
			this.gestionarOrdenacionTablas(request);
		}
	}

	public void m_load_data(HttpServletRequest request, Axisimp006Action thisAction) {
		logger.debug("Axisimp006Service m_load_data");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {
			BigDecimal pCCONCEP = this.getCampoNumerico(request, "CCONCEP");

			BigDecimal pCCODIMP = this.getCampoNumerico(request, "CCODIMP");

			if (pCCONCEP == null && request.getParameter("CCONCEP") != null) {
				pCCONCEP = new BigDecimal(request.getParameter("CCONCEP"));
			}

			if (request.getParameter("CCONCEP_new") != null) {
				formdata.put("CCONCEP_new", new BigDecimal(request.getParameter("CCONCEP_new")));
			}

			formdata.put("CCONCEP", pCCONCEP);
			formdata.put("PCCODIMP", pCCODIMP);

			Map map = new PAC_IAX_SIN_IMPUESTOS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_SIN_IMPUESTOS__F_GET_LSTCONCEPTOS();
			logger.debug("+++++LSTCONCEPTO: " + map);
			List LSTCONCEPTO = (List) tratarRETURNyMENSAJES(request, map, false);
			formdata.put("LSTCONCEPTO", LSTCONCEPTO);

			map = new PAC_IAX_SIN_IMPUESTOS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_SIN_IMPUESTOS__F_GET_LSTIMPUESTOS();
			logger.debug(map);
			formdata.put("LSTIMPUESTOS", tratarRETURNyMENSAJES(request, map));

			if (pCCONCEP != null) {
				request.getSession().removeAttribute("axisimp006_listaImpuestos");
				PAC_IAX_SIN_IMPUESTOS PAC_IAX_SIN_IMPUESTOS = new PAC_IAX_SIN_IMPUESTOS(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

				map = PAC_IAX_SIN_IMPUESTOS.ejecutaPAC_IAX_SIN_IMPUESTOS__F_GET_IMPUESTOS(pCCONCEP, pCCODIMP);

				logger.debug(map);

				request.getSession().setAttribute("axisimp006_listaImpuestos",
						(ArrayList) tratarRETURNyMENSAJES(request, map, false));
			}
		} catch (Exception e) {
			logger.error("Error en el servicio axisimp006Service - m�todo m_load_data", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}

	public void m_busqueda_impuestos(HttpServletRequest request, Axisimp006Action thisAction) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);

		try {
			BigDecimal pCCONCEP = getCampoNumerico(request, "CCONCEP");
			BigDecimal pCCODIMP = getCampoNumerico(request, "CCODIMP");
			formdata.put("PCCODIMP", pCCODIMP);

			if (formdata.get("paginar") == null) {
				request.getSession().removeAttribute("axisimp006_listaImpuestos");
				PAC_IAX_SIN_IMPUESTOS PAC_IAX_SIN_IMPUESTOS = new PAC_IAX_SIN_IMPUESTOS(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

				Map map = new HashMap();

				map = PAC_IAX_SIN_IMPUESTOS.ejecutaPAC_IAX_SIN_IMPUESTOS__F_GET_IMPUESTOS(pCCONCEP, pCCODIMP);

				logger.debug(map);

				request.getSession().setAttribute("axisimp006_listaImpuestos",
						(ArrayList) tratarRETURNyMENSAJES(request, map, false));

				this.cargarListas(request);

				formdata.remove("BUSCAR");
			}
		} catch (Exception e) {
			logger.error("Error", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}

		this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
	}

	private void cargarListas(HttpServletRequest request) throws Exception {
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		Map map = new PAC_IAX_SIN_IMPUESTOS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_SIN_IMPUESTOS__F_GET_LSTCONCEPTOS();
		logger.debug("+++++LSTCONCEPTO: " + map);
		List LSTCONCEPTO = (List) tratarRETURNyMENSAJES(request, map, false);
		formdata.put("LSTCONCEPTO", LSTCONCEPTO);

		map = new PAC_IAX_SIN_IMPUESTOS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_SIN_IMPUESTOS__F_GET_LSTIMPUESTOS();
		logger.debug(map);
		formdata.put("LSTIMPUESTOS", tratarRETURNyMENSAJES(request, map));
	}

	public void m_del_impuesto(HttpServletRequest request, Axisimp006Action this1) {
		logger.debug("Axisimp006Service m_del_impuesto");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {
			PAC_IAX_SIN_IMPUESTOS pac_iax_sin_impuestos = new PAC_IAX_SIN_IMPUESTOS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			BigDecimal pCCONCEP = null;
			if (request.getParameter("CCONCEP") != null) {
				pCCONCEP = new BigDecimal(request.getParameter("CCONCEP"));
			}

			BigDecimal pCCODIMP = null;
			if (request.getParameter("CCONCEP") != null) {
				pCCODIMP = new BigDecimal(request.getParameter("CCODIMP"));
			}

			BigDecimal pNORDIMP = this.getCampoNumerico(request, "NORDIMP");

			Map map = pac_iax_sin_impuestos.ejecutaPAC_IAX_SIN_IMPUESTOS__F_DEL_IMPUESTO(pCCONCEP, pCCODIMP, pNORDIMP);
			logger.debug(map);

			if (((BigDecimal) tratarRETURNyMENSAJES(request, map)).intValue() == 0) {
				request.setAttribute("OK", "OK"); // guardamos, etc y no ha habido error
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisimp007Service m_del_estado", e);
			this1.guardarMensaje(request, "1000052", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}
}
