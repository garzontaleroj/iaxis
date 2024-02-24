package axis.service.modal;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

public class Axisfinv001Service extends AxisBaseService {
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
		logger.debug("Axisfinv001Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {
			BigDecimal CEMPRES = getCampoNumerico(request, "CEMPRES");
			PAC_IAX_LISTVALORES pac_iax_listvalores = new PAC_IAX_LISTVALORES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			Map map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTEMPRESAS();
			List T_IAX_EMPRESAS = (List) tratarRETURNyMENSAJES(request, map);
			logger.debug(T_IAX_EMPRESAS);

			request.setAttribute("T_IAX_EMPRESAS", !isEmpty(T_IAX_EMPRESAS) ? T_IAX_EMPRESAS : new ArrayList());
			request.setAttribute("selected_CEMPRES", !isEmpty(CEMPRES) ? CEMPRES : null);
			request.setAttribute("soluna_CEMPRES", 0);
			this.m_cargar_fondos(request);
			if (!isEmpty(T_IAX_EMPRESAS) && T_IAX_EMPRESAS.size() == 1) {
				// Solo hay un elemento, inhabilitaremos la lista de empresas y su valor por
				// defecto ser� el del �nico elemento que tiene
				request.setAttribute("selected_CEMPRES", ((Map) T_IAX_EMPRESAS.get(0)).get("CEMPRES"));
				request.setAttribute("CEMPRES", ((Map) T_IAX_EMPRESAS.get(0)).get("CEMPRES"));
				request.setAttribute("soluna_CEMPRES", 1);
				// Cargamos los fondos de inversion
			}
		} catch (Exception e) {
			logger.error("Error en el servicio Axisfinv001Service - m�todo m_form", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}

		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	/**
	 * M�todo que carga los fondos de inversi�n en funci�n de un CEMPRES dado.
	 * 
	 * @param request
	 */
	public void m_cargar_fondos(HttpServletRequest request) {
		logger.debug("Axisfinv001Service m_cargar_fondos");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {
			BigDecimal CEMPRES = getCampoNumerico(request, "CEMPRES");

			PAC_IAX_LISTVALORES pac_iax_listvalores = new PAC_IAX_LISTVALORES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			Map map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_FONDOSINVERSION(CEMPRES);
			List T_IAX_FONDOS = (List) tratarRETURNyMENSAJES(request, map);
			logger.debug(T_IAX_FONDOS);

			request.setAttribute("T_IAX_FONDOS", !isEmpty(T_IAX_FONDOS) ? T_IAX_FONDOS : new ArrayList());

		} catch (Exception e) {
			logger.error("Error en el servicio Axisfinv001Service - m�todo m_cargar_fondos", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}

		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}
}
