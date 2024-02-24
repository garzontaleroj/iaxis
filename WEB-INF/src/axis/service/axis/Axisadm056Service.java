package axis.service.axis;

import java.math.BigDecimal;
import java.sql.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_ALM;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.control.axis.Axisadm056Action;
import axis.mvc.model.UsuarioBean;
import axis.util.Constantes;

public class Axisadm056Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE INICIALIZACION
	 *******************************************/
	/******************************************************
	 * z
	 ***************************************************************/

	/**
	 * M�todo que se llama al inicio de este flujo.
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_init(HttpServletRequest request, Axisadm056Action thisAction) {
		try {
			this.formattingNumericValues(request);
		} catch (Exception e) {
			logger.error("Error", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.configForm(request, whoami(this));
		this.cargaDependencias(request, (List) request.getAttribute("DEPENDENCIAS"));
	}

	/**
	 * Carga la lista de todos los Ramos y carga el Agente inicial.
	 * 
	 * @param request    El HttpServletRequest que contiene la petici�n del cliente
	 *                   web.
	 * @param thisAction Una Action abstracta desde donde se ha invocado el servicio
	 *                   (necesaria para el log).
	 */
	public void m_form(HttpServletRequest request, Axisadm056Action thisAction) {
		logger.debug("Axisadm056Service m_form");
		try {
			UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
			Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
			this.formattingNumericValues(request);
		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm057Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.configForm(request, whoami(this));
		this.cargaDependencias(request, (List) request.getAttribute("DEPENDENCIAS"));
	}

	public void m_buscar(HttpServletRequest request, Axisadm056Action thisAction) {
		logger.debug("Axisadm056Service m_buscar");
		try {

			UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
			Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
			this.formattingNumericValues(request);

			BigDecimal CEMPRES = getCampoNumerico(request, "CEMPRES");
			BigDecimal SPRODUC = getCampoNumerico(request, "SPRODUC");
			BigDecimal NPOLIZA = getCampoNumerico(request, "NPOLIZA");
			BigDecimal NCERTIF = getCampoNumerico(request, "NCERTIF");
			BigDecimal NO_MENS = getCampoNumerico(request, "NO_MENS");
			BigDecimal CRAMO = getCampoNumerico(request, "CRAMO");
			Date FVALORA = stringToSqlDate(getCampoTextual(request, "FVAL_BUS"));

			Map map = new PAC_IAX_ALM((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_ALM__F_GET_ALMDETALLE(CEMPRES, SPRODUC, NPOLIZA, NCERTIF, FVALORA, CRAMO);
			logger.debug("Detalle de Criterios ---> " + map);

			if (isEmpty(NO_MENS)) {
				tratarRETURNyMENSAJES(request, map);

				if (map.get("RETURN").equals(new BigDecimal(0))) {
					formdata.put("OK", new BigDecimal(0));
				} else {
					formdata.put("OK", new BigDecimal(1));
				}
			} else
				formdata.put("OK", new BigDecimal(0));

			// if (num.intValue() !=0)
			// request.setAttribute("axisctr_listadetalle", map.get("P_RDETALLE"));
			formdata.put("axisctr_listadetalle", map.get("P_RDETALLE"));

			// formdata.put("FVALORA",FVALORA);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm056Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.configForm(request, whoami(this));
		this.cargaDependencias(request, (List) request.getAttribute("DEPENDENCIAS"));
	}

	@SuppressWarnings("all")
	public void m_montar_fichero(HttpServletRequest request, Axisadm056Action thisAction) {
		logger.debug("Axisadm056Service m_montar_fichero");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {
			this.formattingNumericValues(request);
			Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
			BigDecimal SPRODUC = getCampoNumerico(request, "SPRODUC");
			BigDecimal CEMPRES = getCampoNumerico(request, "CEMPRES");
			BigDecimal CRAMO = getCampoNumerico(request, "CRAMO");

			Map map = new PAC_IAX_ALM((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_ALM__F_INFORME("CARTERA", SPRODUC, new BigDecimal(0), new BigDecimal(0), CEMPRES,
							CRAMO);
			tratarRETURNyMENSAJES(request, map);

			Map map2 = new PAC_IAX_ALM((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_ALM__F_INFORME("CARTERA", SPRODUC, new BigDecimal(0), new BigDecimal(1), CEMPRES,
							CRAMO);
			tratarRETURNyMENSAJES(request, map2);

			logger.debug("--> MAP --> " + map);

			formdata.put("LINK_INFORME", map.get("P_NOMFICHERO"));
			formdata.put("LINK_INFORME2", map2.get("P_NOMFICHERO"));

			formdata.put("NO_MENS", new BigDecimal(1));

			this.m_buscar(request, thisAction);
			// logger.debug("IMPRIMIR FICHERO -------->
			// "+request.getAttribute("axisctr_listadetalle"));

		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm056Service - m�todo m_montar_fichero", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
		this.configForm(request, whoami(this));
		this.cargaDependencias(request, (List) request.getAttribute("DEPENDENCIAS"));
	}

}
