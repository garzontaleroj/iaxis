//Revision:# 6Lg1fjFFTc1A4ehrVi6c5A== #
package axis.service.modal;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.csi_ti.security.aes.AESUtil;

import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.jdbc.PAC_IAX_LISTVALORES_SIN;
import axis.jdbc.PAC_IAX_PERSONA;
import axis.jdbc.PAC_IAX_SINIESTROS;
import axis.mvc.control.modal.Axissin052Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AjaxContainerService;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

public class Axissin052Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	/**
	 * M�todo que carga los datos de administraci�n del producto
	 * 
	 * @param request
	 * @param thisAction
	 * @throws Exception
	 */
	private void cargarListas(HttpServletRequest request) throws Exception {
		AESUtil encryptedVal = new AESUtil();
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map listValores = new HashMap();

		// Carga de las PAC_IAX PL/SQL
		PAC_IAX_LISTVALORES pac_axis_listValores = new PAC_IAX_LISTVALORES(
				(Connection) request.getAttribute(Constantes.DB01CONN));
		PAC_IAX_SINIESTROS PAC_IAX_SINIESTROS = new PAC_IAX_SINIESTROS(
				(Connection) request.getAttribute(Constantes.DB01CONN));

		String NSINIES = getCampoTextual(request, "NSINIES");
		BigDecimal NDEFRAU = getCampoNumerico(request, "CFRAUDE");

		Map map = PAC_IAX_SINIESTROS.ejecutaPAC_IAX_SINIESTROS__F_GET_OBJETO_DEFRAUDADORES(NSINIES);
		logger.debug(map);
		listValores.put("lst_fraudes", (List) tratarRETURNyMENSAJES(request, map, false));

		formdata.put("listvalores", listValores);

	}

	/**
	 * M�todo que se llama al inicio de este flujo. Realiza la carga inicial de los
	 * datos de los combos.
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_form(HttpServletRequest request, Axissin052Action thisAction) {
		logger.debug("Axissin052Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		logger.debug("Axissin052Service m_form");

		try {

			this.cargarListas(request);
			this.formattingNumericValues(request);

		} catch (Exception e) {
			logger.error("Error en el servicio Axissin052Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}

	public void m_eliminar_fraude(HttpServletRequest request, Axissin052Action thisAction) {
		logger.debug("Axissin052Service m_eliminar_fraude");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		logger.debug("Axissin052Service m_eliminar_fraude");

		try {

			String NSINIES = getCampoTextual(request, "NSINIES");
			BigDecimal NDEFRAU = getCampoNumerico(request, "NDEFRAU");

			PAC_IAX_SINIESTROS pac_axis_siniestros = new PAC_IAX_SINIESTROS(
					(Connection) request.getAttribute(Constantes.DB01CONN));
			Map map = pac_axis_siniestros.ejecutaPAC_IAX_SINIESTROS__F_DEL_OBJETO_DEFRAUDADOR(NSINIES, NDEFRAU);
			logger.debug(map);
			BigDecimal resultado = (BigDecimal) tratarRETURNyMENSAJES(request, map);
			if (resultado.intValue() == 0) {
				request.setAttribute("resultado_del", "OK");
			} else {
				request.setAttribute("resultado_del", "KO");
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axissin052Service - m�todo m_eliminar_fraude", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}

	public void m_guardar(HttpServletRequest request, Axissin052Action thisAction) {

		AESUtil encryptedVal = new AESUtil();
		logger.debug("Axissin052Service m_guardar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {

			PAC_IAX_SINIESTROS pac_axis_siniestros = new PAC_IAX_SINIESTROS(
					(Connection) request.getAttribute(Constantes.DB01CONN));

			PAC_IAX_PERSONA pac_axis_persona = new PAC_IAX_PERSONA(
					(Connection) request.getAttribute(Constantes.DB01CONN));
			request.setAttribute("OK", "!OK");
			BigDecimal SSEGURO = this.getCampoNumerico(request, "SSEGURO");
			logger.debug("SSEGURO-->" + SSEGURO);
			String NSINIES = this.getCampoTextual(request, "NSINIES");
			logger.debug("NSINIES-->" + NSINIES);
			BigDecimal NTRAMIT = getCampoNumerico(request, "NTRAMIT");
			logger.debug("NTRAMIT-->" + NTRAMIT);
			BigDecimal CTIPDES = getCampoNumerico(request, "CTIPDES");
			logger.debug("CTIPDES-->" + CTIPDES);
			BigDecimal SIDEPAG = getCampoNumerico(request, "SIDEPAG");
			logger.debug("SIDEPAG-->" + SIDEPAG);
			BigDecimal SPERSON = getCampoNumerico(request, "SPERSON");
			logger.debug("SPERSON-->" + SPERSON);
			BigDecimal CTIPBAN = getCampoNumerico(request, "CTIPBAN");
			logger.debug("CTIPBAN-->" + CTIPBAN);
			String CBANCAR = getCampoTextual(request, "CBANCAR");
			logger.debug("CBANCAR-->" + CBANCAR);
			BigDecimal encrypt_BANC = getCampoNumerico(request, "encrypt_BANC");
			logger.debug("encrypt_BANC-->" + encrypt_BANC);

			if (!isEmpty(encrypt_BANC) && encrypt_BANC.intValue() == 1) {
				CBANCAR = encryptedVal.decrypt(CBANCAR);
				logger.debug("CBANCAR-->" + CBANCAR);
			}

			BigDecimal CTIPPAG = getCampoNumerico(request, "CTIPPAG");
			logger.debug("CTIPPAG-->" + CTIPPAG);
			BigDecimal CCONPAG = getCampoNumerico(request, "CCONPAG");
			logger.debug("CCONPAG-->" + CCONPAG);
			BigDecimal CCAUIND = getCampoNumerico(request, "CCAUIND");
			logger.debug("CCAUIND-->" + CCAUIND);
			BigDecimal CFORPAG = getCampoNumerico(request, "CFORPAG");
			logger.debug("CFORPAG-->" + CFORPAG);
			BigDecimal ISINRET = getCampoNumerico(request, "ISINRET");
			logger.debug("ISINRET-->" + ISINRET);
			BigDecimal ICONRET = getCampoNumerico(request, "ICONRET");
			logger.debug(ICONRET);
			BigDecimal IRESRED = getCampoNumerico(request, "IRESRED");
			logger.debug(IRESRED);
			BigDecimal IRESRCM = getCampoNumerico(request, "IRESRCM");
			logger.debug(IRESRCM);
			BigDecimal ISINRETPAG = getCampoNumerico(request, "ISINRETPAG");
			logger.debug(ISINRETPAG);
			BigDecimal IFRANQ = getCampoNumerico(request, "IFRANQ");
			logger.debug(IFRANQ);
			BigDecimal ISUPLID = getCampoNumerico(request, "ISUPLID");
			logger.debug(ISUPLID);
			BigDecimal IIVA = getCampoNumerico(request, "IIVA");
			logger.debug(IIVA);
			BigDecimal PRETENC = getCampoNumerico(request, "PRETENC");
			logger.debug(PRETENC);
			BigDecimal ICONRETP = getCampoNumerico(request, "ICONRETP");
			logger.debug(ICONRETP);
			BigDecimal IRETENCPAG = getCampoNumerico(request, "IRETENCPAG");
			logger.debug(IRETENCPAG);
			BigDecimal IIVAPAG = getCampoNumerico(request, "IIVAPAG");
			logger.debug(IIVAPAG);
			BigDecimal ISUPLIDPAG = getCampoNumerico(request, "ISUPLIDPAG");
			logger.debug(ISUPLIDPAG);
			BigDecimal IFRANQPAG = getCampoNumerico(request, "IFRANQPAG");
			logger.debug(IFRANQPAG);
			String NFACREF = getCampoTextual(request, "NFACREF");
			logger.debug("NFACREF-->" + NFACREF);
			Date FORDPAG = this.stringToSqlDate(getCampoTextual(request, "FORDPAG"));
			logger.debug("FORDPAG-->" + FORDPAG);
			Date FCAMBIO = this.stringToSqlDate(getCampoTextual(request, "FCAMBIO"));
			logger.debug("FCAMBIO-->" + FCAMBIO);
			Date FFACREF = this.stringToSqlDate(getCampoTextual(request, "FFACREF"));
			logger.debug("FFACREF-->" + FFACREF);
			String CMONRES = this.getCampoTextual(request, "CMONRES");
			logger.debug(CMONRES);
			String CMONPAG = this.getCampoTextual(request, "CMONPAG");
			logger.debug(CMONPAG);
			BigDecimal CAGENTE = this.getCampoNumerico(request, "CAGENTE");
			BigDecimal CULTPAG = getCampoNumerico(request, "CULTPAG");
			logger.debug("CULTPAG:" + CULTPAG);

			if (CULTPAG == null) {
				CULTPAG = new BigDecimal(0);
			}

			// bug 0024690 de ASN
			BigDecimal IRETENC = getCampoNumerico(request, "IRETENC");
			logger.debug(IRETENC);

			Map map = pac_axis_siniestros.ejecutaPAC_IAX_SINIESTROS__F_SET_OBJ_SINTRAMI_PAGO_RECOB(SSEGURO, SIDEPAG,
					NSINIES, NTRAMIT, CTIPDES, CTIPPAG, CCONPAG, CCAUIND, CFORPAG, FORDPAG, CTIPBAN, CBANCAR, CMONRES,
					ISINRET, ICONRET, PRETENC, IRETENC, IIVA, ISUPLID, IFRANQ, IRESRED, IRESRCM, CMONPAG, ISINRETPAG,
					ICONRETP, IRETENCPAG, IIVAPAG, ISUPLIDPAG, IFRANQPAG, FCAMBIO, NFACREF, FFACREF, SPERSON, null,
					CULTPAG, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null,
					null, null, null, null, null, null, null);

			logger.debug(map);

			if (((BigDecimal) tratarRETURNyMENSAJES(request, map)).intValue() == 0) {
				String isnew = getCampoTextual(request, "isNew");
				BigDecimal sidepagout = (BigDecimal) map.get("PSIDEPAGOUT");
				request.setAttribute("OK", "OK"); // guardamos, etc y no ha habido error
				request.setAttribute("PSIDEPAGOUT", sidepagout);
				request.setAttribute("isNew", isnew);

				if (!isEmpty(CBANCAR)) {

					Map map2 = pac_axis_persona.ejecutaPAC_IAX_PERSONA__F_EXISTE_CCC(SPERSON, CAGENTE, CBANCAR,
							CTIPBAN);
					logger.debug(map2);

					if (isEmpty(tratarRETURNyMENSAJES(request, map2))) {
						// si no nos devuelve el cnorban, quiere decir que no existe por lo tanto
						// a�adimos la cuenta

						Map map22 = pac_axis_persona.ejecutaPAC_IAX_PERSONA__F_SET_CCC(SPERSON, CAGENTE, null, CTIPBAN,
								CBANCAR, new BigDecimal(0));
						if (new BigDecimal(String.valueOf(tratarRETURNyMENSAJES(request, map22))).intValue() == 0) {
							isnew = getCampoTextual(request, "isNew");
							sidepagout = (BigDecimal) map.get("PSIDEPAGOUT");
							request.setAttribute("OK", "OK"); // guardamos, etc y no ha habido error
							request.setAttribute("PSIDEPAGOUT", sidepagout);
							request.setAttribute("isNew", isnew);
						}
					} else {
						isnew = getCampoTextual(request, "isNew");
						sidepagout = (BigDecimal) map.get("PSIDEPAGOUT");
						request.setAttribute("OK", "OK"); // guardamos, etc y no ha habido error
						request.setAttribute("PSIDEPAGOUT", sidepagout);
						request.setAttribute("isNew", isnew);
					}

				}

			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axissin052Service - m�todo m_guardar", e);
			thisAction.guardarMensaje(request, "1000052", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	public void m_recargar(HttpServletRequest request, Axissin052Action thisAction) {

		logger.debug("Axissin052Service m_recargar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {
			this.cargarListas(request);
			this.formattingNumericValues(request);
		} catch (Exception e) {
			logger.error("Error en el servicio Axissin052Service - m�todo m_recargar", e);
			thisAction.guardarMensaje(request, "1000052", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	public void m_ajax_actualizar_combos(HttpServletRequest request) {
		logger.debug("Axissin052Service m_actualizar_combos");
		AjaxContainerService ajax = new AjaxContainerService();
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {

			BigDecimal CTIPPAG = getCampoNumerico(request, "CTIPPAG");

			BigDecimal psproduc = getCampoNumerico(request, "SPRODUC");

			PAC_IAX_LISTVALORES_SIN pacIaxListValoresSin = new PAC_IAX_LISTVALORES_SIN(
					(Connection) request.getAttribute(Constantes.DB01CONN));
			Map cconpag = pacIaxListValoresSin.ejecutaPAC_IAX_LISTVALORES_SIN__F_GET_LSTCCONPAG_DEP(CTIPPAG, psproduc);
			ArrayList contenido = (ArrayList) tratarRETURNyMENSAJES(request, cconpag);
			logger.debug(contenido);
			ajax.rellenarPlAContenedorAjax(cconpag);
			ajax.guardarContenidoFinalAContenedorAjax(contenido);

		} catch (Exception e) {
			logger.error("Error en el servicio Axissin052Service - m�todo m_selected_asegurado", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.getSession().setAttribute("axisctr_asegurado", ajax.getAjaxContainer());
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}

	}

}
