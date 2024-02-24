package axis.service.axis;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FilenameUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_CFG_FILE;
import axis.jdbc.PAC_IAX_GESTIONBPM;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.model.UsuarioBean;
import axis.util.Constantes;

public class Axisadm022Service extends AxisBaseService {
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
		logger.debug("Axisadm022Service m_init");

		try {

		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm022Service - m�todo m_init", e);
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
		logger.debug("Axisadm022Service m_form");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {
			// String FILESERVLET = getCampoTextual(request, "FILESERVLET");
			// request.setAttribute("FILESERVLET", FILESERVLET);

			PAC_IAX_CFG_FILE pac_iax_cfg_file = new PAC_IAX_CFG_FILE(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			Map map1 = pac_iax_cfg_file.ejecutaPAC_IAX_CFG_FILE__F_GET_PROCESOS();
			BigDecimal returnGetProcesos = (BigDecimal) tratarRETURNyMENSAJES(request, map1);
			logger.debug(map1);
			logger.debug(returnGetProcesos);

			if (BigDecimal.ZERO.equals(returnGetProcesos)) {
				List P_TPROCESOS = ((!isEmpty(map1.get("P_TPROCESOS"))) ? (List) map1.get("P_TPROCESOS") : null);
				logger.debug(P_TPROCESOS);
				formdata.put("P_TPROCESOS", P_TPROCESOS);
			}
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm022Service - m�todo m_form", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
	}

	public void m_procesar(HttpServletRequest request) {
		logger.debug("Axisadm022Service m_procesar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();

		try {
			String TFICHERO = FilenameUtils.getName((getCampoTextual(request, "TFICHERO")));
			BigDecimal CPROCESO = getCampoNumerico(request, "CPROCESO");

			BigDecimal NNUMCASO = getCampoNumerico(request, "NNUMCASO");
			BigDecimal NCASO_BPM = getCampoNumerico(request, "NCASO_BPM");

			if (!isEmpty(NNUMCASO) || !isEmpty(NCASO_BPM)) {
				Map m = new PAC_IAX_GESTIONBPM((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_GESTIONBPM__F_VALIDA_DATOSBPMCARGA(NCASO_BPM, NNUMCASO, TFICHERO);
				logger.debug(m);
				if (!BigDecimal.ZERO.equals(tratarRETURNyMENSAJES(request, m))) {
					ajax.rellenarPlAContenedorAjax(m);
					ajax.guardarContenidoFinalAContenedorAjax(m);
					return;
				}
			}

			Map map = new PAC_IAX_CFG_FILE((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_CFG_FILE__F_GET_PROCESO_CARGADO(CPROCESO, TFICHERO);
			logger.debug(map);

			// Esto rellenar� los MENSAJES en pantalla, as� que no nos preocupamos de si el
			// RETURN es 0 � 1
			ajax.rellenarPlAContenedorAjax(map);
			ajax.guardarContenidoFinalAContenedorAjax(map);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm022Service - m�todo m_procesar", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
			this.configSuplementos(request);
		}

	}

	public void m_ajax_cargar_casobpm(HttpServletRequest request) {
		logger.debug("Axisadm022Service m_ajax_cargar_casobpm");
		AjaxContainerService ajax = new AjaxContainerService();

		try {
			BigDecimal NNUMCASO = getCampoNumerico(request, "NNUMCASO");
			BigDecimal NCASO_BPM = getCampoNumerico(request, "NCASO_BPM");

			PAC_IAX_GESTIONBPM pac_iax_gestionbpm = new PAC_IAX_GESTIONBPM(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			Map m = pac_iax_gestionbpm.ejecutaPAC_IAX_GESTIONBPM__F_GET_TOMCASO(NNUMCASO, NCASO_BPM, null);
			logger.debug(m);
			ajax.rellenarPlAContenedorAjax(m);
			ajax.guardarContenidoFinalAContenedorAjax(m);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr001Service - m�todo m_ajax_actualizar_agente", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	public void m_validar(HttpServletRequest request, AbstractDispatchAction thisAction) {
		logger.debug("Axisadm022Service m_validar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {

			BigDecimal NNUMCASO = getCampoNumerico(request, "NNUMCASO2");
			BigDecimal NCASO_BPM = getCampoNumerico(request, "NCASO_BPM2");
			String TFICHERO = getCampoTextual(request, "FICHERO");

			Map m = new PAC_IAX_GESTIONBPM((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_GESTIONBPM__F_VALIDA_DATOSBPMCARGA(NCASO_BPM, NNUMCASO, TFICHERO);
			logger.debug(m);
			if (BigDecimal.ZERO.equals(tratarRETURNyMENSAJES(request, m)))
				formdata.put("OKVal", new BigDecimal(0));
			else
				formdata.put("OKVal", new BigDecimal(1));

			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr001Service - m�todo m_validar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}
}
