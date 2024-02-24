package axis.mvc.control.axis;

import java.io.IOException;
import java.math.BigDecimal;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import axis.mvc.control.AbstractDispatchAction;
import axis.service.axis.Axisctr050Service;

/**
 * Axisctr050Action.java 12/12/2008
 * 
 * @author <a href="xpastor@csi-ti.com">Xavi Pastor/Jaume Garcia</a>
 * @since Java 5.0
 */
public class Axisctr050Action extends AbstractDispatchAction {
	Log logger = LogFactory.getLog(this.getClass());
	private Axisctr050Service miServicio = new Axisctr050Service();

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE INICIALIZACION
	 *******************************************/
	/*********************************************************************************************************************/

	public ActionForward init(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axisctr050Action Init");
		return this.form(mapping, form, request, response);
	}

	public ActionForward form(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axisctr050Action Form");
		miServicio.m_form(request);
		return mapping.findForward("form");
	}

	/*********************************************************************************************************************/
	/************************************************
	 * M�TODOS DE ACTUALIZACI�N
	 *******************************************/
	/*********************************************************************************************************************/

	public ActionForward buscar(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axisctr050Action buscar");
		miServicio.m_buscar(request);
		return this.form(mapping, form, request, response);
	}

	public ActionForward actualitzarMeses(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axisctr050Action actualitzarMeses");
		miServicio.m_actualitzarMeses(request);
		return this.form(mapping, form, request, response);
	}

	public ActionForward actualitzarAnyo(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axisctr050Action actualitzarAnyo");
		miServicio.m_actualitzarAnyo(request);
		return this.form(mapping, form, request, response);
	}

	public ActionForward ajaxseleccionarProd(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axisctr050Action seleccionarProd");
		miServicio.m_ajaxseleccionarProd(request);
		return mapping.findForward("ajax");
	}

	public ActionForward ajaxregistrar(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axisctr050Action ajaxregistrar");
		miServicio.m_ajaxregistrar(request);
		return mapping.findForward("ajax");

	}

	public ActionForward procesar(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axisctr050Action procesar");
		if (((BigDecimal) miServicio.m_procesar(request)).intValue() == 0) {
			return this.form(mapping, form, request, response);
		}
		return mapping.findForward("form");

	}

	public ActionForward imprimir(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axisctr050Action imprimir");
		miServicio.m_imprimir(request);

		return mapping.findForward("form");

	}

	public ActionForward ajax_generar_resultados_map(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.debug("Axisfis001Action ajax_generar_resultados_map");
		miServicio.m_ajax_generar_resultados_map(request);
		return mapping.findForward("ajax");
	}

	public ActionForward diferidos(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axisctr050Action diferidos");

		if (((BigDecimal) miServicio.m_diferidos(request)).intValue() == 0) {
			return this.form(mapping, form, request, response);
		}
		return mapping.findForward("form");

	}

	public ActionForward ajax_actualizarParametrosProductos(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axisctr050Action ajax_actualizarParametrosProductos");
		miServicio.m_ajax_actualizarParametrosProductos(request);
		return mapping.findForward("ajax");
	}

	public ActionForward recuperarsprocesajaxjson(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		logger.debug("Axisctr050Action recuperarsprocesajaxjson");
		miServicio.m_recuperarsprocesajaxjson(request, this);
		return mapping.findForward("json"); // json ya esta predefindo como mapping
	}

	public ActionForward carteraprogramada(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axisctr050Action previoprogramado");
		miServicio.m_carteraprogramada(request, this);
		return this.buscar(mapping, form, request, response);
	}

}