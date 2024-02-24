package axis.service.modal;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_PRODUCCION;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

public class Axisctr178Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	public void m_init(HttpServletRequest request) {
		logger.debug("m_init");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {
		} catch (Exception e) {
			logger.error("Error en el m�todo m_init", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	public void m_form(HttpServletRequest request) {
		logger.debug("Axisctr178Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {
			BigDecimal SSEGURO = this.getCampoNumerico(request, "SSEGURO");
			if (isEmpty(SSEGURO)) {
				SSEGURO = (BigDecimal) AbstractDispatchAction.topPila(request, "SSEGURO");
				BigDecimal SSEGURO_OUT = (BigDecimal) AbstractDispatchAction.topPila(request, "SSEGURO_OUT");

				logger.debug("SSEGURO:" + SSEGURO);
				logger.debug("SSEGURO_OUT:" + SSEGURO_OUT);

				if (SSEGURO_OUT != null) {
					SSEGURO = SSEGURO_OUT; // Cuando se hacen suplementos SSEGURO_OUT!=null y debe informarse este valor
				} // Si se realiza un alta SSEGURO_OUT = null y debe informarse el SSEGURO

			}

			PAC_IAX_PRODUCCION pac_iax_produccion = new PAC_IAX_PRODUCCION(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map map_gar = pac_iax_produccion.ejecutaPAC_IAX_PRODUCCION__F_GET_GARANTIAS_BENIDGAR(SSEGURO);
			logger.debug(map_gar);
			List listaGar = (List) tratarRETURNyMENSAJES(request, map_gar, false);
			formdata.put("listaGar", listaGar);

		} catch (Exception e) {
			logger.error("Error en el m�todo Axisctr178Service.m_form", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}

	}

	/*********************************************************************************************************************/
	/************************************************
	 * M�TODOS DE ACTUALIZACI�N
	 *******************************************/

	/*********************************************************************************************************************/

	/**
	 * @param request
	 */
	public void m_altamodi(HttpServletRequest request) {
		logger.debug("Axisctr178Service m_altamodi");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {
			request.setAttribute("grabarOK", -1);
			PAC_IAX_PRODUCCION pacIaxProduccion = new PAC_IAX_PRODUCCION(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			BigDecimal NRIESGO = getCampoNumerico(request, "NRIESGO");
			BigDecimal CGARANT = getCampoNumerico(request, "GARANTIA");

			Map ejecuta_set_beneident = pacIaxProduccion.ejecutaPAC_IAX_PRODUCCION__F_INSERT_BENESP_GAR(NRIESGO,
					CGARANT);
			logger.debug(ejecuta_set_beneident);
			BigDecimal map_set_beneident = (BigDecimal) tratarRETURNyMENSAJES(request, ejecuta_set_beneident, false);
			logger.debug(map_set_beneident);
			request.setAttribute("grabarOK", map_set_beneident);

		} catch (Exception e) {
			logger.error("Error en el m�todo Axisctr178Service.m_altamodi", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));

	}

}
