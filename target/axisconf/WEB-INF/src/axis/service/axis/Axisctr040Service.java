package axis.service.axis;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.cache.AxisCodeWizard;
import axis.jdbc.PAC_IAXPAR_PRODUCTOS;
import axis.jdbc.PAC_IAX_PRODUCCION;
import axis.jdbc.PAC_IAX_SUPLEMENTOS;
import axis.jdbc.PAC_IAX_VALIDACIONES;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.model.UsuarioBean;
import axis.mvc.view.VisibleTag;
import axis.util.Constantes;

/**
 * Axispro040Service.java 25/08/2008
 * 
 * @author <a href="rkirchner@csi-ti.com">Roger Kirchner</a>
 * @since Java 5.0
 */
public class Axisctr040Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	/**
	 * Lee el numero de la p�liza.
	 * 
	 * @param request El HttpServletRequest que contiene la petici�n del cliente
	 *                web.
	 * @return
	 * @throws Exception
	 */
	private Map dbLeePoliza(HttpServletRequest request) throws Exception {
		Map map = new PAC_IAX_PRODUCCION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_PRODUCCION__F_GET_DATPOLIZA(null);
		logger.debug("OBJETO POLIZA  BBDD ->" + map);
		Map mapPoliza = (HashMap) map.get("RETURN");
		// Map mapPoliza
		return mapPoliza;
	}

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
		logger.debug("Axisctr040Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {
			Map mapGenPoliza = new HashMap();
			BigDecimal pPCMOTMOV = (BigDecimal) AbstractDispatchAction.topPila(request, "CMOTMOV");

			f_Cargar_Propiedades_Pantalla(request, whoami(this));

			PAC_IAX_PRODUCCION pac_iax_produccion = new PAC_IAX_PRODUCCION(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			PAC_IAXPAR_PRODUCTOS pac_iaxpar_productos = new PAC_IAXPAR_PRODUCTOS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			/* Comprobar si se permiten multiriesgos */
			Map map = pac_iaxpar_productos.ejecutaPAC_IAXPAR_PRODUCTOS__F_PERMITIRMULTIRIESGOS();
			logger.debug(map);
			formdata.put("PERMITIRMULTIRIESGOS", tratarRETURNyMENSAJES(request, map));

			/* Leer todos los riesgos */
			map = pac_iax_produccion.ejecutaPAC_IAX_PRODUCCION__F_LEERIESGOS();
			logger.debug("leer-->" + map);
			List<Map> T_IAX_RIESGOS = (List<Map>) tratarRETURNyMENSAJES(request, map);

			List<Map> LIST_RIESGOS = new ArrayList<Map>();
			mapGenPoliza = this.dbLeePoliza(request);
			formdata.put("NPOLIZA", mapGenPoliza.get("NPOLIZA"));
			formdata.put("PRODUCTO", mapGenPoliza.get("SPRODUC"));// bartolo

			if (pPCMOTMOV != null) {
				Map map2 = new PAC_IAX_SUPLEMENTOS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_SUPLEMENTOS__F_GET_DESCMOTMOV(pPCMOTMOV, usuario.getCidioma());
				formdata.put("PTMOTMOV", map2.get("PTMOTMOV"));
			}
			/*
			 * Extraer s�lo los riesgos que contienen un RIESDESCRIPCION no vac�o Y
			 * a�adirlos en la lista LIST_RIESGOS
			 */
			if (!isEmpty(T_IAX_RIESGOS)) {
				for (Map OB_IAX_RIESGOS : T_IAX_RIESGOS) {
					OB_IAX_RIESGOS = (Map) OB_IAX_RIESGOS.get("OB_IAX_RIESGOS");
					if (!isEmpty(OB_IAX_RIESGOS)) {
						// BUG 29358 - RCL - 02/01/2014, solo recuperamos el RIESGO si no hay FANULAC
						if (isEmpty(OB_IAX_RIESGOS.get("FANULAC"))) {
							// Recuperamos su NRIESGO y su Map RIESDESCRIPCION
							BigDecimal NRIESGO = (BigDecimal) OB_IAX_RIESGOS.get("NRIESGO");
							Map RIESDESCRIPCION = (Map) OB_IAX_RIESGOS.get("RIESDESCRIPCION");

							if (!isEmpty(RIESDESCRIPCION)) {
								RIESDESCRIPCION.put("NRIESGO", NRIESGO);
								// RIESDESCRIPCION.put("TRIESGO",OB_IAX_RIESGOS.get("TRIESGO"));

								String texto = OB_IAX_RIESGOS.get("TRIESGO").toString();
								String reemplazo = "<br />";
								texto = texto.replaceAll("\n", reemplazo);
								RIESDESCRIPCION.put("TRIESGO", texto);

								if (VisibleTag.esComponenteVisibleDefectoNoVer(request, "axisctr040",
										"MOD_PLAN_SUPLEM")) {
									Map mapval = new PAC_IAX_VALIDACIONES(
											(java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
											.ejecutaPAC_IAX_VALIDACIONES__F_VALIDAMODI_PLAN(NRIESGO);
									BigDecimal valplan = (BigDecimal) tratarRETURNyMENSAJES(request, mapval);
									RIESDESCRIPCION.put("permiteModificarPlan", valplan);
								}

								LIST_RIESGOS.add(RIESDESCRIPCION);
							}
						}
					}
				}
			}

			// logger.debug(ConversionUtil.printAsXML(T_IAX_RIESGOS, "T_IAX_RIESGOS"));
			formdata.put("LIST_RIESGOS", LIST_RIESGOS);
			// -- Bug 0016544 - 24/12/2010 - JMF
			f_Cargar_Propiedades_Pantalla(request, whoami(this));

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr040Service - m�todo m_form", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
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
		logger.debug("Axisctr040Service m_eliminarRiesgo");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		try {
			BigDecimal NRIESGO = getCampoNumerico(request, "NRIESGO");

			Map map = new PAC_IAX_PRODUCCION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_PRODUCCION__F_ELIMINARIESGO(NRIESGO);
			logger.debug(map);
			tratarRETURNyMENSAJES(request, map);
			f_Cargar_Propiedades_Pantalla(request, whoami(this));
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr040Service - m�todo m_eliminarRiesgo", e);
			AbstractDispatchAction.guardarMensaje(request, "1000050", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
	}

	/**
	 * Guarda la pantalla, realiza su validaci�n y determina la siguiente pantalla a
	 * ejecutar.
	 * 
	 * @param request
	 */
	public void m_siguiente(HttpServletRequest request) {
		logger.debug("Axisctr040Service m_siguiente");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		try {
			Map map = new PAC_IAX_VALIDACIONES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_VALIDACIONES__F_VALIDARIESGOS();
			logger.debug(map);

			if (BigDecimal.ZERO.equals(tratarRETURNyMENSAJES(request, map)))
				request.setAttribute(Constantes.FORWARDACTION,
						AxisCodeWizard.findForward(request, Constantes.SIGUIENTE, whoami(this), null));
			f_Cargar_Propiedades_Pantalla(request, whoami(this));
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr040Service - m�todo m_siguiente", e);
			AbstractDispatchAction.guardarMensaje(request, "1000050", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
	}

	/**
	 * Guarda la pantalla y determina la pantalla anterior a ejecutar.
	 * 
	 * @param request
	 */
	public void m_anterior(HttpServletRequest request) {
		logger.debug("Axisctr040Service m_anterior");
		try {
			request.setAttribute(Constantes.FORWARDACTION,
					AxisCodeWizard.findForward(request, Constantes.ANTERIOR, whoami(this), null));
			f_Cargar_Propiedades_Pantalla(request, whoami(this));
			logger.debug("Axisctr112Service m_anterior");

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr040Service - m�todo m_anterior", e);
			AbstractDispatchAction.guardarMensaje(request, "1000050", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
	}
}
