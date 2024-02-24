package axis.service.modal;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_LISTVALORES_SIN;
import axis.jdbc.PAC_IAX_SINIESTROS;
import axis.mvc.control.modal.Axissin023Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

/**
 * Axissin023Service.java
 * 
 * @author <a href="mailto:amartinez@csi-ti.com">Alex Martinez</a>
 */
public class Axissin023Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE INICIALIZACION
	 *******************************************/

	/**
	 */
	public

			void m_init(HttpServletRequest request, Axissin023Action thisAction) {
		try {

		} catch (Exception e) {
			logger.error("Error en el servicio Axissin020Service - m�todo m_init", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.configForm(request, whoami(this));
	}

	public void m_form(HttpServletRequest request, Axissin023Action thisAction) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		try {
			this.cargarCombos(request, thisAction);

			BigDecimal pscaumot = getCampoNumerico(request, "XSCAUMOT");
			BigDecimal pctipdes = getCampoNumerico(request, "CTIPDES");

			String isNew = getCampoTextual(request, "isNew");
			request.setAttribute("isNew", isNew);

			if (!isEmpty(pctipdes)) {
				Map map = new PAC_IAX_SINIESTROS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_SINIESTROS__F_GET_CAUMOT_DESTINATARIO(pscaumot, pctipdes);
				logger.debug(map);

				List milista = (List) tratarRETURNyMENSAJES(request, map);
				if (!isEmpty(milista)) {
					HashMap v = (HashMap) milista.get(0);
					logger.debug("---- CCMODFIS:" + v.get("CMODFIS"));
					request.setAttribute("CCTIPDES", v.get("CTIPDES"));
					request.setAttribute("CCMODFIS", v.get("CMODFIS"));
				}

			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axissin023Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.configForm(request, whoami(this));
	}

	private void cargarCombos(HttpServletRequest request, Axissin023Action thisAction) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		Map listValores = new HashMap();
		try {

			PAC_IAX_LISTVALORES_SIN pacIaxListValores_sin = new PAC_IAX_LISTVALORES_SIN(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map map = pacIaxListValores_sin.ejecutaPAC_IAX_LISTVALORES_SIN__F_GET_LSTTIPDESTINATARIO();
			logger.debug(map);
			request.setAttribute("LSTDESTINATARIOS", (List) tratarRETURNyMENSAJES(request, map));

			map = pacIaxListValores_sin.ejecutaPAC_IAX_LISTVALORES_SIN__F_GET_LSTMODFISCALES();
			logger.debug(map);
			request.setAttribute("LSTMODFISCALES", (List) tratarRETURNyMENSAJES(request, map));
		}

		catch (Exception e) {
			logger.error("Error en el servicio axissin023Service - m�todo cargarCombos", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.configForm(request, whoami(this));
			formdata.put("listValores", listValores);
		}
	}

	public void m_guardar_detcausamotivo(HttpServletRequest request, Axissin023Action thisAction) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {

			BigDecimal pscaumot = getCampoNumerico(request, "SCAUMOT");
			BigDecimal pctipdes = getCampoNumerico(request, "CTIPDES");
			BigDecimal pcmodfis = getCampoNumerico(request, "CMODFIS");

			Map map = new PAC_IAX_SINIESTROS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_SINIESTROS__F_SET_SINDETCAUSAMOT(pscaumot, pctipdes, pcmodfis);
			logger.debug(map);

			request.setAttribute("ERROR", tratarRETURNyMENSAJES(request, map));
			tratarRETURNyMENSAJES(request, map);

		} catch (Exception e) {
			logger.error("Error en el servicio Axissin022Service - m�todo m_guardar_causamotivo", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.configForm(request, whoami(this));
	}

}
