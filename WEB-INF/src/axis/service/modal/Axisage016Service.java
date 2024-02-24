package axis.service.modal;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_REDCOMERCIAL;
import axis.mvc.control.modal.Axisage016Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

/**
 * Axisage016Service.java 24/10/2011
 * 
 * @author <a href="joan_torres@csi-ti.com">Joan Torres</a>
 * @since Java 5.0
 */
public class Axisage016Service extends AxisBaseService {
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
	public void m_init(HttpServletRequest request, Axisage016Action thisAction) {
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
	public void m_form(HttpServletRequest request, Axisage016Action thisAction) {
		logger.debug("Axisage016Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {
			String PCAGENTE = getCampoTextual(request, "PARCAGENTE");
			String NOMBRE = getCampoTextual(request, "NOMBRE");
			String NNUMIDE = getCampoTextual(request, "NNUMIDE");
			BigDecimal CTIPO = getCampoNumerico(request, "CTIPO");
			BigDecimal pCOMIND = getCampoNumerico(request, "CCOMIND");
			String pPFORMATO = getCampoTextual(request, "FORMATO");
			logger.debug("Params ----> " + PCAGENTE);

			formdata.put("CAGENTE", PCAGENTE);
			// HashMap map = new
			// PAC_IAX_LISTVALORES((java.sql.Connection)request.getAttribute(Constantes.DB01CONN)).ejecutaPAC_IAX_LISTVALORES__F_GET_LSTAGENTES(NOMBRE,
			// NNUMIDE,PCAGENTE,new BigDecimal(1) );
			HashMap map = new PAC_IAX_REDCOMERCIAL((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_REDCOMERCIAL__FF_DESAGENTE(new BigDecimal(PCAGENTE), CTIPO);
			logger.debug(map);
			if (tratarRETURNyMENSAJES(request, map) != null) {
				String TAGENTE = (String) tratarRETURNyMENSAJES(request, map);
				formdata.put("TAGENTE", TAGENTE);
			}

			// <%-- Inici BFP bug 20999 25/01/2012 Comisi�n Indirecta, afegim el par�metre
			// pCCOMIND --%>
			map = new PAC_IAX_REDCOMERCIAL((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_REDCOMERCIAL__F_GET_COMISIONVIG_AGENTE(new BigDecimal(PCAGENTE), CTIPO, pCOMIND);
			logger.debug(map);

			List listaVig = (List) tratarRETURNyMENSAJES(request, map);
			formdata.put("LISTAVIG", listaVig);

		} catch (Exception e) {
			logger.error("Error en el servicio Axiscrt163Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {

			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));

		}
	}

	public void m_aceptar(HttpServletRequest request, Axisage016Action thisAction) {
		logger.debug("Axisage016Service m_aceptar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		String tipo = this.getCampoTextual(request, "tipo");
		try {
			/*
			 * HashMap map = new HashMap();
			 * 
			 * map = new
			 * PAC_IAX_COMISIONES((java.sql.Connection)request.getAttribute(Constantes.
			 * DB01CONN)).ejecutaPAC_IAX_COMISIONES__F_SET_TRASPASO_DETALLE_OBJ_BD();
			 * BigDecimal resultado = (BigDecimal)tratarRETURNyMENSAJES(request,map);
			 * 
			 * if(resultado.intValue()==0) request.setAttribute("resultadoOK","OK"); else
			 * if(resultado.intValue()==-1) request.setAttribute("resultadoOK","K"); else
			 * request.setAttribute("resultadoOK","KO");
			 */

		} catch (Exception e) {
			logger.error("Error en el servicio Axisage016Service - m�todo m_aceptar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			// m_cargarValors(request, thisAction);
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}
}
