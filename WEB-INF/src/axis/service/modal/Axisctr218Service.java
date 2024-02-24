package axis.service.modal;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAXPAR_PRODUCTOS;
import axis.jdbc.PAC_IAX_CARGA_PREGUNTAB;
import axis.jdbc.PAC_IAX_PRODUCCION;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.control.modal.Axisctr218Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AjaxContainerService;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

public class Axisctr218Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	// f_get_detallegarantia
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
	public void m_init(HttpServletRequest request, Axisctr218Action thisAction) {
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		try {

			request.getSession().removeAttribute("cabecera");

		} catch (Exception e) {
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}

	}

	/**
	 * 
	 * @param request
	 */
	@SuppressWarnings("all")
	public void m_form(HttpServletRequest request, Axisctr218Action thisAction) {
		logger.debug("Axiscrt218Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {
			BigDecimal CPREGUN = this.getHiddenCampoNumerico(request, "CPREGUN");
			String TPREGUN = this.getCampoTextual(request, "TPREGUN");
			formdata.put("CPREGUN", CPREGUN);
			formdata.put("TPREGUN", TPREGUN);
			logger.debug("---> CPREGUN:" + CPREGUN + " TPREGUN:" + TPREGUN);

			BigDecimal NRIESGO = getCampoNumerico(request, "NRIESGO");

			BigDecimal SSEGURO = getCampoNumerico(request, "SSEGURO");
			logger.debug("---> SSEGURO:" + SSEGURO);
			if (isEmpty(SSEGURO)) {
				SSEGURO = (BigDecimal) AbstractDispatchAction.topPila(request, "SSEGURO");
			}
			logger.debug("2---> SSEGURO:" + SSEGURO);
			formdata.put("SSEGURO", SSEGURO);

			BigDecimal SPRODUC = getCampoNumerico(request, "SPRODUC");
			logger.debug("---> SPRODUC:" + SPRODUC);
			if (isEmpty(SPRODUC)) {
				SPRODUC = (BigDecimal) AbstractDispatchAction.topPila(request, "SPRODUC");
			}
			logger.debug("2---> SPRODUC:" + SPRODUC);
			formdata.put("SPRODUC", SPRODUC);

			BigDecimal NMOVIMI = getCampoNumerico(request, "NMOVIMI");
			if (isEmpty(NMOVIMI)) {
				NMOVIMI = (BigDecimal) AbstractDispatchAction.topPila(request, "NMOVIMI");
			}

			BigDecimal SPROCES = getCampoNumerico(request, "SPROCES");
			if (isEmpty(SPROCES))
				SPROCES = (BigDecimal) request.getAttribute("SPROCES");

			formdata.put("SPROCES", SPROCES);
			logger.debug("--->SPROCES:" + SPROCES);

			if (isEmpty(NRIESGO)) {
				NRIESGO = (BigDecimal) AbstractDispatchAction.topPila(request, "NRIESGO");
			}

			BigDecimal CGARANT = this.getHiddenCampoNumerico(request, "CGARANT");// Nom�s si estem a preguntes de
																					// garantia
			String TIPO = this.getCampoTextual(request, "TIPO_PREGUNTA");

			Map map = new PAC_IAXPAR_PRODUCTOS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAXPAR_PRODUCTOS__F_GET_CABECERA_PREGUNTAB(TIPO, CPREGUN, CGARANT);
			logger.debug(map);
			formdata.put("lstcabecera", this.tratarRETURNyMENSAJES(request, map));

			String CTABLA = this.getCampoTextual(request, "CTABLA");
			formdata.put("CTABLA", CTABLA);

			String ORIGEN = this.getCampoTextual(request, "ORIGEN");
			logger.debug("--- ORIGEN:" + ORIGEN);

			if (!isEmpty(ORIGEN)) {
				if (ORIGEN.equals(new String("AXISCTR009")) || ORIGEN.equals(new String("AXISCTR030"))
						|| ORIGEN.equals(new String("AXISCTR020"))) {
					AbstractDispatchAction.topPila(request, "CMODO", "CONSULTA");
					formdata.put("MODO", "CONSULTA");
				}
			}

			map = new PAC_IAX_CARGA_PREGUNTAB((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_CARGA_PREGUNTAB__F_GET_PREGUNTAB_RIE(CTABLA, SSEGURO, NRIESGO, CPREGUN, CGARANT,
							NMOVIMI, TIPO, SPRODUC);
			logger.debug(map);

			if (isEmpty(SPROCES))
				SPROCES = (BigDecimal) map.get("PSPROCES_OUT");

			logger.debug("----> PSPROCES_OUT:" + SPROCES);
			formdata.put("SPROCES", SPROCES);

			// Map map3=new
			// PAC_IAX_PRODUCCION((java.sql.Connection)request.getAttribute(Constantes.DB01CONN)).ejecutaPAC_IAX_PRODUCCION__F_GET_PREGUNTAB(TIPO,NRIESGO,CGARANT,CPREGUN);
			// logger.debug(map3);

			// si se ha producido algun aviso elimina las lineas a�adidas.
			ArrayList aviso = (ArrayList) request.getAttribute("PLSTAVISOS");
			logger.debug(aviso);

			if (aviso != null && aviso.size() > 0) {
				Map map2 = new PAC_IAX_PRODUCCION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_PRODUCCION__F_DEL_PREGUNTASTAB(TIPO, NRIESGO, CPREGUN, CGARANT, null);
				logger.debug(map2);
			}
			// contiene las lineas que se cargan en pantalla
			ArrayList<HashMap> lstpreguntab = (ArrayList) this.tratarRETURNyMENSAJES(request, map);
			if (lstpreguntab != null && lstpreguntab.size() > 0) {
				Collections.sort(lstpreguntab, new Comparator() {
					public int compare(Object hashA, Object hashB) {
						HashMap OB_IAX_PREGUNTASTAB_1 = (HashMap) ((HashMap) hashA).get("OB_IAX_PREGUNTASTAB");
						HashMap OB_IAX_PREGUNTASTAB_2 = (HashMap) ((HashMap) hashB).get("OB_IAX_PREGUNTASTAB");
						BigDecimal lineaA = (BigDecimal) OB_IAX_PREGUNTASTAB_1.get("NLINEA");
						BigDecimal lineaB = (BigDecimal) OB_IAX_PREGUNTASTAB_2.get("NLINEA");
						return lineaA.compareTo(lineaB);
					}
				});
			}
			formdata.put("lstpreguntab", lstpreguntab);

		} catch (Exception e) {
			logger.error("Error en el servicio Axiscrt163Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {

			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));

		}
	}

	public void m_ajax_rellenacabecera(HttpServletRequest request) {
		logger.debug("Axisctr019Service m_ajax_rellenacabecera");
		AjaxContainerService ajax = new AjaxContainerService();
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {
			BigDecimal CPREGUN = this.getHiddenCampoNumerico(request, "CPREGUN");
			BigDecimal NRIESGO = (BigDecimal) AbstractDispatchAction.topPila(request, "NRIESGO");

			BigDecimal CGARANT = this.getHiddenCampoNumerico(request, "CGARANT");// Nom�s si estem a preguntes de
																					// garantia
			String TIPO = this.getCampoTextual(request, "TIPO_PREGUNTA");

			Map cabecera = (Map) request.getSession().getAttribute("cabecera");
			logger.debug("--> cabecera:" + cabecera);

			if (isEmpty(cabecera)) {
				Map map = new PAC_IAXPAR_PRODUCTOS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAXPAR_PRODUCTOS__F_GET_CABECERA_PREGUNTAB(TIPO, CPREGUN, CGARANT);
				logger.debug(map);
				request.getSession().setAttribute("cabecera", map);
				ajax.guardarContenidoFinalAContenedorAjax(this.tratarRETURNyMENSAJES(request, map));
			} else {
				ajax.guardarContenidoFinalAContenedorAjax(this.tratarRETURNyMENSAJES(request, cabecera));
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr001Service - m�todo m_ajax_rellenacabecera", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	public void m_guardar(HttpServletRequest request, Axisctr218Action thisAction) {
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		try {
			BigDecimal CPREGUN = this.getHiddenCampoNumerico(request, "CPREGUN");
			BigDecimal NRIESGO = getCampoNumerico(request, "NRIESGO");
			BigDecimal NMOVIMI = (BigDecimal) AbstractDispatchAction.topPila(request, "NMOVIMI");

			if (isEmpty(NRIESGO)) {
				NRIESGO = (BigDecimal) AbstractDispatchAction.topPila(request, "NRIESGO");
			}

			BigDecimal CGARANT = this.getHiddenCampoNumerico(request, "CGARANT");// Nom�s si estem a preguntes de
																					// garantia
			String TIPO = this.getCampoTextual(request, "TIPO_PREGUNTA");

			Map map = new PAC_IAX_PRODUCCION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_PRODUCCION__F_GRABARPREGUNTASTAB_CARGA(TIPO, NRIESGO, CPREGUN, CGARANT, NMOVIMI);
			logger.debug(map);

			BigDecimal RETURN = (BigDecimal) this.tratarRETURNyMENSAJES(request, map);

			if (RETURN != null && RETURN.intValue() != 1) { /////////// AVISOS
				if (RETURN.intValue() == 0)
					formdata.put("ok", this.tratarRETURNyMENSAJES(request, map));

			}

		} catch (Exception e) {
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}

	}

	public void m_borrar(HttpServletRequest request, Axisctr218Action thisAction) {
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		try {
			BigDecimal SSEGURO = (BigDecimal) AbstractDispatchAction.topPila(request, "SSEGURO");
			BigDecimal CPREGUN = this.getHiddenCampoNumerico(request, "CPREGUN");
			BigDecimal NRIESGO = getCampoNumerico(request, "NRIESGO");
			BigDecimal NMOVIMI = (BigDecimal) AbstractDispatchAction.topPila(request, "NMOVIMI");

			if (isEmpty(NRIESGO)) {
				NRIESGO = (BigDecimal) AbstractDispatchAction.topPila(request, "NRIESGO");
			}

			BigDecimal CGARANT = this.getHiddenCampoNumerico(request, "CGARANT");// Nom�s si estem a preguntes de
																					// garantia
			String TIPO = this.getCampoTextual(request, "TIPO_PREGUNTA");

			Map map = new PAC_IAX_CARGA_PREGUNTAB((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_CARGA_PREGUNTAB__F_BORRAR_CARGA(SSEGURO, CPREGUN, NRIESGO, CGARANT, NMOVIMI, TIPO);
			logger.debug(map);

			BigDecimal RETURN = (BigDecimal) this.tratarRETURNyMENSAJES(request, map);

		} catch (Exception e) {
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}

	}

	public void m_validar(HttpServletRequest request, Axisctr218Action thisAction) {
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		try {

			BigDecimal SSEGURO = getCampoNumerico(request, "SSEGURO");
			if (isEmpty(SSEGURO)) {
				SSEGURO = (BigDecimal) AbstractDispatchAction.topPila(request, "SSEGURO");
			}
			formdata.put("SSEGURO", SSEGURO);

			BigDecimal CPREGUN = this.getHiddenCampoNumerico(request, "CPREGUN");
			BigDecimal NRIESGO = getCampoNumerico(request, "NRIESGO");
			BigDecimal NMOVIMI = (BigDecimal) AbstractDispatchAction.topPila(request, "NMOVIMI");

			if (isEmpty(NRIESGO)) {
				NRIESGO = (BigDecimal) AbstractDispatchAction.topPila(request, "NRIESGO");
			}

			BigDecimal CGARANT = this.getHiddenCampoNumerico(request, "CGARANT");// Nom�s si estem a preguntes de
																					// garantia
			String TIPO = this.getCampoTextual(request, "TIPO_PREGUNTA");

			BigDecimal SPROCES = getCampoNumerico(request, "SPROCES");
			if (isEmpty(SPROCES))
				SPROCES = (BigDecimal) request.getAttribute("SPROCES");

			Map map = new PAC_IAX_CARGA_PREGUNTAB((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_CARGA_PREGUNTAB__F_VALIDAR_CARGA(SPROCES, SSEGURO, NRIESGO, CGARANT, CPREGUN,
							NMOVIMI);
			logger.debug(map);

			BigDecimal RETURN = (BigDecimal) this.tratarRETURNyMENSAJES(request, map);

		} catch (Exception e) {
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}

	}
}
