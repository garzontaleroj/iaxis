//Revision:# X7RlxWENaeiNCeplTLsIhA== #
/*********************************************************************************************************************/
/***********************************************JBENITEZ - APRIL 2015 - BUG 33886/199826******************************/
/*********************************************************************************************************************/
package axis.service.axis;

import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

/***********************************************IMPORTING PACKAGES*******************************************/
import axis.jdbc.PAC_IAX_CASHDESK;
import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.jdbc.PAC_IAX_PERSONA;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.control.axis.Axisadm093Action;
import axis.mvc.model.UsuarioBean;
import axis.util.Constantes;

/***********************************************
 * CLASS DEFINITION
 *******************************************/
public class Axisadm093Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());
	Log log = LogFactory.getLog(this.getClass());
	SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");

	/***************************************************************************************************************/
	/***********************************************
	 * STARTING FUNCTIONS
	 *******************************************/
	/***************************************************************************************************************/
	@SuppressWarnings("all")
	/***********************************************
	 * LOAD METHOD - JBENITEZ
	 *******************************************/
	public void m_form(HttpServletRequest request, Axisadm093Action thisAction) {
		logger.debug("Axisadm093Service m_form");
		// catch user
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		// start try1
		try {
			request.removeAttribute("dades_persona");
			String CMODO = request.getParameter("MODO");
			logger.debug("----> modo:" + CMODO);
			AbstractDispatchAction.topPila(request, "CMODO", CMODO);
			formdata.put("CMODO", CMODO);
			// catch try1
		} catch (Exception e) {
			logger.error("Error in the Service Axisadm093Service - function m_form", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		// go to loadBoxes
		this.loadBoxes(request);
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
					"catribu in(0,1,2,3,6,9)"); // PAYMENT METHOD
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

	/***********************************************
	 * SEARCH AND INSERT POLICIES AMOUNTS - JBENITEZ
	 *******************************************/
	public void m_ajax_search_amount(HttpServletRequest request) {
		AjaxContainerService ajax = new AjaxContainerService();
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {
			// getting data from jsp
			String POLICY = getCampoTextual(request, "POLICY");
			BigDecimal AMOUNT = getCampoNumerico(request, "AMOUNT");
			BigDecimal AMOPAY = getCampoNumerico(request, "AMOPAY");
			String TID = getCampoTextual(request, "TID");
			BigDecimal SPERSON = getCampoNumerico(request, "SPERSON_REL");
			// call BD function
			Map m = new PAC_IAX_CASHDESK((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_CASHDESK__F_INS_CASHDESKTMP(null, AMOPAY, POLICY, AMOUNT, TID, SPERSON);
			List primas = (List) tratarRETURNyMENSAJES(request, m, false);
			formdata.put("MODINVFONDO", primas);
			ajax.guardarContenidoFinalAContenedorAjax(primas);
		} catch (Exception e) {
			logger.error("Error in the service Axisadm093Service - m_ajax_search_amount", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	/***********************************************
	 * DELETE POLICIES AMOUNTS - JBENITEZ
	 *******************************************/
	public void m_ajax_delete_amount(HttpServletRequest request) {
		AjaxContainerService ajax = new AjaxContainerService();
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {
			BigDecimal STEMPO = getCampoNumerico(request, "STEMPO");
			String TID = getCampoTextual(request, "TID");
			Map m = new PAC_IAX_CASHDESK((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_CASHDESK__F_DEL_CASHDESKTMP(STEMPO, TID);
			List primas = (List) tratarRETURNyMENSAJES(request, m, false);
			formdata.put("MODINVFONDO", primas);
			ajax.guardarContenidoFinalAContenedorAjax(primas);
		} catch (Exception e) {
			logger.error("Error in the service Axisadm093Service - m_ajax_delete_amount", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	/***********************************************
	 * DO THE COMPLETE TRANSSACTION - JBENITEZ
	 *******************************************/
	public void m_DoTransaction(HttpServletRequest request, Axisadm093Action thisAction) {
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
				// The following line is the complete parameter�s reference:
				// map =
				// ObjCashDesk.ejecutaPAC_IAX_CASHDESK_MSV__DO_TRANSACTION(PAYERID,CURRENCY,PAYREASON,AMOPAY,DATEREC,PAYMET,BNAME,OBANK,ACCONUM,CHNUM,CHTYPE,CLIMOP,PAYTEXT,TID);
				Map listValores = new HashMap();
				// pay method CASH
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

	public void m_PagoPoliza(HttpServletRequest request, Axisadm093Action thisAction) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		AjaxContainerService ajax = new AjaxContainerService();
		try {

			PAC_IAX_CASHDESK ObjCashDesk = new PAC_IAX_CASHDESK(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map map = new HashMap();

			BigDecimal PAYERID = getCampoNumerico(request, "SPERSON_REL");
			BigDecimal MONTO = getCampoNumerico(request, "MONPOLI");
			BigDecimal TID = getCampoNumerico(request, "TIDE");
			String CURRENCY = getCampoTextual(request, "CURRENCY");
			String PAYREASON = getCampoTextual(request, "PAYREASON");
			String DATEREC = getCampoTextual(request, "DATEREC");
			String PAYMET = getCampoTextual(request, "PAYMET");
			String CHTYPE = getCampoTextual(request, "CHTYPE");
			String PAYTEXT = getCampoTextual(request, "PAYTEXT");
			String BNAME = getCampoTextual(request, "BNAME");
			String OBANK = getCampoTextual(request, "OBANK");
			String CHNUM = getCampoTextual(request, "CHNUM");
			String ACCONUM = getCampoTextual(request, "ACCONUM");
			String CLIMOP = getCampoTextual(request, "CLIMOP");

			Map listValores = new HashMap();

			map = ObjCashDesk.ejecutaPAC_IAX_CASHDESK__F_EJECUTA_SIN_POLIZA(PAYERID, CURRENCY, PAYREASON, MONTO,
					DATEREC, PAYMET, BNAME, OBANK, ACCONUM, CHNUM, CHTYPE, CLIMOP, PAYTEXT, TID);

			ajax.rellenarPlAContenedorAjax(map);

			listValores.put("TID", map.get("RETURN"));

			formdata.put("listValores", listValores);

			ajax.guardarContenidoFinalAContenedorAjax(map);
			log.debug(map);
		} catch (Exception e) {
			logger.error("Error in the service Axisadm093Service - m_DoTransaction", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
	}

	public void m_ajax_actualizar_persona(HttpServletRequest request, Axisadm093Action thisAction) {

		logger.debug("Axisadm093Service m_ajax_actualizar_persona");

		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		AjaxContainerService ajax = new AjaxContainerService();

		try {
			BigDecimal SPERSON = this.getCampoNumerico(request, "SPERSON_REL");
			BigDecimal CAGENTE = this.getCampoNumerico(request, "CAGENTE1");
			CAGENTE = isEmpty(CAGENTE) ? usuario.getCagente() : CAGENTE;
			Map map = new PAC_IAX_PERSONA((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_PERSONA__F_GET_PERSONA(SPERSON, CAGENTE);
			BigDecimal RETURN = (BigDecimal) ajax.rellenarPlAContenedorAjax(map);
			Map map2 = new PAC_IAX_CASHDESK((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_CASHDESK__F_LEEPAGOS_SIN_POLIZA(SPERSON);
			BigDecimal RETURN2 = (BigDecimal) ajax.rellenarPlAContenedorAjax(map2);

			if (!isEmpty(map) && new BigDecimal(0).equals(RETURN)) {

				Map OB_PERSONA = (Map) map.get("OBPERSONA");
				OB_PERSONA.put("MONTO", map2.get("RETURN"));

				ajax.rellenarPlAContenedorAjax(map);
				ajax.guardarContenidoFinalAContenedorAjax(OB_PERSONA);
			}

		} catch (Exception e) {
			logger.error("Axisadm093Service m_ajax_actualizar_persona - Excepcion", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	public void m_loadBox(HttpServletRequest request) {
		// debug
		logger.debug("Axisadm093Service loadBoxes");
		// our map
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		// get general user
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		// start try1
		AjaxContainerService ajax = new AjaxContainerService();

		try {
			// map #2

			Map listValores = new HashMap();

			// BigDecimal TCHEQUE = this.getCampoNumerico(request, "TCHEQUE");
			String TCHEQUE = getCampoTextual(request, "TCHEQUE");

			PAC_IAX_LISTVALORES pac_axis_listValores = new PAC_IAX_LISTVALORES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			if (TCHEQUE.equals("3")) {

				Map map2 = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(8000953)); // CHEQUE
																													// DRAFT
																													// TYPE
				listValores.put("chdrtype", tratarRETURNyMENSAJES(request, map2));

			} else {

				Map map2 = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(8000955)); // CHEQUE
																													// DRAFT
																													// TYPE

				listValores.put("chdrtype", tratarRETURNyMENSAJES(request, map2));
			}

			// listValores.put("chdrtype", tratarRETURNyMENSAJES(request, map2));

			// saving listvalores in map formdata
			formdata.put("listValores", listValores);

			ajax.guardarContenidoFinalAContenedorAjax(listValores);
			// ajax.rellenarPlAContenedorAjax(formdata);

			// catch try1
		} catch (Exception e) {
			logger.error("Error in the Service Axisadm093Service.loadBoxes", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

}
