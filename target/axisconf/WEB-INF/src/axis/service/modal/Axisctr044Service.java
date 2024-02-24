package axis.service.modal;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_PRODUCCION;
import axis.jdbc.PAC_IAX_SUPLEMENTOS;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

/**
 * Axispro044Service.java Fecha: 22/09/2016
 * 
 * @author <a href = "mailto:jaesteban@csi-ti.com">Johan Esteban</a>
 * @since Java 5.0
 */
public class Axisctr044Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE INICIALIZACION
	 *******************************************/
	/*********************************************************************************************************************/

	/**
	 * Recupera los datos de un riesgo si viene un NRIESGO informado, si no, no hace
	 * nada.
	 * 
	 * @param request
	 */
	@SuppressWarnings("all")
	public void m_form(HttpServletRequest request) {
		logger.debug("Axisctr044Service m_form");

		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		PAC_IAX_PRODUCCION pac_axis_produccion = new PAC_IAX_PRODUCCION(
				((java.sql.Connection) request.getAttribute(Constantes.DB01CONN)));
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		formdata.put("NNRIESGO", 0);
		try {

			String MODO = (String) request.getParameter("CMODO");
			formdata.put("CMODO", MODO);

			BigDecimal pPCMOTMOV = (BigDecimal) AbstractDispatchAction.topPila(request, "CMOTMOV");

			if (pPCMOTMOV != null) {
				Map map2 = new PAC_IAX_SUPLEMENTOS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_SUPLEMENTOS__F_GET_DESCMOTMOV(pPCMOTMOV, usuario.getCidioma());
				formdata.put("PTMOTMOV", map2.get("PTMOTMOV"));
			}
			if (!isEmpty(this.getCampoTextual(request, "origen"))
					&& this.getCampoTextual(request, "origen").equals("axisctr009"))
				AbstractDispatchAction.topPila(request, "CMODO", "GENERAL");

			BigDecimal NRIESGO = getCampoNumerico(request, "NRIESGO");

			if (!isEmpty(NRIESGO) && !NRIESGO.equals(new BigDecimal("0"))) {
				Map map = pac_axis_produccion.ejecutaPAC_IAX_PRODUCCION__F_GET_RIESGO(NRIESGO);
				Map OB_IAX_RIESGO = (Map) tratarRETURNyMENSAJES(request, map);
				formdata.put("NRIESGO", NRIESGO);
				logger.debug(OB_IAX_RIESGO.get("TDESCRIE"));
				String TDESCRIE1;
				formdata.put("TDESCRIE1", OB_IAX_RIESGO.get("TDESCRI1"));
				logger.debug(OB_IAX_RIESGO.get("TDESCRI1"));
				String TDESCRIE2;
				formdata.put("TDESCRIE2", OB_IAX_RIESGO.get("TDESCRI2"));
				logger.debug(OB_IAX_RIESGO.get("TDESCRI2"));

				String TDESCRIE3;
				formdata.put("TDESCRIE3", OB_IAX_RIESGO.get("TDESCRI3"));
				logger.debug(OB_IAX_RIESGO.get("TDESCRI3"));
				String TDESCRIE4;
				formdata.put("TDESCRIE4", OB_IAX_RIESGO.get("TDESCRI4"));
				logger.debug(OB_IAX_RIESGO.get("TDESCRI4"));
				String TDESCRIE5;
				formdata.put("TDESCRIE5", OB_IAX_RIESGO.get("TDESCRI5"));
				logger.debug(OB_IAX_RIESGO.get("TDESCRI5"));
				String TDESCRIE6;
				formdata.put("TDESCRIE6", OB_IAX_RIESGO.get("TDESCRI6"));
				logger.debug(OB_IAX_RIESGO.get("TDESCRI6"));
				String TDESCRIE7;
				formdata.put("TDESCRIE7", OB_IAX_RIESGO.get("TDESCRI7"));
				logger.debug(OB_IAX_RIESGO.get("TDESCRI7"));

			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr044Service - m�todo m_form", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}

	/**
	 * Graba el detalle del riesgo
	 * 
	 * @param request
	 * @return boolean indicando si la grabaci�n ha sido correcta o no.
	 */
	@SuppressWarnings("all")
	public boolean m_grabarRieDetalle(HttpServletRequest request) {
		logger.debug("Axisctr044Service m_grabarRieDescripcion");

		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		PAC_IAX_PRODUCCION pacIaxProduccion = new PAC_IAX_PRODUCCION(
				((java.sql.Connection) request.getAttribute(Constantes.DB01CONN)));
		Map map = new HashMap();
		HashMap m = null;

		try {
			BigDecimal NRIESGO = getCampoNumerico(request, "NRIESGO");
			if (!isEmpty(NRIESGO) && NRIESGO.equals(new BigDecimal("0"))) {
				NRIESGO = null;
			}

			String TDESCRIE = getCampoTextual(request, "TDESCRIE");

			map = pacIaxProduccion.ejecutaPAC_IAX_PRODUCCION__F_GRABARIEDETALLE(NRIESGO, TDESCRIE);
			return BigDecimal.ZERO.equals(tratarRETURNyMENSAJES(request, map));

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr044Service - m�todo m_grabarRieDescripcion", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
			return BigDecimal.ZERO.equals(tratarRETURNyMENSAJES(request, map));
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}

}
