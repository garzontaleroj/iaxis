package axis.service.modal;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.jdbc.PAC_IAX_REDCOMERCIAL;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

/**
 * Axisage020Action.java 28/02/2012
 * 
 * @author <a href="rkirchner@csi-ti.com">Alex Martinez</a>
 * @since Java 5.0
 */
public class Axisage020Service extends AxisBaseService {
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
		logger.debug("Axisage020Service m_form");

		try {
			UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
			Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
			PAC_IAX_REDCOMERCIAL pac_iax_redcomercial = new PAC_IAX_REDCOMERCIAL(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			BigDecimal CAGENTE = getCampoNumerico(request, "CAGENTE");
			BigDecimal NORDEN = getCampoNumerico(request, "NORDEN");
			formdata.put("CAGENTE", CAGENTE);

			formdata.put("NORDEN", NORDEN);

			if (!isEmpty(NORDEN)) {
				Map m = pac_iax_redcomercial.ejecutaPAC_IAX_REDCOMERCIAL__F_GET_CONTACTOAGE(CAGENTE, NORDEN);
				logger.debug("--->contacto:" + m);
				tratarRETURNyMENSAJES(request, m);

				formdata.putAll((Map) m.get("PCONTACTO"));
			}

			/* LISTVALORES */
			PAC_IAX_LISTVALORES pac_iax_listvalores = new PAC_IAX_LISTVALORES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map LISTVALORES = new HashMap();

			/* LSTEMPRESAS */
			Map map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(800074));
			logger.debug(map);
			LISTVALORES.put("LSTTIPO", tratarRETURNyMENSAJES(request, map));

			formdata.put("LISTVALORES", LISTVALORES);

			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));

		} catch (Exception e) {
			logger.error("Error en el servicio Axisage020Service - m�todo m_form", e);
			AbstractDispatchAction.guardarMensaje(request,
					"verbatim:<b>" + e.getClass().getName() + ":</b> " + e.getLocalizedMessage(),
					new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

	/*********************************************************************************************************************/
	/************************************************
	 * M�TODOS DE ACTUALIZACI�N
	 *******************************************/
	/*********************************************************************************************************************/

	/**
	 * 
	 * @param request
	 */
	@SuppressWarnings("all")
	public void m_aceptar(HttpServletRequest request) {
		logger.debug("Axisage020Service m_aceptar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {

			PAC_IAX_REDCOMERCIAL pac_iax_redcomercial = new PAC_IAX_REDCOMERCIAL(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			BigDecimal CAGENTE = getCampoNumerico(request, "CAGENTE");
			BigDecimal NORDEN = getCampoNumerico(request, "NORDEN");
			BigDecimal CTIPO = getCampoNumerico(request, "CTIPO");
			BigDecimal TELEFONO = getCampoNumerico(request, "TELEFONO");
			BigDecimal TELEFONO2 = getCampoNumerico(request, "TELEFONO2");
			BigDecimal FAX = getCampoNumerico(request, "FAX");
			String NOMBRE = getCampoTextual(request, "NOMBRE");
			String CARGO = getCampoTextual(request, "CARGO");
			String WEB = getCampoTextual(request, "WEB");
			String EMAIL = getCampoTextual(request, "EMAIL");

			Map map = pac_iax_redcomercial.ejecutaPAC_IAX_REDCOMERCIAL__F_SET_AGE_CONTACTO(CAGENTE, CTIPO, NORDEN,
					NOMBRE, CARGO, null, TELEFONO, TELEFONO2, FAX, WEB, EMAIL);
			logger.debug(map);
			BigDecimal ok = (BigDecimal) tratarRETURNyMENSAJES(request, map);
			formdata.put("OK", ok);

			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));

		} catch (Exception e) {
			logger.error("Error en el servicio Axisage020Service - m�todo m_aceptar", e);
			AbstractDispatchAction.guardarMensaje(request,
					"verbatim:<b>" + e.getClass().getName() + ":</b> " + e.getLocalizedMessage(),
					new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

}
