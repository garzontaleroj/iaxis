package axis.service.axis;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_LISTADOS_WM;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.model.UsuarioBean;
import axis.util.Constantes;

/**
 * Axisctr502Service.java 15/06/2010
 * 
 * @author <a href="jdelrio@csi-ti.com">Javi del Rio</a>
 * @since Java 5.0
 */
public class Axisctr502Service extends AxisBaseService {
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
		logger.debug("Axisctr502Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr502Service - m�todo m_form", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}

	@SuppressWarnings("all")
	public void m_consultar(HttpServletRequest request) {
		logger.debug("Axisctr502Service m_buscar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {
			java.sql.Date FDESDE = isEmpty(this.getCampoTextual(request, "FDESDE"))
					? isEmpty(formdata.get("FDESDE")) ? null
							: this.stringToSqlDate(String.valueOf(formdata.get("FDESDE")))
					: this.stringToSqlDate(this.getCampoTextual(request, "FDESDE"));
			logger.debug("############ejecuta consultar " + FDESDE);
			java.sql.Date FHASTA = isEmpty(this.getCampoTextual(request, "FHASTA"))
					? isEmpty(formdata.get("FHASTA")) ? null
							: this.stringToSqlDate(String.valueOf(formdata.get("FHASTA")))
					: this.stringToSqlDate(this.getCampoTextual(request, "FHASTA"));
			logger.debug("############ejecuta consultar " + FHASTA);
			BigDecimal CDELEGA = isEmpty(this.getCampoNumerico(request, "CDELEGA"))
					? isEmpty(formdata.get("CDELEGA")) ? null : new BigDecimal(String.valueOf(formdata.get("CDELEGA")))
					: this.getCampoNumerico(request, "CDELEGA");
			logger.debug("############ejecuta consultar " + CDELEGA);

			Object MENSAJES = null;

			PAC_IAX_LISTADOS_WM pac_iax_listados_wm = new PAC_IAX_LISTADOS_WM(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map map = pac_iax_listados_wm.ejecutaPAC_IAX_LISTADOS_WM__F_LISTADO_SINIESTROS(FDESDE, FHASTA, CDELEGA);
			logger.debug(map);

			List LSTCARTERA = (List<Map>) tratarRETURNyMENSAJES(request, map, false);
			if (isEmpty(LSTCARTERA)) {
				// No se han encontrado datos
				AbstractDispatchAction.guardarMensaje(request, "120135", null, Constantes.MENSAJE_INFO);
				request.getSession().setAttribute("abremodal", null);
			} else {
				request.getSession().setAttribute("abremodal", "1");
			}

			request.getSession().setAttribute("REC_LSTCARTERA", LSTCARTERA);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr502Service - m�todo m_consultar", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}

}
