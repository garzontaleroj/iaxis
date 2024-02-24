//Revision:# uUuXXLtBHLHrUfO9a9jDsw== #
package axis.service.axis;

import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_CASHDESK;
import axis.jdbc.PAC_IAX_CTACLIENTE;
import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.jdbc.PAC_IAX_PRODUCCION;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.control.axis.Axisadm101Action;
import axis.mvc.model.UsuarioBean;
import axis.util.Constantes;

public class Axisadm101Service extends AxisBaseService {
	SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
	Log logger = LogFactory.getLog(this.getClass());
	Log log = LogFactory.getLog(this.getClass());

	/**
	 * M�todo que se llama al inicio de este flujo.
	 *
	 * @param request
	 * @param thisAction
	 */
	public void m_init(HttpServletRequest request, Axisadm101Action thisAction) {
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {

		} catch (Exception e) {
			logger.error("Error", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			// Gesti�n de campos y dependencias
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));

		}

	}

	/**
	 * M�todo que se llama al inicio de este flujo.
	 *
	 * @param request
	 * @param thisAction
	 */
	public void m_form(HttpServletRequest request, Axisadm101Action thisAction) {

		logger.debug("Axiscob001Service m_form");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {

			this.cargaListaMedioPago(request);
			this.cargaListaTiposMovimientos(request);
		} catch (Exception e) {
			logger.error("Error en el servicio Axiscob001Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			// Gesti�n de campos y dependencias
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
			// this.loadBoxes(request);

		}

	}

	/**
	 * M�todo que se encarga de la actualizaci�n de la pantalla y su posterior
	 * recalculo de primas en funci�n de la revalorizaci�n, las garantias y sus
	 * capitales.
	 *
	 * @param request
	 * @param thisAction
	 */

	public void m_buscar(HttpServletRequest request, AbstractDispatchAction thisAction) {

		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {

			BigDecimal SPERSON = getCampoNumerico(request, "SPERSON");
			BigDecimal SSEGURO = getCampoNumerico(request, "SSEGURO");
			BigDecimal SPRODUC = getCampoNumerico(request, "SPRODUC");

			int res = SSEGURO.compareTo(new BigDecimal("0"));
			if (res < 0)
				SSEGURO = new BigDecimal("0");
			String sFECHAINI = getCampoTextual(request, "FECHAINI");
			String sFECHAFIN = getCampoTextual(request, "FECHAFIN");
			java.sql.Date FECHAINI = sFECHAINI != null ? new java.sql.Date(sdf.parse(sFECHAINI).getTime()) : null;
			java.sql.Date FECHAFIN = sFECHAFIN != null ? new java.sql.Date(sdf.parse(sFECHAFIN).getTime()) : null;
			BigDecimal TCONCEP = getCampoNumerico(request, "TCONCEP");
			BigDecimal CMEDMOV = getCampoNumerico(request, "CMEDMOV");
			BigDecimal IMPORTE = getCampoNumerico(request, "IMPORTE");
			BigDecimal BUSPER = getCampoNumerico(request, "BUSPER");
			BigDecimal BUSPOL = getCampoNumerico(request, "BUSPOL");
			String pNOMBRETOM = getCampoTextual(request, "NOMBRETOM");
			request.getSession().setAttribute("NOMBRETOM", pNOMBRETOM);
			formdata.put("BUSPER", BUSPER);
			formdata.put("BUSPOL", BUSPOL);

			PAC_IAX_CTACLIENTE pac_iax_ctacliente = new PAC_IAX_CTACLIENTE(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map map = pac_iax_ctacliente.ejecutaPAC_IAX_CTACLIENTE__F_OBTENERMOVIMIENTOS(SPERSON, SSEGURO, SPRODUC,
					FECHAINI, FECHAFIN, TCONCEP, CMEDMOV, IMPORTE);
			logger.debug("Map: " + map);
			List resultados = (List) tratarRETURNyMENSAJES(request, map, false);
			formdata.put("OBTENERMOVIMIENTOS", resultados);
			request.setAttribute("GENERAR", (resultados != null && resultados.size() > 0));
			logger.debug("formdata: " + formdata);

		} catch (Exception e) {
			logger.error("Error en el servicio Axiscob001Service - m�todo m_generar", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		} finally {
			// Gesti�n de campos y dependencias
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
			this.loadBoxes(request);
		}

	}

	/**
	 * Guarda la pantalla, realiza su validaci�n y determina la pantalla anterior a
	 * ejecutar.
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_anterior(HttpServletRequest request, AbstractDispatchAction thisAction) {

		// Gesti�n de campos y dependencias
		this.f_Cargar_Propiedades_Pantalla(request, whoami(this));

	}

	/**
	 * Carga la lista de empresas en la pantalla.
	 * 
	 * @param request El HttpServletRequest que contiene la petici�n del cliente
	 *                web.
	 */
	private void cargaListaMedioPago(HttpServletRequest request) throws Exception {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		BigDecimal CLAVE = new BigDecimal(1056);
		Map map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(CLAVE);
		List listaMedioPago = (List) tratarRETURNyMENSAJES(request, map);
		request.getSession().setAttribute("listaMedioPago", listaMedioPago);
		listaMedioPago = null;

	}

	/**
	 * Carga la lista de empresas en la pantalla.
	 * 
	 * @param request El HttpServletRequest que contiene la petici�n del cliente
	 *                web.
	 */
	private void cargaListaTiposMovimientos(HttpServletRequest request) throws Exception {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		BigDecimal CLAVE = new BigDecimal(480);
		Map map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(CLAVE);
		List listaTiposMovimientos = (List) tratarRETURNyMENSAJES(request, map);
		request.getSession().setAttribute("listaTiposMovimientos", listaTiposMovimientos);
		listaTiposMovimientos = null;

	}

	public void m_ajax_polizas(HttpServletRequest request, Axisadm101Action thisAction) {
		logger.debug("Axiscob001Service m_ajax_polizas");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {
			BigDecimal SSEGURO = this.getCampoNumerico(request, "SSEGURO");
			PAC_IAX_PRODUCCION pacIaxProduccion = new PAC_IAX_PRODUCCION(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map map = pacIaxProduccion.ejecutaPAC_IAX_PRODUCCION__F_SET_CONSULTAPOLIZA(SSEGURO);
			logger.debug(map);
			tratarRETURNyMENSAJES(request, map, false);

			map = pacIaxProduccion.ejecutaPAC_IAX_PRODUCCION__F_GET_DATPOLIZA(SSEGURO);
			logger.debug(map);

			Map datosPoliza = (Map) tratarRETURNyMENSAJES(request, map);
			formdata.put("SPRODUC", datosPoliza.get("SPRODUC"));

			request.getSession().setAttribute("NOMBRETOM", datosPoliza.get("TNOMTOM"));

			if (!isEmpty(datosPoliza)) {
				Map OB_IAX_DATPOLIZA = new HashMap();
				OB_IAX_DATPOLIZA.putAll(datosPoliza);
				ajax.guardarContenidoFinalAContenedorAjax(OB_IAX_DATPOLIZA);
			}
		} catch (Exception e) {
			logger.error("Error en el servicio Axiscob001Service - m�todo m_ajax_polizas", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	public void m_ajax_buscar_persona(HttpServletRequest request, Axisadm101Action thisAction) {
		logger.debug("Axiscob001Service m_ajax_buscar_persona");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {
			BigDecimal SSEGURO = this.getCampoNumerico(request, "SSEGURO");
			PAC_IAX_CTACLIENTE pac_axis_ctacliente = new PAC_IAX_CTACLIENTE(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map map = pac_axis_ctacliente.ejecutaPAC_IAX_CTACLIENTE__F_OBTENERPERSONAS(SSEGURO);
			logger.debug(map);
			List resultados = (List) tratarRETURNyMENSAJES(request, map, false);
			request.getSession().setAttribute("listaPersonas", resultados);
			ajax.guardarContenidoFinalAContenedorAjax(map);
			logger.debug("Axiscob001Service Fin m_ajax_buscar_persona");
		} catch (Exception e) {
			logger.error("Error en el servicio Axiscob001Service - m�todo m_ajax_buscar_persona", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	/***********************************************
	 * LOAD LISTS IN JSP - JBENITEZ
	 *******************************************/
	private void loadBoxes(HttpServletRequest request) {
		// debug
		logger.debug("Axisadm093Service loadBoxes");
		// our map
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		// get general user
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		// start try1
		try {
			// map #2
			Map listValores = new HashMap();
			// object definition
			PAC_IAX_CASHDESK ObjCashDesk = new PAC_IAX_CASHDESK(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map mapCod = ObjCashDesk.ejecutaPAC_IAX_CASHDESK__GET_SEQ_CAJA(); // TRANSACTION ID rdd
			listValores.put("TID", tratarRETURNyMENSAJES(request, mapCod));

			PAC_IAX_LISTVALORES pac_axis_listValores = new PAC_IAX_LISTVALORES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			// getting objects from DB
			Map map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORESCOND(new BigDecimal(481),
					"catribu in(0,1,2,3,6)"); // PAYMENT METHOD
			Map map1 = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(1902)); // CHEQUE
																											// TYPE
			Map map2 = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(8000955)); // CHEQUE
																												// DRAFT
																												// TYPE
			Map map3 = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORESCOND(new BigDecimal(1903),
					"catribu in (0,4,5,19)"); // PAYMENT REASON
			Map map4 = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_GET_MONEDAS(); // CURRENCY
			Map map5 = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_GET_BANCOS(); // BANK NAME
			// Map map6 = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new
			// BigDecimal(8000955)); //PAYMENT REASON
			// Map mapCod = ObjCashDesk.ejecutaPAC_IAX_CASHDESK__GET_SEQ_CAJA();
			// //TRANSACTION ID

			logger.debug(map);
			// saving maps in listvalores
			listValores.put("paymet", tratarRETURNyMENSAJES(request, map));
			listValores.put("chtypelist", tratarRETURNyMENSAJES(request, map1));
			listValores.put("chdrtype", tratarRETURNyMENSAJES(request, map2));
			listValores.put("payreason", tratarRETURNyMENSAJES(request, map3));
			listValores.put("currency", tratarRETURNyMENSAJES(request, map4));
			listValores.put("bname", tratarRETURNyMENSAJES(request, map5));
			// listValores.put("mop", tratarRETURNyMENSAJES(request, map6));
			listValores.put("TID", tratarRETURNyMENSAJES(request, mapCod));
			// saving listvalores in map formdata
			formdata.put("listValores", listValores);
			// catch try1
		} catch (Exception e) {
			logger.error("Error in the Service Axisadm093Service.loadBoxes", e);
		}
	}

	public void m_DoTransaction(HttpServletRequest request, Axisadm101Action thisAction) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		AjaxContainerService ajax = new AjaxContainerService();
		try {

			HashMap m = this.f_Get_Avisos(request, this.whoami(this));
			BigDecimal pRETURN = (BigDecimal) this.tratarRETURNyMENSAJES(request, m);
			request.setAttribute("PLSTAVISOS", m.get("PLSTAVISOS"));

			if (pRETURN != null && pRETURN.intValue() != 1) {

				PAC_IAX_CASHDESK ObjCashDesk = new PAC_IAX_CASHDESK(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
				Map map = new HashMap();
				String PAYERID = this.getCampoTextual(request, "SPERSON_REL");
				BigDecimal PAYERID2 = getCampoNumerico(request, "SPERSON_REL");
				// getCampoTextual(request, "PAYERID");
				String CURRENCY = getCampoTextual(request, "CURRENCY");
				String PAYREASON = getCampoTextual(request, "PAYREASON");
				BigDecimal AMOPAY = getCampoNumerico(request, "AMOPAY");
				String DATEREC = getCampoTextual(request, "DATEREC");
				String PAYMET = getCampoTextual(request, "PAYMET");
				String CHTYPE = getCampoTextual(request, "CHTYPE");
				String TID = getCampoTextual(request, "TID");
				String PAYTEXT = getCampoTextual(request, "PAYTEXT");
				String ACCONUM = getCampoTextual(request, "ACCONUM");
				String POLICY = getCampoTextual(request, "NPOLIZA");
				// The following line is the complete parameter�s reference:
				// map =
				// ObjCashDesk.ejecutaPAC_IAX_CASHDESK_MSV__DO_TRANSACTION(PAYERID,CURRENCY,PAYREASON,AMOPAY,DATEREC,PAYMET,BNAME,OBANK,ACCONUM,CHNUM,CHTYPE,CLIMOP,PAYTEXT,TID);
				Map listValores = new HashMap();
				// pay method CASH

				Map m2 = new PAC_IAX_CASHDESK((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_CASHDESK__F_INS_CASHDESKTMP(null, AMOPAY, POLICY, AMOPAY, TID, PAYERID2);

				if (PAYMET.equals("0")) {
					map = ObjCashDesk.ejecutaPAC_IAX_CASHDESK__F_APUNTE_PAGO_SPL(PAYERID, CURRENCY, PAYREASON, AMOPAY,
							DATEREC, PAYMET, null, null, ACCONUM, null, null, null, PAYTEXT, TID, null);
					// listValores.put("AlertMessage", tratarRETURNyMENSAJES(request, map));
					ajax.rellenarPlAContenedorAjax(map);
					listValores.put("RET", map.get("RETURN"));
				}
				// pay method CHEQUE
				else if (PAYMET.equals("1")) {
					String BNAME = getCampoTextual(request, "BNAME");
					String OBANK = getCampoTextual(request, "OBANK");
					String CHNUM = getCampoTextual(request, "CHNUM");
					String ACCOHOLD = getCampoTextual(request, "ACCOHOLD");
					// cheque type TII CHEQUE
					if (CHTYPE.equals("1")) {
						String CHDRTYPE = getCampoTextual(request, "CHDRTYPE");
						map = ObjCashDesk.ejecutaPAC_IAX_CASHDESK__F_APUNTE_PAGO_SPL(PAYERID, CURRENCY, PAYREASON,
								AMOPAY, DATEREC, PAYMET, BNAME, OBANK, ACCONUM, CHNUM, CHTYPE, CHDRTYPE, PAYTEXT, TID,
								ACCOHOLD);
						ajax.rellenarPlAContenedorAjax(map);
					} else if (CHTYPE.equals("3")) {

						String CHDRTYPE = getCampoTextual(request, "CHDRTYPE");
						map = ObjCashDesk.ejecutaPAC_IAX_CASHDESK__F_APUNTE_PAGO_SPL(PAYERID, CURRENCY, PAYREASON,
								AMOPAY, DATEREC, PAYMET, BNAME, OBANK, ACCONUM, CHNUM, CHTYPE, CHDRTYPE, PAYTEXT, TID,
								ACCOHOLD);
						// listValores.put("AlertMessage", tratarRETURNyMENSAJES(request, map));
						ajax.rellenarPlAContenedorAjax(map);

					} else
						map = ObjCashDesk.ejecutaPAC_IAX_CASHDESK__F_APUNTE_PAGO_SPL(PAYERID, CURRENCY, PAYREASON,
								AMOPAY, DATEREC, PAYMET, BNAME, OBANK, ACCONUM, CHNUM, CHTYPE, null, PAYTEXT, TID,
								ACCOHOLD);
					// listValores.put("AlertMessage", tratarRETURNyMENSAJES(request, map));
					ajax.rellenarPlAContenedorAjax(map);

				}
				// pay method TRANSFER
				else if (PAYMET.equals("2")) {
					String BNAME = getCampoTextual(request, "BNAME");
					String OBANK = getCampoTextual(request, "OBANK");
					map = ObjCashDesk.ejecutaPAC_IAX_CASHDESK__F_APUNTE_PAGO_SPL(PAYERID, CURRENCY, PAYREASON, AMOPAY,
							DATEREC, PAYMET, BNAME, OBANK, ACCONUM, null, null, null, PAYTEXT, TID, null);
					// listValores.put("AlertMessage", tratarRETURNyMENSAJES(request, map));
					ajax.rellenarPlAContenedorAjax(map);
				}
				// pay method VALE VIEW
				else if (PAYMET.equals("3")) {
					String BNAME = getCampoTextual(request, "BNAME");
					String OBANK = getCampoTextual(request, "OBANK");
					map = ObjCashDesk.ejecutaPAC_IAX_CASHDESK__F_APUNTE_PAGO_SPL(PAYERID, CURRENCY, PAYREASON, AMOPAY,
							DATEREC, PAYMET, BNAME, OBANK, ACCONUM, null, null, null, PAYTEXT, TID, null);
					// listValores.put("AlertMessage", tratarRETURNyMENSAJES(request, map));
					ajax.rellenarPlAContenedorAjax(map);
				}
				// pay method CARD
				else if (PAYMET.equals("4")) {
					String BNAME = getCampoTextual(request, "BNAME");
					String OBANK = getCampoTextual(request, "OBANK");
					// String ACCONUM = getCampoTextual(request, "ACCONUM");
					map = ObjCashDesk.ejecutaPAC_IAX_CASHDESK__F_APUNTE_PAGO_SPL(PAYERID, CURRENCY, PAYREASON, AMOPAY,
							DATEREC, PAYMET, BNAME, OBANK, ACCONUM, null, null, null, PAYTEXT, TID, null);
					listValores.put("AlertMessage", tratarRETURNyMENSAJES(request, map));
				}
				// pay method FOREIGN PAYMENT
				else if (PAYMET.equals("5")) {
					String BNAME = getCampoTextual(request, "BNAME");
					String OBANK = getCampoTextual(request, "OBANK");
					map = ObjCashDesk.ejecutaPAC_IAX_CASHDESK__F_APUNTE_PAGO_SPL(PAYERID, CURRENCY, PAYREASON, AMOPAY,
							DATEREC, PAYMET, BNAME, OBANK, ACCONUM, null, null, null, PAYTEXT, TID, null);
					// listValores.put("AlertMessage", tratarRETURNyMENSAJES(request, map));
					ajax.rellenarPlAContenedorAjax(map);
				}
				// pay method WRITE OFFS
				else if (PAYMET.equals("6")) {
					String BNAME = getCampoTextual(request, "BNAME");
					String OBANK = getCampoTextual(request, "OBANK");
					map = ObjCashDesk.ejecutaPAC_IAX_CASHDESK__F_APUNTE_PAGO_SPL(PAYERID, CURRENCY, PAYREASON, AMOPAY,
							DATEREC, PAYMET, BNAME, OBANK, ACCONUM, null, null, null, PAYTEXT, TID, null);
					// listValores.put("AlertMessage", tratarRETURNyMENSAJES(request, map));
					ajax.rellenarPlAContenedorAjax(map);
				}

				formdata.put("listValores", listValores);

				ajax.guardarContenidoFinalAContenedorAjax(map);
				log.debug(map);
			} else {
				ajax.rellenarPlAContenedorAjax(m);
			}
		} catch (Exception e) {
			logger.error("Error in the service Axisadm093Service - m_DoTransaction", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
	}

}
