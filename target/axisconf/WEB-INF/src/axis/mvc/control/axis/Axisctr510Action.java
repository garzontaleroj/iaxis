package axis.mvc.control.axis;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import axis.cache.AxisCodeWizard;
import axis.mvc.control.AbstractDispatchAction;
import axis.service.axis.Axisctr510Service;
import axis.util.Constantes;

public class Axisctr510Action extends AbstractDispatchAction {
	Log logger = LogFactory.getLog(this.getClass());
	private Axisctr510Service miServicio = new Axisctr510Service();

	public ActionForward init(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		return this.form(mapping, form, request, response);
	}

	public ActionForward form(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		miServicio.m_form(request, this);
		return mapping.findForward("form");
	}

	public ActionForward siguiente(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException, Exception {
		miServicio.m_siguiente(request, this);
		return AxisCodeWizard.findForward(request, Constantes.SIGUIENTE,
				(String) ((Map) request.getAttribute(Constantes.FORMDATA)).get("FORM_ACT"), null);
	}

	/** Added for back button (IAXIS-4321) PK-16/06/2019 Start */
	public ActionForward anterior(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.debug("Axisctr024Action Anterior");
		miServicio.m_anterior(request, this);
		return this.navegar(request, this.recargarThisForm(mapping));
	}
	/** Added for back button (IAXIS-4321) PK-16/06/2019 End */
}
