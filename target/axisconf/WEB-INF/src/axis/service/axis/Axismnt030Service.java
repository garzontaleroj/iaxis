package axis.service.axis;

import java.sql.Date;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_UTILES;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.control.axis.Axismnt030Action;
import axis.mvc.model.UsuarioBean;
import axis.util.Constantes;

/**
 * Axismnt030Action.java 01/12/2016
 * 
 * @author <a href="jaesteban@csi-ti.com">Johan Esteban</a>
 * @since Java 5.0
 */

public class Axismnt030Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	public void m_form(HttpServletRequest request, Axismnt030Action thisAction) {
		logger.debug("Axismnt030Service m_form");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
	}

	public void m_buscar(HttpServletRequest request, Axismnt030Action thisAction) {
		logger.debug("Axismnt030Service m_buscar");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {
			PAC_IAX_UTILES pacIaxHis = new PAC_IAX_UTILES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			String NOMBRETABLA = getCampoTextual(request, "NOMBRETABLA");
			String NOMBRECOLUMNA = getCampoTextual(request, "NOMBRECOLUMNA");
			String USUARIO = getCampoTextual(request, "USUARIO");
			Date FEFEPLAZO = stringToSqlDate(getCampoTextual(request, "FEFEPLAZO"));
			Date FECHAFIN = stringToSqlDate(getCampoTextual(request, "FECHAFIN"));

			Map map = pacIaxHis.ejecutaPAC_IAX_UTILES__F_GET_HISPROCESOSREA(NOMBRETABLA, NOMBRECOLUMNA, USUARIO,
					FEFEPLAZO, FECHAFIN);
			logger.debug(map);

			formdata.put("LSTHISREA", tratarRETURNyMENSAJES(request, map, false));

		} catch (Exception e) {
			logger.error("Error en el servicio Axismnt030Service  -  m_buscar", e);
			AbstractDispatchAction.guardarMensaje(request, "1000050", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}

	}
}