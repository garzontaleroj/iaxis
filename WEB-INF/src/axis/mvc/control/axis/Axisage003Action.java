package axis.mvc.control.axis;

import java.io.IOException;
import java.math.BigDecimal;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import axis.mvc.control.AbstractDispatchAction;
import axis.service.axis.AxisBaseService;
import axis.service.axis.Axisage003Service;
import axis.util.Constantes;

/**
 * Axisage003Action.java 22/12/2008
 * 
 * @author <a href="rkirchner@csi-ti.com">Roger Kirchner</a>
 * @since Java 5.0
 */
public class Axisage003Action extends AbstractDispatchAction {
	Log logger = LogFactory.getLog(this.getClass());
	private Axisage003Service miServicio = new Axisage003Service();

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE INICIALIZACION
	 *******************************************/
	/*********************************************************************************************************************/

	public ActionForward init(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axisage003Action Init");
		return this.form(mapping, form, request, response);
	}

	public ActionForward form(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axisage003Action Form");
		miServicio.m_form(request);
		return mapping.findForward("form");
	}

	/*********************************************************************************************************************/
	/************************************************
	 * M�TODOS DE ACTUALIZACI�N
	 *******************************************/
	/*********************************************************************************************************************/

	public ActionForward actualizar_agente(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axisage003Action actualizar_agente");
		miServicio.m_ajax_actualizar_agente(request);
		return mapping.findForward("ajax");
	}

	public ActionForward actualizar_redcomercial(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axisage003Action actualizar_redcomercial");
		miServicio.m_actualizar_redcomercial(request);
		return mapping.findForward("ajax");
	}

	public ActionForward aceptar(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axisage003Action Aceptar");
		miServicio.m_aceptar(request);
		return mapping.findForward("form");
		// return mapping.findForward("form");
	}

	/*********************************************************************************************************************/
	/***************************************************
	 * SALTOS DE FLUJO
	 *************************************************/
	/*********************************************************************************************************************/

	/**
	 * 
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 * @throws IOException
	 * @throws ServletException
	 */
	public ActionForward modificacion_persona(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		if (request.getParameterValues("paginar") != null)
			return this.form(mapping, form, request, response);

		log.debug("Axisage003Action modificacion_persona");

		Map formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);

		BigDecimal CAGENTE = AxisBaseService.getCampoNumerico(request, "CAGENTE_PERSONA");

		formdata.put("CAGENTE_axisage003",
				AxisBaseService.bigDecimalToString(AxisBaseService.getCampoNumerico(request, "CAGENTE")));
		this.topPila(request, "formdata_axisage003", formdata);

		// Llamamos a AXISPER009. El SPERSON no se lo pasamos por QS, porque est�
		// vinculado a formdata en un hidden de la pantalla.
		// Tambi�n le tenemos que pasar el CAGENTE de la persona, para que pueda
		// seleccionarse en AXISPER009
		this.topPila(request, Constantes.SALTARDESTINOACTION,
				new ActionForward("/axis_axisper009.do?operation=form&CAGENTEselected=" + CAGENTE));
		this.topPila(request, Constantes.SALTARORIGENACTION, new ActionForward("/axis_axisage003.do?operation=volver"));

		AbstractDispatchAction.topPila(request, "CMODO", "EDITA_DATOS_PERSONA");

		request.setAttribute(Constantes.PASSTOPPILA, this.topPila(request));

