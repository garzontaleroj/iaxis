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
import axis.mvc.control.modal.Axisadm043Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

/**
 * Axisadm043Service.java 11/01/2010
 * 
 * @since Java 5.0
 */
@SuppressWarnings("all")
public class Axisadm043Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE INICIALIZACION
	 *******************************************/

	/**
	 */
	public

			void m_init(HttpServletRequest request, Axisadm043Action thisAction) {
		logger.debug("Axisadm043Service m_init");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {

		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm043Service - m�todo m_init", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);

		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	/**
	 * 
	 * @param request
	 */
	public void m_form(HttpServletRequest request, Axisadm043Action thisAction) {
		logger.debug("Axisadm043Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {
			PAC_IAX_IMPAGA pac_iax_impaga = new PAC_IAX_IMPAGA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			BigDecimal CMOTIVO = getCampoNumerico(request, "CMOTIVO");
			BigDecimal SIDPRODP = getCampoNumerico(request, "SIDPRODP");
			BigDecimal NIMPAGAD = getCampoNumerico(request, "NIMPAGAD");
			if (!isEmpty(SIDPRODP) && !isEmpty(NIMPAGAD) && !isEmpty(CMOTIVO)) {
				Map map = pac_iax_impaga.ejecutaPAC_IAX_IMPAGA__F_GET_DETPRODREPREC(SIDPRODP, CMOTIVO, NIMPAGAD);
				logger.debug(map);
				ArrayList lista = (ArrayList) this.tratarRETURNyMENSAJES(request, map, false);

				if (!isEmpty(lista))
					formdata.putAll((Map) lista.get(0));
			}
			this.cargarlistas(request, thisAction);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm043Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	private void cargarlistas(HttpServletRequest request, Axisadm043Action thisAction) {
		logger.debug("Axisadm043Service cargarlistas");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {
			PAC_IAX_LISTVALORES pac_iax_listvalores = new PAC_IAX_LISTVALORES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			PAC_IAX_IMPAGA pac_iax_impaga = new PAC_IAX_IMPAGA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			Map listValores = new HashMap();

			Map cartas = pac_iax_impaga.ejecutaPAC_IAX_IMPAGA__F_GET_LSTCARTAS();
			logger.debug(cartas);
			listValores.put("cartas", this.tratarRETURNyMENSAJES(request, cartas, false));

			Map dias = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal("224"));
			logger.debug(dias);
			listValores.put("dias", this.tratarRETURNyMENSAJES(request, dias, false));

			Map acciones = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal("204"));
			logger.debug(acciones);
			listValores.put("acciones", this.tratarRETURNyMENSAJES(request, acciones, false));

			Map motivos = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal("73"));
			logger.debug(motivos);
			listValores.put("motivos", this.tratarRETURNyMENSAJES(request, motivos, false));

			formdata.put("listvalores", listValores);
		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm043Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	public void m_recargar(HttpServletRequest request, Axisadm043Action thisAction) {
		logger.debug("Axisadm043Service m_recargar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {
			PAC_IAX_IMPAGA pac_iax_impaga = new PAC_IAX_IMPAGA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			BigDecimal CMOTIVO = getCampoNumerico(request, "CMOTIVO");
			BigDecimal SIDPRODP = getCampoNumerico(request, "SIDPRODP");
			BigDecimal NIMPAGAD = getCampoNumerico(request, "NIMPAGAD");
			if (!isEmpty(SIDPRODP) && !isEmpty(NIMPAGAD) && !isEmpty(CMOTIVO)) {
				Map map = pac_iax_impaga.ejecutaPAC_IAX_IMPAGA__F_GET_DETPRODREPREC(SIDPRODP, CMOTIVO, NIMPAGAD);
				logger.debug(map);
				ArrayList lista = (ArrayList) this.tratarRETURNyMENSAJES(request, map, false);

				formdata.putAll((Map) lista.get(0));
			}

			this.cargarlistas(request, thisAction);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm043Service - m�todo m_recargar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	public void m_aceptar(HttpServletRequest request, Axisadm043Action thisAction) {
		logger.debug("Axisadm043Service m_buscar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {
			BigDecimal SPRODUC = getCampoNumerico(request, "SPRODUC");
			Date FINIEFE = AxisBaseService.stringToSqlDate(getCampoTextual(request, "FINIEFE"));
			BigDecimal SIDPRODP = getCampoNumerico(request, "SIDPRODP");
			BigDecimal CMOTIVO = getHiddenCampoNumerico(request, "CMOTIVO");
			BigDecimal CMODIMM = getCampoNumerico(request, "CMODIMM");
			BigDecimal CACTIMM = getCampoNumerico(request, "CACTIMM");
			BigDecimal DIAAVIS = getCampoNumerico(request, "CDIAAVIS");
			BigDecimal CMODELO = getCampoNumerico(request, "CMODELO");
			BigDecimal CACTIMP = getCampoNumerico(request, "CACTIMP");
			BigDecimal NDIAAVIS = getCampoNumerico(request, "NDIAAVIS");
			BigDecimal NIMPAGAD = getHiddenCampoNumerico(request, "NIMPAGAD");
			String PMODO = getCampoTextual(request, "PMODO");

			PAC_IAX_IMPAGA pac_iax_impaga = new PAC_IAX_IMPAGA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map map = pac_iax_impaga.ejecutaPAC_IAX_IMPAGA__F_SET_DETPRODREPREC(SIDPRODP, CMOTIVO, CMODIMM, CACTIMM,
					DIAAVIS, CMODELO, CACTIMP, NDIAAVIS, NIMPAGAD, PMODO);
			logger.debug(map);

			BigDecimal RESULTADO = (BigDecimal) tratarRETURNyMENSAJES(request, map);

			request.setAttribute("RESULT", RESULTADO);
			this.cargarlistas(request, thisAction);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm043Service - m�todo m_buscar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

}
