package axis.service.modal;

import java.math.BigDecimal;
import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_IMPAGA;
import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.mvc.control.modal.Axisadm041Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

/**
 * Axisadm041Service.java 11/01/2010
 * 
 * @since Java 5.0
 */
@SuppressWarnings("all")
public class Axisadm041Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE INICIALIZACION
	 *******************************************/

	/**
	 */
	public

			void m_init(HttpServletRequest request, Axisadm041Action thisAction) {
		logger.debug("Axisadm041Service m_init");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {

		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm041Service - m�todo m_init", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);

		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	/**
	 * 
	 * @param request
	 */
	public void m_form(HttpServletRequest request, Axisadm041Action thisAction) {
		logger.debug("Axisadm041Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {
			PAC_IAX_IMPAGA pac_iax_impaga = new PAC_IAX_IMPAGA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			BigDecimal SPRODUC = getCampoNumerico(request, "SPRODUC");
			BigDecimal SIDPRODP = getCampoNumerico(request, "SIDPRODP");
			BigDecimal CTIPOIMP = getCampoNumerico(request, "CTIPOIMP");
			BigDecimal CAGENTE = getHiddenCampoNumerico(request, "CAGENTE");

			if (!isEmpty(SIDPRODP)) {
				Map map = pac_iax_impaga.ejecutaPAC_IAX_IMPAGA__F_GET_PRODREPREC(SIDPRODP, SPRODUC, CTIPOIMP, CAGENTE);
				logger.debug(map);
				ArrayList lista = (ArrayList) this.tratarRETURNyMENSAJES(request, map, false);

				formdata.putAll((Map) lista.get(0));
			}

			formdata.put("CAGENTE", CAGENTE);

			this.cargarlistas(request, thisAction);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm041Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	private void cargarlistas(HttpServletRequest request, Axisadm041Action thisAction) {
		logger.debug("Axisadm041Service cargarlistas");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {
			BigDecimal CEMPRES = this.getCampoNumerico(request, "CEMPRES");
			BigDecimal CRAMO = this.getCampoNumerico(request, "CRAMO");
			BigDecimal CAGRUP = this.getCampoNumerico(request, "CAGRUP");
			String TIPO = this.getCampoTextual(request, "tipo");
			Map listValores = new HashMap();
			PAC_IAX_LISTVALORES pac_iax_listvalores = new PAC_IAX_LISTVALORES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			Map tipos_imp = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(223));
			logger.debug(tipos_imp);
			listValores.put("tipos_imp", this.tratarRETURNyMENSAJES(request, tipos_imp, false));

			// Lista Tipos Recibo
			Map map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(212));
			logger.debug(map);
			listValores.put("lsttipos", tratarRETURNyMENSAJES(request, map));

			formdata.put("listvalores", listValores);
		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm041Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	public void m_aceptar(HttpServletRequest request, Axisadm041Action thisAction) {
		logger.debug("Axisadm041Service m_buscar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {

			BigDecimal SPRODUC = getCampoNumerico(request, "SPRODUC");
			BigDecimal SIDPRODP = getCampoNumerico(request, "SIDPRODP");

			Date FINIEFE = AxisBaseService.stringToSqlDate(getCampoTextual(request, "FINIEFE"));
			BigDecimal CTIPOIMP = getCampoNumerico(request, "CTIPOIMP");
			BigDecimal CTIPNIMP = getCampoNumerico(request, "CTIPNIMP");

			BigDecimal CAGENTE = getHiddenCampoNumerico(request, "CAGENTE");

			PAC_IAX_IMPAGA pac_iax_impaga = new PAC_IAX_IMPAGA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map map = pac_iax_impaga.ejecutaPAC_IAX_IMPAGA__F_SET_PRODREPREC(SIDPRODP, SPRODUC, FINIEFE, CTIPOIMP,
					CTIPNIMP, CAGENTE);
			logger.debug(map);

			BigDecimal RESULTADO = (BigDecimal) tratarRETURNyMENSAJES(request, map);

			request.setAttribute("RESULT", RESULTADO);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm041Service - m�todo m_buscar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

}
