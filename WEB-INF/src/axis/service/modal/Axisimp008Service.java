package axis.service.modal;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.jdbc.PAC_IAX_SIN_IMPUESTOS;
import axis.mvc.control.modal.Axisimp008Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

/**
 * Axisimp008Service.java
 * 
 * @author <a href="rkirchner@csi-ti.com">Roger Kirchner</a> 19/12/2008
 * @since Java 5.0
 */
public class Axisimp008Service extends AxisBaseService {
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
	public void m_form(HttpServletRequest request, Axisimp008Action thisAction) {
		logger.debug("Axisimp008Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		PAC_IAX_LISTVALORES pac_axis_listValores = new PAC_IAX_LISTVALORES(
				(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

		try {

			BigDecimal CCONCEP_ant = getCampoNumerico(request, "CCONCEP_ant");
			formdata.put("CCONCEP_ant", CCONCEP_ant);

			Map map = new PAC_IAX_SIN_IMPUESTOS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_SIN_IMPUESTOS__F_GET_LSTCONCEPTOS();
			logger.debug("+++++LSTCONCEPTO: " + map);
			List LSTCONCEPTO = (List) tratarRETURNyMENSAJES(request, map, false);
			for (int i = 0; i < LSTCONCEPTO.size(); i++) {
				if (((String) ((Map) LSTCONCEPTO.get(i)).get("CVALAXIS")).equals(CCONCEP_ant.toString())) {
					LSTCONCEPTO.remove(i);
					// Eliminamos de la lista el seleccionado de la pantalla anterior, ya que no
					// vamos a copiar el mismo.
				}
			}

			formdata.put("LSTCONCEPTO", LSTCONCEPTO);
		} catch (Exception e) {
			logger.error("Error en el servicio Axisimp008Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE ACTUALIZACI�N
	 ********************************************/
	/*********************************************************************************************************************/

	/**
	 * 
	 * @param request
	 */
	@SuppressWarnings("all")
	public void m_aceptar(HttpServletRequest request, Axisimp008Action thisAction) {
		logger.debug("Axisimp008Service m_aceptar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		PAC_IAX_LISTVALORES pac_axis_listValores = new PAC_IAX_LISTVALORES(
				(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

		try {

			BigDecimal pCCONCEP = new BigDecimal(request.getParameter("CCONCEP"));
			BigDecimal pCCONCEP_ant = new BigDecimal(request.getParameter("CCONCEP_ant"));
			formdata.put("CCONCEP_new", pCCONCEP);

			PAC_IAX_SIN_IMPUESTOS pac_iax_sin_impuestos = new PAC_IAX_SIN_IMPUESTOS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			Map map = pac_iax_sin_impuestos.ejecutaPAC_IAX_SIN_IMPUESTOS__F_COPIA_IMPUESTO(pCCONCEP, pCCONCEP_ant);
			logger.debug(map);
			request.setAttribute("grabarOK", tratarRETURNyMENSAJES(request, map));

			map = new PAC_IAX_SIN_IMPUESTOS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_SIN_IMPUESTOS__F_GET_LSTCONCEPTOS();
			logger.debug("+++++LSTCONCEPTO: " + map);
			List LSTCONCEPTO = (List) tratarRETURNyMENSAJES(request, map, false);
			for (int i = 0; i < LSTCONCEPTO.size(); i++) {
				if (((String) ((Map) LSTCONCEPTO.get(i)).get("CVALAXIS")).equals(pCCONCEP_ant.toString())) {
					LSTCONCEPTO.remove(i);
					// Eliminamos de la lista el seleccionado de la pantalla anterior, ya que no
					// vamos a copiar el mismo.
				}
			}

			formdata.put("LSTCONCEPTO", LSTCONCEPTO);
		} catch (Exception e) {
			logger.error("Error en el servicio Axisimp008Service - m�todo m_aceptar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

}
