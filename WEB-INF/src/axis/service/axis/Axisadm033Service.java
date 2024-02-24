package axis.service.axis;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_DEVOLUCIONES;
import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.mvc.control.axis.Axisadm033Action;
import axis.mvc.model.UsuarioBean;
import axis.util.Constantes;

/**
 * Axispro018Service.java
 * 
 * @author <a href="rkirchner@csi-ti.com">Roger Kirchner</a>
 * @since Java 5.0
 */
public class Axisadm033Service extends AxisBaseService {
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
	public void m_init(HttpServletRequest request, Axisadm033Action thisAction) {
		logger.debug("Axisadm033Service m_init");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		try {

		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm037Service - m�todo m_init", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}

	}

	public void m_form(HttpServletRequest request, Axisadm033Action thisAction) {
		logger.debug("Axisadm033Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {
			this.cargarCombos(request, thisAction);

			PAC_IAX_DEVOLUCIONES pac_axis_devoluciones = new PAC_IAX_DEVOLUCIONES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			BigDecimal SGESCARTA = this.getCampoNumerico(request, "SGESCARTA");
			logger.debug("SGESCARTA : " + SGESCARTA);
			if (!isEmpty(SGESCARTA)) {

				Map m = pac_axis_devoluciones.ejecutaPAC_IAX_DEVOLUCIONES__F_GET_CONSULTA_CARTAS(SGESCARTA, null, null,
						null, null, null, null, null, null, null, null);
				logger.debug(m);

				if (!isEmpty(this.tratarRETURNyMENSAJES(request, m))
						&& ((BigDecimal) this.tratarRETURNyMENSAJES(request, m)).intValue() == 0) {
					if (!isEmpty(m.get("PCARTAS"))) {
						ArrayList car = (ArrayList) m.get("PCARTAS");
						formdata.putAll((Map) car.get(0));
					}
				}

			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm037Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}

	private void cargarCombos(HttpServletRequest request, Axisadm033Action thisAction) throws Exception {
		logger.debug("Axisadm034Service m_cargarCombos");
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map listValores = new HashMap();
		try {

			PAC_IAX_LISTVALORES pac_axis_listValores = new PAC_IAX_LISTVALORES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			// Lista Empresas
			Map map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(904));
			logger.debug(map);
			listValores.put("lstestados", tratarRETURNyMENSAJES(request, map));

		} catch (Exception e) {
			logger.error("Error en el m�todo Axiadm037 cargarCombos", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			formdata.put("listValores", listValores);
		}

	}

	public void m_aceptar(HttpServletRequest request, Axisadm033Action thisAction) {
		logger.debug("Axisadm033Service m_aceptar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {

			PAC_IAX_DEVOLUCIONES pac_axis_devoluciones = new PAC_IAX_DEVOLUCIONES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			BigDecimal SDEVOLU = this.getCampoNumerico(request, "SDEVOLU");
			logger.debug("SDEVOLU : " + SDEVOLU);
			BigDecimal NRECIBO = this.getCampoNumerico(request, "NRECIBO");
			logger.debug("NRECIBO : " + NRECIBO);

			BigDecimal CESTIMP = this.getCampoNumerico(request, "CESTIMP");
			logger.debug("CESTIMP : " + CESTIMP);
			Map m = pac_axis_devoluciones.ejecutaPAC_IAX_DEVOLUCIONES__F_SET_ESTIMP_CARTA(SDEVOLU, NRECIBO, CESTIMP);
			logger.debug(m);
			this.tratarRETURNyMENSAJES(request, m);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm037Service - m�todo m_aceptar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}

}
