package axis.service.modal;

import java.math.BigDecimal;
import java.sql.Connection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_COMPANIAS;
import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

public class Axismnt022Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	public void m_init(HttpServletRequest request, AbstractDispatchAction thisAction) {
		logger.debug("Axismnt022Service m_init");
		this.formattingNumericValues(request);
		try {

		} catch (Exception e) {
			logger.error("Error en el servicio Axismnt022Service - m�todo m_init", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
	}

	public void m_form(HttpServletRequest request, AbstractDispatchAction thisAction) {
		logger.debug("Axismnt022Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		this.formattingNumericValues(request);
		try {
			BigDecimal CCOMPANI = getCampoNumerico(request, "CCOMPANI");
			PAC_IAX_COMPANIAS pac_iax_companias = new PAC_IAX_COMPANIAS(
					(Connection) request.getAttribute(Constantes.DB01CONN));
			Map map = pac_iax_companias.ejecutaPAC_IAX_COMPANIAS__F_GET_INDICADORES_CIAS(CCOMPANI);
			logger.debug(map);
			List listaIndicadoresCta = (List) this.tratarRETURNyMENSAJES(request, map, false);
			request.setAttribute("listaIndicadoresCta", listaIndicadoresCta);
		} catch (Exception e) {
			logger.error("Error en el servicio Axismnt022Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
	}

	private void cargarListas(HttpServletRequest request) throws Exception {
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map listValores = new HashMap();
		// Carga de las PAC_IAX PL/SQL
		PAC_IAX_LISTVALORES pac_axis_listValores = new PAC_IAX_LISTVALORES(
				(Connection) request.getAttribute(Constantes.DB01CONN));

	}

	public void m_delete(HttpServletRequest request, AbstractDispatchAction thisAction) {
		logger.debug("Axismnt022Service m_delete");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {
			BigDecimal CCOMPANI = getCampoNumerico(request, "CCOMPANI");
			BigDecimal CTIPIND = getCampoNumerico(request, "CTIPIND");
			java.sql.Date FINIVIG = stringToSqlDate(getCampoTextual(request, "FINIVIG"));

			java.util.Date currentDate = new java.util.Date();
			java.sql.Date FFINVIG = new java.sql.Date(currentDate.getTime());

			PAC_IAX_COMPANIAS pac_iax_companias = new PAC_IAX_COMPANIAS(
					(Connection) request.getAttribute(Constantes.DB01CONN));
			pac_iax_companias.ejecutaPAC_IAX_COMPANIAS__F_SET_INDICADOR_CIA(CCOMPANI, CTIPIND, null, FINIVIG, FFINVIG,
					null, null);

		} catch (Exception e) {
			logger.error("Error en el servicio Axismnt022Service - m�todo m_delete", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
	}

	public void m_edit(HttpServletRequest request, AbstractDispatchAction thisAction) {
		logger.debug("Axismnt022Service m_delete");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {
			BigDecimal CCOMPANI = getCampoNumerico(request, "CCOMPANI");
			BigDecimal CTIPIND = getCampoNumerico(request, "CTIPIND");
			java.sql.Date FINIVIG = stringToSqlDate(getCampoTextual(request, "FINIVIG"));
			BigDecimal CENVIOSAP = getCampoNumerico(request, "CENVIOSAP");

			PAC_IAX_COMPANIAS pac_iax_companias = new PAC_IAX_COMPANIAS(
					(Connection) request.getAttribute(Constantes.DB01CONN));
			pac_iax_companias.ejecutaPAC_IAX_COMPANIAS__F_SET_INDICADOR_CIA(CCOMPANI, CTIPIND, null, FINIVIG, null,
					CENVIOSAP, null);

		} catch (Exception e) {
			logger.error("Error en el servicio Axismnt022Service - m�todo m_delete", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
	}

}
