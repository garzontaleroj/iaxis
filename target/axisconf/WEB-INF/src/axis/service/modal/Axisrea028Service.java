package axis.service.modal;

import java.math.BigDecimal;
import java.util.Enumeration;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.jdbc.PAC_IAX_REA;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

public class Axisrea028Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	/*********************************************************************************************************************/
	/************************************************
	 * M�TODOS DE INICIALIZACI�N
	 *******************************************/
	/*********************************************************************************************************************/

	/**
	 * Realiza la carga inicial de la pantalla.
	 * 
	 * @param request El HttpServletRequest que contiene la petici�n del cliente
	 *                web.
	 */
	public void m_form(HttpServletRequest request) {
		logger.debug("Axisrea028Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {
			PAC_IAX_LISTVALORES pacIaxListavalores = new PAC_IAX_LISTVALORES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map map_idiomas = pacIaxListavalores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTIDIOMAS();
			List listaIdiomas = (List) tratarRETURNyMENSAJES(request, map_idiomas, false);
			formdata.put("listaIdiomas", listaIdiomas);

			BigDecimal SCONAGR = getCampoNumerico(request, "SCONAGR");

			// BigDecimal CIDIOMA=getCampoNumerico(request, "CIDIOMA");
			// String TCONAGR=getCampoTextual(request, "TCONAGR");
			Map map_lista_desc = new PAC_IAX_REA((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_REA__F_GET_CONTRATOSAGR((SCONAGR != null) ? SCONAGR : new BigDecimal(-1), null,
							null);
			List listaDescripciones = (List) tratarRETURNyMENSAJES(request, map_lista_desc, false);
			formdata.put("listaDescripciones", listaDescripciones);
			logger.debug(map_lista_desc);

		} catch (Exception e) {
			logger.error("Error en el m�todo Axisrea028Service.m_form", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}

	}

	/*********************************************************************************************************************/
	/************************************************
	 * M�TODOS DE ACTUALIZACI�N
	 *******************************************/

	/*********************************************************************************************************************/

	/**
	 * Alta o modificacin de textos de agrupacion. Si aun no existe SCONAGR, se
	 * recupera con un _NEXT (de la BBDD) Se recorren los parametros TCONAGR_#,
	 * recupera a partir del # el CIDIOMA, y si es vacio, se lanza un DELete (da
	 * igual si existia en la BBDD o no) si no es vacio, se lanza un SETea (PL
	 * intenta el insert o update) si todo ha ido bien, pone la variable grabarOK a
	 * 0, sino, se queda en -1
	 * 
	 * @param request
	 */
	public void m_altamodi(HttpServletRequest request) {
		logger.debug("Axisrea028Service m_altamodi");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {
			request.setAttribute("grabarOK", -1);

			BigDecimal SCONAGR = getCampoNumerico(request, "SCONAGR");
			PAC_IAX_REA paciaxRea = new PAC_IAX_REA((java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			if (SCONAGR == null) {
				logger.debug("SCONAGR nulo, he de pedir un nuevo...");
				Map map_scongarnext = paciaxRea.ejecutaPAC_IAX_REA__F_GET_SCONAGR_NEXT();

				SCONAGR = (BigDecimal) map_scongarnext.get("PSMAXCONAGR");
				formdata.put("SCONAGR", SCONAGR);
			}

			if (SCONAGR != null) {
				Enumeration parameterNames = request.getParameterNames();
				String parameterName = null;
				String TCONAGR_X = null;
				BigDecimal _CIDIOMA = null;
				while (parameterNames.hasMoreElements()) {
					parameterName = (String) parameterNames.nextElement();
					if (parameterName.startsWith("TCONAGR_") && !parameterName.endsWith("_MODIFVISIBLE")) {
						TCONAGR_X = getCampoTextual(request, parameterName);
						_CIDIOMA = new BigDecimal(parameterName.substring(parameterName.indexOf("_") + 1));
						if (this.isEmpty(TCONAGR_X)) {
							paciaxRea.ejecutaPAC_IAX_REA__F_DEL_CONTRATOSAGR(SCONAGR, _CIDIOMA);
						} else {
							paciaxRea.ejecutaPAC_IAX_REA__F_SET_CONTRATOSAGR(SCONAGR, _CIDIOMA, TCONAGR_X);
						}
					}
					request.setAttribute("grabarOK", 0);
				}
			} else {
				logger.error("SCONAGR nulo, no debe pasar!");
				AbstractDispatchAction.guardarMensaje(request, "1000050", new Object[] { "SCONAGR null" },
						Constantes.MENSAJE_ERROR);
			}
			/*
			 * 
			 * remoteip=192.168.10.110#, IP=192.168.10.110,
			 * strMappingPath=/modal_axisrea028, parameters:TCONAGR_4=,
			 * TCONAGR_2_MODIFVISIBLE=Agrupa VIDA-RIESGO, SCONAGR=2,
			 * TCONAGR_3_MODIFVISIBLE=, TCONAGR_4_MODIFVISIBLE=, TCONAGR_5=,
			 * TCONAGR_7_MODIFVISIBLE=, operation=altamodi, TCONAGR_2=Agrupa VIDA-RIESGO,
			 * SCONAGR_MODIFVISIBLE=2, TCONAGR_6=, TCONAGR_6_MODIFVISIBLE=, TCONAGR_3=,
			 * TCONAGR_5_MODIFVISIBLE=, TCONAGR_1_MODIFVISIBLE=Agrupa VIDA-RISC,
			 * TCONAGR_1=Agrupa VIDA-RISC, TCONAGR_7=, [DEBUG][11-oct-2011
			 * 06:45:53,151][HTTPThreadGroup-5] (FlujodetrabajoService.java:290) entro al
			 * logActividad
			 */

		} catch (Exception e) {
			logger.error("Error en el m�todo Axisrea028Service.m_altamodi", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}

	}

}
