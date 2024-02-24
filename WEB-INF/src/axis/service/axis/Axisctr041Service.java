//Revision:# 6Lg1fjFFTc1A4ehrVi6c5A== #
package axis.service.axis;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.cache.AxisCodeWizard;
import axis.jdbc.PAC_IAXPAR_PRODUCTOS;
import axis.jdbc.PAC_IAX_DESCVALORES;
import axis.jdbc.PAC_IAX_PARAM;
import axis.jdbc.PAC_IAX_PRODUCCION;
import axis.jdbc.PAC_IAX_VALIDACIONES;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.model.UsuarioBean;
import axis.util.Constantes;
import axis.util.ConversionUtil;

/**
 * Axispro041Service.java 24/07/2008
 * 
 * @author <a href="rkirchner@csi-ti.com">Roger Kirchner</a>
 * @since Java 5.0
 */
public class Axisctr041Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE INICIALIZACION
	 *******************************************/
	/*********************************************************************************************************************/

	/**
	 * Carga de los riesgos a mostrar en la pantalla.
	 * 
	 * @param request
	 */
	@SuppressWarnings("all")
	public void m_form(HttpServletRequest request) {
		logger.debug("Axisctr041Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {
			PAC_IAX_PRODUCCION pac_iax_produccion = new PAC_IAX_PRODUCCION(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			PAC_IAXPAR_PRODUCTOS pac_iaxpar_productos = new PAC_IAXPAR_PRODUCTOS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			PAC_IAX_PARAM pac_iax_param = new PAC_IAX_PARAM(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			PAC_IAX_DESCVALORES SIGLAS = new PAC_IAX_DESCVALORES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			/* Comprobar si se permiten multiriesgos */
			Map map = pac_iaxpar_productos.ejecutaPAC_IAXPAR_PRODUCTOS__F_PERMITIRMULTIRIESGOS();
			logger.debug(map);
			formdata.put("PERMITIRMULTIRIESGOS", tratarRETURNyMENSAJES(request, map));

			/* Leer todos los riesgos */
			map = pac_iax_produccion.ejecutaPAC_IAX_PRODUCCION__F_LEERIESGOS();
			List<Map> T_IAX_RIESGOS = (List<Map>) tratarRETURNyMENSAJES(request, map);

			List<Map> LIST_RIESGOS = new ArrayList<Map>();

			/*
			 * Extraer s�lo los riesgos que contienen un RIESDIRECCION no vac�o Y a�adirlos
			 * en la lista LIST_RIESGOS
			 */
			if (!isEmpty(T_IAX_RIESGOS)) {
				for (Map OB_IAX_RIESGOS : T_IAX_RIESGOS) {
					OB_IAX_RIESGOS = (Map) OB_IAX_RIESGOS.get("OB_IAX_RIESGOS");
					if (!isEmpty(OB_IAX_RIESGOS)) {
						// Recuperamos su NRIESGO y su Map RIESDIRECCION
						BigDecimal NRIESGO = (BigDecimal) OB_IAX_RIESGOS.get("NRIESGO");
						Map RIESDIRECCION = (Map) OB_IAX_RIESGOS.get("RIESDIRECCION");

						if (!isEmpty(RIESDIRECCION)) {
							RIESDIRECCION.put("NRIESGO", NRIESGO);
							Map tsiglas = SIGLAS.ejecutaPAC_IAX_DESCVALORES__F_GET_TIPOVIA(
									(BigDecimal) RIESDIRECCION.get("CVIAVP"));
							RIESDIRECCION.put("TIPO_VIA", tsiglas.get("RETURN"));
							LIST_RIESGOS.add(RIESDIRECCION);
						}
					}
				}
			}

			logger.debug(ConversionUtil.printAsXML(T_IAX_RIESGOS, "T_IAX_RIESGOS"));
			formdata.put("LIST_RIESGOS", LIST_RIESGOS);

			/* Bug 20893/111636 - 02/05/2012 - AMC */
			Map m = pac_iax_param.ejecutaPAC_IAX_PARAM__F_PAREMPRESA_N("GEODIRECCION", usuario.getCempres());
			logger.debug("---> geo:" + m);
			formdata.put("GEODIRECCION", tratarRETURNyMENSAJES(request, m));

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr041Service - m�todo m_form", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}

		this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
	}

	/*********************************************************************************************************************/
	/************************************************
	 * M�TODOS DE ACTUALIZACI�N
	 *******************************************/
	/*********************************************************************************************************************/

	/**
	 * Elimina el riesgo especificado en NRIESGO.
	 * 
	 * @param request
	 */
	public void m_eliminarRiesgo(HttpServletRequest request) {
		logger.debug("Axisctr041Service m_eliminarRiesgo");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		try {
			BigDecimal NRIESGO = getCampoNumerico(request, "NRIESGO");

			Map map = new PAC_IAX_PRODUCCION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_PRODUCCION__F_ELIMINARIESGO(NRIESGO);
			logger.debug(map);
			tratarRETURNyMENSAJES(request, map);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr041Service - m�todo m_eliminarRiesgo", e);
			AbstractDispatchAction.guardarMensaje(request, "1000050", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
	}

	/**
	 * Guarda la pantalla, realiza su validaci�n y determina la siguiente pantalla a
	 * ejecutar.
	 * 
	 * @param request
	 */
	public void m_siguiente(HttpServletRequest request) {
		logger.debug("Axisctr041Service m_siguiente");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		try {
			Map map = new PAC_IAX_VALIDACIONES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_VALIDACIONES__F_VALIDARIESGOS();
			logger.debug(map);

			if (BigDecimal.ZERO.equals(tratarRETURNyMENSAJES(request, map)))
				request.setAttribute(Constantes.FORWARDACTION,
						AxisCodeWizard.findForward(request, Constantes.SIGUIENTE, whoami(this), null));

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr041Service - m�todo m_siguiente", e);
			AbstractDispatchAction.guardarMensaje(request, "1000050", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
	}

	/**
	 * Guarda la pantalla y determina la pantalla anterior a ejecutar.
	 * 
	 * @param request
	 */
	public void m_anterior(HttpServletRequest request) {
		logger.debug("Axisctr041Service m_anterior");
		try {
			request.setAttribute(Constantes.FORWARDACTION,
					AxisCodeWizard.findForward(request, Constantes.ANTERIOR, whoami(this), null));
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr041Service - m�todo m_anterior", e);
			AbstractDispatchAction.guardarMensaje(request, "1000050", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
	}
}
