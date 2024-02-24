package axis.service.modal;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.mvc.control.modal.Axispro009Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

public class Axispro009Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE INICIALIZACION
	 *******************************************/
	/*********************************************************************************************************************/

	/**
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_form(HttpServletRequest request, Axispro009Action thisAction) {
		logger.debug("Axispro009Service m_guardar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		logger.debug("Axispro009Service m_form");

		/*
		 * try {
		 * 
		 * BigDecimal SPRODUC = getCampoNumerico(request, "SPRODUC");
		 * 
		 * Map map = new
		 * PAC_IAX_MNTPROD((java.sql.Connection)request.getAttribute(Constantes.DB01CONN
		 * )).ejecutaPAC_IAX_MNTPROD__F_Get_Admprod(SPRODUC); logger.debug(map); Map
		 * OB_IAX_PRODADMINISTRACION = (Map) tratarRETURNyMENSAJES(request, map);
		 * 
		 * 
		 * if (!isEmpty(OB_IAX_PRODADMINISTRACION))
		 * request.setAttribute("OB_IAX_PRODADMINISTRACION",OB_IAX_PRODADMINISTRACION);
		 * //formdata.putAll(OB_IAX_PRODADMINISTRACION);
		 * 
		 * 
		 * 
		 * cargarListas(request); } catch (Exception e) {
		 * logger.error("Error en el servicio Axispro004Service - m�todo m_form", e);
		 * thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() },
		 * Constantes.MENSAJE_ERROR); }
		 */
	}

	public void m_guardar(HttpServletRequest request, Axispro009Action thisAction) {

		logger.debug("Axispro009Service m_guardar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {

			request.setAttribute("OK", "!OK");
			request.setAttribute("OK", "OK");
		} catch (Exception e) {
			logger.error("Error en el servicio Axispro009Service - m�todo m_guardar", e);
			thisAction.guardarMensaje(request, "1000052", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

}
