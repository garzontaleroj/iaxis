package axis.mvc.control.axis;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import axis.mvc.control.AbstractDispatchAction;
import axis.service.axis.AxisopenurlService;

/**
 * AxisformAction Lanzador de una url
 * <ul>
 * <li><code>axisform</code>: Lanzador de una url en una nueva pantalla
 * <li><code>Fecha creaci�n</code>: 23/05/2008
 * </ul>
 * 
 * @author <a href="mailto:jboixader@csi-ti.com">Jordi Boixader (CSI)</a>
 */
public class AxisopenurlAction extends AbstractDispatchAction {
	static Log logger = LogFactory.getLog(AxisopenurlAction.class);
	private AxisopenurlService miServicio = new AxisopenurlService();

	public ActionForward init(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		return this.form(mapping, form, request, response);
	}

	public ActionForward form(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		miServicio.m_form(request, this);
		return mapping.findForward("form");
	}
}
