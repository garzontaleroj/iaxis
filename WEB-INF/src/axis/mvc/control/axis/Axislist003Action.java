
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
import axis.service.axis.Axislist003Service;

/**
 * NOMBRE: Axislist003Action.java Referencia:
 * http://mantis.srvcsi.com/view.php?id=26965#c144502
 *
 * REVISIONES: Ver Fecha Autor Descripci�n --------- ---------- ---------------
 * ------------------------------------ 1.0 ecg Version inicial
 */
public class Axislist003Action extends AbstractDispatchAction {
	Log logger = LogFactory.getLog(this.getClass());
	private Axislist003Service miServicio = new Axislist003Service();

	public ActionForward init(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axislist003Action Init");
		miServicio.m_init(request, this);
		return this.form(mapping, form, request, response);
	}

	public ActionForward form(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axislist003Action Form");
		miServicio.m_form(request, this);
		return mapping.findForward("form");
	}

	public ActionForward ejecutar(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axislist003Action ejecutar");
		miServicio.m_ejecutar(request, this);
		return this.form(mapping, form, request, response);
	}

	public ActionForward batch(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axislist003Action ejecutar_batch");
		miServicio.m_batch(request, this);
		return this.form(mapping, form, request, response);
	}

	public ActionForward miajaxjson(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		miServicio.m_miajaxjson(request, this);
		return mapping.findForward("json"); // json ya esta predefindo como mapping
	}

	public ActionForward ejecutarulea(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception, ServletException {
		log.info("Axislist003Action ejecutar_ulea");
		miServicio.m_ejecutarulea(request, this);
		return this.form(mapping, form, request, response);
	}

	public ActionForward ejetcutarcierresin(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception, ServletException {
		log.info("Axislist003Action ejetcutarcierresin");
		miServicio.m_ejetcutarcierresin(request, this);
		return this.form(mapping, form, request, response);
	}

}
