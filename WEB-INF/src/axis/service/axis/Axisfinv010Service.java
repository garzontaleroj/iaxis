package axis.service.axis;

import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_OPERATIVA_FINV;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.model.UsuarioBean;
import axis.util.Constantes;

/**
 * Axisfinv010Service.java 20/08/2008
 * 
 * @author <a href="lcalvo@csi-ti.com">Luz Calvo</a>
 * @since Java 5.0
 */
public class Axisfinv010Service extends AxisBaseService {
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
		logger.debug("Axisfinv010Service m_form");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		try {

			/*
			 * String PCMONORI = null; String PCMONDES = null;
			 * 
			 * PAC_IAX_OPERATIVA_FINV pac_axis_operativa = new
			 * PAC_IAX_OPERATIVA_FINV((java.sql.Connection)request.getAttribute(Constantes.
			 * DB01CONN)); Map mapa =
			 * pac_axis_operativa.ejecutaPAC_IAX_OPERATIVA_FINV__F_GETCOTIZACIONES(PCMONORI,
			 * PCMONDES); logger.debug(mapa);
			 * 
			 * List listaCotizaciones = (List)tratarRETURNyMENSAJES(request,mapa);
			 * 
			 * request.setAttribute("listaCot",listaCotizaciones);
			 */

		} catch (Exception e) {
			logger.error("Error en el servicio Axisfinv010Service - m�todo m_form", e);
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
		logger.debug("Axisfinv010Service m_busqueda");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		try {
			BigDecimal PCEMPRES = getCampoNumerico(request, "CEMPRES_MODAL");
			BigDecimal PCCODFON = getCampoNumerico(request, "CCODFON_MODAL");

			PAC_IAX_OPERATIVA_FINV pac_axis_operativa = new PAC_IAX_OPERATIVA_FINV(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map mapa = pac_axis_operativa.ejecutaPAC_IAX_OPERATIVA_FINV__F_GET_FONGASTOS(PCEMPRES, PCCODFON);
			logger.debug(mapa);

			List listaFondos = (List) tratarRETURNyMENSAJES(request, mapa);

			request.setAttribute("listaFon", listaFondos);

			request.setAttribute("CEMPRES_SEL", PCEMPRES);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisfinv010Service - m�todo m_busqueda", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}
}
