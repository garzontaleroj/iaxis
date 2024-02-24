package axis.mvc.control;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.json.JSONObject;

import axis.daemon.AxisRequestProcessor;
import axis.service.JSONService;
import axis.util.Constantes;

public class JSONAction extends AbstractDispatchAction {
	static Log logger = LogFactory.getLog(JSONAction.class);
	private JSONService miServicio = new JSONService();

	public ActionForward __solojson(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		logger.debug("aki");
		miServicio.m___solojson(request, this);
		new AxisRequestProcessor().extractConnection(request);
		if (request.getAttribute(Constantes.__jSONObject) != null) {
			JSONObject jSONObject = (JSONObject) request.getAttribute(Constantes.__jSONObject);
			response.setContentType("application/json; charset=iso-8859-1");
			response.addHeader("Access-Control-Allow-Origin", "*");
			response.addHeader("Access-Control-Allow-Credentials", "true");
			PrintWriter out = response.getWriter();
			if (request.getParameter(Constantes.__jsoncallback) != null
					&& request.getParameter(Constantes.__jsoncallback).trim().length() > 0) {
				String __jsoncallback = request.getParameter(Constantes.__jsoncallback);
				out.print(__jsoncallback + "(" + jSONObject.toString(2) + ")");
				// descomentame: logger.debug("vamos a contestar
				// eso:"+__jsoncallback+"("+jSONObject.toString(2)+")");
			} else {
				out.print(jSONObject.toString(2));
				// descomentame: logger.debug("vamos a contestar eso:"+jSONObject.toString(2));
			}
			out.flush();
			out.close();
			logger.debug("jsonMessage flushed and closed");
			return null;

		}
		return null;
	}

	public ActionForward form(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		logger.debug("aki");

		miServicio.m_form(request, this);
		new AxisRequestProcessor().extractConnection(request);
		if (request.getAttribute(Constantes.__jSONObject) != null) {
			JSONObject jSONObject = (JSONObject) request.getAttribute(Constantes.__jSONObject);

			response.setContentType("application/json; charset=iso-8859-1");
			PrintWriter out = response.getWriter();
			if (request.getParameter(Constantes.__jsoncallback) != null
					&& request.getParameter(Constantes.__jsoncallback).trim().length() > 0) {
				String __jsoncallback = request.getParameter(Constantes.__jsoncallback);
				out.print(__jsoncallback + "(" + jSONObject.toString(2) + ")");
				// descomentame: logger.debug("vamos a contestar
				// eso:"+__jsoncallback+"("+jSONObject.toString(2)+")");
			} else {
				out.print(jSONObject.toString(2));
				// descomentame: logger.debug("vamos a contestar eso:"+jSONObject.toString(2));
			}
			out.flush();
			out.close();
			logger.debug("jsonMessage flushed and closed");
			return null;

		}
		return mapping.findForward("form");
	}

	public ActionForward echo(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		logger.debug("aki");
		miServicio.m_echo(request, this);
		if (request.getAttribute("jsonMessage") != null) {
			JSONObject jsonMessage = (JSONObject) request.getAttribute("jsonMessage");
			response.setContentType("application/json");
			PrintWriter out = response.getWriter();
			out.print(jsonMessage.toString(2));
			out.flush();
			out.close();
			logger.debug("jsonMessage flushed and closed");
			return null;
		}
		return mapping.findForward("form");
	}

}
