package axis.service.modal;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.control.modal.Axisper045Action;
import axis.mvc.model.ObIaxMarcas;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AxismprxxxService;
import axis.util.Constantes;

public class Axisper045Service extends AxismprxxxService {
	static Log logger = LogFactory.getLog(Axisper044Service.class);

	public void m_init(HttpServletRequest request, Axisper045Action thisAction) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {
			this.initxxx(request, thisAction);
			if (!isEmpty(this.getCampoTextual(request, "AXISMPRXXX_EST"))) {
				String EST = this.getCampoTextual(request, "AXISMPRXXX_EST");
				request.getSession().setAttribute("AXISMPRXXX_EST", EST);
			}
			request.getSession().setAttribute("AXISMPRXXX", "axisper045");
		} catch (Exception e) {
			logger.error("Error en el servicio Axisper045Service - m�todo m_init", e);
			AbstractDispatchAction.guardarMensaje(request, "1000050", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
	}

	public void m_form(HttpServletRequest request, Axisper045Action thisAction) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {
			BigDecimal SPERSON = null;
			BigDecimal CEMPRES = usuario.getCempres();
			String OBSERVACION = (String) request.getParameter("OBSERVACION");
			String CMARCA = (String) request.getParameter("CMARCA");

			if (isEmpty(SPERSON) && !isEmpty(request.getParameter("SPERSON")))
				SPERSON = new BigDecimal(String.valueOf(request.getParameter("SPERSON")));

			formdata.put("PERSONA_MARCA", SPERSON);
			formdata.put("CMARCA", CMARCA);
			formdata.put("OBSERVACION", OBSERVACION);

		} catch (Exception e) {
			logger.error("Error en el m�todo Axisper045Service.m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	public BigDecimal crearMarca(HttpServletRequest request, Axisper045Action thisAction) {
		logger.debug("Axisper045Service crearMarca");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		BigDecimal CEMPRES = usuario.getCempres();

		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		BigDecimal SPERSON = new BigDecimal(String.valueOf(request.getParameter("SPERSON")));
		try {
			String cmarca = (String) formdata.get("CMARCA");
			String observacion = (String) formdata.get("OBSERVACION");
			Map lstMarcasModificadas = (Map) request.getSession().getAttribute("LSTMARCASMODIFICADAS");
			ObIaxMarcas objMarca = null;
			if (!isEmpty(observacion) && observacion != "") {

				if (isEmpty(lstMarcasModificadas)) {
					lstMarcasModificadas = new HashMap<String, ObIaxMarcas>();
					objMarca = new ObIaxMarcas();
				} else {
					objMarca = (ObIaxMarcas) lstMarcasModificadas.get(cmarca);
					if (isEmpty(objMarca))
						objMarca = new ObIaxMarcas();
				}

				objMarca.setCempres(CEMPRES);
				objMarca.setCmarca(cmarca);
				objMarca.setSperson(SPERSON);
				objMarca.setCtipo(new BigDecimal(0));
				objMarca.setObservacion(observacion);

				lstMarcasModificadas.put(cmarca, objMarca);
				request.getSession().setAttribute("LSTMARCASMODIFICADAS", lstMarcasModificadas);

				m_form(request, thisAction);
			}
			return new BigDecimal(0);
		} catch (Exception e) {
			logger.error("Error en el m�todo Axisper045Service.crearMarca", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
			return new BigDecimal(1);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}
}
