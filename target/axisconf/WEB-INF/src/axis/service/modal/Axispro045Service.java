package axis.service.modal;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAXPAR_PRODUCTOS;
import axis.jdbc.PAC_IAX_MNTPROD;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.control.modal.Axispro045Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

/**
 * Axispro045Service.java
 * 
 * @author <a href="amartinez@csi-ti.com">Alex Martinez</a>
 * @since Java 5.0
 */
public class Axispro045Service extends AxisBaseService {
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
	public void m_form(HttpServletRequest request) {
		logger.debug("Axispro045Service m_form");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		Map OB_IAX_PRODUCTO = new HashMap();
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {

			BigDecimal SPRODUC = getCampoNumerico(request, "SPRODUC");
			BigDecimal CACTIVI = getCampoNumerico(request, "PCACTIVI");
			BigDecimal CGARANT = getCampoNumerico(request, "PCGARANT");

			request.setAttribute("CGARANTIA", CGARANT);
			request.setAttribute("ACTIVIDAD", CACTIVI);
			request.setAttribute("SPRODUC", SPRODUC);

			if (!isEmpty(SPRODUC)) {
				Map map = new PAC_IAXPAR_PRODUCTOS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAXPAR_PRODUCTOS__F_INICIALIZA(SPRODUC, null, usuario.getCempres(),
								usuario.getCidioma(), null, null, null);

				map = new PAC_IAX_MNTPROD((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_MNTPROD__F_GET_PRODUCTO(SPRODUC);
				logger.debug(map);
				OB_IAX_PRODUCTO = (Map) tratarRETURNyMENSAJES(request, map);

				map = new PAC_IAX_MNTPROD((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_MNTPROD__F_GET_DETAILGARAN(SPRODUC, CACTIVI, CGARANT);
				HashMap mntgaran = (HashMap) tratarRETURNyMENSAJES(request, map);
				logger.debug(mntgaran);
				request.setAttribute("mntgaran", mntgaran);
				request.setAttribute("TGARANTIA", mntgaran.get("TGARANT"));

				cargarDatosCombos(request, SPRODUC, CACTIVI, CGARANT);
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axispro045Service - m�todo m_form", e);
			AbstractDispatchAction.guardarMensaje(request, "1000050", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		} finally {
			request.setAttribute("mntproducto", OB_IAX_PRODUCTO);
			this.configForm(request, whoami(this));
		}
	}

	private void cargarDatosCombos(HttpServletRequest request, BigDecimal SPRODUC, BigDecimal PCACTIVI,
			BigDecimal PCGARANT) throws Exception {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		HashMap combos = new HashMap();
		Map map = null;

		map = new PAC_IAX_MNTPROD((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_MNTPROD__F_GET_LSTGARINCOMPATIBLES(SPRODUC, PCACTIVI, PCGARANT);
		logger.debug(map);
		combos.put("LSTGARIN", (List) tratarRETURNyMENSAJES(request, map, false));

		formdata.put("COMBOS", combos);

	}

	public void m_aceptar(HttpServletRequest request, Axispro045Action thisAction) {
		logger.debug("Axispro045Service m_aceptar");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		try {

			BigDecimal PSPRODUC = getCampoNumerico(request, "SPRODUC");
			BigDecimal PCACTIVI = getCampoNumerico(request, "PCACTIVI");
			BigDecimal PCGARANT = getCampoNumerico(request, "PCGARANT");
			BigDecimal PCGARINC = getCampoNumerico(request, "CGARINC");

			Map map = new PAC_IAX_MNTPROD((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_MNTPROD__F_SET_INCOMPAGAR(PSPRODUC, PCGARANT, PCGARINC, PCACTIVI);

			tratarRETURNyMENSAJES(request, map);

		} catch (Exception e) {
			logger.error("Error en el servicio Axispro045Service - m�todo m_aceptar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

	public void m_borrar(HttpServletRequest request, Axispro045Action thisAction) {
		logger.debug("Axispro045Service m_borrar");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		try {

			BigDecimal PSPRODUC = getCampoNumerico(request, "SPRODUC");
			BigDecimal PCACTIVI = getCampoNumerico(request, "PCACTIVI");
			BigDecimal PCGARANT = getCampoNumerico(request, "PCGARANT");
			BigDecimal PCGARINC = getCampoNumerico(request, "CGARINC");

			Map map = new PAC_IAX_MNTPROD((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_MNTPROD__F_DEL_INCOMPAGAR(PSPRODUC, PCGARANT, PCGARINC, PCACTIVI);

			tratarRETURNyMENSAJES(request, map);

		} catch (Exception e) {
			logger.error("Error en el servicio Axispro045Service - m�todo m_borrar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}
}
