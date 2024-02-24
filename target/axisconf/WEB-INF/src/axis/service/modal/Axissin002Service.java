package axis.service.modal;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.jdbc.PAC_IAX_SINIESTROS;
import axis.mvc.control.modal.Axissin002Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

/* Ventana modal de buscador de siniestros:
 * Al entrar en consulta de siniestros nos salta la pantalla modal axissin002 de
 * b�squeda de siniestro. Se podr� buscar por los siguientes par�metros:
 *   ?	P�liza - NPOLIZA
 *   ?	Certificado puede ser nulo - NCERTIF
 *   ?	Siniestro - NSINIES
 *   ?	Situaci�n - CSITUAC
 *   ?	Numero documento - NNUMID
 *   ?	Nombre - TNOMBRE
 *   ?  Identificador Externo - SNIP
 *   ?	Indicador que es tomador (1) o asegurado (2) - TIPOPERSONA **
 * ninguno de estos par�metros de b�squeda es obligatorio.
 * Si no se introduce ninguno de estos par�metros, el buscador mostrar� toda
 * la lista de p�lizas-siniestros
 *                                                               (**) Nombres a�n por establecer

*/

/**
 * Axissin002Service.java
 * 
 * @author <a href="mailto:rkirchner@csi-ti.com">Roger Kirchner Villas</a>
 */
public class Axissin002Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE INICIALIZACION
	 *******************************************/
	/*********************************************************************************************************************/

	public void m_init(HttpServletRequest request, Axissin002Action thisAction) {
		try {
			request.getSession().removeAttribute("AXISSIN_LISTASINIESTROS");
		} catch (Exception e) {
			logger.error("Error en el servicio axissin002Service - m�todo m_init", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

	public void m_form(HttpServletRequest request, Axissin002Action thisAction) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		try {
			request.getSession().removeAttribute("AXISSIN_LISTASINIESTROS");
			// Cargar lista de estados
			Map map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES__F_GET_ESTADOSSINI();
			logger.debug(map);
			List ESTADOSSINI = (List) tratarRETURNyMENSAJES(request, map);
			request.getSession().setAttribute("AXISSIN_ESTADOSSINI", ESTADOSSINI);

			// Cargar lista de subestados
			Map map2 = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES__F_GET_SUBESTADOSSINI();
			logger.debug(map2);
			List SUBESTADOSSINI = (List) tratarRETURNyMENSAJES(request, map2);
			request.getSession().setAttribute("AXISSIN_SUBESTADOSSINI", SUBESTADOSSINI);

			// Carreguem aquest per controlar el que ve d'apertura d'expedient
			String MODO = getCampoTextual(request, "MODO");
			// Prov� d'apertura d'expedient
			if (!isEmpty(MODO) && MODO.equals("APERTURASINIESTROS"))
				this.m_busqueda_siniestro(request, thisAction);
		} catch (Exception e) {
			logger.error("Error en el servicio axissin002Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

	/*********************************************************************************************************************/
	/************************************************
	 * M�TODOS DE ACTUALIZACI�N
	 *******************************************/
	/*********************************************************************************************************************/

	/**
	 * Realiza la b�squeda de un siniestro, dados los par�metros del formulario.
	 * Dichos par�metros pueden estar a null. Pone el resultado en una List en
	 * sesi�n llamada AXISSIN_LISTASINIESTROS.
	 * 
	 * @param request    El HttpServletRequest que contiene la petici�n del cliente
	 *                   web.
	 * @param thisAction Una Action abstracta desde donde se ha invocado el servicio
	 *                   (necesaria para el log).
	 */
	public void m_busqueda_siniestro(HttpServletRequest request, Axissin002Action thisAction) {
		// Recuperar siniestro a buscar
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {
			// Recuperar par�metros de b�squeda
			BigDecimal NPOLIZA = getCampoNumerico(request, "NPOLIZA");
			BigDecimal NSINIES = getCampoNumerico(request, "NSINIES");
			BigDecimal NCERTIF = ((isEmpty(getCampoNumerico(request, "NCERTIF"))) ? new BigDecimal(0)
					: getCampoNumerico(request, "NCERTIF"));
			BigDecimal CESTSIN = getCampoNumerico(request, "CESTSIN");
			String SNIP = getCampoTextual(request, "SNIP");
			String NNUMIDE = getCampoTextual(request, "NNUMIDE");
			String BUSCAR = getCampoTextual(request, "BUSCAR");
			/*
			 * String esTomador = getCampoTextual(request, "tomador"); String esAsegurado =
			 * getCampoTextual(request, "asegurado");
			 * 
			 * // Establecer tipo persona BigDecimal TIPOPERS = null; if
			 * (!isEmpty(esTomador) && esTomador.equals("on")) TIPOPERS = new BigDecimal(1);
			 * if (!isEmpty(esAsegurado) && esAsegurado.equals("on")) TIPOPERS = new
			 * BigDecimal(2);
			 */

			BigDecimal TIPOPERSONA = getCampoNumerico(request, "TIPOPERSONA");
			BigDecimal SUBESTADO = getCampoNumerico(request, "CSUBEST");

			formdata.put("CESTSIN", CESTSIN);

			if (formdata.get("paginar") == null) {
				PAC_IAX_SINIESTROS pac_axis_siniestros = new PAC_IAX_SINIESTROS(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
				Map map = pac_axis_siniestros.ejecutaPAC_IAX_SINIESTROS__F_CONSULTASINI_OLD(NPOLIZA, NCERTIF, NSINIES,
						CESTSIN, NNUMIDE, SNIP, BUSCAR, TIPOPERSONA, SUBESTADO);
				logger.debug(map);
				List listaSiniestros = (List) tratarRETURNyMENSAJES(request, map);
				request.getSession().setAttribute("AXISSIN_LISTASINIESTROS", listaSiniestros);
			}

		} catch (Exception e) {
			logger.error("Error en el servicio axissin002Service - m�todo m_busqueda_siniestro", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

}
