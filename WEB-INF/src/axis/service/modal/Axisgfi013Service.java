package axis.service.modal;

import java.math.BigDecimal;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_GFI;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

/**
 * Axisgfi013Service.java 20/08/2008
 * 
 * @author <a href="lcalvo@csi-ti.com">Luz Calvo</a>
 * @since Java 5.0
 */
public class Axisgfi013Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());
	SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE INICIALIZACION
	 *******************************************/
	/*********************************************************************************************************************/

	/**
	 * 
	 * @param request
	 */
	public

			void m_form(HttpServletRequest request) {
		logger.debug("Axisgfi013Service m_form");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		try {

			BigDecimal NUEVO = getCampoNumerico(request, "NUEVO");
			formdata.put("NUEVO_TRAMO", NUEVO);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisgfi013Service - m�todo m_form", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	/*********************************************************************************************************************/
	/************************************************
	 * M�TODOS DE ACTUALIZACI�N
	 *******************************************/
	/*********************************************************************************************************************/

	/**
	 * 
	 * @param request funci�n que realiza la consulta de tramos pasando como
	 *                par�ametros TRAMO y CONCEPTO
	 */
	public void m_guardar(HttpServletRequest request) {
		logger.debug("Axisgfi006Service m_guardar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {

			BigDecimal TRAMO = getCampoNumerico(request, "NTRAMO");
			BigDecimal isNew = getCampoNumerico(request, "isNew");
			String CONCEPTO = getCampoTextual(request, "CONCEPTO");
			String CONCEPTO_FRANJA = getCampoTextual(request, "CONCEPTO_FRANJA");
			String CONCEPTO_VALOR = getCampoTextual(request, "CONCEPTO_VALOR");
			// LLamada a consultar
			Map map = new PAC_IAX_GFI((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_GFI__F_GRABARTRAMO(TRAMO, CONCEPTO, CONCEPTO_FRANJA, CONCEPTO_VALOR, isNew);
			logger.debug(map);
			BigDecimal resultado = (BigDecimal) tratarRETURNyMENSAJES(request, map, false);
			formdata.put("resultado", resultado);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisgfi006Service - m�todo m_guardar", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	/**
	 * Lee los datos de la simulacion
	 * 
	 * @param usuario
	 * @return
	 * @throws Exception
	 */
	private Date fcGetFechaActual() throws Exception {

		java.util.Date today = new java.util.Date();
		Date FECHA_ACTUAL = new Date(today.getTime());
		return FECHA_ACTUAL;

	}

}
