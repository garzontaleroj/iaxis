package axis.service.modal;

import java.math.BigDecimal;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAXPAR_PRODUCTOS;
import axis.jdbc.PAC_IAX_MNTPROD;
import axis.mvc.control.modal.Axispro011Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

public class Axispro011Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	/**
	 * M�todo que se encarga de cargar el resumen de datos de la pantalla y la carga
	 * de duraciones en el display asociado en pantalla.
	 * 
	 * @param request
	 * @throws Exception
	 */
	private void cargarDatosDuraciones(HttpServletRequest request) throws Exception {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		BigDecimal SPRODUC = getCampoNumerico(request, "SPRODUC");

		// Carga de las PAC_IAX PL/SQL
		PAC_IAXPAR_PRODUCTOS pac_axispar_productos = new PAC_IAXPAR_PRODUCTOS(
				(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
		PAC_IAX_MNTPROD pac_axis_mntprod = new PAC_IAX_MNTPROD(
				(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

		// Datos resumen
		Map map = pac_axispar_productos.ejecutaPAC_IAXPAR_PRODUCTOS__F_GET_DESCPRODUCTO(SPRODUC);
		logger.debug(map);
		String params = (String) tratarRETURNyMENSAJES(request, map, false);

		request.setAttribute("DESCPRODUCTO", !isEmpty(params) ? params : new String());

		// Datos duraciones
		// Datos gestion
		Map map1 = pac_axis_mntprod.ejecutaPAC_IAX_MNTPROD__F_GET_DURPERIOD(SPRODUC);
		logger.debug(map1);
		List params1 = (List) tratarRETURNyMENSAJES(request, map1, false);

		request.getSession().setAttribute("T_IAX_PRODDURPERIODO", !isEmpty(params1) ? params1 : new ArrayList());
	}

	/**
	 * M�todo que se llama al inicio de este flujo. Realiza la carga inicial de los
	 * datos del display.
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_form(HttpServletRequest request, Axispro011Action thisAction) {
		logger.debug("Axispro011Service m_form");
		try {
			cargarDatosDuraciones(request);
		} catch (Exception e) {
			logger.error("Error en el servicio Axispro011Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

	/**
	 * M�todo que se encarga de eliminar un registro del displayTag de Duraciones
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_eliminar_duracion_lista(HttpServletRequest request, Axispro011Action thisAction) {
		logger.debug("Axispro011Service m_eliminar_duracion_lista");

		try {
			UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
			BigDecimal SPRODUC = getCampoNumerico(request, "SPRODUC");
			Date FINICIO = AxisBaseService.stringToSqlDate(getCampoTextual(request, "FINICIO"));
			BigDecimal NDURPER = getCampoNumerico(request, "NDURPER");

			// Carga de las PAC_IAX PL/SQL
			PAC_IAX_MNTPROD pac_axis_mntprod = new PAC_IAX_MNTPROD(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			// Datos params de lista
			Map map = pac_axis_mntprod.ejecutaPAC_IAX_MNTPROD__F_DEL_DURPERIOD(SPRODUC, FINICIO, NDURPER);
			logger.debug(map);
			BigDecimal params = (BigDecimal) tratarRETURNyMENSAJES(request, map);

			// Para evitar cerrar el modal anterior si se necesita updatear datos
			if (new BigDecimal("0").equals(params))
				request.setAttribute("hay_cambios_en_duraciones", "true");

		} catch (Exception e) {
			logger.error("Error en el servicio Axispro011Service - m�todo m_eliminar_duracion_lista", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}
}
