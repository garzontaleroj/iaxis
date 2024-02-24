package axis.service.modal;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_LISTVALORES_AUT;
import axis.jdbc.PAC_IAX_PRODUCCION_AUT;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.control.modal.Axisctr059Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AjaxContainerService;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

//import axis.jdbc.PAC_IAX_LISTVALORES;

/**
 * Axisctr059Service.java
 * 
 * @author <a href="mailto:amartinez@csi-ti.com">Alex Martinez</a>
 */
public class Axisctr059Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE INICIALIZACION
	 *******************************************/
	/*********************************************************************************************************************/

	public void m_init(HttpServletRequest request, Axisctr059Action thisAction) {
		logger.debug("Axisctr059Service m_init");
		try {
			this.formattingNumericValues(request);
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr059Service - m�todo m_init", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	public void m_form(HttpServletRequest request, Axisctr059Action thisAction) {
		logger.debug("Axisctr059Service m_form");
		try {
			this.formattingNumericValues(request);
			UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

			String CVERSION = getCampoTextual(request, "CVERSION");
			logger.debug("---------- VALOR version  :" + CVERSION);

			// INI - BUG 28455/156697 - RCL - En simulaci�n no carga los accesorios
			BigDecimal NRIESGO = getCampoNumerico(request, "NRIESGO");
			logger.debug("----- riesgo session:" + getCampoNumerico(request, "NRIESGO"));

			if ((isEmpty(NRIESGO) || NRIESGO.intValue() == 0)
					&& !isEmpty(AbstractDispatchAction.topPila(request, "NRIESGO")))
				NRIESGO = (BigDecimal) AbstractDispatchAction.topPila(request, "NRIESGO");
			logger.debug("----- riesgo pila:" + NRIESGO);
			// FIN - BUG 28455/156697 - RCL - En simulaci�n no carga los accesorios

			Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
			if (!isEmpty(CVERSION)) {
				Map map = new PAC_IAX_LISTVALORES_AUT((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_LISTVALORES_AUT__F_GET_VERSION(CVERSION, new BigDecimal(0), null);
				logger.debug(map);
				if (!isEmpty(tratarRETURNyMENSAJES(request, map))) {
					List version = (List) tratarRETURNyMENSAJES(request, map);
					logger.debug(version);
					formdata.put("VERSION", version.get(0));
				}
				map = new PAC_IAX_LISTVALORES_AUT((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_LISTVALORES_AUT__F_GET_LSTACCESORIOS();
				logger.debug(map);
				if (!isEmpty(tratarRETURNyMENSAJES(request, map))) {

					formdata.put("lstaccesorios", tratarRETURNyMENSAJES(request, map));
				}

				map = new PAC_IAX_LISTVALORES_AUT((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_LISTVALORES_AUT__F_GET_LSTACCESORIOSSERIE(CVERSION);
				logger.debug(map);
				if (!isEmpty(tratarRETURNyMENSAJES(request, map))) {
					List serie = (List) tratarRETURNyMENSAJES(request, map);
					logger.debug(serie);
					formdata.put("SERIE", serie.get(0));
				}

				// if(isEmpty(request.getSession().getAttribute("NO_SERIE"))) {
				List no_serie = null;
				Map map2 = new PAC_IAX_PRODUCCION_AUT((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_PRODUCCION_AUT__F_LEE_ACCESORIOSNOSERIE(CVERSION);
				logger.debug(map2);

				if (!isEmpty(map)) {
					no_serie = (List) tratarRETURNyMENSAJES(request, map2);

					// formdata.put("NO_SERIE", no_serie);
					// request.getSession().setAttribute("NO_SERIE",no_serie);
				}

				Map map3 = new PAC_IAX_PRODUCCION_AUT((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_PRODUCCION_AUT__F_LEE_ACCESORIOS(NRIESGO);
				logger.debug(map3);

				List no_serie_sel = null;
				if (!isEmpty(map)) {
					no_serie_sel = (List) tratarRETURNyMENSAJES(request, map3);

					logger.debug(no_serie_sel);
					// formdata.put("NO_SERIE", no_serie);
					// request.getSession().setAttribute("NO_SERIE_SEL",no_serie_sel);
				}

				List accesorios;
				request.getSession().setAttribute("NO_SERIE", null);
				int encontrado = 0;
				if (!isEmpty(no_serie_sel)) {
					accesorios = no_serie_sel;
					if (!isEmpty(no_serie)) {
						logger.debug("--- tama�o no_serie:" + no_serie.size());
						for (int i = 0; i < no_serie.size(); i++) {

							encontrado = 0;
							String caccesorio = (String) ((Map) ((Map) no_serie.get(i)).get("OB_IAX_AUTACCESORIOS"))
									.get("CACCESORIO");

							for (int v = 0; v < no_serie_sel.size(); v++) {
								logger.debug("--- tama�o no_serie_sel:" + no_serie_sel.size() + " v:" + v);
								String caccesorio_sel = (String) ((Map) ((Map) no_serie_sel.get(v))
										.get("OB_IAX_AUTACCESORIOS")).get("CACCESORIO");
								logger.debug("--- caccesorio_sel:" + caccesorio_sel + " caccesorio:" + caccesorio);
								if (caccesorio_sel.equals(caccesorio)) {
									encontrado = 1;
								}
							}
							if (encontrado == 0) {
								accesorios.add(no_serie.get(i));
							}
						}
					}
				} else {
					accesorios = no_serie;
				}
				logger.debug("------- Union accesorios:" + accesorios);

				request.getSession().setAttribute("NO_SERIE", accesorios);

				float total = 0;
				if (!isEmpty(accesorios)) {
					for (int a = 0; a < accesorios.size(); a++) {
						if (((BigDecimal) ((Map) ((Map) accesorios.get(a)).get("OB_IAX_AUTACCESORIOS")).get("CMARCADO"))
								.intValue() == 1)
							total = total + ((BigDecimal) ((Map) ((Map) accesorios.get(a)).get("OB_IAX_AUTACCESORIOS"))
									.get("IVALACC")).floatValue();
					}
				}
				formdata.put("TOTAL", total);
				request.setAttribute("TOT", total);

			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr059Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			// Gesti�n de campos y dependencias
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}

	public void m_selecAccesorio(HttpServletRequest request, Axisctr059Action thisAction) {
		logger.debug("Axisctr059Service m_selecAccesorio");
		try {
			this.formattingNumericValues(request);
			UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
			Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

			String CVERSION = getCampoTextual(request, "CVERSION");
			String CACCESORIO = getCampoTextual(request, "CACCESORIO");
			String TDESCRIPCION = getCampoTextual(request, "TDESCRIPCION");
			BigDecimal IVALACC = getCampoNumerico(request, "IVALOR");
			BigDecimal CTIPACC = getCampoNumerico(request, "CTIPACC");
			String MARCADO = getCampoTextual(request, "MARCADO");
			BigDecimal NRIESGO = (BigDecimal) AbstractDispatchAction.topPila(request, "NRIESGO");
			BigDecimal CVEHB7 = getCampoNumerico(request, "CVEHB7");
			BigDecimal TOTAL = null;// getCampoNumerico(request,"TOTAL");
			try {
				TOTAL = new BigDecimal(request.getParameter("TOTAL"));
			} catch (Exception ee) {
				logger.warn("no he podido parsear TOTAL");
				TOTAL = getCampoNumerico(request, "TOTAL");
			}
			BigDecimal CASEGURABLE = getCampoNumerico(request, "CASEGURABLE");

			logger.debug("total-->" + TOTAL);

			float total = 0;
			BigDecimal CMARCADO;
			if (MARCADO.equals("true")) {
				CMARCADO = new BigDecimal(1);
				if (isEmpty(TOTAL)) {
					total = 0;
				} else {
					total = TOTAL.floatValue();
				}
				logger.debug("---- recupero total:" + total);
				total = total + IVALACC.floatValue();
				logger.debug("---- total:" + total + " valor:" + IVALACC.floatValue());
				formdata.put("TOTAL", total);
			} else {
				CMARCADO = new BigDecimal(0);
				if (isEmpty(TOTAL)) {
					total = 0;
				} else {
					total = TOTAL.floatValue();
				}

				if (total >= IVALACC.floatValue()) {
					total = total - IVALACC.floatValue();
				}
				formdata.put("TOTAL", total);
			}

			logger.debug("------- Total:" + total);

			Map map = new PAC_IAX_PRODUCCION_AUT((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_PRODUCCION_AUT__F_SET_ACCESORIOSNOSERIE(NRIESGO, CVERSION, CACCESORIO, TDESCRIPCION,
							IVALACC, CTIPACC, CVEHB7, CMARCADO, CASEGURABLE);
			logger.debug(map);
			BigDecimal y = (BigDecimal) tratarRETURNyMENSAJES(request, map);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr059Service - m�todo m_selecAccesorio", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	public void m_guardarAccesorio(HttpServletRequest request, Axisctr059Action thisAction) {
		logger.debug("Axisctr059Service m_selecAccesorio");
		try {
			this.formattingNumericValues(request);
			UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
			Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

			String CVERSION = getCampoTextual(request, "CVERSION");
			String CACCESORIO = request.getParameter("CACCESORIO");
			logger.debug("++++CACCESORIO get: " + CACCESORIO);
			logger.debug("++++CACCESORIO parameter: " + request.getParameter("CACCESORIO"));
			String TDESCRIPCION = getCampoTextual(request, "TTACCESORIO");
			BigDecimal IVALACC = isEmpty(getCampoNumerico(request, "IIVALPUBL")) ? new BigDecimal(0)
					: getCampoNumerico(request, "IIVALPUBL");
			BigDecimal CTIPACC = getCampoNumerico(request, "CTIPO");
			BigDecimal CASEGURABLE = getCampoNumerico(request, "CASEGURABLE");
			BigDecimal CMARCADO = new BigDecimal(1);
			BigDecimal NRIESGO = (BigDecimal) AbstractDispatchAction.topPila(request, "NRIESGO");
			BigDecimal CVEHB7 = new BigDecimal(1);
			float total = 0;
			BigDecimal TOTAL = getCampoNumerico(request, "TOTAL");
			logger.debug("------ TOTAL:" + TOTAL);

			if (isEmpty(TOTAL)) {
				total = 0;
			} else {
				total = TOTAL.floatValue();
			}
			logger.debug("---- recupero total:" + total);
			total = total + IVALACC.floatValue();
			logger.debug("---- total:" + total + " valor:" + IVALACC.floatValue());
			formdata.put("TOTAL", total);
			request.setAttribute("TOT", total);
			// request.setAttribute("TOT",total);

			Map map = new PAC_IAX_PRODUCCION_AUT((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_PRODUCCION_AUT__F_SET_ACCESORIOSNOSERIE(NRIESGO, CVERSION, CACCESORIO, TDESCRIPCION,
							IVALACC, CTIPACC, CVEHB7, CMARCADO, CASEGURABLE);
			logger.debug(map);
			BigDecimal y = (BigDecimal) tratarRETURNyMENSAJES(request, map);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr059Service - m�todo guardarAccesorio", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	public void m_borrarAccesorio(HttpServletRequest request, Axisctr059Action thisAction) {
		logger.debug("Axisctr059Service m_borrarAccesorio");
		try {
			this.formattingNumericValues(request);
			UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
			Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

			String CVERSION = getCampoTextual(request, "CVERSION");
			String CACCESORIO = getCampoTextual(request, "CACCESORIO");
			;
			BigDecimal NRIESGO = (BigDecimal) AbstractDispatchAction.topPila(request, "NRIESGO");

			BigDecimal IVALACC = isEmpty(getCampoNumerico(request, "IIVALPUBL")) ? new BigDecimal(0)
					: getCampoNumerico(request, "IIVALPUBL");

			float total = 0;
			BigDecimal TOTAL = getCampoNumerico(request, "TOTAL");
			logger.debug("------ TOTAL:" + TOTAL);

			if (isEmpty(TOTAL)) {
				total = 0;
			} else {

				total = TOTAL.floatValue();

			}
			logger.debug("---- recupero total:" + total);
			try {
				total = total - IVALACC.floatValue();
				logger.debug("---- total:" + total + " valor:" + IVALACC.floatValue());
			} catch (Exception e) {
				total = 0;
			}
			formdata.put("TOTAL", total);
			request.setAttribute("TOT", total);
			// request.setAttribute("TOT",total);

			Map map = new PAC_IAX_PRODUCCION_AUT((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_PRODUCCION_AUT__F_DEL_ACCESORIOSNOSERIE(NRIESGO, CVERSION, CACCESORIO);
			logger.debug(map);
			BigDecimal y = (BigDecimal) tratarRETURNyMENSAJES(request, map);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr059Service - m�todo guardarAccesorio", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	public void m_asegurable_json(HttpServletRequest request, AbstractDispatchAction thisAction) {

		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		AjaxContainerService ajax = new AjaxContainerService();
		try {
			HashMap miDataObject = new HashMap();
			String CACCESORIO = getCampoTextual(request, "CACCESORIO");
			BigDecimal CTIPO = getCampoNumerico(request, "CTIPO");
			logger.debug("---> CACCESORIO:" + CACCESORIO);
			Map m = new HashMap();
			if (!isEmpty(CACCESORIO)) {

				m = new PAC_IAX_LISTVALORES_AUT((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_LISTVALORES_AUT__F_GET_LSTASEGURABLES(CACCESORIO, CTIPO);
				logger.debug(m);

			}

			miDataObject.put("resultado", m);
			miDataObject.put("lista", this.tratarRETURNyMENSAJES(request, m));
			ajax.rellenarPlAContenedorAjax(m);

			request.setAttribute(Constantes.AJAXCONTAINER, miDataObject);
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr207Service - m�todo m_asegurable_json", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}
}
