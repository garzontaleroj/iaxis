package axis.service.modal;

import java.math.BigDecimal;
import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_COMMON;
import axis.jdbc.PAC_IAX_LIQUIDA;
import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.jdbc.PAC_IAX_REDCOMERCIAL;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.control.modal.Axisctr081Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

/**
 * Axisctr081Service.java 06/03/2009
 * 
 * @since Java 5.0
 */
@SuppressWarnings("all")
public class Axisctr081Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());
	private String pmodo;

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE INICIALIZACION
	 *******************************************/

	/*********************************************************************************************************************/
	public

			void m_init(HttpServletRequest request, Axisctr081Action thisAction) {
		logger.debug("Axisctr081Service m_init");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {
			pmodo = (String) AbstractDispatchAction.topPila(request, "CMODO");

			String cmodo = this.getCampoTextual(request, "PMODO");

			if (cmodo.equals("1")) {
				AbstractDispatchAction.topPila(request, "CMODO", "ALTA");
			} else if (cmodo.equals("0")) {
				AbstractDispatchAction.topPila(request, "CMODO", "MODIFICACION");
			} else if (cmodo.equals("2"))
				AbstractDispatchAction.topPila(request, "CMODO", "CONSULTA");

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr081Service - m�todo m_init", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);

		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	/**
	 * 
	 * @param request
	 */
	public void m_form(HttpServletRequest request, Axisctr081Action thisAction) {
		logger.debug("Axisctr081Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {
			String cmodo = this.getCampoTextual(request, "PMODO");
			BigDecimal CEMPRES = this.getCampoNumerico(request, "CEMPRES");
			BigDecimal CAGENTE = this.getCampoNumerico(request, "CAGENTE");
			BigDecimal NNUMLIN = this.getCampoNumerico(request, "NNUMLIN");
			BigDecimal SSEGURO = this.getCampoNumerico(request, "SSEGURO");
			PAC_IAX_LIQUIDA pac_axis_liquida = new PAC_IAX_LIQUIDA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			PAC_IAX_REDCOMERCIAL pac_axis_redcomercial = new PAC_IAX_REDCOMERCIAL(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			if (cmodo.equals("0") || cmodo.equals("2")) {
				Map m = pac_axis_liquida.ejecutaPAC_IAX_LIQUIDA__F_GET_DATOS_CTA(CEMPRES, CAGENTE, NNUMLIN);
				logger.debug(m);
				if (((BigDecimal) this.tratarRETURNyMENSAJES(request, m)).equals(BigDecimal.ZERO)) {
					ArrayList l = (ArrayList) m.get("PCURDETCUENT");
					if (!isEmpty(l) && l.size() > 0) {
						formdata.putAll((Map) l.get(0));

					}

				}

			} else {
				java.sql.Date d = new java.sql.Date(new java.util.Date().getTime());
				if (!isEmpty(CAGENTE)) {
					Map map = pac_axis_redcomercial.ejecutaPAC_IAX_REDCOMERCIAL__F_GET_AGENTES(CEMPRES, d, CAGENTE,
							null, null, null, null, null, null, null, null, null, null, null, null, null, null, null,
							null, null, null, null, null, null, null, null, null);
					logger.debug(map);

					List l = (List) this.tratarRETURNyMENSAJES(request, map);
					if (!isEmpty(l) && l.size() > 0) {
						HashMap m = (HashMap) l.get(0);
						formdata.putAll(m);
					}
				}
			}

			if (!isEmpty(SSEGURO)) {
				PAC_IAX_COMMON pac_axis_common = new PAC_IAX_COMMON(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
				Map m = pac_axis_common.ejecutaPAC_IAX_COMMON__F_GET_NPOLIZA(SSEGURO, "POL");
				logger.debug(m);
				if (!isEmpty(m.get("ONPOLIZA")))
					formdata.put("NPOLIZA", m.get("ONPOLIZA"));
				if (!isEmpty(m.get("ONCERTIF")))
					formdata.put("NCERTIF", m.get("ONCERTIF"));

			}

			this.cargarlistas(request, thisAction);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr081Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {

			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	/**
	 * 
	 * @param request
	 */
	public void m_recargar(HttpServletRequest request, Axisctr081Action thisAction) {
		logger.debug("Axisctr081Service m_recargar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {
			BigDecimal SSEGURO = this.getCampoNumerico(request, "SSEGURO");
			if (!isEmpty(SSEGURO)) {
				PAC_IAX_COMMON pac_axis_common = new PAC_IAX_COMMON(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
				Map m = pac_axis_common.ejecutaPAC_IAX_COMMON__F_GET_NPOLIZA(SSEGURO, "POL");
				logger.debug(m);
				if (!isEmpty(m.get("ONPOLIZA")))
					formdata.put("NPOLIZA", m.get("ONPOLIZA"));
				if (!isEmpty(m.get("ONCERTIF")))
					formdata.put("NCERTIF", m.get("ONCERTIF"));

			}
			BigDecimal IMPORTE = this.getCampoNumerico(request, "IIMPORT");
			formdata.put("IIMPORT", IMPORTE);
			this.cargarlistas(request, thisAction);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr081Service - m�todo m_recargar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {

			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	private void cargarlistas(HttpServletRequest request, Axisctr081Action thisAction) throws Exception {
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map listValores = new HashMap();
		// Carga de las PAC_IAX PL/SQL
		PAC_IAX_LISTVALORES pac_axis_listValores = new PAC_IAX_LISTVALORES(
				(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

		BigDecimal CCONCEPTO = this.getCampoNumerico(request, "CCONCEPTO");
		Map m = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTCONCEP_CTA();
		logger.debug(m);
		listValores.put("lstconcep", (List) tratarRETURNyMENSAJES(request, m));

		if (!isEmpty(CCONCEPTO)) {
			m = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTTIPO_CTA(CCONCEPTO);
			logger.debug(m);
			listValores.put("lsttipocta", (List) tratarRETURNyMENSAJES(request, m));
		}

		m = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(800017));
		logger.debug(m);
		listValores.put("lstcfiscal", (List) tratarRETURNyMENSAJES(request, m));

		formdata.put("listvalores", listValores);
	}

	/**
	 * 
	 * @param request
	 */
	public void m_guardar(HttpServletRequest request, Axisctr081Action thisAction) {
		logger.debug("Axisctr081Service m_guardar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {
			PAC_IAX_LIQUIDA pac_axis_liquida = new PAC_IAX_LIQUIDA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			BigDecimal CEMPRES = this.getCampoNumerico(request, "CEMPRES");
			BigDecimal CAGENTE = this.getCampoNumerico(request, "CAGENTE");
			BigDecimal NNUMLIN = this.getCampoNumerico(request, "NNUMLIN");
			BigDecimal CDEBHAB = this.getCampoNumerico(request, "CDEBHAB");
			BigDecimal IMPORTE = this.getCampoNumerico(request, "IIMPORT");
			formdata.put("IIMPORT", IMPORTE);
			String NDOCUME = this.getCampoTextual(request, "NDOCUME");
			String TDESCRIP = this.getCampoTextual(request, "TDESCRIP");
			BigDecimal MODO = this.getCampoNumerico(request, "PMODO");
			BigDecimal NRECIBO = this.getCampoNumerico(request, "NRECIBO");
			BigDecimal NSINIES = this.getCampoNumerico(request, "NSINIES");
			BigDecimal CCONCEPTO = this.getCampoNumerico(request, "CCONCEPTO");
			BigDecimal SSEGURO = this.getCampoNumerico(request, "SSEGURO");
			BigDecimal NPOLIZA = this.getCampoNumerico(request, "NPOLIZA");
			BigDecimal NCERTIF = this.getCampoNumerico(request, "NCERTIF");
			java.sql.Date FFECMOV = this.stringToSqlDate(this.getCampoTextual(request, "FFECMOV"));
			java.sql.Date FVALOR = this.stringToSqlDate(this.getCampoTextual(request, "FVALOR"));
			if (isEmpty(FVALOR))
				FVALOR = new Date(new java.util.Date().getTime());
			BigDecimal CFISCAL = this.getCampoNumerico(request, "CFISCAL");

			BigDecimal ok = new BigDecimal(0);
			if (isEmpty(SSEGURO) && !isEmpty(NPOLIZA)) {
				Map map = pac_axis_liquida.ejecutaPAC_IAX_LIQUIDA__F_GET_SSEGURO(NPOLIZA, NCERTIF, "POL");
				ok = (BigDecimal) this.tratarRETURNyMENSAJES(request, map);
				logger.debug(map);
				logger.debug(!isEmpty(map.get("PSSEGURO")));
				if (ok.intValue() == 0 && !isEmpty(map.get("PSSEGURO"))) {
					formdata.put("SSEGURO", map.get("PSSEGURO"));
					SSEGURO = (BigDecimal) map.get("PSSEGURO");
				}
			}
			if (!isEmpty(SSEGURO) || ok.intValue() == 0) {
				Map m = pac_axis_liquida.ejecutaPAC_IAX_LIQUIDA__F_SET_CTA(CEMPRES, CAGENTE, SSEGURO, NNUMLIN, CDEBHAB,
						IMPORTE, NDOCUME, TDESCRIP, MODO, NRECIBO, NSINIES, CCONCEPTO, FFECMOV, FVALOR, CFISCAL);
				logger.debug(m);
				if (((BigDecimal) tratarRETURNyMENSAJES(request, m)).equals(BigDecimal.ZERO)) {
					formdata.put("OK", "0");
					this.m_salir(request, thisAction);
				}
			}
			cargarlistas(request, thisAction);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr081Service - m�todo m_guardar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));

		}
	}

	/**
	 * 
	 * @param request
	 */
	public void m_salir(HttpServletRequest request, Axisctr081Action thisAction) {
		logger.debug("Axisctr081Service m_salir");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		try {
			logger.debug("modo al entrar-->" + pmodo);
			AbstractDispatchAction.topPila(request, "CMODO", pmodo);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr081Service - m�todo m_salir", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

}
