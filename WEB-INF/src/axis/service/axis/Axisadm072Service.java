package axis.service.axis;

import java.math.BigDecimal;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_ADM;
import axis.jdbc.PAC_IAX_TRANSFERENCIAS;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.model.UsuarioBean;
import axis.util.Constantes;

/**
 * Axisadm072Service.java 25/06/2012
 * 
 * @since Java 5.0
 */
@SuppressWarnings("all")
public class Axisadm072Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE INICIALIZACION
	 *******************************************/
	/*********************************************************************************************************************/

	/**
	 * 
	 * @param request
	 */
	public void m_init(HttpServletRequest request) {
		logger.debug("Axisadm039Service m_init");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {
			PAC_IAX_TRANSFERENCIAS pac_iax_transferencias = new PAC_IAX_TRANSFERENCIAS(
					(Connection) request.getAttribute(Constantes.DB01CONN));
			Map map = pac_iax_transferencias.ejecutaPAC_IAX_TRANSFERENCIAS__F_REGISTROS_PENDIENTES();
			logger.debug(map);

			if (((BigDecimal) this.tratarRETURNyMENSAJES(request, map)).equals(BigDecimal.ZERO))
				formdata.put("PHAYREGISTROS", map.get("PHAYREGISTROS"));

		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm039Service - m�todo m_init", e);

		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	/**
	 * 
	 * @param request
	 */
	public void m_form(HttpServletRequest request) {
		logger.debug("Axisadm039Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {

		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm039Service - m�todo m_form", e);

		} finally {
			AbstractDispatchAction.topPila(request, "EJECUTAR_A_SALIR",
					"PAC_IAX_TRANSFERENCIAS__F_LIMPIA_REMESASPREVIO");
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	public void m_consultar(HttpServletRequest request) {
		logger.debug("Axisadm072Service m_consultar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {

			PAC_IAX_ADM pac_iax_adm = new PAC_IAX_ADM((Connection) request.getAttribute(Constantes.DB01CONN));

			String NMATRIC = this.getCampoTextual(request, "NMATRIC_cerca");

			formdata.remove("NMATRIC_cerca");
			formdata.clear();
			formdata.put("NMATRIC_cerca", NMATRIC);

			BigDecimal CIDIOMA = usuario.getCidioma();

			/* Realizamos la b�squeda */
			Map m = pac_iax_adm.ejecutaPAC_IAX_ADM__F_GET_MATRICULAS_DET(NMATRIC, CIDIOMA);
			logger.debug(m);
			ArrayList lista = (ArrayList) tratarRETURNyMENSAJES(request, m, false);

			if (lista != null && lista.size() > 0) {
				HashMap mapa_cabecera = (HashMap) lista.get(0);
				formdata.putAll(mapa_cabecera);
			}

			formdata.put("MOV_MATRICULAS", lista);

			/*
			 * if (((BigDecimal)this.tratarRETURNyMENSAJES(request,
			 * m)).equals(BigDecimal.ZERO)) formdata.put("OK", "0"); else { if
			 * (((BigDecimal)m.get("RETURN")).intValue() == 2) { formdata.put("OK", "0");
			 * HashMap msg = (HashMap)((ArrayList)m.get("MENSAJES")).get(0);
			 * formdata.put("MSG", ((HashMap)msg.get("OB_IAX_MENSAJES")).get("TERROR")); } }
			 */

		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm072Service - m�todo m_form", e);

		} finally {
			AbstractDispatchAction.topPila(request, "EJECUTAR_A_SALIR", "PAC_IAX_ADM");
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	public void m_salir(HttpServletRequest request) {
		logger.debug("Axisadm039Service m_salir");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {

			PAC_IAX_TRANSFERENCIAS pac_iax_transferencias = new PAC_IAX_TRANSFERENCIAS(
					(Connection) request.getAttribute(Constantes.DB01CONN));
			Map map = pac_iax_transferencias.ejecutaPAC_IAX_TRANSFERENCIAS__F_LIMPIA_REMESASPREVIO();
			logger.debug(map);
			this.tratarRETURNyMENSAJES(request, map);
			formdata.put("SALIR", "1");
			String tipos_cerca = this.getCampoTextual(request, "tipos_cerca");
			Map m = pac_iax_transferencias.ejecutaPAC_IAX_TRANSFERENCIAS__F_GET_DESC_CONCEPTO(tipos_cerca);
			this.tratarRETURNyMENSAJES(request, m);
			logger.debug(m);
			formdata.put("PTLITERA", m.get("PTLITERA"));
		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm039Service - m�todo m_salir", e);

		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

}
