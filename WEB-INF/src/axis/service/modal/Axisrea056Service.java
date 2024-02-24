//Revision:# /sxzTeg+RprRtMtkLR7EnQ== #
package axis.service.modal;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_CUMULOS_CONF;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.control.modal.Axisrea056Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

public class Axisrea056Service extends AxisBaseService {
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
	public void m_form(HttpServletRequest request, Axisrea056Action thisAction) {
		logger.debug("Axisrea056Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {
			BigDecimal SPERSON = getCampoNumerico(request, "SPERSON");
			BigDecimal CAGENTE = getCampoNumerico(request, "CAGENTE");

			logger.debug(formdata);
			logger.debug("SPERSON:" + SPERSON);
			logger.debug("CAGENTE" + CAGENTE);
			/* Desplegables */
			// cargarValoresDesplegables(request, usuario, formdata);
			/* m_buscar */
			m_buscar(request, thisAction);

			BigDecimal CMODO = getCampoNumerico(request, "CMODO");
			if (CMODO == null) {
				try {
					CMODO = new BigDecimal(String.valueOf(request.getParameter("CMODO")));
				} catch (Exception ex) {
					CMODO = null;
				}
			}
			formdata.put("CMODO", bigDecimalToString(CMODO));

		} catch (Exception e) {
			logger.error("Error en el m�todo Axisrea056Service.m_form", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	/**
	 * M�todo que se llama al inicio de este flujo.
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_buscar(HttpServletRequest request, Axisrea056Action thisAction) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		logger.debug("Axisrea056Service m_buscar");

		try {

			PAC_IAX_CUMULOS_CONF pac_iax_cumulos_conf = new PAC_IAX_CUMULOS_CONF(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			logger.debug(formdata);
			String NPOLIZA = getCampoTextual(request, "NPOLIZA");
			String TSUPLEM = getCampoTextual(request, "TSUPLEM");
			String TAMPARO = getCampoTextual(request, "TAMPARO");
			String NVALAMP = getCampoTextual(request, "NVALAMP");
			String SSEGURO = getCampoTextual(request, "SSEGURO");
			String CGARANT = getCampoTextual(request, "CGARANT");
			String CGENERA = getCampoTextual(request, "CGENERA");
			BigDecimal SPERSON = getCampoNumerico(request, "SPERSON");
			BigDecimal CAGENTE = getCampoNumerico(request, "CAGENTE");

			formdata.put("NPOLIZA", NPOLIZA);
			formdata.put("TSUPLEM", TSUPLEM);
			formdata.put("TAMPARO", TAMPARO);
			formdata.put("NVALAMP", NVALAMP);
			formdata.put("SSEGURO", SSEGURO);
			formdata.put("CGARANT", CGARANT);
			formdata.put("CGENERA", CGENERA);
			formdata.put("SPERSON", SPERSON);
			formdata.put("pcagente", CAGENTE);
			logger.debug(formdata);
			List<Map> lstPoliza = new ArrayList<Map>();
			Map map1 = new HashMap();
			map1.put("NPOLIZA", NPOLIZA);
			map1.put("TSUPLEM", TSUPLEM);
			map1.put("TAMPARO", TAMPARO);
			map1.put("NVALAMP", NVALAMP);

			lstPoliza.add(map1);
			formdata.put("lstPoliza", lstPoliza);
			logger.debug(map1);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisrea056Service - m�todo m_buscar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
	}

	/**
	 * M�todo que guarda el registro de la depuracion manual.
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_aceptar(HttpServletRequest request, Axisrea056Action thisAction) {

		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		logger.debug("Axisrea056Service m_aceptar");

		try {

			BigDecimal SSEGURO = getCampoNumerico(request, "SSEGURO");
			BigDecimal CGENERA = getCampoNumerico(request, "CGENERA");
			BigDecimal CGARANT = getCampoNumerico(request, "CGARANT");
			BigDecimal VALOR = getCampoNumerico(request, "VALOR");
			String INDICAD = getCampoTextual(request, "INDICAD");

			String NPOLIZA = getCampoTextual(request, "NPOLIZA");
			String TSUPLEM = getCampoTextual(request, "TSUPLEM");
			String TAMPARO = getCampoTextual(request, "TAMPARO");
			String NVALAMP = getCampoTextual(request, "NVALAMP");

			List<Map> lstPoliza = new ArrayList<Map>();
			Map map1 = new HashMap();
			map1.put("NPOLIZA", NPOLIZA);
			map1.put("TSUPLEM", TSUPLEM);
			map1.put("TAMPARO", TAMPARO);
			map1.put("NVALAMP", NVALAMP);
			lstPoliza.add(map1);
			formdata.put("lstPoliza", lstPoliza);

			PAC_IAX_CUMULOS_CONF pac_iax_cumulos_conf = new PAC_IAX_CUMULOS_CONF(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			if (CGARANT.equals(new BigDecimal("7000")) && !VALOR.equals(new BigDecimal("100"))) {
				thisAction.guardarMensaje(request, "9910455", new Object[] { "" }, Constantes.MENSAJE_INFO);
			} else {

				Map map = pac_iax_cumulos_conf.ejecutaPAC_IAX_CUMULOS_CONF__F_SET_DEPURACION_MANUAL(SSEGURO, CGENERA,
						CGARANT, INDICAD, VALOR);
				logger.debug(map);

				request.setAttribute("resultado", (BigDecimal) tratarRETURNyMENSAJES(request, map));
			}
		} catch (Exception e) {
			logger.error("Error en el servicio Axisrea056Service - m�todo m_calcular", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}

		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

}
