package axis.service.axis;

import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_OPERATIVA_FINV;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.model.UsuarioBean;
import axis.util.Constantes;

/**
 * Axisfinv016Service.java 16/09/2015
 * 
 * @author <a href="ydevia@csi-ti.com">Yesid Devia</a>
 * @since Java 5.0
 */
public class Axisfinv016Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());
	SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE INICIALIZACION
	 *******************************************/
	/*********************************************************************************************************************/

	/**
	 * M�todo que carga los datos de administraci�n del producto
	 * 
	 * @param request
	 * @param thisAction
	 * @throws Exception
	 */
	private void cargarListas(HttpServletRequest request) {
		logger.debug("Axisfinv016Service cargarListas");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map listValores = new HashMap();
		try {
			BigDecimal CEMPRES = usuario.getCempres();
			java.sql.Date FECHAEFEC = AxisBaseService.stringToSqlDate(this.getCampoTextual(request, "FEFECTO"));

			// System.out.println("CEMPRES = "+CEMPRES+" FECHAEFEC =
			// "+this.getCampoTextual(request,"FEFECTO"));
			PAC_IAX_OPERATIVA_FINV pacIaxOperativaFinv = new PAC_IAX_OPERATIVA_FINV(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			Map map = pacIaxOperativaFinv.ejecutaPAC_IAX_OPERATIVA_FINV__F_GET_LSTFONDOSSEG(CEMPRES, null, FECHAEFEC);
			logger.debug(map);
			if (map.get("RETURN").equals(new BigDecimal(0))) {
				List<Map> lstOrigenFondos = (List<Map>) map.get("PLISTFONDOS");
				List<Map> lstDestinoFondos = (List<Map>) map.get("PLISTFONDOS");
				listValores.put("lstOrigenFondos", lstOrigenFondos);
				listValores.put("lstDestinoFondos", lstDestinoFondos);
			}
			tratarRETURNyMENSAJES(request, map);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisfinv016Service - m�todo cargarListas", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		} finally {
			formdata.put("listValores", listValores);
		}
	}

	public void m_procesar(HttpServletRequest request) {
		logger.debug("Axisfinv016Service procesar");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		// UsuarioBean usuario =
		// (UsuarioBean)request.getSession().getAttribute(Constantes.USUARIO);
		String TFEFECTO = getCampoTextual(request, "FEFECTO");
		java.sql.Date FEFECTO = new java.sql.Date(new java.util.Date().getTime());
		if (TFEFECTO != null && TFEFECTO.trim().length() > 0) {
			FEFECTO = this.stringToSqlDate(TFEFECTO);
		} else {
			FEFECTO = null;
		}
		BigDecimal CORIGEN = getCampoNumerico(request, "CORIGEN");
		BigDecimal CDESTINO = getCampoNumerico(request, "CDESTINO");
		java.sql.Date FECHAEFEC = AxisBaseService.stringToSqlDate(this.getCampoTextual(request, "FEFECTO"));

		// System.out.println("CORIGEN = "+CORIGEN+" CDESTINO = "+CDESTINO+" FECHAEFEC =
		// "+this.getCampoTextual(request,"FEFECTO"));
		try {

			PAC_IAX_OPERATIVA_FINV pacIaxOperativaFinv = new PAC_IAX_OPERATIVA_FINV(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map map = pacIaxOperativaFinv.ejecutaPAC_IAX_OPERATIVA_FINV__F_SWITCH_FONDOS(CORIGEN, CDESTINO, null,
					FECHAEFEC);
			BigDecimal mm = (BigDecimal) this.tratarRETURNyMENSAJES(request, map);
			if (!isEmpty(mm) && (mm.intValue() == 0)) {
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisfinv016Service - m�todo procesar", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		} finally {
			this.cargarListas(request);
			formdata.put("FEFECTO", FEFECTO);
			formdata.put("CORIGEN", CORIGEN);
			formdata.put("CDESTINO", CDESTINO);
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	/**
	 * 
	 * @param request
	 */
	public void m_form(HttpServletRequest request) {
		logger.debug("Axisfinv016Service m_form");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		try {
			java.sql.Date FEFECTO = new java.sql.Date(new java.util.Date().getTime());
			String TFEFECTO = getCampoTextual(request, "FEFECTO");
			if (TFEFECTO != null && TFEFECTO.trim().length() > 0) {
				FEFECTO = this.stringToSqlDate(TFEFECTO);
			}
			formdata.put("FEFECTO", FEFECTO);
			this.cargarListas(request);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisfinv016Service - m�todo m_form", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	/*********************************************************************************************************************/
	/************************************************
	 * M�TODOS DE ACTUALIZACI�N
	 *******************************************/
	/*********************************************************************************************************************/
}
