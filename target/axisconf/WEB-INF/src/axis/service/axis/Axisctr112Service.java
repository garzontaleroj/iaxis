package axis.service.axis;

import java.math.BigDecimal;
import java.sql.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.cache.AxisCodeWizard;
import axis.jdbc.PAC_IAX_AGENSEGU;
import axis.jdbc.PAC_IAX_PRODUCCION;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.control.axis.Axisctr112Action;
import axis.mvc.model.UsuarioBean;
import axis.util.Constantes;

public class Axisctr112Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	public Axisctr112Service() {
		super();
	}

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE INICIALIZACION
	 *******************************************/
	/*********************************************************************************************************************/
	/**
	 * Carga de los riesgos a mostrar en la pantalla
	 * 
	 * @param request
	 */

	@SuppressWarnings("all")
	public void m_form(HttpServletRequest request, Axisctr112Action Axisctr112Action) {
		logger.debug("Axisctr112Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {
			Map mapGenPoliza = new HashMap();
			// Inicializamos las clausulas
			mapGenPoliza = this.dbLeePoliza(request);
			formdata.put("NPOLIZA", mapGenPoliza.get("NPOLIZA"));
			formdata.put("SSEGURO", mapGenPoliza.get("SSEGURO"));
			formdata.put("NLINEA", mapGenPoliza.get("NLINEA"));
			formdata.put("TTITULO", mapGenPoliza.get("TTITULO"));
			formdata.put("TTEXTOS", request.getSession().getAttribute("TTEXTOS"));
			formdata.put("CTIPREG", mapGenPoliza.get("CTIPREG"));
			formdata.put("CESTADO", mapGenPoliza.get("CESTADO"));
			formdata.put("FALTA", mapGenPoliza.get("FALTA"));
			formdata.put("FFINALI", mapGenPoliza.get("FFINALI"));
			formdata.put("CMODO", mapGenPoliza.get("CMODO"));

			Map map2 = new PAC_IAX_PRODUCCION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_PRODUCCION__F_LEEAGENSEGU();
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr112Service . metodo m_form", e);
			Axisctr112Action.guardarMensaje(request, "1000050", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, whoami(this));

	}

	/**
	 * Lee el numero de la p�liza.
	 * 
	 * @param request El HttpServletRequest que contiene la petici�n del cliente
	 *                web.
	 * @return
	 * @throws Exception
	 */
	private Map dbLeePoliza(HttpServletRequest request) throws Exception {
		Map map = new PAC_IAX_PRODUCCION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_PRODUCCION__F_GET_DATPOLIZA(null);
		logger.debug("OBJETO POLIZA  BBDD ->" + map);
		Map mapPoliza = (HashMap) map.get("RETURN");
		// Map mapPoliza
		return mapPoliza;
	}

	public void m_siguiente(HttpServletRequest request, Axisctr112Action thisAction) {
		logger.debug("Axisctr112Service m_siguiente");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		HashMap passformdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {
			String PMODO = null;
			for (int i = 0; i < thisAction.getPila(request).size(); i++) {
				HashMap m = (HashMap) thisAction.getPila(request).get(i);
				PMODO = (String) m.get("CMODO");
			}
			BigDecimal NPOLIZA = getCampoNumerico(request, "NPOLIZA");
			BigDecimal SSEGURO = getCampoNumerico(request, "SSEGURO");
			BigDecimal NLINEA;
			NLINEA = (getCampoNumerico(request, "NLINEA") == null) ? BigDecimal.ZERO
					: getCampoNumerico(request, "NLINEA");
			String TTITULO;
			TTITULO = (getCampoTextual(request, "TTITULO") == null ? (String) (" ")
					: (String) getCampoTextual(request, "TTITULO"));
			if (PMODO == "ALTA_POLIZA") {
				logger.debug("PMODO :: " + PMODO);
			} else {
				if (PMODO == "ALTA_COLECTIVO") {
					logger.debug("PMODO :: " + PMODO);
				} else {

					String PFEFECTO = getCampoTextual(request, "PFEFECTO");
					logger.debug("PFEFECTO :: " + PFEFECTO);
					passformdata.put("PFEFECTO", PFEFECTO);
					logger.debug("axisctr112 passformdata:" + passformdata);
					request.setAttribute(Constantes.PASSFORMDATA, passformdata);

				}
			}
			String TTEXTOS = getCampoTextual(request, "TTEXTOS");

			BigDecimal CTIPREG;
			// INI-CESS-IAXIS-3647 -- Change default value from 36 (Agenda persona) to 3
			// (Concepto Tenico)
			CTIPREG = ((getCampoNumerico(request, "CTPREG") != null) ? getCampoNumerico(request, "CTIPREG")
					: BigDecimal.valueOf(3));
			// END-CESS-IAXIS-3647
			BigDecimal CESTADO;
			CESTADO = ((getCampoNumerico(request, "CESTADO") != null) ? getCampoNumerico(request, "CESTADO")
					: BigDecimal.ZERO);

			Date hoy = new Date(new java.util.Date().getTime());
			Date FAPUNTE = ((!isEmpty(stringToSqlDate(getCampoTextual(request, "FALTA"))))
					? stringToSqlDate(getCampoTextual(request, "FALTA"))
					: hoy);
			Date FFINALI = stringToSqlDate(getCampoTextual(request, "FFINALI"));
			BigDecimal CMODO;
			if (PMODO.equals("ALTA_POLIZA"))
				CMODO = BigDecimal.ZERO;
			else
				CMODO = BigDecimal.ONE;

			Map map;
			map = new PAC_IAX_AGENSEGU((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_AGENSEGU__F_SET_DATOSAPUNTE(NPOLIZA, SSEGURO, NLINEA, TTITULO, TTEXTOS, CTIPREG,
							CESTADO, FAPUNTE, FFINALI, CMODO, "EST");
			request.getSession().setAttribute("TTEXTOS", TTEXTOS);
			logger.debug(map);
			if (BigDecimal.ZERO.equals(tratarRETURNyMENSAJES(request, map)))
				request.setAttribute(Constantes.FORWARDACTION,
						AxisCodeWizard.findForward(request, Constantes.SIGUIENTE, whoami(this), null));
			f_Cargar_Propiedades_Pantalla(request, whoami(this));
		} catch (Exception e) {
			logger.error("Error en el Servicio Axisctr112Service -metodo m_siguiente", e);
			AbstractDispatchAction.guardarMensaje(request, "1000050", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
	}

	/**
	 * Guarda la pantalla y determina la pantalla anterior a ejecutar.
	 * 
	 * @param request
	 */
	public void m_anterior(HttpServletRequest request) {
		logger.debug("Axisctr112Service m_anterior");
		try {
			request.setAttribute(Constantes.FORWARDACTION,
					AxisCodeWizard.findForward(request, Constantes.ANTERIOR, whoami(this), null));
			f_Cargar_Propiedades_Pantalla(request, whoami(this));
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr112Service - m�todo m_anterior", e);
			AbstractDispatchAction.guardarMensaje(request, "1000050", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
	}

}