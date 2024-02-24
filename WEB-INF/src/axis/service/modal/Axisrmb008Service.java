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
import axis.jdbc.PAC_IAX_REEMBOLSOS;
import axis.mvc.control.modal.Axisrmb008Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

/**
 * Axisrmb008Service.java 20/08/2008
 * 
 * @author <a href="rkirchner@csi-ti.com">Roger Kirchner</a>
 * @since Java 5.0
 */
public class Axisrmb008Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	/**
	 * M�todo que llama a la funci�n pl correspondiente a la carga de productos para
	 * seleccionar una p�liza.
	 * 
	 * @param request
	 * @param usuario
	 * @return
	 * @throws Exception
	 */
	private List dbGetProductos(HttpServletRequest request, UsuarioBean usuario) throws Exception {
		// TODO: PCTERMFIN a hard-code
		Map m = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_LISTVALORES__F_GET_PRODUCTOS("REEMB", null, null);
		logger.debug(m);
		List primas = (List) tratarRETURNyMENSAJES(request, m);

		return primas;
	}

	/**
	 * M�todo que, pasando unos parametros, permite la carga de todas las p�lizas
	 * posibles a partir de esta b�squeda.
	 * 
	 * @param request
	 * @param usuario
	 * @param SPRODUC
	 * @param NPOLIZA
	 * @param NCERT
	 * @param NNUMIDE
	 * @param SNIP
	 * @param BUSCAR
	 * @param TIPOPERSONA
	 * @return
	 * @throws Exception
	 */
	private List dbConsultaPoliza(HttpServletRequest request, UsuarioBean usuario, BigDecimal SPRODUC,
			BigDecimal NPOLIZA, BigDecimal NCERT, String NNUMIDE, String SNIP, String BUSCAR, BigDecimal TIPOPERSONA)
			throws Exception {
		HashMap m = new PAC_IAX_REEMBOLSOS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_REEMBOLSOS__F_CONSULTAPOLIZAASEGURADOS(SPRODUC, NPOLIZA, NCERT, NNUMIDE, SNIP, BUSCAR,
						TIPOPERSONA);
		// HashMap m= new
		// PAC_IAX_PRODUCCION((java.sql.Connection)request.getAttribute(Constantes.DB01CONN)).ejecutaPAC_IAX_PRODUCCION__F_CONSULTAPOLIZA(SPRODUC,
		// NPOLIZA, NCERT, NNUMIDE, SNIP, BUSCAR, TIPOPERSONA);
		logger.debug(m);
		List plReturn = (List) tratarRETURNyMENSAJES(request, m);

		return plReturn;
	}

	/**
	 * M�todo inicial al llamar a �ste flujo.
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_init(HttpServletRequest request, Axisrmb008Action thisAction) {
		logger.debug("Axisctr008Service m_init");
		try {
			request.getSession().removeAttribute("axisctr_listaPolizas");
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr008Service - m�todo m_init", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE INICIALIZACION
	 *******************************************/
	/*********************************************************************************************************************/
	/**
	 * M�todo que se llama al principio del flujo. Se encarga de realizar la carga
	 * de productos para realizar la b�squeda de una p�liza.
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_form(HttpServletRequest request, Axisrmb008Action thisAction) {
		logger.debug("Axisctr008Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {
			request.getSession().removeAttribute("axisctr_listaPolizas");
			/*
			 * if (isEmpty(getCampoNumerico(request, "SPRODUC"))) { // es porque se lo han
			 * llamado directamente
			 * request.getSession().removeAttribute("axisctr_listaPolizas"); }
			 */
			List productos = dbGetProductos(request, usuario);
			request.getSession().setAttribute("productos", ((productos == null) ? new ArrayList() : productos));

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr008Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

	/**
	 * M�todo que se encarga de procesar la b�squeda de una p�liza.
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_buscar(HttpServletRequest request, Axisrmb008Action thisAction) {
		logger.debug("Axisctr008Service m_buscar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {
			if (formdata.get("paginar") == null) {
				request.getSession().removeAttribute("axisctr_listaPolizas");

				BigDecimal SPRODUC = getCampoNumerico(request, "SPRODUC");
				BigDecimal NPOLIZA = getCampoNumerico(request, "NPOLIZA");
				BigDecimal NCERT = getCampoNumerico(request, "NCERT");
				String NNUMIDE = getCampoTextual(request, "NNUMIDE");
				String SNIP = getCampoTextual(request, "SNIP");
				String BUSCAR = getCampoTextual(request, "BUSCAR");

				/*
				 * String esTomador = getCampoTextual(request, "tomador"); String esAsegurado =
				 * getCampoTextual(request, "asegurado");
				 * 
				 * // Establecer tipo persona BigDecimal TIPOPERSONA = null; if
				 * (!isEmpty(esTomador) && esTomador.equals("on")) TIPOPERSONA = new
				 * BigDecimal(1); if (!isEmpty(esAsegurado) && esAsegurado.equals("on"))
				 * TIPOPERSONA = new BigDecimal(2);
				 */
				BigDecimal TIPOPERSONA = getCampoNumerico(request, "TIPOPERSONA");

				List consultaPolizaReturn = this.dbConsultaPoliza(request, usuario, SPRODUC, NPOLIZA, NCERT, NNUMIDE,
						SNIP, BUSCAR, TIPOPERSONA);
				request.getSession().setAttribute("axisctr_listaPolizas", consultaPolizaReturn);
			} else {
				// Qu� importa esto! No llenaremos el log de debugs por paginaci�n!
				// logger.debug("axisctr019 paginando");
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr008Service - m�todo m_buscar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE ACTUALIZACION
	 ********************************************/
	/*********************************************************************************************************************/
	/**
	 * M�todo que se llama cuando se selecciona una p�liza.
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_aceptar(HttpServletRequest request, Axisrmb008Action thisAction) {
		logger.debug("Axisctr008Service m_aceptar");
		try {
			List listaPolizas = (List) request.getSession().getAttribute("axisctr_listaPolizas");
			logger.debug(listaPolizas);
			String SPOLIZA = getCampoTextual(request, "SPOLIZA");
			String SSEGURO = getCampoTextual(request, "SSEGURO");
			String num_riesgo = getCampoTextual(request, "num_riesgo");

			if (!isEmpty(listaPolizas) && !isEmpty(SPOLIZA)) {
				Map poliza = getObjetoDeLista(listaPolizas, SPOLIZA, "idPoliza");
				if (!isEmpty(poliza)) {
					request.getSession().setAttribute("axisctr_poliza", poliza);

				}
			}
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr008Service - m�todo m_aceptar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

	/**
	 * M�todo que se llama al cerrar el modal.
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_cerrar(HttpServletRequest request, Axisrmb008Action thisAction) {
		logger.debug("Axisctr008Service m_cerrar");
		try {
			request.getSession().removeAttribute("axisctr_listaPolizas");
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr008Service - m�todo m_cerrar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}
}