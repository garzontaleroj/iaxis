package axis.mvc.control.axis;

import java.io.IOException;
import java.util.ArrayList;
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

public class TestplantillaAction extends AbstractDispatchAction {

	Log logger = LogFactory.getLog(this.getClass());

	public ActionForward general(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr100Action General");
		request.setAttribute("lista", this.listaEjemplo());
		return mapping.findForward("general");
	}

	public ActionForward modal(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("TestPlantillaAction Modal");

		return mapping.findForward("modal");
	}

	public ActionForward resumen(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr100Action Resumen");
		request.setAttribute("lista", this.listaEjemplo());
		return mapping.findForward("resumen");
	}

	public ActionForward base(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr100Action Base");
		request.setAttribute("lista", this.listaEjemplo());
		return mapping.findForward("base");
	}

	public ActionForward mini(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr100Action Base");
		return mapping.findForward("mini");
	}

	public ArrayList listaEjemplo() {
		ArrayList lista = new ArrayList();

		for (int i = 0; i <= 3; i++) {
			HashMap datos_persona = new HashMap();
			datos_persona.put("NOMBRE", "Alonso Dom�nguez Casado");
			datos_persona.put("TLF", "935661111");
			datos_persona.put("CARGO", "gerente");
			lista.add(datos_persona);
		}

		return lista;
	}

}
