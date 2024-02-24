package axis.service.modal;

import java.math.BigDecimal;
import java.sql.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_CUMULOS_CONF;
import axis.jdbc.PAC_IAX_PERSONA;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.control.modal.Axisrea053Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

public class Axisrea053Service extends AxisBaseService {
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
	public void m_form(HttpServletRequest request, Axisrea053Action thisAction) {
		logger.debug("Axisrea053Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {

			BigDecimal CMODO = getCampoNumerico(request, "CMODO");
			if (CMODO == null) {
				try {
					CMODO = new BigDecimal(String.valueOf(request.getParameter("CMODO")));
				} catch (Exception ex) {
					CMODO = null;
				}
			}

			formdata.put("CMODO", bigDecimalToString(CMODO));

			/* m_buscar */
			m_buscar(request, thisAction);

		} catch (Exception e) {
			logger.error("Error en el m�todo Axisrea053Service.m_form", e);
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
	public void m_buscar(HttpServletRequest request, Axisrea053Action thisAction) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		DateFormat format = new SimpleDateFormat("dd/MM/yyyy");
		SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
		logger.debug("Axisrea053Service m_buscar");

		try {

			PAC_IAX_CUMULOS_CONF pac_iax_cumulos_conf = new PAC_IAX_CUMULOS_CONF(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			PAC_IAX_PERSONA pac_iax_persona = new PAC_IAX_PERSONA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			Date FCORTE = stringToSqlDate(getCampoTextual(request, "FCORTE"));
			if (FCORTE == null) {
				try {
					FCORTE = stringToSqlDate(String.valueOf(request.getParameter("FCORTE")));
				} catch (Exception ex) {
					FCORTE = null;
				}
			}

			String NNUMIDE = getCampoTextual(request, "NNUMIDE");
			BigDecimal TIPCOMP = getCampoNumerico(request, "TIPCOMP");
			BigDecimal SPERSON = getCampoNumerico(request, "SPERSON");

			Map map = pac_iax_cumulos_conf.ejecutaPAC_IAX_CUMULOS_CONF__F_GET_COM_FUTUROS(FCORTE, NNUMIDE, TIPCOMP,
					SPERSON);
			logger.debug(map);
			List<Map> lstRegistroGeneral = (List<Map>) tratarRETURNyMENSAJES(request, map);

			formdata.put("lstRegistroGeneral", lstRegistroGeneral);

//             map = pac_iax_cumulos_conf.ejecutaPAC_IAX_CUMULOS_CONF__F_GET_DETCOM_FUTUROS(SSEGURO, TIPCOMP);
//             List <Map> lstDCF = (List<Map>) tratarRETURNyMENSAJES(request, map);
//             logger.debug(map);
//             formdata.put("lstAcumulacionesRI", lstDCF);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisrea053Service - m�todo m_buscar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
	}

	/**
	 * M�todo que se llama al inicio de este flujo.
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_cargar_detalle(HttpServletRequest request, Axisrea053Action thisAction) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		logger.debug("Axisrea053Service m_cargar_detalle");

		try {

			PAC_IAX_CUMULOS_CONF pac_iax_cumulos_conf = new PAC_IAX_CUMULOS_CONF(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			PAC_IAX_PERSONA pac_iax_persona = new PAC_IAX_PERSONA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			Date FCORTE = stringToSqlDate(getCampoTextual(request, "FCORTE"));
			if (FCORTE == null) {
				try {
					FCORTE = stringToSqlDate(String.valueOf(request.getParameter("FCORTE")));
				} catch (Exception ex) {
					FCORTE = null;
				}
			}

			String NNUMIDE = getCampoTextual(request, "NNUMIDE");
			BigDecimal SSEGURO = getCampoNumerico(request, "SSEGURO");
			BigDecimal TIPCOMP = getCampoNumerico(request, "TIPCOMP");
			BigDecimal SPERSON = getCampoNumerico(request, "SPERSON");

			Map map = pac_iax_cumulos_conf.ejecutaPAC_IAX_CUMULOS_CONF__F_GET_DETCOM_FUTUROS(SSEGURO, TIPCOMP, FCORTE,
					SPERSON);
			logger.debug(map);
			List<Map> lstRegistroIndividual = (List<Map>) tratarRETURNyMENSAJES(request, map);

			formdata.put("lstRegistroIndividual", lstRegistroIndividual);

			map = pac_iax_cumulos_conf.ejecutaPAC_IAX_CUMULOS_CONF__F_GET_COM_FUTUROS(FCORTE, NNUMIDE, TIPCOMP,
					SPERSON);
			logger.debug(map);
			List<Map> lstRegistroGeneral = (List<Map>) tratarRETURNyMENSAJES(request, map);

			formdata.put("lstRegistroGeneral", lstRegistroGeneral);
			formdata.put("SEGURO", SSEGURO);
		} catch (Exception e) {
			logger.error("Error en el servicio Axisrea053Service - m�todo m_cargar_detalle", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}

		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

}