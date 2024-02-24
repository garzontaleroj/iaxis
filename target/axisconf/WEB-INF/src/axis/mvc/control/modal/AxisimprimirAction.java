//Revision:# YK2V+edaRq4xYUZCudpbbw== #
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
import axis.service.modal.AxisimprimirService;

public class AxisimprimirAction extends AbstractDispatchAction {
	Log logger = LogFactory.getLog(this.getClass());
	private AxisimprimirService miServicio = new AxisimprimirService();

	public ActionForward init(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		return this.form(mapping, form, request, response);
	}

	public ActionForward impresion_doc(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		miServicio.m_form_doc(request, this);
		return mapping.findForward("form");
	}

	public ActionForward impresion_doc_tipo(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		miServicio.m_form_doc_tipo(request, this);
		return mapping.findForward("form");
	}

	public ActionForward impresion_personas(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		miServicio.m_form_sperson(request, this);
		return mapping.findForward("form");
	}

	public ActionForward impresion_cartas(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		miServicio.m_impresion_cartas(request, this);
		return mapping.findForward("form");
	}

	public ActionForward impresion_recibos(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		miServicio.m_impresion_recibos(request, this);
		return mapping.findForward("form");
	}

	public ActionForward impresion_docproducto_tipo(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		miServicio.m_form_docproducto_tipo(request, this);
		return mapping.findForward("form");
	}

	public ActionForward impresion_questsalud(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		miServicio.m_form_questsalud(request, this);
		return mapping.findForward("form");
	}

	public ActionForward impresion_factura_tipo(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		miServicio.m_form_factura_tipo(request, this);
		return mapping.findForward("form");
	}

	public ActionForward impresion_pagosini(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		miServicio.m_form_impresion_pagosini(request, this);
		return mapping.findForward("form");
	}

	// etm ini
	public ActionForward impresion_trami(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		miServicio.m_form_impresion_trami(request, this);
		return mapping.findForward("form");
	}
	// etm fin

	public ActionForward form(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		miServicio.m_form(request, this);
		return mapping.findForward("form");
	}

	public ActionForward tunnel(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		miServicio.m_tunnel(request, this, response);
		return mapping.findForward("tunnel");
	}

	public ActionForward tunnel_doc(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		miServicio.m_tunnel_doc(request, this, response);
		return mapping.findForward("error");
	}

	public ActionForward impresion_ListComi(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		miServicio.m_form_ListComi(request, this);
		return mapping.findForward("form");
	}

	public ActionForward impresion_recibo(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		miServicio.m_form_Recibo(request, this);
		return mapping.findForward("form");
	}

	public ActionForward impresion_traspas(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		miServicio.m_impresion_traspas(request, this);
		return mapping.findForward("form");
	}

	public ActionForward impresion_preavisos(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		miServicio.m_impresion_preavisos(request, this);
		return mapping.findForward("form");
	}

	public ActionForward ajax_imp_diferida(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("AxisimprimirAction: ajax_imp_diferida");
		miServicio.m_ajax_imp_diferida(request);
		return mapping.findForward("ajax");
	}

	public ActionForward impresion_proceso(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		miServicio.m_form_proceso(request, this);
		return mapping.findForward("form");
	}

	public ActionForward enviarcorreo(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		miServicio.m_enviarcorreo(request, this);
		return mapping.findForward("form");
	}

	public ActionForward imprimir_renovcero(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		miServicio.m_imprimir_renovcero(request, this);
		return mapping.findForward("form");
	}

	public ActionForward impresion_proceso_compania(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		miServicio.m_form_proceso_compania(request, this);
		return mapping.findForward("form");
	}

	public ActionForward refdeposito(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		miServicio.m_refdeposito(request, this);
		return mapping.findForward("form");
	}

	public ActionForward impresion_sinies_soldoc(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		miServicio.m_form_impresion_sinies_soldoc(request, this);
		return mapping.findForward("form");
	}

	// INI - TCS_19 - ACL - 11/03/2019.
	public ActionForward impresion_pagare(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		miServicio.m_impresion_pagare(request, this);
		return mapping.findForward("form");
	}

}
