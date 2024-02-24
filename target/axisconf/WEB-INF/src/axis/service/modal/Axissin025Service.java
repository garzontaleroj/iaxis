package axis.service.modal;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.jdbc.PAC_IAX_LISTVALORES_SIN;
import axis.jdbc.PAC_IAX_SINIESTROS;
import axis.mvc.control.modal.Axissin025Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

/**
 * Axissin025Service.java
 * 
 * @author <a href="mailto:xpastor@csi-ti.com">Xavi Pastor</a>
 */
public class Axissin025Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE INICIALIZACION
	 *******************************************/

	/**
	 */
	public

			void m_init(HttpServletRequest request, Axissin025Action thisAction) {
		try {

		} catch (Exception e) {
			logger.error("Error en el servicio Axissin025Service - m�todo m_init", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.configForm(request, whoami(this));
	}

	public void m_form(HttpServletRequest request, Axissin025Action thisAction) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {
			this.cargarCombos(request, thisAction);

			String isNew = getCampoTextual(request, "isNew");
			request.setAttribute("isNew", isNew);

			/*
			 * String isNew = this.getCampoTextual(request,"isNew");
			 * 
			 * if (!isEmpty(isNew) && isNew.equals("NO")){ PAC_IAX_SINIESTROS
			 * pac_axis_siniestros = new
			 * PAC_IAX_SINIESTROS((java.sql.Connection)request.getAttribute(Constantes.
			 * DB01CONN));
			 * 
			 * BigDecimal SCAUMOT = this.getCampoNumerico(request,"SCAUMOT"); BigDecimal
			 * SPRODUC = this.getCampoNumerico(request,"SPRODUC"); BigDecimal CACTIVI =
			 * this.getCampoNumerico(request,"CACTIVI"); BigDecimal CGARANT =
			 * this.getCampoNumerico(request,"CGARANT"); BigDecimal CTRAMIT =
			 * this.getCampoNumerico(request,"CTRAMIT");
			 * 
			 * Map map = pac_axis_siniestros.
			 * ejecutaPAC_IAX_SINIESTROS__F_GET_CAUMOT_PRODUCTE(SCAUMOT, SPRODUC,CACTIVI,
			 * CGARANT, CTRAMIT); logger.debug(map);
			 * 
			 * if (!isEmpty(tratarRETURNyMENSAJES(request, map)) && ((List)
			 * tratarRETURNyMENSAJES(request, map)).size() > 0 ){ List productos =
			 * (List)tratarRETURNyMENSAJES(request, map);
			 * formdata.put("productos",productos); }
			 * 
			 * 
			 * }
			 */

		} catch (Exception e) {
			logger.error("Error en el servicio axissin002Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.configForm(request, whoami(this));
	}

	private void cargarCombos(HttpServletRequest request, Axissin025Action thisAction) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		Map listValores = new HashMap();
		try {

			/* Recuperar lista de idiomas */
			PAC_IAX_LISTVALORES pacIaxListValores = new PAC_IAX_LISTVALORES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			PAC_IAX_LISTVALORES_SIN pacIaxListValores_sin = new PAC_IAX_LISTVALORES_SIN(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			Map m = new PAC_IAX_LISTVALORES_SIN((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES_SIN__F_GET_LSTPRODUCTOSSIN();
			logger.debug(m);
			listValores.put("lstproductos", tratarRETURNyMENSAJES(request, m));

			BigDecimal SPRODUC = this.getCampoNumerico(request, "SPRODUC");
			BigDecimal CACTIVI = this.getCampoNumerico(request, "CACTIVI");
			BigDecimal CGARANT = this.getCampoNumerico(request, "CGARANT");
			if (!isEmpty(SPRODUC)) {
				m = pacIaxListValores_sin.ejecutaPAC_IAX_LISTVALORES_SIN__F_GET_LSTACTIVIPRODSIN(SPRODUC);
				logger.debug(m);
				listValores.put("lstactividades", tratarRETURNyMENSAJES(request, m));
				if (!isEmpty(CACTIVI)) {
					m = pacIaxListValores_sin.ejecutaPAC_IAX_LISTVALORES_SIN__F_GET_LSTGARANSIN(SPRODUC, CACTIVI);
					logger.debug(m);
					listValores.put("lstgaranties", tratarRETURNyMENSAJES(request, m));
					if (!isEmpty(CGARANT)) {
						m = pacIaxListValores_sin.ejecutaPAC_IAX_LISTVALORES_SIN__F_GET_LSTTRAMISIN(SPRODUC, CACTIVI,
								CGARANT);
						logger.debug(m);
						listValores.put("lsttramitacions", tratarRETURNyMENSAJES(request, m));
					}
				}

			}
		} catch (Exception e) {
			logger.error("Error en el servicio Axissin025Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.configForm(request, whoami(this));
			formdata.put("listValores", listValores);
		}

	}

	/*********************************************************************************************************************/
	/************************************************
	 * M�TODOS DE ACTUALIZACI�N
	 *******************************************/
	/*********************************************************************************************************************/

	/**
	 * Realiza la b�squeda de un siniestro, dados los par�metros del formulario.
	 * Dichos par�metros pueden estar a null. Pone el resultado en una List en
	 * sesi�n llamada AXISSIN_LISTASINIESTROS.
	 * 
	 * @param request    El HttpServletRequest que contiene la petici�n del cliente
	 *                   web.
	 * @param thisAction Una Action abstracta desde donde se ha invocado el servicio
	 *                   (necesaria para el log).
	 */

	public void m_guardar(HttpServletRequest request, Axissin025Action thisAction) {
		// Recuperar siniestro a buscar
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {
			HashMap sessio = (HashMap) request.getSession().getAttribute("cabecera");

			BigDecimal SCAUMOT = new BigDecimal(String.valueOf(sessio.get("SCAUMOT")));
			BigDecimal SPRODUC = getCampoNumerico(request, "SPRODUC");
			BigDecimal CACTIVI = getCampoNumerico(request, "CACTIVI");
			BigDecimal CGARANT = getCampoNumerico(request, "CGARANT");
			BigDecimal CTRAMIT = getCampoNumerico(request, "CTRAMIT");

			if (formdata.get("paginar") == null) {
				PAC_IAX_SINIESTROS pac_axis_siniestros = new PAC_IAX_SINIESTROS(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
				Map map = pac_axis_siniestros.ejecutaPAC_IAX_SINIESTROS__F_SET_CAUMOT_PRODUCTE(SCAUMOT, SPRODUC,
						CACTIVI, CGARANT, CTRAMIT);
				logger.debug(map);
				if (BigDecimal.ZERO.equals(tratarRETURNyMENSAJES(request, map)))
					formdata.put("OK", "0");
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axissin025Service - m�todo m_guardar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			logger.debug("fin metodo");
			this.configForm(request, whoami(this));
		}
	}

}
