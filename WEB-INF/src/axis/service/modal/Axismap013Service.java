package axis.service.modal;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_MAP;
import axis.mvc.control.modal.Axismap013Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

/**
 * Axismap013Action.java 04/06/2008
 * 
 * @author <a href="rkirchner@csi-ti.com">Roger Kirchner</a>
 * @since Java 5.0
 */
public class Axismap013Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE INICIALIZACION
	 *******************************************/
	/*********************************************************************************************************************/

	/**
	 * M�todo que se llama al inicio de este flujo. Puede servirnos para inicializar
	 * variables.
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_init(HttpServletRequest request, Axismap013Action thisAction) {
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {

		} catch (Exception e) {
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.configForm(request, whoami(this));
			this.cargaDependencias(request, (List) request.getAttribute("DEPENDENCIAS"));
		}

	}

	/**
	 * 
	 * @param request
	 */
	@SuppressWarnings("all")
	public void m_form(HttpServletRequest request, Axismap013Action thisAction) {
		logger.debug("Axismap013Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {

			PAC_IAX_MAP pac_iax_map = new PAC_IAX_MAP((java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			String CMAPEAD = isEmpty(this.getHiddenCampoTextual(request, "CMAPEAD"))
					? (String) request.getSession().getAttribute("CMAPEAD")
					: this.getHiddenCampoTextual(request, "CMAPEAD");

			BigDecimal NCONDICION = this.getHiddenCampoNumerico(request, "NCONDICION");

			if (!isEmpty(NCONDICION)) {
				Map m = pac_iax_map.ejecutaPAC_IAX_MAP__F_GET_UNICO_MAPCONDICION(NCONDICION);
				logger.debug(m);
				ArrayList lstobj = (ArrayList) this.tratarRETURNyMENSAJES(request, m);
				if (!isEmpty(lstobj) && lstobj.size() > 0)
					formdata.putAll((Map) lstobj.get(0));

			}

			this.m_cargarCombos(request, thisAction);

		} catch (Exception e) {
			logger.error("Error en el servicio Axismap013Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {

			this.configForm(request, whoami(this));
			this.cargaDependencias(request, (List) request.getAttribute("DEPENDENCIAS"));
		}
	}

	private void m_cargarCombos(HttpServletRequest request, Axismap013Action thisAction) {
		logger.debug("Axismap013Service m_cargarCombos");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		HashMap listValores = new HashMap();
		try {

			/*
			 * Combo de ejemplo :
			 * 
			 * PAC_IAX_LISTVALORES pac_axis_listValores = new
			 * PAC_IAX_LISTVALORES(usuario.getConnection());
			 * 
			 * Map map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_GET_TIPCCC();
			 * logger.debug(map); listValores.put("lstCCC",
			 * (List)tratarRETURNyMENSAJES(request, map));
			 */
			formdata.put("listValores", listValores);

		} catch (Exception e) {
			logger.error("Error en el servicio Axismap013Service - m�todo m_cargarCombos", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

	public void m_guardar(HttpServletRequest request, Axismap013Action thisAction) {
		logger.debug("Axismap013Service m_guardar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {
			String CMAPEAD = isEmpty(this.getHiddenCampoTextual(request, "CMAPEAD"))
					? (String) request.getSession().getAttribute("CMAPEAD")
					: this.getHiddenCampoTextual(request, "CMAPEAD");

			BigDecimal NCONDICION = this.getHiddenCampoNumerico(request, "NCONDICION");
			BigDecimal NLONGCOND = this.getHiddenCampoNumerico(request, "NLONGCOND");
			String TVALCOND = this.getHiddenCampoTextual(request, "TVALCOND");
			BigDecimal NORDCOND = this.getHiddenCampoNumerico(request, "NORDCOND");
			BigDecimal CTABLA = this.getHiddenCampoNumerico(request, "CTABLA");
			BigDecimal NPOSCOND = this.getHiddenCampoNumerico(request, "NPOSCOND");
			PAC_IAX_MAP pac_iax_map = new PAC_IAX_MAP((java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			Map m = pac_iax_map.ejecutaPAC_IAX_MAP__F_SET_MAPCONDICION(NCONDICION, TVALCOND, NPOSCOND, NLONGCOND,
					NORDCOND, CTABLA);
			logger.debug(m);

			try {
				BigDecimal retorno = (BigDecimal) this.tratarRETURNyMENSAJES(request, m);

				formdata.put("ok", retorno);
			} catch (Exception ex) {
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axismap011Service - m�todo m_guardar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {

			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));

		}
	}

}
