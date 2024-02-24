package axis.service.modal;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_MANDATOS;
import axis.mvc.control.modal.Axisman006Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

/**
 * Axisman006Service.java
 * 
 * @since Java 5.0
 */
@SuppressWarnings("all")
public class Axisman006Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());
	private String pmodo;

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE INICIALIZACION
	 *******************************************/

	/*********************************************************************************************************************/
	public

			void m_init(HttpServletRequest request, Axisman006Action thisAction) {

		try {
			logger.debug("Axisman006Service m_init");
			UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
			Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

			request.getSession().setAttribute("listmandatos", null);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisman006Service - m�todo m_init", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);

		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	/**
	 * 
	 * @param request
	 */
	public void m_form(HttpServletRequest request, Axisman006Action thisAction) {
		logger.debug("Axisman006Service m_form");
		try {

			this.cargar_valores(request, thisAction);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisman006Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {

			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	public void cargar_valores(HttpServletRequest request, Axisman006Action thisAction) {

		try {
			Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
			BigDecimal NOMINA = getCampoNumerico(request, "NOMINA");
			formdata.put("NOMINA", NOMINA);
			PAC_IAX_MANDATOS pac_axis_common = new PAC_IAX_MANDATOS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map m = pac_axis_common.ejecutaPAC_IAX_MANDATOS__F_CONSULTA_DOCUMENTOS(NOMINA);
			logger.debug(m);
			List plReturn = (List) tratarRETURNyMENSAJES(request, m);

			request.getSession().setAttribute("listdocumentos", plReturn);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisman006Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}

	}

}
