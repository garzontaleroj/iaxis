package axis.mvc.control.axis;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import axis.mvc.control.AbstractDispatchAction;
import axis.service.axis.Axisctr148Service;

public class Axisctr148Action extends AbstractDispatchAction {

	Log logger = LogFactory.getLog(this.getClass());
	private Axisctr148Service miServicio = new Axisctr148Service();

	public ActionForward init(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr148Action Init");
		miServicio.m_init(request, this);
		return this.form(mapping, form, request, response);
	}

	public ActionForward form(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr148Action Form");
		miServicio.m_form(request, this);
		return mapping.findForward("form");
	}

	public ActionForward anterior(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr148Action anterior");
		miServicio.m_anterior(request, this);
		return this.navegar(request, this.recargarThisForm(mapping));
	}

	public ActionForward siguiente(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.debug("Axisctr148Action Siguiente");
		miServicio.m_siguiente(request, this);
		return this.navegar(request, this.recargarThisForm(mapping));
	}

	public ActionForward ajax_recuperar_modelo(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.debug("Axisctr148Action: ajax_recuperar_modelo");
		miServicio.m_ajax_recuperar_modelo(request);
		return mapping.findForward("ajax");
	}

	public ActionForward ajax_recuperar_puertas(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.debug("Axisctr148Action: ajax_recuperar_puertas");
		miServicio.m_ajax_recuperar_puertas(request);
		return mapping.findForward("ajax");
	}

	public ActionForward ajax_recuperar_version(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.debug("Axisctr148Action: ajax_recuperar_version");
		miServicio.m_ajax_recuperar_version(request);
		return mapping.findForward("ajax");
	}

	public ActionForward ajax_recuperar_usos(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.debug("Axisctr148Action: ajax_recuperar_usos");
		miServicio.m_ajax_recuperar_usos(request);
		return mapping.findForward("ajax");
	}

	public ActionForward ajax_recuperar_subusos(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.debug("Axisctr148Action: ajax_recuperar_subusos");
		miServicio.m_ajax_recuperar_subusos(request);
		return mapping.findForward("ajax");
	}

	public ActionForward tipos_vehiculo_json(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr148Action tipos_vehiculo_json");
		miServicio.m_tipos_vehiculo_json(request, this);
		return mapping.findForward("json");
	}

	public ActionForward tipos_vehiculo_json_xmod(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr148Action tipos_vehiculo_json_xmod");
		miServicio.m_tipos_vehiculo_json_xmod(request, this);
		return mapping.findForward("json");
	}

	public ActionForward clases_vehiculo_json(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr148Action clases_vehiculo_json");
		miServicio.m_clases_vehiculo_json(request, this);
		return mapping.findForward("json");
	}

	public ActionForward anyos_version_json(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr148Action anyos_version_json");
		miServicio.m_anyos_version_json(request, this);
		return mapping.findForward("json");
	}

	public ActionForward recuperar_version_json(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr148Action recuperar_version_json");
		miServicio.m_recuperar_version_json(request, this);
		return mapping.findForward("json");
	}

	public ActionForward vehiculo_matricula_json(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr148Action tipos_vehiculo_json");
		miServicio.m_vehiculo_matricula_json(request, this);
		return mapping.findForward("json");
	}

	public ActionForward guardar_simulacion(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axisctr148Action m_guardar_simulacion");
		miServicio.m_guardar_simulacion(request, this);

		return this.form(mapping, form, request, response);
	}

	/**
	 * Metodo para validar con PAC_VALIDACION.F_VALIDA, aunque es de la 148, puede
	 * ser acccedido desde todos los sitios
	 */
	public ActionForward f_valida_campo_ajaxjson(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		logger.debug("f_valida_campo_ajaxjson");
		miServicio.m_f_valida_campo_ajaxjson(request, this);
		return mapping.findForward("json"); // json ya esta predefindo como mapping
	}

}