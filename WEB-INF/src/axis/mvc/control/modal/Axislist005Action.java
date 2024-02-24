
package axis.mvc.control.modal;

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
import axis.service.modal.Axislist005Service;

/**
 * NOMBRE: Axislist005Action.java Referencia:
 * http://mantis.srvcsi.com/view.php?id=27005#c145079 buscador de reports con
 * plantillas
 *
 * REVISIONES: Ver Fecha Autor Descripci�n --------- ---------- ---------------
 * ------------------------------------ 1.0 27.5.2013 ECG Versi�n inicial
 */
public class Axislist005Action extends AbstractDispatchAction {
	Log logger = LogFactory.getLog(this.getClass());
	private Axislist005Service miServicio = new Axislist005Service();

	public ActionForward init(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axislist005Action Init");
		miServicio.m_init(request, this);
		return this.form(mapping, form, request, response);
	}

	public ActionForward form(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axislist005Action Form");
		miServicio.m_form(request, this);
		return mapping.findForward("form");
	}

	public ActionForward buscar(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axislist005Action buscar");
		miServicio.m_buscar(request, this);
		return this.form(mapping, form, request, response);
	}

	public ActionForward miajaxjson(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		miServicio.m_miajaxjson(request, this);
		return mapping.findForward("json"); // json ya esta predefindo como mapping
	}

}
