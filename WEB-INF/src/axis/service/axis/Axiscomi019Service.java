package axis.service.axis;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_COMISIONES;
import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.control.axis.Axiscomi019Action;
import axis.mvc.model.UsuarioBean;
import axis.util.Constantes;

/**
 * Axiscomi019Service.java 19/05/2015
 * 
 * @author <a href="igil@csi-ti.com">Ivan Gil</a>
 * @since Java 5.0
 */
public class Axiscomi019Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	public void m_form(HttpServletRequest request, Axiscomi019Action thisAction) {
		logger.debug("Axiscomi019Service m_form");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {
			Map LSTVALORES = new HashMap();

			/* LISTVALORES */
			PAC_IAX_LISTVALORES pac_iax_listvalores = new PAC_IAX_LISTVALORES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map LISTVALORES = new HashMap();

			/* LSTEMPRESAS */
			Map map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTEMPRESAS();
			logger.debug(map);
			LISTVALORES.put("LSTEMPRESAS", tratarRETURNyMENSAJES(request, map, false));

			formdata.put("LISTVALORES", LISTVALORES);

		} catch (Exception e) {
			logger.error("Error en el servicio Axiscomi019Service - m�todo m_form", e);
			AbstractDispatchAction.guardarMensaje(request, "1000050", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);

		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}

	}

	public void m_buscar(HttpServletRequest request, Axiscomi019Action thisAction) {
		logger.debug("Axiscomi019Service m_buscar");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {

			PAC_IAX_COMISIONES pacIaxComisiones = new PAC_IAX_COMISIONES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			BigDecimal PCEMPRES = getCampoNumerico(request, "CEMPRESA");
			BigDecimal PMMES_I = getCampoNumerico(request, "NMES_I");
			BigDecimal PMMES_F = getCampoNumerico(request, "NMES_F");
			BigDecimal PPANULAC = getCampoNumerico(request, "PANULAC");
			Map map = pacIaxComisiones.ejecutaPAC_IAX_COMISIONES__F_GET_CONFCLAWBACK(PCEMPRES, PMMES_I, PMMES_F,
					PPANULAC);
			logger.debug(map);
			formdata.put("LSTPRETCOMI", tratarRETURNyMENSAJES(request, map, false));

		} catch (Exception e) {
			logger.error("Error en el servicio Axiscomi019Service  -  m_buscar", e);
			AbstractDispatchAction.guardarMensaje(request, "1000050", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);

		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}

	}

	public void m_borrar(HttpServletRequest request, Axiscomi019Action thisAction) {
		logger.debug("Axiscomi019Service m_borrar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {
			PAC_IAX_COMISIONES pacIaxComisiones = new PAC_IAX_COMISIONES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			BigDecimal PCEMPRES = getCampoNumerico(request, "SEL_CEMPRESA");
			BigDecimal PMMES_I = getCampoNumerico(request, "SEL_NMES_I");
			BigDecimal PMMES_F = getCampoNumerico(request, "SEL_NMES_F");
			BigDecimal PPANULAC = getCampoNumerico(request, "SEL_PANULAC");
			Map map = pacIaxComisiones.ejecutaPAC_IAX_COMISIONES__F_DEL_CONFCLAWBACK(PCEMPRES, PMMES_I, PMMES_F,
					PPANULAC);
			logger.debug(map);
			request.removeAttribute("SEL_CEMPRESA");
			request.removeAttribute("SEL_NMES_I");
			request.removeAttribute("SEL_NMES_F");
			request.removeAttribute("SEL_PANULAC");
			formdata.remove("SEL_CEMPRESA");
			formdata.remove("SEL_NMES_I");
			formdata.remove("SEL_NMES_F");
			formdata.remove("SEL_PANULAC");
			tratarRETURNyMENSAJES(request, map, false);

			if (map.get("RETURN").equals(new BigDecimal(0))) {
				formdata.put("OK", 0);
			} else
				formdata.put("OK", 1);
		} catch (Exception e) {
			logger.error("Error en el servicio Axiscomi019Service - m�todo m_borrar", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}

}