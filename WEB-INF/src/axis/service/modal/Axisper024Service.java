package axis.service.modal;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_PERSONA;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.control.modal.Axisper024Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

/**
 * Axisper024Service.java 11/01/2010
 * 
 * @since Java 5.0
 */
@SuppressWarnings("all")
public class Axisper024Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE INICIALIZACION
	 *******************************************/

	/**
	 */
	public

			void m_init(HttpServletRequest request, Axisper024Action thisAction) {
		logger.debug("Axisper024Service m_init");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {

		} catch (Exception e) {
			logger.error("Error en el servicio Axisper024Service - m�todo m_init", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);

		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	/**
	 * 
	 * @param request
	 */
	public void m_form(HttpServletRequest request, Axisper024Action thisAction) {
		logger.debug("Axisper024Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {

			PAC_IAX_PERSONA pac_iax_persona = new PAC_IAX_PERSONA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			BigDecimal CTIPIDE = getCampoNumerico(request, "CTIPIDE");
			BigDecimal SWPUBLI = getCampoNumerico(request, "SWPUBLI");
			String NNUMIDE = getCampoTextual(request, "NNUMIDE");
			String NOMBRE = getCampoTextual(request, "NOMBRE");
			String SNIP = getCampoTextual(request, "SNIP");
			String NOM = getCampoTextual(request, "NOM");
			String COGNOM = getCampoTextual(request, "COGNOM");
			String COGNOM2 = getCampoTextual(request, "COGNOM2");
			java.sql.Date FNACIMI = this.stringToSqlDate(getCampoTextual(request, "FNACIMI"));
			String TDOMICI = getCampoTextual(request, "TDOMICI");
			String CPOSTAL = getCampoTextual(request, "CPOSTAL");
			BigDecimal ESTSEGURO = (BigDecimal) AbstractDispatchAction.topPila(request, "SSEGURO");

			if (!isEmpty(NNUMIDE)) {
				Map m = pac_iax_persona.ejecutaPAC_IAX_PERSONA__F_GET_DET_PERSONA(NNUMIDE, NOMBRE, SNIP, NOM, COGNOM,
						COGNOM2, CTIPIDE, FNACIMI, TDOMICI, CPOSTAL, SWPUBLI, ESTSEGURO);
				logger.debug(m);

				ArrayList lista = (ArrayList) this.tratarRETURNyMENSAJES(request, m, false);

				formdata.put("personas", lista);
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisper024Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));

	}

}
