package axis.service.modal;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.jdbc.PAC_IAX_REDCOMERCIAL;
import axis.jdbc.SINPAQUETE;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

/**
 * Axisage004Service.java 23/12/2008
 * 
 * @author <a href="rkirchner@csi-ti.com">Roger Kirchner</a>
 * @since Java 5.0
 */
public class Axisage004Service extends AxisBaseService {
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
		logger.debug("Axisage004Service m_form");

		try {
			UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
			Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

			BigDecimal CAGENTE = getCampoNumerico(request, "CAGENTE");

			if (!isEmpty(CAGENTE)) {
				if (CAGENTE.equals(request.getSession().getAttribute("RED_DummyCodeAgent")))
					CAGENTE = BigDecimal.ONE;

				PAC_IAX_REDCOMERCIAL pac_iax_redcomercial = new PAC_IAX_REDCOMERCIAL(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

				/* Cargar datos agente */
				Map map = pac_iax_redcomercial.ejecutaPAC_IAX_REDCOMERCIAL__F_GET_DATOSAGENTE(CAGENTE);
				logger.debug(map);

				tratarRETURNyMENSAJES(request, map);

				formdata.put("AGENTE", map.get("AGENTE"));
				formdata.put("CONTRATOS", map.get("CONTRATOS"));

			}

			/* LISTVALORES */
			PAC_IAX_LISTVALORES pac_iax_listvalores = new PAC_IAX_LISTVALORES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map LISTVALORES = new HashMap();

			/* LSTEMPRESAS */
			Map map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTEMPRESAS();
			logger.debug(map);
			LISTVALORES.put("LSTEMPRESAS", tratarRETURNyMENSAJES(request, map));

			formdata.put("LISTVALORES", LISTVALORES);
			if ((formdata.get("FFIRCON") == null) || ((formdata.get("FFIRCON").equals("")))) {
				formdata.put("FFIRCON", new java.util.Date());
			}

			SINPAQUETE sinpaquete = new SINPAQUETE((java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map m = sinpaquete.ejecutaF_PAREMPRESA_T(new String("CONTRATOAGE"), usuario.getCempres());
			logger.debug("--> CONTRATOAGE:" + m);
			if (m.get("RETURN").equals(new String("S"))) {
				logger.debug("---> contraato:" + CAGENTE);
				formdata.put("NCONTRATO", CAGENTE);
			}

			formdata.put("CEMPRES", usuario.getCempres());

			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		} catch (Exception e) {
			logger.error("Error en el servicio Axisage004Service - m�todo m_form", e);
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
		logger.debug("Axisage004Service m_aceptar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {
			PAC_IAX_REDCOMERCIAL pac_iax_redcomercial = new PAC_IAX_REDCOMERCIAL(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			BigDecimal CAGENTE = getCampoNumerico(request, "CAGENTE");
			BigDecimal CEMPRES = getCampoNumerico(request, "CEMPRES");
			BigDecimal NCONTRATO = getCampoNumerico(request, "NCONTRATO");
			java.sql.Date FFIRCON = stringToSqlDate(getCampoTextual(request, "FFIRCON"));

			Map map = pac_iax_redcomercial.ejecutaPAC_IAX_REDCOMERCIAL__F_SET_CONTRATO(CEMPRES, CAGENTE, NCONTRATO,
					FFIRCON);
			logger.debug(map);
			request.setAttribute("grabarOK", BigDecimal.ZERO.equals(tratarRETURNyMENSAJES(request, map)));
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		} catch (Exception e) {
			logger.error("Error en el servicio Axisage004Service - m�todo m_aceptar", e);
			AbstractDispatchAction.guardarMensaje(request,
					"verbatim:<b>" + e.getClass().getName() + ":</b> " + e.getLocalizedMessage(),
					new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

}
