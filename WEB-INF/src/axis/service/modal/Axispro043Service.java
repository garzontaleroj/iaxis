package axis.service.modal;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_MNTPROD;
import axis.mvc.control.modal.Axispro043Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

public class Axispro043Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE INICIALIZACION
	 *******************************************/
	/*********************************************************************************************************************/

	public

			void m_init(HttpServletRequest request, Axispro043Action thisAction) {
		logger.debug("Axispro043Service m_init");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {

			BigDecimal PSPRODUC = getCampoNumerico(request, "SPRODUC");
			BigDecimal PCGARANT = getCampoNumerico(request, "CGARANT");
			BigDecimal PCACTIVI = getCampoNumerico(request, "CACTIVI");

			formdata.put("SPRODUC", PSPRODUC);
			formdata.put("CGARANT", PCGARANT);
			formdata.put("CACTIVI", PCACTIVI);

			Map map = new PAC_IAX_MNTPROD((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_MNTPROD__F_INICIALIZA_CAPITAL(PSPRODUC, PCGARANT, PCACTIVI);
			logger.debug(map);
			tratarRETURNyMENSAJES(request, map);

		} catch (Exception e) {
			logger.error("Error en el servicio Axissin06Service - m�todo m_init", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.configForm(request, this.whoami(this));
		this.cargaDependencias(request, (List) request.getAttribute("DEPENDENCIAS"));
	}

	/**
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_form(HttpServletRequest request, Axispro043Action thisAction) {
		logger.debug("Axispro043Service m_form");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		try {

			Map map = new PAC_IAX_MNTPROD((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_MNTPROD__F_GET_OBJ_CAPITALES();
			logger.debug(map);
			formdata.put("LISTCAPITALES", map.get("RETURN"));

		} catch (Exception e) {
			logger.error("Error en el servicio Axispro043Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.configForm(request, this.whoami(this));
	}

	public void m_anadir(HttpServletRequest request, Axispro043Action thisAction) {
		logger.debug("Axispro043Service m_a�adir");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		try {

			BigDecimal PICAPITAL = getCampoNumerico(request, "ICAPITAL");
			BigDecimal PCDEFECTO = getCampoNumerico(request, "CDEFECTO");

			Map map = new PAC_IAX_MNTPROD((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_MNTPROD__F_SET_OBJ_CAPITAL(PICAPITAL, PCDEFECTO);
			logger.debug(map);
			tratarRETURNyMENSAJES(request, map);

			formdata.remove("ICAPITAL");
			formdata.remove("CDEFECTO");

		} catch (Exception e) {
			logger.error("Error en el servicio Axispro043Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

	public void m_aceptar(HttpServletRequest request, Axispro043Action thisAction) {
		logger.debug("Axispro043Service m_aceptar");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		try {

			BigDecimal PSPRODUC = getCampoNumerico(request, "SPRODUC");
			BigDecimal PCGARANT = getCampoNumerico(request, "CGARANT");
			BigDecimal PCACTIVI = getCampoNumerico(request, "CACTIVI");

			Map map = new PAC_IAX_MNTPROD((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_MNTPROD__F_SET_CAPITALES(PSPRODUC, PCGARANT, PCACTIVI);
			logger.debug(map);

			if (map.get("RETURN").equals(new BigDecimal(0)))
				formdata.put("OK", 1);

			tratarRETURNyMENSAJES(request, map);

		} catch (Exception e) {
			logger.error("Error en el servicio Axispro043Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

	public void m_borrar(HttpServletRequest request, Axispro043Action thisAction) {
		logger.debug("Axispro043Service m_aceptar");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		try {

			BigDecimal PNORDEN = getCampoNumerico(request, "NORDEN");

			Map map = new PAC_IAX_MNTPROD((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_MNTPROD__F_DEL_OBJ_CAPITAL(PNORDEN);
			logger.debug(map);
			tratarRETURNyMENSAJES(request, map);

		} catch (Exception e) {
			logger.error("Error en el servicio Axispro043Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

	public void m_ordenar(HttpServletRequest request, Axispro043Action thisAction) {
		logger.debug("Axispro043Service m_aceptar");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		try {

			BigDecimal PNORDEN = getCampoNumerico(request, "NORDEN");
			String PMODO = getCampoTextual(request, "MODO");

			Map map = new PAC_IAX_MNTPROD((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_MNTPROD__F_ORDENAR_OBJ_CAPITAL(PNORDEN, PMODO);
			logger.debug(map);
			tratarRETURNyMENSAJES(request, map);

		} catch (Exception e) {
			logger.error("Error en el servicio Axispro043Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

}
