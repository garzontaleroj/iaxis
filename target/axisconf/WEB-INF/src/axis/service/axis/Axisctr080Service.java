package axis.service.axis;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_CFG;
import axis.jdbc.PAC_IAX_LIQUIDA;
import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.jdbc.PAC_IAX_REDCOMERCIAL;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.model.UsuarioBean;
import axis.util.Constantes;

public class Axisctr080Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	public void m_init(HttpServletRequest request, AbstractDispatchAction thisAction) {
		logger.debug("Axisctr080Service m_init");
		try {

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr080Service - m�todo m_init", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

	public void m_form(HttpServletRequest request, AbstractDispatchAction thisAction) {
		logger.debug("Axisctr080Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		String CMODO = (String) AbstractDispatchAction.topPila(request, "CMODO");
		formdata.put("CMODO", CMODO);

		try {
			PAC_IAX_LIQUIDA pac_axis_liquida = new PAC_IAX_LIQUIDA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			PAC_IAX_REDCOMERCIAL pac_axis_redcomercial = new PAC_IAX_REDCOMERCIAL(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			BigDecimal CAGENTE = this.getCampoNumerico(request, "CAGENTE");
			BigDecimal CEMPRES = this.getCampoNumerico(request, "CEMPRES");

			java.sql.Date d = new java.sql.Date(new java.util.Date().getTime());
			if (!isEmpty(CAGENTE)) {
				Map map = pac_axis_redcomercial.ejecutaPAC_IAX_REDCOMERCIAL__F_GET_AGENTES(CEMPRES, d, CAGENTE, null,
						null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null,
						null, null, null, null, null, null, null);
				logger.debug(map);

				List l = (List) this.tratarRETURNyMENSAJES(request, map);
				if (!isEmpty(l) && l.size() > 0) {
					HashMap m = (HashMap) l.get(0);
					formdata.putAll(m);
					CEMPRES = (BigDecimal) m.get("CEMPRES");
				}

				if (!isEmpty(CEMPRES)) {
					map = pac_axis_liquida.ejecutaPAC_IAX_LIQUIDA__F_GET_SALDOAGENTE(CEMPRES, CAGENTE);
					logger.debug(map);
					if (((BigDecimal) this.tratarRETURNyMENSAJES(request, map)).equals(BigDecimal.ZERO))
						formdata.put("SALDO", map.get("PSALDO"));
				}

				map = pac_axis_liquida.ejecutaPAC_IAX_LIQUIDA__F_GET_CTAS(CAGENTE);
				logger.debug(map);
				if (((BigDecimal) this.tratarRETURNyMENSAJES(request, map)).equals(BigDecimal.ZERO))
					formdata.put("cuentas", map.get("PCURCUENTASTEC"));

			}
			this.cargarListas(request);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr080Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {

			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	private void cargarListas(HttpServletRequest request) throws Exception {
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map listValores = new HashMap();
		// Carga de las PAC_IAX PL/SQL
		PAC_IAX_LISTVALORES pac_axis_listValores = new PAC_IAX_LISTVALORES(
				(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

	}

	public void m_delete(HttpServletRequest request, AbstractDispatchAction thisAction) {
		logger.debug("Axisctr080Service m_delete");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);

		try {
			PAC_IAX_LIQUIDA pac_axis_liquida = new PAC_IAX_LIQUIDA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			BigDecimal CAGENTE = this.getCampoNumerico(request, "CAGENTE");
			BigDecimal CEMPRES = this.getCampoNumerico(request, "CEMPRES");
			BigDecimal NNUMLIN = this.getCampoNumerico(request, "NNUMLIN");

			Map map = pac_axis_liquida.ejecutaPAC_IAX_LIQUIDA__F_DEL_CTAS(CEMPRES, CAGENTE, NNUMLIN);
			logger.debug(map);
			this.tratarRETURNyMENSAJES(request, map);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr080Service - m�todo m_delete", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {

			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	public void m_listado(HttpServletRequest request, AbstractDispatchAction thisAction) {

		logger.debug("Axisctr080Service m_listado");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {
			// Parametro que indica si se ejecuta en modo BATCH (1/0)
			String cBatch = this.getCampoTextual(request, "CBATCH");

			BigDecimal CEMPRES = isEmpty((String) AbstractDispatchAction.topPila(request, "CEMPRES")) ? null
					: new BigDecimal((String) AbstractDispatchAction.topPila(request, "CEMPRES"));
			// this.getHiddenCampoNumerico(request, "CEMPRES");
			BigDecimal SPRODUC = isEmpty((String) AbstractDispatchAction.topPila(request, "SPRODUC")) ? null
					: new BigDecimal((String) AbstractDispatchAction.topPila(request, "SPRODUC"));
			// this.getHiddenCampoNumerico(request, "SPRODUC");
			String CLISTADO = this.getHiddenCampoTextual(request, "CLISTADO");
			String CMODO = (String) AbstractDispatchAction.topPila(request, "CMODO");
			String CAGENTE = (String) this.getHiddenCampoTextual(request, "CAGENTE");

			String PPARAMS = isEmpty(this.getHiddenCampoTextual(request, "PPARAMS")) ? ""
					: this.getHiddenCampoTextual(request, "PPARAMS");

			PPARAMS = "|CEMPRES:" + usuario.getCempres() + "|CAGENTE:" + CAGENTE + "|";

			if (isEmpty(CEMPRES))
				CEMPRES = usuario.getCempres();

			PAC_IAX_CFG paxIaxCfg = new PAC_IAX_CFG((java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			if ("1".equals(cBatch)) {
				// EJECUCI�N EN MODO BATCH
				Map map = paxIaxCfg.ejecutaPAC_IAX_CFG__F_EJECUTAR_INFORME_BATCH(CEMPRES, whoami(this).toUpperCase(),
						CMODO, SPRODUC, "|" + CLISTADO + "|", PPARAMS, null);

				logger.debug(map);

				if (((BigDecimal) tratarRETURNyMENSAJES(request, map)).intValue() == 0) {

					formdata.put("LIST_FICHEROS", map.get("VTIMP"));
				}
			} else {
				Map map = paxIaxCfg.ejecutaPAC_IAX_CFG__F_EJECUTAR_INFORME(CEMPRES, whoami(this).toUpperCase(), CMODO,
						SPRODUC, "|" + CLISTADO + "|", PPARAMS);

				logger.debug(map);

				if (((BigDecimal) tratarRETURNyMENSAJES(request, map)).intValue() == 0) {

					formdata.put("LIST_FICHEROS", map.get("VTIMP"));
				}
			}
		} catch (Exception e) {
			logger.error("Error en el servicio Axislist002Service - m�todo m_ejecutar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}

	}

}
