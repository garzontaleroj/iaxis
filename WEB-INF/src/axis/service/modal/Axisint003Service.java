
/**
 * Axisint003Service.java
 * 29/06/2010
 * @author <a href="pfeliu@csi-ti.com">Pablo Feliu</a>
 */
package axis.service.modal;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_GESTION_PROCESOS;
import axis.mvc.control.modal.Axisint003Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AjaxContainerService;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

public class Axisint003Service extends AxisBaseService {
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
	public void m_init(HttpServletRequest request, Axisint003Action thisAction) {
		try {

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
	public void m_form(HttpServletRequest request, Axisint003Action thisAction) {
		logger.debug("Axisint003Service m_form");
		try {
			m_cargaTabla(request, thisAction);
		} catch (Exception e) {
			logger.error("Error en el servicio Axisint003Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {

			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	/**
	 * Metodo que obtiene un objeto con toda la informaci�n de la tabla que toque.
	 * PFA 01072010 BUG 14750
	 * 
	 * @param request
	 */
	private void m_cargaTabla(HttpServletRequest request, Axisint003Action thisAction) {
		logger.debug("Axisint003Service m_cargaTabla");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {
			BigDecimal SPROCES = getCampoNumerico(request, "SPROCES");
			BigDecimal CPROCESO = getCampoNumerico(request, "CPROCESO");
			BigDecimal NLINEA = getCampoNumerico(request, "NLINEA");

			PAC_IAX_GESTION_PROCESOS pac_axis_gestprocesos = new PAC_IAX_GESTION_PROCESOS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			Map map = pac_axis_gestprocesos.ejecutaPAC_IAX_GESTION_PROCESOS__F_GET_TABLA_INTERMEDIA(SPROCES, CPROCESO,
					NLINEA);
			tratarRETURNyMENSAJES(request, map);
			logger.debug(map);
			formdata.put("OBTABLA", map.get("POBTABLAPROCESO"));
		} catch (Exception e) {
			logger.error("Error en el servicio Axisint003Service - m�todo m_cargaTabla", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			formdata.put("CVALOR", "");
		}
	}

	/**
	 * Metodo que graba el objeto con toda la informaci�n de la tabla que toque. PFA
	 * 01072010 BUG 14750
	 * 
	 * @param request
	 */
	public void m_ajax_grabar(HttpServletRequest request, Axisint003Action thisAction) {
		logger.debug("Axisint003Service m_grabar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		;
		AjaxContainerService ajax = new AjaxContainerService();
		try {
			BigDecimal SPROCES = getCampoNumerico(request, "SPROCES");
			BigDecimal CPROCESO = getCampoNumerico(request, "CPROCESO");
			BigDecimal NLINEA = getCampoNumerico(request, "NLINEA");
			String COLUMNA = getCampoTextual(request, "CNOMBRE");
			String VALOR = getCampoTextual(request, "CVALOR");

			PAC_IAX_GESTION_PROCESOS pac_axis_gestprocesos = new PAC_IAX_GESTION_PROCESOS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			Map map = pac_axis_gestprocesos.ejecutaPAC_IAX_GESTION_PROCESOS__F_SET_TABLA_INTERMEDIA(SPROCES, CPROCESO,
					NLINEA, COLUMNA, VALOR);
			logger.debug(map);
			// if (((BigDecimal)this.tratarRETURNyMENSAJES(request, map)).intValue()==0) {
			ajax.rellenarPlAContenedorAjax(map);
			ajax.guardarContenidoFinalAContenedorAjax(map);
			// }
		} catch (Exception e) {
			logger.error("Error en el servicio Axisint003Service - m�todo m_grabar", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	/**
	 * Metodo que graba el objeto con toda la informaci�n de la tabla que toque. PFA
	 * 01072010 BUG 16432
	 * 
	 * @param request
	 */
	public void m_ajax_setCestado(HttpServletRequest request, Axisint003Action thisAction) {
		logger.debug("Axisint003Service m_setCestado");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		;
		AjaxContainerService ajax = new AjaxContainerService();
		try {
			BigDecimal SPROCES = getCampoNumerico(request, "SPROCES");
			BigDecimal NLINEA = getCampoNumerico(request, "NLINEA");
			BigDecimal CESTADO = new BigDecimal(5); // De momento solo podemos cambiar el estado a Validado Manualmente

			PAC_IAX_GESTION_PROCESOS pac_axis_gestprocesos = new PAC_IAX_GESTION_PROCESOS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			Map map = pac_axis_gestprocesos.ejecutaPAC_IAX_GESTION_PROCESOS__F_SET_CESTADO_LINEAPROCESO(SPROCES, NLINEA,
					CESTADO);
			logger.debug(map);
			ajax.rellenarPlAContenedorAjax(map);
			ajax.guardarContenidoFinalAContenedorAjax(map);
		} catch (Exception e) {
			logger.error("Error en el servicio Axisint003Service - m�todo m_grabar", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	public void m_grabar(HttpServletRequest request, Axisint003Action thisAction) {
		logger.debug("Axisint003Service m_grabar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {
			BigDecimal SPROCES = getCampoNumerico(request, "SPROCES");
			BigDecimal CPROCESO = getCampoNumerico(request, "CPROCESO");
			BigDecimal NLINEA = getCampoNumerico(request, "NLINEA");
			String COLUMNA = getCampoTextual(request, "CNOMBRE");
			String VALOR = getCampoTextual(request, "CVALOR");

			PAC_IAX_GESTION_PROCESOS pac_axis_gestprocesos = new PAC_IAX_GESTION_PROCESOS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			Map map = pac_axis_gestprocesos.ejecutaPAC_IAX_GESTION_PROCESOS__F_SET_TABLA_INTERMEDIA(SPROCES, CPROCESO,
					NLINEA, COLUMNA, VALOR);
			logger.debug(map);

			m_cargaTabla(request, thisAction);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisint003Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

}
