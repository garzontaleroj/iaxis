package axis.service.axis;

import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_SINIESTROS;
import axis.mvc.control.axis.Axissin021Action;
import axis.mvc.model.UsuarioBean;
import axis.util.Constantes;

/**
 * Axissin021Service.java
 * 
 * @author <a href="mailto:xpastor@csi-ti.com">Xavi Pastor</a>
 */
public class Axissin021Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());
	SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE INICIALIZACION
	 *******************************************/

	/*********************************************************************************************************************/
	public

			void m_init(HttpServletRequest request, Axissin021Action thisAction) {
		logger.debug("Axissin021Service m_init");
		try {

		} catch (Exception e) {
			logger.error("Error en el servicio Axissin021Service - m�todo m_init", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.configForm(request, this.whoami(this));
	}

	public void m_form(HttpServletRequest request, Axissin021Action thisAction) {
		logger.debug("Axissin021Service m_form");
		try {
			m_cargarDatos(request, thisAction);

		} catch (Exception e) {
			logger.error("Error en el servicio Axissin021Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.configForm(request, this.whoami(this));
	}

	public void m_buscar(HttpServletRequest request, Axissin021Action thisAction) {
		// Recuperar siniestro a buscar
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {
			// Recuperar par�metros de b�squeda
			BigDecimal CEMPRES = getCampoNumerico(request, "CEMPRES_CERCA");
			BigDecimal CCAUSIN = getCampoNumerico(request, "CCAUSIN_CERCA");
			BigDecimal CMOTSIN = getCampoNumerico(request, "CMOTSIN_CERCA");
			BigDecimal CRAMO = getCampoNumerico(request, "CRAMO_CERCA");
			BigDecimal SPRODUC = getCampoNumerico(request, "SPRODUC_CERCA");
			BigDecimal CTIPDES = getCampoNumerico(request, "CTIPDES_CERCA");

			PAC_IAX_SINIESTROS pac_axis_siniestros = new PAC_IAX_SINIESTROS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			Map map = pac_axis_siniestros.ejecutaPAC_IAX_SINIESTROS__F_GET_CAUSAS_MOTIVOS(CEMPRES, CRAMO, SPRODUC,
					CCAUSIN, CMOTSIN, CTIPDES);
			logger.debug(map);
			logger.debug("----- map causas:" + map);
			if (!isEmpty(tratarRETURNyMENSAJES(request, map))
					&& ((List) tratarRETURNyMENSAJES(request, map)).size() > 0) {
				List<HashMap> caumots = (List) tratarRETURNyMENSAJES(request, map);
				BigDecimal SCAUMOT = this.getCampoNumerico(request, "SCAUMOT");
				if (isEmpty(SCAUMOT)) {
					HashMap m = caumots.get(0);
					formdata.put("SCAUMOT", m.get("SCAUMOT"));
				}
				logger.debug("------- carga la cabecera");
				this.setCabecera(request, caumots);
				formdata.put("causamots", caumots);
				formdata.put("indexDestinatari", new BigDecimal(0));
				this.cargarProductes(request);
				this.cargarDestinataris(request);
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axissin020Service - m�todo m_buscar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			logger.debug("fin metodo");
			this.configForm(request, whoami(this));
		}
	}

	private void setCabecera(HttpServletRequest request, List<HashMap> causasmotius) {
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		BigDecimal SCAUMOT = new BigDecimal(String.valueOf(formdata.get("SCAUMOT")));
		logger.debug(SCAUMOT);

		HashMap cabecera = new HashMap();
		logger.debug(causasmotius);
		for (HashMap cm : causasmotius) {
			logger.debug(cm);
			BigDecimal SCAUMOT_list = new BigDecimal(String.valueOf(cm.get("SCAUMOT")));
			if (SCAUMOT_list.intValue() == SCAUMOT.intValue()) {
				cabecera.putAll(cm);
			}

		}

		request.getSession().setAttribute("cabecera", cabecera);

	}

	/**
	 * Realiza la carga de los datos p�liza (incluyendo tomadores y �ltimo recibo) y
	 * siniestro para un SSEGURO y NSINIES dado.
	 * 
	 * @param request    El HttpServletRequest que contiene la petici�n del cliente
	 *                   web.
	 * @param thisAction Una Action abstracta desde donde se ha invocado el servicio
	 *                   (necesaria para el log).
	 */
	public void m_cargarDatos(HttpServletRequest request, Axissin021Action thisAction) {
		logger.debug("Axissin021Service m_cargarDatos");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {

		} catch (Exception e) {
			logger.error("Error en el servicio Axissin021Service - m�todo m_cargarDatos", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.configForm(request, this.whoami(this));
	}

	public void m_recargarCauMot(HttpServletRequest request, Axissin021Action thisAction) {
		logger.debug("Axissin021Service m_recargarRadios");
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		try {

			logger.debug(formdata.get("indexTramitacio"));
			formdata.put("indexDestinatari", new BigDecimal(0));
			this.cargarProductes(request);
			this.cargarDestinataris(request);

		} catch (Exception e) {
			logger.error("Error en el m�todo Axissin006 m_recargarRadios", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.configForm(request, this.whoami(this));

	}

	public void m_borrar_producte(HttpServletRequest request, Axissin021Action thisAction) {
		logger.debug("Axissin021Service m_borrar_producte");
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		try {
			HashMap sessio = (HashMap) request.getSession().getAttribute("cabecera");
			BigDecimal SCAUMOT = new BigDecimal(String.valueOf(sessio.get("SCAUMOT")));
			BigDecimal SPRODUC = getCampoNumerico(request, "SPRODUC");
			BigDecimal CACTIVI = getCampoNumerico(request, "CACTIVI");
			BigDecimal CGARANT = getCampoNumerico(request, "CGARANT");
			BigDecimal CTRAMIT = getCampoNumerico(request, "CTRAMIT");
			PAC_IAX_SINIESTROS pac_axis_siniestros = new PAC_IAX_SINIESTROS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map map = pac_axis_siniestros.ejecutaPAC_IAX_SINIESTROS__F_DEL_CAUMOT_PRODUCTE(SCAUMOT, SPRODUC, CACTIVI,
					CGARANT, CTRAMIT);
			logger.debug(map);
			tratarRETURNyMENSAJES(request, map);

			request.removeAttribute("SPRODUC");
			request.removeAttribute("CACTIVI");
			request.removeAttribute("CGARANT");
			request.removeAttribute("CTRAMIT");
			formdata.remove("SPRODUC");
			formdata.remove("CACTIVI");
			formdata.remove("CGARANT");
			formdata.remove("CTRAMIT");

		} catch (Exception e) {
			logger.error("Error en el m�todo Axissin021 m_borrar_producte", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.configForm(request, this.whoami(this));

	}

	public void m_borrar_formula(HttpServletRequest request, Axissin021Action thisAction) {
		logger.debug("Axissin021Service m_borrar_formula");
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		try {
			HashMap sessio = (HashMap) request.getSession().getAttribute("cabecera");
			BigDecimal SCAUMOT = new BigDecimal(String.valueOf(sessio.get("SCAUMOT")));
			BigDecimal CTIPDES = getCampoNumerico(request, "CTIPDES");
			String CCAMPO = getCampoTextual(request, "CCAMPO");
			BigDecimal CCLAVE = getCampoNumerico(request, "CCLAVE");

			PAC_IAX_SINIESTROS pac_axis_siniestros = new PAC_IAX_SINIESTROS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map map = pac_axis_siniestros.ejecutaPAC_IAX_SINIESTROS__F_DEL_CAUMOT_DESTFORMULA(SCAUMOT, CTIPDES, CCAMPO,
					CCLAVE);
			logger.debug(map);
			tratarRETURNyMENSAJES(request, map);

			request.removeAttribute("SCAUMOT");
			request.removeAttribute("CTIPDES");
			request.removeAttribute("CCAMPO");
			request.removeAttribute("CCLAVE");
			formdata.remove("SCAUMOT");
			formdata.remove("CTIPDES");
			formdata.remove("CCAMPO");
			formdata.remove("CCLAVE");

		} catch (Exception e) {
			logger.error("Error en el m�todo Axissin021 m_borrar_formula", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.configForm(request, this.whoami(this));

	}

	private void cargarProductes(HttpServletRequest request) throws Exception {
		logger.debug("Axissin021Service m_recargarRadios");
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		PAC_IAX_SINIESTROS pac_axis_siniestros = new PAC_IAX_SINIESTROS(
				(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

		BigDecimal SCAUMOT = this.getCampoNumerico(request, "SCAUMOT");
		BigDecimal SPRODUC = this.getCampoNumerico(request, "SPRODUC");
		BigDecimal CACTIVI = this.getCampoNumerico(request, "CACTIVI");
		BigDecimal CGARANT = this.getCampoNumerico(request, "CGARANT");
		BigDecimal CTRAMIT = this.getCampoNumerico(request, "CTRAMIT");

		Map map = pac_axis_siniestros.ejecutaPAC_IAX_SINIESTROS__F_GET_CAUMOT_PRODUCTE(SCAUMOT, SPRODUC, CACTIVI,
				CGARANT, CTRAMIT);
		logger.debug(map);

		if (!isEmpty(tratarRETURNyMENSAJES(request, map)) && ((List) tratarRETURNyMENSAJES(request, map)).size() > 0) {
			List destinataris = (List) tratarRETURNyMENSAJES(request, map);
			formdata.put("productos", destinataris);
		}

	}

	private void cargarDestinataris(HttpServletRequest request) throws Exception {
		logger.debug("Axissin021Service m_recargarRadios");
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		PAC_IAX_SINIESTROS pac_axis_siniestros = new PAC_IAX_SINIESTROS(
				(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

		BigDecimal SCAUMOT = this.getCampoNumerico(request, "SCAUMOT");
		BigDecimal CTIPDES = this.getCampoNumerico(request, "CTIPDES_CERCA");

		Map map = pac_axis_siniestros.ejecutaPAC_IAX_SINIESTROS__F_GET_CAUMOT_DESTINATARIO(SCAUMOT, CTIPDES);
		logger.debug(map);

		if (!isEmpty(tratarRETURNyMENSAJES(request, map)) && ((List) tratarRETURNyMENSAJES(request, map)).size() > 0) {
			List destinataris = (List) tratarRETURNyMENSAJES(request, map);
			formdata.put("destinatarios", destinataris);

			if (isEmpty(this.getCampoNumerico(request, "CTIPDES"))) {
				HashMap m = (HashMap) destinataris.get(0);
				formdata.put("CTIPDES", m.get("CTIPDES"));
				HashMap c = (HashMap) request.getSession().getAttribute("cabecera");
				c.put("CTIPDES", m.get("CTIPDES"));
				request.getSession().setAttribute("cabecera", c);

			} else {
				HashMap c = (HashMap) request.getSession().getAttribute("cabecera");
				c.put("CTIPDES", this.getCampoNumerico(request, "CTIPDES"));
				request.getSession().setAttribute("cabecera", c);
			}

			this.cargarFormulas(request);
		}

	}

	private void cargarFormulas(HttpServletRequest request) throws Exception {
		logger.debug("Axissin021Service cargarFormulas");
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		PAC_IAX_SINIESTROS pac_axis_siniestros = new PAC_IAX_SINIESTROS(
				(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

		BigDecimal CTIPDES = this.getCampoNumerico(request, "CTIPDES");
		BigDecimal SCAUMOT = this.getCampoNumerico(request, "SCAUMOT");
		String CCAMPO = this.getCampoTextual(request, "CCAMPO");
		BigDecimal CCLAVE = this.getCampoNumerico(request, "CCLAVE");

		Map map = pac_axis_siniestros.ejecutaPAC_IAX_SINIESTROS__F_GET_CAUMOT_DESTFORMULA(SCAUMOT, CTIPDES, CCAMPO,
				CCLAVE);
		logger.debug(map);

		if (!isEmpty(tratarRETURNyMENSAJES(request, map)) && ((List) tratarRETURNyMENSAJES(request, map)).size() > 0) {
			List destinataris = (List) tratarRETURNyMENSAJES(request, map);
			formdata.put("formulas", destinataris);
		}
	}

	public void m_borrar_destinatario(HttpServletRequest request, Axissin021Action thisAction) {
		logger.debug("Axissin021Service m_borrar_destinatario");

		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		try {

			BigDecimal pscaumot = getCampoNumerico(request, "CSCAUMOT");
			BigDecimal pctipdes = getCampoNumerico(request, "CCTIPDES");
			logger.debug("---- CTIPDES:" + pctipdes);

			PAC_IAX_SINIESTROS pac_axis_siniestros = new PAC_IAX_SINIESTROS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			Map map = pac_axis_siniestros.ejecutaPAC_IAX_SINIESTROS__F_DEL_CAUMOT_DESTINATARIO(pscaumot, pctipdes);
			logger.debug(map);
			tratarRETURNyMENSAJES(request, map);

		} catch (Exception e) {
			logger.error("Error en el m�todo Axissin021 m_borrar_destinatario", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.configForm(request, this.whoami(this));

	}

	public void m_borrar(HttpServletRequest request, Axissin021Action thisAction) {
		logger.debug("Axissin021Service m_borrar");

		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		try {

			BigDecimal pscaumot = getCampoNumerico(request, "CSCAUMOT");

			PAC_IAX_SINIESTROS pac_axis_siniestros = new PAC_IAX_SINIESTROS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			Map map = pac_axis_siniestros.ejecutaPAC_IAX_SINIESTROS__F_DEL_CAUMOT(pscaumot);
			logger.debug(map);
			tratarRETURNyMENSAJES(request, map);

		} catch (Exception e) {
			logger.error("Error en el m�todo Axissin021 m_borrar_destinatario", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.configForm(request, this.whoami(this));

	}

}
