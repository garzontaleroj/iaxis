package axis.service.modal;

import java.math.BigDecimal;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_GFI;
import axis.mvc.control.modal.Axisgfi024Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

public class Axisgfi024Service extends AxisBaseService {
	static Log logger = LogFactory.getLog(Axisgfi024Service.class);

	/**
	 * M�todo inicial al llamar a �ste flujo.
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_init(HttpServletRequest request, Axisgfi024Action thisAction) {
		logger.debug("Axisgfi024Service m_init");
		try {
			request.getSession().removeAttribute("axisctr_listaPolizas");
		} catch (Exception e) {
			logger.error("Error en el servicio Axisgfi024Service - m�todo m_init", e);
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
	 * M�todo que se llama al principio del flujo.
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_form(HttpServletRequest request, Axisgfi024Action thisAction) {
		logger.debug("Axisgfi024Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {

			String TERMINO = getCampoTextual(request, "TERMINO");
			BigDecimal CODIGO = getCampoNumerico(request, "CODIGO");
			request.setAttribute("TERMINO", TERMINO);
			request.setAttribute("CLAVE", CODIGO);

			if (!isEmpty(CODIGO)) {
				Map map = new PAC_IAX_GFI((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_GFI__F_GET_TERMVIGENCIA(TERMINO, CODIGO);
				logger.debug("----------- termino:" + map);
				// formdata.put("TERMINO",tratarRETURNyMENSAJES(request,map));
				request.setAttribute("TERMVIGENCIA", tratarRETURNyMENSAJES(request, map));
				request.setAttribute("ISNEW", 0);
			} else {
				request.setAttribute("ISNEW", 1);
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisgfi024Service - m�todo m_form", e);
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
	 * M�todo que se llama cuando se selecciona una vigencia.
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_aceptar(HttpServletRequest request, Axisgfi024Action thisAction) {
		logger.debug("Axisgfi024Service m_aceptar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		try {

			String TERMINO = getCampoTextual(request, "TERMINO");
			BigDecimal CLAVE = getCampoNumerico(request, "CLAVE");
			java.sql.Date FECHA_EFE = null;
			FECHA_EFE = AxisBaseService.stringToSqlDate(getCampoTextual(request, "FECHA_EFE"));
			BigDecimal VALOR = getCampoNumerico(request, "VALOR");
			BigDecimal isNew = getCampoNumerico(request, "ISNEW");

			Map map = new PAC_IAX_GFI((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_GFI__F_GRABARTERMVIG(TERMINO, CLAVE, FECHA_EFE, VALOR, isNew);
			logger.debug(map);
			request.setAttribute("ERROR", tratarRETURNyMENSAJES(request, map));

		} catch (Exception e) {
			logger.error("Error en el servicio Axisgfi024Service - m�todo m_aceptar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

}
