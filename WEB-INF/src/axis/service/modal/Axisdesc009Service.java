package axis.service.modal;

import java.math.BigDecimal;
import java.sql.Date;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_DESCUENTOS;
import axis.mvc.control.modal.Axisdesc009Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

//import axis.jdbc.PAC_IAX_LISTVALORES;

/**
 * Axisdesc009Service.java
 * 
 * @author <a href="mailto:amartinez@csi-ti.com">Alex Martinez</a>
 */
public class Axisdesc009Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE INICIALIZACION
	 *******************************************/
	/*********************************************************************************************************************/

	public void m_init(HttpServletRequest request, Axisdesc009Action thisAction) {
		logger.debug("Axisdesc009Service m_init");
		try {
			UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
			BigDecimal PCDESC = getCampoNumerico(request, "CDESC");
			Date FINIVIG = stringToSqlDate(getCampoTextual(request, "FINIVIG"));
			Date FFINVIG = stringToSqlDate(getCampoTextual(request, "FFINVIG"));
			Map map = new PAC_IAX_DESCUENTOS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_DESCUENTOS__F_GET_CUADRODESCUENTO(PCDESC, FINIVIG, FFINVIG);
			logger.debug("--->map:" + map);
			tratarRETURNyMENSAJES(request, map);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisdesc009Service - m�todo m_init", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

	public void m_form(HttpServletRequest request, Axisdesc009Action thisAction) {
		logger.debug("Axisdesc009Service m_form");
		try {

			UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
			Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

			BigDecimal PCDESC = getCampoNumerico(request, "CDESC");

			Map map = new PAC_IAX_DESCUENTOS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_DESCUENTOS__F_GET_OBJ_CUADRODESCUENTO(PCDESC);

			logger.debug("---> cuadro:" + map);
			Map cuadro = (Map) map.get("PCUADRODESCUENTO");

			formdata.put("PCDESC_ORI", cuadro.get("CDESC"));
			formdata.put("TCODIGO_ORIGINAL", cuadro.get("TDESC"));

			tratarRETURNyMENSAJES(request, map);
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		} catch (Exception e) {
			logger.error("Error en el servicio Axisdesc009Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

	public void m_aceptar(HttpServletRequest request, Axisdesc009Action thisAction) {
		logger.debug("Axisdesc009Service m_aceptar");
		try {

			UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
			Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

			BigDecimal PCDESC_ORI = getCampoNumerico(request, "PCDESC_ORI");
			BigDecimal PCDESC_NUEVO = getCampoNumerico(request, "PCDESC_NUEVO");
			String PTDESC_NUEVO = getCampoTextual(request, "PTDESC_NUEVO");

			Map map = new PAC_IAX_DESCUENTOS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_DESCUENTOS__F_DUPLICAR_CUADRO(PCDESC_ORI, PCDESC_NUEVO, PTDESC_NUEVO);

			logger.debug("---> duplicar:" + map);
			tratarRETURNyMENSAJES(request, map);
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
			if (map.get("RETURN").equals(new BigDecimal(0))) {
				formdata.put("OK", new BigDecimal(0));
			} else {
				formdata.put("OK", new BigDecimal(1));
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisdesc003Service - m�todo m_aceptar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}

	}

}
