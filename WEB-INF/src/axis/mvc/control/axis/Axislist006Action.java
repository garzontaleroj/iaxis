
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
import axis.service.axis.Axislist006Service;

/**
 * NOMBRE: Axislist006Action.java Referencia:
 * http://mantis.srvcsi.com/view.php?id=27005#c145378 Listado de reports que se
 * ha pedido por batch
 *
 * REVISIONES: Ver Fecha Autor Descripci�n --------- ---------- ---------------
 * ------------------------------------ 1.0 29.05.2013 ECG Version inicial
 */
public class Axislist006Action extends AbstractDispatchAction {
	Log logger = LogFactory.getLog(this.getClass());
	private Axislist006Service miServicio = new Axislist006Service();

	public ActionForward init(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axislist006Action Init");
		miServicio.m_init(request, this);
		return this.form(mapping, form, request, response);
	}

	public ActionForward form(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axislist006Action Form");
		miServicio.m_form(request, this);
		return mapping.findForward("form");
	}

	public ActionForward buscar(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axislist006Action buscar");
		miServicio.m_buscar(request, this);
		return this.form(mapping, form, request, response);
	}

}
