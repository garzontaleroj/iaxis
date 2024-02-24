package axis.service.axis;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_CAJA;
import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.jdbc.PAC_IAX_OPERATIVA_FINV;
import axis.jdbc.PAC_IAX_PERSONA;
import axis.jdbc.PAC_IAX_PROF;
import axis.mvc.control.axis.Axiscaj001Action;
import axis.mvc.model.UsuarioBean;
import axis.util.Constantes;

public class Axiscaj001Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	public void m_form(HttpServletRequest request, Axiscaj001Action thisAction) {
		logger.debug("Axiscaj001Service m_form");
		this.formattingNumericValues(request);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {
			this.m_load_data(request, thisAction);
		} catch (Exception e) {
			logger.error("Error en el servicio axiscaj001Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
			this.gestionarOrdenacionTablas(request);
		}
	}

	public void m_load_data(HttpServletRequest request, Axiscaj001Action thisAction) {
		logger.debug("Axiscaj001Service m_load_data");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		this.formattingNumericValues(request);
		PAC_IAX_PROF pac_iax_prof = new PAC_IAX_PROF((java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
		try {
			String SPERSON = request.getParameter("SPERSON");
			formdata.put("SPERSON", SPERSON);
			logger.debug("+++++++SPERSON: " + SPERSON);
			String CAGENTE = request.getParameter("CAGENTE");
			formdata.put("CAGENTE", CAGENTE);
			logger.debug("+++++++CAGENTE: " + CAGENTE);
			formdata.put("CAGENTE", CAGENTE);
			if (request.getParameter("IMPASIG") != null && !request.getParameter("IMPASIG").equals("")) {
				BigDecimal IMPASIG = new BigDecimal(request.getParameter("IMPASIG"));
				formdata.put("IMPASIG", IMPASIG);
				logger.debug("+++++++IMPASIG: " + IMPASIG);
			}

			if (request.getParameter("IAUTOLIQI") == null) {
				formdata.put("IAUTOLIQI", 0);
			}
			if (request.getParameter("IAUTOLIQP") == null) {
				formdata.put("IAUTOLIQP", 0);
			}

			String FICHEROS = request.getParameter("FICHEROS");
			formdata.put("FICHEROS", FICHEROS);
			logger.debug("+++++++FICHEROS: " + FICHEROS);
			// request.getSession().setAttribute("fp", null);
			// String CMETMOV=request.getParameter("MEDIOPAGO");
			// formdata.put("MEDIOPAGO", CMETMOV);
			// logger.debug("+++++++MEDIOPAGO: "+CMETMOV);

			this.cargarDatos(request, thisAction, formdata);

		} catch (Exception e) {
			logger.error("Error en el servicio axiscaj001Service - m�todo m_load_data", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

	private void cargarDatos(HttpServletRequest request, Axiscaj001Action thisAction, Map formdata) throws Exception {
		try {

			BigDecimal CAGENTE = this.getCampoNumerico(request, "CAGENTE");
			BigDecimal LIMPIARMP = this.getCampoNumerico(request, "LIMPIA");
			Map mapAgentes = new HashMap();
			Map agente = new HashMap();
			if (!isEmpty(CAGENTE)) {
				UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
				String CONDICION = "INTERMEDIARIOS";
				mapAgentes = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTAGENTES_COND(null, null, CAGENTE, new BigDecimal(1),
								CONDICION);
				List agentes = (List) mapAgentes.get("RETURN");
				if (!isEmpty(mapAgentes.get("RETURN"))) {
					agente = (Map) agentes.get(0);
				}
				logger.debug("+++++++Agente: " + agente);
			}
			formdata.put("CAGENTE", CAGENTE);
			formdata.put("AGENTE", agente);
			Map map = null;
			PAC_IAX_OPERATIVA_FINV pac_axis_operativa = new PAC_IAX_OPERATIVA_FINV(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			map = pac_axis_operativa.ejecutaPAC_IAX_OPERATIVA_FINV__F_MONEDAS();
			logger.debug(map);
			List MONEDAS = (List) tratarRETURNyMENSAJES(request, map, false);
			formdata.put("MONEDAS", MONEDAS);

			List lista = null;

			if (LIMPIARMP != null && LIMPIARMP.equals(new BigDecimal("1"))) {
				request.getSession().setAttribute("fp", null);
				formdata.put("cuentas", null);
			} else {
				lista = (List) request.getSession().getAttribute("fp");
				formdata.put("cuentas", lista);
			}
			BigDecimal monto = new BigDecimal("0");
			if (lista != null)
				monto = calculaImporte(lista);
			formdata.put("IMOVIMI", monto);

			PAC_IAX_CAJA pac_iax_caja = new PAC_IAX_CAJA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			map = pac_iax_caja.ejecutaPAC_IAX_CAJA__F_GET_AGENTE(CAGENTE);
			logger.debug(map);
			List AGENTE = (List) tratarRETURNyMENSAJES(request, map, false);
			formdata.put("ALLAGENTE", AGENTE);
		} catch (Exception e) {
			logger.error("Error en el m�todo Axiscaj001Service.cargarDatos", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	public BigDecimal calculaImporte(List lista) {

		BigDecimal total = new BigDecimal("0");
		BigDecimal imp = new BigDecimal("0");
		for (int i = 0; i < lista.size(); i++) {
			HashMap mapa = (HashMap) lista.get(i);
			imp = (BigDecimal) mapa.get("importe");
			logger.debug("++++++imp : " + imp);
			total = total.add(imp);
			logger.debug("++++++total : " + total);
		}
		return total;
	}

	public void m_ajax_ins_mov_caja(HttpServletRequest request) {
		logger.debug("axiscaj001Service m_ajax_ins_mov_caja");
		AjaxContainerService ajax = new AjaxContainerService();
		this.formattingNumericValues(request);
		try {
			ajax.guardarContenidoFinalAContenedorAjax(this.ins_mov_caja(request));
		} catch (Exception e) {
			logger.error("Error en el servicio axiscaj001Service - m�todo m_ajax_ins_mov_caja", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	private List ins_mov_caja(HttpServletRequest request) throws Exception {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		this.formattingNumericValues(request);
		AjaxContainerService ajax = new AjaxContainerService();
		Map map;

		try {
			PAC_IAX_CAJA pac_iax_caja = new PAC_IAX_CAJA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			BigDecimal SPERSON = this.getCampoNumerico(request, "SPERSON");
			formdata.put("SPERSON", SPERSON);
			logger.debug("+++++++SPERSON: " + SPERSON);
			BigDecimal IAUTOLIQ = this.getCampoNumerico(request, "IAUTOLIQ");
			formdata.put("IAUTOLIQ", IAUTOLIQ);
			logger.debug("+++++++IAUTOLIQ: " + IAUTOLIQ);

			BigDecimal IPAGSIN = this.getCampoNumerico(request, "IPAGSIN");
			formdata.put("IPAGSIN", IPAGSIN);
			logger.debug("+++++++IPAGSIN: " + IPAGSIN);

			BigDecimal IMOVIMI = this.getCampoNumerico(request, "IMOVIMI");
			formdata.put("IMOVIMI", IMOVIMI);
			logger.debug("+++++++IMOVIMI: " + IMOVIMI);

			String CMONOPE = this.getCampoTextual(request, "CMONOPE");
			formdata.put("CMONOPE", CMONOPE);
			logger.debug("+++++++CMONOPE: " + CMONOPE);

			String FICHEROS = this.getCampoTextual(request, "FICHEROS");
			formdata.put("FICHEROS", FICHEROS);
			logger.debug("+++++++FICHEROS: " + FICHEROS);

			BigDecimal CMETMOV = this.getCampoNumerico(request, "CMETMOV");
			formdata.put("CMETMOV", CMETMOV);
			logger.debug("+++++++CMETMOV: " + CMETMOV);

			String NCHEQUE = this.getCampoTextual(request, "NCHEQUE");
			formdata.put("NCHEQUE", NCHEQUE);
			logger.debug("+++++++NCHEQUE: " + NCHEQUE);

			BigDecimal CCHQORI = this.getCampoNumerico(request, "CCHQORI");
			formdata.put("CCHQORI", CCHQORI);
			logger.debug("+++++++CCHQORI: " + CCHQORI);

			BigDecimal CBANTRANS = this.getCampoNumerico(request, "CBANTRANS");
			formdata.put("CBANTRANS", CBANTRANS);
			logger.debug("+++++++CBANTRANS: " + CBANTRANS);

			CBANTRANS = (CBANTRANS == null) ? CCHQORI : CBANTRANS;

			String CCC = this.getCampoTextual(request, "CCC");
			formdata.put("CCC", CCC);
			logger.debug("+++++++CCC: " + CCC);

			BigDecimal CTIPTAR = this.getCampoNumerico(request, "CTIPTAR");
			formdata.put("CTIPTAR", CTIPTAR);
			logger.debug("+++++++CTIPTAR: " + CTIPTAR);

			BigDecimal NTARGET = this.getCampoNumerico(request, "NTARGET");
			formdata.put("NTARGET", NTARGET);
			logger.debug("+++++++NTARGET: " + NTARGET);

			String FCADTAR = this.getCampoTextual(request, "FCADTAR");
			formdata.put("FCADTAR", FCADTAR);
			logger.debug("+++++++FCADTAR: " + FCADTAR);

			String CADENA = (String) request.getSession().getAttribute("CADENA");

			/*
			 * map=pac_iax_caja.ejecutaPAC_IAX_CAJA__F_UPD_PAGOS_MASIVO(FICHEROS,SPERSON,
			 * new BigDecimal(0), IMOVIMI, IAUTOLIQ, IPAGSIN, CMONOPE, CMETMOV, NCHEQUE,
			 * CBANTRANS, CCC, CTIPTAR, NTARGET, FCADTAR);
			 * 
			 */
			/*
			 * Map map=pac_iax_caja.ejecutaPAC_IAX_CAJA__F_INS_MOVTOCAJA(SPERSON, new
			 * BigDecimal(0), IMOVIMI, IAUTOLIQ, IPAGSIN, CMONOPE, CMETMOV, NCHEQUE,
			 * CBANTRANS, CCC, CTIPTAR, NTARGET, FCADTAR);
			 * 
			 * logger.debug("++++map starifa "+map); BigDecimal
			 * rt=(BigDecimal)tratarRETURNyMENSAJES(request, map); if (rt.intValue()==0) {
			 * List listaSEQCAJA=new ArrayList(); Map mseqCaja=new HashMap();
			 * mseqCaja.put("PSEQCAJA", (BigDecimal)map.get("PSEQCAJA"));
			 * listaSEQCAJA.add(mseqCaja); formdata.put("SEQCAJA",
			 * (BigDecimal)map.get("PSEQCAJA"));
			 * logger.debug("++++listaSEQCAJA "+listaSEQCAJA); return listaSEQCAJA; } else {
			 * return (List)map.get("MENSAJES"); }
			 */
			// map=pac_iax_caja.ejecutaPAC_IAX_CAJA__F_UPD_PAGOS_MASIVO(pro, new
			// BigDecimal(1),imp,SPERSON, new BigDecimal(0), IMOVIMI, IAUTOLIQ, IPAGSIN,
			// CMONOPE, CMETMOV, NCHEQUE, CBANTRANS, CCC, CTIPTAR, NTARGET, FCADTAR);
			// try {
			// boolean flagCorrecto=true;

			/*
			 * BigDecimal PSEQCAJA=this.getCampoNumerico(request, "SEQCAJA");
			 * formdata.put("SEQCAJA", PSEQCAJA); logger.debug("+++++++SEQCAJA: "+PSEQCAJA);
			 */

			/*
			 * List listAutLiq=new ArrayList();
			 * listAutLiq=(List)request.getSession().getAttribute("LSTAUTLIQ"); for (int
			 * i=0; i<listAutLiq.size(); i++) { HashMap reg=(HashMap)listAutLiq.get(i);
			 * BigDecimal PCAGENTE=(BigDecimal)reg.get("CAGENTE"); BigDecimal
			 * PSPROCES=(BigDecimal)reg.get("SPROCES"); BigDecimal
			 * PCMONOPE=(BigDecimal)reg.get("CMONEOP"); BigDecimal
			 * PIAUTLIQ=(BigDecimal)reg.get("IAUTLIQ"); BigDecimal
			 * PSPRODUC=(BigDecimal)reg.get("SPRODUC");
			 * map=pac_iax_caja.ejecutaPAC_IAX_CAJA__F_INS_DET_AUTLIQ(PCAGENTE, PSPROCES,
			 * PCMONOPE, PSPRODUC, PIAUTLIQ); if
			 * (((BigDecimal)tratarRETURNyMENSAJES(request, map)).intValue()!=0) {
			 * flagCorrecto=false; break; } }
			 */

			/*
			 * String[] f=FICHEROS.split("-"); if(f.length>1){ for (int i=1; i<f.length;
			 * i++) { String PSPROCES=f[i]; logger.debug("PSPROCES: "+PSPROCES); String[]
			 * proimp=PSPROCES.split("/"); logger.debug("proimp: "+proimp); BigDecimal
			 * pro=null,imp=null; if(proimp[0]!=null) pro=new BigDecimal(proimp[0]);
			 * if(proimp[1]!=null) imp=new BigDecimal(proimp[1]);
			 * 
			 * 
			 * if (!f[i].equals("")) {
			 * 
			 * if (i==f.length-1) {
			 * 
			 * map=pac_iax_caja.ejecutaPAC_IAX_CAJA__F_UPD_PAGOS_MASIVO(pro, new
			 * BigDecimal(1),imp,SPERSON, new BigDecimal(0), IMOVIMI, IAUTOLIQ, IPAGSIN,
			 * CMONOPE, CMETMOV, NCHEQUE, CBANTRANS, CCC, CTIPTAR, NTARGET, FCADTAR); } else
			 * { map=pac_iax_caja.ejecutaPAC_IAX_CAJA__F_UPD_PAGOS_MASIVO(pro, new
			 * BigDecimal(0),imp,SPERSON, new BigDecimal(0), IMOVIMI, IAUTOLIQ, IPAGSIN,
			 * CMONOPE, CMETMOV, NCHEQUE, CBANTRANS, CCC, CTIPTAR, NTARGET, FCADTAR); }
			 * 
			 * if (((BigDecimal)tratarRETURNyMENSAJES(request, map)).intValue()!=0) {
			 * flagCorrecto=false; break; } } } } if (flagCorrecto) {
			 * formdata.put("guardat", "0"); } else { formdata.put("guardat", "1");
			 */

			PAC_IAX_LISTVALORES pac_iax_listvalores = new PAC_IAX_LISTVALORES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORESCOND2(new BigDecimal(481), "FILTRO481_1");
			logger.debug(map);
			List FORMAPAGO = (List) tratarRETURNyMENSAJES(request, map, false);
			formdata.put("FORMAPAGO", FORMAPAGO);

			PAC_IAX_OPERATIVA_FINV pac_axis_operativa = new PAC_IAX_OPERATIVA_FINV(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			map = pac_axis_operativa.ejecutaPAC_IAX_OPERATIVA_FINV__F_MONEDAS();
			logger.debug(map);
			List MONEDAS = (List) tratarRETURNyMENSAJES(request, map, false);
			formdata.put("MONEDAS", MONEDAS);

			logger.debug("$$$$$$$$$$$$ fin pac_iax_caja: " + map);
			return null;
		} catch (Exception e) {
			logger.error("Error en el servicio Axiscaj001Service - m�todo m_aceptar", e);
			// thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() },
			// Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}

		return null;

	}

	public void aceptar(HttpServletRequest request, Axiscaj001Action thisAction) {

		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		boolean flagCorrecto = true;
		this.formattingNumericValues(request);
		AjaxContainerService ajax = new AjaxContainerService();
		Map map;

		try {
			PAC_IAX_CAJA pac_iax_caja = new PAC_IAX_CAJA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			BigDecimal SPERSON = this.getCampoNumerico(request, "SPERSON");
			formdata.put("SPERSON", SPERSON);
			logger.debug("+++++++SPERSON: " + SPERSON);
			BigDecimal IAUTOLIQI = this.getCampoNumerico(request, "IAUTOLIQI");
			formdata.put("IAUTOLIQI", IAUTOLIQI);
			logger.debug("+++++++IAUTOLIQI: " + IAUTOLIQI);

			BigDecimal IAUTOLIQP = this.getCampoNumerico(request, "IAUTOLIQP");
			formdata.put("IAUTOLIQP", IAUTOLIQP);
			logger.debug("+++++++IAUTOLIQP: " + IAUTOLIQP);

			BigDecimal DIFERENCIAL = this.getCampoNumerico(request, "DIFERENCIAL");
			formdata.put("DIFERENCIAL", DIFERENCIAL);
			logger.debug("+++++++DIFERENCIAL: " + DIFERENCIAL);

			BigDecimal IPAGSIN = this.getCampoNumerico(request, "IPAGSIN");
			formdata.put("IPAGSIN", IPAGSIN);
			logger.debug("+++++++IPAGSIN: " + IPAGSIN);

			BigDecimal IMOVIMI = this.getCampoNumerico(request, "IMOVIMI");
			formdata.put("IMOVIMI", IMOVIMI);
			logger.debug("+++++++IMOVIMI: " + IMOVIMI);

			String CMONOPE = this.getCampoTextual(request, "CMONOPE");
			formdata.put("CMONOPE", CMONOPE);
			logger.debug("+++++++CMONOPE: " + CMONOPE);

			String FICHEROS = this.getCampoTextual(request, "FICHEROS");
			formdata.put("FICHEROS", FICHEROS);
			logger.debug("+++++++FICHEROS: " + FICHEROS);

			String cadenaMP = "", num = "";
			BigDecimal imp, med, ban;

			List lista = (List) request.getSession().getAttribute("fp");
			for (int i = 0; i < lista.size(); i++) {
				HashMap mapa = (HashMap) lista.get(i);
				med = (BigDecimal) mapa.get("medioPago");
				ban = (BigDecimal) mapa.get("banco");
				num = (String) mapa.get("numero");
				imp = (BigDecimal) mapa.get("importe");
				if (med.compareTo(new BigDecimal("0")) == 0)
					cadenaMP += "-" + med.toString() + "_0_0_" + imp;
				else
					cadenaMP += "-" + med.toString() + "_" + ban.toString() + "_" + num.toString() + "_"
							+ imp.toString();
				logger.debug("++++++imp : " + cadenaMP);

			}
			map = pac_iax_caja.ejecutaPAC_IAX_CAJA__F_UPD_PAGOS_MASIVO(FICHEROS, cadenaMP, usuario.getCempres(),
					usuario.getUsuario(), SPERSON, new BigDecimal(0), IMOVIMI, IAUTOLIQI, IPAGSIN, CMONOPE, IAUTOLIQP,
					DIFERENCIAL);
			if (((BigDecimal) tratarRETURNyMENSAJES(request, map)).intValue() != 0) {
				flagCorrecto = false;
			}
			if (flagCorrecto) {
				formdata.put("guardat", "0");
			} else {
				formdata.put("guardat", "1");
			}
			BigDecimal CAGENTE = this.getCampoNumerico(request, "CAGENTE");
			Map mapAgentes = new HashMap();
			Map agente = new HashMap();
			if (!isEmpty(CAGENTE)) {
				String CONDICION = "INTERMEDIARIOS";
				mapAgentes = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTAGENTES_COND(null, null, CAGENTE, new BigDecimal(1),
								CONDICION);
				List agentes = (List) mapAgentes.get("RETURN");
				if (!isEmpty(mapAgentes.get("RETURN"))) {
					agente = (Map) agentes.get(0);
				}
				logger.debug("+++++++Agente: " + agente);
			}
			formdata.put("CAGENTE", CAGENTE);
			formdata.put("AGENTE", agente);
			PAC_IAX_LISTVALORES pac_iax_listvalores = new PAC_IAX_LISTVALORES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORESCOND2(new BigDecimal(481), "FILTRO481_1");
			logger.debug(map);
			List FORMAPAGO = (List) tratarRETURNyMENSAJES(request, map, false);
			formdata.put("FORMAPAGO", FORMAPAGO);

			PAC_IAX_OPERATIVA_FINV pac_axis_operativa = new PAC_IAX_OPERATIVA_FINV(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			map = pac_axis_operativa.ejecutaPAC_IAX_OPERATIVA_FINV__F_MONEDAS();
			logger.debug(map);
			List MONEDAS = (List) tratarRETURNyMENSAJES(request, map, false);
			formdata.put("MONEDAS", MONEDAS);
			this.m_load_data(request, thisAction);

		} catch (Exception e) {
			logger.error("Error en el servicio Axiscaj001Service - m�todo m_aceptar", e);
			// thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() },
			// Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}

	}

	public void m_ajax_guardar_moneda(HttpServletRequest request, Axiscaj001Action this1) {
		logger.debug("axiscaj001Service m_ajax_ins_mov_caja");
		this.formattingNumericValues(request);
		AjaxContainerService ajax = new AjaxContainerService();
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);

		try {
			String CMONOPE = this.getCampoTextual(request, "CMONOPE");
			formdata.put("CMONOPE", CMONOPE);
			logger.debug("+++++++CMONOPE: " + CMONOPE);
			ArrayList r = new ArrayList();
			r.add("ok");
			ajax.guardarContenidoFinalAContenedorAjax(r);
		} catch (Exception e) {
			logger.error("Error en el servicio axiscaj001Service - m�todo m_ajax_ins_mov_caja", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	public void m_ajax_delete(HttpServletRequest request, Axiscaj001Action this1) {
		logger.debug("axiscaj001Service m_ajax_ins_mov_caja");
		this.formattingNumericValues(request);
		AjaxContainerService ajax = new AjaxContainerService();
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);

		try {
			BigDecimal NUMLIN = this.getCampoNumerico(request, "NUMLIN");
			logger.debug("+++++++NUMLIN: " + NUMLIN);
			List lista = (List) request.getSession().getAttribute("fp");
			List lista2 = new ArrayList();
			int con = 1;
			for (int i = 0; i < lista.size(); i++) {
				HashMap mapa = (HashMap) lista.get(i);
				int num = (Integer) mapa.get("numlin");
				if (num != NUMLIN.intValueExact()) {
					mapa.put("numlin", con);
					lista2.add(mapa);
					con++;
				}
			}
			request.getSession().setAttribute("fp", lista2);
			formdata.put("cuentas", lista2);

		} catch (Exception e) {
			logger.error("Error en el servicio axiscaj001Service - m�todo m_ajax_ins_mov_caja", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	public void m_ajax_valida_tarjeta(HttpServletRequest request, Axiscaj001Action this1) {
		logger.debug("axiscaj001Service m_ajax_valida_tarjeta");
		this.formattingNumericValues(request);
		AjaxContainerService ajax = new AjaxContainerService();
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);

		try {
			BigDecimal CTIPBAN = this.getCampoNumerico(request, "CTIPTAR");
			formdata.put("CTIPBAN", CTIPBAN);
			logger.debug("+++++++CTIPBAN: " + CTIPBAN);
			String CBANCAR = this.getCampoTextual(request, "NTARGET");
			formdata.put("CBANCAR", CBANCAR);
			logger.debug("+++++++CBANCAR: " + CBANCAR);
			BigDecimal resultado = new BigDecimal("0");
			PAC_IAX_PERSONA pac_iax_persona = new PAC_IAX_PERSONA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			if (!isEmpty(CTIPBAN)) {
				Map map = pac_iax_persona.ejecutaPAC_IAX_PERSONA__F_VALIDACCC(CTIPBAN, CBANCAR);
				logger.debug(map);
				resultado = (BigDecimal) tratarRETURNyMENSAJES(request, map, false);
			}

			ajax.guardarContenidoFinalAContenedorAjax(resultado);
		} catch (Exception e) {
			logger.error("Error en el servicio axiscaj001Service - m�todo m_ajax_ins_mov_caja", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}
}
