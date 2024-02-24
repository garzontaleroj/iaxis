package axis.service.axis;

import java.math.BigDecimal;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_LISTASRESTRINGIDA;
import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.control.axis.Axisctr211Action;
import axis.mvc.model.UsuarioBean;
import axis.util.Constantes;

/**
 * Axisctr148Service.java
 * 
 * @author <a href="mailto:amartinez@csi-ti.com">Alex Martinez</a>
 */
public class Axisctr211Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());
	SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");

	/*********************************************************************************************************************/
	/*****************************************
	 * W****** M�TODOS DE INICIALIZACION
	 *******************************************/

	/*********************************************************************************************************************/
	public

			void m_init(HttpServletRequest request, Axisctr211Action thisAction) {
		logger.debug("Axisctr211Service m_init");
		try {
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr211Service - m�todo m_init", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

	public void m_form(HttpServletRequest request, Axisctr211Action thisAction) {
		logger.debug("Axisctr211Service m_form");
		try {

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr211Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			// Gesti�n de campos y dependencias
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	public void m_buscar(HttpServletRequest request, Axisctr211Action thisAction) {
		logger.debug("Axisctr211Service m_buscar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {
			if (formdata.get("paginar") == null) {

				String CMATRIC = getCampoTextual(request, "CMATRIC");
				String CODMOTOR = getCampoTextual(request, "CODMOTOR");
				String CCHASIS = getCampoTextual(request, "CCHASIS");
				String NBASTID = getCampoTextual(request, "NBASTID");
				BigDecimal CCLALIS = getCampoNumerico(request, "CCLALIS");
				BigDecimal CTIPLIS = getCampoNumerico(request, "CTIPLIS");
				Date FINCLUSDESDE = stringToSqlDate(getCampoTextual(request, "FINCLUSDESDE"));
				Date FINCLUSHASTA = stringToSqlDate(getCampoTextual(request, "FINCLUSHASTA"));
				Date FEXCLUSDESDE = stringToSqlDate(getCampoTextual(request, "FEXCLUSDESDE"));
				Date FEXCLUSHASTA = stringToSqlDate(getCampoTextual(request, "FEXCLUSHASTA"));
				BigDecimal PSMATRICLRE_OUT = getCampoNumerico(request, "PSMATRICLRE_OUT");

				Map map = new PAC_IAX_LISTASRESTRINGIDA((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_LISTASRESTRINGIDA__F_GET_LISTARESTRINGIDA_AUT(CMATRIC, CODMOTOR, CCHASIS,
								NBASTID, CCLALIS, CTIPLIS, FINCLUSDESDE, FINCLUSHASTA, FEXCLUSDESDE, FEXCLUSHASTA,
								PSMATRICLRE_OUT);
				logger.debug("-->lista:" + map);
				tratarRETURNyMENSAJES(request, map);
				formdata.put("listasRes", map.get("RETURN"));
				request.getSession().setAttribute("listasRes", map.get("RETURN"));

			} else {
				// Qu� importa esto! No llenaremos el log de debugs por paginaci�n!
				// logger.debug("Axiscomi004 paginando");
			}

		} catch (Exception e) {

			logger.error("Error en el servicio Axiscomi004Service - m�todo m_buscar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {

			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	private void cargarDatosCombos(HttpServletRequest request) throws Exception {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		// Lista retenidos
		Map map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(108));
		logger.debug(map);
		request.setAttribute("RETENIDO", (List) tratarRETURNyMENSAJES(request, map));

		// Gesti�n de campos y dependencias
		this.f_Cargar_Propiedades_Pantalla(request, whoami(this));

	}

	public BigDecimal m_consulta_persona(HttpServletRequest request, Axisctr211Action thisAction) {
		logger.debug("Axisctr211Service m_consulta_persona");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		BigDecimal SPERSON = this.getCampoNumerico(request, "SPERSON_CON");
		try {
			// BigDecimal SSEGURO = this.getCampoNumerico(request, "SSEGURO_CON");
			logger.debug(SPERSON);
			// formdata.put("SSEGURO_axisctr202", SSEGURO);
			// thisAction.topPila(request, "formdata_axisctr202", formdata);
			return SPERSON;

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr211Service - m�todo m_consulta_persona", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);

			return SPERSON;

		}
		// this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	public void m_volver_per(HttpServletRequest request, Axisctr211Action thisAction) {
		logger.debug("Axisctr211Service m_volver_per");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {

			Map formdata_axisctr202 = (Map) AbstractDispatchAction.removeTopPila(request, "formdata_axisctr020");

			if (!this.isEmpty(formdata_axisctr202)) {
				formdata.putAll(formdata_axisctr202);
				// formdata.put("SSEGURO_CON", formdata.get("SSEGURO_axisctr202"));
				request.setAttribute(Constantes.FORMDATA, formdata);
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr211Service - m�todo m_volver_per", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

}
