package axis.service.modal;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_CONTRAGARAN;
import axis.jdbc.PAC_IAX_PERSONA;
import axis.jdbc.PAC_IAX_PRODUCCION;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

/**
 * Axisctr511Service.java Fecha: 22/01/2021
 * 
 * @author <a href = "mailto:bartolo.herrera@tcs.com">Bartolo Herrera</a>
 * @since Java 5.0
 */
public class Axisctr511Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE INICIALIZACION
	 *******************************************/
	/*********************************************************************************************************************/

	@SuppressWarnings("all")
	public void m_form(HttpServletRequest request) {
		logger.debug("Axisctr511Service m_form");

		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {

			PAC_IAX_PERSONA pac_iax_personas = new PAC_IAX_PERSONA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			PAC_IAX_CONTRAGARAN pac_IAX_CONTRAGARAN = new PAC_IAX_CONTRAGARAN(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			BigDecimal SCONTGAR = getCampoNumerico(request, "SCONTGAR");
			BigDecimal SPERSON = getCampoNumerico(request, "SPERSON");

			Map map = pac_iax_personas.ejecutaPAC_IAX_PERSONA__F_GET_INF_FINANCIERA(SPERSON, BigDecimal.ONE);
			List<Map> TOMADOR = (List<Map>) tratarRETURNyMENSAJES(request, map);

			request.getSession().setAttribute("TOMADOR", TOMADOR);

			Map mapListaCodeudor = pac_IAX_CONTRAGARAN.ejecutaPAC_IAX_CONTRAGARANTIAS__F_GET_CONTRAGARAN_CODE(SCONTGAR);
			List CODEUDORES = (List) tratarRETURNyMENSAJES(request, mapListaCodeudor);

			request.getSession().setAttribute("CODEUDORES", CODEUDORES);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr511Service - m�todo m_form", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}

	private List dbLeeTomadores(HttpServletRequest request, UsuarioBean usuario) throws Exception {
		Map map = new PAC_IAX_PRODUCCION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_PRODUCCION__F_LEETOMADORES();
		logger.debug("LISTA DE TOMADORES BBDD ->" + map);
		return (List) tratarRETURNyMENSAJES(request, map);
	}

	private HashMap getTomador(HttpServletRequest request, ArrayList<HashMap> tomadores) {

		// DIRECCIONES=[{OB_IAX_DIRECCIONES={
		try {
			HashMap tomador = null;
			if (!isEmpty(tomadores) && tomadores.size() > 0) {
				logger.debug("tomadores-->" + tomadores);
				for (HashMap tom : tomadores) {
					logger.debug("dom-->" + tom);
					logger.debug("OB_IAX_TOMADORES:" + tom.get("OB_IAX_TOMADORES"));
					HashMap m = (HashMap) tom.get("OB_IAX_TOMADORES");

					return m;
				}

			}
			return tomador;
		} catch (Exception e) {
			return null;
		}

	}

}
