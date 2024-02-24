package axis.service.axis;

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
import axis.util.Constantes;

/**
 * Axisrea011Service.java 29/06/2009
 * 
 * @since Java 5.0
 */
public class Axisrea011Service extends AxisBaseService {
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
		logger.debug("Axisrea011Service m_form");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {

			BigDecimal SSEGURO = getCampoNumerico(request, "SSEGURO");

			if (!isEmpty(SSEGURO)) {
				PAC_IAX_REA pacIaxRea = new PAC_IAX_REA(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
				Map mapa = pacIaxRea.ejecutaPAC_IAX_REA__F_GET_CONSULTA_DET_CESIONES(SSEGURO);
				logger.debug(mapa);
				ArrayList lista = (ArrayList) tratarRETURNyMENSAJES(request, mapa);
				ArrayList jum = new ArrayList();

				for (int i = 0; i < lista.size(); i++) {
					Map m = (Map) lista.get(i);

					BigDecimal vicesion = (BigDecimal) m.get("ICESION");
					if (vicesion == null) {
						BigDecimal vicesion_cp = (BigDecimal) m.get("ICESION_CP");
						m.put("ICESION", vicesion_cp);
					}
					BigDecimal vpcesion = (BigDecimal) m.get("PCESION");
					if (vpcesion == null) {
						BigDecimal vpcesion_cp = (BigDecimal) m.get("PCESION_CP");
						m.put("PCESION", vpcesion_cp);

					}

					jum.add(m);
				}

				request.setAttribute("T_IAX_CESIONESREA", jum);

				// MLR - 05/04/2013 - 0025803: RSA001 - Ampliar los decimales que utiliza iAXIS
				PAC_IAX_ECO_MONEDAS pac_iax_eco_monedas = new PAC_IAX_ECO_MONEDAS(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
				mapa = pac_iax_eco_monedas.ejecutaPAC_IAX_ECO_MONEDAS__F_OBTENER_MONEDA_SEGURO2(SSEGURO);
				logger.debug(mapa);
				request.getSession().setAttribute(("CMONEDAPROD"), mapa.get("RETURN"));
			}
			this.formattingNumericValues(request);
		} catch (Exception e) {
			logger.error("Error en el servicio Axisrea011Service - m�todo m_form", e);
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
