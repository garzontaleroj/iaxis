package axis.service.modal;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_MNTPROD;
import axis.jdbc.PAC_IAX_PENSIONES;
import axis.mvc.control.modal.Axispro047Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

/**
 * Axispro047Service.java
 * 
 * @author <a href="rkirchner@csi-ti.com">Roger Kirchner</a>
 * @since Java 5.0
 */
public class Axispro047Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE INICIALIZACION
	 *******************************************/
	/*********************************************************************************************************************/

	/**
	 * Carga inicial de la pantalla. Carga de BD: - Los datos t�cnicos. - Los
	 * diferentes valores de los combos. - Llama a #m_cargarCuadroInteres
	 * 
	 * @param request
	 */

	@SuppressWarnings("all")
	public void m_form(HttpServletRequest request, Axispro047Action thisAction) {
		logger.debug("Axispro047Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {
			if (isEmpty(formdata.get("NCONTADOR")))
				formdata.put("NCONTADOR", 0);
			BigDecimal CCODPLA = getCampoNumerico(request, "CCODPLA");
			BigDecimal SPRODUC = getCampoNumerico(request, "SPRODUC");
			if (CCODPLA != null) {
				PAC_IAX_PENSIONES pacIaxPen = new PAC_IAX_PENSIONES(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
				Map map = pacIaxPen.ejecutaPAC_IAX_PENSIONES__F_GET_PLANPENSIONES(null, null, null, null, null,
						CCODPLA);
				logger.debug("ejecutaPAC_IAX_PENSIONES__F_GET_PLANPENSIONES return: " + map);
				// Si la crida retorna error llencem excepcio.
				if (((BigDecimal) (tratarRETURNyMENSAJES(request, map, true))).compareTo(new BigDecimal(0)) != 0) {
					throw new Exception();
				}
				// Preparem llista de gestores

				ArrayList listaPlan = (ArrayList<Map>) map.get("PLANPENSIONES");
				logger.debug(listaPlan);
				formdata.put("AXIS_PLANES", listaPlan);
			}
			formdata.put("SPRODUC", SPRODUC);

		} catch (Exception e) {
			logger.error("Error en el servicio Axispen004Service - m�todo m_busqueda_fondos", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			logger.debug("fin metodo");
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	public void m_guardar(HttpServletRequest request, Axispro047Action thisAction) {
		logger.debug("Axispro047Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {
			BigDecimal CCODPLA = getCampoNumerico(request, "CCODPLA");
			BigDecimal SPRODUC = getCampoNumerico(request, "SPRODUC");
			if (CCODPLA != null) {
				PAC_IAX_MNTPROD pacIaxProd = new PAC_IAX_MNTPROD(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
				Map map = pacIaxProd.ejecutaPAC_IAX_MNTPROD__F_SET_PLANPENSION(SPRODUC, CCODPLA);
				logger.debug("ejecutaPAC_IAX_MNTPROD__F_SET_PLANPENSION return: " + map);
				// Si la crida retorna error llencem excepcio.
				if (((BigDecimal) (tratarRETURNyMENSAJES(request, map, true))).compareTo(new BigDecimal(0)) != 0) {
					throw new Exception();
				} else {
					formdata.put("GUARDAR", "OK");

				}
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axispen004Service - m�todo m_busqueda_fondos", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			logger.debug("fin metodo");
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

}
