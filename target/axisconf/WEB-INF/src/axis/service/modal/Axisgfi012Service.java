package axis.service.modal;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_GFI;
import axis.mvc.control.modal.Axisgfi012Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

public class Axisgfi012Service extends AxisBaseService {
	static Log logger = LogFactory.getLog(Axisgfi012Service.class);

	/**
	 * M�todo inicial al llamar a �ste flujo.
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_init(HttpServletRequest request, Axisgfi012Action thisAction) {
		logger.debug("Axisgfi012Service m_init");
		try {
			request.getSession().removeAttribute("axisctr_listaPolizas");
		} catch (Exception e) {
			logger.error("Error en el servicio Axisgfi012Service - m�todo m_init", e);
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
	public void m_form(HttpServletRequest request, Axisgfi012Action thisAction) {
		logger.debug("Axisgfi012Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {

			this.cargarDatosCombos(request);

			String TERMINO = getCampoTextual(request, "TERMINO");
			BigDecimal nuevo = getCampoNumerico(request, "NUEVO");
			request.setAttribute("ISNEW", nuevo);

			if (!isEmpty(nuevo) && nuevo.intValue() == 0) {
				Map map = new PAC_IAX_GFI((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_GFI__F_GET_TERMINO(TERMINO);
				logger.debug("----------- termino:" + map);
				// formdata.put("TERMINO",tratarRETURNyMENSAJES(request,map));
				request.setAttribute("TERMINO", tratarRETURNyMENSAJES(request, map));
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisgfi012Service - m�todo m_form", e);
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
	 * M�todo que se llama cuando se selecciona una p�liza.
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_aceptar(HttpServletRequest request, Axisgfi012Action thisAction) {
		logger.debug("Axisgfi012Service m_aceptar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		try {

			String TERMINO = (getCampoTextual(request, "TERMINO") == null ? getCampoTextual(request, "TERMINO_OLD")
					: getCampoTextual(request, "TERMINO"));
			String TIPO = getCampoTextual(request, "TIPO");
			BigDecimal ORIGEN = getCampoNumerico(request, "ORIGEN");
			String DESCRIPCION = getCampoTextual(request, "DESCRIPCION");
			BigDecimal OPERADOR = getCampoNumerico(request, "OPERADOR");
			BigDecimal isNew = getCampoNumerico(request, "ISNEW");

			Map map = new PAC_IAX_GFI((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_GFI__F_GRABARTERMINO(TERMINO, TIPO, ORIGEN, DESCRIPCION, OPERADOR, isNew);
			logger.debug(map);
			request.setAttribute("ERROR", tratarRETURNyMENSAJES(request, map));

		} catch (Exception e) {
			logger.error("Error en el servicio Axisgfi012Service - m�todo m_aceptar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	private void cargarDatosCombos(HttpServletRequest request) throws Exception {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		// Lista empresas
		Map map = new PAC_IAX_GFI((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_GFI__F_GET_LSTTIPOTERM();
		logger.debug(map);

		List tipo = (List) tratarRETURNyMENSAJES(request, map);
		request.setAttribute("TIPOS", tipo);

		map = new PAC_IAX_GFI((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_GFI__F_GET_LSTORIGEN();
		logger.debug(map);

		List origen = (List) tratarRETURNyMENSAJES(request, map);
		request.setAttribute("ORIGENES", origen);

		map = new PAC_IAX_GFI((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_GFI__F_GET_LSTOPERADOR();
		logger.debug(map);

		List operador = (List) tratarRETURNyMENSAJES(request, map);
		request.setAttribute("OPERADORES", operador);

	}

}
