package axis.service.modal;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.jdbc.PAC_IAX_MAP;
import axis.mvc.control.modal.Axismap003Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

public class Axismap003Service extends AxisBaseService {
	Log log = LogFactory.getLog(this.getClass());
	private String SNIP;

	/*********************************************************************************************************************/
	/************************************************
	 * M�TODOS DE INICIALIZACI�N
	 *******************************************/

	/*********************************************************************************************************************/
	public

			void m_init(HttpServletRequest request, Axismap003Action thisAction) {
		try {
			request.getSession().removeAttribute("axisper001_listaPersonas");
		} catch (Exception e) {
			log.error("Error", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.configForm(request, whoami(this));
			this.cargaDependencias(request, (List) request.getAttribute("DEPENDENCIAS"));
		}
	}

	/**
	 * Limpia la antigua lista de personas de sesi�n, en caso que hubiera, para
	 * poder realizar una b�squeda nueva.
	 * 
	 * @param request    El HttpServletRequest que contiene la petici�n del cliente
	 *                   web.
	 * @param thisAction Una Action abstracta desde donde se ha invocado el servicio
	 *                   (necesaria para el log).
	 */
	public void m_form(HttpServletRequest request, Axismap003Action thisAction) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);

		try {

			PAC_IAX_LISTVALORES pac_iax_listvalores = new PAC_IAX_LISTVALORES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			Map map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(501));
			formdata.put("lstTractament", this.tratarRETURNyMENSAJES(request, map));
			map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(500));
			formdata.put("lstTipus", this.tratarRETURNyMENSAJES(request, map));
			map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(502));
			formdata.put("lstQuery", this.tratarRETURNyMENSAJES(request, map));

			String CMAPEAD = this.getHiddenCampoTextual(request, "CMAPEAD");

			PAC_IAX_MAP pac_iax_map = new PAC_IAX_MAP((java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			Map m = pac_iax_map.ejecutaPAC_IAX_MAP__F_GET_MAPCABECERA(CMAPEAD);
			log.debug(m);
			ArrayList lstobj = (ArrayList) this.tratarRETURNyMENSAJES(request, m);
			if (!isEmpty(lstobj) && lstobj.size() > 0)
				formdata.putAll((Map) lstobj.get(0));
			// formdata.put("cabecera", this.tratarRETURNyMENSAJES(request, m));

			m = pac_iax_map.ejecutaPAC_IAX_MAP__F_GET_MAPCABTRATAR(CMAPEAD);
			log.debug(m);
			formdata.put("cabtratar", this.tratarRETURNyMENSAJES(request, m));
			m = pac_iax_map.ejecutaPAC_IAX_MAP__F_GET_MAPCOMODIN(CMAPEAD);
			log.debug(m);
			formdata.put("comodin", this.tratarRETURNyMENSAJES(request, m));

		} catch (Exception e) {
			log.error("Error", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	public void m_guardar(HttpServletRequest request, Axismap003Action thisAction) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);

		try {

			String CMAPEAD = this.getHiddenCampoTextual(request, "CMAPEAD");

			String PTDESMAP = this.getHiddenCampoTextual(request, "TDESMAP");
			String PTPARPATH = this.getHiddenCampoTextual(request, "TPARPATH");
			BigDecimal PTTIPOMAP = this.getHiddenCampoNumerico(request, "TTIPOMAP");
			String PCSEPARADOR = this.getHiddenCampoTextual(request, "CSEPARADOR");
			String PCMAPCOMODIN = this.getHiddenCampoTextual(request, "CMAPCOMODIN");
			String PTTIPOTRAT = this.getHiddenCampoTextual(request, "TTIPOTRAT");
			String PTCOMENTARIO = this.getHiddenCampoTextual(request, "TCOMENTARIO");
			String PTPARAMETROS = this.getHiddenCampoTextual(request, "TPARAMETROS");
			BigDecimal PCMANTEN = this.getHiddenCampoNumerico(request, "CMANTEN");
			BigDecimal PGENERA_REPORT = this.getHiddenCampoNumerico(request, "GENERA_REPORT");

			PAC_IAX_MAP pac_iax_map = new PAC_IAX_MAP((java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			Map m = pac_iax_map.ejecutaPAC_IAX_MAP__F_SET_MAPCABECERA(CMAPEAD, PTDESMAP, PTPARPATH, PTTIPOMAP,
					PCSEPARADOR, PCMAPCOMODIN, PTTIPOTRAT, PTCOMENTARIO, PTPARAMETROS, PCMANTEN, PGENERA_REPORT);

			log.debug(m);

			BigDecimal retorno = (BigDecimal) this.tratarRETURNyMENSAJES(request, m);

			if (retorno.intValue() == 0)
				formdata.put("CMAPEAD_SALIDA", m.get("PCMAPEAD_SALIDA"));

		} catch (Exception e) {
			log.error("Error", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	public void m_borrar(HttpServletRequest request, Axismap003Action thisAction) {
		log.debug("Axismap003Service m_borrar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {
			String CMAPEAD = this.getHiddenCampoTextual(request, "CMAPEAD");

			String CMAPCOM = isEmpty(this.getHiddenCampoTextual(request, "CMAPCOM"))
					? (String) request.getSession().getAttribute("CMAPCOM")
					: this.getHiddenCampoTextual(request, "CMAPCOM");

			PAC_IAX_MAP pac_iax_map = new PAC_IAX_MAP((java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			Map m = pac_iax_map.ejecutaPAC_IAX_MAP__F_DEL_MAPCOMODIN(CMAPEAD, CMAPCOM);
			log.debug(m);

			BigDecimal retorno = (BigDecimal) this.tratarRETURNyMENSAJES(request, m);

			formdata.put("ok", retorno);

		} catch (Exception e) {
			log.error("Error en el servicio Axismap003Service - m�todo m_borrar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {

			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));

		}
	}

	public void m_borrar_cabtratar(HttpServletRequest request, Axismap003Action thisAction) {
		log.debug("Axismap003Service m_borrar_cabtratar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {
			String CMAPEAD = isEmpty(this.getHiddenCampoTextual(request, "CMAPEAD"))
					? (String) request.getSession().getAttribute("CMAPEAD")
					: this.getHiddenCampoTextual(request, "CMAPEAD");

			BigDecimal CTABLA = this.getCampoNumerico(request, "CTABLA");
			BigDecimal NVECES = this.getCampoNumerico(request, "NVECES");
			PAC_IAX_MAP pac_iax_map = new PAC_IAX_MAP((java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			Map m = pac_iax_map.ejecutaPAC_IAX_MAP__F_DEL_MAPCABTRATAR(CMAPEAD, CTABLA, NVECES);
			log.debug(m);

			BigDecimal retorno = (BigDecimal) this.tratarRETURNyMENSAJES(request, m);

			formdata.put("ok", retorno);

		} catch (Exception e) {
			log.error("Error en el servicio Axismap003Service - m�todo m_borrar_cabtratar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {

			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));

		}
	}

}