		return mapping.findForward("saltar");
	}

	/**
	 * 
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 * @throws IOException
	 * @throws ServletException
	 */
	public ActionForward volver(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {

		if (request.getParameterValues("paginar") != null)
			return this.form(mapping, form, request, response);

		log.debug("Axisage003Action volver");
		Map formdata = new HashMap();

		try {
			Map formdata_axisage003 = (Map) AbstractDispatchAction.removeTopPila(request, "formdata_axisage003");

			if (!AxisBaseService.isEmpty(formdata_axisage003)) {
				formdata.putAll(formdata_axisage003);
				formdata.put("CAGENTE", formdata.get("CAGENTE_axisage003"));
				request.setAttribute(Constantes.FORMDATA, formdata);
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisage003Action - m�todo volver", e);
		}

		return this.form(mapping, form, request, response);
	}

	/**
	 * 
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 * @throws IOException
	 * @throws ServletException
	 */
	/*
	 * public ActionForward editar(ActionMapping mapping, ActionForm form,
	 * HttpServletRequest request, HttpServletResponse response) throws IOException,
	 * ServletException { if (request.getParameterValues("paginar") != null) return
	 * this.form(mapping, form, request, response);
	 * 
	 * log.debug("Axisage003Action editar");
	 * 
	 * Map formdata = (HashMap)request.getAttribute(Constantes.FORMDATA);
	 * this.topPila(request, "formdata_axisage003", formdata);
	 * 
	 * this.topPila(request, Constantes.SALTARDESTINOACTION, new
	 * ActionForward("/axis_axisage006.do?operation=form&buscarOnload=true"));
	 * this.topPila(request, Constantes.SALTARORIGENACTION, new
	 * ActionForward("/axis_axisage003.do?operation=volver")); return
	 * mapping.findForward("saltar"); }
	 */

	/**
	 * 
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 * @throws IOException
	 * @throws ServletException
	 */

	/*
	 * public ActionForward volver(ActionMapping mapping, ActionForm form,
	 * HttpServletRequest request, HttpServletResponse response) throws IOException,
	 * ServletException { if (request.getParameterValues("paginar") != null) return
	 * this.form(mapping, form, request, response);
	 * 
	 * log.debug("Axisage003Action volver"); HashMap formdata =
	 * (HashMap)request.getAttribute(Constantes.FORMDATA);
	 * 
	 * try { Map formdata_axisage003 = (Map)
	 * AbstractDispatchAction.removeTopPila(request, "formdata_axisage003");
	 * 
	 * if (!AxisBaseService.isEmpty(formdata_axisage003))
	 * formdata.putAll(formdata_axisage003);
	 * 
	 * } catch (Exception e) {
	 * logger.error("Error en el servicio Axisage003Action - m�todo volver", e); }
	 * 
	 * return this.form(mapping, form, request, response); }
	 */

	/**
	 * 
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 * @throws IOException
	 * @throws ServletException
	 */
	public ActionForward busca_codagente(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {

		logger.debug("Axisage003Action busca_codagente");
		miServicio.m_busca_codagente(request);
		miServicio.m_recargar(request);
		return mapping.findForward("form");
	}

	public ActionForward recargar(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {

		logger.debug("Axisage003Action recargar");
		miServicio.m_recargar(request);
		return mapping.findForward("form");
	}

	public ActionForward delete_prodpart(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axisage003Action delete_prodpart");
		miServicio.m_delete_prodpart(request);
		return mapping.findForward("form");
	}

	public ActionForward delete_actor(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axisage003Action delete_actor");
		miServicio.m_delete_actor(request);
		return mapping.findForward("form");
	}

	public ActionForward delete_subvencion(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axisage003Action delete_subvencion");
		miServicio.m_delete_subvencion(request);
		return mapping.findForward("form");
	}

	public ActionForward delete_soporte(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axisage003Action delete_soporte");
		miServicio.m_delete_soporte(request);
		return mapping.findForward("form");
	}

	public ActionForward ajax_direccion(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		miServicio.m_ajax_direccion(request, this);
		return mapping.findForward("ajax");
	}

	public ActionForward ajax_busqueda_estados(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisage003Action ajax_busqueda_productos");
		miServicio.m_ajax_busqueda_estados(request);
		return mapping.findForward("ajax");
	}

	public ActionForward consolidar_sub(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {

		logger.debug("Axisage003Action consolidar_sub");
		miServicio.m_consolidar_sub(request);
		return this.form(mapping, form, request, response);
	}

	public ActionForward delete_contacto(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axisage003Action delete_contacto");
		miServicio.m_delete_contacto(request);
		return mapping.findForward("form");
	}

	public ActionForward delete_entidadaseg(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axisage003Action delete_entidad_aseg");
		miServicio.m_delete_entidadaseg(request);
		return mapping.findForward("form");
	}

	public ActionForward delete_banco(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axisage003Action delete_banco");
		miServicio.m_delete_banco(request);
		return mapping.findForward("form");
	}

	public ActionForward delete_asociacion(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axisage003Action delete_asociacion");
		miServicio.m_delete_asociacion(request);
		return mapping.findForward("form");
	}

	public ActionForward delete_referencia(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axisage003Action delete_referencia");
		miServicio.m_delete_referencia(request);
		return mapping.findForward("form");
	}
}
