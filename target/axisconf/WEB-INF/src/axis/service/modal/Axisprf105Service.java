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

import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.jdbc.PAC_IAX_PROF;
import axis.mvc.control.modal.Axisprf105Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AjaxContainerService;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

public class Axisprf105Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	public void m_form(HttpServletRequest request, Axisprf105Action thisAction) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		logger.debug("Axisprf105Service m_form");

		try {
			PAC_IAX_PROF pac_iax_prof = new PAC_IAX_PROF(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			BigDecimal pstarifa = this.getCampoNumerico(request, "pSTARIFA");
			String MODO = this.getCampoTextual(request, "MODO");
			formdata.put("MODO", MODO);

			cargarListas(request);
			if (MODO != null) {
				if (MODO.equalsIgnoreCase("modificar") || MODO.equalsIgnoreCase("actualizar")) {
					BigDecimal psservic = this.getCampoNumerico(request, "SSERVIC");
					Map map = pac_iax_prof.ejecutaPAC_IAX_PROF__F_GET_SERVICIO(pstarifa, psservic);
					logger.debug("++++map servicio: " + map);
					if (((BigDecimal) tratarRETURNyMENSAJES(request, map)).intValue() == 0) {
						formdata.put("OBIAXSERVI", map.get("SERVICIO"));
						PAC_IAX_PROF pac_axis_prof = new PAC_IAX_PROF(
								(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
						BigDecimal CTIPCAL = (BigDecimal) ((HashMap) formdata.get("OBIAXSERVI")).get("CTIPCAL");
						if (CTIPCAL != null) {
							map = pac_axis_prof.ejecutaPAC_IAX_PROF__F_LSTMAGNITUD(CTIPCAL);
							logger.debug("++++LSTCMAGNIT: " + map.get("RETURN"));
							Map listValores = (Map) request.getAttribute("listValores");
							listValores.put("LSTCMAGNIT", (List) tratarRETURNyMENSAJES(request, map));
						}

					}
					logger.debug("++++OBIAXSERVI: " + formdata.get("OBIAXSERVI"));
				}
			}

			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		} catch (Exception e) {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
			logger.error("Error en el servicio Axisprf105Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

	public void m_guardar(HttpServletRequest request, Axisprf105Action thisAction) {
		logger.debug("Axisprf105Service m_guardar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {
			PAC_IAX_PROF pac_axis_prof = new PAC_IAX_PROF(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			request.setAttribute("OK", "!OK");
			BigDecimal STARIFA = this.getCampoNumerico(request, "STARIFA");
			logger.debug("++++STARIFA-->" + STARIFA);
			BigDecimal SSERVIC = getCampoNumerico(request, "SSERVIC");
			logger.debug("++++SSERVIC-->" + SSERVIC);
			String CCODCUP = getCampoTextual(request, "CCODCUP");
			logger.debug("++++CCODCUP-->" + CCODCUP);

			String TDESCRI = getCampoTextual(request, "TDESCRI");
			/**
			 * Para enviar a pantalla AXISSIN045 despu�s del alta de servicio y pueda
			 * buscarlo:
			 **/
			Map tdescri = new HashMap();
			tdescri.put("TDESCRI", TDESCRI);
			formdata.put("OBIAXSERVI", tdescri);

			logger.debug("++++TDESCRI-->" + TDESCRI);
			BigDecimal CUNIMED = getCampoNumerico(request, "CUNIMED");
			logger.debug("++++CUNIMED-->" + CUNIMED);
			BigDecimal IPRECIO = getCampoNumerico(request, "IPRECIO");
			logger.debug("++++IPRECIO-->" + IPRECIO);
			BigDecimal CTIPCAL = getCampoNumerico(request, "CTIPCAL");
			logger.debug("++++CTIPCAL-->" + CTIPCAL);
			BigDecimal CMAGNIT = getCampoNumerico(request, "CMAGNIT");
			logger.debug("++++CMAGNIT-->" + CMAGNIT);
			BigDecimal IMINIMO = getCampoNumerico(request, "IMINIMO");
			logger.debug("++++IMINIMO-->" + IMINIMO);
			BigDecimal CSELECC = getCampoNumerico(request, "CSELECC");
			if (CSELECC == null) {
				CSELECC = new BigDecimal(0);
			}
			logger.debug("++++CSELECC-->" + CSELECC);

			BigDecimal CTIPSER = getCampoNumerico(request, "CTIPSER");
			logger.debug("++++CTIPSER-->" + CTIPSER);
			Date FINIVIG = stringToSqlDate(getCampoTextual(request, "FINIVIG"));
			Date FFINVIG = stringToSqlDate(getCampoTextual(request, "FFINVIG"));

			String MODO = this.getCampoTextual(request, "MODO");
			Map map = new HashMap();

			if (MODO != null) {
				if (MODO.equalsIgnoreCase("actualizar")) {
					map = pac_axis_prof.ejecutaPAC_IAX_PROF__F_ACTUALIZA_SERVICIO(STARIFA, SSERVIC, IPRECIO, IMINIMO,
							FINIVIG);
				} else {
					map = pac_axis_prof.ejecutaPAC_IAX_PROF__F_SET_SERVICIO(STARIFA, SSERVIC, CCODCUP, TDESCRI, CUNIMED,
							IPRECIO, CTIPCAL, CMAGNIT, IMINIMO, CSELECC, CTIPSER, FINIVIG, FFINVIG);
				}
			} else {
				map = pac_axis_prof.ejecutaPAC_IAX_PROF__F_SET_SERVICIO(STARIFA, SSERVIC, CCODCUP, TDESCRI, CUNIMED,
						IPRECIO, CTIPCAL, CMAGNIT, IMINIMO, CSELECC, CTIPSER, FINIVIG, FFINVIG);
			}
			logger.debug(map);
			formdata.put("STARIFA_OUT", STARIFA);

			if (((BigDecimal) tratarRETURNyMENSAJES(request, map)).intValue() == 0) {
				request.setAttribute("OK", "OK"); // guardamos, etc y no ha habido error
			}
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		} catch (Exception e) {
			logger.error("Error en el servicio Axisprf105Service - m�todo m_guardar", e);
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
			thisAction.guardarMensaje(request, "1000052", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

	/**
	 * M�todo que carga los datos de administraci�n del producto
	 * 
	 * @param request
	 * @param thisAction
	 * @throws Exception
	 */
	private void cargarListas(HttpServletRequest request) throws Exception {
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map listValores = new HashMap();
		// Carga de las PAC_IAX PL/SQL
		PAC_IAX_LISTVALORES pac_axis_listValores = new PAC_IAX_LISTVALORES(
				(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

		PAC_IAX_PROF pac_iax_prof = new PAC_IAX_PROF((java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

		BigDecimal psconven = this.getCampoNumerico(request, "pSCONVEN");
		logger.debug("++++SCONVEN: " + psconven);
		BigDecimal psprofes = this.getCampoNumerico(request, "pSPROFES");
		logger.debug("++++SPROFES: " + psprofes);
		BigDecimal pstarifa = this.getCampoNumerico(request, "pSTARIFA");

		if (psconven != null) {
			Map map = pac_iax_prof.ejecutaPAC_IAX_PROF__F_GET_TARIFA_PROFESIONAL(psprofes, psconven);
			if (((BigDecimal) tratarRETURNyMENSAJES(request, map)).intValue() == 0) {
				pstarifa = (BigDecimal) map.get("PSTARIFA");
			}
		}

		formdata.put("STARIFA", pstarifa);

		Map mapa = new HashMap();

		if (isEmpty(request.getParameter("SSERVIC"))) {
			mapa = pac_iax_prof.ejecutaPAC_IAX_PROF__F_GET_SSERVIC();
			listValores.put("LSTSSERVIC", (List) tratarRETURNyMENSAJES(request, mapa));
			logger.debug("++++SSERVICa: " + listValores.get("LSTSSERVIC"));
		} else {
			List list = new ArrayList();
			mapa.put("SSERVIC", new BigDecimal(request.getParameter("SSERVIC")));
			list.add(mapa);
			listValores.put("LSTSSERVIC", list);

			logger.debug("++++listValores LSTSSERVIC: " + listValores.get("LSTSSERVIC"));

			Map tdescri = new HashMap();
			tdescri.put("TDESCRI", getCampoTextual(request, "TDESCRI"));
			formdata.put("OBIAXSERVI", tdescri);
			logger.debug("++++formdata OBIAXSERVI: " + formdata.get("OBIAXSERVI"));
		}

		mapa = pac_iax_prof.ejecutaPAC_IAX_PROF__F_GET_LSTCUPS();
		listValores.put("LSTCUPS", (List) tratarRETURNyMENSAJES(request, mapa));
		logger.debug("++++CUPS: " + listValores.get("LSTSCUPS"));

		Map map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(734));
		logger.debug("++++cunimed: " + map.get("RETURN"));
		listValores.put("LSTCUNIMED", (List) tratarRETURNyMENSAJES(request, map));

		map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(732));
		logger.debug("++++ctipcal: " + map.get("RETURN"));
		listValores.put("LSTCTIPCAL", (List) tratarRETURNyMENSAJES(request, map));

		map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(735));
		logger.debug("++++ctipser: " + map.get("RETURN"));
		listValores.put("LSTCTIPSER", (List) tratarRETURNyMENSAJES(request, map));

		request.setAttribute("listValores", listValores);

	}

	private Date fcGetFechaActual() throws Exception {
		java.util.Date today = new java.util.Date();
		java.sql.Date FECHA_ACTUAL = new java.sql.Date(today.getTime());
		return FECHA_ACTUAL;
	}

	public void m_ajax_carga_calculo_precio(HttpServletRequest request) {
		logger.debug("Axisprf105Service m_ajax_carga_calculo_precio");
		AjaxContainerService ajax = new AjaxContainerService();
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {
			PAC_IAX_PROF pac_axis_prof = new PAC_IAX_PROF(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			BigDecimal pPCTIPCAL = getCampoNumerico(request, "CTIPCAL");

			Map map = pac_axis_prof.ejecutaPAC_IAX_PROF__F_LSTMAGNITUD(pPCTIPCAL);
			logger.debug("ejecutaPAC_IAX_PROF__F_LSTMAGNITUD devuelve: " + map);

			List plLista = (List) ajax.rellenarPlAContenedorAjax(map);
			logger.debug("lista ajax: " + plLista);

			ajax.guardarContenidoFinalAContenedorAjax(plLista);
		} catch (Exception e) {
			logger.error("Error en el servicio Axisprf105Service - m�todo m_ajax_carga_calculo_precio", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}
}
