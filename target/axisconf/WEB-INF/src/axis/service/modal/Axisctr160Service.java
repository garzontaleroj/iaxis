package axis.service.modal;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_PRODUCCION;
import axis.mvc.control.modal.Axisctr160Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AjaxContainerService;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

/**
 * Axisctr160Action.java 20/10/2010
 * 
 * @author <a href="joan_torres@csi-ti.com">Joan Torres</a>
 * @since Java 5.0
 */
public class Axisctr160Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE INICIALIZACION
	 *******************************************/
	/*********************************************************************************************************************/

	/**
	 * M�todo que se llama al inicio de este flujo. Puede servirnos para inicializar
	 * variables.
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_init(HttpServletRequest request, Axisctr160Action thisAction) {
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {

		} catch (Exception e) {
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.configForm(request, whoami(this));
			this.cargaDependencias(request, (List) request.getAttribute("DEPENDENCIAS"));
		}

	}

	/**
	 * 
	 * @param request
	 */
	@SuppressWarnings("all")
	public void m_form(HttpServletRequest request, Axisctr160Action thisAction) {
		logger.debug("Axisctr160Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		try {

			BigDecimal NRIESGO = getCampoNumerico(request, "RiesgoTramo");
			BigDecimal CGARANT = getCampoNumerico(request, "GarantiaTramo");

			Map m = new PAC_IAX_PRODUCCION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_PRODUCCION__F_ALTAREGLASSEG(NRIESGO, CGARANT);
			logger.debug(m);

			m = new PAC_IAX_PRODUCCION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_PRODUCCION__F_LEEDATOSREGLASSEG();
			logger.debug(m);

			request.setAttribute("OB_IAX_REGLASSEG", tratarRETURNyMENSAJES(request, m));

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr160Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {

			this.configForm(request, whoami(this));
			this.cargaDependencias(request, (List) request.getAttribute("DEPENDENCIAS"));
		}
	}

	public void m_ajax_del_detalle(HttpServletRequest request) {
		logger.debug("Axisctr160Service m_ajax_del_detalle");
		AjaxContainerService ajax = new AjaxContainerService();
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {
			BigDecimal PNUMBLOQ = this.getHiddenCampoNumerico(request, "PNUMBLOQ");

			Map m = new PAC_IAX_PRODUCCION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_PRODUCCION__F_GRABARDATOSREGLASSEGTRAMOS(PNUMBLOQ, new BigDecimal(0),
							new BigDecimal(0), new BigDecimal(0), new BigDecimal(0), new BigDecimal(0),
							new BigDecimal(0), new BigDecimal(0), new BigDecimal(0), new BigDecimal(0),
							new BigDecimal(0));
			logger.debug(m);
			ajax.rellenarPlAContenedorAjax(m);

			ajax.guardarContenidoFinalAContenedorAjax(m);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr160Service - m�todo m_ajax_del_detalle", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	public void m_ajax_guardar_detalle(HttpServletRequest request) {
		logger.debug("Axisctr160 m_ajax_guardar_detalle");
		AjaxContainerService ajax = new AjaxContainerService();
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {
			BigDecimal PNUMBLOQ = this.getHiddenCampoNumerico(request, "PNUMBLOQ");
			BigDecimal EDADINI = this.getHiddenCampoNumerico(request, "EDADINI");
			BigDecimal EDADFIN = this.getHiddenCampoNumerico(request, "EDADFIN");
			BigDecimal T1E = this.getHiddenCampoNumerico(request, "T1E");
			BigDecimal T2E = this.getHiddenCampoNumerico(request, "T2E");
			BigDecimal T3E = this.getHiddenCampoNumerico(request, "T3E");
			BigDecimal T4E = this.getHiddenCampoNumerico(request, "T4E");
			BigDecimal T1T = this.getHiddenCampoNumerico(request, "T1T");
			BigDecimal T2T = this.getHiddenCampoNumerico(request, "T2T");
			BigDecimal T3T = this.getHiddenCampoNumerico(request, "T3T");
			BigDecimal T4T = this.getHiddenCampoNumerico(request, "T4T");

			Map m = new PAC_IAX_PRODUCCION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_PRODUCCION__F_GRABARDATOSREGLASSEGTRAMOS(PNUMBLOQ, EDADINI, EDADFIN, T1E, T2E, T3E,
							T4E, T1T, T2T, T3T, T4T);
			logger.debug(m);

			Object[] resultadoAjax = (Object[]) ajax.rellenarPlAContenedorAjax(m, new String[] { "PNSEQ_OUT" });
			try {
				logger.debug(resultadoAjax[0]);
				logger.debug(resultadoAjax[1]);
				logger.debug(resultadoAjax[2]);
				logger.debug(resultadoAjax[3]);
			} catch (Exception e) {
			}
			if (resultadoAjax[0].equals(new BigDecimal(0))) {
				Map PNSEQ_OUT = new HashMap();
				PNSEQ_OUT.put("PNSEQ_OUT", resultadoAjax[1]);
				logger.debug(resultadoAjax[1]);
				List RESULTADO = new ArrayList();
				RESULTADO.add(PNSEQ_OUT);

				ajax.guardarContenidoFinalAContenedorAjax(RESULTADO);
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr160Service - m�todo m_ajax_guardar_detalle", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	public void m_ajax_guardar(HttpServletRequest request) {
		logger.debug("Axisctr160 m_ajax_guardar");
		AjaxContainerService ajax = new AjaxContainerService();
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {
			BigDecimal LMINEMP = this.getHiddenCampoNumerico(request, "LMINEMP");
			BigDecimal LMINTRA = this.getHiddenCampoNumerico(request, "LMINTRA");
			BigDecimal LMAXEMP = this.getHiddenCampoNumerico(request, "LMAXEMP");
			BigDecimal LMAXTRA = this.getHiddenCampoNumerico(request, "LMAXTRA");

			Map m = new PAC_IAX_PRODUCCION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_PRODUCCION__F_GRABARDATOSREGLASSEG(LMAXEMP, LMINEMP, LMAXTRA, LMINTRA);
			logger.debug(m);

			Object[] resultadoAjax = (Object[]) ajax.rellenarPlAContenedorAjax(m, new String[] { "PNSEQ_OUT" });
			try {
				logger.debug(resultadoAjax[0]);
				logger.debug(resultadoAjax[1]);
				logger.debug(resultadoAjax[2]);
				logger.debug(resultadoAjax[3]);
			} catch (Exception e) {
			}
			if (resultadoAjax[0].equals(new BigDecimal(0))) {
				Map PNSEQ_OUT = new HashMap();
				PNSEQ_OUT.put("PNSEQ_OUT", resultadoAjax[1]);
				logger.debug(resultadoAjax[1]);
				List RESULTADO = new ArrayList();
				RESULTADO.add(PNSEQ_OUT);

				ajax.guardarContenidoFinalAContenedorAjax(RESULTADO);
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr160Service - m�todo m_ajax_guardar", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	public void m_ajax_new_detalle(HttpServletRequest request) {
		logger.debug("Axisctr160Service m_ajax_new_detalle");
		AjaxContainerService ajax = new AjaxContainerService();
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {
			BigDecimal PNUMBLOQ = this.getHiddenCampoNumerico(request, "PNUMBLOQ");

			Map m = new PAC_IAX_PRODUCCION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_PRODUCCION__F_ALTAREGLASSEGTRAMOS(PNUMBLOQ);
			logger.debug(m);
			ajax.rellenarPlAContenedorAjax(m);
			ajax.guardarContenidoFinalAContenedorAjax(m);
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr160Service - m�todo m_ajax_new_detalle", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

}
