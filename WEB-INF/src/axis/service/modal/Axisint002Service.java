
/**
 * Axisint002Service.java
 * 18/05/2010
 * @author <a href="pfeliu@csi-ti.com">Pablo Feliu</a>
 */
package axis.service.modal;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_CFG_FILE;
import axis.jdbc.PAC_IAX_GESTION_PROCESOS;
import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.mvc.control.modal.Axisint002Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

public class Axisint002Service extends AxisBaseService {
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
	public void m_init(HttpServletRequest request, Axisint002Action thisAction) {
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {

		} catch (Exception e) {
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}

	}

	/**
	 * 
	 * @param request
	 */
	@SuppressWarnings("all")
	public void m_form(HttpServletRequest request, Axisint002Action thisAction) {
		logger.debug("Axisint002Service m_form");
		try {

			this.m_cargarCombos(request, thisAction);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisint002Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}

	/**
	 * 
	 * @param request
	 */
	@SuppressWarnings("all")
	public void m_buscar(HttpServletRequest request, Axisint002Action thisAction) {
		logger.debug("Axisint002Service m_form");
		try {

			this.m_cargarCombos(request, thisAction);
			this.m_buscarFicherosCarga(request, thisAction);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisint002Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}

	/**
	 * Metodo que cargar� la lista de valores de la pantalla. PFA 19052010 BUG 14455
	 * 
	 * @param request
	 */
	private void m_cargarCombos(HttpServletRequest request, Axisint002Action thisAction) {
		logger.debug("Axisint002Service m_cargarCombos");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		HashMap listValores = new HashMap();
		try {

			PAC_IAX_LISTVALORES pac_axis_listValores = new PAC_IAX_LISTVALORES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			Map map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(800019));
			listValores.put("lstestado", (List) tratarRETURNyMENSAJES(request, map));

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

		} catch (Exception e) {
			logger.error("Error en el servicio Axisint002Service - m�todo m_cargarCombos", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			formdata.put("listValores", ((!isEmpty(listValores)) ? listValores : new HashMap()));
		}
	}

	private void m_buscarFicherosCarga(HttpServletRequest request, Axisint002Action thisAction) {
		logger.debug("Axisint002Service m_buscarFicherosCarga");
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {
			UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
			PAC_IAX_GESTION_PROCESOS pac_axis_procesos = new PAC_IAX_GESTION_PROCESOS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			BigDecimal SPROCES = this.getCampoNumerico(request, "SPROCESBUSQ");
			String TFICHERO = this.getCampoTextual(request, "TFICHERO");
			String REFEXT = this.getCampoTextual(request, "REFEXT");

			java.sql.Date FINI = this.stringToSqlDate(this.getCampoTextual(request, "FINI"));
			java.sql.Date FFIN = this.stringToSqlDate(this.getCampoTextual(request, "FFIN"));
			BigDecimal CESTADO = this.getCampoNumerico(request, "CESTADO");
			BigDecimal P_CPROCESOS = this.getCampoNumerico(request, "P_CPROCESOS");
			Map map = pac_axis_procesos.ejecutaPAC_IAX_GESTION_PROCESOS__F_GET_CARGA_CTRL_CABECERA(SPROCES, TFICHERO,
					FINI, FFIN, CESTADO, P_CPROCESOS, REFEXT);
			logger.debug("PAC_IAX_GESTION_PROCESOS__F_GET_CARGA_CTRL_CABECERARetorna: " + map);
			if (((BigDecimal) this.tratarRETURNyMENSAJES(request, map)).intValue() == 0) {
				formdata.put("ctrlCabecera", map.get("PCURCARGA"));
			}
		} catch (Exception e) {
			logger.error("Error en el servicio Axisint002Service - m�todo m_buscarFicherosCarga", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}
}
