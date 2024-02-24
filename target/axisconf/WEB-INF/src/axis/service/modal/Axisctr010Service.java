package axis.service.modal;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.jdbc.PAC_IAX_PRODUCCION;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.control.modal.Axisctr010Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

public class Axisctr010Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE INICIALIZACION
	 *******************************************/
	/*********************************************************************************************************************/

	public void m_init(HttpServletRequest request, Axisctr010Action thisAction) {
		logger.debug("Axisctr010Service m_init");
		try {
			this.m_form(request, thisAction);
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr010Service - m�todo m_init", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

	/**
	 * Carga una lista de definici�n de comisiones y la pone en el atributo de
	 * sesi�n axisctr_definicionComisiones.
	 * 
	 * @param request    El HttpServletRequest que contiene la petici�n del cliente
	 *                   web.
	 * @param thisAction Una Action abstracta desde donde se ha invocado el servicio
	 *                   (necesaria para el log).
	 */
	public void m_form(HttpServletRequest request, Axisctr010Action thisAction) {
		logger.debug("Axisctr010Service m_form");
		try {
			initDefinicionComisiones(request);
			UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
			Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
			BigDecimal SSEGURO = getCampoNumerico(request, "pSSEGURO");
			if (isEmpty(SSEGURO)) {
				SSEGURO = (BigDecimal) AbstractDispatchAction.topPila(request, "SSEGURO");
			}
			formdata.put("SSEGURO", SSEGURO);

			Map mapComisi;
			PAC_IAX_LISTVALORES pac_iax_listvalores = new PAC_IAX_LISTVALORES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			if (SSEGURO != null) {
				// Combo
				mapComisi = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTCOMISION();

			} else {
				Map detComisi = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(67));
				List lstDetComisi = (List) tratarRETURNyMENSAJES(request, detComisi);
				Iterator it = lstDetComisi.iterator();
				List gestionComisiones = new ArrayList();
				while (it.hasNext()) {
					Map OB_IAX_GSTCOMISION = new HashMap();
					Map tmpComi = (Map) it.next();
					OB_IAX_GSTCOMISION.put("CMODCOM", tmpComi.get("CATRIBU"));
					OB_IAX_GSTCOMISION.put("TATRIBU", tmpComi.get("TATRIBU"));

					Map tmpMap = new HashMap();
					tmpMap.put("OB_IAX_GSTCOMISION", OB_IAX_GSTCOMISION);
					tmpMap.put("isNew", 1);
					gestionComisiones.add(tmpMap);
				}
				formdata.put("gestionComisiones", gestionComisiones);
				mapComisi = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(55));

			}
			logger.debug(mapComisi);
			List lscomisi = (List) tratarRETURNyMENSAJES(request, mapComisi);
			formdata.put("axisctr010_lscomisi", lscomisi);

			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this.getClass()));
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr010Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

	// Recupera de BD los campos de Definici�n Comisiones
	private void initDefinicionComisiones(HttpServletRequest request) throws Exception {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		BigDecimal miCTIPCOM = new BigDecimal(request.getParameter("CTIPCOM")); // BUG 25214 - FAL - 09/01/2012
		formdata.put("CTIPCOM", miCTIPCOM);
		// Map map = new
		// PAC_IAX_PRODUCCION((java.sql.Connection)request.getAttribute(Constantes.DB01CONN)).ejecutaPAC_IAX_PRODUCCION__F_LEEGESTIONCOMISION();
		Map map = new PAC_IAX_PRODUCCION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_PRODUCCION__F_LEEGESTIONCOMISION(miCTIPCOM);
		logger.debug(map);
		List gestionComisiones = (List) tratarRETURNyMENSAJES(request, map);
		formdata.put("gestionComisiones", !isEmpty(gestionComisiones) ? gestionComisiones : new ArrayList());

	}

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE ACTUALIZACION
	 ********************************************/
	/*********************************************************************************************************************/

	/**
	 * Graba en BD la nueva lista de comisiones.
	 * 
	 * @param request    El HttpServletRequest que contiene la petici�n del cliente
	 *                   web.
	 * @param thisAction Una Action abstracta desde donde se ha invocado el servicio
	 *                   (necesaria para el log).
	 */
	public void m_guardarCambios(HttpServletRequest request, Axisctr010Action thisAction) {
		logger.debug("Axisctr010Service m_guardarCambios");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		BigDecimal SSEGURO = getCampoNumerico(request, "pSSEGURO");
		if (isEmpty(SSEGURO)) {
			SSEGURO = (BigDecimal) AbstractDispatchAction.topPila(request, "SSEGURO");
		}
		formdata.put("SSEGURO", SSEGURO);
		try {
			BigDecimal guardat = new BigDecimal(0);
			UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
			logger.debug("######GUARDAR CAMBIOS0######");
			PAC_IAX_PRODUCCION pac_axis_produccion = new PAC_IAX_PRODUCCION(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			logger.debug("######GUARDAR CAMBIOS1######");
			Iterator it = formdata.keySet().iterator();
			logger.debug("######GUARDAR CAMBIOS2######");
			while (it.hasNext()) {
				String key = (String) it.next();
				logger.debug("#####ENTRA WHILE########" + key);
				logger.debug("######GUARDAR CAMBIOS----######" + key.indexOf("PCOMISI") + "----" + key.indexOf("MODIF")
						+ "----" + key.indexOf("VISIBLE"));
				if ((key.indexOf("PCOMISI") != -1) && (key.indexOf("__joined") == -1) && (key.indexOf("MODIF") == -1)
						&& (key.indexOf("VISIBLE") == -1)) {
					BigDecimal vpcomisi = getCampoNumerico(request, key);
					logger.debug("######GUARDAR CAMBIOS3######");
					BigDecimal vindex, pPNINIALT, pPNFINALT;
					logger.debug("######GUARDAR CAMBIOS4######");
					key = key.substring(7);
					logger.debug("#####ENTRA IF########" + key);
					vindex = new BigDecimal(key.substring(0, key.indexOf("_")));
					key = key.substring(key.indexOf("_") + 1);
					pPNINIALT = new BigDecimal(key.substring(0, key.indexOf("_")));
					key = key.substring(key.indexOf("_") + 1);
					pPNFINALT = new BigDecimal(key);
					Map comisi = pac_axis_produccion.ejecutaPAC_IAX_PRODUCCION__F_GRABAGESTIONCOMISION(vindex, vpcomisi,
							pPNINIALT, pPNFINALT);
					if ((comisi.get("RETURN") != null && comisi.get("RETURN") instanceof BigDecimal)
							&& (((BigDecimal) comisi.get("RETURN")).intValue() != 0)) {
						guardat = new BigDecimal(1);
					}
					logger.debug("ejecutaPAC_IAX_PRODUCCION__F_GRABAGESTIONCOMISION: " + comisi);
				}

			}
			formdata.put("guardat", guardat);
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this.getClass()));
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr010Service - m�todo m_guardarCambios", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

	public BigDecimal m_guardar(HttpServletRequest request, Axisctr010Action thisAction) {
		logger.debug("Axisctr010Service m_guardar");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		BigDecimal SSEGURO = getCampoNumerico(request, "pSSEGURO");
		if (isEmpty(SSEGURO)) {
			SSEGURO = (BigDecimal) AbstractDispatchAction.topPila(request, "SSEGURO");
		}
		formdata.put("SSEGURO", SSEGURO);
		try {
			BigDecimal guardat = new BigDecimal(0);
			UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
			PAC_IAX_LISTVALORES pac_iax_listvalores = new PAC_IAX_LISTVALORES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map mapComisi = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTCOMISIONES();
			logger.debug(mapComisi);
			List comisiones = (List) tratarRETURNyMENSAJES(request, mapComisi);

			PAC_IAX_PRODUCCION pac_axis_produccion = new PAC_IAX_PRODUCCION(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			BigDecimal pCTIPCOM = this.getCampoNumerico(request, "CTIPCOM");
			formdata.put("CTIPCOM", pCTIPCOM);

			Iterator it = formdata.keySet().iterator();
			while (it.hasNext()) {
				String key = (String) it.next();
				if ((key.indexOf("PCOMISI") != -1) && (key.indexOf("__joined") == -1) && (key.indexOf("MODIF") == -1)
						&& (key.indexOf("VISIBLE") == -1)) {
					BigDecimal vpcomisi = getCampoNumerico(request, key);
					BigDecimal vindex;
					key = key.substring(7);
					vindex = new BigDecimal(key.substring(0, key.indexOf("_")));
					Map comisi = pac_axis_produccion.ejecutaPAC_IAX_PRODUCCION__F_GRABAGESTIONCOMISION(vindex, vpcomisi,
							null, null);
					if ((comisi.get("RETURN") != null && comisi.get("RETURN") instanceof BigDecimal)
							&& (((BigDecimal) comisi.get("RETURN")).intValue() != 0)) {
						guardat = new BigDecimal(1);
					}
					logger.debug("ejecutaPAC_IAX_PRODUCCION__F_GRABAGESTIONCOMISION: " + comisi);
				}

			}

			// Bug 32595/182234 - 28/08/2014 - AMC
			/*
			 * if (guardat.intValue()==0){ //Cridrem a pac_md_grabarDatos Map mpgrabar =
			 * pac_axis_produccion.ejecutaPAC_IAX_PRODUCCION__F_GRABARCOMISIONES(pCTIPCOM);
			 * tratarRETURNyMENSAJES(request, mpgrabar);
			 * logger.debug("ejecutaPAC_IAX_PRODUCCION__F_GRABARCOMISIONES: "+mpgrabar); if
			 * ((mpgrabar.get("RETURN")!=null &&mpgrabar.get("RETURN") instanceof
			 * BigDecimal)&&(((BigDecimal)mpgrabar.get("RETURN")).intValue() != 0)){ guardat
			 * = new BigDecimal(1); } }
			 */

			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this.getClass()));
			formdata.put("guardat", guardat);
			return guardat;

			// return new BigDecimal(1);
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr010Service - m�todo m_guardar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
			return new BigDecimal(1);
		}
	}

}
