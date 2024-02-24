package axis.service.axis;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_OPERATIVA_FINV;
import axis.jdbc.PAC_IAX_REA;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.model.UsuarioBean;
import axis.util.Constantes;

/**
 * Axisrea057Service.java 23/04/2019
 * 
 * @author <a href="darodriguez.ext@confianza.com.co">Daniel Rodr�guez</a>
 * @since Java 5.0
 */
public class Axisrea057Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());
	SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");

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
		logger.debug("Axisrea057Service m_form");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		try {

			Date PFINITRIM = AxisBaseService.stringToSqlDate(null, "dd/MM/yyyy");
			Date PFFINTRIM = AxisBaseService.stringToSqlDate(null, "dd/MM/yyyy");

			PAC_IAX_REA pac_axis_rea = new PAC_IAX_REA((java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map mapa = pac_axis_rea.ejecutaPAC_IAX_REA__F_GET_TRIMESTRES(PFINITRIM, PFFINTRIM);
			logger.debug(mapa);

			List listaPats = (List) tratarRETURNyMENSAJES(request, mapa);

			request.setAttribute("listaPats", listaPats);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisrea057Service - m�todo m_form", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
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
	public void m_busqueda(HttpServletRequest request) {
		logger.debug("Axisrea057Service m_busqueda");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		try {

			String PCMONORI = getCampoTextual(request, "B_MONORIG");
			String PCMONDES = getCampoTextual(request, "B_MONDES");

			PAC_IAX_OPERATIVA_FINV pac_axis_operativa = new PAC_IAX_OPERATIVA_FINV(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map mapa = pac_axis_operativa.ejecutaPAC_IAX_OPERATIVA_FINV__F_GETCOTIZACIONES(PCMONORI, PCMONDES);
			logger.debug(mapa);

			List listaCotizaciones = (List) tratarRETURNyMENSAJES(request, mapa);

			request.setAttribute("listaCot", listaCotizaciones);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisrea057Service - m�todo m_busqueda", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}
}
