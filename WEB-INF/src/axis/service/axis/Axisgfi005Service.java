package axis.service.axis;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_GFI;
import axis.mvc.control.axis.Axisgfi005Action;
import axis.mvc.model.UsuarioBean;
import axis.util.Constantes;

public class Axisgfi005Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE INICIALIZACION
	 *******************************************/

	/*********************************************************************************************************************/
	public

			void m_init(HttpServletRequest request, Axisgfi005Action thisAction) {
		logger.debug("Axisgfi005Service m_init");
		try {
		} catch (Exception e) {
			logger.error("Error en el servicio Axisgfi005Service - m�todo m_init", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	public void m_form(HttpServletRequest request, Axisgfi005Action thisAction) {
		logger.debug("Axisgfi005Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {

		} catch (Exception e) {
			logger.error("Error en el servicio Axisgfi005Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	private void cargarDatosCombos(HttpServletRequest request) throws Exception {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
	}

	public void m_buscar(HttpServletRequest request, Axisgfi005Action thisAction) {
		logger.debug("Axisgfi005Service m_buscar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {

			String TERMINO = (getCampoTextual(request, "TERMINO") == null ? getCampoTextual(request, "TERMINO_BUS")
					: getCampoTextual(request, "TERMINO"));
			String TIPO = (getCampoTextual(request, "TIPO") == null ? getCampoTextual(request, "TIPO_BUS")
					: getCampoTextual(request, "TIPO"));
			BigDecimal ORIGEN = (getCampoNumerico(request, "ORIGEN") == null ? getCampoNumerico(request, "ORIGEN_BUS")
					: getCampoNumerico(request, "ORIGEN"));
			String DESCRIPCION = (getCampoTextual(request, "DESCRIPCION") == null
					? getCampoTextual(request, "DESCRIPCION_BUS")
					: getCampoTextual(request, "DESCRIPCION"));
			BigDecimal OPERADOR = (getCampoNumerico(request, "OPERADOR") == null
					? getCampoNumerico(request, "OPERADOR_BUS")
					: getCampoNumerico(request, "OPERADOR"));

			request.setAttribute("TERMINO_BUS", TERMINO);
			request.setAttribute("TIPO_BUS", TIPO);
			request.setAttribute("ORIGEN_BUS", ORIGEN);
			request.setAttribute("DESCRIPCION_BUS", DESCRIPCION);
			request.setAttribute("OPERADOR_BUS", OPERADOR);

			formdata.put("BUSQUEDA", 1);

			Map map = new PAC_IAX_GFI((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_GFI__F_GET_TERMINOS(TERMINO, TIPO, ORIGEN, DESCRIPCION, OPERADOR);
			logger.debug("----------- terminos:" + map);
			formdata.put("TERMINOS", (List) tratarRETURNyMENSAJES(request, map));

		} catch (Exception e) {
			logger.error("Error en el servicio Axisgfi005Service - m�todo m_buscar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	public void m_borrar(HttpServletRequest request, Axisgfi005Action thisAction) {
		logger.debug("Axisgfi005Service m_borrar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {

			String TERMINO = getCampoTextual(request, "PTERMINO");

			Map map = new PAC_IAX_GFI((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_GFI__F_ELIMINARTERMINO(TERMINO);
			logger.debug(map);
			tratarRETURNyMENSAJES(request, map);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisgfi005Service - m�todo m_borrar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

}
