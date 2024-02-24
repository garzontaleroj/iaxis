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
import axis.mvc.control.modal.Axissin024Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

/**
 * Axissin024Service.java
 * 
 * @author <a href="mailto:xpastor@csi-ti.com">Xavi Pastor</a>
 */
public class Axissin024Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE INICIALIZACION
	 *******************************************/

	/**
	 */
	public

			void m_init(HttpServletRequest request, Axissin024Action thisAction) {
		try {

		} catch (Exception e) {
			logger.error("Error en el servicio Axissin024Service - m�todo m_init", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.configForm(request, whoami(this));
	}

	public void m_form(HttpServletRequest request, Axissin024Action thisAction) {
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

	private void cargarCombos(HttpServletRequest request, Axissin024Action thisAction) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		Map listValores = new HashMap();
		try {

			/* Recuperar lista de idiomas */
			PAC_IAX_LISTVALORES pacIaxListValores = new PAC_IAX_LISTVALORES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			PAC_IAX_LISTVALORES_SIN pacIaxListValores_sin = new PAC_IAX_LISTVALORES_SIN(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			Map m = pacIaxListValores_sin.ejecutaPAC_IAX_LISTVALORES_SIN__F_GET_LSTELEMENTO();
			logger.debug(m);
			listValores.put("lstelementos", tratarRETURNyMENSAJES(request, m, false));

			m = pacIaxListValores_sin.ejecutaPAC_IAX_LISTVALORES_SIN__F_GET_LSTFORMULA();
			logger.debug(m);
			listValores.put("lstformulas", tratarRETURNyMENSAJES(request, m, false));

			m = pacIaxListValores_sin.ejecutaPAC_IAX_LISTVALORES_SIN__F_GET_LSTCTIPDES();
			logger.debug(m);
			listValores.put("lsttipdest", tratarRETURNyMENSAJES(request, m, false));

		} catch (Exception e) {
			logger.error("Error en el servicio Axissin024Service - m�todo m_form", e);
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

	public void m_guardar(HttpServletRequest request, Axissin024Action thisAction) {
		// Recuperar siniestro a buscar
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {
			HashMap sessio = (HashMap) request.getSession().getAttribute("cabecera");

			BigDecimal SCAUMOT = new BigDecimal(String.valueOf(sessio.get("SCAUMOT")));
			BigDecimal CTIPDES = new BigDecimal(String.valueOf(sessio.get("CTIPDES")));
			String CCAMPO = getCampoTextual(request, "CCAMPO");
			BigDecimal CCLAVE = getCampoNumerico(request, "CCLAVE");

			if (formdata.get("paginar") == null) {
				PAC_IAX_SINIESTROS pac_axis_siniestros = new PAC_IAX_SINIESTROS(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
				Map map = pac_axis_siniestros.ejecutaPAC_IAX_SINIESTROS__F_SET_CAUMOT_DESTFORMULA(SCAUMOT, CTIPDES,
						CCAMPO, CCLAVE);
				logger.debug(map);
				if (BigDecimal.ZERO.equals(tratarRETURNyMENSAJES(request, map)))
					formdata.put("OK", "0");
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axissin024Service - m�todo m_guardar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			logger.debug("fin metodo");
			this.configForm(request, whoami(this));
		}
	}

	public void m_formula(HttpServletRequest request, Axissin024Action thisAction) {
		logger.debug("Axisssin024Service m_formula");
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);

		try {
			UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
			// Push de los datos necesarios a la pila
			/*
			 * BigDecimal SSEGURO = getCampoNumerico (request, "SSEGURO");
			 * 
			 * BigDecimal SPERSON = new
			 * BigDecimal(String.valueOf(request.getParameter("SPERSON")));
			 * 
			 * thisAction.topPila(request, "formdata_axisper009", formdata);
			 * thisAction.topPila(request, "SPERSON", SPERSON);
			 */

		} catch (Exception e) {
			logger.error("Error en el servicio Axisssin024Service - m�todo m_formula", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.configForm(request, this.whoami(this));
		}
	}

	public void m_volver(HttpServletRequest request, Axissin024Action thisAction) {
		logger.debug("Axisssin024Service m_volver");
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {
			/*
			 * Map formdata_axisper009 = (Map) thisAction.removeTopPila(request,
			 * "formdata_axisper009"); if (!isEmpty(formdata_axisper009)) {
			 * formdata.putAll(formdata_axisper009); } formdata.put("SPERSON",
			 * bigDecimalToString ((BigDecimal) thisAction.removeTopPila(request,
			 * "SPERSON")));
			 * 
			 * /* formdata.put("SSEGURO", bigDecimalToString ((BigDecimal)
			 * thisAction.removeTopPila(request, "SSEGURO"))); formdata.put("SPERSON",
			 * bigDecimalToString ((BigDecimal) thisAction.removeTopPila(request,
			 * "SPERSON")));
			 */

			// if (bigDecimalToString ((BigDecimal) thisAction.removeTopPila(request,
			// "SPERSON")).length()>0)
			// request.setAttribute("SPERSON",bigDecimalToString ((BigDecimal)
			// thisAction.removeTopPila(request, "SPERSON")));

		} catch (Exception e) {
			logger.error("Error en el servicio Axisssin024Service - m�todo m_volver", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.configForm(request, this.whoami(this));
		}
	}

}
