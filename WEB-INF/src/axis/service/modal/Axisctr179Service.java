package axis.service.modal;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.jdbc.PAC_IAX_PRODUCCION;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

public class Axisctr179Service extends AxisBaseService {
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
		logger.debug("Axisctr179Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {
			PAC_IAX_LISTVALORES pacIaxListavalores = new PAC_IAX_LISTVALORES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			PAC_IAX_PRODUCCION pacIaxProduccion = new PAC_IAX_PRODUCCION(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			BigDecimal NRIESGO = getCampoNumerico(request, "NRIESGO");
			BigDecimal NORDEN = getCampoNumerico(request, "NORDEN");
			BigDecimal CGARANT = getCampoNumerico(request, "CGARANT");
			BigDecimal NBENGAR = getCampoNumerico(request, "NORDEN");
			BigDecimal SPERSON = getCampoNumerico(request, "SPERSON");

			Map ejecuta_get_beneident_g = pacIaxProduccion.ejecutaPAC_IAX_PRODUCCION__F_GET_BENEIDENT_G(NRIESGO,
					NBENGAR, CGARANT);
			HashMap map_get_beneident_g = (HashMap) tratarRETURNyMENSAJES(request, ejecuta_get_beneident_g, false);
			logger.debug(map_get_beneident_g);
			formdata.put("map_get_beneident_g", map_get_beneident_g);

			Map ejecuta_detvalores_ctipben = pacIaxListavalores
					.ejecutaPAC_IAX_LISTVALORES__F_GET_LST_TIPOBENEFICIARIO(); // bug 24717/133366 - Miguel Luis -
																				// 31/12/2012
			List lista_detvalores_ctipben = (List) tratarRETURNyMENSAJES(request, ejecuta_detvalores_ctipben, false);
			formdata.put("lista_detvalores_ctipben", lista_detvalores_ctipben);

			Map ejecuta_detvalores_capren = pacIaxListavalores.ejecutaPAC_IAX_LISTVALORES__F_GET_LST_TIPOPARENTESCO(); // bug
																														// 24717/133366
																														// -
																														// Miguel
																														// Luis
																														// -
																														// 31/12/2012
			List lista_detvalores_capren = (List) tratarRETURNyMENSAJES(request, ejecuta_detvalores_capren, false);
			formdata.put("lista_detvalores_capren", lista_detvalores_capren);

			if (isEmpty(SPERSON))
				SPERSON = (BigDecimal) map_get_beneident_g.get("SPERSON");
			Map ejecuta_get_beneident_tit = pacIaxProduccion.ejecutaPAC_IAX_PRODUCCION__F_GET_BENEIDENT_TIT(NRIESGO,
					SPERSON, CGARANT);
			List lista_get_beneident_tit = (List) tratarRETURNyMENSAJES(request, ejecuta_get_beneident_tit, false);
			logger.debug(ejecuta_get_beneident_tit);
			formdata.put("lista_get_beneident_tit", lista_get_beneident_tit);

			Map ejecuta_detvalores_cestado = pacIaxListavalores
					.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(800128)); // bug 24717/133366 - Miguel Luis
																						// - 31/12/2012
			List lista_detvalores_cestado = (List) tratarRETURNyMENSAJES(request, ejecuta_detvalores_cestado, false);
			formdata.put("ejecuta_detvalores_cestado", lista_detvalores_cestado);
		} catch (Exception e) {
			logger.error("Error en el m�todo Axisctr179Service.m_form", e);
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
		logger.debug("Axisctr179Service m_altamodi");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {
			logger.debug("Axisctr177Service f_Get_Avisos");
			HashMap m = this.f_Get_Avisos(request, this.whoami(this));
			BigDecimal pRETURN = (BigDecimal) this.tratarRETURNyMENSAJES(request, m);
			request.setAttribute("PLSTAVISOS", m.get("PLSTAVISOS"));
			if (pRETURN != null && pRETURN.intValue() != 1) {

				request.setAttribute("grabarOK", -1);
				PAC_IAX_PRODUCCION pacIaxProduccion = new PAC_IAX_PRODUCCION(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

				BigDecimal NRIESGO = getCampoNumerico(request, "NRIESGO");
				BigDecimal NORDEN = getCampoNumerico(request, "NORDEN");
				BigDecimal CGARANT = getCampoNumerico(request, "CGARANT");
				BigDecimal SPERSON = getCampoNumerico(request, "SPERSON");
				BigDecimal SPERSON_TIT = getCampoNumerico(request, "SPERSON_TIT");
				BigDecimal CTIPBEN = getCampoNumerico(request, "CTIPBEN");
				BigDecimal CPAREN = getCampoNumerico(request, "CPAREN");
				BigDecimal PPARTICIP = getCampoNumerico(request, "PPARTICIP");
				BigDecimal CESTADO = getCampoNumerico(request, "CESTADO"); // bug 24717/133366 - Miguel Luis -
																			// 31/12/2012

				Map ejecuta_set_beneident_g = pacIaxProduccion.ejecutaPAC_IAX_PRODUCCION__F_SET_BENEIDENT_G(NRIESGO,
						NORDEN, SPERSON_TIT, CTIPBEN, CPAREN, PPARTICIP, CGARANT, CESTADO, null);
				BigDecimal map_set_beneident = (BigDecimal) tratarRETURNyMENSAJES(request, ejecuta_set_beneident_g,
						false);
				logger.debug(map_set_beneident);
				request.setAttribute("grabarOK", map_set_beneident);
			}
		} catch (Exception e) {
			logger.error("Error en el m�todo Axisctr179Service.m_altamodi", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));

	}

}
