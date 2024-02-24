package axis.service.axis;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.jdbc.PAC_IAX_PROVISIONES;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.model.UsuarioBean;
import axis.util.Constantes;

/**
 * Axispro028Service.java
 * 
 * @author <a href="rkirchner@csi-ti.com">Roger Kirchner</a> 12/11/2008
 * @since Java 5.0
 */
public class Axispro028Service extends AxisBaseService {
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
	public void m_form(HttpServletRequest request) {
		logger.debug("Axispro028Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {
			Map LISTVALORES = new HashMap();

			PAC_IAX_LISTVALORES pacIaxListValores = new PAC_IAX_LISTVALORES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map map = pacIaxListValores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTEMPRESAS();
			logger.debug(map);
			LISTVALORES.put("LSTEMPRESAS", tratarRETURNyMENSAJES(request, map));

			map = pacIaxListValores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTMESES();
			logger.debug(map);
			LISTVALORES.put("LSTMESES", tratarRETURNyMENSAJES(request, map));

			formdata.put("LISTVALORES", LISTVALORES);

		} catch (Exception e) {
			logger.error("Error en el servicio Axispro028Service - m�todo m_form", e);
			AbstractDispatchAction.guardarMensaje(request,
					"verbatim:<b>" + e.getClass().getName() + ":</b> " + e.getLocalizedMessage(),
					new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
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
	public void m_buscar(HttpServletRequest request) {
		logger.debug("Axispro028Service m_buscar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {

			request.getSession().removeAttribute("reportsList");

			BigDecimal CEMPRES = getCampoNumerico(request, "CEMPRES");
			PAC_IAX_PROVISIONES pacIaxProvisiones = new PAC_IAX_PROVISIONES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			Map map = pacIaxProvisiones.ejecutaPAC_IAX_PROVISIONES__F_GET_PROVISIONES_EMP(CEMPRES);
			logger.debug(map);
			request.setAttribute("LSTPROVISIONES", tratarRETURNyMENSAJES(request, map));

			gestionarOrdenacionTablas(request);

		} catch (Exception e) {
			logger.error("Error en el servicio Axispro028Service - m�todo m_buscar", e);
			AbstractDispatchAction.guardarMensaje(request,
					"verbatim:<b>" + e.getClass().getName() + ":</b> " + e.getLocalizedMessage(),
					new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

	/**
	 * 
	 * @param request
	 */
	@SuppressWarnings("all")
	public void m_recargar(HttpServletRequest request) {
		logger.debug("Axispro028Service m_buscar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {

			BigDecimal CEMPRES = getCampoNumerico(request, "CEMPRES");
			PAC_IAX_PROVISIONES pacIaxProvisiones = new PAC_IAX_PROVISIONES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			Map map = pacIaxProvisiones.ejecutaPAC_IAX_PROVISIONES__F_GET_PROVISIONES_EMP(CEMPRES);
			logger.debug(map);
			request.setAttribute("LSTPROVISIONES", tratarRETURNyMENSAJES(request, map));

			gestionarOrdenacionTablas(request);

		} catch (Exception e) {
			logger.error("Error en el servicio Axispro028Service - m�todo m_buscar", e);
			AbstractDispatchAction.guardarMensaje(request,
					"verbatim:<b>" + e.getClass().getName() + ":</b> " + e.getLocalizedMessage(),
					new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

	/**
	 * 
	 * @param request
	 */
	@SuppressWarnings("all")
	public void m_imprimir(HttpServletRequest request) {
		logger.debug("Axispro029Service m_imprimir");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {
			BigDecimal CEMPRES = getCampoNumerico(request, "CEMPRES");
			BigDecimal MES = getCampoNumerico(request, "CMES");
			BigDecimal ANY = getCampoNumerico(request, "CANY");
			BigDecimal CAGENTE = getCampoNumerico(request, "CAGENTE");
			BigDecimal PPREVIO = getCampoNumerico(request, "PPREVIO");
			BigDecimal SUBAGENTE = getCampoNumerico(request, "INCSUBAGENTE");

			// Montar un calendar con MES y A�O
			Calendar cal = Calendar.getInstance();

			cal.set(Calendar.YEAR, ANY.intValue());
			cal.set(Calendar.MONTH, MES.intValue() - 1);
			// Recuperar �ltimo d�a del mes
			cal.set(Calendar.DATE, cal.getActualMaximum(Calendar.DATE));

			// Montar un java.sql.Date con este Calendar
			// java.sql.Date FECHA = new java.sql.Date(cal.getTime().getTime());

			String[] CPROVIS2Print = getCampoTextual(request, "CPROVIS2Print").split("@");

			String[] descPROVIS2Print = getCampoTextual(request, "descPROVIS2Print").split("@");

			List reportsList = new ArrayList();
			request.getSession().removeAttribute("reportsList");

			PAC_IAX_PROVISIONES pacIaxProvisiones = new PAC_IAX_PROVISIONES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			// Recuperamos todas las provisiones a imprimir, y para cada una de ellas,
			// pedimos su report
			for (int i = 0; i < CPROVIS2Print.length; i++) {
				BigDecimal PROVIS = new BigDecimal(CPROVIS2Print[i]);

				Map map = pacIaxProvisiones.ejecutaPAC_IAX_PROVISIONES__F_GET_REPORT_PROVISION(CEMPRES, PPREVIO, PROVIS,
						MES, ANY, CAGENTE, SUBAGENTE);

				logger.debug(map);

				String RETURN_URL = (String) tratarRETURNyMENSAJES(request, map);

				if (isEmpty(map.get("MENSAJES")) && !isEmpty(RETURN_URL)) {
					Map report = new HashMap();
					// Report v�lido
					// Guardamos su URL en HashMap de retorno
					report.put("codigoPROVIS", descPROVIS2Print[i].split(" - ")[0]);
					report.put("descPROVIS", descPROVIS2Print[i].split(" - ")[1]);
					report.put("indiceReport", reportsList.size());
					report.put("URLContext", RETURN_URL.split("[?]")[0]);
					report.put("URLParams", RETURN_URL.split("[?]")[1]);

					reportsList.add(report);
				}

				request.getSession().setAttribute("reportsList", reportsList);
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axispro029Service - m�todo m_aceptar", e);
			AbstractDispatchAction.guardarMensaje(request,
					"verbatim:<b>" + e.getClass().getName() + ":</b> " + e.getLocalizedMessage(),
					new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

	// @SuppressWarnings("all")
	/*
	 * public void m_report_provision(HttpServletRequest request) { List reportsList
	 * = null; String codigoPROVIS = getCampoTextual(request, "codigoPROVIS");
	 * AjaxContainerService ajax = new AjaxContainerService();
	 * 
	 * try {
	 * 
	 * Exception e = new Exception("No existen reports para la provisi�n " +
	 * codigoPROVIS);
	 * 
	 * if (!isEmpty(codigoPROVIS) && !isEmpty(reportsList = (List)
	 * request.getSession().getAttribute("reportsList"))) { Map reportURL =
	 * getObjetoDeLista(reportsList, "codigoPROVIS", codigoPROVIS);
	 * 
	 * if (!isEmpty(reportURL)) { request.getSession().setAttribute("reportURL",
	 * reportURL); } else { throw e; } } else { throw e; } } catch (Exception e) {
	 * logger.
	 * error("Error en el servicio Axisimp005Service - m�todo m_actualizar_combos",
	 * e); ajax.rellenarExcepcionAContenedorAjax(e); } finally {
	 * request.setAttribute(Constantes.AJAXCONTAINER,
	 * ajax.procesarContenedorAjax()); } }
	 */

	/* ********************************************************** */

	public void m_ajax_generar_resultados_map(HttpServletRequest request) {
		logger.debug("Axispro028Service m_ajax_generar_resultados_map");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();
		try {

			String CMAPS = getCampoTextual(request, "CMAPS");
			BigDecimal CEMPRES = getCampoNumerico(request, "CEMPRES");

			request.getSession().removeAttribute("CFICHERO");
			String[] C_FICHERO_OUT = { "FICHERO" };

			// FECHA_CALCULO = "01/"+MES+"/"+ANY;
			BigDecimal ANY = getCampoNumerico(request, "PANY");
			String MES = getCampoTextual(request, "PMES");
			String FECHA_CALCULO = null;
			Calendar cal = new GregorianCalendar(ANY.intValue(), Integer.parseInt(MES) - 1, 1);

			// Get the number of days in that month
			int days = cal.getActualMaximum(Calendar.DAY_OF_MONTH);
			FECHA_CALCULO = days + MES + ANY;
			// CPARAMETROS = FECHA_CALCULO+CPARAMETROS;

			// logger.debug("param:" + CPARAMETROS );

			Map map = new PAC_IAX_PROVISIONES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_PROVISIONES__F_LLAMA_MULTIMAP_PROVIS(CMAPS, FECHA_CALCULO, CEMPRES);
			logger.debug("ejecutaPAC_IAX_PROVISIONES__F_LLAMA_MULTIMAP_PROVIS:" + map);

			ajax.guardarContenidoFinalAContenedorAjax(map);
			System.out.println(ajax.getAjaxContainer());

			Object[] resultadoAjax = (Object[]) ajax.rellenarPlAContenedorAjax(map, C_FICHERO_OUT);

			if (resultadoAjax[0].equals(new BigDecimal(0))) {
				Map resultado = new HashMap();
				resultado.put("VALOR", resultadoAjax[0]);
				if (!isEmpty(resultadoAjax[1])) {
					resultado.put("FICHERO", resultadoAjax[1]);
					request.getSession().setAttribute("CFICHERO", resultadoAjax[1]);
				}

				ajax.guardarContenidoFinalAContenedorAjax(resultado);
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axispro028Service - m�todo m_ajax_generar_resultados_map", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}
}