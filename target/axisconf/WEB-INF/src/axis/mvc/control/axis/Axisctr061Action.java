package axis.mvc.control.axis;

import java.io.IOException;
import java.math.BigDecimal;
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
import axis.service.axis.Axisctr061Service;
import axis.util.Constantes;

/**
 * Axisctr061Action.java 10/03/2009
 */
public class Axisctr061Action extends AbstractDispatchAction {
	Log logger = LogFactory.getLog(this.getClass());
	private Axisctr061Service miServicio = new Axisctr061Service();

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE INICIALIZACION
	 *******************************************/
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
	public ActionForward init(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axisctr061Action Init");

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
	public ActionForward form(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axisctr061Action Form");
		miServicio.m_form(request);

		return mapping.findForward("form");
	}

	/*********************************************************************************************************************/
	/************************************************
	 * M�TODOS DE ACTUALIZACI�N
	 *******************************************/
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

	public ActionForward ajax_set_conductor(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axisctr061Action ajax_set_conductor");

		miServicio.m_ajax_set_conductor(request);

		return mapping.findForward("ajax");
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

	public ActionForward set_conductor(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axisctr061Action set_conductor");

		if (request.getParameter("paginar") == null) {

			Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
			BigDecimal SPERSON = AxisBaseService.getCampoNumerico(request, "SPERSON");
			// BigDecimal NTOMADOR = AxisBaseService.getCampoNumerico(request, "NTOM");
			String TOMADOR_O_PROPIETARIO = AxisBaseService.getCampoTextual(request, "TOMADOR_O_PROPIETARIO");

			/*
			 * Esto sirve para recuperar el SPERSON del conductor, si clicamos que sea el
			 * tomador o el propietario
			 */
			if (AxisBaseService.isEmpty(SPERSON) && (!AxisBaseService.isEmpty(TOMADOR_O_PROPIETARIO))) {
				Map persona = null;
				Map tomador = miServicio.m_lee_datos_tomador(request);
				if ("tomador".equals(TOMADOR_O_PROPIETARIO))
					persona = tomador;
				else if ("propietario".equals(TOMADOR_O_PROPIETARIO))
					persona = miServicio.m_lee_datos_asegurado_no_tomador(request, (BigDecimal) tomador.get("SPERSON"));

				if (!AxisBaseService.isEmpty(persona)) {
					SPERSON = (BigDecimal) persona.get("SPERSON");
					formdata.put("SPERSON", SPERSON);
				}
			}

			miServicio.m_set_conductor(request);

		}

		return this.form(mapping, form, request, response);
	}

	public ActionForward set_conductor_simul(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axisctr061Action set_conductor");

		if (request.getParameter("paginar") == null) {

			miServicio.m_set_conductor_simul(request);

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
	public ActionForward eliminar_conductor(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axisctr061Action eliminar_conductor");

		if (request.getParameter("paginar") == null) {
			miServicio.m_eliminar_conductor(request);
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
	public ActionForward anterior(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axisctr061Action anterior");
		miServicio.m_navegar(request, Constantes.ANTERIOR);
		return this.navegar(request, this.recargarThisForm(mapping));
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
	public ActionForward siguiente(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axisctr061Action siguiente");
		miServicio.m_navegar(request, Constantes.SIGUIENTE);

		return this.navegar(request, this.recargarThisForm(mapping));
	}

	public ActionForward guardar_simulacion(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axisctr061Action m_guardar_simulacion");
		miServicio.m_guardar_simulacion(request);

		return this.form(mapping, form, request, response);
	}

	public ActionForward gestion_tomador_json(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axisctr061Action gestion_tomador");
		miServicio.m_gestion_tomador_json(request, this);

		return mapping.findForward("json");
	}

	/*********************************************************************************************************************/
	/***************************************************
	 * SALTOS DE FLUJO
	 *************************************************/
	/*********************************************************************************************************************/

	public ActionForward ajax_direccion(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		miServicio.m_ajax_direccion(request, this);
		return mapping.findForward("ajax");
	}
}
