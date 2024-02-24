package axis.service.modal;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_CONVENIOS_EMP;
import axis.jdbc.PAC_IAX_GESTIONBPM;
import axis.jdbc.PAC_IAX_SUPLEMENTOS;
import axis.mvc.control.modal.Axisctr025Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

public class Axisctr025Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE INICIALIZACION
	 *******************************************/
	/*********************************************************************************************************************/

	/**
	 * @param request    El HttpServletRequest que contiene la petici�n del cliente
	 *                   web.
	 * @param thisAction Una Action abstracta desde donde se ha invocado el servicio
	 *                   (necesaria para el log).
	 */
	public void m_form(HttpServletRequest request, Axisctr025Action thisAction) {
		logger.debug("Axisctr025Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {
			BigDecimal SSEGURO = getCampoNumerico(request, "SSEGURO");
			BigDecimal NMOVIMI = getCampoNumerico(request, "NMOVIMI");
			BigDecimal NCERTIF = getCampoNumerico(request, "NCERTIF");
			formdata.put("NCERTIF", NCERTIF);

			Map map = new PAC_IAX_SUPLEMENTOS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_SUPLEMENTOS__F_GET_DETAILMOV(SSEGURO, NMOVIMI);
			logger.debug(map);

			List T_IAX_DETMOVSEGURO = (List) tratarRETURNyMENSAJES(request, map);
			formdata.put("T_IAX_DETMOVSEGURO", T_IAX_DETMOVSEGURO);

			map = new PAC_IAX_GESTIONBPM((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_GESTIONBPM__F2_GET_CASO_BPM(SSEGURO, NMOVIMI);
			boolean mostrar = false;
			if (map.get("PMOSTRAR") != null)
				mostrar = ((BigDecimal) map.get("PMOSTRAR")).intValue() == 1 ? true : false;
			formdata.put("mostrar_bpm", mostrar);
			formdata.put("caso_bpm", tratarRETURNyMENSAJES(request, map));

			PAC_IAX_CONVENIOS_EMP pacIaxConveniosEmp = new PAC_IAX_CONVENIOS_EMP(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			Map tramos_regu = pacIaxConveniosEmp.ejecutaPAC_IAX_CONVENIOS_EMP__F_GET_TRAMOSREGUL(SSEGURO, NMOVIMI);
			logger.debug("tramos_regularizacion: " + tramos_regu);
			formdata.put("TRAMOS_REGU", tratarRETURNyMENSAJES(request, tramos_regu));

			Map asegurados_mes = pacIaxConveniosEmp.ejecutaPAC_IAX_CONVENIOS_EMP__F_DATOS_SUP_REGUL(SSEGURO, NMOVIMI);
			logger.debug("asegurados_mes: " + asegurados_mes);
			formdata.put("ASEGURADOS_MES", tratarRETURNyMENSAJES(request, asegurados_mes));

			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr025Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

}
