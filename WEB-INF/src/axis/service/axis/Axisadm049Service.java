package axis.service.axis;

import java.math.BigDecimal;
import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_MAP;
import axis.jdbc.PAC_IAX_PROCESOS;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.control.axis.Axisadm049Action;
import axis.mvc.model.UsuarioBean;
import axis.util.Constantes;

public class Axisadm049Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE INICIALIZACION
	 *******************************************/
	/*********************************************************************************************************************/

	public void m_init(HttpServletRequest request, Axisadm049Action thisAction) {
		logger.debug("Axisadm049Service m_init");
		try {
			m_form(request, thisAction);
		} catch (Exception e) {
			logger.error("Error en el servicio axisadm049Service - m�todo m_init", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

	/**
	 * Comentarios
	 * 
	 * @param request    El HttpServletRequest que contiene la petici�n del cliente
	 *                   web.
	 * @param thisAction Una Action abstracta desde donde se ha invocado el servicio
	 *                   (necesaria para el log).
	 */
	public void m_form(HttpServletRequest request, Axisadm049Action thisAction) {
		logger.debug("Axisadm049Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {
			PAC_IAX_PROCESOS pacIaxPROCESOS = new PAC_IAX_PROCESOS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			HashMap m = null;
			m = (HashMap) AbstractDispatchAction.topPila(request, "m");

			if (!isEmpty(m)) {
				tratarRETURNyMENSAJES(request, m);
				ArrayList axisadm048_lista = (ArrayList) m.get("RETURN");
				formdata.put("axisadm048_lista", axisadm048_lista);
			}
		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm049Service - m�todo m_form", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}

	}

	/**
	 * Carga las cuentas del tomador y las devuelve en modo Ajax.
	 * 
	 * @param request
	 */
	public void m_ajax_busqueda_lineas(HttpServletRequest request) {
		logger.debug("Axisadm049Service m_ajax_busqueda_lineas");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {
			BigDecimal SPROCES = getCampoNumerico(request, "SPROCES");

			PAC_IAX_PROCESOS pac_iax_procesos = new PAC_IAX_PROCESOS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map map = pac_iax_procesos.ejecutaPAC_IAX_PROCESOS__F_SET_CONSULTAPROCESOSLIN(SPROCES);
			logger.debug(map);

			if (!isEmpty(map)) {
				List LSTPROCESOSLIN = (List) tratarRETURNyMENSAJES(request, map);
				ajax.guardarContenidoFinalAContenedorAjax(LSTPROCESOSLIN);
				request.getSession().setAttribute("REC_LSTPROCESOSLIN", LSTPROCESOSLIN);
				formdata.put("REC_LSTPROCESOSLIN", LSTPROCESOSLIN);
			}

			formdata.put("VALOR", SPROCES);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm049Service - m�todo m_ajax_busqueda_lineas", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	public void m_busqueda_lineas(HttpServletRequest request, Axisadm049Action thisAction) {
// Recuperar siniestro a buscar 
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {
// Recuperar par�metros de b�squeda
			BigDecimal SPROCES = getCampoNumerico(request, "SPROCES");

			PAC_IAX_PROCESOS pac_iax_procesos = new PAC_IAX_PROCESOS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map map = pac_iax_procesos.ejecutaPAC_IAX_PROCESOS__F_SET_CONSULTAPROCESOSLIN(SPROCES);
			logger.debug(map);

			if (!isEmpty(map)) {
				List LSTPROCESOSLIN = (List) tratarRETURNyMENSAJES(request, map);
				logger.debug(LSTPROCESOSLIN);
				// ajax.guardarContenidoFinalAContenedorAjax(LSTPROCESOSLIN);
				request.getSession().setAttribute("REC_LSTPROCESOSLIN", LSTPROCESOSLIN);
				formdata.put("REC_LSTPROCESOSLIN", LSTPROCESOSLIN);
			}

			formdata.put("VALOR", SPROCES);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm049Service - m�todo m_busqueda_lineas", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			logger.debug("fin metodo");
			// this.m_cargarValors(request,thisAction);
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}

	/**
	 * M�todo que ejecuta la funci�n de F_GENERAR y prepara el flujo de datos a
	 * devolver via ajax
	 * 
	 * @param request
	 */
	public void m_ajax_generar_resultados_map(HttpServletRequest request) {
		logger.debug("Axisctr049Service m_ajax_generar_resultados_map");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();
		try {

			BigDecimal CIDIOMA = usuario.getCidioma();
			BigDecimal CMAP = BigDecimal.valueOf(365);
			BigDecimal SPROCES = getCampoNumerico(request, "SPROCES");

			String[] C_FICHERO_OUT = { "RETURN" };

			String CPARAMETROS = null;

			String proceso;
			if (SPROCES != null)
				proceso = SPROCES.toString();
			else
				proceso = new String();

			CPARAMETROS = CIDIOMA.toString() + '|' + SPROCES.toString();

			Map map = new PAC_IAX_MAP((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_MAP__F_EJECUTA(CMAP.toString(), CPARAMETROS);

			logger.debug("ejecutaPAC_IAX_MAP__F_EJECUTAR" + map);

			ajax.guardarContenidoFinalAContenedorAjax(map);

			Object[] resultadoAjax = (Object[]) ajax.rellenarPlAContenedorAjax(map, C_FICHERO_OUT);

			if (resultadoAjax[0].equals(new BigDecimal(0))) {
				Map resultado = new HashMap();
				resultado.put("VALOR", resultadoAjax[0]);
				if (!isEmpty(resultadoAjax[1])) {
					resultado.put("FICHERO", resultadoAjax[1]);
					request.setAttribute("CFICHERO", resultadoAjax[1]);
				}
				ajax.guardarContenidoFinalAContenedorAjax(resultado);
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr049Service - m�todo m_ajax_generar_resultados_map", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	/**
	 * 
	 * @param request
	 */
	@SuppressWarnings("all")
	public void m_buscar(HttpServletRequest request, Axisadm049Action thisAction) {
		logger.debug("Axisadm049Service m_buscar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {

			PAC_IAX_PROCESOS pacIaxPROCESOS = new PAC_IAX_PROCESOS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			HashMap m = null;
			BigDecimal SPROCES = getCampoNumerico(request, "SPROCES");
			Date FPROINI = stringToSqlDate(getCampoTextual(request, "FPROINI"));
			String CPROCES = getCampoTextual(request, "CPROCES");
			BigDecimal NERROR = getCampoNumerico(request, "NERROR");
			String CUSUARI = getCampoTextual(request, "CUSUARI");
			BigDecimal EMPRESA = getCampoNumerico(request, "EMPRESA");
			m = pacIaxPROCESOS.ejecutaPAC_IAX_PROCESOS__F_SET_CONSULTAPROCESOSCAB(EMPRESA, SPROCES, FPROINI, CPROCES,
					NERROR, CUSUARI);
			logger.debug("m:" + m);
			thisAction.topPila(request, "m", m);
			tratarRETURNyMENSAJES(request, m);
			ArrayList axisadm048_lista = (ArrayList) m.get("RETURN");
			request.getSession().setAttribute("axisadm048_lista", axisadm048_lista);
			formdata.put("axisadm048_lista", axisadm048_lista);
			formdata.put("FPROINI_", FPROINI);
			formdata.put("CPROCES_", CPROCES);
			formdata.put("NERROR_", NERROR);
			formdata.put("CUSUARI_", CUSUARI);
			formdata.put("EMPRESA_", EMPRESA);
			formdata.put("SPROCES_", SPROCES);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm049Service - m�todo m_buscar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {

			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

}
