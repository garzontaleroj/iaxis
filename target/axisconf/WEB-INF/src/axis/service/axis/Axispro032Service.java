package axis.service.axis;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_MNTPROD;
import axis.mvc.control.axis.Axispro032Action;
import axis.mvc.model.UsuarioBean;
import axis.util.Constantes;

public class Axispro032Service extends AxisBaseService {
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
	public void m_form(HttpServletRequest request, Axispro032Action thisAction) {
		logger.debug("Axispro032Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		List<Map> T_IAX_PRODFORMAPAGO = null;

		try {
			PAC_IAX_MNTPROD pac_axis_mntprod = new PAC_IAX_MNTPROD(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			T_IAX_PRODFORMAPAGO = getFormasPago(request, pac_axis_mntprod);
			getRecFrac(request, T_IAX_PRODFORMAPAGO, pac_axis_mntprod);

			// TODO Falta ajuntar ambd�s parts per generar el multiregistre.
		} catch (Exception e) {
			logger.error("Error en el servicio axispro032Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

	public void m_aceptar_recargo(HttpServletRequest request, Axispro032Action thisAction) {
		logger.debug("Axispro032Service m_aceptar_recargo");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		Map map = new HashMap();

		try {
			BigDecimal CACTIVI = getCampoNumerico(request, "CACTIVI");
			BigDecimal CRAMO = getCampoNumerico(request, "CRAMO");
			BigDecimal CMODALI = getCampoNumerico(request, "CMODALI");
			BigDecimal CTIPSEG = getCampoNumerico(request, "CTIPSEG");
			BigDecimal CCOLECT = getCampoNumerico(request, "CCOLECT");
			BigDecimal SPRODUC = getCampoNumerico(request, "SPRODUC");
			Integer T_IAX_PRODFORMAPAGO_LENGTH = ((!isEmpty(formdata)
					&& !isEmpty(formdata.get("T_IAX_PRODFORMAPAGO_LENGTH")))
							? Integer.valueOf((String) formdata.get("T_IAX_PRODFORMAPAGO_LENGTH"))
							: 0);

			PAC_IAX_MNTPROD pac_axis_mntprod = new PAC_IAX_MNTPROD(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			for (int i = 0; i < T_IAX_PRODFORMAPAGO_LENGTH; i++) {
				BigDecimal CFORPAG = getCampoNumerico(request, "CFORPAG_" + i);
				BigDecimal PRECARG = getCampoNumerico(request, "PRECARG_" + i);

				map = pac_axis_mntprod.ejecutaPAC_IAX_MNTPROD__F_SET_RECACTIVIDAD(CRAMO, CMODALI, CTIPSEG, CCOLECT,
						SPRODUC, CACTIVI, CFORPAG, PRECARG);
				BigDecimal RETURN = (BigDecimal) tratarRETURNyMENSAJES(request, map);
				logger.debug("Resultado de PAC_IAX_MNTPROD__F_SET_RECACTIVIDAD para la forma de pago: " + CFORPAG
						+ " y recargo: " + PRECARG + " --> " + RETURN);
			}

		} catch (Exception e) {
			logger.error("Error en el servicio axispro032Service - m�todo m_aceptar_recargo", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}

	}

	/**
	 * M�todo que rellena las formas de pago del multiregistro seg�n el Producto
	 * seleccionado
	 * 
	 * @param request
	 * @param usuario
	 * @param formdata
	 * @throws Exception
	 */
	private List<Map> getFormasPago(HttpServletRequest request, PAC_IAX_MNTPROD pac_axis_mntprod) throws Exception {
		List<Map> T_IAX_PRODFORMAPAGO = new ArrayList<Map>();
		BigDecimal SPRODUC = getCampoNumerico(request, "SPRODUC");

		// Carga de actividades de producto
		Map map = pac_axis_mntprod.ejecutaPAC_IAX_MNTPROD__F_GET_FORPAGO(SPRODUC);
		T_IAX_PRODFORMAPAGO = (List<Map>) tratarRETURNyMENSAJES(request, map);

		logger.debug(T_IAX_PRODFORMAPAGO);
		return T_IAX_PRODFORMAPAGO;
	}

	/**
	 * M�todo que recupera el recargo por fraccionamiento del multiregistro seg�n el
	 * Producto seleccionado
	 * 
	 * @param request
	 * @param usuario
	 * @param formdata
	 * @throws Exception
	 */
	private void getRecFrac(HttpServletRequest request, List<Map> T_IAX_PRODFORMAPAGO, PAC_IAX_MNTPROD pac_axis_mntprod)
			throws Exception {
		List<Map> recargos = new ArrayList<Map>();

		BigDecimal CACTIVI = getCampoNumerico(request, "CACTIVI");
		BigDecimal CRAMO = getCampoNumerico(request, "CRAMO");
		BigDecimal CMODALI = getCampoNumerico(request, "CMODALI");
		BigDecimal CTIPSEG = getCampoNumerico(request, "CTIPSEG");
		BigDecimal CCOLECT = getCampoNumerico(request, "CCOLECT");
		BigDecimal SPRODUC = getCampoNumerico(request, "SPRODUC");

		// Carga de actividades seleccionables
		Map map = pac_axis_mntprod.ejecutaPAC_IAX_MNTPROD__F_GET_RECACTIVIDAD(CRAMO, CMODALI, CTIPSEG, CCOLECT, SPRODUC,
				CACTIVI);
		recargos = (List<Map>) tratarRETURNyMENSAJES(request, map);
		logger.debug("Recargos: " + recargos);

		if (!isEmpty(T_IAX_PRODFORMAPAGO) && !isEmpty(recargos)) {

			for (int i = 0; i < recargos.size(); i++) {
				BigDecimal CFORPAG_recargos = (BigDecimal) ((Map) recargos.get(i).get("OB_IAX_PRODRECFRACCACTI"))
						.get("CFORPAG");
				BigDecimal PRECARG_recargos = (BigDecimal) ((Map) recargos.get(i).get("OB_IAX_PRODRECFRACCACTI"))
						.get("PRECARG");

				for (int j = 0; j < T_IAX_PRODFORMAPAGO.size(); j++) {
					BigDecimal CFORPAG_OB_IAX_PRODFORMAPAGO = (BigDecimal) ((Map) T_IAX_PRODFORMAPAGO.get(j)
							.get("OB_IAX_PRODFORMAPAGO")).get("CFORPAG");

					if (CFORPAG_OB_IAX_PRODFORMAPAGO.equals(CFORPAG_recargos)) {
						((Map) T_IAX_PRODFORMAPAGO.get(j).get("OB_IAX_PRODFORMAPAGO")).put("PRECARG", PRECARG_recargos);
						break;
					}
				}
			}
		}

		// Metemos el ArrayList en session para poder mostralo en la pantalla
		request.setAttribute("T_IAX_PRODFORMAPAGO",
				!isEmpty(T_IAX_PRODFORMAPAGO) ? T_IAX_PRODFORMAPAGO : new ArrayList());
		logger.debug("T_IAX_PRODFORMAPAGO: " + T_IAX_PRODFORMAPAGO);
	}

}
