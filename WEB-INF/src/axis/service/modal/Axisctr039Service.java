package axis.service.modal;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_GESTIONBPM;
import axis.jdbc.PAC_IAX_SUPLEMENTOS;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.control.modal.Axisctr039Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AjaxContainerService;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

public class Axisctr039Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE INICIALIZACION
	 *******************************************/
	/*********************************************************************************************************************/

	/**
	 * M�todo que carga el detalle del riesgo asegurado.
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_form(HttpServletRequest request, Axisctr039Action thisAction) {
		logger.debug("Axisctr039Service m_form");

		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		try {
			String CMODO = getCampoTextual(request, "CMODO");
			logger.debug("CMODO : " + CMODO);
			AbstractDispatchAction.topPila(request, "CMODO", CMODO);
			Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

			BigDecimal pPCMOTMOV = (BigDecimal) AbstractDispatchAction.topPila(request, "CMOTMOV");

			if (pPCMOTMOV != null) {
				Map map2 = new PAC_IAX_SUPLEMENTOS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_SUPLEMENTOS__F_GET_DESCMOTMOV(pPCMOTMOV, usuario.getCidioma());
				formdata.put("PTMOTMOV", map2.get("PTMOTMOV"));
			}
			/*
			 * java.sql.Date PFEFECTO_039 = new java.sql.Date(new
			 * SimpleDateFormat("yyyy-MM-dd") .parse(getCampoTextual(request,
			 * "PFEFECTO")).getTime());
			 */
			java.sql.Date PFEFECTO_039 = stringToSqlDate(getCampoTextual(request, "PFEFECTO"), "yyyy-MM-dd");
			logger.debug("---> PFEFECTO:" + getCampoTextual(request, "PFEFECTO"));
			logger.debug("---> PFEFECTO_039:" + PFEFECTO_039);

			if (isEmpty(PFEFECTO_039)) {
				PFEFECTO_039 = stringToSqlDate(getCampoTextual(request, "PFEFECTO"), "dd/MM/yyyy");
				logger.debug("--->2 PFEFECTO_039:" + PFEFECTO_039);
				request.setAttribute("PFEFECTO_039", PFEFECTO_039);
			} else {
				logger.debug("--->3 PFEFECTO_039:" + PFEFECTO_039);
				request.setAttribute("PFEFECTO_039", PFEFECTO_039);
			}
			formdata.put("PFEFECTO_039", getCampoTextual(request, "PFEFECTO"));

			BigDecimal NCERTIF = getCampoNumerico(request, "NCERTIF");
			BigDecimal NPOLIZA = getCampoNumerico(request, "NPOLIZA");
			BigDecimal SPRODUC = getCampoNumerico(request, "SPRODUC");
			logger.debug("---> NPOLIZA:" + NPOLIZA + " NCERTIF:" + NCERTIF);
			formdata.put("NCERTIF", NCERTIF);
			formdata.put("NPOLIZA", NPOLIZA);
			formdata.put("SPRODUC", SPRODUC);

			BigDecimal PRIMERAVEZ = getCampoNumerico(request, "PRIMERAVEZ");

			if (!isEmpty(NPOLIZA) && isEmpty(PRIMERAVEZ)) {

				formdata.put("PRIMERAVEZ", new BigDecimal(1));
				// Map map = new
				// PAC_IAX_GESTIONBPM((java.sql.Connection)request.getAttribute(Constantes.DB01CONN)).ejecutaPAC_IAX_GESTIONBPM__F_GET_CASOSUPL(NPOLIZA,NCERTIF);
				Map map = new PAC_IAX_GESTIONBPM((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_GESTIONBPM__F_GET_CASO_BPM(NPOLIZA, NCERTIF, "SUPLEMENTO");
				logger.debug(map);
				tratarRETURNyMENSAJES(request, map);

				HashMap CASOBPM = (HashMap) map.get("PCASOBPM");

				if (!isEmpty(CASOBPM)) {
					formdata.put("NCASO_BPM", CASOBPM.get("NCASO_BPM"));
					formdata.put("NSOLICI_BPM", CASOBPM.get("NSOLICI_BPM"));
					formdata.put("NOMBRE_NCASO_BPM", CASOBPM.get("TNOMCOM"));
				}

			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr039Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
	}

	public void m_ajax_cargar_casobpm(HttpServletRequest request) {
		logger.debug("Axisctr039Service m_ajax_cargar_casobpm");
		AjaxContainerService ajax = new AjaxContainerService();

		try {
			BigDecimal NCASO_BPM = getCampoNumerico(request, "NCASO_BPM");
			BigDecimal NSOLICI_BPM = getCampoNumerico(request, "NSOLICI_BPM");
			BigDecimal NNUMCASO = getCampoNumerico(request, "NNUMCASO");

			PAC_IAX_GESTIONBPM pac_iax_gestionbpm = new PAC_IAX_GESTIONBPM(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			Map m = pac_iax_gestionbpm.ejecutaPAC_IAX_GESTIONBPM__F_GET_TOMCASO(NNUMCASO, NCASO_BPM, NSOLICI_BPM);
			logger.debug(m);
			ajax.rellenarPlAContenedorAjax(m);
			ajax.guardarContenidoFinalAContenedorAjax(m);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr001Service - m�todo m_ajax_actualizar_agente", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	public void m_aceptar(HttpServletRequest request, Axisctr039Action thisAction) {
		logger.debug("Axisctr039Service m_aceptar");
		try {

			Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
			BigDecimal NCASO_BPM = getCampoNumerico(request, "NCASO_BPM");
			BigDecimal NSOLICI_BPM = getCampoNumerico(request, "NSOLICI_BPM");
			BigDecimal NCERTIF = getCampoNumerico(request, "NCERTIF");
			BigDecimal NPOLIZA = getCampoNumerico(request, "NPOLIZA");
			BigDecimal SPRODUC = getCampoNumerico(request, "SPRODUC");

			PAC_IAX_GESTIONBPM pac_iax_gestionbpm = new PAC_IAX_GESTIONBPM(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			// Map m =
			// pac_iax_gestionbpm.ejecutaPAC_IAX_GESTIONBPM__F_VALIDA_DATOSBPMSUPLE(NCASO_BPM,NSOLICI_BPM);
			Map m = pac_iax_gestionbpm.ejecutaPAC_IAX_GESTIONBPM__F2_VALIDA_DATOSBPM(NCASO_BPM, NSOLICI_BPM, SPRODUC,
					NPOLIZA, NCERTIF, "SUPLEMENTO");
			logger.debug(m);
			tratarRETURNyMENSAJES(request, m);
			if (m.get("RETURN").equals(new BigDecimal(0)))
				formdata.put("OKVal", new BigDecimal(0));

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr039Service - m�todo m_aceptar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));

		}
	}
}
