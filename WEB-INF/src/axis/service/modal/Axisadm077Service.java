package axis.service.modal;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_RELACIONES;
import axis.mvc.control.modal.Axisadm077Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

/**
 * NOMBRE: Axisadm077Service.java
 * 
 * @author <a href = "mailto:xpastor@csi-ti.com">Xavi Pastor</a> Fecha:
 *         30/07/2012 PROP�SITO (descripci�n Service): Ejemplo : B�squeda de
 *         relaciones
 * 
 *         REVISIONES: Ver Fecha Autor Descripci�n --------- ----------
 *         --------------- ------------------------------------ 1.0 30/07/2012
 *         XPL 1. 22494: MDP_A001- Modulo de relacion de recibos
 * 
 */
public class Axisadm077Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

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
	public void m_init(HttpServletRequest request, Axisadm077Action thisAction) {
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
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
	public void m_form(HttpServletRequest request, Axisadm077Action thisAction) {
		logger.debug("Axisadm077Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		try {

			this.m_cargarCombos(request, thisAction);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm077Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {

			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	private void m_cargarCombos(HttpServletRequest request, Axisadm077Action thisAction) {
		logger.debug("Axisadm077Service m_cargarCombos");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		HashMap listValores = new HashMap();
		try {

			/*
			 * Combo de ejemplo :
			 * 
			 * PAC_IAX_LISTVALORES pac_axis_listValores = new
			 * PAC_IAX_LISTVALORES(usuario.getConnection());
			 * 
			 * Map map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_GET_TIPCCC();
			 * logger.debug(map); listValores.put("lstCCC",
			 * (List)tratarRETURNyMENSAJES(request, map));
			 */
			formdata.put("listValores", listValores);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm077Service - m�todo m_cargarCombos", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

	/**
	 * 
	 * @param request
	 */
	@SuppressWarnings("all")
	public void m_buscar(HttpServletRequest request, Axisadm077Action thisAction) {
		logger.debug("Axisadm077Service m_buscar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);

		try {

			PAC_IAX_RELACIONES pacIaxRel = new PAC_IAX_RELACIONES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			BigDecimal CEMPRES = this.getCampoNumerico(request, "CEMPRES");
			BigDecimal CAGENTE = this.getCampoNumerico(request, "CAGENTE");
			BigDecimal SRELACION = this.getCampoNumerico(request, "SRELACION");
			java.sql.Date FINI = this.stringToSqlDate(this.getCampoTextual(request, "FINI"));
			java.sql.Date FFIN = this.stringToSqlDate(this.getCampoTextual(request, "FFIN"));

			Map m = (Map) pacIaxRel.ejecutaPAC_IAX_RELACIONES__F_OBTENER_RELACIONES(CEMPRES, CAGENTE, SRELACION, FINI,
					FFIN);
			logger.debug(m);

			if (((BigDecimal) this.tratarRETURNyMENSAJES(request, m)).intValue() == 0)
				formdata.put("resultado", m.get("PRELACIONES"));

		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm077Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {

			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

}
