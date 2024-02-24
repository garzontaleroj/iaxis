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
import axis.service.modal.Axiscomi005Service;

public class Axiscomi005Action extends AbstractDispatchAction {
	Log logger = LogFactory.getLog(this.getClass());
	private Axiscomi005Service miServicio = new Axiscomi005Service();

	public ActionForward init(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		miServicio.m_init(request, this);
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

	public ActionForward aceptar(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		miServicio.m_aceptar(request, this);
		return this.init(mapping, form, request, response);
	}

	public ActionForward cerrar(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		miServicio.m_cerrar(request, this);
		return mapping.findForward("form");
	}

	public ActionForward ajax_busqueda_productos(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr001Action ajax_busqueda_productos");
		miServicio.m_ajax_busqueda_comisiones(request);
		return mapping.findForward("ajax");
	}

	public ActionForward buscar_productos(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		miServicio.m_buscar_productos(request, this);
		// return this.form(mapping, form, request, response);

		/*
		 * Si ejecutamos el this.form despu�s de buscar, con una b�squeda todo a null
		 * (sin par�metros), nos cargamos en el form el atributo axisctr_listaPolizas
		 * Por eso mejor hacer un mapping.findForward, para que no pase por el form y
		 * los productos que se cargan en form, ponerlos en session
		 */

		return mapping.findForward("form");
	}

	public ActionForward buscar_actividades(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		miServicio.m_buscar_actividades(request, this);
		// return this.form(mapping, form, request, response);

		/*
		 * Si ejecutamos el this.form despu�s de buscar, con una b�squeda todo a null
		 * (sin par�metros), nos cargamos en el form el atributo axisctr_listaPolizas
		 * Por eso mejor hacer un mapping.findForward, para que no pase por el form y
		 * los productos que se cargan en form, ponerlos en session
		 */

		return mapping.findForward("form");
	}

	public ActionForward buscar_garantias(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		miServicio.m_buscar_garantias(request, this);
		// return this.form(mapping, form, request, response);

		/*
		 * Si ejecutamos el this.form despu�s de buscar, con una b�squeda todo a null
		 * (sin par�metros), nos cargamos en el form el atributo axisctr_listaPolizas
		 * Por eso mejor hacer un mapping.findForward, para que no pase por el form y
		 * los productos que se cargan en form, ponerlos en session
		 */

		return mapping.findForward("form");
	}

	public ActionForward ajax_guardar_porcentaje(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr001Action ajax_busqueda_productos");
		miServicio.m_ajax_guardar_porcentaje(request);
		return mapping.findForward("ajax");
	}

	public ActionForward borrar_desglose(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		miServicio.m_borrar_desglose(request, this);

		return this.init(mapping, form, request, response);
	}

}
