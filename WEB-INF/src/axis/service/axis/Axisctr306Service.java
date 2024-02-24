package axis.service.axis;

import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.cache.AxisCodeWizard;
import axis.jdbc.PAC_IAX_PRODUCCION;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.model.UsuarioBean;
import axis.util.Constantes;

/**
 * Axisctr306Service.java 08/07/2015
 * 
 * @author <a href="igil@csi-ti.com">Ivan Gil</a>
 * @since Java 5.0 Servicio de la pantalla principal CITAS MEDICAS
 */
public class Axisctr306Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	public void m_init(HttpServletRequest request, AbstractDispatchAction thisAction) {
		logger.debug("Axisctr306Service m_init");
		try {

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr306Service - m�todo m_init", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	/**
	 * Operaciones relacionadas con los beneficierios especiales Segun el parametro
	 * "opCITAMEDIC" se actua.
	 * 
	 * @param conn
	 * @param request
	 * @param thisAction
	 * @throws Exception
	 */
	public void m_borrar(HttpServletRequest request, AbstractDispatchAction thisAction) {
		try {
			BigDecimal NORDEN = this.getCampoNumerico(request, "NORDEN");
			System.out.println("NORDEN PRUEBA = " + NORDEN);
			PAC_IAX_PRODUCCION pacIaxProduccion = new PAC_IAX_PRODUCCION(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map map = pacIaxProduccion.ejecutaPAC_IAX_PRODUCCION__F_ELIMINAR_CITASMEDICAS(NORDEN);
			logger.debug(map);
			tratarRETURNyMENSAJES(request, map);
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr306Service - m�todo m_borrar", e);
			AbstractDispatchAction.guardarMensaje(request, "1000050", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
	}

	public void m_form(HttpServletRequest request, AbstractDispatchAction thisAction) {
		logger.debug("Axisctr306Service m_form");
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);

		try {
			m_buscar(request, thisAction);

		} catch (Exception e) {
			logger.error("Error en el servicio Axiscomi019Service - m�todo m_form", e);
			AbstractDispatchAction.guardarMensaje(request, "1000050", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
		this.configForm(request, this.whoami(this));
	}

	/**
	 * Guarda la pantalla, realiza su validaci�n y determina la siguiente pantalla a
	 * ejecutar.
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_siguiente(HttpServletRequest request, AbstractDispatchAction thisAction) {
		logger.debug("Axisctr306Service m_siguiente");
		if (m_validar(request, thisAction)) {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
			try {
				request.setAttribute(Constantes.FORWARDACTION,
						AxisCodeWizard.findForward(request, Constantes.SIGUIENTE, whoami(this), null));
			} catch (Exception e) {
				logger.error("Error en el servicio Axisctr306Service m_siguiente", e);
				thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
			}
		}
	}

	/**
	 * Guarda la pantalla, realiza su validaci�n y determina la pantalla anterior a
	 * ejecutar.
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_anterior(HttpServletRequest request, AbstractDispatchAction thisAction) {
		logger.debug("Axisctr306Service m_anterior");
		this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		try {
			request.setAttribute(Constantes.FORWARDACTION,
					AxisCodeWizard.findForward(request, Constantes.ANTERIOR, whoami(this), null));
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr306Service m_anterior", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

	/**
	 * Realiza la validaci�n de la pantalla y guarda en FORWARDACTION la siguiente
	 * p�gina donde vamos a navegar.
	 * 
	 * @param request
	 * @param thisAction
	 * @param direccion
	 */

	public void m_ajax_buscar_avisos(HttpServletRequest request) {
		logger.debug("Axisctr306Service m_buscar_avisos");
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		AjaxContainerService ajax = new AjaxContainerService(request);

		try {

			HashMap m = this.f_Get_Avisos(request, this.whoami(this), new String("MODIF_BENE"));
			BigDecimal pRETURN = (BigDecimal) this.tratarRETURNyMENSAJES(request, m);
			// request.setAttribute("PLSTAVISOS",m.get("PLSTAVISOS"));
			ajax.guardarContenidoFinalAContenedorAjax(m.get("PLSTAVISOS"));

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr101Service - m�todo m_buscar_avisos", e);

		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	public boolean m_avisos(HttpServletRequest request, AbstractDispatchAction thisAction) {
		boolean existAvisos = false;
		HashMap m = this.f_Get_Avisos(request, this.whoami(this));
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		BigDecimal pRETURN = (BigDecimal) this.tratarRETURNyMENSAJES(request, m);
		request.setAttribute("PLSTAVISOS", m.get("PLSTAVISOS"));
		if (m.get("PLSTAVISOS") != null) {
			List MENSAJES = (List) m.get("PLSTAVISOS");
			if (MENSAJES.size() > 0) {
				existAvisos = true;
			}
		}
		AjaxContainerService ajax = new AjaxContainerService(request);
		ajax.guardarContenidoFinalAContenedorAjax(m.get("PLSTAVISOS"));
		System.out.println("retorno=" + pRETURN);
		HashMap mensajes = (HashMap) request.getAttribute(Constantes.MENSAJES);
		formdata.put("AVISO_VIEW", 1);

		return existAvisos;
	}

	public void m_buscar(HttpServletRequest request, AbstractDispatchAction thisAction) {
		logger.debug("Axiscomi306Service m_buscar");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {

			Map map = new PAC_IAX_PRODUCCION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_PRODUCCION__F_GET_CITASMEDICAS();
			logger.debug(map);
			List lista = (ArrayList) tratarRETURNyMENSAJES(request, map);

			formdata.put("T_IAX_CITAMEDICA", lista);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr307Service  -  m_buscar", e);
			AbstractDispatchAction.guardarMensaje(request, "1000050", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}

	}

	public boolean m_validar(HttpServletRequest request, AbstractDispatchAction thisAction) {
		logger.debug("Axiscomi306Service m_buscar");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {

			Map map = new PAC_IAX_PRODUCCION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_PRODUCCION__F_GET_CITASMEDICAS();
			logger.debug(map);
			List lista = (ArrayList) tratarRETURNyMENSAJES(request, map);

			if (lista != null) {
				for (Object mapCita : lista) {
					Map mapCita1 = (Map) mapCita;
					Map mapCita2 = (Map) mapCita1.get("OB_IAX_CITAMEDICA");

					BigDecimal medico = (BigDecimal) mapCita2.get("SPERSON_MED");
					BigDecimal ctipo = (BigDecimal) mapCita2.get("CTIPEVI");
					String codevid = (String) mapCita2.get("CODEVID");
					Date feviden = null;
					if (mapCita2.get("FEVIDEN") instanceof Date) {
						feviden = (Date) mapCita2.get("FEVIDEN");

					} else if (mapCita2.get("FEVIDEN") instanceof String) {
						String date = (String) mapCita2.get("FEVIDEN");
						try {
							SimpleDateFormat dt = new SimpleDateFormat("dd/MM/yyyy HH:mm");
							feviden = dt.parse(date);
						} catch (Exception e) {

						}
					}
					/*
					 * if ((medico == null || feviden == null) && BigDecimal.ZERO.equals(ctipo) &&
					 * codevid.indexOf("APR") < 0){ AbstractDispatchAction.guardarMensaje(request,
					 * "9908425", new Object[] { "Errror "}, Constantes.MENSAJE_ERROR); return
					 * false; }
					 */

				}

			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr307Service  -  m_buscar", e);
			AbstractDispatchAction.guardarMensaje(request, "1000050", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
			return false;
		}

		return true;
	}

}
