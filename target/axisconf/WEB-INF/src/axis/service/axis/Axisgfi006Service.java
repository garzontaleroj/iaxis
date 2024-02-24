package axis.service.axis;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_GFI;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.model.UsuarioBean;
import axis.util.Constantes;

/**
 * Axisgfi006Service.java 20/08/2008
 * 
 * @author <a href="lcalvo@csi-ti.com">Luz Calvo</a>
 * @since Java 5.0
 */

public class Axisgfi006Service extends AxisBaseService {
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
	public

			void m_form(HttpServletRequest request) {
		logger.debug("Axisgfi006Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {

		} catch (Exception e) {
			logger.error("Error en el servicio Axisgfi006Service - m�todo m_form", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	/**
	 * 
	 * @param request funci�n que realiza la consulta de tramos pasando como
	 *                par�ametros TRAMO y CONCEPTO
	 */
	public void m_consultar(HttpServletRequest request) {
		logger.debug("Axisgfi006Service m_consultar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {

			BigDecimal TRAMO = getCampoNumerico(request, "NTRAMO");
			String CONCEPTO = getCampoTextual(request, "CONCEPTO");
			// LLamada a consultar
			formdata.put("TRAMO_INICIAL", TRAMO);
			formdata.put("CONCEPTO_INICIAL", CONCEPTO);

			Map map = new PAC_IAX_GFI((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_GFI__F_CONSULTRAM(TRAMO, CONCEPTO);
			ArrayList lista_tramos = (ArrayList) tratarRETURNyMENSAJES(request, map, false);

			request.setAttribute("lista", lista_tramos);

			System.out.println("ddd");

		} catch (Exception e) {
			logger.error("Error en el servicio Axisgfi006Service - m�todo m_consultar", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

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
			BigDecimal resultado = (BigDecimal) tratarRETURNyMENSAJES(request, map, false);

			System.out.println("ddd");
			m_recargar(request); //

		} catch (Exception e) {
			logger.error("Error en el servicio Axisgfi006Service - m�todo m_guardar", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	/**
	 * 
	 * @param request funci�n que realiza la consulta de tramos pasando como
	 *                par�ametros TRAMO y CONCEPTO
	 */
	private void m_recargar(HttpServletRequest request) {
		logger.debug("Axisgfi006Service m_consultar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {

			BigDecimal TRAMO = getCampoNumerico(request, "TRAMO_INICIAL");
			String CONCEPTO = getCampoTextual(request, "CONCEPTO_INICIAL");
			// LLamada a consultar
			Map map = new PAC_IAX_GFI((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_GFI__F_CONSULTRAM(TRAMO, CONCEPTO);
			ArrayList lista_tramos = (ArrayList) tratarRETURNyMENSAJES(request, map, false);
			formdata.put("TRAMO_INICIAL", TRAMO);
			formdata.put("CONCEPTO_INICIAL", CONCEPTO);
			request.setAttribute("lista", lista_tramos);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisgfi006Service - m�todo m_consultar", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	/**
	 * 
	 * @param request funci�n que realiza la consulta de tramos pasando como
	 *                par�ametros TRAMO y CONCEPTO
	 */
	public void m_borrar_tramo(HttpServletRequest request) {
		logger.debug("Axisgfi006Service m_guardar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {

			BigDecimal NTRAMO = getCampoNumerico(request, "NTRAMO");

			// LLamada a consultar
			Map map = new PAC_IAX_GFI((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_GFI__F_ELIMINARTRAMO(NTRAMO);
			BigDecimal resultado = (BigDecimal) tratarRETURNyMENSAJES(request, map, false);

			m_recargar(request); //

		} catch (Exception e) {
			logger.error("Error en el servicio Axisgfi006Service - m�todo m_guardar", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}
}
