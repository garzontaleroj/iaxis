package axis.service.modal;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.jdbc.PAC_IAX_REDCOMERCIAL;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.control.modal.Axisage033Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

public class Axisage033Service extends AxisBaseService {
	static Log logger = LogFactory.getLog(Axisage028Service.class);

	public void m_init(HttpServletRequest request, Axisage033Action thisAction) {
		logger.debug("Axisage028Service m_init");
		try {
		} catch (Exception e) {
			logger.error("Error en el servicio axisage028Service - m�todo m_init", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
	}

	public void m_form(HttpServletRequest request, Axisage033Action thisAction) {
		logger.debug("Axisage028Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);

		try {

			BigDecimal CAGENTE = getCampoNumerico(request, "CAGENTE");
			request.getSession().setAttribute("CAGENTE", CAGENTE);
			formdata.put("CAGENTE", CAGENTE);
			PAC_IAX_REDCOMERCIAL pac_iax_redcomercial = new PAC_IAX_REDCOMERCIAL(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			PAC_IAX_LISTVALORES pac_iax_listvalores = new PAC_IAX_LISTVALORES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map map = pac_iax_redcomercial.ejecutaPAC_IAX_REDCOMERCIAL__F_GET_DATOSAGENTE(CAGENTE);

			Map AGENTE = new HashMap();
			AGENTE = (Map) map.get("AGENTE");
			formdata.put("TNOMBRE", AGENTE.get("TNOMBRE"));
			// Map map =
			// pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTDOMIPERSON(SPERSON);

			Map mapcorreo = pac_iax_redcomercial.ejecutaPAC_IAX_REDCOMERCIAL__F_GET_CORREO(CAGENTE);
			formdata.put("PTCORREO", mapcorreo.get("PTCORREO"));
			formdata.put("PCENVCOR", mapcorreo.get("PCENVCOR"));
			formdata.put("PMSJCORREO", mapcorreo.get("PMSJCORREO"));
			ArrayList arrays = (ArrayList) mapcorreo.get("PMSJCORREO");
			formdata.put("CORREOLENGTH", arrays.size());

		} catch (Exception e) {
			logger.error("Error en el servicio axisage033Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		String CMODO = (String) AbstractDispatchAction.topPila(request, "CMODO");
		request.getSession().setAttribute("CMODO", CMODO);
		this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
	}

	public void m_aceptar(HttpServletRequest request) {
		logger.debug("Axisage033Service m_aceptar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		String[] correos;
		String[] envios;
		String[] atributo;
		String CAGENTE;
		String PCENVCOR;
		String PTCORREO;
		BigDecimal size;
		PAC_IAX_REDCOMERCIAL pac_iax_redcomercial = new PAC_IAX_REDCOMERCIAL(
				(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {
			correos = getCampoTextual(request, "TCORREO").split(",");
			envios = getCampoTextual(request, "CENVIAR").split(",");
			atributo = getCampoTextual(request, "CATRIBUS").split(",");
			CAGENTE = getCampoTextual(request, "CAGENTES");
			PTCORREO = getCampoTextual(request, "PTCORREOS");
			PCENVCOR = getCampoTextual(request, "PCENVCORS");
			size = getCampoNumerico(request, "SIZES");

			for (int i = 0; i < correos.length; i++) {
				if (correos[i].equals("_")) {
					correos[i] = null;
				}
				Map mapcorreo = pac_iax_redcomercial.ejecutaPAC_IAX_REDCOMERCIAL__F_SET_CORREO(new BigDecimal(CAGENTE),
						PTCORREO, new BigDecimal(PCENVCOR), correos[i], new BigDecimal(envios[i]),
						new BigDecimal(atributo[i]));
			}

			formdata.remove("BANDERA");
			formdata.put("BANDERA", "salir");
		} catch (Exception e) {
			logger.error("Error.", e);

			formdata.put("BANDERA", 1);
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);

		}

	}
}
