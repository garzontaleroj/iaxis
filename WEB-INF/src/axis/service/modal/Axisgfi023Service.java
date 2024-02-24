package axis.service.modal;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_GFI;
import axis.mvc.control.modal.Axisgfi023Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

public class Axisgfi023Service extends AxisBaseService {
	static Log logger = LogFactory.getLog(Axisgfi023Service.class);

	/**
	 * M�todo inicial al llamar a �ste flujo.
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_init(HttpServletRequest request, Axisgfi023Action thisAction) {
		logger.debug("Axisgfi023Service m_init");
		try {
			request.getSession().removeAttribute("axisctr_listaPolizas");
		} catch (Exception e) {
			logger.error("Error en el servicio Axisgfi023Service - m�todo m_init", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE INICIALIZACION
	 *******************************************/
	/*********************************************************************************************************************/
	/**
	 * M�todo que se llama al principio del flujo. Se encarga de realizar la carga
	 * de productos para realizar la b�squeda de una p�liza.
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_form(HttpServletRequest request, Axisgfi023Action thisAction) {
		logger.debug("Axisgfi023Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {

			String TERMINO = getCampoTextual(request, "TERMINO");

			Map map = new PAC_IAX_GFI((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_GFI__F_GET_TERMVIGENCIAS(TERMINO);
			logger.debug("---- vigencias del termino:" + map);
			request.setAttribute("VIGENCIAS", (List) tratarRETURNyMENSAJES(request, map));
			request.setAttribute("TERMINO", TERMINO);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisgfi023Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE ACTUALIZACION
	 ********************************************/
	/*********************************************************************************************************************/
	/**
	 * M�todo que se llama cuando se borra una vigencia.
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_borrar(HttpServletRequest request, Axisgfi023Action thisAction) {
		logger.debug("Axisgfi023Service m_borrar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		try {

			String TERMINO = getCampoTextual(request, "TERMINO");
			BigDecimal CLAVE = getCampoNumerico(request, "CODIGO");

			Map map = new PAC_IAX_GFI((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_GFI__F_ELIMINARTERMVIGEN(TERMINO, CLAVE);
			tratarRETURNyMENSAJES(request, map);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisgfi023Service - m�todo m_borrar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

}
