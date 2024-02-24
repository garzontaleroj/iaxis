package axis.service.axis;

import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_FE_VIDA;
import axis.jdbc.PAC_IAX_PRODUCCION;
import axis.mvc.control.axis.Axisctr111Action;
import axis.mvc.model.UsuarioBean;
import axis.util.Constantes;

public class Axisctr111Service extends AxisBaseService {
	static Log logger = LogFactory.getLog(Axisctr111Service.class);
	SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");

	public void m_init(HttpServletRequest request, Axisctr111Action thisAction) {
		logger.debug("Axisctr111Service m_init");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {
			formdata.remove("FANULAC");
			thisAction.guardarMensaje(request, "9901460", new Object[] { "" }, Constantes.MENSAJE_INFO);
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr111Service - m�todo m_init", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE INICIALIZACION
	 *******************************************/
	/*********************************************************************************************************************/

	public void m_form(HttpServletRequest request, Axisctr111Action thisAction) {
		logger.debug("Axisctr111Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {
			BigDecimal SSEGURO = null;
			if (formdata.get("SSEGURO") != null && formdata.get("SSEGURO").toString().length() > 0) {
				SSEGURO = new BigDecimal(formdata.get("SSEGURO").toString());
			}
			PAC_IAX_PRODUCCION pacIaxProduccion = new PAC_IAX_PRODUCCION(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			HashMap m = null;
			HashMap map = null;

			if (SSEGURO != null) {
				map = pacIaxProduccion.ejecutaPAC_IAX_PRODUCCION__F_SET_CONSULTAPOLIZA(SSEGURO);
				logger.debug(map);
				tratarRETURNyMENSAJES(request, map, false);
				////////////////// DATOS POLIZA ////////////////////////////////////
				map = pacIaxProduccion.ejecutaPAC_IAX_PRODUCCION__F_GET_DATPOLIZA(SSEGURO);
				logger.debug(map);
				tratarRETURNyMENSAJES(request, map);
				request.setAttribute("datpoliza", map.get("RETURN"));

				map = pacIaxProduccion.ejecutaPAC_IAX_PRODUCCION__F_LEETOMADORES();
				logger.debug(map);
				tratarRETURNyMENSAJES(request, map, false);
				request.setAttribute("tomadores", map.get("RETURN"));

				map = pacIaxProduccion.ejecutaPAC_IAX_PRODUCCION__F_GET_GESTRIESGOS();
				logger.debug(map);
				List<Map> T_IAX_GESTRIESGOS = (List) tratarRETURNyMENSAJES(request, map, false);
				logger.debug(T_IAX_GESTRIESGOS);
				request.setAttribute("T_IAX_GESTRIESGOS", T_IAX_GESTRIESGOS);
				PAC_IAX_FE_VIDA pac_iax_fe_vida = new PAC_IAX_FE_VIDA(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
				map = pac_iax_fe_vida.ejecutaPAC_IAX_FE_VIDA__F_PERCEPTORES_RENTA(SSEGURO);
				logger.debug(map);
				request.setAttribute("PERCEPTORES", tratarRETURNyMENSAJES(request, map, false));

				thisAction.guardarMensaje(request, "9901460", new Object[] { "" }, Constantes.MENSAJE_INFO);
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr111Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	public void m_confirmar(HttpServletRequest request, Axisctr111Action thisAction) {
		logger.debug("Axisctr111Service m_confirmar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {

			PAC_IAX_FE_VIDA pac_iax_fe_vida = new PAC_IAX_FE_VIDA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			BigDecimal NPOLIZA = getCampoNumerico(request, "NPOLIZA");
			BigDecimal NCERTIF = getCampoNumerico(request, "NCERTIF");
			String params = this.getCampoTextual(request, "PARAMS");
			logger.debug(params);

			Map map = pac_iax_fe_vida.ejecutaPAC_IAX_FE_VIDA__F_CONFIRMAR_FE_VIDA(NPOLIZA, NCERTIF, params);
			logger.debug(map);
			logger.debug("map:" + map);
			tratarRETURNyMENSAJES(request, map);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr111Service - m�todo m_confirmar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

}
