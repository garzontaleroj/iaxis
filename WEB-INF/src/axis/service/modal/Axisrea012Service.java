package axis.service.modal;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_ECO_MONEDAS;
import axis.jdbc.PAC_IAX_REA;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

/**
 * Axisrea012Service.java 29/06/2009
 * 
 * @since Java 5.0
 */
@SuppressWarnings("all")
public class Axisrea012Service extends AxisBaseService {
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
	public void m_form(HttpServletRequest request) {
		logger.debug("Axisrea012Service m_form");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		try {

			PAC_IAX_REA pacIaxRea = new PAC_IAX_REA((java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			BigDecimal SSEGURO = getCampoNumerico(request, "SSEGURO");
			BigDecimal NMOVIMI = getCampoNumerico(request, "NMOVIMI");
			BigDecimal SREAEMI = getCampoNumerico(request, "SREAEMI");
			BigDecimal primeraCarrega = getCampoNumerico(request, "primeraCarrega");

			if (!primeraCarrega.equals(new BigDecimal(1))) {
				if (!isEmpty(SSEGURO)) {
					Map map = pacIaxRea.ejecutaPAC_IAX_REA__F_GET_RECIBOS_CES(SSEGURO, NMOVIMI);
					logger.debug(map);
					request.getSession().setAttribute("T_IAX_RECIBOSCES_SESION", tratarRETURNyMENSAJES(request, map));
					request.setAttribute("T_IAX_RECIBOSCES", tratarRETURNyMENSAJES(request, map));

					// MLR - 05/04/2013 - 0025803: RSA001 - Ampliar los decimales que utiliza iAXIS
					PAC_IAX_ECO_MONEDAS pac_iax_eco_monedas = new PAC_IAX_ECO_MONEDAS(
							(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
					Map mapa = pac_iax_eco_monedas.ejecutaPAC_IAX_ECO_MONEDAS__F_OBTENER_MONEDA_SEGURO2(SSEGURO);
					logger.debug(mapa);
					request.getSession().setAttribute(("CMONEDAPROD"), mapa.get("RETURN"));
				}
			} else {

				// ((Map)request.getAttribute("__formdata")).get("T_IAX_RECIBOSCES"));
				// request.setAttribute("T_IAX_RECIBOSCES",request.getAttribute("T_IAX_RECIBOSCES"));"
				// +
				request.setAttribute("SREAEMISELCCIONAT", SREAEMI);
				request.setAttribute("REBUTSELECCIONAT", SREAEMI);
				ArrayList T_IAX_RECIBOSCES = (ArrayList) request.getSession().getAttribute("T_IAX_RECIBOSCES_SESION");
				request.setAttribute("T_IAX_RECIBOSCES", T_IAX_RECIBOSCES);

				Map map = pacIaxRea.ejecutaPAC_IAX_REA__F_GET_DATOSRECIBO_CES(SREAEMI);
				logger.debug(map);
				request.setAttribute("T_IAX_DATOS_RECIBOS_CES", tratarRETURNyMENSAJES(request, map));

			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisrea012Service - m�todo m_form", e);
			AbstractDispatchAction.guardarMensaje(request,
					"verbatim:<b>" + e.getClass().getName() + ":</b> " + e.getLocalizedMessage(),
					new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}

	/*********************************************************************************************************************/
	/************************************************
	 * M�TODOS DE ACTUALIZACI�N
	 *******************************************/
	/*********************************************************************************************************************/

}
