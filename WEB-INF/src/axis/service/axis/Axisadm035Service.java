package axis.service.axis;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_DEVOLUCIONES;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.model.UsuarioBean;
import axis.util.Constantes;

public class Axisadm035Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE INICIALIZACION
	 *******************************************/
	/*********************************************************************************************************************/

	/**
	 * 
	 * @param request
	 */
	@SuppressWarnings("all")
	public void m_form(HttpServletRequest request) {
		logger.debug("Axisadm035Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		/*
		 * Map formdata=(Map)request.getAttribute(Constantes.FORMDATA); try { BigDecimal
		 * SDEVOLU = getCampoNumerico(request, "SDEVOLU"); if (!isEmpty(SDEVOLU) &&
		 * SDEVOLU.intValue() > 0) { PAC_IAX_DEVOLUCIONES pac_iax_devoluciones= new
		 * PAC_IAX_DEVOLUCIONES((java.sql.Connection)request.getAttribute(Constantes.
		 * DB01CONN));
		 * 
		 * Map map1=pac_iax_devoluciones.
		 * ejecutaPAC_IAX_DEVOLUCIONES__F_GET_DATOS_RECIBOS_DEVOL(SDEVOLU);
		 * logger.debug(map1);
		 * 
		 * if (BigDecimal.ZERO.equals(tratarRETURNyMENSAJES(request, map1)))
		 * formdata.put("recibos",map1.get("PLSTRECIBOS"));
		 * 
		 * }
		 * 
		 * } catch (Exception e) {
		 * logger.error("Error en el servicio Axisadm035Service - m�todo m_form", e);
		 * AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] {
		 * e.toString() }, Constantes.MENSAJE_ERROR); }
		 */
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	public void m_ejecutar(HttpServletRequest request) {
		logger.debug("Axisadm035Service m_ejecutar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {

			PAC_IAX_DEVOLUCIONES pac_iax_devoluciones = new PAC_IAX_DEVOLUCIONES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			Map map1 = pac_iax_devoluciones.ejecutaPAC_IAX_DEVOLUCIONES__F_EXEC_DEVOLU();
			logger.debug(map1);
			tratarRETURNyMENSAJES(request, map1);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm035Service - m�todo m_ejecutar", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}

}
