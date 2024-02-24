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
import axis.service.modal.Axiscomi007Service;

public class Axiscomi007Action extends AbstractDispatchAction {
	Log logger = LogFactory.getLog(this.getClass());
	private Axiscomi007Service miServicio = new Axiscomi007Service();

	public ActionForward init(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {

		return this.form(mapping, form, request, response);
	}

	public ActionForward form(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		miServicio.m_form(request, this);
		return mapping.findForward("form");
	}

	public ActionForward buscar(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		miServicio.m_buscar(request, this);
		// return this.form(mapping, form, request, response);

		/*
		 * Si ejecutamos el this.form despu�s de buscar, con una b�squeda todo a null
		 * (sin par�metros), nos cargamos en el form el atributo axisctr_listaPolizas
		 * Por eso mejor hacer un mapping.findForward, para que no pase por el form y
		 * los productos que se cargan en form, ponerlos en session
		 */
		return mapping.findForward("form");
	}

	public ActionForward recargar(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		miServicio.m_recargar(request, this);
		// return this.form(mapping, form, request, response);

		/*
		 * Si ejecutamos el this.form despu�s de buscar, con una b�squeda todo a null
		 * (sin par�metros), nos cargamos en el form el atributo axisctr_listaPolizas
		 * Por eso mejor hacer un mapping.findForward, para que no pase por el form y
		 * los productos que se cargan en form, ponerlos en session
		 */
		return mapping.findForward("form");
	}

	public ActionForward aceptar(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		miServicio.m_aceptar(request, this);
		return mapping.findForward("form");
	}

	public ActionForward cerrar(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		miServicio.m_cerrar(request, this);
		return mapping.findForward("form");
	}

	public ActionForward ajax_guardar_porcentaje(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr001Action ajax_busqueda_productos");
		miServicio.m_ajax_guardar_porcentaje(request);
		return mapping.findForward("ajax");
	}

	public ActionForward ajax_busqueda_productos(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axiscomi007Action ajax_busqueda_productos");
		miServicio.m_ajax_busqueda_productos(request);
		return mapping.findForward("ajax");
	}

	public ActionForward ajax_busqueda_actividades(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axiscomi007Action ajax_busqueda_actividades");
		miServicio.m_ajax_busqueda_actividades(request);
		return mapping.findForward("ajax");
	}

	public ActionForward ajax_busqueda_garantias(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axiscomi007Action ajax_busqueda_garantias");
		miServicio.m_ajax_busqueda_garantias(request);
		return mapping.findForward("ajax");
	}

	public ActionForward borrar_desglose(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		miServicio.m_borrar_desglose(request, this);

		return this.buscar(mapping, form, request, response);
	}
}
