package axis.service.modal;

import java.math.BigDecimal;
import java.sql.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_PENSIONES;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.control.modal.Axispen012Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

/**
 * Axispen012Service.java 15/12/2009
 * 
 * @since Java 5.0
 */
@SuppressWarnings("all")
public class Axispen012Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE INICIALIZACION
	 *******************************************/
	/*********************************************************************************************************************/

	/**
	 * 
	 * @param request
	 */
	public void m_form(HttpServletRequest request, Axispen012Action thisAction) {
		logger.debug("Axispen012Service m_form");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		try {
			BigDecimal pCCODGES = getCampoNumerico(request, "CCODGES");
			BigDecimal CAGENTE_SESSION = usuario.getCagente();
			formdata.put("CAGENTE_SESSION", CAGENTE_SESSION);

			// Si ens pasen el fons el cargem per pantalla
			if (pCCODGES != null) {
				HashMap m = new PAC_IAX_PENSIONES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_PENSIONES__F_GET_CODGESTORAS(pCCODGES, null, null, null);
				logger.debug("ejecutaPAC_IAX_PENSIONES__F_GET_OB_FONPENSIONES return: " + m);
				formdata.put("CODGESTORAS", m.get("CODGESTORAS"));
				formdata.put("CCODGES", pCCODGES);
			}
		} catch (Exception e) {
			logger.error("Error en el servicio Axispen012Service - m�todo m_form", e);
			AbstractDispatchAction.guardarMensaje(request,
					"verbatim:<b>" + e.getClass().getName() + ":</b> " + e.getLocalizedMessage(),
					new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}

		this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
	}

	/*********************************************************************************************************************/
	/************************************************
	 * M�TODOS DE ACTUALIZACI�N
	 *******************************************/
	/*********************************************************************************************************************/

	public void m_grabar(HttpServletRequest request) {
		logger.debug("Axispen012Service m_nueva_gestora");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		BigDecimal CCODGES = getCampoNumerico(request, "CCODGES");
		Date pPFALTA = stringToSqlDate(getCampoTextual(request, "FALTA"));
		Date pPFBAJA = stringToSqlDate(getCampoTextual(request, "FBAJA"));
		BigDecimal CBANCO = getCampoNumerico(request, "CBANCO");
		BigDecimal COFICIN = getCampoNumerico(request, "COFICIN");
		BigDecimal CDC = getCampoNumerico(request, "CDC");
		String pPNCUENTA = getCampoTextual(request, "NCUENTA");
		BigDecimal SPERSON = getCampoNumerico(request, "SPERSON");
		BigDecimal SPERTIT = getCampoNumerico(request, "SPERTIT");
		String CODDGS = getCampoTextual(request, "CODDGS");
		String TIMECLOSE = getCampoTextual(request, "TIMECLOSE");

		try {
			Map map = new PAC_IAX_PENSIONES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_PENSIONES__F_SET_CODGESTORAS(CCODGES, pPFALTA, pPFBAJA, CBANCO, COFICIN, CDC,
							pPNCUENTA, SPERSON, SPERTIT, CODDGS, TIMECLOSE);

			logger.debug("ejecutaPAC_IAX_PENSIONES__F_SET_CODGESTORAS return:" + map);
			if (((BigDecimal) tratarRETURNyMENSAJES(request, map)).intValue() == 0) {
				formdata.put("GRABAR_OK", "0");
				formdata.put("CCODGES", map.get("PCCODGES_OUT"));
			} else {
				formdata.put("GRABAR_OK", "1");
			}
			// Recuperem el cagente
			BigDecimal CAGENTE_SESSION = usuario.getCagente();
			formdata.put("CAGENTE_SESSION", CAGENTE_SESSION);
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));

		} catch (Exception e) {
			logger.error("Error en el servicio Axipen012 Service - m�todo  m_nueva_gestora", e);
			AbstractDispatchAction.guardarMensaje(request, "1000050", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}

	}

}
