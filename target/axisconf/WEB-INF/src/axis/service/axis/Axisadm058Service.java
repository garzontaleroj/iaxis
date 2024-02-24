package axis.service.axis;

import java.math.BigDecimal;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_COBRADOR;
import axis.mvc.control.axis.Axisadm058Action;
import axis.mvc.model.UsuarioBean;
import axis.util.Constantes;

public class Axisadm058Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE INICIALIZACION
	 *******************************************/
	/******************************************************
	 * z
	 ***************************************************************/

	/**
	 * M�todo que se llama al inicio de este flujo.
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_init(HttpServletRequest request, Axisadm058Action thisAction) {
		try {
		} catch (Exception e) {
			logger.error("Error", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));

	}

	/**
	 * Carga la lista de todos los Ramos y carga el Agente inicial.
	 * 
	 * @param request    El HttpServletRequest que contiene la petici�n del cliente
	 *                   web.
	 * @param thisAction Una Action abstracta desde donde se ha invocado el servicio
	 *                   (necesaria para el log).
	 */
	public void m_form(HttpServletRequest request, Axisadm058Action thisAction) {
		logger.debug("Axisadm058Service m_form");
		try {
			UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
			Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm057Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));

	}

	public void m_buscar(HttpServletRequest request, Axisadm058Action thisAction) {
		logger.debug("Axisadm058Service m_buscar");
		try {

			UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
			Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

			BigDecimal CCOBBAN = getCampoNumerico(request, "CCOBBAN");

			Map map = new PAC_IAX_COBRADOR((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_COBRADOR__F_GET_COBRADOR_DET(CCOBBAN);
			logger.debug("----> Cobradores:" + map.get("POBJBAN"));

			tratarRETURNyMENSAJES(request, map);

			if (map.get("RETURN").equals(new BigDecimal(0))) {
				formdata.put("OK", new BigDecimal(0));
			} else
				formdata.put("OK", new BigDecimal(1));

			// request.setAttribute("listaCobradores", map.get("POBJBAN"));

			// if (num.intValue() !=0)
			// request.setAttribute("axisctr_listadetalle", map.get("P_RDETALLE"));

			// formdata.putAll((Map)car.get(0));
			// formdata.putAll(map);
			formdata.put("listaCobradores", map.get("POBJBAN"));
			// formdata.put("TRAMOSREA",map.get("PTRAMOSREA"));

			// formdata.put("FVALORA",FVALORA);

			Map map_sel = new PAC_IAX_COBRADOR((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_COBRADOR__F_GET_COBRADOR_SEL(CCOBBAN, null);
			logger.debug("----> Cobradores_sel:" + map_sel.get("PCCOBBANSEL"));
			tratarRETURNyMENSAJES(request, map_sel, false);
			formdata.put("listaCobradores_sel", map_sel.get("PCCOBBANSEL"));
			BigDecimal INDICE = getCampoNumerico(request, "INDICE");
			logger.debug("INDICE------------>" + INDICE);
			if (isEmpty(INDICE))
				formdata.put("INDICE", 0);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm058Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));

	}

}
