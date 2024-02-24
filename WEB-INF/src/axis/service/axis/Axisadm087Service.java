package axis.service.axis;

import java.math.BigDecimal;
import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.struts.action.ActionForward;

import com.csi_ti.security.aes.AESUtil;

import axis.jdbc.PAC_IAXPAR_PRODUCTOS;
import axis.jdbc.PAC_IAX_CON;
import axis.jdbc.PAC_IAX_GESTION_REC;
import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.jdbc.PAC_IAX_PRODUCCION;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.control.axis.Axisadm087Action;
import axis.mvc.model.UsuarioBean;
import axis.util.Constantes;

public class Axisadm087Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());
	private String SNIP = "";
	private BigDecimal SPERSON;

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE INICIALIZACION
	 *******************************************/
	/*********************************************************************************************************************/

	/**
	 * M�todo que se llama al inicio de este flujo. Puede servirnos para inicializar
	 * variables.
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_init(HttpServletRequest request, Axisadm087Action thisAction) {
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {

		} catch (Exception e) {
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}

	}

	private void getDatos(HttpServletRequest request, Axisadm087Action thisAction) throws Exception {
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		AESUtil encryptedVal = new AESUtil();
		try {
			BigDecimal NRIESGO = new BigDecimal("1");
			BigDecimal SSEGURO = getCampoNumerico(request, "SSEGURO");
			String CMODO = (String) AbstractDispatchAction.topPila(request, "CMODO");

			if (SSEGURO == null) {
				SSEGURO = (BigDecimal) AbstractDispatchAction.topPila(request, "SSEGURO");
				formdata.put("SSEGURO", SSEGURO);

			}
			if (SSEGURO != null) {
				UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
				PAC_IAX_PRODUCCION pacIaxProduccion = new PAC_IAX_PRODUCCION(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
				PAC_IAX_LISTVALORES pacIaxListValores = new PAC_IAX_LISTVALORES(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
				PAC_IAX_CON pacIaxcON = new PAC_IAX_CON(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
				PAC_IAXPAR_PRODUCTOS pac_axispar_productos = new PAC_IAXPAR_PRODUCTOS(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

				Map map = pacIaxProduccion.ejecutaPAC_IAX_PRODUCCION__F_SET_CONSULTAPOLIZA(SSEGURO);
				logger.debug(map);
				tratarRETURNyMENSAJES(request, map, false);
				////////////////// DATOS POLIZA ////////////////////////////////////
				map = pacIaxProduccion.ejecutaPAC_IAX_PRODUCCION__F_GET_DATPOLIZA(SSEGURO);
				logger.debug(map);
				Map datosPoliza = (Map) tratarRETURNyMENSAJES(request, map, false);

				if (!isEmpty(datosPoliza)) {
					// Obtener el nombre del agente
					String Agente = String.valueOf(datosPoliza.get("CAGENTE"));
					if (!isEmpty(Agente)) {
						HashMap mapAgent = pacIaxListValores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTAGENTES_DAT(null,
								null, Agente, new BigDecimal(1));
						List listaAgentes = (List) tratarRETURNyMENSAJES(request, mapAgent, false);
						Map agente = getObjetoDeLista(listaAgentes, Agente, "CODI");
						datosPoliza.put("axisadm087_agente", agente);
					}
				}
				request.setAttribute("datos_poliza", datosPoliza);

				java.sql.Date FECHA_ACTUAL = AxisBaseService.stringToSqlDate(getCampoTextual(request, "FECHA"));
				if (isEmpty(FECHA_ACTUAL)) {
					FECHA_ACTUAL = (Date) fcGetFechaActual();
				}

				map = pacIaxProduccion.ejecutaPAC_IAX_PRODUCCION__F_GET_MVTPOLIZA();
				logger.debug("moviments :: " + map);
				List movimientos = (List) tratarRETURNyMENSAJES(request, map, false);
				request.setAttribute("mvtpoliza", movimientos);

				m_obtener_combos(request);
				// etm ini
				List cuentasTomador = new ArrayList();
				/* Cuentas tomador */
				map = pacIaxProduccion.ejecutaPAC_IAX_PRODUCCION__F_GET_TOMADORCCC();
				logger.debug("ejecutaPAC_IAX_PRODUCCION__F_GET_TOMADORCCC()" + map);
				// Leer el PSPERSON y establecerlo en formdata
				formdata.put("SPERSON", map.get("PSPERSON"));
				SPERSON = (BigDecimal) map.get("PSPERSON");
				if (!isEmpty(map)) {

					cuentasTomador = (List) tratarRETURNyMENSAJES(request, map);
					if (!isEmpty(cuentasTomador)) {
						formdata.put("SNIP", ((Map) cuentasTomador.get(0)).get("SNIP"));
					}
				}

				if (isEmpty(request.getSession().getAttribute("cargaHost")) && !isEmpty(cuentasTomador)) {
					formdata.put("cuentasTomador", cuentasTomador);

				} else if (!isEmpty(request.getSession().getAttribute("cargaHost"))) {

					if (!isEmpty(getCampoNumerico(request, "SPERSON")))
						SPERSON = getCampoNumerico(request, "SPERSON");

					if (isEmpty(SNIP))
						SNIP = getCampoTextual(request, "SNIP");

					map = new PAC_IAX_PRODUCCION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
							.ejecutaPAC_IAX_PRODUCCION__F_GET_CCC_HOST(SPERSON, SNIP, "EST");
					logger.debug("ejecutaPAC_IAX_PRODUCCION__F_GET_CCC_HOST()" + map);
					if (!isEmpty(map)) {
						cuentasTomador = (List) tratarRETURNyMENSAJES(request, map);
						formdata.put("cuentasTomador", cuentasTomador);
					}

				}
				request.setAttribute("cuentasTomador", cuentasTomador);
				String encrypt_CBANCAR = "0";
				String CBANCAR = null;
				BigDecimal CTIPBAN = null;

				formdata.put("encrypt_CBANCAR", encrypt_CBANCAR);
				if (!isEmpty(formdata.get("CBANCAR"))) {
					if (!isEmpty(formdata.get("encrypt_CBANCAR"))
							&& formdata.get("encrypt_CBANCAR").toString() == "1") {
						CBANCAR = encryptedVal.decrypt(formdata.get("CBANCAR").toString());
					} else {
						CBANCAR = formdata.get("CBANCAR").toString();
						CTIPBAN = (BigDecimal) formdata.get("CTIPBAN");
						logger.debug("PRU CBANCAR1 ---------------------------> " + CBANCAR);
					}
				} else {
					try { // ecg20120105 encapsulando en try catch porq en la version orginal petaba si no
							// hubo elementos en la lista cuentasTomados
						CBANCAR = ((Map) cuentasTomador.get(0)).get("CBANCAR").toString();
						CTIPBAN = (BigDecimal) ((Map) cuentasTomador.get(0)).get("CTIPBAN");
						logger.debug("Cbancar ---------------> " + CBANCAR);
						logger.debug("Ctipban ---------------> " + CTIPBAN);

					} catch (Exception ee) {
						logger.warn(
								"No se ha localizado CBANCAR en datosgestion ni en la lista de cuentas Tomador. Dejamos CBANCAR y CTIPBAN nulos");
					}
				}

				/*
				 * *****************************************************************************
				 * *********************
				 */
				if (!isEmpty(CTIPBAN)) {
					try {
						Map mapa_tarjeta = new PAC_IAX_PRODUCCION(
								(java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
								.ejecutaPAC_IAX_PRODUCCION__F_GET_TARJETA(CTIPBAN);
						logger.debug("mapa_tarjeta : " + mapa_tarjeta);
						BigDecimal tarjeta = (BigDecimal) tratarRETURNyMENSAJES(request, mapa_tarjeta, false);
						if (!isEmpty(tarjeta)) {
							formdata.put("TARJETA", tarjeta);
						}
					} catch (Exception exc) {
						logger.warn("Error al get_tarjeta");
					}
				} else {
					formdata.put("TARJETA", new BigDecimal(0));
				}
				// etm fin

			}

		} catch (Exception e) {
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

	public void m_form(HttpServletRequest request, Axisadm087Action thisAction) {
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {
			HashMap aviso = this.f_Get_Avisos(request, this.whoami(this));
			BigDecimal pRETURN = (BigDecimal) this.tratarRETURNyMENSAJES(request, aviso);
			request.setAttribute("PLSTAVISOS", aviso.get("PLSTAVISOS"));

			if (pRETURN != null && pRETURN.intValue() != 1) {

				getDatos(request, thisAction);
				BigDecimal IMPORTE = null;
				BigDecimal TIPORECIBO = null;
				BigDecimal CTIPCOB = null;
				String CMODO = (String) AbstractDispatchAction.topPila(request, "CMODO");
				formdata.put("CMODO", CMODO);
				formdata.put("IMPORTE", IMPORTE);
				formdata.put("TIPORECIBO", TIPORECIBO);
				formdata.put("CTIPCOB", CTIPCOB);

			}

		} catch (Exception e) {
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}

	}

	public ActionForward m_aceptar(HttpServletRequest request, Axisadm087Action thisAction) {
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		ActionForward siguiente = null;
		try {
			UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
			PAC_IAX_GESTION_REC pac_iax_gestion_rec = new PAC_IAX_GESTION_REC(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			BigDecimal pPSSEGURO = getCampoNumerico(request, "SSEGURO");
			BigDecimal pPIMPORTE = getCampoNumerico(request, "IMPORTE");
			BigDecimal pPTIPORECIBO = getCampoNumerico(request, "TIPORECIBO");
			BigDecimal pPCTIPCOB = getCampoNumerico(request, "CTIPCOB");
			BigDecimal pPNMOVIMI = getCampoNumerico(request, "radioNMOVIMI");
			String pPMODE = getCampoTextual(request, "CMODO");

			Map map = pac_iax_gestion_rec.ejecutaPAC_IAX_GESTION_REC__F_RECMAN_PENS(pPSSEGURO, pPNMOVIMI, pPTIPORECIBO,
					pPIMPORTE, pPCTIPCOB);
			logger.debug("ejecutaPAC_IAX_GESTION_REC__F_RECMAN_PENS:" + map);
			tratarRETURNyMENSAJES(request, map, false);
			logger.debug("+map.get(\"MENSAJES\"):" + map.get("MENSAJES"));
			ArrayList errors = (ArrayList) map.get("MENSAJES");

			if ((map.get("RETURN").equals(new BigDecimal(0))) || (!isEmpty(pPNMOVIMI))) {

				formdata.put("OK", new BigDecimal(1));
				BigDecimal IMPORTE = null;
				BigDecimal TIPORECIBO = null;
				BigDecimal CTIPCOB = null;
				formdata.put("IMPORTE", IMPORTE);
				formdata.put("TIPORECIBO", TIPORECIBO);
				formdata.put("CTIPCOB", CTIPCOB);

			} else
				formdata.put("OK", new BigDecimal(0));

			getDatos(request, thisAction);

			this.formattingNumericValues(request);
			return siguiente;
		} catch (Exception e) {
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
			return siguiente;
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}

	}

	private java.sql.Date fcGetFechaActual() throws Exception {

		java.util.Date today = new java.util.Date();
		java.sql.Date FECHA_ACTUAL = new java.sql.Date(today.getTime());
		return FECHA_ACTUAL;

	}

	public void m_actualizar_valores_json(HttpServletRequest request) {
		// Map formdata=(Map)request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		AjaxContainerService ajax = new AjaxContainerService();
		BigDecimal NRIESGO = new BigDecimal("1");
		BigDecimal SSEGURO = getCampoNumerico(request, "SSEGURO");
		String CMODO = (String) AbstractDispatchAction.topPila(request, "CMODO");
		BigDecimal IMPORTE = getCampoNumerico(request, " IMPORTE");
		logger.debug("NRIESGOOOOOOOOOOOOO" + NRIESGO);
		logger.debug("SSEGUROOOOOOOOOOOOOO" + SSEGURO);
		logger.debug("CMODOOOOOOOOOOOOOOOO" + CMODO);
		logger.debug("PIMPORTEEEEEEEEEEEEE" + IMPORTE);
		if (SSEGURO == null) {
			SSEGURO = (BigDecimal) AbstractDispatchAction.topPila(request, "SSEGURO");
			formdata.put("SSEGURO", SSEGURO);
		}
		java.sql.Date FECHA_ACTUAL = AxisBaseService.stringToSqlDate(getCampoTextual(request, "FECHA"));

		try {
			if (isEmpty(FECHA_ACTUAL)) {
				FECHA_ACTUAL = (Date) fcGetFechaActual();
			}
			logger.debug("FECHA_ACTUALlllllllllllll" + FECHA_ACTUAL);

		} catch (Exception e) {
			logger.error("Error.", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}

	public void m_ajax_cargar_tarjeta(HttpServletRequest request) {
		logger.debug("Axisadm087Service m_ajax_cargar_tarjeta");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();
		try {

			BigDecimal CTIPBAN = getCampoNumerico(request, "CTIPBAN");

			Map map = new PAC_IAX_PRODUCCION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_PRODUCCION__F_GET_TARJETA(CTIPBAN);
			HashMap mapa = new HashMap();
			HashMap cargador = new HashMap();

			if (!isEmpty(map)) {
				BigDecimal tarjeta = (BigDecimal) tratarRETURNyMENSAJES(request, map, false);
				// (BigDecimal)ajax.rellenarPlAContenedorAjax(map);

				if (!isEmpty(tarjeta)) {
					mapa.put("RESULTADO", tarjeta);
					ArrayList lista = new ArrayList();
					lista.add(0, mapa);
					map.put("valor", lista);
					// ajax.rellenarPlAContenedorAjax(map);
					ajax.guardarContenidoFinalAContenedorAjax(map);
				} else {
					ajax.rellenarPlAContenedorAjax(map);
				}

				// ajax.rellenarPlAContenedorAjax(map);
				// ajax.guardarContenidoFinalAContenedorAjax(tarjeta);
			}

		} catch (Exception e) {
			// logger.error("Error en el servicio Axisadm087Service - m�todo
			// m_ajax_cargar_tarjeta", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	/**
	 * Carga las cuentas del tomador y las devuelve en modo Ajax.
	 * 
	 * @param request
	 */

	public void m_ajax_cargar_cuentas_tomador(HttpServletRequest request) {
		AESUtil encryptedVal = new AESUtil();
		String TCBANCAR = "";
		String CBANCAR = "";
		String maskingData = "";
		BigDecimal encrypt_CBANCAR = getHiddenCampoNumerico(request, "encrypt_CBANCAR");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();
		HashMap cuentaTomador = null;

		logger.debug("Axisadm087Service m_ajax_cargar_cuentas_tomador");
		logger.debug(
				"Axisadm087Service m_ajax_cargar_cuentas_tomador [encrypt_CBANCAR]: " + encrypt_CBANCAR.intValue());

		try {
			Map map = new PAC_IAX_PRODUCCION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_PRODUCCION__F_GET_TOMADORCCC();
			logger.debug("ejecutaPAC_IAX_PRODUCCION__F_GET_TOMADORCCC()" + map);

			if (!isEmpty(map)) {
				ArrayList lista = (ArrayList) map.get("RETURN");
				for (int i = 0; i < lista.size(); i++) {
					cuentaTomador = (HashMap) lista.get(i);
					CBANCAR = (String) cuentaTomador.get("CBANCAR");
					TCBANCAR = (String) cuentaTomador.get("TCBANCAR");
					if (!isEmpty(encrypt_CBANCAR) && encrypt_CBANCAR.intValue() == 1) {
						maskingData = "";
						for (int j = 0; j < TCBANCAR.length() - 4; j++) {
							maskingData += "X";
						}
						maskingData += TCBANCAR.substring(TCBANCAR.length() - 4, TCBANCAR.length());
						cuentaTomador.put("masc_CBANCAR", maskingData);
						cuentaTomador.put("encrypted_CBANCAR", encryptedVal.encrypt(CBANCAR));
					} else {
						cuentaTomador.put("masc_CBANCAR", TCBANCAR);
						cuentaTomador.put("encrypted_CBANCAR", CBANCAR);
					}
				}

				List cuentasTomador = (List) ajax.rellenarPlAContenedorAjax(map);
				ajax.guardarContenidoFinalAContenedorAjax(cuentasTomador);
				logger.debug("cuentasTomador --> " + cuentasTomador);
			}
		} catch (Exception e) {
			// logger.error("Error en el servicio Axisadm087Service - m�todo
			// m_ajax_cargar_cuentas_tomador", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	public void m_ajax_cargar_cuentas_tomadorAXIS(HttpServletRequest request) {
		logger.debug("Axisadm087Service m_ajax_cargar_cuentas_tomadorAXIS");
		AESUtil encryptedVal = new AESUtil();
		String TCBANCAR = "";
		String CBANCAR = "";
		String maskingData = "";
		BigDecimal encrypt_CBANCAR = getHiddenCampoNumerico(request, "encrypt_CBANCAR");
		HashMap cuentaTomador = null;
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();
		try {

			BigDecimal SSEGURO = (BigDecimal) AbstractDispatchAction.topPila(request, "SSEGURO");
			Map map1 = new PAC_IAX_PRODUCCION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_PRODUCCION__TRASPASO_CCC(SSEGURO, null, SPERSON);
			logger.debug("ejecutaPAC_IAX_PRODUCCION__traspasoccc()" + map1);
			Map map = new PAC_IAX_PRODUCCION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_PRODUCCION__F_GET_TOMADORCCC();
			logger.debug("ejecutaPAC_IAX_PRODUCCION__F_GET_TOMADORCCC()" + map);
			if (!isEmpty(map)) {
				List cuentasTomador = (List) ajax.rellenarPlAContenedorAjax(map);
				if (!isEmpty(map.get("RETURN"))) {
					ArrayList lista = (ArrayList) map.get("RETURN");
					for (int i = 0; i < lista.size(); i++) {
						cuentaTomador = (HashMap) lista.get(i);
						CBANCAR = (String) cuentaTomador.get("CBANCAR");
						TCBANCAR = (String) cuentaTomador.get("TCBANCAR");
						if (!isEmpty(encrypt_CBANCAR) && encrypt_CBANCAR.intValue() == 1) {
							maskingData = "";
							for (int j = 0; j <= TCBANCAR.length() - 4; j++) {
								maskingData += "X";
							}
							maskingData += TCBANCAR.substring(TCBANCAR.length() - 5, TCBANCAR.length());
							cuentaTomador.put("masc_CBANCAR", maskingData);
							cuentaTomador.put("encrypted_CBANCAR", encryptedVal.encrypt(CBANCAR));
						} else {
							cuentaTomador.put("masc_CBANCAR", TCBANCAR);
							cuentaTomador.put("encrypted_CBANCAR", CBANCAR);
						}
					}

				}

				ajax.guardarContenidoFinalAContenedorAjax(cuentasTomador);
			}
			request.getSession().removeAttribute("cargaHost");
		} catch (Exception e) {
			// logger.error("Error en el servicio Axisadm087Service - m�todo
			// m_ajax_cargar_cuentas_tomador", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	public void m_obtener_combos(HttpServletRequest request) {
		logger.debug("Axisadm087Service m_obtener_combos");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {

			Map mapa = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal("8000936"));
			List listaTiporecibo = (List) tratarRETURNyMENSAJES(request, mapa, false);
			logger.debug("listaTiporecibo -----------------> " + mapa);
			formdata.put("listaTiporecibo", listaTiporecibo);
			request.setAttribute("listaTiporecibo", !isEmpty(listaTiporecibo) ? listaTiporecibo : new ArrayList());

			/* Forma pago */

			// Map map = new
			// PAC_IAXPAR_PRODUCTOS((java.sql.Connection)request.getAttribute(Constantes.DB01CONN)).ejecutaPAC_IAXPAR_PRODUCTOS__F_GET_FORMAPAGO();
			// Map map=pac_axispar_productos.ejecutaPAC_IAXPAR_PRODUCTOS__F_GET_FORMAPAGO();
			// logger.debug(map);
			// List formaPago=(List)tratarRETURNyMENSAJES(request, map);
			// formdata.put("formaPago", formaPago);
			// request.setAttribute("formaPago", !isEmpty(formaPago)?formaPago:new
			// ArrayList());
			/*
			 * if (!isEmpty(formaPago)) { Map map1 = new
			 * PAC_IAX_PRODUCCION((java.sql.Connection)request.getAttribute(Constantes.
			 * DB01CONN)).ejecutaPAC_IAX_PRODUCCION__F_GET_GARFORPAG(); //Map
			 * map1=pacIaxProduccion.ejecutaPAC_IAX_PRODUCCION__F_GET_GARFORPAG();
			 * logger.debug(map1); BigDecimal
			 * CFORPAG=(BigDecimal)tratarRETURNyMENSAJES(request, map1);
			 * formdata.put("CFORPAG", CFORPAG); }
			 */

			/* Tipo cobro */
			Map map2 = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES__F_GET_TIPOCOBRO();
			// Map map2=pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_TIPOCOBRO();
			logger.debug(map2);
			List tipoCobro = (List) tratarRETURNyMENSAJES(request, map2);
			formdata.put("tipoCobro", tipoCobro);
			request.setAttribute("tipoCobro", !isEmpty(tipoCobro) ? tipoCobro : new ArrayList());

		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm087Service - m�todo m_obtener_combos", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}

	}

}
