
package axis.mvc.control.axis;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import axis.mvc.control.AbstractDispatchAction;
import axis.service.axis.AxisBaseService;
import axis.service.axis.Axisctr209Service;
import axis.service.modal.Axisctr033Service;
import axis.util.Constantes;

/**
 * NOMBRE: Axisctr209Action.java Referencia:
 * http://mantis.srvcsi.com/view.php?id=27262#c149107
 *
 * REVISIONES: Ver Fecha Autor Descripci�n --------- ---------- ---------------
 * ------------------------------------ 1.0 16/08/2013 RCL Creaci�n clase
 */
public class Axisctr209Action extends AbstractDispatchAction {

	Log logger = LogFactory.getLog(this.getClass());
	private Axisctr209Service miServicio = new Axisctr209Service();

	/**
	 * 
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 * @throws IOException
	 * @throws ServletException
	 */
	public ActionForward init(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr209Action Init");
		miServicio.m_init(request, this);
		return this.form(mapping, form, request, response);
	}

	/**
	 * 
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 * @throws IOException
	 * @throws ServletException
	 */
	public ActionForward form(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr209Action Form");
		miServicio.m_form(request, this);
		return mapping.findForward("form");
	}

	/**
	 * 
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 * @throws IOException
	 * @throws ServletException
	 */
	public ActionForward aceptar(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr209Action aceptar");
		miServicio.m_aceptar(request, this);
		return this.form(mapping, form, request, response);
	}

	/**
	 * 
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	public ActionForward miajaxjson(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		miServicio.m_miajaxjson(request, this);
		return mapping.findForward("json"); // json ya esta predefindo como mapping
	}

	/**
	 * 
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 * @throws IOException
	 * @throws ServletException
	 */
	public ActionForward recargar(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axisctr209Action recargar");

		// Mensajes de OK devueltos des del modal
		if (request.getSession().getAttribute("PRETEN_MENSAJES") != null) {
			AbstractDispatchAction.guardarMensaje(request,
					String.valueOf(request.getSession().getAttribute("PRETEN_MENSAJES")), null,
					Constantes.MENSAJE_INFO);
			request.getSession().removeAttribute("PRETEN_MENSAJES");
		}

		if (request.getParameter("paginar") == null) {
			HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
			String nPoliza = (String) this.topPila(request, "NPOLIZA");

			if (AxisBaseService.isEmpty(nPoliza))
				nPoliza = request.getParameter("NPOLIZA");

			if (!AxisBaseService.isEmpty(nPoliza))
				formdata.put("NPOLIZA", nPoliza);

			formdata.put("PMODO", "AUTORIZA_MASIVO");

			new Axisctr033Service().m_buscar(request);
		}

		return this.form(mapping, form, request, response);
	}

	public ActionForward ajax_valdocrequerida(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr209Action valdocrequerida");
		miServicio.m_ajax_valdocrequerida(request);
		return mapping.findForward("ajax");
	}

	public ActionForward consultar(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axisctr209Action consultar");

		if (request.getParameter("paginar") != null)
			return this.form(mapping, form, request, response);

		// BUG 27262/154714 - RCL - Al acceder al detalle, vamos directamente a BUSCAR
		this.topPila(request, Constantes.SALTARDESTINOACTION,
				new ActionForward("/axis_axisctr034.do?operation=buscar"));
		this.topPila(request, Constantes.SALTARORIGENACTION,
				new ActionForward("/axis_axisctr209.do?operation=recargar"));
		this.topPila(request, "CCONTROL", request.getParameter("CCONTROL"));
		this.topPila(request, "NPOLIZA", request.getParameter("NPOLIZA"));
		this.topPila(request, "PMODO", "AUTORIZA_MASIVO");

		// Meter la pila actual en PASSTOPPILA, para que la puedan utilizar los flujos
		// de destino
		request.setAttribute(Constantes.PASSTOPPILA, this.topPila(request));

		// BUG 27262/154746 - RCL - Guardamos en session el PMODO, para volver.
		request.getSession().setAttribute("PMODO", "AUTORIZA_MASIVO");

		return mapping.findForward("saltar");
	}

}
