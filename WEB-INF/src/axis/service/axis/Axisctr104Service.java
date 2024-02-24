package axis.service.axis;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.struts.action.ActionForward;

import axis.cache.AxisCodeWizard;
import axis.jdbc.PAC_IAXPAR_PRODUCTOS;
import axis.jdbc.PAC_IAX_PRODUCCION;
import axis.jdbc.PAC_IAX_PROD_GENERICOS;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.control.axis.Axisctr020Action;
import axis.mvc.control.axis.Axisctr104Action;
import axis.mvc.model.UsuarioBean;
import axis.util.Constantes;

public class Axisctr104Service extends Axisctr020Service {
	static Log logger = LogFactory.getLog(Axisctr104Service.class);

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE INICIALIZACION
	 *******************************************/

	/*********************************************************************************************************************/
	public void m_init(HttpServletRequest request) {
		logger.debug("Axisactr104Service m_init");
	}

	public void m_form(HttpServletRequest request, Axisctr020Action thisAction) {

		try {
			super.m_form(request, thisAction);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr104Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.m_obtener_companias(request);
			// Repetimos la carga de dependencias y configform, ya ejecutado en la clase
			// padre. TODO:Revisar.
			// Gesti�n de campos y dependencias
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}

	}

	public void m_actualizar_provisiones(HttpServletRequest request) {
		try {
			super.m_actualizar_provisiones(request);
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr104Service - m_actualizar_provisiones m_form", e);
		} finally {
			// Repetimos la carga de dependencias y configform, ya ejecutado en la clase
			// padre. TODO:Revisar.
			// Gesti�n de campos y dependencias
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	public void m_volver(HttpServletRequest request, Axisctr020Action thisAction) {
		try {
			super.m_volver(request, thisAction);
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr104Service - m�todo m_volver", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			// Repetimos la carga de dependencias y configform, ya ejecutado en la clase
			// padre. TODO:Revisar.
			// Gesti�n de campos y dependencias
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	public void m_obtener_companias(HttpServletRequest request) {
		logger.debug("Axisctr104Service m_obtener_companias");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {

			BigDecimal SSEGURO = this.getCampoNumerico(request, "SSEGURO");

			if (isEmpty(SSEGURO))
				SSEGURO = new BigDecimal(String.valueOf(formdata.get("SSEGURO")));

			// TODO:Procesar respuesta cuando est� implementada.
			Map map = new PAC_IAX_PROD_GENERICOS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_PROD_GENERICOS__F_OBTENER_COMPANIAS(SSEGURO);
			logger.debug(map);
			if (((BigDecimal) tratarRETURNyMENSAJES(request, map)).intValue() == 0)
				formdata.put("COMPANIAS", map.get("PTCOMPANIAS"));

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr104Service - m�todo m_aceptar", e);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}

	}

	public ActionForward m_contratar(HttpServletRequest request, Axisctr104Action thisAction) {
		logger.debug("Axisctr104Service m_contratar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		ActionForward siguiente = null;
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {

			BigDecimal CAGENTE = usuario.getCagente();
			BigDecimal SSEGURO = getCampoNumerico(request, "SSEGURO");
			BigDecimal SPRODUCESP = getCampoNumerico(request, "SPRODUCESP");
			BigDecimal CCOMPANI = getCampoNumerico(request, "CCOMPANI");

			Map map = new HashMap();

			map = new PAC_IAX_PRODUCCION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_PRODUCCION__F_CREARPROPUESTA(SSEGURO, SPRODUCESP);
			logger.debug(map);

			if (((BigDecimal) this.tratarRETURNyMENSAJES(request, map)).equals(BigDecimal.ZERO)) {

				BigDecimal SSEGURO_OUT = null;
				if (!isEmpty(map.get("OSSEGURO")))
					SSEGURO_OUT = new BigDecimal(String.valueOf(map.get("OSSEGURO")));

				HashMap MapTitulo = (HashMap) new PAC_IAXPAR_PRODUCTOS(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAXPAR_PRODUCTOS__F_GET_DESCPRODUCTO(SPRODUCESP);
				logger.debug("TITTULO :: " + MapTitulo.get("RETURN"));

				// Tenemos que recuperar el SSEGURO de una p�liza nueva
				AbstractDispatchAction.topPila(request, "SSEGURO", SSEGURO);
				// Apilamos SPRODUC, TTITULO (producto) y CAGENTE en la pila de usuario
				AbstractDispatchAction.topPila(request, "SPRODUC", SPRODUCESP);
				AbstractDispatchAction.topPila(request, "TTITULO", MapTitulo.get("RETURN"));
				if (!isEmpty(CAGENTE))
					usuario.setCagente(CAGENTE);

				// TODO: NRIESGO hard-codeado a 1!!!
				AbstractDispatchAction.topPila(request, "NRIESGO", new BigDecimal(1));
				AbstractDispatchAction.topPila(request, "EJECUTAR_A_SALIR", "PAC_IAX_PRODUCCION__LIMPIARTEMPORALES");
				AbstractDispatchAction.topPila(request, "SSEGURO", SSEGURO);

				// recuperar un SSEGURO para poder editarlo
				if (isEmpty(AbstractDispatchAction.topPila(request, "CMODO")))
					AbstractDispatchAction.topPila(request, "CMODO", "ALTA_POLIZA");
				request.setAttribute(Constantes.FORWARDACTION, AxisCodeWizard.inicioFlujo(request));

			}

			return null; // bug 9195 ACC 190209

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr104Service - m�todo m_contratar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);

		} finally { // bug 9195 ACC 190209
			// Gesti�n de campos y dependencias
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
			return siguiente;
		}

	}

	public void m_aceptar(HttpServletRequest request) {
		logger.debug("Axisctr104Service m_aceptar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();

		try {
			// TODO:Procesar respuesta cuando est� implementada.
			Map map = new PAC_IAX_PROD_GENERICOS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_PROD_GENERICOS__F_PEDIR_PRESUPUESTO();
			logger.debug(map);
			tratarRETURNyMENSAJES(request, map);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr104Service - m�todo m_aceptar", e);
		} finally {
			// Gesti�n de campos y dependencias
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}

	}

	public void m_marcar(HttpServletRequest request) {
		logger.debug("Axisctr104Service m_marcar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {
			// formdata.put("VALORRADIO",getCampoTextual(request,"VALORRADIO"));
			BigDecimal SSEGURO = getCampoNumerico(request, "SSEGURO");
			BigDecimal CCOMPANI = getCampoNumerico(request, "CCOMPANI");
			BigDecimal CMARCAR = getCampoNumerico(request, "CMARCAR");
			// BigDecimal SPRODUC = getCampoNumerico(request, "SPRODUC");
			BigDecimal SPRODUCESP = getCampoNumerico(request, "SPRODUCESP");
			BigDecimal IDDOC = getCampoNumerico(request, "IDDOC");
			String CMODO = (String) AbstractDispatchAction.topPila(request, "CMODO");

			Map map = new PAC_IAX_PROD_GENERICOS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_PROD_GENERICOS__F_MARCAR_COMPANIA(SSEGURO, CCOMPANI, SPRODUCESP, CMARCAR, IDDOC);
			tratarRETURNyMENSAJES(request, map);
			logger.debug("CMARCAR: " + CMARCAR);
			logger.debug("SSEGURO: " + SSEGURO);
			logger.debug("CCOMPANI: " + CCOMPANI);
			logger.debug("SPRODUCESP: " + SPRODUCESP);
			logger.debug(map);
			// Esto rellenar� los MENSAJES en pantalla, as� que no nos preocupamos de si el
			// RETURN es 0 � 1
			// ajax.rellenarPlAContenedorAjax(map);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr104Service - m�todo m_marcar", e);
		} finally {
			// Gesti�n de campos y dependencias
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}

	}

	public void m_ajax_marcar(HttpServletRequest request) {
		logger.debug("Axisctr104Service m_ajax_marcar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {
			// formdata.put("VALORRADIO",getCampoTextual(request,"VALORRADIO"));
			BigDecimal SSEGURO = getCampoNumerico(request, "SSEGURO");
			BigDecimal CCOMPANI = getCampoNumerico(request, "CCOMPANI");
			BigDecimal CMARCAR = getCampoNumerico(request, "CMARCAR");
			// BigDecimal SPRODUC = getCampoNumerico(request, "SPRODUC");
			BigDecimal SPRODUCESP = getCampoNumerico(request, "SPRODUCESP");
			BigDecimal IDDOC = getCampoNumerico(request, "IDDOC");
			String CMODO = (String) AbstractDispatchAction.topPila(request, "CMODO");

			Map map = new PAC_IAX_PROD_GENERICOS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_PROD_GENERICOS__F_MARCAR_COMPANIA(SSEGURO, CCOMPANI, SPRODUCESP, CMARCAR, IDDOC);
			logger.debug(map);
			// Esto rellenar� los MENSAJES en pantalla, as� que no nos preocupamos de si el
			// RETURN es 0 � 1
			ajax.rellenarPlAContenedorAjax(map);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr104Service - m�todo m_ajax_marcar", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
			this.configSuplementos(request);
		}

	}

}
