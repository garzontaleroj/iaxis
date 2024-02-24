package axis.service.axis;

import java.math.BigDecimal;
import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_CAJA;
import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.jdbc.PAC_IAX_PROF;
import axis.mvc.control.axis.Axiscaj008Action;
import axis.util.Constantes;

public class Axiscaj008Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	public void m_form(HttpServletRequest request, Axiscaj008Action thisAction) {
		logger.debug("Axiscaj008Service m_load_data");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		PAC_IAX_PROF pac_iax_prof = new PAC_IAX_PROF((java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
		try {
			this.cargarDatos(request, thisAction, formdata);
		} catch (Exception e) {
			logger.error("Error en el servicio axiscaj008Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	private void cargarDatos(HttpServletRequest request, Axiscaj008Action thisAction, Map formdata) throws Exception {
		try {
			PAC_IAX_LISTVALORES pac_iax_listvalores = new PAC_IAX_LISTVALORES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(481));
			logger.debug(map);
			List LSTCMEDMOV = (List) tratarRETURNyMENSAJES(request, map, false);
			formdata.put("LSTCMEDMOV", LSTCMEDMOV);

			map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(482));
			logger.debug(map);
			List LSTCTIPMOV = (List) tratarRETURNyMENSAJES(request, map, false);
			formdata.put("LSTCTIPMOV", LSTCTIPMOV);
		} catch (Exception e) {
			logger.error("Error en el m�todo Axiscaj008Service.cargarDatos", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	public void m_busqueda_movimientos(HttpServletRequest request, Axiscaj008Action thisAction, BigDecimal STARIFA) {
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {
			String CUSUARI = request.getParameter("CUSUARI");
			logger.debug("++++CUSUARI: " + CUSUARI);

			Date pFFECMOV_INI = this.stringToSqlDate(this.getCampoTextual(request, "FINICIO"));
			logger.debug("++++pFFECMOV_INI: " + pFFECMOV_INI);

			Date pFFECMOV_FIN = this.stringToSqlDate(this.getCampoTextual(request, "FFIN"));
			logger.debug("++++pFFECMOV_FIN: " + pFFECMOV_FIN);

			// ini Bug 0032660/0190245 - 12/11/2014 - JMF
			BigDecimal CTIPMOV = this.stringToBigDecimal(this.getCampoTextual(request, "CTIPMOV"));
			if (CTIPMOV != null) {
				if (CTIPMOV.compareTo(new BigDecimal(0)) < 0) {
					CTIPMOV = null;
				}
			}
			// BigDecimal CTIPMOV = null;
			// if (request.getParameter("CTIPMOV")!=null){
			// CTIPMOV = new BigDecimal(request.getParameter("CTIPMOV"));
			// if (CTIPMOV.compareTo(new BigDecimal(0))<0){
			// CTIPMOV = null;
			// }
			// }
			logger.debug("++++CTIPMOV: " + CTIPMOV);

			// ini Bug 0032660/0190245 - 12/11/2014 - JMF
			BigDecimal CMEDMOV = this.stringToBigDecimal(this.getCampoTextual(request, "CMEDMOV"));
			if (CMEDMOV != null) {
				if (CMEDMOV.compareTo(new BigDecimal(0)) < 0) {
					CMEDMOV = null;
				}
			}
			// BigDecimal CMEDMOV = null;
			// if (request.getParameter("CMEDMOV")!=null){
			// CMEDMOV = new BigDecimal(request.getParameter("CMEDMOV"));
			// if (CMEDMOV.compareTo(new BigDecimal(0))<0){
			// CMEDMOV = null;
			// }
			// }
			logger.debug("++++CMEDMOV: " + CMEDMOV);

			if (formdata.get("paginar") == null) {
				request.getSession().removeAttribute("axiscaj008_listaMovimientos");

				Map map = new HashMap();
				PAC_IAX_CAJA pac_iax_caja = new PAC_IAX_CAJA(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

				map = pac_iax_caja.ejecutaPAC_IAX_CAJA__F_OBTENERMVTOCAJA(CUSUARI, pFFECMOV_INI, pFFECMOV_FIN, CTIPMOV,
						CMEDMOV);
				logger.debug(map);

				request.getSession().setAttribute("axiscaj008_listaMovimientos",
						(ArrayList) tratarRETURNyMENSAJES(request, map, false));

				this.cargarDatos(request, thisAction, formdata);
			}
		} catch (Exception e) {
			logger.error("Error", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}

		this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
	}
}
