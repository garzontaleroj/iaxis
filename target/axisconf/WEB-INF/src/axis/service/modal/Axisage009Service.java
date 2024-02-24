package axis.service.modal;

import java.math.BigDecimal;
import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_CAMPANAS;
import axis.mvc.control.AbstractDispatchAction;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

/**
 */
public class Axisage009Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	public Axisage009Service() {
		super();
	}

	/**
	 * Carga formulario
	 * 
	 * @param request
	 */
	public void m_form(HttpServletRequest request) {
		logger.debug("Axisage009Service m_form");
		PAC_IAX_CAMPANAS pac_iax_campanas = new PAC_IAX_CAMPANAS(
				(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
		Map LSTVALORES = new HashMap();
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {
			/* LISTVALORES */
			Map map = pac_iax_campanas.ejecutaPAC_IAX_CAMPANAS__F_GET_ESTADOCAMPANA();
			LSTVALORES.put("LSTESTADOS", tratarRETURNyMENSAJES(request, map));
			formdata.put("LSTVALORES", LSTVALORES);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisage009Service - m�todo m_form", e);
			AbstractDispatchAction.guardarMensaje(request,
					"verbatim:<b>" + e.getClass().getName() + ":</b> " + e.getLocalizedMessage(),
					new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}

	/**
	 * Busca seg�n criterios de b�squeda
	 * 
	 * @param request
	 */
	public void m_buscar(HttpServletRequest request) {
		logger.debug("Axisage009Service m_form");
		PAC_IAX_CAMPANAS pac_iax_campanas = new PAC_IAX_CAMPANAS(
				(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
		List T_IAX_CAMPANAS = new ArrayList();

		BigDecimal pPCCODIGO = getCampoNumerico(request, "CCODIGO");
		String pPCESTADO = getCampoTextual(request, "CESTADO");
		Date pPFINICAM = stringToSqlDate(getHiddenCampoTextual(request, "FINICAM"));
		Date pPFFINCAM = stringToSqlDate(getHiddenCampoTextual(request, "FFINCAM"));

		try {
			Map map = pac_iax_campanas.ejecutaPAC_IAX_CAMPANAS__F_BUSCAR(pPCCODIGO, pPCESTADO, pPFINICAM, pPFFINCAM);

			logger.debug(map);
			if (BigDecimal.ZERO.equals(tratarRETURNyMENSAJES(request, map))) {
				T_IAX_CAMPANAS.add(map.get("PTCAMPANAS"));
				request.setAttribute("T_IAX_CAMPANAS",
						(T_IAX_CAMPANAS != null && T_IAX_CAMPANAS.size() > 0) ? T_IAX_CAMPANAS.get(0)
								: new ArrayList());
			}
		} catch (Exception e) {
			logger.error("Error en el servicio Axisage009Service - m�todo m_buscar", e);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}
}
