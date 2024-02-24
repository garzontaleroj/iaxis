
package axis.service.modal;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_INFORMES;
import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

/**
 * NOMBRE: Axislist005Service.java
 *
 * REVISIONES: Ver Fecha Autor Descripci�n --------- ---------- ---------------
 * ------------------------------------ 1.0
 */
public class Axislist005Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	public void m_miajaxjson(HttpServletRequest request, AbstractDispatchAction thisAction) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {
			Map map = null;// ejecutaPAC_IAX_LOQUESEA__F_TAL_Y_CUAL(PPARAMS);
			logger.debug("map:" + map);
			Object RETURN = this.tratarRETURNyMENSAJES(request, map);
			if (RETURN != null && RETURN.equals(BigDecimal.ZERO)) {
				thisAction.guardarMensaje(request, "111313", new Object[] {}, Constantes.MENSAJE_INFO);
			}
			request.setAttribute(Constantes.AJAXCONTAINER, map);
		} catch (Exception e) {
			logger.error("Error.", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		} finally {
			// this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	public void m_init(HttpServletRequest request, AbstractDispatchAction thisAction) {
		logger.debug("Axislist005Service m_init");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {
		} catch (Exception e) {
			logger.error("Error en el servicio Axislist005Service - m�todo m_init", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
	}

	public void m_form(HttpServletRequest request, AbstractDispatchAction thisAction) {
		logger.debug("Axislist005Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {
			// alimentar CEMPRES
			Map mapEMPRESAS = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTEMPRESAS();
			logger.debug("------- mapEMPRESAS:" + mapEMPRESAS);
			request.setAttribute("EMPRESAS", (List) tratarRETURNyMENSAJES(request, mapEMPRESAS, false));
			m_buscar(request, thisAction);
		} catch (Exception e) {
			logger.error("Error en el servicio Axislist005Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
	}

	public void m_buscar(HttpServletRequest request, AbstractDispatchAction thisAction) {
		logger.debug("Axiscoa002Service m_buscar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		BigDecimal CIDIOMA = usuario.getCidioma();
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);

		try {

			if (request.getParameter("paginar") != null) {
				// pillamos los datos de la session - es decir no hacemos nada en especial aqui

			} else {
				// TODO: hay que hacer una busqueda de verdad y dejar el resultado en la session
				BigDecimal CEMPRES = this.getCampoNumerico(request, "CEMPRES");
				String CMAP = this.getCampoTextual(request, "CMAP");
				String CFORM = this.getCampoTextual(request, "CFORM");
				ArrayList<HashMap> LISTA_INFORMES = new ArrayList<HashMap>();

				try {
					Map listado = new PAC_IAX_INFORMES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
							.ejecutaPAC_IAX_INFORMES__F_GET_LISTAINFORMESREPORTS(CEMPRES, CIDIOMA, CFORM, CMAP);
					logger.debug(listado);

					request.getSession().setAttribute("LISTA_INFORMES", (List) tratarRETURNyMENSAJES(request, listado));
				} catch (Exception e) {
					// TODO
					logger.error("Error en el servicio Axispro002Service - m�todo m_buscar", e);
					thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() },
							Constantes.MENSAJE_ERROR);
				}

			}

		}

		catch (Exception e) {
			logger.error("Error en el servicio Axislist005Service - m�todo m_buscar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		// ver m_form: this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
	}

}
