package axis.service.modal;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_MNTDTOSESPECIALES;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

public class Axisdesc017Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	public void m_init(HttpServletRequest request) {
		logger.debug("Axisdesc017Service m_buscar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {
		} catch (Exception e) {
			logger.error("Error.", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		} finally {
			// ver m_form: this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	public void m_form(HttpServletRequest request) {
		logger.debug("Axisdesc017Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {

			Map map = new PAC_IAX_MNTDTOSESPECIALES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_MNTDTOSESPECIALES__F_GET_CAMPANYAS();
			logger.debug(map);
			formdata.put("listaCampanyas", (List) tratarRETURNyMENSAJES(request, map));

			BigDecimal CCAMPANYA = getCampoNumerico(request, "CCAMPANYA");
			String MODO = getCampoTextual(request, "CMODO");
			if (MODO == null)
				MODO = getCampoTextual(request, "MODO");
			formdata.put("MODO", MODO);

			if (!isEmpty(CCAMPANYA)) {
				map = new PAC_IAX_MNTDTOSESPECIALES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_MNTDTOSESPECIALES__F_GET_DTOSESPECIAL(CCAMPANYA);
				logger.debug("--> descuento:" + map);
				tratarRETURNyMENSAJES(request, map);

				Map OB_IAX_DTOSESPECIALES = (HashMap) map.get("PDTOSESPE");
				logger.debug("-->OB_IAX_DTOSESPECIALES:" + OB_IAX_DTOSESPECIALES);
				formdata.put("CCAMPANYA", OB_IAX_DTOSESPECIALES.get("CCAMPANYA"));
				formdata.put("FINICIO", OB_IAX_DTOSESPECIALES.get("FINICIO"));
				formdata.put("FFIN", OB_IAX_DTOSESPECIALES.get("FFIN"));
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisdesc017Service - m�todo m_form", e);
			AbstractDispatchAction.guardarMensaje(request,
					"verbatim:<b>" + e.getClass().getName() + ":</b> " + e.getLocalizedMessage(),
					new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	public void m_aceptar(HttpServletRequest request) {
		logger.debug("Axisdesc017Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {

			BigDecimal CCAMPANYA = getCampoNumerico(request, "CCAMPANYA");
			java.sql.Date FINICIO = stringToSqlDate(getCampoTextual(request, "FINICIO"));
			java.sql.Date FFIN = stringToSqlDate(getCampoTextual(request, "FFIN"));
			// String MODO = (String)formdata.get("MODO");
			String MODO = getCampoTextual(request, "MODO");

			Map map = new PAC_IAX_MNTDTOSESPECIALES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_MNTDTOSESPECIALES__F_SET_DTOSESPECIALES(CCAMPANYA, FINICIO, FFIN, MODO);
			logger.debug(map);
			tratarRETURNyMENSAJES(request, map);

			if (map.get("RETURN").equals(new BigDecimal(0))) {
				formdata.put("OK", map.get("RETURN"));
				formdata.put("CCAMPANYA", CCAMPANYA);
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisdesc017Service - m�todo m_form", e);
			AbstractDispatchAction.guardarMensaje(request,
					"verbatim:<b>" + e.getClass().getName() + ":</b> " + e.getLocalizedMessage(),
					new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

}
