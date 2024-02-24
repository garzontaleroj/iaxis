package axis.service.axis;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_PENSIONES;
import axis.mvc.control.axis.Axispen002Action;
import axis.mvc.model.UsuarioBean;
import axis.util.Constantes;

public class Axispen002Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	public void m_init(HttpServletRequest request, Axispen002Action thisAction) {
		logger.debug("Axispen002Service m_init");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		try {

		} catch (Exception e) {
			logger.error("Error en el servicio Axispen002Service - m�todo m_init", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
	}

	public void m_form(HttpServletRequest request, Axispen002Action thisAction) {
		logger.debug("Axispen002Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {
			BigDecimal pCCODGES = getCampoNumerico(request, "CCODGES");

			if (pCCODGES != null) {
				PAC_IAX_PENSIONES pacIaxPen = new PAC_IAX_PENSIONES(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

				Map map = pacIaxPen.ejecutaPAC_IAX_PENSIONES__F_GET_CODGESTORAS(pCCODGES, null, null, null);
				logger.debug(map);
				// Si la crida retorna error llencem excepcio.
				if (((BigDecimal) (tratarRETURNyMENSAJES(request, map))).compareTo(new BigDecimal(0)) != 0) {
					throw new Exception();
				}
				// Preparem llista de gestores
				ArrayList listaGestoras = (ArrayList<Map>) map.get("CODGESTORAS");
				logger.debug(listaGestoras);
				formdata.put("AXIS_GESTORAS", listaGestoras);
				ArrayList listaFondos = new ArrayList();
				ArrayList listaPlan = new ArrayList();
				// Si la llista de gestores no es buida
				if (listaGestoras.size() != 0) {
					// Preparem llista fondos
					listaFondos = (ArrayList) ((HashMap) ((HashMap) listaGestoras.get(0)).get("OB_IAX_GESTORAS"))
							.get("FONPENSIONES");
					logger.debug(listaFondos);
					// Si la llista de fondos no es buida
					if (listaFondos.size() != 0) {
						// Preparem llista planes
						listaPlan = (ArrayList) ((HashMap) ((HashMap) listaFondos.get(0)).get("OB_IAX_FONPENSIONES"))
								.get("PLANPENSIONES");
						logger.debug(listaPlan);
					}
				}
				formdata.put("listaFondos", listaFondos);
				formdata.put("listaPlan", listaPlan);
			}
			if (formdata.get("NCONTADORX") == null) {
				formdata.put("NCONTADORX", 0);
				formdata.put("NCONTADOR", 0);

			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axispen002Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
	}

}