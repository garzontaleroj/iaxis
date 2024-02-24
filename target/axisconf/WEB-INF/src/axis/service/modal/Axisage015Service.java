package axis.service.modal;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_REDCOMERCIAL;
import axis.mvc.control.modal.Axisage015Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

/**
 * Axisage015Service.java 24/10/2011
 * 
 * @author <a href="joan_torres@csi-ti.com">Joan Torres</a>
 * @since Java 5.0
 */
public class Axisage015Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	// f_get_detallegarantia
	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE INICIALIZACION
	 *******************************************/
	/*********************************************************************************************************************/

	/**
	 * M�todo que se llama al inicio de este flujo. Puede servirnos para inicializar
	 * variables.
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_init(HttpServletRequest request, Axisage015Action thisAction) {
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		try {

		} catch (Exception e) {
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}

	}

	/**
	 * 
	 * @param request
	 */
	@SuppressWarnings("all")
	public void m_form(HttpServletRequest request, Axisage015Action thisAction) {
		logger.debug("Axisage015Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {
			String PCAGENTE = getCampoTextual(request, "PARCAGENTE");
			String NOMBRE = getCampoTextual(request, "NOMBRE");
			String NNUMIDE = getCampoTextual(request, "NNUMIDE");

			logger.debug("Params ----> " + PCAGENTE);

			formdata.put("CAGENTE", PCAGENTE);

			/*
			 * HashMap map = new
			 * PAC_IAX_LISTVALORES((java.sql.Connection)request.getAttribute(Constantes.
			 * DB01CONN)).ejecutaPAC_IAX_LISTVALORES__F_GET_LSTAGENTES(NOMBRE,
			 * NNUMIDE,PCAGENTE,new BigDecimal(1) ); logger.debug (map); List listaAgentes =
			 * (List) tratarRETURNyMENSAJES(request, map); String TAGENTE =
			 * (String)((HashMap)listaAgentes.get(0)).get("NOMBRE");
			 * formdata.put("TAGENTE",TAGENTE);
			 */

			HashMap map = new PAC_IAX_REDCOMERCIAL((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_REDCOMERCIAL__FF_DESAGENTE(new BigDecimal(PCAGENTE), new BigDecimal(1));
			logger.debug(map);
			if (tratarRETURNyMENSAJES(request, map) != null) {
				String TAGENTE = (String) tratarRETURNyMENSAJES(request, map);
				formdata.put("TAGENTE", TAGENTE);
			}

			String EDIT = getCampoTextual(request, "EDIT");

			if (EDIT.equals(new String("EDIT"))) {
				java.sql.Date PFINIVIG = this.stringToSqlDate(this.getHiddenCampoTextual(request, "PARFINIVIG"));

				map = new PAC_IAX_REDCOMERCIAL((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_REDCOMERCIAL__F_GET_DETSOPORTEARP(new BigDecimal(PCAGENTE), PFINIVIG);
				logger.debug(map);
				Map detsub = (Map) tratarRETURNyMENSAJES(request, map);

				/*
				 * formdata.put("FINIVIG",(String)PFINIVIG);
				 * formdata.put("FFINVIG",(String)detsub.get("FFINVIG"));
				 * formdata.put("IIMPORTE",(BigDecimal)detsub.get("IIMPORTE"));
				 */
				Map m = (Map) detsub.get("OB_IAX_SOPORTEARP_AGENTE");
				formdata.put("FINIVIG", m.get("FINIVIG"));
				formdata.put("FINIVIG", m.get("FFINVIG"));
				formdata.put("FINIVIG", m.get("IIMPORTE"));
				formdata.put("SOPORTEARP", detsub);
				formdata.put("EDICION", "TRUE");

			} else {
				formdata.put("EDICION", "FALSE");

			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisage015Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {

			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));

		}
	}

	public void m_aceptar(HttpServletRequest request, Axisage015Action thisAction) {
		logger.debug("Axisage015Service m_aceptar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		String tipo = this.getCampoTextual(request, "tipo");
		try {
			BigDecimal PCAGENTE = getHiddenCampoNumerico(request, "CAGENTE");
			java.sql.Date PFINIVIG = this.stringToSqlDate(this.getHiddenCampoTextual(request, "FINIVIG"));
			java.sql.Date PFFINVIG = this.stringToSqlDate(this.getHiddenCampoTextual(request, "FFINVIG"));
			BigDecimal PIIMPORTE = getHiddenCampoNumerico(request, "IIMPORTE");
			String MODO = getCampoTextual(request, "EDICION");
			BigDecimal PMODO = null;
			if (MODO.equals("TRUE"))
				PMODO = new BigDecimal(2);
			else
				PMODO = new BigDecimal(1);

			HashMap map = new PAC_IAX_REDCOMERCIAL((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_REDCOMERCIAL__F_SET_SOPORTEARP(PMODO, PCAGENTE, PIIMPORTE, PFINIVIG, PFFINVIG);
			BigDecimal resultado = (BigDecimal) tratarRETURNyMENSAJES(request, map);

			if (resultado.intValue() == 0)
				request.setAttribute("resultadoOK", "OK");
			else
				request.setAttribute("resultadoOK", "KO");

		} catch (Exception e) {
			logger.error("Error en el servicio Axisage015Service - m�todo m_aceptar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			// m_cargarValors(request, thisAction);
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

}
