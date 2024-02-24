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
import axis.service.modal.Axiscoa004Service;

/**
 * Axiscoa004Action.java 28/08/2012
 * 
 * @author <a href="amartinez@csi-ti.com">Alex Martinez</a>
 * @since Java 5.0
 */
public class Axiscoa004Action extends AbstractDispatchAction {
	Log logger = LogFactory.getLog(this.getClass());
	private Axiscoa004Service miServicio = new Axiscoa004Service();

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE INICIALIZACION
	 *******************************************/
	/*********************************************************************************************************************/

	public ActionForward init(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axiscoa004Action Init");
		return this.form(mapping, form, request, response);
	}

	public ActionForward form(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axiscoa004Action Form");
		miServicio.m_form(request);
		return mapping.findForward("form");
	}

	public ActionForward buscar_cia(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axiscoa004Action buscar_cia");
		miServicio.m_buscar_cia(request, this);

		return this.form(mapping, form, request, response);

	}

	public ActionForward cancelar(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axiscoa004Action buscar_cia");
		miServicio.m_cancelar(request, this);

		return this.form(mapping, form, request, response);

	}

	public ActionForward ajax_insertval(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.debug("Axiscoa004Action ajax_insertval");
		miServicio.m_ajax_insertval(request);
		return mapping.findForward("ajax");
	}

	public ActionForward borrar_cia(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axiscoa004Action borrar_cia");
		miServicio.m_borrar_cia(request, this);

		return this.form(mapping, form, request, response);

	}

	public ActionForward guardarcuadro(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axiscoa004Action m_guardarcuadro");
		miServicio.m_guardarcuadro(request, this);

		return this.form(mapping, form, request, response);

	}

}
