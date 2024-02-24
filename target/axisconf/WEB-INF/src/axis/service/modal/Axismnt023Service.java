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
import axis.mvc.control.modal.Axismnt023Action;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

/**
 * Axismnt023Service.java 06/03/2009
 * 
 * @since Java 5.0
 */
@SuppressWarnings("all")
public class Axismnt023Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE INICIALIZACION
	 *******************************************/

	/**
	 */
	public

			void m_init(HttpServletRequest request, Axismnt023Action thisAction) {
		logger.debug("Axismnt023Service m_init");
		this.formattingNumericValues(request);
		try {

			String cmodo = this.getCampoTextual(request, "CMODO");

			if (cmodo.equals("1")) {
				AbstractDispatchAction.topPila(request, "CMODO", "ALTA");
			} else if (cmodo.equals("0")) {
				AbstractDispatchAction.topPila(request, "CMODO", "MODIFICACION");
			} else if (cmodo.equals("2"))
				AbstractDispatchAction.topPila(request, "CMODO", "CONSULTA");

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr081Service - m�todo m_init", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);

		}
		this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
	}

	/**
	 * 
	 * @param request
	 */
	public void m_form(HttpServletRequest request, Axismnt023Action thisAction) {
		logger.debug("Axismnt023Service m_form");
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {
			BigDecimal CCOMPANI = getCampoNumerico(request, "CCOMPANI");

			PAC_IAX_COMPANIAS pac_iax_companias = new PAC_IAX_COMPANIAS(
					(Connection) request.getAttribute(Constantes.DB01CONN));
			Map map = pac_iax_companias.ejecutaPAC_IAX_COMPANIAS__F_GET_INDICADOR_CIA(CCOMPANI, null, null);
			logger.debug(map);

			HashMap m2 = (HashMap) tratarRETURNyMENSAJES(request, map, false);
			formdata.putAll(m2);
			formdata.put("CCOMPANI", CCOMPANI);
			formdata.put("CENVIOSAP", 0);

			this.cargarlistas(request, thisAction);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr081Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {

			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	private void cargarlistas(HttpServletRequest request, Axismnt023Action thisAction) throws Exception {
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		Map listValores = new HashMap();

		PAC_IAX_COMPANIAS pac_iax_companias = new PAC_IAX_COMPANIAS(
				(Connection) request.getAttribute(Constantes.DB01CONN));
		PAC_IAX_LISTVALORES pac_iax_listvalores = new PAC_IAX_LISTVALORES(
				(Connection) request.getAttribute(Constantes.DB01CONN));

		Map m = pac_iax_companias.ejecutaPAC_IAX_COMPANIAS__F_GET_TINDICADORESCIA();
		logger.debug(m);
		listValores.put("lstTiposIndicadores", (List) tratarRETURNyMENSAJES(request, m));

		m = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_CAPLICAINDICADORCIA();
		logger.debug(m);
		listValores.put("lstCAplicaInd", (List) tratarRETURNyMENSAJES(request, m));

		formdata.put("listvalores", listValores);
	}

	/**
	 * 
	 * @param request
	 */
	public void m_guardar(HttpServletRequest request, Axismnt023Action thisAction) {
		logger.debug("Axismnt023Action m_guardar");

		try {
			BigDecimal CCOMPANI = getCampoNumerico(request, "CCOMPANI");
			BigDecimal CTIPIND = getCampoNumerico(request, "CTIPIND");
			BigDecimal NVALOR = getCampoNumerico(request, "NVALOR");
			java.sql.Date FINIVIG = stringToSqlDate(getCampoTextual(request, "FINIVIG"));
			BigDecimal CENVIOSAP = getCampoNumerico(request, "CENVIOSAP");
			BigDecimal CAPLICA = getCampoNumerico(request, "CAPLICA");

			PAC_IAX_COMPANIAS pac_iax_companias = new PAC_IAX_COMPANIAS(
					(Connection) request.getAttribute(Constantes.DB01CONN));
			pac_iax_companias.ejecutaPAC_IAX_COMPANIAS__F_SET_INDICADOR_CIA(CCOMPANI, CTIPIND, NVALOR, FINIVIG, null,
					CENVIOSAP, CAPLICA);

			cargarlistas(request, thisAction);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr081Service - m�todo m_guardar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));

		}
	}

}
