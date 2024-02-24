package axis.service.modal;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_MNTPREGUNPROD;
import axis.jdbc.PAC_IAX_MNTPROD;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.control.modal.Axispro033Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

/**
 * Axispro033Service.java
 * 
 * @author <a href="rkirchner@csi-ti.com">Roger Kirchner</a>
 * @since Java 5.0
 */
public class Axispro033Service extends AxisBaseService {
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
		logger.debug("Axispro033Service m_form");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		Map OB_IAX_PRODUCTO = new HashMap();
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {

			BigDecimal SPRODUC = getCampoNumerico(request, "SPRODUC");
			BigDecimal CACTIVI = getCampoNumerico(request, "CACTIVI");
			BigDecimal CGARANT = getCampoNumerico(request, "CGARANT");
			String TGARANT = getCampoTextual(request, "TGARANT");
			String MODO = getCampoTextual(request, "VMODO");
			logger.debug("---> MODO:" + MODO);
			formdata.put("VMODO", MODO);
			request.setAttribute("TGARANTIA", TGARANT);
			request.setAttribute("CGARANTIA", CGARANT);

			if (!isEmpty(SPRODUC)) {
				Map map = new PAC_IAX_MNTPROD((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_MNTPROD__F_GET_PRODUCTO(SPRODUC);
				logger.debug(map);
				OB_IAX_PRODUCTO = (Map) tratarRETURNyMENSAJES(request, map);

				if (MODO.equals("PROD")) {
					request.setAttribute("PREGUNTAS", OB_IAX_PRODUCTO.get("PREGUNTAS"));
				}

				if (MODO.equals("ACT")) {
					// logger.debug(ConversionUtil.printAsXML(OB_IAX_PRODUCTO, "OB_IAX_PRODUCTO"));
					List ACTIVID = (List) OB_IAX_PRODUCTO.get("ACTIVID");

					if (!isEmpty(ACTIVID)) {
						recuperarDatosActividades(SPRODUC, OB_IAX_PRODUCTO, usuario, request);
					}
				}

				if (MODO.equals("GAR")) {

					map = new PAC_IAX_MNTPROD((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
							.ejecutaPAC_IAX_MNTPROD__F_GET_DETAILGARAN(SPRODUC, CACTIVI, CGARANT);
					HashMap mntgaran = (HashMap) tratarRETURNyMENSAJES(request, map);
					logger.debug(mntgaran);
					request.setAttribute("mntgaran", mntgaran);

					List ACTIVID = (List) OB_IAX_PRODUCTO.get("ACTIVID");

					if (!isEmpty(ACTIVID)) {
						recuperarDatosActividades(SPRODUC, OB_IAX_PRODUCTO, usuario, request);
					}

				}

			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axispro033Service - m�todo m_form", e);
			AbstractDispatchAction.guardarMensaje(request, "1000050", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		} finally {
			request.setAttribute("mntproducto", OB_IAX_PRODUCTO);
			this.configForm(request, whoami(this));
		}
	}

	private void recuperarDatosActividades(BigDecimal SPRODUC, Map OB_IAX_PRODUCTO, UsuarioBean usuario,
			HttpServletRequest request) throws Exception {
		/* Recuperar datos de actividades */
		List ACTIVID = (List) OB_IAX_PRODUCTO.get("ACTIVID");

		if (ACTIVID != null) {
			// existen valores para cada una
			BigDecimal CACTIVI = (BigDecimal) ((Map) ((Map) ACTIVID.get(0)).get("OB_IAX_PRODACTIVIDADES"))
					.get("CACTIVI");
			String TACTIVI = (String) ((Map) ((Map) ACTIVID.get(0)).get("OB_IAX_PRODACTIVIDADES")).get("TACTIVI");

			request.getSession().setAttribute("ACTIVIDAD", CACTIVI);
			request.getSession().setAttribute("TACTIVIDAD", TACTIVI);

			Map map = new PAC_IAX_MNTPROD((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_MNTPROD__F_GET_DETAILACTIVID(SPRODUC, CACTIVI);
			logger.debug(map);
			Map actividades = (Map) tratarRETURNyMENSAJES(request, map);
			logger.debug("---> actividades:" + actividades);

			request.setAttribute("PREGUNTAS", actividades.get("PREGUNACTI"));
		}
	}

	/**
	 * M�todo que realiza la b�squeda de preguntas en funci�n de los par�metros de
	 * filtro seleccionados.
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_borrarpreg(HttpServletRequest request, Axispro033Action thisAction) {
		logger.debug("Axispro041Service m_borrarpreg");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {

			BigDecimal CPREGUNTA = getCampoNumerico(request, "CPREGUN");
			BigDecimal SPRODUC = getCampoNumerico(request, "SPRODUC");
			BigDecimal CACTIVI = getCampoNumerico(request, "CACTIVI");
			BigDecimal CGARANT = getCampoNumerico(request, "CGARANT");
			String MODO = getCampoTextual(request, "VMODO");

			Map map = new PAC_IAX_MNTPREGUNPROD((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_MNTPREGUNPROD__F_DEL_PREGUNTA(CPREGUNTA, MODO, SPRODUC, CACTIVI, CGARANT);

			tratarRETURNyMENSAJES(request, map);

		} catch (Exception e) {
			logger.error("Error en el servicio Axispro042Service - m�todo m_borrarpreg", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

}
