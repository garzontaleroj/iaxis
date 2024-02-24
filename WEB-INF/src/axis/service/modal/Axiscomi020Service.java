package axis.service.modal;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_COMISIONES;
import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.control.modal.Axiscomi020Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

/**
 * Axiscomi020Service.java 19/05/2015
 * 
 * @author <a href="igil@csi-ti.com">Ivan Gil</a>
 * @since Java 5.0
 */
public class Axiscomi020Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	public void m_form(HttpServletRequest request, Axiscomi020Action thisAction) {
		logger.debug("Axiscomi020Service m_form");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {

			this.cargarCombos(request);

			if ("axis.isNew".equals(request.getParameter("CEMPRES"))) {
				formdata.put("isNewUser", "true");
			}

			if (!"true".equals(formdata.get("isNewUser"))) {

				PAC_IAX_COMISIONES pacIaxComisiones = new PAC_IAX_COMISIONES(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

				BigDecimal PCEMPRES = getCampoNumerico(request, "CEMPRES");
				BigDecimal PMMES_I = getCampoNumerico(request, "NMES_I");
				BigDecimal PMMES_F = getCampoNumerico(request, "NMES_F");
				BigDecimal PPANULAC = getCampoNumerico(request, "PANULAC");
				Map map = pacIaxComisiones.ejecutaPAC_IAX_COMISIONES__F_GET_CONFCLAWBACK(PCEMPRES, PMMES_I, PMMES_F,
						PPANULAC);

				if (BigDecimal.ZERO.equals(tratarRETURNyMENSAJES(request, map, false))) {
					Map OB_IAX_PRETCOMI = (Map) map.get("RETURN");
					if (!isEmpty(OB_IAX_PRETCOMI))
						formdata.putAll(OB_IAX_PRETCOMI);

				}
			}
		} catch (Exception e) {
			logger.error("Error en el servicio Axiscomi020Service - m�todo m_form", e);
			AbstractDispatchAction.guardarMensaje(request, "1000050", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}

		finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}

	/**
	 * M�todo de inicializaci�n de los campos de formulario: usuario y lista de
	 * idiomas.
	 * 
	 * @param request
	 * @throws Exception
	 */
	private void cargarCombos(HttpServletRequest request) {
		logger.debug("Axiscomi020Service cargarCombos");
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
			logger.error("Error en el servicio Axiscomi020Service - m�todo cargarCombos", e);
			AbstractDispatchAction.guardarMensaje(request, "1000050", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}

	}

	public void m_aceptar(HttpServletRequest request, Axiscomi020Action thisAction) {
		logger.debug("Axiscomi020Action m_aceptar");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {

			PAC_IAX_COMISIONES pacIaxComisiones = new PAC_IAX_COMISIONES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			BigDecimal PCEMPRES = getCampoNumerico(request, "CEMPRES");
			BigDecimal PMMES_I = getCampoNumerico(request, "NMES_I");
			BigDecimal PMMES_F = getCampoNumerico(request, "NMES_F");
			BigDecimal PPANULAC = getCampoNumerico(request, "PANULAC");
			if (!"true".equals(formdata.get("isNewUser"))) {
				BigDecimal PCEMPRES_OLD = getCampoNumerico(request, "CEMPRES_OLD");
				BigDecimal PMMES_I_OLD = getCampoNumerico(request, "NMES_I_OLD");
				BigDecimal PMMES_F_OLD = getCampoNumerico(request, "NMES_F_OLD");
				BigDecimal PPANULAC_OLD = getCampoNumerico(request, "PANULAC_OLD");
				Map map = pacIaxComisiones.ejecutaPAC_IAX_COMISIONES__F_UPD_CONFCLAWBACK(PCEMPRES, PMMES_I_OLD, PMMES_I,
						PMMES_F_OLD, PMMES_F, PPANULAC_OLD, PPANULAC);
				logger.debug(map);
				if (BigDecimal.ZERO.equals(tratarRETURNyMENSAJES(request, map, false))) {
					request.setAttribute("grabarOK", true);
				}
			} else {
				Map map = pacIaxComisiones.ejecutaPAC_IAX_COMISIONES__F_INS_CONFCLAWBACK(PCEMPRES, PMMES_I, PMMES_F,
						PPANULAC);
				logger.debug(map);

				if (BigDecimal.ZERO.equals(tratarRETURNyMENSAJES(request, map, false))) {
					request.setAttribute("grabarOK", true);
				}

			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axiscomi020Service - m�todo m_aceptar", e);
			AbstractDispatchAction.guardarMensaje(request, "1000050", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this.getClass()));
		}
	}

}
