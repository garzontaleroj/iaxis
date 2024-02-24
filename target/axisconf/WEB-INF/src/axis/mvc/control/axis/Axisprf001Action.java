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
import axis.service.axis.Axisprf001Service;

public class Axisprf001Action extends AbstractDispatchAction {

	Log logger = LogFactory.getLog(this.getClass());
	private Axisprf001Service miServicio = new Axisprf001Service();

	public ActionForward init(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisprf001Action Init");
		return this.form(mapping, form, request, response);
	}

	public ActionForward form(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisprf001Action Form");

		miServicio.m_form(request, this);
		return mapping.findForward("form");
	}

	public ActionForward del_estado(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisprf001Action del_estado");
		miServicio.m_del_estado(request, this);

		return this.form(mapping, form, request, response);
	}

	public ActionForward del_ccc(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisprf001Action del_ccc");
		miServicio.m_del_ccc(request, this);

		return this.form(mapping, form, request, response);
	}

	public ActionForward del_carga(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisprf001Action del_carga");
		miServicio.m_del_carga(request, this);

		return this.form(mapping, form, request, response);
	}

	public ActionForward del_perscont(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisprf001Action del_perscont");
		miServicio.m_del_perscont(request, this);

		return this.form(mapping, form, request, response);
	}

	public ActionForward del_carga_real(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisprf001Action del_carga_real");
		miServicio.m_del_carga_real(request, this);

		return this.form(mapping, form, request, response);
	}

	public ActionForward del_rol(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisprf001Action del_rol");
		miServicio.m_del_rol(request, this);

		return this.form(mapping, form, request, response);
	}

	public ActionForward del_impuesto(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisprf001Action del_impuesto");
		miServicio.m_del_impuesto(request, this);

		return this.form(mapping, form, request, response);
	}

	public ActionForward set_contacto_pref(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisprf001Action set_contacto_pref");
		miServicio.m_set_contacto_pref(request, this);

		return this.form(mapping, form, request, response);
	}
}
