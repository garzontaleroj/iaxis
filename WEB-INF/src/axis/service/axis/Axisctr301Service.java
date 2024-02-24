package axis.service.axis;

import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_BUREAU;
import axis.jdbc.PAC_IAX_PRODUCCION;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.control.axis.Axisctr301Action;
import axis.mvc.model.UsuarioBean;
import axis.util.Constantes;

public class Axisctr301Service extends AxisBaseService {
	static Log logger = LogFactory.getLog(Axisctr301Service.class);
	SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");

	public void m_init(HttpServletRequest request, Axisctr301Action thisAction) {
		logger.debug("Axisctr301Service m_init");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr301Service - m�todo m_init", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));

	}

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE INICIALIZACION
	 *******************************************/

	/*********************************************************************************************************************/
	public

			void m_form(HttpServletRequest request, Axisctr301Action thisAction) {
		logger.debug("Axisctr301Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr301Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	public void m_buscar(HttpServletRequest request, Axisctr301Action thisAction) {
		logger.debug("Axisctr031Service m_cargar_poliza");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {

			BigDecimal SSEGURO = this.getCampoNumerico(request, "SSEGURO");
			logger.debug("SSEGURO-->" + SSEGURO);

			String formorigen = (String) request.getAttribute("formorigen");
			logger.debug("antes formorigen-->" + formorigen);

			if (!isEmpty(this.getCampoTextual(request, "formorigen"))
					&& this.getCampoTextual(request, "formorigen").equals("axisctr020")) {
				logger.debug("formorigen-->" + formorigen);
				AbstractDispatchAction.topPila(request, "CMODO", "CONSULTA");
			}
			logger.debug("SSEGURO-->" + SSEGURO);
			if ("true".equals(getCampoTextual(request, "LIMPIAR_DATOS"))) {
				// Reinicializar formdata
				Object[] keySet = formdata.keySet().toArray();
				for (int i = 0; i < keySet.length; i++) {
					formdata.remove(keySet[i]);
				}
			}

			formdata.put("SSEGURO", SSEGURO);
			if (m_valida_poliza(request, thisAction)) {
				m_cargar_poliza(request, thisAction);
			} else {
				formdata.put("SSEGURO", null);
			}

		} catch (Exception e) {
			logger.error("Error en el servicio axisctr301Service - m�todo m_cargar_poliza", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));

	}

	public void m_ejecutar(HttpServletRequest request, Axisctr301Action thisAction) {

		AjaxContainerService ajax = new AjaxContainerService();

		logger.debug("Axisctr031Service m_ejecutar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {
			BigDecimal SSEGURO = getCampoNumerico(request, "SSEGURO");
			if (SSEGURO != null) {
				PAC_IAX_BUREAU pacIaxBureau = new PAC_IAX_BUREAU(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
				Map ficha = pacIaxBureau.ejecutaPAC_IAX_BUREAU__F_GENERA_FICHA(SSEGURO);

				BigDecimal plReturn = (BigDecimal) tratarRETURNyMENSAJES(request, ficha);

				m_cargar_poliza(request, thisAction);

				ajax.guardarContenidoFinalAContenedorAjax("ok");
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr38Service - m�todo m_aceptar", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}

	}

	public void m_cargar_poliza(HttpServletRequest request, Axisctr301Action thisAction) {
		logger.debug("Axisctr031Service m_cargar_poliza");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {
			BigDecimal SSEGURO = getCampoNumerico(request, "SSEGURO");
			PAC_IAX_BUREAU pacIaxBureau = new PAC_IAX_BUREAU(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map valseguro = pacIaxBureau.ejecutaPAC_IAX_BUREAU__F_VALIDA_POL(SSEGURO);
			logger.debug(valseguro);
			if (((BigDecimal) this.tratarRETURNyMENSAJES(request, valseguro)).intValue() == 0) {
				Map map = null;
				PAC_IAX_PRODUCCION pacIaxProduccion = new PAC_IAX_PRODUCCION(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
				map = pacIaxProduccion.ejecutaPAC_IAX_PRODUCCION__F_GET_DATPOLIZA(SSEGURO);
				logger.debug(map);
				Map datosPoliza = (Map) tratarRETURNyMENSAJES(request, map, false);
				request.setAttribute("datos_poliza", datosPoliza);
				map = pacIaxBureau.ejecutaPAC_IAX_BUREAU__F_GET_BUREAU(SSEGURO);
				logger.debug("m:" + map);
				tratarRETURNyMENSAJES(request, map);
				request.setAttribute("ficha_bureau", map.get("RETURN"));
			} else {

			}

		} catch (Exception e) {
			logger.error("Error en el servicio axisctr301Service - m�todo m_cargar_poliza", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));

	}

	public boolean m_valida_poliza(HttpServletRequest request, Axisctr301Action thisAction) {
		logger.debug("Axisctr031Service m_valida_poliza");

		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {
			BigDecimal SSEGURO = getCampoNumerico(request, "SSEGURO");
			PAC_IAX_BUREAU pacIaxBureau = new PAC_IAX_BUREAU(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map valseguro = pacIaxBureau.ejecutaPAC_IAX_BUREAU__F_VALIDA_POL(SSEGURO);
			logger.debug(valseguro);
			if (((BigDecimal) this.tratarRETURNyMENSAJES(request, valseguro)).intValue() == 0) {

				return true;
			} else {
				return false;
			}

		} catch (Exception e) {
			logger.error("Error en el servicio axisctr301Service - m�todo m_valida_poliza", e);
			return false;
		}

	}

	public void m_anular(HttpServletRequest request, Axisctr301Action thisAction) {
		logger.debug("Axisctr031Service m_anular");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {
			BigDecimal FBUREAU = getCampoNumerico(request, "FBUREAU");
			BigDecimal NSUPLEM = getCampoNumerico(request, "NSUPLEM");
			BigDecimal NMOVIMI = getCampoNumerico(request, "NMOVIMI");

			PAC_IAX_BUREAU pacIaxBureau = new PAC_IAX_BUREAU(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map ficha = pacIaxBureau.ejecutaPAC_IAX_BUREAU__F_ANULA_FICHA(FBUREAU, NSUPLEM, NMOVIMI);
			m_cargar_poliza(request, thisAction);
		} catch (Exception e) {
			logger.error("Error en el servicio axisctr301Service - m�todo m_anular", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));

	}

	public void m_cargar_doc(HttpServletRequest request, Axisctr301Action thisAction) {
		logger.debug("Axisctr031Service m_cargar_doc");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {
			BigDecimal FBUREAU = getCampoNumerico(request, "FBUREAU");
			BigDecimal IDDOCGEDOX = getCampoNumerico(request, "IDDOCGEDOX");
			BigDecimal NSUPLEM = getCampoNumerico(request, "NSUPLEM");
			BigDecimal NMOVIMI = getCampoNumerico(request, "NMOVIMI");
			BigDecimal IDFICHERO = (BigDecimal) request.getSession().getAttribute("IDFICHERO");

			logger.debug("Axisctr031Service m_cargar_doc SUPLEMENTO" + NSUPLEM + " NMOVIMI:" + NMOVIMI + " IDDOCGEDOX: "
					+ IDDOCGEDOX);
			PAC_IAX_BUREAU pacIaxBureau = new PAC_IAX_BUREAU(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map ficha = pacIaxBureau.ejecutaPAC_IAX_BUREAU__F_ASOCIA_DOC(FBUREAU, NSUPLEM, NMOVIMI, IDDOCGEDOX);
			m_cargar_poliza(request, thisAction);
		} catch (Exception e) {
			logger.error("Error en el servicio axisctr301Service - m�todo m_cargar_doc", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));

	}
}
