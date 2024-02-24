package axis.service.modal;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_LISTVALORES_AUT;
import axis.jdbc.PAC_IAX_PRODUCCION_AUT;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.control.modal.Axisctr206Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

//import axis.jdbc.PAC_IAX_LISTVALORES;

/**
 * Axisctr206Service.java
 * 
 * @author <a href="mailto:xpastor@csi-ti.com">Xavi Pastor</a>
 */
public class Axisctr206Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE INICIALIZACION
	 *******************************************/
	/*********************************************************************************************************************/

	public void m_init(HttpServletRequest request, Axisctr206Action thisAction) {
		logger.debug("Axisctr206Service m_init");
		try {
			this.formattingNumericValues(request);
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr206Service - m�todo m_init", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	public void m_form(HttpServletRequest request, Axisctr206Action thisAction) {
		logger.debug("Axisctr206Service m_form");
		try {
			this.formattingNumericValues(request);
			UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
			Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
			String CVERSION = getCampoTextual(request, "CVERSION");
			String CMODO = getCampoTextual(request, "MODO");
			logger.debug("---------- VALOR version  :" + CVERSION);
			logger.debug("---------- VALOR modo  :" + CMODO);
			formdata.put("CMODO", CMODO);
			BigDecimal NRIESGO = (BigDecimal) AbstractDispatchAction.topPila(request, "NRIESGO");

			logger.debug("----- riesgo pila:" + NRIESGO);

			if (!isEmpty(getCampoNumerico(request, "NRIESGO")))
				NRIESGO = getCampoNumerico(request, "NRIESGO");

			logger.debug("----- riesgo session:" + getCampoNumerico(request, "NRIESGO"));

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
						.ejecutaPAC_IAX_LISTVALORES_AUT__F_GET_LSTDISPOSITIVOS();
				logger.debug(map);
				if (!isEmpty(tratarRETURNyMENSAJES(request, map))) {

					formdata.put("lstdispositivos", tratarRETURNyMENSAJES(request, map));
				}

				// if(isEmpty(request.getSession().getAttribute("NO_SERIE"))) {
				List no_serie = null;
				Map map2 = new PAC_IAX_PRODUCCION_AUT((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_PRODUCCION_AUT__F_LEE_DISPOSITIVOSNOSERIE(CVERSION);
				logger.debug(map2);

				if (!isEmpty(map)) {
					no_serie = (List) tratarRETURNyMENSAJES(request, map2);

					// formdata.put("NO_SERIE", no_serie);
					// request.getSession().setAttribute("NO_SERIE",no_serie);
				}

				Map map3 = new PAC_IAX_PRODUCCION_AUT((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_PRODUCCION_AUT__F_LEE_DISPOSITIVOS(NRIESGO);
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
							String DISPOSITIVO = (String) ((Map) ((Map) no_serie.get(i)).get("OB_IAX_AUTDISPOSITIVOS"))
									.get("DISPOSITIVO");

							for (int v = 0; v < no_serie_sel.size(); v++) {
								logger.debug("--- tama�o no_serie_sel:" + no_serie_sel.size() + " v:" + v);
								String DISPOSITIVO_sel = (String) ((Map) ((Map) no_serie_sel.get(v))
										.get("OB_IAX_AUTDISPOSITIVOS")).get("DISPOSITIVO");
								logger.debug("--- DISPOSITIVO_sel:" + DISPOSITIVO_sel + " DISPOSITIVO:" + DISPOSITIVO);
								if (DISPOSITIVO_sel.equals(DISPOSITIVO)) {
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

				/*
				 * float total= 0; if(!isEmpty(accesorios)){ for (int a=0;a <
				 * accesorios.size();a++){ if(((BigDecimal)((Map)((Map)
				 * accesorios.get(a)).get("OB_IAX_AUTDISPOSITIVOS")).get("CMARCADO")).intValue()
				 * == 1) total = total + ((BigDecimal)((Map)((Map)
				 * accesorios.get(a)).get("OB_IAX_AUTDISPOSITIVOS")).get("IVALDISP")).floatValue
				 * (); } } formdata.put("TOTAL", total); request.setAttribute("TOT",total);
				 */

			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr206Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			// Gesti�n de campos y dependencias
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}

	public void m_selecDispositivo(HttpServletRequest request, Axisctr206Action thisAction) {
		logger.debug("Axisctr206Service m_seleDISPOSITIVO");
		try {
			this.formattingNumericValues(request);
			UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
			Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

			String CVERSION = getCampoTextual(request, "CVERSION");
			String DISPOSITIVO = getCampoTextual(request, "CDISPOSITIVO");
			String TDESCRIPCION = getCampoTextual(request, "TDESCDISP");
			BigDecimal IVALDISP = getCampoNumerico(request, "IVALDISP");
			String CPROPDISP = getCampoTextual(request, "CPROPDISP");
			String MARCADO = getCampoTextual(request, "MARCADO");
			BigDecimal NRIESGO = (BigDecimal) AbstractDispatchAction.topPila(request, "NRIESGO");
			BigDecimal NCONTRATO = getCampoNumerico(request, "NCONTRATO");
			BigDecimal TOTAL = getCampoNumerico(request, "TOTAL");
			java.sql.Date FINICONTRATO = this.stringToSqlDate(getCampoTextual(request, "FINICONTRATO"));
			java.sql.Date FFINCONTRATO = this.stringToSqlDate(getCampoTextual(request, "FFINCONTRATO"));
			BigDecimal CMARCADO;
			if (MARCADO.equals("true")) {
				CMARCADO = new BigDecimal(1);
			} else {
				CMARCADO = new BigDecimal(0);
			}
			/*
			 * logger.debug("total-->"+TOTAL);
			 * 
			 * float total = 0; BigDecimal CMARCADO; if (MARCADO.equals("true") ){ CMARCADO
			 * = new BigDecimal(1); if(isEmpty(TOTAL)){ total = 0; } else{ total =
			 * TOTAL.floatValue(); } logger.debug("---- recupero total:"+total); total =
			 * total + IVALDISP.floatValue();
			 * logger.debug("---- total:"+total+" valor:"+IVALDISP.floatValue());
			 * formdata.put("TOTAL", total); } else{ CMARCADO = new BigDecimal(0);
			 * if(isEmpty(TOTAL)){ total = 0; } else{ total = TOTAL.floatValue(); }
			 * 
			 * if (total >= IVALDISP.floatValue()){ total = total - IVALDISP.floatValue(); }
			 * formdata.put("TOTAL", total); }
			 * 
			 * logger.debug("------- Total:"+total);
			 */
			Map map = new PAC_IAX_PRODUCCION_AUT((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_PRODUCCION_AUT__F_SET_DISPOSITIVONOSERIE(NRIESGO, CVERSION, DISPOSITIVO, CPROPDISP,
							IVALDISP, FINICONTRATO, FFINCONTRATO, CMARCADO, NCONTRATO, TDESCRIPCION);

			logger.debug(map);
			BigDecimal y = (BigDecimal) tratarRETURNyMENSAJES(request, map);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr206Service - m�todo m_seleDISPOSITIVO", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	public void m_guardarDispositivo(HttpServletRequest request, Axisctr206Action thisAction) {
		logger.debug("Axisctr206Service m_seleDISPOSITIVO");
		try {
			this.formattingNumericValues(request);
			UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
			Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

			String CVERSION = getCampoTextual(request, "CVERSION");
			String DISPOSITIVO = getCampoTextual(request, "CDISPOSITIVO");

			String TDESCRIPCION = getCampoTextual(request, "TDESCDISP");
			BigDecimal IVALDISP = isEmpty(getCampoNumerico(request, "IVALDISP")) ? new BigDecimal(0)
					: getCampoNumerico(request, "IVALDISP");
			String CPROPDISP = getCampoTextual(request, "CPROPDISP");
			BigDecimal CMARCADO = new BigDecimal(1);
			BigDecimal NRIESGO = (BigDecimal) AbstractDispatchAction.topPila(request, "NRIESGO");
			BigDecimal NCONTRATO = getCampoNumerico(request, "NCONTRATO");

			java.sql.Date FINICONTRATO = this.stringToSqlDate(getCampoTextual(request, "FINICONTRATO"));
			java.sql.Date FFINCONTRATO = this.stringToSqlDate(getCampoTextual(request, "FFINCONTRATO"));

			/*
			 * String TDESCRIPCION = getCampoTextual(request,"TTACCESORIO"); BigDecimal
			 * IVALACC = isEmpty(getCampoNumerico(request,"IIVALPUBL"))? new
			 * BigDecimal(0):getCampoNumerico(request,"IIVALPUBL"); BigDecimal CTIPACC =
			 * getCampoNumerico(request,"CTIPO"); BigDecimal CASEGURABLE =
			 * getCampoNumerico(request,"CASEGURABLE"); BigDecimal CMARCADO = new
			 * BigDecimal(1); BigDecimal NRIESGO =
			 * (BigDecimal)AbstractDispatchAction.topPila(request, "NRIESGO"); BigDecimal
			 * CVEHB7 = new BigDecimal(1);
			 */
			/*
			 * float total = 0; BigDecimal TOTAL = getCampoNumerico(request,"TOTAL");
			 * logger.debug("------ TOTAL:"+TOTAL);
			 * 
			 * if(isEmpty(TOTAL)){ total = 0; } else{ total = TOTAL.floatValue(); }
			 * logger.debug("---- recupero total:"+total); total = total +
			 * IVALDISP.floatValue();
			 * logger.debug("---- total:"+total+" valor:"+IVALDISP.floatValue());
			 * formdata.put("TOTAL", total); request.setAttribute("TOT",total);
			 * //request.setAttribute("TOT",total);
			 */

			Map map = new PAC_IAX_PRODUCCION_AUT((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_PRODUCCION_AUT__F_SET_DISPOSITIVONOSERIE(NRIESGO, CVERSION, DISPOSITIVO, CPROPDISP,
							IVALDISP, FINICONTRATO, FFINCONTRATO, CMARCADO, NCONTRATO, TDESCRIPCION);

			logger.debug(map);
			BigDecimal y = (BigDecimal) tratarRETURNyMENSAJES(request, map);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr206Service - m�todo guardarAccesorio", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	public void m_borrarDispositivo(HttpServletRequest request, Axisctr206Action thisAction) {
		logger.debug("Axisctr206Service m_borrarAccesorio");
		try {
			this.formattingNumericValues(request);
			UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
			Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

			String CVERSION = getCampoTextual(request, "CVERSION");
			String DISPOSITIVO = getCampoTextual(request, "CDISPOSITIVO");
			BigDecimal NRIESGO = (BigDecimal) AbstractDispatchAction.topPila(request, "NRIESGO");

			BigDecimal IVALACC = isEmpty(getCampoNumerico(request, "IVALDISP")) ? new BigDecimal(0)
					: getCampoNumerico(request, "IVALDISP");

			/*
			 * float total = 0; BigDecimal TOTAL = getCampoNumerico(request,"TOTAL");
			 * logger.debug("------ TOTAL:"+TOTAL);
			 * 
			 * if(isEmpty(TOTAL)){ total = 0; } else{
			 * 
			 * total = TOTAL.floatValue();
			 * 
			 * } logger.debug("---- recupero total:"+total); try{ total = total -
			 * IVALACC.floatValue();
			 * logger.debug("---- total:"+total+" valor:"+IVALACC.floatValue());
			 * }catch(Exception e){ total = 0;} formdata.put("TOTAL", total);
			 * request.setAttribute("TOT",total); //request.setAttribute("TOT",total);
			 */

			Map map = new PAC_IAX_PRODUCCION_AUT((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_PRODUCCION_AUT__F_DEL_DISPOSITIVOSNOSERIE(NRIESGO, CVERSION, DISPOSITIVO);
			logger.debug(map);
			BigDecimal y = (BigDecimal) tratarRETURNyMENSAJES(request, map);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr206Service - m�todo guardarAccesorio", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}
}
