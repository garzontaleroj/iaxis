package axis.service.modal;

import java.math.BigDecimal;
import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_CONTABILIDAD;
import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.control.modal.Axisadm083Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

/**
 * Axisadm083Service.java 22/02/10
 * 
 * @author <a href="jdelrio@csi-ti.com">Javi del Rio</a>
 * @since Java 5.0
 */

public class Axisadm083Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE INICIALIZACION
	 *******************************************/
	/*********************************************************************************************************************/

	public void m_init(HttpServletRequest request, Axisadm083Action thisAction) {
		logger.debug("Axisadm083Service m_init");
		try {

		} catch (Exception e) {
			logger.error("Error en el servicio axisadm083Service - m�todo m_init", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

	/**
	 * Comentarios
	 * 
	 * @param request    El HttpServletRequest que contiene la petici�n del cliente
	 *                   web.
	 * @param thisAction Una Action abstracta desde donde se ha invocado el servicio
	 *                   (necesaria para el log).
	 */
	public void m_form(HttpServletRequest request, Axisadm083Action thisAction) {
		logger.debug("Axisadm083Service m_form");
		try {
			UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
			Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
			// Lista empresas
			Map map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTEMPRESAS();
			logger.debug(map);

			List empresas = (List) tratarRETURNyMENSAJES(request, map);
			request.setAttribute("EMPRESAS", empresas);

			if (empresas.size() == 1) {
				formdata.put("EMPRESA", ((HashMap) empresas.get(0)).get("CEMPRES"));
			}
		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm083Service - m�todo m_form", e);
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
	 * M�todo que realiza la b�squeda de productos en funci�n de los par�metros de
	 * filtro seleccionados.
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_aceptar(HttpServletRequest request, Axisadm083Action thisAction) {
		logger.debug("Axisadm083Service m_aceptar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {

			BigDecimal SINTERF = getHiddenCampoNumerico(request, "SINTERF");
			BigDecimal TTIPPAG = getHiddenCampoNumerico(request, "TTIPPAG");
			BigDecimal IDPAGO = getHiddenCampoNumerico(request, "IDPAGO");
			Date FCONTA = stringToSqlDate(getCampoTextual(request, "FCONTA"));
			BigDecimal NASIENT = getHiddenCampoNumerico(request, "NASIENT");
			BigDecimal NLINEA = getHiddenCampoNumerico(request, "NLINEA");
			String CCUENTA = getCampoTextual(request, "CCUENTA");
			String CCOLETILLA = getCampoTextual(request, "CCOLETILLA");
			String TAPUNTE = getCampoTextual(request, "TAPUNTE");
			BigDecimal IAPUNTE = getHiddenCampoNumerico(request, "IAPUNTE");
			String TDESCRI = getCampoTextual(request, "TDESCRI");
			Date FEFEADM = stringToSqlDate(getCampoTextual(request, "FEFEADM"));
			String OTROS = getCampoTextual(request, "OTROS");
			String CENLACE = getCampoTextual(request, "CENLACE");
			BigDecimal CEMPRES = getHiddenCampoNumerico(request, "CEMPRES");
			BigDecimal CPROCES = getHiddenCampoNumerico(request, "CPROCES");
			BigDecimal CPAIS = getHiddenCampoNumerico(request, "CPAIS");

			Date FTRASPASO = stringToSqlDate(getCampoTextual(request, "FTRASPASO"));
			String CLAVEASI = getCampoTextual(request, "CLAVEASI");
			String TIPODIARIO = getCampoTextual(request, "TIPODIARIO");
			Date FASIENTO = stringToSqlDate(getCampoTextual(request, "FASIENTO"));

			PAC_IAX_CONTABILIDAD pac_iax_contabilidad = new PAC_IAX_CONTABILIDAD(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map map = pac_iax_contabilidad.ejecutaPAC_IAX_CONTABILIDAD__F_SET_APUNTEMANUAL(SINTERF, TTIPPAG, IDPAGO,
					FCONTA, NASIENT, NLINEA, CCUENTA, CCOLETILLA, TAPUNTE, IAPUNTE, TDESCRI, FEFEADM, OTROS, CENLACE,
					CEMPRES, CPROCES, CPAIS, FTRASPASO, CLAVEASI, TIPODIARIO, FASIENTO);

			logger.debug("map " + map);

			// tratarRETURNyMENSAJES(request,map);

			if (((BigDecimal) tratarRETURNyMENSAJES(request, map)).equals(BigDecimal.ZERO)) {
				request.setAttribute("OK_acceptar", 1);
			}

			// formdata.put("LISTAAPUNTES", desc);
		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm081Service - m�todo m_buscar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));

		}
	}

}
