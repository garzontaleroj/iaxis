package axis.service.modal;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_AGE_DATOS;
import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AxisBaseService;
import axis.service.axis.Axisctr007Service;
import axis.util.Constantes;

//import java.util.Date;

/**
 * Axisage025Service.java 05/05/2012
 * 
 * @author <a href="jdelrio@csi-ti.com">Javier del Rio</a>
 * @since Java 5.0
 */

public class Axisage025Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE INICIALIZACION
	 *******************************************/
	/*********************************************************************************************************************/

	public void m_init(HttpServletRequest request, AbstractDispatchAction thisAction) {
		logger.debug("Axisage025Service m_init");
		try {
			Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
			BigDecimal CTIPASOCIACION_ORIG = getCampoNumerico(request, "CTIPASOCIACION");
			formdata.put("CTIPASOCIACION_ORIG", CTIPASOCIACION_ORIG);

			logger.debug("cTIPASOCIACION origen : " + CTIPASOCIACION_ORIG);
		} catch (Exception e) {
			logger.error("Error en el servicio axisage025Service - m�todo m_init", e);
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
		logger.debug("Axisage025Service m_form");

		try {
			UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
			Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
			PAC_IAX_AGE_DATOS pac_iax_age_datos = new PAC_IAX_AGE_DATOS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			BigDecimal CAGENTE = getCampoNumerico(request, "CAGENTE");
			BigDecimal CTIPASOCIACION = getCampoNumerico(request, "CTIPASOCIACION");
			String NUMCOLEGIADO = getCampoTextual(request, "NUMCOLEGIADO");
			formdata.put("CAGENTE", CAGENTE);
			formdata.put("NUMCOLEGIADO", NUMCOLEGIADO);

			formdata.put("CTIPASOCIACION", CTIPASOCIACION);

			if (!isEmpty(CTIPASOCIACION)) {
				Map m = pac_iax_age_datos.ejecutaPAC_IAX_AGE_DATOS__F_GET_ASOCIACION(CAGENTE, CTIPASOCIACION,
						NUMCOLEGIADO);
				logger.debug("--->ASOCIACION:" + m);
				tratarRETURNyMENSAJES(request, m);
				formdata.putAll((Map) m.get("POASOCIACION"));
				logger.debug("--->ASOCIACION formdata hecho");
			}

			/* LISTVALORES */
			PAC_IAX_LISTVALORES pac_iax_listvalores = new PAC_IAX_LISTVALORES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map LISTVALORES = new HashMap();

			logger.debug("--->listvalores");

			/* LSTEMPRESAS */
			Map map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(800078));
			logger.debug(map);
			LISTVALORES.put("LSTTIPO", tratarRETURNyMENSAJES(request, map));

			formdata.put("LISTVALORES", LISTVALORES);

			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));

		} catch (Exception e) {
			logger.error("Error en el servicio Axisage025Service - m�todo m_form", e);
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
		logger.debug("Axisage025Service m_aceptar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {

			BigDecimal CTIPASOCIACION_ORIG = getCampoNumerico(request, "CTIPASOCIACION_ORIG");

			PAC_IAX_AGE_DATOS pac_iax_redcomercial = new PAC_IAX_AGE_DATOS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			BigDecimal CAGENTE = getCampoNumerico(request, "CAGENTE");
			BigDecimal CTIPASOCIACION = getCampoNumerico(request, "CTIPASOCIACION");
			String NUMCOLEGIADO = getCampoTextual(request, "NUMCOLEGIADO");

			Map map = pac_iax_redcomercial.ejecutaPAC_IAX_AGE_DATOS__F_SET_ASOCIACION(CAGENTE, CTIPASOCIACION,
					NUMCOLEGIADO, CTIPASOCIACION_ORIG);
			logger.debug(map);
			BigDecimal ok = (BigDecimal) tratarRETURNyMENSAJES(request, map);
			formdata.put("OK", ok);

			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));

		} catch (Exception e) {
			logger.error("Error en el servicio Axisage025Service - m�todo m_aceptar", e);
			AbstractDispatchAction.guardarMensaje(request,
					"verbatim:<b>" + e.getClass().getName() + ":</b> " + e.getLocalizedMessage(),
					new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

}
