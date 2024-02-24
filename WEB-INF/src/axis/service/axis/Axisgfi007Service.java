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
 * Axisgfi007Service.java 20/08/2008
 * 
 * @author <a href="lcalvo@csi-ti.com">Luz Calvo</a>
 * @since Java 5.0
 */
public class

Axisgfi007Service extends AxisBaseService {
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
		logger.debug("Axisgfi007Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {

		} catch (Exception e) {
			logger.error("Error en el servicio Axisgfi007Service - m�todo m_form", e);
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
		logger.debug("Axisgfi007Service m_consultar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {

			String pPTERMINO = getCampoTextual(request, "TERMINO");
			BigDecimal pPNITERAC = getCampoNumerico(request, "ITERACION");
			String OPERACION = (isEmpty(getCampoTextual(request, "OPERAC"))) ? getCampoTextual(request, "OPERACION")
					: getCampoTextual(request, "OPERAC");

			System.out.println("pPTERMINO: " + pPTERMINO);
			System.out.println("pPNITERAC: " + pPNITERAC);
			Map map = new PAC_IAX_GFI((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_GFI__F_CONSULTBUCLE(pPTERMINO, pPNITERAC, OPERACION);
			ArrayList lista_bucles = (ArrayList) tratarRETURNyMENSAJES(request, map, false);
			request.setAttribute("lista_bucles", lista_bucles);
			formdata.put("TERMINO", pPTERMINO);
			formdata.put("ITERACION", pPNITERAC);
			formdata.put("OPERACION", OPERACION);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisgfi007Service - m�todo m_consultar", e);
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
		logger.debug("Axisgfi007Service m_guardar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {

			String TERMINO = getCampoTextual(request, "TERMINO");
			String ITERACION = getCampoTextual(request, "ITERACION");
			String OPERACION = getCampoTextual(request, "OPERAC");
			BigDecimal NEW = getCampoNumerico(request, "NEW");

			// LLamada a grabar
			Map map = new PAC_IAX_GFI((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_GFI__F_GRABARBUCLE(TERMINO, ITERACION, OPERACION, NEW);
			BigDecimal resultado = (BigDecimal) tratarRETURNyMENSAJES(request, map, false);

			System.out.println("Volver GUARDAR");
			m_recargar(request); //

		} catch (Exception e) {
			logger.error("Error en el servicio Axisgfi007Service - m�todo m_guardar", e);
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
		logger.debug("Axisgfi007Service m_consultar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {
			String pPTERMINO = getCampoTextual(request, "TERMINO");
			BigDecimal pPNITERAC = getCampoNumerico(request, "ITERACION");
			String pPOPERACION = getCampoTextual(request, "OPERACION");
			Map map = new PAC_IAX_GFI((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_GFI__F_CONSULTBUCLE(pPTERMINO, pPNITERAC, pPOPERACION);
			ArrayList lista_bucles = (ArrayList) tratarRETURNyMENSAJES(request, map, false);

			request.setAttribute("lista_bucles", lista_bucles);

			System.out.println("ddd");

		} catch (Exception e) {
			logger.error("Error en el servicio Axisgfi007Service - m�todo m_consultar", e);
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
	public void m_borrar_bucle(HttpServletRequest request) {
		logger.debug("Axisgfi007Service m_guardar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {

			String TERMINO = getCampoTextual(request, "TERME");
			logger.debug(TERMINO);
			// LLamada a consultar
			Map map = new PAC_IAX_GFI((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_GFI__F_ELIMINARBUCLE(TERMINO);
			BigDecimal resultado = (BigDecimal) tratarRETURNyMENSAJES(request, map, false);

			m_recargar(request); //

		} catch (Exception e) {
			logger.error("Error en el servicio Axisgfi007Service - m�todo m_guardar", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}
}
