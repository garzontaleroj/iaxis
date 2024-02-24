package axis.service.modal;

import java.math.BigDecimal;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FilenameUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_CFG_FILE;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AjaxContainerService;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

public class Axisadm093Service extends AxisBaseService {
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
	public void m_init(HttpServletRequest request) {
		logger.debug("Axisadm093Service m_init");

		try {

		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm093Service - m�todo m_init", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
	}

	/**
	 * 
	 * @param request
	 */
	@SuppressWarnings("all")
	public void m_form(HttpServletRequest request) {
		logger.debug("Axisadm093Service m_form");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {
			// String FILESERVLET = getCampoTextual(request, "FILESERVLET");
			// request.setAttribute("FILESERVLET", FILESERVLET);

			BigDecimal SSEGURO = this.getCampoNumerico(request, "SSEGURO");
			BigDecimal NRIESGO = this.getCampoNumerico(request, "NRIESGO");
			BigDecimal NMOVIMI = this.getCampoNumerico(request, "NMOVIMI");
			BigDecimal CPREGUN = this.getCampoNumerico(request, "CPREGUN");
			BigDecimal CGARANT = this.getCampoNumerico(request, "CGARANT");

			formdata.put("SSEGURO", SSEGURO);
			formdata.put("NRIESGO", NRIESGO);
			formdata.put("NMOVIMI", NMOVIMI);
			formdata.put("CPREGUN", CPREGUN);
			formdata.put("CGARANT", CGARANT);

			BigDecimal FicheroOK = (BigDecimal) request.getAttribute("FicheroOK");
			logger.debug("--- FicheroOK:" + FicheroOK);
			formdata.put("FicheroOK", FicheroOK);

			BigDecimal P_SPROCESSAL = (BigDecimal) request.getAttribute("P_SPROCESSAL");
			formdata.put("P_SPROCESSAL", P_SPROCESSAL);
			logger.debug("--- P_SPROCESSAL:" + P_SPROCESSAL);

			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm093Service - m�todo m_form", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
	}

	public void m_procesar(HttpServletRequest request) {
		logger.debug("Axisadm093Service m_procesar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();

		try {
			String TFICHERO = FilenameUtils.getName((getCampoTextual(request, "TFICHERO")));
			BigDecimal CPROCESO = getCampoNumerico(request, "CPROCESO");

			/*
			 * Map map=new
			 * PAC_IAX_CARGA_PREGUNTAB((java.sql.Connection)request.getAttribute(Constantes.
			 * DB01CONN)).ejecutaPAC_IAX_CARGA_PREGUNTAB__F_EJECUTAR_CARGA_PREGUNTAB(
			 * TFICHERO,TFICHERO,null, SSEGURO, NRIESGO, CGARANT, CPREGUN, NMOVIMI, new
			 * String("EST"));
			 */

			Map map = new PAC_IAX_CFG_FILE((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_CFG_FILE__F_GET_PROCESO_CARGADO(CPROCESO, TFICHERO);
			logger.debug(map);

			// Esto rellenar� los MENSAJES en pantalla, as� que no nos preocupamos de si el
			// RETURN es 0 � 1
			ajax.rellenarPlAContenedorAjax(map);
			ajax.guardarContenidoFinalAContenedorAjax(map);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm093Service - m�todo m_procesar", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
			// this.configSuplementos(request);
		}

	}

}
