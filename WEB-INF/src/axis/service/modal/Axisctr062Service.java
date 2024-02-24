package axis.service.modal;

import java.math.BigDecimal;
import java.sql.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.jdbc.PAC_IAX_PRODUCCION_AUT;
import axis.jdbc.PAC_IAX_VALIDACIONES;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

/**
 * Axisctr062Service.java 18/03/2009
 * 
 * @since Java 5.0
 */
public class Axisctr062Service extends AxisBaseService {
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
	@SuppressWarnings("all")
	public void m_form(HttpServletRequest request) {
		logger.debug("Axisctr062Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {

			/* LISTVALORES */
			Map listValores = new HashMap();

			/* Tipo de sexo */
			Map map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES__F_GET_TIPSEXO();
			logger.debug(map);
			listValores.put("tipSexo", tratarRETURNyMENSAJES(request, map));

			formdata.put("listValores", listValores);

			/* Si es una edici�n, recuperar conductor innominado pasado v�a NORDEN */
			BigDecimal NORDEN = getCampoNumerico(request, "NORDEN");

			if (!isEmpty(NORDEN)) {
				PAC_IAX_PRODUCCION_AUT pacIaxProduccionAut = new PAC_IAX_PRODUCCION_AUT(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
				BigDecimal NRIESGO = (BigDecimal) AbstractDispatchAction.topPila(request, "NRIESGO");

				if (isEmpty(NRIESGO))
					NRIESGO = BigDecimal.ONE;

				map = pacIaxProduccionAut.ejecutaPAC_IAX_PRODUCCION_AUT__F_LEE_CONDUCTOR(NRIESGO, NORDEN);
				logger.debug(map);

				request.setAttribute("OB_IAX_AUTCONDUCTORES", tratarRETURNyMENSAJES(request, map));
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr062Service - m�todo m_form", e);
			AbstractDispatchAction.guardarMensaje(request,
					"verbatim:<b>" + e.getClass().getName() + ":</b> " + e.getLocalizedMessage(),
					new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			// Gesti�n de campos y dependencias
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}

	/*********************************************************************************************************************/
	/************************************************
	 * M�TODOS DE ACTUALIZACI�N
	 *******************************************/
	/*********************************************************************************************************************/

	/**
	 * 
	 * @param request
	 */
	@SuppressWarnings("all")
	public void m_aceptar(HttpServletRequest request) {
		logger.debug("Axisctr062Service m_aceptar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {

			PAC_IAX_VALIDACIONES pacIaxValidaciones = new PAC_IAX_VALIDACIONES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			BigDecimal NRIESGO = (BigDecimal) AbstractDispatchAction.topPila(request, "NRIESGO");

			if (isEmpty(NRIESGO))
				NRIESGO = BigDecimal.ONE;

			BigDecimal SPERSON = null; // Los innominados no tienen SPERSON
			BigDecimal NORDEN = getCampoNumerico(request, "NORDEN");
			Date FNACIMI = stringToSqlDate(getCampoTextual(request, "FNACIMI"));
			Date FCARNET = stringToSqlDate(getCampoTextual(request, "FCARNET"));
			BigDecimal CSEXO = getCampoNumerico(request, "CSEXPER");
			BigDecimal NPUNTOS = getCampoNumerico(request, "NPUNTOS");
			BigDecimal CPRINCIPAL = new BigDecimal(0);
			BigDecimal EXPER_MANUAL = getCampoNumerico(request, "EXPER_MANUAL");
			BigDecimal EXPER_CEXPER = getCampoNumerico(request, "EXPER_CEXPER");
			BigDecimal EXPER_SINIE = getCampoNumerico(request, "EXPER_SINIE");
			BigDecimal EXPER_SINIE_MANUAL = getCampoNumerico(request, "EXPER_SINIE_MANUAL");

			Map map = pacIaxValidaciones.ejecutaPAC_IAX_VALIDACIONES__F_VALIDA_CONDUCTORINNOMINADO(NRIESGO, NORDEN,
					FNACIMI, FCARNET, CSEXO, NPUNTOS);
			logger.debug(map);

			if (BigDecimal.ZERO.equals(tratarRETURNyMENSAJES(request, map))) {
				map = new PAC_IAX_PRODUCCION_AUT((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_PRODUCCION_AUT__F_SET_CONDUCTOR(NRIESGO, NORDEN, SPERSON, FNACIMI, NPUNTOS,
								FCARNET, CSEXO, null, CPRINCIPAL, EXPER_MANUAL, EXPER_CEXPER, EXPER_SINIE,
								EXPER_SINIE_MANUAL);

				logger.debug(map);

				request.setAttribute("grabarOK", tratarRETURNyMENSAJES(request, map));
			}

			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr062Service - m�todo m_aceptar", e);
			AbstractDispatchAction.guardarMensaje(request,
					"verbatim:<b>" + e.getClass().getName() + ":</b> " + e.getLocalizedMessage(),
					new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

}
