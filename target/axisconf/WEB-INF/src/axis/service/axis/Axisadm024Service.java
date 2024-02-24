package axis.service.axis;

import java.math.BigDecimal;
import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_CODA;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.control.axis.Axisadm024Action;
import axis.mvc.model.UsuarioBean;
import axis.util.Constantes;

/**
 * Axisadm024Service.java 19/02/2009
 * 
 * @since Java 5.0
 */
@SuppressWarnings("all")
public class Axisadm024Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE INICIALIZACION
	 *******************************************/
	/*********************************************************************************************************************/

	/**
	 * 
	 * @param request
	 */
	public void m_form(HttpServletRequest request) {
		logger.debug("Axisadm024Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {

			BigDecimal SPROCES = getCampoNumerico(request, "SPROCES_PANTALLA");
			String loadedOnce = getCampoTextual(request, "loadedOnce");
			BigDecimal CBUSCA = isEmpty(getCampoNumerico(request, "BUSCA")) ? new BigDecimal(0)
					: getCampoNumerico(request, "BUSCA");
			// getCampoNumerico(request, "BUSCA");

			// isEmpty(getCampoNumerico(request, "BUSCA"))? new BigDecimal(0) :
			// getCampoNumerico(request, "BUSCA");

			if (request.getParameter("paginar") != null) {
				// Si estamos paginando, entonces no es la primera carga
				formdata.put("loadedOnce", true);
			}

			if (isEmpty(loadedOnce)) {

				if (isEmpty(SPROCES)) {
					// Si no hay SPROCES de pantalla, igual hay SPROCES_CODA
					SPROCES = getCampoNumerico(request, "SPROCES_CODA");
					// El SPROCES_PANTALLA ser� el de CODA
					formdata.put("SPROCES_PANTALLA", SPROCES);
				}

				if (isEmpty(SPROCES) && CBUSCA.intValue() != 1)
					// Si !loadedOnce (no se ha cargado la pantalla ninguna vez) y no hay SPROCES
					// (CODA)
					// Quiere decir que estamos invocando la pantalla por primera vez desde el men�
					// No nos interesa recuperar ning�n registro
					return;
			}

			BigDecimal CANCCODA = isEmpty(getCampoNumerico(request, "CANCCODA")) ? new BigDecimal(0)
					: getCampoNumerico(request, "CANCCODA");

			if (CANCCODA.intValue() == 1) {
				BigDecimal SPROCES_CANC = getCampoNumerico(request, "SPROCES_CANC");
				BigDecimal NNUMLIN_CANC = getCampoNumerico(request, "NNUMLIN_CANC");
				String CBANCAR1_CANC = getCampoTextual(request, "CBANCAR1_CANC");
				BigDecimal NNUMORD_CANC = getCampoNumerico(request, "NNUMORD_CANC");

				Map map2 = new PAC_IAX_CODA((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_CODA__F_CANCELA_REGISTRO(SPROCES_CANC, NNUMLIN_CANC, CBANCAR1_CANC,
								NNUMORD_CANC);
				logger.debug(map2);

				tratarRETURNyMENSAJES(request, map2);

				if (!BigDecimal.ZERO.equals(tratarRETURNyMENSAJES(request, map2))) {
					return;
				} else {
					m_recargar(request);
				}

			} else {

				Date FECHAINI = stringToSqlDate(getCampoTextual(request, "FECHAINI"));
				Date FECHAFIN = stringToSqlDate(getCampoTextual(request, "FECHAFIN"));
				BigDecimal CTIPREG = getCampoNumerico(request, "CTIPREG");
				BigDecimal NRECIBO = getCampoNumerico(request, "NNUMREC");
				String TNOMBRE = getCampoTextual(request, "TNOMBRE");
				String TDESCRIP = getCampoTextual(request, "TDESCRIP");
				BigDecimal CBANCO = getCampoNumerico(request, "CBANCO");

				Map map = new PAC_IAX_CODA((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_CODA__F_GET_CODA(SPROCES, FECHAINI, FECHAFIN, CTIPREG, NRECIBO, TNOMBRE,
								TDESCRIP, CBANCO);
				logger.debug(map);

				tratarRETURNyMENSAJES(request, map);

				if (BigDecimal.ZERO.equals(tratarRETURNyMENSAJES(request, map))) {
					request.setAttribute("REFCURSOR", map.get("P_REFCURSOR"));

					Map AXISADM024_filtro = new HashMap();

					AXISADM024_filtro.put("SPROCES", SPROCES);
					AXISADM024_filtro.put("FECHAINI", FECHAINI);
					AXISADM024_filtro.put("FECHAFIN", FECHAFIN);
					AXISADM024_filtro.put("CTIPREG", CTIPREG);
					AXISADM024_filtro.put("NRECIBO", NRECIBO);
					AXISADM024_filtro.put("TNOMBRE", TNOMBRE);
					AXISADM024_filtro.put("TDESCRIP", TDESCRIP);
					AXISADM024_filtro.put("CBANCO", CBANCO);

					request.getSession().setAttribute("AXISADM024_filtro", AXISADM024_filtro);
				}
			}

			Date FULTSALD = stringToSqlDate(getCampoTextual(request, "FULTSALD"));
			BigDecimal SDEVOLU = getCampoNumerico(request, "SDEVOLU");
			BigDecimal NNUMLIN = getCampoNumerico(request, "NNUMLIN");
			String CBANCAR = getCampoTextual(request, "CBANCAR1");
			BigDecimal NNUMORD = getCampoNumerico(request, "NNUMORD");

			if (!isEmpty(FULTSALD) && !isEmpty(SDEVOLU) && !isEmpty(NNUMLIN) && !isEmpty(CBANCAR)
					&& !isEmpty(NNUMORD)) {
				Map map = new PAC_IAX_CODA((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_CODA__F_GET_CODA_DETALLE(SDEVOLU, CBANCAR, NNUMORD, FULTSALD, NNUMLIN);

				logger.debug(map);

				tratarRETURNyMENSAJES(request, map);

				if (BigDecimal.ZERO.equals(tratarRETURNyMENSAJES(request, map))) {
					request.setAttribute("REFCURSOR_DETALLE", map.get("P_REFCURSOR"));

				}

			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm024Service - m�todo m_form", e);
			AbstractDispatchAction.guardarMensaje(request,
					"verbatim:<b>" + e.getClass().getName() + ":</b> " + e.getLocalizedMessage(),
					new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

	/*********************************************************************************************************************/
	/************************************************
	 * M�TODOS DE ACTUALIZACI�N
	 *******************************************/
	/*********************************************************************************************************************/
	public void m_reactivar(HttpServletRequest request) {
		logger.debug("Axisadm024Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {

			BigDecimal SPROCES_CANC = getCampoNumerico(request, "SPROCES_CANC");
			BigDecimal NNUMLIN_CANC = getCampoNumerico(request, "NNUMLIN_CANC");
			String CBANCAR1_CANC = getCampoTextual(request, "CBANCAR1_CANC");
			BigDecimal NNUMORD_CANC = getCampoNumerico(request, "NNUMORD_CANC");

			Map map2 = new PAC_IAX_CODA((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_CODA__F_REACTIVAR_REGISTRO(SPROCES_CANC, NNUMLIN_CANC, CBANCAR1_CANC, NNUMORD_CANC);
			logger.debug(map2);

			tratarRETURNyMENSAJES(request, map2);

			if (!BigDecimal.ZERO.equals(tratarRETURNyMENSAJES(request, map2))) {
				return;
			} else {
				m_recargar(request);
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm024Service - m�todo m_form", e);
			AbstractDispatchAction.guardarMensaje(request,
					"verbatim:<b>" + e.getClass().getName() + ":</b> " + e.getLocalizedMessage(),
					new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

	/**
	 * 
	 * @param request
	 */
	public void m_recargar(HttpServletRequest request) {
		logger.debug("Axisadm024Service m_recargar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {

			Map AXISADM024_filtro = (Map) request.getSession().getAttribute("AXISADM024_filtro");

			if (!isEmpty(AXISADM024_filtro)) {
				BigDecimal SPROCES = (BigDecimal) AXISADM024_filtro.get("SPROCES");
				Date FECHAINI = (Date) AXISADM024_filtro.get("FECHAINI");
				Date FECHAFIN = (Date) AXISADM024_filtro.get("FECHAFIN");
				BigDecimal CTIPREG = (BigDecimal) AXISADM024_filtro.get("CTIPREG");
				BigDecimal NRECIBO = (BigDecimal) AXISADM024_filtro.get("NRECIBO");
				String TNOMBRE = (String) AXISADM024_filtro.get("TNOMBRE");
				String TDESCRIP = (String) AXISADM024_filtro.get("TDESCRIP");
				BigDecimal CBANCO = (BigDecimal) AXISADM024_filtro.get("CBANCO");

				Map map = new PAC_IAX_CODA((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_CODA__F_GET_CODA(SPROCES, FECHAINI, FECHAFIN, CTIPREG, NRECIBO, TNOMBRE,
								TDESCRIP, CBANCO);
				logger.debug(map);

				tratarRETURNyMENSAJES(request, map);

				if (BigDecimal.ZERO.equals(tratarRETURNyMENSAJES(request, map))) {
					request.setAttribute("REFCURSOR", map.get("P_REFCURSOR"));

				}
			}

			Date FULTSALD = stringToSqlDate(getCampoTextual(request, "FULTSALD"));
			BigDecimal SDEVOLU = getCampoNumerico(request, "SDEVOLU");
			BigDecimal NNUMLIN = getCampoNumerico(request, "NNUMLIN");
			String CBANCAR = getCampoTextual(request, "CBANCAR1");
			BigDecimal NNUMORD = getCampoNumerico(request, "NNUMORD");

			if (!isEmpty(FULTSALD) && !isEmpty(SDEVOLU) && !isEmpty(NNUMLIN) && !isEmpty(CBANCAR)
					&& !isEmpty(NNUMORD)) {
				Map map = new PAC_IAX_CODA((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_CODA__F_GET_CODA_DETALLE(SDEVOLU, CBANCAR, NNUMORD, FULTSALD, NNUMLIN);

				logger.debug(map);

				tratarRETURNyMENSAJES(request, map);

				if (BigDecimal.ZERO.equals(tratarRETURNyMENSAJES(request, map))) {
					request.setAttribute("REFCURSOR_DETALLE", map.get("P_REFCURSOR"));

				}

			}
			formdata.put("FULTSALD2", getCampoTextual(request, "FULTSALD"));

		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm024Service - m�todo m_recargar", e);
			AbstractDispatchAction.guardarMensaje(request,
					"verbatim:<b>" + e.getClass().getName() + ":</b> " + e.getLocalizedMessage(),
					new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

	public void m_cargar_detalle(HttpServletRequest request) {
		logger.debug("Axisadm024Service m_cargar_detalle");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {

			Date FULTSALD = stringToSqlDate(getCampoTextual(request, "FULTSALD"));
			BigDecimal SDEVOLU = getCampoNumerico(request, "SDEVOLU");
			BigDecimal NNUMLIN = getCampoNumerico(request, "NNUMLIN");
			String CBANCAR = getCampoTextual(request, "CBANCAR1");
			BigDecimal NNUMORD = getCampoNumerico(request, "NNUMORD");

			Map map = new PAC_IAX_CODA((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_CODA__F_GET_CODA_DETALLE(SDEVOLU, CBANCAR, NNUMORD, FULTSALD, NNUMLIN);

			logger.debug(map);

			tratarRETURNyMENSAJES(request, map);

			if (BigDecimal.ZERO.equals(tratarRETURNyMENSAJES(request, map))) {
				request.setAttribute("REFCURSOR_DETALLE", map.get("P_REFCURSOR"));

			}

			this.m_recargar(request);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm024Service - m�todo m_recargar", e);
			AbstractDispatchAction.guardarMensaje(request,
					"verbatim:<b>" + e.getClass().getName() + ":</b> " + e.getLocalizedMessage(),
					new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

	/**
	 * @param request
	 */
	public void m_imprimir(HttpServletRequest request) {
		logger.debug("Axisadm024Service m_imprimir");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {

			Map AXISADM024_filtro = (Map) request.getSession().getAttribute("AXISADM024_filtro");

			if (!isEmpty(AXISADM024_filtro)) {

				BigDecimal SPROCES = (BigDecimal) AXISADM024_filtro.get("SPROCES");
				Date FECHAINI = (Date) AXISADM024_filtro.get("FECHAINI");
				Date FECHAFIN = (Date) AXISADM024_filtro.get("FECHAFIN");
				BigDecimal CTIPREG = (BigDecimal) AXISADM024_filtro.get("CTIPREG");
				BigDecimal NRECIBO = (BigDecimal) AXISADM024_filtro.get("NRECIBO");
				String TNOMBRE = (String) AXISADM024_filtro.get("TNOMBRE");
				String TDESCRIP = (String) AXISADM024_filtro.get("TDESCRIP");
				BigDecimal CBANCO = (BigDecimal) AXISADM024_filtro.get("CBANCO");

				Map map = new PAC_IAX_CODA((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_CODA__F_EXCEL_CODA(SPROCES, FECHAINI, FECHAFIN, CTIPREG, NRECIBO, TNOMBRE,
								TDESCRIP, CBANCO);
				logger.debug(map);

				if (BigDecimal.ZERO.equals(tratarRETURNyMENSAJES(request, map))) {
					request.getSession().setAttribute("FICHERO", map.get("P_RUTA"));
				}
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm024Service - m�todo m_excel", e);
			AbstractDispatchAction.guardarMensaje(request,
					"verbatim:<b>" + e.getClass().getName() + ":</b> " + e.getLocalizedMessage(),
					new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

	public void m_navegar(HttpServletRequest request, Axisadm024Action thisAction) {
		logger.debug("Axisadm024Service m_navegar");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {

			// Push de los datos necesarios a la pila
			Date FULTSALD = stringToSqlDate(getCampoTextual(request, "FULTSALD2"));
			BigDecimal SDEVOLU = getCampoNumerico(request, "SDEVOLU");
			BigDecimal NNUMLIN = getCampoNumerico(request, "NNUMLIN");
			String CBANCAR = getCampoTextual(request, "CBANCAR1");
			BigDecimal NNUMORD = getCampoNumerico(request, "NNUMORD");

			thisAction.topPila(request, "FULTSALD", FULTSALD);
			thisAction.topPila(request, "SDEVOLU", SDEVOLU);
			thisAction.topPila(request, "SPROCES", SDEVOLU);
			thisAction.topPila(request, "NNUMLIN", NNUMLIN);
			thisAction.topPila(request, "CBANCAR", CBANCAR);
			thisAction.topPila(request, "NNUMORD", NNUMORD);

			thisAction.topPila(request, "formdata_axisadm024", formdata);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm024Service - m�todo m_navegar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}

	}

	public void m_volver(HttpServletRequest request, Axisadm024Action thisAction) {
		logger.debug("Axisadm024Service m_volver");
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {

			Date FULTSALD = (Date) thisAction.removeTopPila(request, "FULTSALD");
			BigDecimal SDEVOLU = ((BigDecimal) thisAction.removeTopPila(request, "SDEVOLU"));
			BigDecimal SPROCES = ((BigDecimal) thisAction.removeTopPila(request, "SPROCES"));
			BigDecimal NNUMLIN = ((BigDecimal) thisAction.removeTopPila(request, "NNUMLIN"));
			String CBANCAR = (String) thisAction.removeTopPila(request, "CBANCAR");
			BigDecimal NNUMORD = ((BigDecimal) thisAction.removeTopPila(request, "NNUMORD"));

			formdata.put("FULTSALD", FULTSALD);
			formdata.put("SDEVOLU", SDEVOLU);
			formdata.put("SPROCES", SPROCES);
			formdata.put("NNUMLIN", NNUMLIN);
			// formdata.put("CBANCAR", CBANCAR);
			formdata.put("CBANCAR1", CBANCAR);
			formdata.put("NNUMORD", NNUMORD);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm024Service - m�todo m_volver", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.m_recargar(request);
		this.configForm(request, this.whoami(this));
		this.cargaDependencias(request, (List) request.getAttribute("DEPENDENCIAS"));
	}
}
