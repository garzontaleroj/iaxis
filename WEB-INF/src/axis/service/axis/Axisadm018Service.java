//Revision:# 6Lg1fjFFTc1A4ehrVi6c5A== #
package axis.service.axis;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_ADM;
import axis.jdbc.PAC_IAX_GESTION_REC;
import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.jdbc.PAC_IAX_PERSONA;
import axis.jdbc.PAC_IAX_PRODUCCION;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.control.axis.Axisadm018Action;
import axis.mvc.model.UsuarioBean;
import axis.util.Constantes;

public class Axisadm018Service extends AxisBaseService {
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
	@SuppressWarnings("all")
	public void m_init(HttpServletRequest request) {
		logger.debug("Axisadm018Service m_form");
		try {
			request.getSession().setAttribute("MODIFICADO_OK", true);
		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm018Service - m�todo m_init", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	/**
	 * 
	 * @param request
	 */
	@SuppressWarnings("all")
	public void m_form(HttpServletRequest request, Axisadm018Action thisAction) {
		logger.debug("Axisadm018Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {
			BigDecimal NRECIBO = getCampoNumerico(request, "NRECIBO");
			String CBANCAR = getCampoTextual(request, "CBANCAR");
			CBANCAR = ((!isEmpty(CBANCAR)) ? CBANCAR.replaceAll("-", "") : null);

			BigDecimal CTIPBAN = getCampoNumerico(request, "CTIPBAN");
			boolean llenoCobrad = false;
			logger.debug("CTIPBAN -----> " + CTIPBAN);
			logger.debug("CBANCAR -----> " + CBANCAR);

			// Datos que provienen de un flujo externo para controlar:
			// a- Si queremos ver el modal
			// b- A que pantalla de vuelta se dirige cuando se cancela.
			boolean acceso_externo = ((!isEmpty(thisAction.topPila(request, "acceso_externo")))
					? (Boolean) thisAction.topPila(request, "acceso_externo")
					: false);
			String pantalla_origen = ((!isEmpty(thisAction.topPila(request, "pantalla_origen")))
					? (String) thisAction.topPila(request, "pantalla_origen")
					: "axisctr020");

			request.setAttribute("acceso_externo", acceso_externo);
			request.setAttribute("pantalla_origen", pantalla_origen);

			if (!isEmpty(NRECIBO)) {
				PAC_IAX_ADM pac_iax_adm = new PAC_IAX_ADM(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
				PAC_IAX_PRODUCCION pac_iax_produccion = new PAC_IAX_PRODUCCION(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
				PAC_IAX_LISTVALORES pac_iax_listvalores = new PAC_IAX_LISTVALORES(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

				// Info del recibo
				Map map1 = pac_iax_adm.ejecutaPAC_IAX_ADM__F_GET_DATOSRECIBO_MV(NRECIBO, new BigDecimal(1));
				Map OB_IAX_RECIBOS = (Map) tratarRETURNyMENSAJES(request, map1);
				logger.debug(OB_IAX_RECIBOS);

				// ReFormateo el valor de CBANCAR
				if (!isEmpty(OB_IAX_RECIBOS) && !isEmpty(OB_IAX_RECIBOS.get("CBANCAR"))) {
					String CBANCAR_TMP = (String) OB_IAX_RECIBOS.get("CBANCAR");
					CBANCAR_TMP = CBANCAR_TMP.replaceAll("-", "");
					OB_IAX_RECIBOS.put("CBANCAR", CBANCAR_TMP);
					logger.debug(OB_IAX_RECIBOS);
				}

				// Info. general de la p�liza
				BigDecimal SSEGURO = ((!isEmpty(OB_IAX_RECIBOS) && !isEmpty(OB_IAX_RECIBOS.get("SSEGURO")))
						? (BigDecimal) OB_IAX_RECIBOS.get("SSEGURO")
						: null);
				Map map2 = pac_iax_produccion.ejecutaPAC_IAX_PRODUCCION__F_GET_DATPOLIZA(SSEGURO);
				Map OB_IAX_GENPOLIZA = (Map) tratarRETURNyMENSAJES(request, map2);
				logger.debug(OB_IAX_GENPOLIZA);

				if (!estaReciboModificado(request)) {
					// Obtenir els camps de gesti�n de cobro
					Map map3 = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal("694"));
					List gestion = (List) tratarRETURNyMENSAJES(request, map3);
					logger.debug(gestion);

					// Obtenir els camps d'estat d'impressi�
					Map map4 = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal("75"));
					List estado = (List) tratarRETURNyMENSAJES(request, map4);
					logger.debug(estado);

					// Obtenir els camps del combo de cuentas
					// Map map5=pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_TIPCCC();
					// //AMA-286
					Map map5 = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTTIPOCUENTA();
					List cuentas = (List) tratarRETURNyMENSAJES(request, map5);
					logger.debug(cuentas);

					// AAC_INI-CONF_OUTSOURCING-20160906
					logger.debug(
							"******************************------------------------------------------------******************************");
					logger.debug("RECUPERO NOUS VALORS");
					Map map6 = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal("8001111"));
					List lcgescar = (List) tratarRETURNyMENSAJES(request, map6);
					logger.debug(lcgescar);
					logger.debug(
							"******************************------------------------------------------------******************************");
					// AAC_FI-CONF_OUTSOURCING-20160906

					request.setAttribute("gestion", !isEmpty(gestion) ? gestion : new ArrayList());
					request.setAttribute("estado", !isEmpty(estado) ? estado : new ArrayList());
					request.setAttribute("cuentas", !isEmpty(cuentas) ? cuentas : new ArrayList());
					// AAC_INI-CONF_OUTSOURCING-20160906
					request.setAttribute("lcgescar", !isEmpty(lcgescar) ? lcgescar : new ArrayList());
					// AAC_FII-CONF_OUTSOURCING-20160906
					// Camps per mostrar si han estat omplerts en pantalla.
					request.setAttribute("CBANCAR", CBANCAR);

					logger.debug("CBANCAR ----------------------------> " + CBANCAR);
					logger.debug("CTIPBAN ----------------------------> " + CTIPBAN);

					String CBANCAR_AUX = new String();
					BigDecimal CTIPBAN_AUX = CTIPBAN;
					if (!isEmpty(OB_IAX_RECIBOS) && !isEmpty(OB_IAX_RECIBOS.get("CBANCAR"))) {
						CBANCAR_AUX = (String) OB_IAX_RECIBOS.get("CBANCAR");
						CTIPBAN_AUX = (BigDecimal) OB_IAX_RECIBOS.get("CTIPBAN");
					}

					// RECOGER DATOS DEL VDETRECIBO
					if (!isEmpty(OB_IAX_RECIBOS)) {
						ArrayList lista_det = (ArrayList) OB_IAX_RECIBOS.get("VDETRECIBO");
						if (!isEmpty(lista_det) && lista_det.size() >= 1) {
							Map OB_VDETRECIBO = (Map) lista_det.get(0);
							Map OB_IAX_VDETRECIBO = (Map) OB_VDETRECIBO.get("OB_IAX_VDETRECIBO");
							if (!isEmpty(OB_IAX_VDETRECIBO)) {
								BigDecimal IIMP_1 = (BigDecimal) OB_IAX_VDETRECIBO.get("IIMP_1");
								BigDecimal IIMP_2 = (BigDecimal) OB_IAX_VDETRECIBO.get("IIMP_2");
								BigDecimal IIMP_3 = (BigDecimal) OB_IAX_VDETRECIBO.get("IIMP_3");
								BigDecimal IIMP_4 = (BigDecimal) OB_IAX_VDETRECIBO.get("IIMP_4");
								request.setAttribute("IIMP_1", IIMP_1);
								request.setAttribute("IIMP_2", IIMP_2);
								request.setAttribute("IIMP_3", IIMP_3);
								request.setAttribute("IIMP_4", IIMP_4);
							}
						}
					}

					logger.debug("OB_IAX_RECIBOS ----------------------------> " + OB_IAX_RECIBOS);
					logger.debug("CBANCAR_AUX ----------------------------> " + CBANCAR_AUX);
					logger.debug("CTIPBAN_AUX ----------------------------> " + CTIPBAN_AUX);

					if (!isEmpty(CBANCAR) || !isEmpty(CBANCAR_AUX)) {
						BigDecimal SPRODUC = (BigDecimal) OB_IAX_GENPOLIZA.get("SPRODUC");
						formdata.put("SPRODUC", SPRODUC);
						// Cargamos los cobradores
						Map map_cob = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_DESCOBRADORES_RAMO(SPRODUC,
								!isEmpty(CBANCAR) ? CBANCAR : CBANCAR_AUX, !isEmpty(CTIPBAN) ? CTIPBAN : CTIPBAN_AUX);
						List cobradores = (List) tratarRETURNyMENSAJES(request, map_cob);
						logger.debug("Cobradores -----------------> " + map_cob);
						// request.setAttribute("cobradores", !isEmpty(cobradores)?cobradores:new
						// ArrayList());//AMA-286
						request.setAttribute("REC_IAX_COBRADORES", !isEmpty(cobradores) ? cobradores : new ArrayList());
						if (cobradores != null) {
							llenoCobrad = true;
						}
					}

					// Bug 20012/96897
					BigDecimal sperson = (BigDecimal) OB_IAX_GENPOLIZA.get("SPERTOM");
					logger.debug("-->tomador:" + sperson);
					BigDecimal cagente = (BigDecimal) OB_IAX_GENPOLIZA.get("CAGENTE");

					// Map map=new
					// PAC_IAX_PERSONA((java.sql.Connection)request.getAttribute(Constantes.DB01CONN)).ejecutaPAC_IAX_PERSONA__F_GET_CUENTASBANCARIAS(sperson,
					// usuario.getCagente());
					Map map = new PAC_IAX_PERSONA((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
							.ejecutaPAC_IAX_PERSONA__F_GET_CUENTASBANCARIAS(sperson, cagente);

					formdata.put("TOMADORCCC", map.get("PCCC"));
					logger.debug("--->PCCC:" + map.get("PCCC"));
				}

				request.setAttribute("NRECIBO", !isEmpty(NRECIBO) ? NRECIBO : null);
				request.setAttribute("OB_IAX_RECIBOS", !isEmpty(OB_IAX_RECIBOS) ? OB_IAX_RECIBOS : new HashMap());
				request.setAttribute("OB_IAX_GENPOLIZA", !isEmpty(OB_IAX_GENPOLIZA) ? OB_IAX_GENPOLIZA : new HashMap());

				if (request.getSession().getAttribute("MODIFICADO_OK") != null) {
					// Actualizo campos en formdata:
					if ((Boolean) request.getSession().getAttribute("MODIFICADO_OK") == true) {
						formdata.put("CGESCOB", OB_IAX_RECIBOS.get("CGESCOB"));
						formdata.put("CTIPBAN", OB_IAX_RECIBOS.get("CTIPBAN"));
						formdata.put("CBANCAR", OB_IAX_RECIBOS.get("CBANCAR"));
						formdata.put("CESTIMP", OB_IAX_RECIBOS.get("CESTIMP"));
						// AAC_INI-CONF_OUTSOURCING-20160906
						formdata.put("CGESCAR", OB_IAX_RECIBOS.get("CGESCAR"));
						// AAC_FI-CONF_OUTSOURCING-20160906
					}
				}

				Map map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(800086));
				List preconocida = (List) tratarRETURNyMENSAJES(request, map);
				logger.debug("Preconocida -----------------> " + map);
				request.setAttribute("preconocida", !isEmpty(preconocida) ? preconocida : new ArrayList());

				map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(800089));
				List retenida = (List) tratarRETURNyMENSAJES(request, map);
				logger.debug("Retenida -----------------> " + map);
				request.setAttribute("retenida", !isEmpty(retenida) ? retenida : new ArrayList());

				Map map_repag = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_RECIBO_PAGMANUAL();
				List T_IAX_TIPOPAGO = (List) tratarRETURNyMENSAJES(request, map_repag);
				logger.debug(T_IAX_TIPOPAGO);
				request.setAttribute("T_IAX_TIPOPAGO", T_IAX_TIPOPAGO);

				if (!llenoCobrad) {
					BigDecimal CEMPRES = ((!isEmpty(OB_IAX_RECIBOS) && !isEmpty(OB_IAX_RECIBOS.get("CEMPRES")))
							? (BigDecimal) OB_IAX_RECIBOS.get("CEMPRES")
							: null);
					Map map3 = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTCOBRADORES(CEMPRES);
					List T_IAX_COBRADORES = (List) tratarRETURNyMENSAJES(request, map3);
					logger.debug(T_IAX_COBRADORES);

					// Lo guardamos en sesi�n para no perder nunca sus valores
					request.setAttribute("REC_IAX_COBRADORES", !isEmpty(T_IAX_COBRADORES) ? T_IAX_COBRADORES : null);
				}
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm018Service - m�todo m_form", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	/**
	 * M�todo que realiza el cobro del recibo
	 * 
	 * @param request
	 */
	public void m_aceptar(HttpServletRequest request) {
		logger.debug("Axisadm018Service m_aceptar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {
			////////// AVISOS//////////
			HashMap m = this.f_Get_Avisos(request, this.whoami(this));
			BigDecimal pRETURN = (BigDecimal) this.tratarRETURNyMENSAJES(request, m);
			request.setAttribute("PLSTAVISOS", m.get("PLSTAVISOS"));

			if (pRETURN != null && pRETURN.intValue() != 1) {
				////////// AVISOS//////////
				BigDecimal NRECIBO = getCampoNumerico(request, "NRECIBO");
				BigDecimal GESCOB = getCampoNumerico(request, "GESCOB");
				BigDecimal TESTIMP = getCampoNumerico(request, "TESTIMP");
				TESTIMP = !isEmpty(TESTIMP) ? TESTIMP : getCampoNumerico(request, "CESTIMP");
				BigDecimal CTIPBAN = getCampoNumerico(request, "CTIPBAN");
				String CBANCAR = (getCampoTextual(request, "CBANCAR") == null) ? getCampoTextual(request, "CBANCARCOL")
						: getCampoTextual(request, "CBANCAR");
				CBANCAR = ((!isEmpty(CBANCAR)) ? CBANCAR.replaceAll("-", "") : null);
				//
				BigDecimal CACCPRE = getCampoNumerico(request, "CACCPRE");
				BigDecimal CACCRET = getCampoNumerico(request, "CACCRET");
				String TOBSERV = getCampoTextual(request, "TOBSERV");
				// AAC_INI-CONF_OUTSOURCING-20160906
				BigDecimal CGESCAR = getCampoNumerico(request, "CGESCAR");
				// AAC_FI-CONF_OUTSOURCING-20160906

				BigDecimal SEL_COBRADOR = getCampoNumerico(request, "SEL_COBRADOR");
				SEL_COBRADOR = !isEmpty(SEL_COBRADOR) ? SEL_COBRADOR : getCampoNumerico(request, "CTIPCOB");

				if (!isEmpty(CBANCAR)) {
					String[] CBANCAR_S = CBANCAR.split("#");
					CBANCAR = CBANCAR_S[0];
					// INI JMT: BUG AGM-32 28/06/2016
					CTIPBAN = new BigDecimal(CBANCAR_S[1]);
					logger.debug("PRU CTIPBAN ---------------------------> " + CTIPBAN);
					// FIN JMT
					logger.debug("PRU CBANCAR ---------------------------> " + CBANCAR);
				}

				BigDecimal CCOBBAN = getCampoNumerico(request, "CCOBBAN");

				// bug 20761
				BigDecimal NCUOTAR = getCampoNumerico(request, "NCUOTAR");

				PAC_IAX_GESTION_REC pac_iax_gestion_rec = new PAC_IAX_GESTION_REC(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
				PAC_IAX_PERSONA pac_iax_persona = new PAC_IAX_PERSONA(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

				// Per guardar els seleccionats
				request.setAttribute("selected_TESTIMP", TESTIMP);
				request.setAttribute("selected_GESCOB", GESCOB);
				request.setAttribute("selected_CTIPBAN", CTIPBAN);

				// Valido Cuenta corriente
				BigDecimal returnValidaCCC = BigDecimal.ONE;

				if (!isEmpty(CBANCAR) && !isEmpty(CTIPBAN) && SEL_COBRADOR.intValue() == 2) {
					Map map1 = pac_iax_persona.ejecutaPAC_IAX_PERSONA__F_VALIDACCC(CTIPBAN, CBANCAR);
					returnValidaCCC = (BigDecimal) tratarRETURNyMENSAJES(request, map1);
				} else {
					returnValidaCCC = new BigDecimal(0);
				}

				if (isEmpty(CBANCAR) || BigDecimal.ZERO.equals(returnValidaCCC)) {
					// Modifico el recibo
					// bug 20761 ncuotar
					// AAC_INI-CONF_OUTSOURCING-20160906
					Map map3 = pac_iax_gestion_rec.ejecutaPAC_IAX_GESTION_REC__F_MODIFICA_RECIBO(NRECIBO, CTIPBAN,
							CBANCAR, GESCOB, TESTIMP, CCOBBAN, NCUOTAR, CACCPRE, CACCRET, TOBSERV, SEL_COBRADOR,
							CGESCAR);
					// AAC_FI-CONF_OUTSOURCING-20160906
					BigDecimal returnModificaCobro = (BigDecimal) tratarRETURNyMENSAJES(request, map3);
					logger.debug(returnModificaCobro);

					if (BigDecimal.ZERO.equals(returnModificaCobro)) {
						List T_IAX_MODIFICADO = new ArrayList();
						Map OB_IAX_MODIFICADO = new HashMap();
						String TPRODUC = getCampoTextual(request, "TPRODUC");
						BigDecimal NPOLIZA = getCampoNumerico(request, "NPOLIZA");
						String TAGENTE = getCampoTextual(request, "TAGENTE");
						BigDecimal ICOMISI = getCampoNumerico(request, "ICOMISI");
						BigDecimal IMPORTE = getCampoNumerico(request, "IMPORTE");
						BigDecimal IIMP_1 = getCampoNumerico(request, "IIMP_1");
						BigDecimal IIMP_2 = getCampoNumerico(request, "IIMP_2");
						BigDecimal IIMP_3 = getCampoNumerico(request, "IIMP_3");
						BigDecimal IIMP_4 = getCampoNumerico(request, "IIMP_4");

						OB_IAX_MODIFICADO.put("NRECIBO", NRECIBO);
						OB_IAX_MODIFICADO.put("TPRODUC", TPRODUC);
						OB_IAX_MODIFICADO.put("NPOLIZA", NPOLIZA);
						OB_IAX_MODIFICADO.put("TAGENTE", TAGENTE);
						OB_IAX_MODIFICADO.put("ICOMISI", ICOMISI);
						OB_IAX_MODIFICADO.put("IMPORTE", IMPORTE);
						OB_IAX_MODIFICADO.put("IIMP_1", IIMP_1);
						OB_IAX_MODIFICADO.put("IIMP_2", IIMP_2);
						OB_IAX_MODIFICADO.put("IIMP_3", IIMP_3);
						OB_IAX_MODIFICADO.put("IIMP_4", IIMP_4);

						T_IAX_MODIFICADO.add(OB_IAX_MODIFICADO);

						logger.debug(OB_IAX_MODIFICADO);

						request.setAttribute("T_IAX_MODIFICADO",
								!isEmpty(T_IAX_MODIFICADO) ? T_IAX_MODIFICADO : new ArrayList());
						// Para evitar repetir el proceso de modificaci�n, en pantalla, con la misma
						// p�liza
						request.setAttribute("MODIFICADO", true);
						request.getSession().setAttribute("MODIFICADO_OK", true);
					} else {

						request.getSession().setAttribute("MODIFICADO_OK", false);
					}
				} else {
					request.getSession().setAttribute("MODIFICADO_OK", false);
				}
			}
		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm018Service - m�todo m_aceptar", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	/**
	 * M�todo que comprueba si un recibo ha sido modificado
	 * 
	 * @param request
	 * @param NRECIBO
	 * @return
	 * @throws Exception
	 */
	private boolean estaReciboModificado(HttpServletRequest request) throws Exception {
		boolean estaModificado = true;

		if (!isEmpty(request) && isEmpty(request.getAttribute("MODIFICADO")))
			estaModificado = false;

		return estaModificado;
	}

	/**
	 * Carga las cuentas del tomador y las devuelve en modo Ajax.
	 * 
	 * @param request
	 */
	public void m_ajax_cargar_cuentas_tomador(HttpServletRequest request) {
		logger.debug("Axisadm018Service m_ajax_cargar_cuentas_tomador");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();
		try {

			BigDecimal sperson = getCampoNumerico(request, "SPERSON");
			Map map = new PAC_IAX_PERSONA((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_PERSONA__F_GET_CUENTASBANCARIAS(sperson, usuario.getCagente());

			logger.debug("----> cuentas:" + map);

			if (!isEmpty(map)) {

				Object[] resultadoAjax = (Object[]) ajax.rellenarPlAContenedorAjax(map, new String[] { "PCCC" });

				if (resultadoAjax[0].equals(new BigDecimal(0))) {
					Map PCCC = new HashMap();
					PCCC.put("PCCC", resultadoAjax[1]);
					List RESULTADO = new ArrayList();
					RESULTADO.add(PCCC);

					ajax.guardarContenidoFinalAContenedorAjax(RESULTADO);
				}

			}
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr004Service - m�todo m_ajax_cargar_cuentas_tomador", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	public void m_ajax_cargar_cobradores(HttpServletRequest request) {
		logger.debug("Axisadm018Service m_ajax_cargar_cobradores");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();
		try {

			String CBANCAR = getCampoTextual(request, "CBANCAR");
			BigDecimal CTIPBAN = getCampoNumerico(request, "CTIPBAN");
			BigDecimal SPRODUC = getCampoNumerico(request, "SPRODUC");

			logger.debug("Cbancar ---------------> " + CBANCAR);
			logger.debug("Sproduc ---------------> " + SPRODUC);

			Map map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES__F_GET_DESCOBRADORES_RAMO(SPRODUC, CBANCAR, CTIPBAN);
			logger.debug("ejecutaPAC_IAX_PRODUCCION__F_GET_DESCOBRADORES_RAMO()" + map);
			if (!isEmpty(map)) {
				List Cobradores = (List) ajax.rellenarPlAContenedorAjax(map);

				ajax.guardarContenidoFinalAContenedorAjax(Cobradores);
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm018Service - m�todo m_ajax_cargar_cobradores", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

}
