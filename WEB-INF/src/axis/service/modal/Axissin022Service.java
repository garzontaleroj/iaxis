package axis.service.modal;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_LISTVALORES_SIN;
import axis.jdbc.PAC_IAX_SINIESTROS;
import axis.mvc.control.modal.Axissin022Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AjaxContainerService;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

/**
 * Axissin022Service.java
 * 
 * @author <a href="mailto:amartinez@csi-ti.com">Alex Martinez</a>
 */
public class Axissin022Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE INICIALIZACION
	 *******************************************/

	/**
	 */
	public

			void m_init(HttpServletRequest request, Axissin022Action thisAction) {
		try {

		} catch (Exception e) {
			logger.error("Error en el servicio Axissin020Service - m�todo m_init", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	public void m_form(HttpServletRequest request, Axissin022Action thisAction) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		try {
			this.cargarCombos(request, thisAction);

			String isNew = getCampoTextual(request, "isNew");
			request.setAttribute("isNew", isNew);

			BigDecimal pscaumot = getCampoNumerico(request, "CSCAUMOT");
			logger.debug("-------- CSCAUMOT:" + pscaumot);
			if (!isEmpty(pscaumot))
				this.recuperar_causamotivo(request, thisAction, pscaumot);
			else {
				PAC_IAX_SINIESTROS pacIaxSiniestros = new PAC_IAX_SINIESTROS(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
				Map map = pacIaxSiniestros.ejecutaPAC_IAX_SINIESTROS__F_GET_NEXTSCAUMOT();
				logger.debug(map);
				request.setAttribute("CSCAUMOT", map.get("PSCAUMOT"));
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axissin022Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	private void cargarCombos(HttpServletRequest request, Axissin022Action thisAction) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		Map listValores = new HashMap();
		try {

			PAC_IAX_LISTVALORES_SIN pacIaxListValores_sin = new PAC_IAX_LISTVALORES_SIN(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map map = pacIaxListValores_sin.ejecutaPAC_IAX_LISTVALORES_SIN__F_GET_LSTCASSIN_CODMOTCAU();
			logger.debug(map);
			request.setAttribute("LSTCAUSAS", (List) tratarRETURNyMENSAJES(request, map, false));

			map = pacIaxListValores_sin.ejecutaPAC_IAX_LISTVALORES_SIN__F_GET_LSTMOTMOVI();
			logger.debug(map);
			request.setAttribute("LSTACCIONES", (List) tratarRETURNyMENSAJES(request, map, false));

			map = pacIaxListValores_sin.ejecutaPAC_IAX_LISTVALORES_SIN__F_GET_LSTCODCTASEGURO();
			logger.debug(map);
			request.setAttribute("LSTMOVIMIENTOS", (List) tratarRETURNyMENSAJES(request, map, false));

		}

		catch (Exception e) {
			logger.error("Error en el servicio axissin002Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
			formdata.put("listValores", listValores);
		}

	}

	/**
	 * Funcion que recupera la lista de los motivos de la causa del siniestro
	 * 
	 * @param request El HttpServletRequest que contiene la petici�n del cliente
	 *                web.
	 */
	public void m_ajax_recuperar_motivos(HttpServletRequest request) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();
		try {
			BigDecimal CVALOR = getCampoNumerico(request, "CVALOR");
			logger.debug("---------- VALOR causa  :" + CVALOR);
			if (!isEmpty(CVALOR)) {

				Map map = new PAC_IAX_LISTVALORES_SIN((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_LISTVALORES_SIN__F_GET_LSTMOTSIN_CODMOTCAU(CVALOR);
				logger.debug(map);

				if (!isEmpty(map)) {
					List motivos = (List) (List) ajax.rellenarPlAContenedorAjax(map);
					ajax.guardarContenidoFinalAContenedorAjax(motivos);
				}
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axissin022Service - m�todo m_ajax_recuperar_motivos", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	public void m_guardar_causamotivo(HttpServletRequest request, Axissin022Action thisAction) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		try {

			// BigDecimal pscaumot = getCampoNumerico(request,"CSCAUMOT");
			// BigDecimal pccausin = getCampoNumerico(request,"CCAUSIN");
			// BigDecimal pcmotsin = getCampoNumerico(request,"CMOTSIN");
			BigDecimal pcpagaut = getCampoNumerico(request, "CPAGAUT");
			BigDecimal pcmotmov = getCampoNumerico(request, "CMOTMOV");
			BigDecimal pcmotfin = getCampoNumerico(request, "CMOTFIN");
			BigDecimal pcmovimi = getCampoNumerico(request, "CMOVIMI");
			BigDecimal pcdesaut = getCampoNumerico(request, "CDESAUT");

			// bug 0022490
			BigDecimal pcultpag = getCampoNumerico(request, "CULTPAG");

			BigDecimal phscaumot = getCampoNumerico(request, "HCSCAUMOT");
			BigDecimal phccausin = getCampoNumerico(request, "HCCAUSIN");
			BigDecimal phcmotsin = getCampoNumerico(request, "HCMOTSIN");

			BigDecimal PCSCAUMOT = isEmpty(getCampoNumerico(request, "CSCAUMOT"))
					? getCampoNumerico(request, "HCSCAUMOT")
					: getCampoNumerico(request, "CSCAUMOT");
			BigDecimal PCCAUSIN = isEmpty(getCampoNumerico(request, "CCAUSIN")) ? getCampoNumerico(request, "HCCAUSIN")
					: getCampoNumerico(request, "CCAUSIN");
			BigDecimal PCMOTSIN = isEmpty(getCampoNumerico(request, "CMOTSIN")) ? getCampoNumerico(request, "HCMOTSIN")
					: getCampoNumerico(request, "CMOTSIN");

			Map map = new PAC_IAX_SINIESTROS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_SINIESTROS__F_SET_SIN_CAUSA_MOTIVO(PCSCAUMOT, PCCAUSIN, PCMOTSIN, pcpagaut,
							pcmotmov, pcmotfin, pcmovimi, pcdesaut, pcultpag);
			logger.debug(map);

			request.setAttribute("ERROR", tratarRETURNyMENSAJES(request, map));
			tratarRETURNyMENSAJES(request, map);

		} catch (Exception e) {
			logger.error("Error en el servicio Axissin022Service - m�todo m_guardar_causamotivo", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	public void recuperar_causamotivo(HttpServletRequest request, Axissin022Action thisAction, BigDecimal pscaumot) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		try {

			Map map = new PAC_IAX_SINIESTROS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_SINIESTROS__F_GET_CAUMOT(pscaumot);
			logger.debug(map);

			Map map2 = new PAC_IAX_LISTVALORES_SIN((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES_SIN__F_GET_LSTMOTSIN_CODMOTCAU((BigDecimal) map.get("PCCAUSIN"));
			logger.debug(map2);

			request.setAttribute("CSCAUMOT", pscaumot);
			request.setAttribute("CCAUSIN", map.get("PCCAUSIN"));
			request.setAttribute("CMOTSIN", map.get("PCMOTSIN"));
			request.setAttribute("CPAGAUT", map.get("PCPAGAUT"));
			request.setAttribute("CMOTMOV", map.get("PCMOTMOV"));
			request.setAttribute("CMOTFIN", map.get("PCMOTFIN"));
			request.setAttribute("CMOVIMI", map.get("PCMOVIMI"));
			request.setAttribute("CDESAUT", map.get("PCDESAUT"));

			// bug 0022490
			request.setAttribute("CULTPAG", map.get("PCULTPAG"));

			request.setAttribute("LSTMOTIVOS", (List) tratarRETURNyMENSAJES(request, map2, false));

			// tratarRETURNyMENSAJES(request,map);

		} catch (Exception e) {
			logger.error("Error en el servicio Axissin022Service - m�todo recuperar_causamotivo", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}
}
