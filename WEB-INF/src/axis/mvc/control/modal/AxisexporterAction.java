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
import axis.service.modal.AxisexporterService;

public class AxisexporterAction extends AbstractDispatchAction {
	Log logger = LogFactory.getLog(this.getClass());
	private AxisexporterService miServicio = new AxisexporterService();

	/*
	 * public ActionForward init(ActionMapping mapping, ActionForm form,
	 * HttpServletRequest request, HttpServletResponse response) throws IOException,
	 * ServletException { logger.debug("AxisexporterService Init"); return
	 * this.form(mapping, form, request, response); }
	 * 
	 * public ActionForward form(ActionMapping mapping, ActionForm form,
	 * HttpServletRequest request, HttpServletResponse response) throws IOException,
	 * ServletException { logger.debug("AxisexporterService Form");
	 * miServicio.m_form(request); return mapping.findForward("form"); }
	 */
	public ActionForward axisctr162export(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		try {
			logger.debug("AxisexporterService axisctr162export");
			miServicio.m_axisctr162export(request);
			logger.debug("voy a hacer un forward a:" + mapping.findForward("axisctr162export"));
			return mapping.findForward("axisctr162export");
		} catch (Exception e) {
			logger.error("AxisexporterService axisctr162export - " + e);
		}
		return null;

	}

	public ActionForward axisctr500export(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		try {
			logger.debug("AxisexporterService axisctr500export");
			miServicio.m_axisctr500export(request);
			logger.debug("voy a hacer un forward a:" + mapping.findForward("axisctr500export"));
			return mapping.findForward("axisctr500export");
		} catch (Exception e) {
			logger.error("AxisexporterService axisctr500export - " + e);
		}
		return null;

	}

	public ActionForward axisctr501export(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		try {
			logger.debug("AxisexporterService axisctr501export");
			miServicio.m_axisctr501export(request);
			logger.debug("voy a hacer un forward a:" + mapping.findForward("axisctr501export"));
			return mapping.findForward("axisctr501export");
		} catch (Exception e) {
			logger.error("AxisexporterService axisctr501export - " + e);
		}
		return null;

	}

	public ActionForward axisctr502export(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		try {
			logger.debug("AxisexporterService axisctr502export");
			miServicio.m_axisctr502export(request);
			logger.debug("voy a hacer un forward a:" + mapping.findForward("axisctr502export"));
			return mapping.findForward("axisctr502export");
		} catch (Exception e) {
			logger.error("AxisexporterService axisctr502export - " + e);
		}
		return null;

	}

}
