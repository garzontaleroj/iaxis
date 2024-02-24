package axis.service.modal;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_MNTPROD;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

/**
 * Axispro039Service.java
 * 
 * @author <a href="rkirchner@csi-ti.com">Roger Kirchner</a>
 * @since Java 5.0
 */
public class Axispro039Service extends AxisBaseService {
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
		logger.debug("Axispro039Service m_form");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		Map OB_IAX_PRODUCTO = new HashMap();
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {

			logger.debug(request.getParameter("SPRODUC"));
			BigDecimal PSPRODUC = new BigDecimal(request.getParameter("SPRODUC"));
			formdata.put("SPRODUC", PSPRODUC);
			Map map = new PAC_IAX_MNTPROD((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_MNTPROD__F_GET_BENEFPRO(PSPRODUC);
			logger.debug("----- clausulas:" + map);

			List clausulas = (List) tratarRETURNyMENSAJES(request, map);
			request.setAttribute("CLAUSULAS", clausulas);

			map = new PAC_IAX_MNTPROD((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_MNTPROD__F_GET_BENEF_NOASIG(PSPRODUC);
			logger.debug("----- clausulas_sel:" + map);

			List clausulas_sel = (List) tratarRETURNyMENSAJES(request, map);
			request.setAttribute("CLAUSULAS_SEL", clausulas_sel);

			map = new PAC_IAX_MNTPROD((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_MNTPROD__F_GET_PRODUCTO(PSPRODUC);
			logger.debug("----- producto" + map);
			OB_IAX_PRODUCTO = (Map) tratarRETURNyMENSAJES(request, map);
			request.setAttribute("mntproducto", OB_IAX_PRODUCTO);

		} catch (Exception e) {
			logger.error("Error en el servicio Axispro039Service - m�todo m_form", e);
			AbstractDispatchAction.guardarMensaje(request, "1000050", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
	}

	public void m_asignar_clausula(HttpServletRequest request) {
		logger.debug("Axispro039Service m_asignar_clausula");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {

			BigDecimal PSPRODUC = new BigDecimal(request.getParameter("PSPRODUC"));
			BigDecimal PSCLABEN = new BigDecimal(request.getParameter("PSCLABEN"));
			Map map = new PAC_IAX_MNTPROD((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_MNTPROD__F_SET_BENEFPRO(PSPRODUC, PSCLABEN);

			tratarRETURNyMENSAJES(request, map);

		} catch (Exception e) {
			logger.error("Error en el servicio Axispro039Service - m�todo  m_asignar_clausula", e);
			AbstractDispatchAction.guardarMensaje(request, "1000050", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
	}

	public void m_borrar_clausula(HttpServletRequest request) {
		logger.debug("Axispro039Service m_borrar_clausula");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {

			BigDecimal PSPRODUC = new BigDecimal(request.getParameter("PSPRODUC"));
			BigDecimal PSCLABEN = new BigDecimal(request.getParameter("PSCLABEN"));
			Map map = new PAC_IAX_MNTPROD((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_MNTPROD__F_DEL_BENEFPRO(PSPRODUC, PSCLABEN);

			tratarRETURNyMENSAJES(request, map);

		} catch (Exception e) {
			logger.error("Error en el servicio Axispro039Service - m�todo  m_asignar_clausula", e);
			AbstractDispatchAction.guardarMensaje(request, "1000050", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
	}

	public void m_asig_clausuladef(HttpServletRequest request) {
		logger.debug("Axispro039Service m_borrar_clausula");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {

			BigDecimal PSPRODUC = new BigDecimal(request.getParameter("PSPRODUC"));
			BigDecimal PSCLABEN = new BigDecimal(request.getParameter("PSCLABEN"));
			Map map = new PAC_IAX_MNTPROD((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_MNTPROD__F_SET_BENEFDEFECTO(PSPRODUC, PSCLABEN);

			tratarRETURNyMENSAJES(request, map);

		} catch (Exception e) {
			logger.error("Error en el servicio Axispro039Service - m�todo  m_asignar_clausula", e);
			AbstractDispatchAction.guardarMensaje(request, "1000050", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
	}

}
