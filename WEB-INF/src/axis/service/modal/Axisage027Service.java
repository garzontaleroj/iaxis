package axis.service.modal;

import java.math.BigDecimal;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_AGE_DATOS;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AxisBaseService;
import axis.service.axis.Axisctr007Service;
import axis.util.Constantes;

//import java.util.Date;

/**
 * Axisage027Service.java 05/05/2012
 * 
 * @author <a href="jdelrio@csi-ti.com">Javier del Rio</a>
 * @since Java 5.0
 */

public class Axisage027Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE INICIALIZACION
	 *******************************************/
	/*********************************************************************************************************************/

	public void m_init(HttpServletRequest request, AbstractDispatchAction thisAction) {
		logger.debug("Axisage027Service m_init");
		try {
			Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
			BigDecimal NORDREFERENCIA = getCampoNumerico(request, "NORDREFERENCIA");
			formdata.put("NORDREFERENCIA", NORDREFERENCIA);

			logger.debug("NORDREFERENCIA origen : " + NORDREFERENCIA);
		} catch (Exception e) {
			logger.error("Error en el servicio axisage027Service - m�todo m_init", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);

		}
		this.f_Cargar_Propiedades_Pantalla(request, whoami(Axisctr007Service.class));
	}

	/**
	 * 
	 * @param request
	 */
	@SuppressWarnings("all")
	public void m_form(HttpServletRequest request) {
		logger.debug("Axisage027Service m_form");

		try {
			UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
			Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
			PAC_IAX_AGE_DATOS pac_iax_age_datos = new PAC_IAX_AGE_DATOS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			BigDecimal CAGENTE = getCampoNumerico(request, "CAGENTE");
			BigDecimal NORDREFERENCIA = getCampoNumerico(request, "NORDREFERENCIA");
			String TREFERENCIA = getCampoTextual(request, "TREFERENCIA");
			formdata.put("CAGENTE", CAGENTE);
			formdata.put("NORDREFERENCIA", NORDREFERENCIA);

			formdata.put("TREFERENCIA", TREFERENCIA);

			if (!isEmpty(NORDREFERENCIA)) {
				Map m = pac_iax_age_datos.ejecutaPAC_IAX_AGE_DATOS__F_GET_REFERENCIA(CAGENTE, NORDREFERENCIA,
						TREFERENCIA);
				logger.debug("--->REFERENCIAS:" + m);
				tratarRETURNyMENSAJES(request, m);
				formdata.putAll((Map) m.get("POREFERENCIA"));
				logger.debug("--->REFERENCIA formdata hecho");
			}

			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));

		} catch (Exception e) {
			logger.error("Error en el servicio Axisage027Service - m�todo m_form", e);
			AbstractDispatchAction.guardarMensaje(request,
					"verbatim:<b>" + e.getClass().getName() + ":</b> " + e.getLocalizedMessage(),
					new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
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
		logger.debug("Axisage027Service m_aceptar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {

			PAC_IAX_AGE_DATOS pac_iax_redcomercial = new PAC_IAX_AGE_DATOS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			BigDecimal CAGENTE = getCampoNumerico(request, "CAGENTE");
			BigDecimal NORDREFERENCIA = getCampoNumerico(request, "NORDREFERENCIA");
			String TREFERENCIA = getCampoTextual(request, "TREFERENCIA");

			Map map = pac_iax_redcomercial.ejecutaPAC_IAX_AGE_DATOS__F_SET_REFERENCIA(CAGENTE, NORDREFERENCIA,
					TREFERENCIA);
			logger.debug(map);
			BigDecimal ok = (BigDecimal) tratarRETURNyMENSAJES(request, map);
			formdata.put("OK", ok);

			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));

		} catch (Exception e) {
			logger.error("Error en el servicio Axisage027Service - m�todo m_aceptar", e);
			AbstractDispatchAction.guardarMensaje(request,
					"verbatim:<b>" + e.getClass().getName() + ":</b> " + e.getLocalizedMessage(),
					new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

}
