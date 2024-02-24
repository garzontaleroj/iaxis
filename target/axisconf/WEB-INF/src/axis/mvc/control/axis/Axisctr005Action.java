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
import axis.service.axis.Axisctr005Service;

public class Axisctr005Action extends AbstractDispatchAction {

	Log logger = LogFactory.getLog(this.getClass());
	private Axisctr005Service miServicio = new Axisctr005Service();

	public ActionForward init(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr005Action Init");
		miServicio.m_init(request, this);
		return mapping.findForward("form");
	}

	public ActionForward form(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr005Action Form");
		miServicio.m_form(request, this);
		return mapping.findForward("form");
	}

	public ActionForward siguiente(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr005Action siguiente");
		miServicio.m_siguiente(request, this);
		// return this.navegar(request, this.form(mapping, form, request, response));//
		// ;AxisCodeWizard.findForward(Constantes.SIGUIENTE, SPRODUC, CMODO, CFORM,
		// CCAMPO, usuario));
		// return mapping.findForward("siguiente");
		return this.navegar(request, this.recargarThisForm(mapping));
	}

	public ActionForward anterior(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr005Action anterior");
		miServicio.m_anterior(request, this);
		// return this.navegar(request, this.form(mapping, form, request, response));//
		// ;AxisCodeWizard.findForward(Constantes.SIGUIENTE, SPRODUC, CMODO, CFORM,
		// CCAMPO, usuario));
		return this.navegar(request, this.recargarThisForm(mapping));
		// return mapping.findForward("siguiente");
	}

	public ActionForward editar(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr005Action editar");

		ActionForward saltarForward = miServicio.m_editar(request, this);
		if (saltarForward != null) {
			// Se nos permite editar suplemento, y saltar a un nuevo flujo
			//// this.topPila(request, Constantes.SALTARDESTINOACTION, saltarForward);
			// this.topPila(request, Constantes.SALTARORIGENACTION, new
			// ActionForward("/axis_axisctr005.do?operation=volver") );
			// return mapping.findForward("saltar");
			return saltarForward;
		} else
			// No se permite a�adir suplementos; recargar form
			return this.form(mapping, form, request, response);

	}

	public ActionForward volver(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		if (request.getParameterValues("paginar") != null)
			return this.form(mapping, form, request, response);

		log.info("Axisctr0050Action volver");
		miServicio.m_volver(request, this);
		return this.form(mapping, form, request, response);
	}

	public ActionForward nou(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr005Action editar");

		ActionForward saltarForward = miServicio.m_nou(request, this);
		if (saltarForward != null) {
			// Se nos permite editar suplemento, y saltar a un nuevo flujo
			//// this.topPila(request, Constantes.SALTARDESTINOACTION, saltarForward);
			// this.topPila(request, Constantes.SALTARORIGENACTION, new
			// ActionForward("/axis_axisctr005.do?operation=volver") );
			// return mapping.findForward("saltar");
			return saltarForward;
		} else
			// No se permite a�adir suplementos; recargar form
			return this.form(mapping, form, request, response);

	}

	public ActionForward borrar_riesgo(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr005Action borrar_riesgo");

		miServicio.m_borrar_riesgo(request, this);
		return this.form(mapping, form, request, response);

	}

	public ActionForward tarificar(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr005Action tarificar");

		miServicio.m_tarificar(request, this);
		return this.form(mapping, form, request, response);

	}

}
