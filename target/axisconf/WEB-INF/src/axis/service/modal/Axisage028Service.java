package axis.service.modal;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_AGE_DATOS;
import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.control.modal.Axisage028Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AjaxContainerService;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

public class Axisage028Service extends AxisBaseService {
	static Log logger = LogFactory.getLog(Axisage028Service.class);

	public void m_init(HttpServletRequest request, Axisage028Action thisAction) {
		logger.debug("Axisage028Service m_init");
		try {
		} catch (Exception e) {
			logger.error("Error en el servicio axisage028Service - m�todo m_init", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
	}

	public void m_form(HttpServletRequest request, Axisage028Action thisAction) {
		logger.debug("Axisage028Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {

			BigDecimal CRAMO = getCampoNumerico(request, "CRAMO");
			request.getSession().setAttribute("CRAMO", CRAMO);

			BigDecimal CAGENTE = getCampoNumerico(request, "CAGENTE");
			request.getSession().setAttribute("CAGENTE", CAGENTE);

			logger.debug("################CAGENTE#########-->" + CAGENTE + "#####CRAMO######-->" + CRAMO);

			PAC_IAX_AGE_DATOS pacIaxAgeDatos = new PAC_IAX_AGE_DATOS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			HashMap m = null;
			m = pacIaxAgeDatos.ejecutaPAC_IAX_AGE_DATOS__F_GET_PROD_USU(CAGENTE, CRAMO);
			logger.debug("m:" + m);
			tratarRETURNyMENSAJES(request, m);
			request.getSession().setAttribute("Prod_usu", m.get("RETURN"));

			PAC_IAX_LISTVALORES pacIaxListValores = new PAC_IAX_LISTVALORES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			m = pacIaxListValores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(108));
			logger.debug(m);
			Map LISTVALORES = new HashMap();
			LISTVALORES.put("lstsino", tratarRETURNyMENSAJES(request, m, false));

			m = pacIaxListValores.ejecutaPAC_IAX_LISTVALORES__F_GET_RAMOSAGENTE(CAGENTE, null, null); // CTIPO - CEMPRES
			LISTVALORES.put("LSTRAMO", (List) tratarRETURNyMENSAJES(request, m));

			formdata.put("LISTVALORES", LISTVALORES);

		} catch (Exception e) {
			logger.error("Error en el servicio axisage028Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		String CMODO = (String) AbstractDispatchAction.topPila(request, "CMODO");
		request.getSession().setAttribute("CMODO", CMODO);
		this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
	}

	public void m_marcar_json(HttpServletRequest request) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		AjaxContainerService ajax = new AjaxContainerService();
		try {

			BigDecimal SPRODUC = this.getCampoNumerico(request, "SPRODUC");
			BigDecimal MARCAR = this.getCampoNumerico(request, "MARCAR");

			ArrayList tinfo = (ArrayList) request.getSession().getAttribute("Prod_usu");

			for (int i = 0; i < tinfo.size(); i++) {
				HashMap mm = (HashMap) tinfo.get(i);

				HashMap OB_IAX_PROD_USU = (HashMap) mm.get("OB_IAX_PROD_USU");

				BigDecimal SPRODUCx = (BigDecimal) OB_IAX_PROD_USU.get("SPRODUC");

				if (!isEmpty(SPRODUC) && SPRODUC.longValue() == SPRODUCx.intValue()) {
					logger.debug(MARCAR);
					OB_IAX_PROD_USU.put("SELECCIONADO", MARCAR);
				}

			}

			request.getSession().setAttribute("Prod_usu", tinfo);
			logger.debug(tinfo);
		} catch (Exception e) {
			logger.error("Error.", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	public void m_marcar_json_emitir(HttpServletRequest request) {
		try {

			BigDecimal SPRODUC = this.getCampoNumerico(request, "SPRODUC");
			BigDecimal MARCAR = this.getCampoNumerico(request, "MARCAR");

			ArrayList tinfo = (ArrayList) request.getSession().getAttribute("Prod_usu");

			for (int i = 0; i < tinfo.size(); i++) {
				HashMap mm = (HashMap) tinfo.get(i);

				HashMap OB_IAX_PROD_USU = (HashMap) mm.get("OB_IAX_PROD_USU");

				BigDecimal SPRODUCx = (BigDecimal) OB_IAX_PROD_USU.get("SPRODUC");

				if (!isEmpty(SPRODUC) && SPRODUC.longValue() == SPRODUCx.intValue()) {
					logger.debug(MARCAR);
					OB_IAX_PROD_USU.put("EMITIR", MARCAR);
				}

			}

			request.getSession().setAttribute("Prod_usu", tinfo);
			logger.debug(tinfo);
		} catch (Exception e) {
			logger.error("Error.", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	public void m_marcar_json_accesible(HttpServletRequest request) {
		try {

			BigDecimal SPRODUC = this.getCampoNumerico(request, "SPRODUC");
			BigDecimal MARCAR = this.getCampoNumerico(request, "MARCAR");

			ArrayList tinfo = (ArrayList) request.getSession().getAttribute("Prod_usu");

			for (int i = 0; i < tinfo.size(); i++) {
				HashMap mm = (HashMap) tinfo.get(i);

				HashMap OB_IAX_PROD_USU = (HashMap) mm.get("OB_IAX_PROD_USU");

				BigDecimal SPRODUCx = (BigDecimal) OB_IAX_PROD_USU.get("SPRODUC");

				if (!isEmpty(SPRODUC) && SPRODUC.longValue() == SPRODUCx.intValue()) {
					logger.debug(MARCAR);
					OB_IAX_PROD_USU.put("ACCESIBLE", MARCAR);

				}

			}

			request.getSession().setAttribute("Prod_usu", tinfo);
			logger.debug(tinfo);
		} catch (Exception e) {
			logger.error("Error.", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	/**
	 * M�todo que realiza el cobro del recibo
	 * 
	 * @param request
	 */
	public void m_aceptar(HttpServletRequest request) {
		logger.debug("Axisage028Service m_aceptar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {

			ArrayList tinfo = (ArrayList) request.getSession().getAttribute("Prod_usu");

			for (int i = 0; i < tinfo.size(); i++) {
				HashMap mm = (HashMap) tinfo.get(i);

				HashMap OB_IAX_PROD_USU = (HashMap) mm.get("OB_IAX_PROD_USU");

				BigDecimal SELECCIONADO = (BigDecimal) OB_IAX_PROD_USU.get("SELECCIONADO");
				BigDecimal CDELEGA = (BigDecimal) OB_IAX_PROD_USU.get("CDELEGA");
				BigDecimal CRAMO = (BigDecimal) OB_IAX_PROD_USU.get("CRAMO");
				BigDecimal CMODALI = (BigDecimal) OB_IAX_PROD_USU.get("CMODALI");
				BigDecimal CTIPSEG = (BigDecimal) OB_IAX_PROD_USU.get("CTIPSEG");
				BigDecimal CCOLECT = (BigDecimal) OB_IAX_PROD_USU.get("CCOLECT");
				BigDecimal EMITIR = (BigDecimal) OB_IAX_PROD_USU.get("EMITIR");
				BigDecimal ACCESIBLE = (BigDecimal) OB_IAX_PROD_USU.get("ACCESIBLE");

				PAC_IAX_AGE_DATOS pacIaxAgeDatos = new PAC_IAX_AGE_DATOS(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
				Map map = pacIaxAgeDatos.ejecutaPAC_IAX_AGE_DATOS__F_SET_PROD_USU(SELECCIONADO, CDELEGA, CRAMO, CMODALI,
						CTIPSEG, CCOLECT, EMITIR, ACCESIBLE);
				logger.debug(map);
				tratarRETURNyMENSAJES(request, map, false);

			}

		} catch (Exception e) {
			logger.error("Error.", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}

	}
}
