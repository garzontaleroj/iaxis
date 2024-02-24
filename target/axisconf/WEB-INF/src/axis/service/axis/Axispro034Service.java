package axis.service.axis;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAXPAR_PRODUCTOS;
import axis.jdbc.PAC_IAX_ACTIVIDADES;
import axis.jdbc.PAC_IAX_MNTPROD;
import axis.mvc.control.axis.Axispro034Action;
import axis.mvc.model.UsuarioBean;
import axis.util.Constantes;

public class Axispro034Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE INICIALIZACION
	 *******************************************/
	/*********************************************************************************************************************/

	/**
	 * @param request    El HttpServletRequest que contiene la petici�n del cliente
	 *                   web.
	 * @param thisAction El Action que invoca a este Servicio.
	 */
	public void m_form(HttpServletRequest request, Axispro034Action thisAction) {
		logger.debug("Axispro034Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {
			// this.getProducto(request, usuario);
			this.getActividadesOrigen(request, usuario);

		} catch (Exception e) {
			logger.error("Error en el servicio axispro034Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

	public void m_aceptar(HttpServletRequest request, Axispro034Action thisAction) {
		logger.debug("Axispro034Service m_aceptar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {
			BigDecimal CACTIVI = getCampoNumerico(request, "CACTIVI");
			BigDecimal CACTIVIC = getCampoNumerico(request, "CACTIVIC");
			BigDecimal CRAMO = getCampoNumerico(request, "CRAMO");
			BigDecimal CMODALI = getCampoNumerico(request, "CMODALI");
			BigDecimal CTIPSEG = getCampoNumerico(request, "CTIPSEG");
			BigDecimal CCOLECT = getCampoNumerico(request, "CCOLECT");
			BigDecimal SPRODUC = getCampoNumerico(request, "SPRODUC");

			PAC_IAX_MNTPROD pac_axis_mntprod = new PAC_IAX_MNTPROD(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			Map map = pac_axis_mntprod.ejecutaPAC_IAX_MNTPROD__F_DUPLICAR_ACTIVIDADES(CRAMO, CMODALI, CTIPSEG, CCOLECT,
					SPRODUC, CACTIVI, CACTIVIC);
			logger.debug(map);
			BigDecimal RETURN = (BigDecimal) tratarRETURNyMENSAJES(request, map);

			logger.debug("Se ha duplicado la actividad? "
					+ ((!isEmpty(RETURN) && RETURN.equals(BigDecimal.ZERO)) ? "SI" : "NO"));

		} catch (Exception e) {
			logger.error("Error en el servicio axispro034Service - m�todo m_aceptar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

	/**
	 * @deprecated M�todo que obtiene la actividad origen en funci�n del SPRODUC
	 *             cargado.
	 * @param request
	 * @param usuario
	 * @throws Exception
	 */
	private void getProducto(HttpServletRequest request, UsuarioBean usuario) throws Exception {
		BigDecimal SPRODUC = getCampoNumerico(request, "SPRODUC");
		request.setAttribute("headeritem1",
				this.tratarRETURNyMENSAJES(request,
						new PAC_IAXPAR_PRODUCTOS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
								.ejecutaPAC_IAXPAR_PRODUCTOS__F_GET_DESCPRODUCTO(SPRODUC)));
	}

	/**
	 * M�todo que permite cargar la lista de actividades.
	 * 
	 * @param request
	 * @param usuario
	 * @throws Exception
	 */
	private void getActividadesOrigen(HttpServletRequest request, UsuarioBean usuario) throws Exception {
		List actividades = new ArrayList();
		BigDecimal CRAMO = getCampoNumerico(request, "CRAMO");

		// Carga de las PAC_IAX PL/SQL
		PAC_IAX_ACTIVIDADES pac_iax_actividades = new PAC_IAX_ACTIVIDADES(
				(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

		// Carga de actividades seleccionables
		Map map = pac_iax_actividades.ejecutaPAC_IAX_ACTIVIDADES__F_GET_ACTIVIRAMO(CRAMO);
		actividades = (List) tratarRETURNyMENSAJES(request, map);
		logger.debug("Actividades: " + actividades);

		// Metemos el ArrayList en session para poder mostralo en la pantalla
		request.setAttribute("actividades", !isEmpty(actividades) ? actividades : new ArrayList());
	}
}
