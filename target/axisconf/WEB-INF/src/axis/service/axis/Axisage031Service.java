//Revision:# 2w3O4BEQ3Niqx/z9B9J87w== #
package axis.service.axis;

import java.math.BigDecimal;
import java.sql.Date;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Hashtable;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_AUTOLIQUIDA;
import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.jdbc.PAC_IAX_PERSONA;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.control.axis.Axisage031Action;
import axis.mvc.model.UsuarioBean;
import axis.util.Constantes;
import axis.util.Traductor;

public class Axisage031Service extends AxisBaseService {
	Log log = LogFactory.getLog(this.getClass());

	/*********************************************************************************************************************/
	/***********************************************
	 * M?TODOS DE INICIALIZACI?N
	 *******************************************/
	/*********************************************************************************************************************/

	public void m_init(HttpServletRequest request, Axisage031Action thisAction) {
		try {
		} catch (Exception e) {
			log.error("Error", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.formattingNumericValues(request);
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	/**
	 * Rellena la combo de estado de liquidacion y de empresa. para poder realizar
	 * una b?squeda nueva.
	 * 
	 * @param request    El HttpServletRequest que contiene la petici?n del cliente
	 *                   web.
	 * @param thisAction Una Action abstracta desde donde se ha invocado el servicio
	 *                   (necesaria para el log).
	 */
	public void m_form(HttpServletRequest request, Axisage031Action thisAction) {

		log.debug("Axisage031Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {

			request.getSession().removeAttribute("axisage_tagente");
			request.getSession().removeAttribute("CTOMADOR");
			request.getSession().removeAttribute("TTOMADOR");

			PAC_IAX_LISTVALORES pac_iax_listvalores = new PAC_IAX_LISTVALORES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			Map estado_liquida = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(32001));
			Map list_empresas = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTEMPRESAS();
			logger.debug("estado_de_liquidacion: " + estado_liquida);
			logger.debug("lista_de_empresas: " + list_empresas);
			List estadoLiquida = (List) tratarRETURNyMENSAJES(request, estado_liquida);
			request.getSession().setAttribute("ESTADO_LIQUIDA", estadoLiquida);
			List listEmpresas = (List) tratarRETURNyMENSAJES(request, list_empresas);
			request.getSession().setAttribute("LIST_EMPRESAS", listEmpresas);
		} catch (Exception e) {
			log.error("Error", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.formattingNumericValues(request);
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	/*********************************************************************************************************************/
	/************************************************
	 * M?TODOS DE ACTUALIZACI?N
	 *******************************************/
	/*********************************************************************************************************************/

	/**
	 * Dado un como minimo un parametro de entrada, ejecuta la consulta de b?squeda
	 * de Autoliquidaciones, y devuelve el resultado en el atributo de sesi?n
	 * liquida_cabecera, lista_liquida_documentos, lista_liquida_recibos y
	 * lista_liquida_apuntes. Dependiendo del estado de la liquidacion la pantalla
	 * entra en modo MODIFICACION o CONSULTA. Tambien calcula los totales
	 * dependiendo de los registros obtenidos en las listas.
	 * 
	 * @param request    El HttpServletRequest que contiene la petici?n del cliente
	 *                   web.
	 * @param thisAction Una Action abstracta desde donde se ha invocado el servicio
	 *                   (necesaria para el log).
	 */
	public void m_cargar(HttpServletRequest request, Axisage031Action thisAction) {

		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);

		try {

			if (formdata.get("paginar") == null) {
				// Recuperar datos a buscar
				BigDecimal NLIQMEN = getCampoNumerico(request, "NLIQMEN_aux");
				BigDecimal SPROLIQ = getCampoNumerico(request, "SPROLIQ_aux");
				BigDecimal CESTAUTO = getCampoNumerico(request, "CESTAUTO_aux");
				BigDecimal CAGENTE = getCampoNumerico(request, "CAGENTE_aux");
				BigDecimal CEMPRES = getCampoNumerico(request, "CEMPRES_aux");
				request.getSession().setAttribute("CEMPRESSEL", CEMPRES);

				if (CESTAUTO.intValue() == 1) {
					formdata.put("MODO", "MODIFICACION");
					request.getSession().setAttribute("CMODO", "MODIFICACION");
					AbstractDispatchAction.topPila(request, "CMODO", "MODIFICACION");
				} else {
					formdata.put("MODO", "CONSULTA");
					request.getSession().setAttribute("CMODO", "CONSULTA");
					AbstractDispatchAction.topPila(request, "CMODO", "CONSULTA");
				}

				PAC_IAX_AUTOLIQUIDA pacIaxAutoliquida = new PAC_IAX_AUTOLIQUIDA(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

				Map liquidacionMap = pacIaxAutoliquida.ejecutaPAC_IAX_AUTOLIQUIDA__F_GET_AUTOLIQUIDACION(SPROLIQ,
						CEMPRES, CAGENTE);
				log.debug("Cargar_liquidacion:" + liquidacionMap);

				if (((BigDecimal) tratarRETURNyMENSAJES(request, liquidacionMap)).intValue() == 0) {
					List PCURCAB = (List) liquidacionMap.get("PCURCAB");
					List PCURCOB = (List) liquidacionMap.get("PCURDOCCOB");
					List PCURREC = (List) liquidacionMap.get("PCURRECPEN");
					List PCURAPUN = (List) liquidacionMap.get("PCURAPUNT");
					BigDecimal total_documentos = new BigDecimal(0);
					BigDecimal total_recibos_01 = new BigDecimal(0);
					BigDecimal total_recibos_02 = new BigDecimal(0);
					BigDecimal total_recibos_03 = new BigDecimal(0);
					BigDecimal total_recibos_04 = new BigDecimal(0);
					BigDecimal total_recibos_05 = new BigDecimal(0);
					BigDecimal total_recibos_06 = new BigDecimal(0);
					BigDecimal total_recibos_07 = new BigDecimal(0);
					BigDecimal total_apuntes = new BigDecimal(0);
					BigDecimal total_difglobal = new BigDecimal(0);
					BigDecimal NCH_S = new BigDecimal(1);

					Map cabecera = null;
					if (!isEmpty(PCURCAB)) {
						cabecera = (Map) PCURCAB.get(0);
						if (!isEmpty(((Map) PCURCAB.get(0)).get("IDIFGLOBAL"))) {
							total_difglobal = total_difglobal
									.add((BigDecimal) ((Map) PCURCAB.get(0)).get("IDIFGLOBAL"));
						}
						request.getSession().setAttribute("total_difglobal", total_difglobal);
					}

					if (PCURCOB != null) {
						for (int i = 0; i < PCURCOB.size(); i++) {
							total_documentos = total_documentos.add((BigDecimal) ((Map) PCURCOB.get(i)).get("IMPORTE"));
						}
						request.getSession().setAttribute("total_documentos",
								total_documentos.setScale(2, BigDecimal.ROUND_HALF_UP));
					}

					if (PCURREC != null) {
						for (int i = 0; i < PCURREC.size(); i++) {
							if (((Map) PCURREC.get(i)).get("CH").equals(NCH_S)) {
								total_recibos_01 = total_recibos_01
										.add((BigDecimal) ((Map) PCURREC.get(i)).get("ITOTALR"));

								if (((Map) PCURREC.get(i)).get("PL").equals(NCH_S)) {
									total_recibos_02 = total_recibos_02
											.add((BigDecimal) ((Map) PCURREC.get(i)).get("COMISION"));
									total_recibos_03 = total_recibos_03
											.add((BigDecimal) ((Map) PCURREC.get(i)).get("IRPF"));
									total_recibos_04 = total_recibos_04
											.add((BigDecimal) ((Map) PCURREC.get(i)).get("LIQUIDO"));
									total_recibos_06 = total_recibos_06
											.add((BigDecimal) ((Map) PCURREC.get(i)).get("LIQUIDO"));
								} else {
									total_recibos_06 = total_recibos_06
											.add((BigDecimal) ((Map) PCURREC.get(i)).get("ITOTALR"));
								}
								BigDecimal total_recibos_validate = (BigDecimal) ((Map) PCURREC.get(i)).get("DIF");
								if (total_recibos_validate.intValue() >= 0) {
									total_recibos_05 = total_recibos_05
											.add((BigDecimal) ((Map) PCURREC.get(i)).get("DIF"));
								}
								total_recibos_07 = total_recibos_07
										.add((BigDecimal) ((Map) PCURREC.get(i)).get("DIFPYG"));
								total_recibos_06 = total_recibos_06
										.add((BigDecimal) ((Map) PCURREC.get(i)).get("DIFPYG"))
										.add((BigDecimal) ((Map) PCURREC.get(i)).get("DIF"));
							}
						}
						request.getSession().setAttribute("total_recibos_01", total_recibos_01);
						request.getSession().setAttribute("total_recibos_02", total_recibos_02);
						request.getSession().setAttribute("total_recibos_03", total_recibos_03);
						request.getSession().setAttribute("total_recibos_04", total_recibos_04);
						request.getSession().setAttribute("total_recibos_05", total_recibos_05);
						request.getSession().setAttribute("total_recibos_07", total_recibos_07);
						request.getSession().setAttribute("total_recibos_06", total_recibos_06);

					}

					if (PCURAPUN != null) {
						for (int i = 0; i < PCURAPUN.size(); i++) {
							if (((Map) PCURAPUN.get(i)).get("CH").equals(NCH_S)) {

								if ((BigDecimal) ((Map) PCURAPUN.get(i)).get("DEBE") != null) {

									total_apuntes = total_apuntes
											.subtract((BigDecimal) ((Map) PCURAPUN.get(i)).get("DEBE"));

								} else if ((BigDecimal) ((Map) PCURAPUN.get(i)).get("HABER") != null) {

									total_apuntes = total_apuntes
											.add((BigDecimal) ((Map) PCURAPUN.get(i)).get("HABER"));

								}
							}
						}
						request.getSession().setAttribute("total_apuntes", total_apuntes);
					}

					request.getSession().setAttribute("total_dif_dg",
							total_documentos.subtract(total_recibos_06).subtract(total_apuntes));

					request.getSession().setAttribute("liquida_cabecera", cabecera);
					request.getSession().setAttribute("lista_liquida_documentos", PCURCOB);
					request.getSession().setAttribute("lista_liquida_recibos", PCURREC);
					request.getSession().setAttribute("lista_liquida_apuntes", PCURAPUN);
				}
			}
		} catch (Exception e) {
			log.error("Error", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.formattingNumericValues(request);
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	/**
	 * Se llama al pulsar al boton de nueva autoliquidacion. Para inicializar las
	 * listas y los totales, para el modo ALTA.
	 * 
	 * @param request    El HttpServletRequest que contiene la petici?n del cliente
	 *                   web.
	 * @param thisAction Una Action abstracta desde donde se ha invocado el servicio
	 *                   (necesaria para el log).
	 */
	public void m_cargar_alta(HttpServletRequest request, Axisage031Action thisAction) {

		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);

		try {

			if (formdata.get("paginar") == null) {

				formdata.put("MODO", "ALTA");
				request.getSession().setAttribute("CMODO", "ALTA");
				AbstractDispatchAction.topPila(request, "CMODO", "ALTA");
				AbstractDispatchAction.topPila(request, "SSEGURO", new BigDecimal(0));

				request.getSession().setAttribute("CEMPRESSEL", usuario.getCempres());
				Map LISTCAB = new HashMap();
				LISTCAB.put("FLIQUID", new java.util.Date());
				LISTCAB.put("CUSUARI", usuario.getCusuari());
				request.getSession().setAttribute("liquida_cabecera", LISTCAB);
				request.getSession().setAttribute("lista_liquida_documentos", new ArrayList<Map>());
				request.getSession().setAttribute("lista_liquida_recibos", new ArrayList<Map>());
				request.getSession().setAttribute("lista_liquida_apuntes", new ArrayList<Map>());

				BigDecimal bd = new BigDecimal(0);
				bd = bd.setScale(2, BigDecimal.ROUND_HALF_UP);
				request.getSession().setAttribute("total_recibos_01", bd);
				request.getSession().setAttribute("total_recibos_02", bd);
				request.getSession().setAttribute("total_recibos_03", bd);
				request.getSession().setAttribute("total_recibos_04", bd);
				request.getSession().setAttribute("total_recibos_05", bd);
				request.getSession().setAttribute("total_recibos_06", bd);
				request.getSession().setAttribute("total_recibos_07", bd);
				request.getSession().setAttribute("total_documentos", bd);
				request.getSession().setAttribute("total_apuntes", bd);
				request.getSession().setAttribute("total_dif_dg", bd);
				request.getSession().setAttribute("total_difglobal", bd);
			}

		} catch (Exception e) {
			log.error("Error", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.formattingNumericValues(request);
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	/**
	 * Se llama al pulsar al boton de nueva autoliquidacion. Para inicializar las
	 * listas y los totales, para el modo ALTA.
	 * 
	 * @param request    El HttpServletRequest que contiene la petici?n del cliente
	 *                   web.
	 * @param thisAction Una Action abstracta desde donde se ha invocado el servicio
	 *                   (necesaria para el log).
	 */
	public void recargar(HttpServletRequest request, Axisage031Action thisAction, BigDecimal PSPROLIQ,
			BigDecimal CEMPRES, BigDecimal CAGENTE, BigDecimal CESTADO) {

		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		request.getSession().setAttribute("CEMPRESSEL", CEMPRES);

		if (CESTADO == null || CESTADO.intValue() == 1) {
			formdata.put("MODO", "MODIFICACION");
			request.getSession().setAttribute("CMODO", "MODIFICACION");
			AbstractDispatchAction.topPila(request, "CMODO", "MODIFICACION");
			// AbstractDispatchAction.topPila(request, "SPRODUC", new BigDecimal(0));

		} else {
			formdata.put("MODO", "CONSULTA");
			request.getSession().setAttribute("CMODO", "CONSULTA");
			AbstractDispatchAction.topPila(request, "CMODO", "CONSULTA");
			// AbstractDispatchAction.topPila(request, "SPRODUC", new BigDecimal(0));
		}

		try {

			PAC_IAX_AUTOLIQUIDA pacIaxAutoliquida = new PAC_IAX_AUTOLIQUIDA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			Map liquidacionMap = pacIaxAutoliquida.ejecutaPAC_IAX_AUTOLIQUIDA__F_GET_AUTOLIQUIDACION(PSPROLIQ, CEMPRES,
					CAGENTE);

			log.debug("Cargar_liquidacion:" + liquidacionMap);

			if (((BigDecimal) tratarRETURNyMENSAJES(request, liquidacionMap)).intValue() == 0) {
				List PCURCAB = (List) liquidacionMap.get("PCURCAB");
				List PCURCOB = (List) liquidacionMap.get("PCURDOCCOB");
				List PCURREC = (List) liquidacionMap.get("PCURRECPEN");
				List PCURAPUN = (List) liquidacionMap.get("PCURAPUNT");
				BigDecimal total_documentos = new BigDecimal(0);
				BigDecimal total_recibos_01 = new BigDecimal(0);
				BigDecimal total_recibos_02 = new BigDecimal(0);
				BigDecimal total_recibos_03 = new BigDecimal(0);
				BigDecimal total_recibos_04 = new BigDecimal(0);
				BigDecimal total_recibos_05 = new BigDecimal(0);
				BigDecimal total_recibos_06 = new BigDecimal(0);
				BigDecimal total_recibos_07 = new BigDecimal(0);
				BigDecimal total_apuntes = new BigDecimal(0);
				BigDecimal total_difglobal = new BigDecimal(0);
				BigDecimal NCH_S = new BigDecimal(1);

				Map cabecera = null;
				if (!isEmpty(PCURCAB)) {
					cabecera = (Map) PCURCAB.get(0);
					if (!isEmpty(((Map) PCURCAB.get(0)).get("IDIFGLOBAL"))) {
						total_difglobal = total_difglobal.add((BigDecimal) ((Map) PCURCAB.get(0)).get("IDIFGLOBAL"));
					}
					request.getSession().setAttribute("total_difglobal", total_difglobal);
				}

				if (PCURCOB != null) {
					for (int i = 0; i < PCURCOB.size(); i++) {
						total_documentos = total_documentos.add((BigDecimal) ((Map) PCURCOB.get(i)).get("IMPORTE"));
					}
					request.getSession().setAttribute("total_documentos", total_documentos);
				}

				if (PCURREC != null) {
					for (int i = 0; i < PCURREC.size(); i++) {
						if (((Map) PCURREC.get(i)).get("CH").equals(NCH_S)) {
							total_recibos_01 = total_recibos_01.add((BigDecimal) ((Map) PCURREC.get(i)).get("ITOTALR"));

							if (((Map) PCURREC.get(i)).get("PL").equals(NCH_S)) {
								total_recibos_02 = total_recibos_02
										.add((BigDecimal) ((Map) PCURREC.get(i)).get("COMISION"));
								total_recibos_03 = total_recibos_03
										.add((BigDecimal) ((Map) PCURREC.get(i)).get("IRPF"));
								total_recibos_04 = total_recibos_04
										.add((BigDecimal) ((Map) PCURREC.get(i)).get("LIQUIDO"));
								total_recibos_06 = total_recibos_06
										.add((BigDecimal) ((Map) PCURREC.get(i)).get("LIQUIDO"));
							} else {
								total_recibos_06 = total_recibos_06
										.add((BigDecimal) ((Map) PCURREC.get(i)).get("ITOTALR"));
							}
							total_recibos_05 = total_recibos_05.add((BigDecimal) ((Map) PCURREC.get(i)).get("DIF"));
							total_recibos_07 = total_recibos_07.add((BigDecimal) ((Map) PCURREC.get(i)).get("DIFPYG"));
							total_recibos_06 = total_recibos_06.add((BigDecimal) ((Map) PCURREC.get(i)).get("DIFPYG"))
									.add((BigDecimal) ((Map) PCURREC.get(i)).get("DIF"));
						}
					}
					request.getSession().setAttribute("total_recibos_01", total_recibos_01);
					request.getSession().setAttribute("total_recibos_02", total_recibos_02);
					request.getSession().setAttribute("total_recibos_03", total_recibos_03);
					request.getSession().setAttribute("total_recibos_04", total_recibos_04);
					request.getSession().setAttribute("total_recibos_05", total_recibos_05);
					request.getSession().setAttribute("total_recibos_06", total_recibos_06);
					request.getSession().setAttribute("total_recibos_07", total_recibos_07);

				}

				if (PCURAPUN != null) {
					for (int i = 0; i < PCURAPUN.size(); i++) {
						if (((Map) PCURAPUN.get(i)).get("CH").equals(NCH_S)) {

							if ((BigDecimal) ((Map) PCURAPUN.get(i)).get("DEBE") != null) {

								total_apuntes = total_apuntes
										.subtract((BigDecimal) ((Map) PCURAPUN.get(i)).get("DEBE"));

							} else if ((BigDecimal) ((Map) PCURAPUN.get(i)).get("HABER") != null) {

								total_apuntes = total_apuntes.add((BigDecimal) ((Map) PCURAPUN.get(i)).get("HABER"));

							}
						}
					}
					request.getSession().setAttribute("total_apuntes", total_apuntes);
				}

				request.getSession().setAttribute("total_dif_dg",
						total_documentos.subtract(total_recibos_06).subtract(total_apuntes));

				request.getSession().setAttribute("liquida_cabecera", cabecera);
				request.getSession().setAttribute("lista_liquida_documentos", PCURCOB);
				request.getSession().setAttribute("lista_liquida_recibos", PCURREC);
				request.getSession().setAttribute("lista_liquida_apuntes", PCURAPUN);

			}

		} catch (Exception e) {
			log.error("Error", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.formattingNumericValues(request);
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}

	}

	/**
	 * Borra un documento de la lista de docuentos. Solo en sesion, no lo borra en
	 * base de datos.
	 * 
	 * @param request    El HttpServletRequest que contiene la petici?n del cliente
	 *                   web.
	 * @param thisAction Una Action abstracta desde donde se ha invocado el servicio
	 *                   (necesaria para el log).
	 */
	public void m_borrarDocumento(HttpServletRequest request, Axisage031Action thisAction) {

		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);

		try {

			if (formdata.get("paginar") == null) {

				BigDecimal NLIQLIN = getCampoNumerico(request, "NLIQLIN_aux");
				BigDecimal total_documentos = (BigDecimal) request.getSession().getAttribute("total_documentos");
				BigDecimal total_dif_dg = (BigDecimal) request.getSession().getAttribute("total_dif_dg");
				List LISTDOCU = (List) request.getSession().getAttribute("lista_liquida_documentos");
				BigDecimal importe = new BigDecimal(0);

				if (LISTDOCU != null) {
					for (int i = 0; i < LISTDOCU.size(); i++) {
						if (((Map) LISTDOCU.get(i)).get("NLIQLIN").equals(NLIQLIN)) {
							importe = ((BigDecimal) ((Map) LISTDOCU.get(i)).get("IMPORTE"));
							LISTDOCU.remove(i);
						}
					}
					request.getSession().setAttribute("lista_liquida_documentos", LISTDOCU);
					total_documentos = total_documentos.subtract(importe);
					request.getSession().setAttribute("total_dif_dg", total_dif_dg.subtract(importe));
					request.getSession().setAttribute("total_documentos", total_documentos);
				}
			}
		} catch (Exception e) {
			log.error("Error", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.formattingNumericValues(request);
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	/**
	 * Marca todos los checks de la lista de recibos y hace las sumas para los
	 * campos de totales afectados. Solo en sesion, no lo modifica en base de datos.
	 * 
	 * @param request    El HttpServletRequest que contiene la petici?n del cliente
	 *                   web.
	 * @param thisAction Una Action abstracta desde donde se ha invocado el servicio
	 *                   (necesaria para el log).
	 */
	public void m_marcar_todos(HttpServletRequest request, Axisage031Action thisAction) {

		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);

		try {

			if (formdata.get("paginar") == null) {

				BigDecimal NCH = new BigDecimal(0);
				List LISTREC = (List) request.getSession().getAttribute("lista_liquida_recibos");
				BigDecimal total_recibos_01 = (BigDecimal) request.getSession().getAttribute("total_recibos_01");
				BigDecimal total_recibos_02 = (BigDecimal) request.getSession().getAttribute("total_recibos_02");
				BigDecimal total_recibos_03 = (BigDecimal) request.getSession().getAttribute("total_recibos_03");
				BigDecimal total_recibos_04 = (BigDecimal) request.getSession().getAttribute("total_recibos_04");
				BigDecimal total_recibos_05 = (BigDecimal) request.getSession().getAttribute("total_recibos_05");
				BigDecimal total_recibos_06 = (BigDecimal) request.getSession().getAttribute("total_recibos_06");
				BigDecimal total_recibos_07 = (BigDecimal) request.getSession().getAttribute("total_recibos_07");
				BigDecimal total_documentos = (BigDecimal) request.getSession().getAttribute("total_documentos");
				BigDecimal total_apuntes = (BigDecimal) request.getSession().getAttribute("total_apuntes");
				BigDecimal total_difglobal = (BigDecimal) request.getSession().getAttribute("total_difglobal");

				if (LISTREC != null) {
					for (int i = 0; i < LISTREC.size(); i++) {
						if (((Map) LISTREC.get(i)).get("CH").equals(NCH)) {
							((Map) LISTREC.get(i)).put("CH", new BigDecimal(1));
							total_recibos_01 = total_recibos_01.add((BigDecimal) ((Map) LISTREC.get(i)).get("ITOTALR"));
							if (((Map) LISTREC.get(i)).get("PL").equals(new BigDecimal(1))) {
								total_recibos_02 = total_recibos_02
										.add((BigDecimal) ((Map) LISTREC.get(i)).get("COMISION"));
								total_recibos_03 = total_recibos_03
										.add((BigDecimal) ((Map) LISTREC.get(i)).get("IRPF"));
								total_recibos_04 = total_recibos_04
										.add((BigDecimal) ((Map) LISTREC.get(i)).get("LIQUIDO"));
								total_recibos_06 = total_recibos_06
										.add((BigDecimal) ((Map) LISTREC.get(i)).get("LIQUIDO"))
										.add((BigDecimal) ((Map) LISTREC.get(i)).get("DIF"))
										.add((BigDecimal) ((Map) LISTREC.get(i)).get("DIFPYG"));
							} else {
								if (((BigDecimal) ((Map) LISTREC.get(i)).get("DIF")).equals(BigDecimal.ZERO)) {
									total_recibos_06 = total_recibos_06
											.add((BigDecimal) ((Map) LISTREC.get(i)).get("ITOTALR"));
								} else {
									total_recibos_06 = total_recibos_06
											.add((BigDecimal) ((Map) LISTREC.get(i)).get("ITOTCARG"));
								}
							}
							total_recibos_05 = total_recibos_05.add((BigDecimal) ((Map) LISTREC.get(i)).get("DIF"));
							total_recibos_07 = total_recibos_07.add((BigDecimal) ((Map) LISTREC.get(i)).get("DIFPYG"));
						}
					}
					request.getSession().setAttribute("lista_liquida_recibos", LISTREC);
					request.getSession().setAttribute("total_recibos_01", total_recibos_01);
					request.getSession().setAttribute("total_recibos_02", total_recibos_02);
					request.getSession().setAttribute("total_recibos_03", total_recibos_03);
					request.getSession().setAttribute("total_recibos_04", total_recibos_04);
					request.getSession().setAttribute("total_recibos_05", total_recibos_05);
					request.getSession().setAttribute("total_recibos_06", total_recibos_06);
					request.getSession().setAttribute("total_recibos_07", total_recibos_07);
					request.getSession().setAttribute("total_dif_dg",
							total_documentos.subtract(total_recibos_06).subtract(total_apuntes));
				}
			}
		} catch (Exception e) {
			log.error("Error", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.formattingNumericValues(request);
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	/**
	 * Desmarca todos los checks de la lista de recibos y hace las sumas para los
	 * campos de totales afectados. Solo en sesion, no lo modifica en base de datos.
	 * 
	 * @param request    El HttpServletRequest que contiene la petici?n del cliente
	 *                   web.
	 * @param thisAction Una Action abstracta desde donde se ha invocado el servicio
	 *                   (necesaria para el log).
	 */
	public void m_desmarcar_todos(HttpServletRequest request, Axisage031Action thisAction) {

		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);

		try {

			if (formdata.get("paginar") == null) {

				BigDecimal NCH = new BigDecimal(1);
				List LISTREC = (List) request.getSession().getAttribute("lista_liquida_recibos");
				BigDecimal total_documentos = (BigDecimal) request.getSession().getAttribute("total_documentos");
				BigDecimal total_apuntes = (BigDecimal) request.getSession().getAttribute("total_apuntes");
				BigDecimal total_difglobal = (BigDecimal) request.getSession().getAttribute("total_difglobal");

				if (LISTREC != null) {
					for (int i = 0; i < LISTREC.size(); i++) {
						if (((Map) LISTREC.get(i)).get("CH").equals(NCH)) {
							((Map) LISTREC.get(i)).put("CH", new BigDecimal(0));
						}
					}
					request.getSession().setAttribute("lista_liquida_recibos", LISTREC);
					request.getSession().setAttribute("total_recibos_01", new BigDecimal(0));
					request.getSession().setAttribute("total_recibos_02", new BigDecimal(0));
					request.getSession().setAttribute("total_recibos_03", new BigDecimal(0));
					request.getSession().setAttribute("total_recibos_04", new BigDecimal(0));
					request.getSession().setAttribute("total_recibos_05", new BigDecimal(0));
					request.getSession().setAttribute("total_recibos_06", new BigDecimal(0));
					request.getSession().setAttribute("total_recibos_07", new BigDecimal(0));
					request.getSession().setAttribute("total_dif_dg", total_documentos.subtract(total_apuntes));
				}
			}
		} catch (Exception e) {
			log.error("Error", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.formattingNumericValues(request);
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	public void m_marcar_todosci(HttpServletRequest request, Axisage031Action thisAction) {

		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);

		try {

			if (formdata.get("paginar") == null) {

				BigDecimal NCH_N = new BigDecimal(0);
				BigDecimal NCH_Y = new BigDecimal(1);
				BigDecimal pincha = new BigDecimal(1);
				List LISTREC = (List) request.getSession().getAttribute("lista_liquida_recibos");
				BigDecimal total_recibos_01 = (BigDecimal) request.getSession().getAttribute("total_recibos_01");
				BigDecimal total_recibos_02 = (BigDecimal) request.getSession().getAttribute("total_recibos_02");
				BigDecimal total_recibos_03 = (BigDecimal) request.getSession().getAttribute("total_recibos_03");
				BigDecimal total_recibos_04 = (BigDecimal) request.getSession().getAttribute("total_recibos_04");
				BigDecimal total_recibos_05 = (BigDecimal) request.getSession().getAttribute("total_recibos_05");
				BigDecimal total_recibos_06 = (BigDecimal) request.getSession().getAttribute("total_recibos_06");
				BigDecimal total_recibos_07 = (BigDecimal) request.getSession().getAttribute("total_recibos_07");
				BigDecimal total_documentos = (BigDecimal) request.getSession().getAttribute("total_documentos");
				BigDecimal total_apuntes = (BigDecimal) request.getSession().getAttribute("total_apuntes");
				BigDecimal total_difglobal = (BigDecimal) request.getSession().getAttribute("total_difglobal");

				if (LISTREC != null) {
					for (int i = 0; i < LISTREC.size(); i++) {

						if (((Map) LISTREC.get(i)).get("PL").equals(NCH_N)) {

							((Map) LISTREC.get(i)).put("PL", new BigDecimal(1));
							pincha = new BigDecimal(1);
							if (((Map) LISTREC.get(i)).get("CH").equals(NCH_Y)) {
								total_recibos_02 = total_recibos_02
										.add((BigDecimal) ((Map) LISTREC.get(i)).get("COMISION"));
								total_recibos_03 = total_recibos_03
										.add((BigDecimal) ((Map) LISTREC.get(i)).get("IRPF"));
								total_recibos_04 = total_recibos_04
										.add((BigDecimal) ((Map) LISTREC.get(i)).get("LIQUIDO"));
								if (((BigDecimal) ((Map) LISTREC.get(i)).get("DIF")).equals(BigDecimal.ZERO)) {
									total_recibos_06 = total_recibos_06
											.subtract((BigDecimal) ((Map) LISTREC.get(i)).get("ITOTALR"));
								} else {
									total_recibos_06 = total_recibos_06
											.subtract((BigDecimal) ((Map) LISTREC.get(i)).get("ITOTCARG"));
								}

								total_recibos_06 = total_recibos_06
										.add((BigDecimal) ((Map) LISTREC.get(i)).get("LIQUIDO"));
							}
						}
					}
					request.getSession().setAttribute("lista_liquida_recibos", LISTREC);
					request.getSession().setAttribute("total_recibos_02", total_recibos_02);
					request.getSession().setAttribute("total_recibos_03", total_recibos_03);
					request.getSession().setAttribute("total_recibos_04", total_recibos_04);
					request.getSession().setAttribute("total_recibos_05", total_recibos_05);
					request.getSession().setAttribute("total_recibos_06", total_recibos_06);
					request.getSession().setAttribute("total_recibos_07", total_recibos_07);
					request.getSession().setAttribute("total_dif_dg",
							total_documentos.subtract(total_recibos_06).subtract(total_apuntes));

				}
			}
		} catch (Exception e) {
			log.error("Error", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.formattingNumericValues(request);
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	/**
	 * Desmarca todos los checks de la lista de recibos y hace las sumas para los
	 * campos de totales afectados. Solo en sesion, no lo modifica en base de datos.
	 * 
	 * @param request    El HttpServletRequest que contiene la petici?n del cliente
	 *                   web.
	 * @param thisAction Una Action abstracta desde donde se ha invocado el servicio
	 *                   (necesaria para el log).
	 */
	public void m_desmarcar_todosci(HttpServletRequest request, Axisage031Action thisAction) {

		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);

		try {

			if (formdata.get("paginar") == null) {

				BigDecimal NCH = new BigDecimal(1);
				BigDecimal NCH_Y = new BigDecimal(1);
				BigDecimal pincha = new BigDecimal(1);
				List LISTREC = (List) request.getSession().getAttribute("lista_liquida_recibos");
				BigDecimal total_recibos_01 = (BigDecimal) request.getSession().getAttribute("total_recibos_01");
				BigDecimal total_recibos_02 = (BigDecimal) request.getSession().getAttribute("total_recibos_02");
				BigDecimal total_recibos_03 = (BigDecimal) request.getSession().getAttribute("total_recibos_03");
				BigDecimal total_recibos_04 = (BigDecimal) request.getSession().getAttribute("total_recibos_04");
				BigDecimal total_recibos_05 = (BigDecimal) request.getSession().getAttribute("total_recibos_05");
				BigDecimal total_recibos_06 = (BigDecimal) request.getSession().getAttribute("total_recibos_06");
				BigDecimal total_recibos_07 = (BigDecimal) request.getSession().getAttribute("total_recibos_07");
				BigDecimal total_documentos = (BigDecimal) request.getSession().getAttribute("total_documentos");
				BigDecimal total_apuntes = (BigDecimal) request.getSession().getAttribute("total_apuntes");
				BigDecimal total_difglobal = (BigDecimal) request.getSession().getAttribute("total_difglobal");

				if (LISTREC != null) {
					for (int i = 0; i < LISTREC.size(); i++) {

						if (((Map) LISTREC.get(i)).get("PL").equals(NCH_Y)) {

							((Map) LISTREC.get(i)).put("PL", new BigDecimal(0));
							pincha = new BigDecimal(0);

							if (((Map) LISTREC.get(i)).get("CH").equals(NCH_Y)) {
								total_recibos_02 = total_recibos_02
										.subtract((BigDecimal) ((Map) LISTREC.get(i)).get("COMISION"));
								total_recibos_03 = total_recibos_03
										.subtract((BigDecimal) ((Map) LISTREC.get(i)).get("IRPF"));
								total_recibos_04 = total_recibos_04
										.subtract((BigDecimal) ((Map) LISTREC.get(i)).get("LIQUIDO"));
								total_recibos_06 = total_recibos_06
										.subtract((BigDecimal) ((Map) LISTREC.get(i)).get("LIQUIDO"));

								if (((BigDecimal) ((Map) LISTREC.get(i)).get("DIF")).equals(BigDecimal.ZERO)) {
									total_recibos_06 = total_recibos_06
											.add((BigDecimal) ((Map) LISTREC.get(i)).get("ITOTALR"));
								} else {
									total_recibos_06 = total_recibos_06
											.add((BigDecimal) ((Map) LISTREC.get(i)).get("ITOTCARG"));
								}

							}
						}
					}
					request.getSession().setAttribute("lista_liquida_recibos", LISTREC);
					request.getSession().setAttribute("total_recibos_02", total_recibos_02);
					request.getSession().setAttribute("total_recibos_03", total_recibos_03);
					request.getSession().setAttribute("total_recibos_04", total_recibos_04);
					request.getSession().setAttribute("total_recibos_05", total_recibos_05);
					request.getSession().setAttribute("total_recibos_06", total_recibos_06);
					request.getSession().setAttribute("total_recibos_07", total_recibos_07);
					request.getSession().setAttribute("total_dif_dg",
							total_documentos.subtract(total_recibos_06).subtract(total_apuntes));

				}
			}
		} catch (Exception e) {
			log.error("Error", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.formattingNumericValues(request);
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	/**
	 * A?ade un recibo a la lista de recibos, se a?ade si marcamos el radio de
	 * recibo, introducimos un numero de registro valido y pulsamos boton a?adir.
	 * Solo en sesion, no lo a?ade en base de datos.
	 * 
	 * @param request    El HttpServletRequest que contiene la petici?n del cliente
	 *                   web.
	 * @param thisAction Una Action abstracta desde donde se ha invocado el servicio
	 *                   (necesaria para el log).
	 */
	public void m_anadir_recibo(HttpServletRequest request, Axisage031Action thisAction) {

		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);

		try {

			if (formdata.get("paginar") == null) {

				BigDecimal total_recibos_01 = (BigDecimal) request.getSession().getAttribute("total_recibos_01");
				BigDecimal total_recibos_02 = (BigDecimal) request.getSession().getAttribute("total_recibos_02");
				BigDecimal total_recibos_03 = (BigDecimal) request.getSession().getAttribute("total_recibos_03");
				BigDecimal total_recibos_04 = (BigDecimal) request.getSession().getAttribute("total_recibos_04");
				BigDecimal total_recibos_05 = (BigDecimal) request.getSession().getAttribute("total_recibos_05");
				BigDecimal total_recibos_06 = (BigDecimal) request.getSession().getAttribute("total_recibos_06");
				BigDecimal total_recibos_07 = (BigDecimal) request.getSession().getAttribute("total_recibos_07");
				BigDecimal total_documentos = (BigDecimal) request.getSession().getAttribute("total_documentos");
				BigDecimal total_apuntes = (BigDecimal) request.getSession().getAttribute("total_apuntes");
				BigDecimal total_difglobal = (BigDecimal) request.getSession().getAttribute("total_difglobal");
				BigDecimal NREC = getCampoNumerico(request, "NREC");
				BigDecimal CAGENTE = getCampoNumerico(request, "CAGENTE_aux");
				BigDecimal TOMADOR = getCampoNumerico(request, "TOMADOR_aux");
				List LISTREC = (List) request.getSession().getAttribute("lista_liquida_recibos");
				boolean isNew = true;

				if (LISTREC != null) {

					for (int i = 0; i < LISTREC.size(); i++) {

						if (((Map) LISTREC.get(i)).get("NRECIBO") != null
								&& ((Map) LISTREC.get(i)).get("NRECIBO").equals(NREC)) {

							isNew = false;

							if (((Map) LISTREC.get(i)).get("CH").equals(new BigDecimal(0))) {

								((Map) LISTREC.get(i)).put("CH", new BigDecimal(1));
								total_recibos_01 = total_recibos_01
										.add((BigDecimal) ((Map) LISTREC.get(i)).get("ITOTALR"));

								if (((Map) LISTREC.get(i)).get("PL").equals(new BigDecimal(1))) {

									total_recibos_02 = total_recibos_02
											.add((BigDecimal) ((Map) LISTREC.get(i)).get("COMISION"));
									total_recibos_03 = total_recibos_03
											.add((BigDecimal) ((Map) LISTREC.get(i)).get("IRPF"));
									total_recibos_04 = total_recibos_04
											.add((BigDecimal) ((Map) LISTREC.get(i)).get("LIQUIDO"));
									total_recibos_05 = total_recibos_05
											.add((BigDecimal) ((Map) LISTREC.get(i)).get("DIF"));
									total_recibos_06 = total_recibos_06
											.add((BigDecimal) ((Map) LISTREC.get(i)).get("LIQUIDO"))
											.add((BigDecimal) ((Map) LISTREC.get(i)).get("DIF"))
											.add((BigDecimal) ((Map) LISTREC.get(i)).get("DIFPYG"));
									total_recibos_07 = total_recibos_07
											.add((BigDecimal) ((Map) LISTREC.get(i)).get("DIFPYG"));
								} else {
									total_recibos_06 = total_recibos_06
											.add((BigDecimal) ((Map) LISTREC.get(i)).get("ITOTALR"))
											.add((BigDecimal) ((Map) LISTREC.get(i)).get("DIFPYG"))
											.add((BigDecimal) ((Map) LISTREC.get(i)).get("DIF"));
								}
								request.getSession().setAttribute("total_recibos_01", total_recibos_01);
								request.getSession().setAttribute("total_recibos_02", total_recibos_02);
								request.getSession().setAttribute("total_recibos_03", total_recibos_03);
								request.getSession().setAttribute("total_recibos_04", total_recibos_04);
								request.getSession().setAttribute("total_recibos_05", total_recibos_05);
								request.getSession().setAttribute("total_recibos_06", total_recibos_06);
								request.getSession().setAttribute("total_recibos_07", total_recibos_07);
								request.getSession().setAttribute("total_dif_dg",
										total_documentos.subtract(total_recibos_06).subtract(total_apuntes));
							}

						}
					}

					if (isNew) {

						PAC_IAX_AUTOLIQUIDA pacIaxAutoliquida = new PAC_IAX_AUTOLIQUIDA(
								(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
						Map RecibosMap = pacIaxAutoliquida.ejecutaPAC_IAX_AUTOLIQUIDA__F_GET_RECIBO(NREC, CAGENTE,
								TOMADOR);
						log.debug("anadir_recibo:" + RecibosMap);
						tratarRETURNyMENSAJES(request, RecibosMap);

						List Recibo = (List) RecibosMap.get("PCURRECIBO");
						if (Recibo.size() != 0) {
							LISTREC.add(Recibo.get(0));
							if (((Map) Recibo.get(0)).get("CH").equals(new BigDecimal(1))) {
								total_recibos_01 = total_recibos_01
										.add((BigDecimal) ((Map) Recibo.get(0)).get("ITOTALR"));
								if (((Map) Recibo.get(0)).get("PL").equals(new BigDecimal(1))) {
									total_recibos_02 = total_recibos_02
											.add((BigDecimal) ((Map) Recibo.get(0)).get("COMISION"));
									total_recibos_03 = total_recibos_03
											.add((BigDecimal) ((Map) Recibo.get(0)).get("IRPF"));
									total_recibos_04 = total_recibos_04
											.add((BigDecimal) ((Map) Recibo.get(0)).get("LIQUIDO"));
									total_recibos_06 = total_recibos_06
											.add((BigDecimal) ((Map) Recibo.get(0)).get("LIQUIDO"))
											.add((BigDecimal) ((Map) Recibo.get(0)).get("DIF"))
											.add((BigDecimal) ((Map) Recibo.get(0)).get("DIFPYG"));
								} else {
									total_recibos_06 = total_recibos_06
											.add((BigDecimal) ((Map) Recibo.get(0)).get("ITOTALR"))
											.add((BigDecimal) ((Map) Recibo.get(0)).get("DIFPYG"))
											.add((BigDecimal) ((Map) Recibo.get(0)).get("DIF"));
								}
								total_recibos_05 = total_recibos_05.add((BigDecimal) ((Map) Recibo.get(0)).get("DIF"));
								total_recibos_07 = total_recibos_07
										.add((BigDecimal) ((Map) Recibo.get(0)).get("DIFPYG"));

								request.getSession().setAttribute("total_recibos_01", total_recibos_01);
								request.getSession().setAttribute("total_recibos_02", total_recibos_02);
								request.getSession().setAttribute("total_recibos_03", total_recibos_03);
								request.getSession().setAttribute("total_recibos_04", total_recibos_04);
								request.getSession().setAttribute("total_recibos_05", total_recibos_05);
								request.getSession().setAttribute("total_recibos_06", total_recibos_06);
								request.getSession().setAttribute("total_recibos_07", total_recibos_07);
								request.getSession().setAttribute("total_dif_dg",
										total_documentos.subtract(total_recibos_06).subtract(total_apuntes));
							}
						} else {
							String literal = Traductor.traducir(AxisBaseService.getLocale(request).toString(),
									"9901229");
							thisAction.guardarMensaje(request, "verbatim:" + literal + ": " + NREC, null,
									Constantes.MENSAJE_INFO);
						}
					}

					BigDecimal total_dif_dg = (BigDecimal) request.getSession().getAttribute("total_dif_dg");
					request.getSession().setAttribute("total_dif_dg", total_dif_dg);// .subtract(total_difglobal)
																					// eliminado
					request.getSession().setAttribute("lista_liquida_recibos", LISTREC);
				}
			}
		} catch (Exception e) {
			log.error("Error", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.formattingNumericValues(request);
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	/**
	 * Recarga la lista de apuntes y lo guarda en sesion.
	 * 
	 * @param request    El HttpServletRequest que contiene la petici?n del cliente
	 *                   web.
	 * @param thisAction Una Action abstracta desde donde se ha invocado el servicio
	 *                   (necesaria para el log).
	 */
	public void m_recargar_apuntes(HttpServletRequest request, Axisage031Action thisAction) {

		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);

		try {

			if (formdata.get("paginar") == null) {

				BigDecimal NLIQMEN = getCampoNumerico(request, "NLIQMEN_aux");
				BigDecimal CAGENTE = getCampoNumerico(request, "CAGENTE_aux");
				BigDecimal CEMPRES = getCampoNumerico(request, "CEMPRES_aux");

				if (formdata.get("paginar") == null) {

					PAC_IAX_AUTOLIQUIDA pacIaxAutoliquida = new PAC_IAX_AUTOLIQUIDA(
							(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

					Map liquidacionMap = pacIaxAutoliquida.ejecutaPAC_IAX_AUTOLIQUIDA__F_GET_CTAS(NLIQMEN, CEMPRES,
							CAGENTE);
					log.debug("Cargar_liquidacion:" + liquidacionMap);

					if (((BigDecimal) tratarRETURNyMENSAJES(request, liquidacionMap)).intValue() == 0) {

						List PCURCTAS = (List) liquidacionMap.get("PCURCTAS");
						request.getSession().setAttribute("lista_liquida_apuntes", PCURCTAS);

					}

				}
			}
		} catch (Exception e) {
			log.error("Error", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.formattingNumericValues(request);
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	/**
	 * Guardamos las listas y datos de toda la pantalla en base de datos. En modo
	 * ALTA no se guardan los apuntes.
	 * 
	 * @param request    El HttpServletRequest que contiene la petici?n del cliente
	 *                   web.
	 * @param thisAction Una Action abstracta desde donde se ha invocado el servicio
	 *                   (necesaria para el log).
	 */
	public void m_guardar(HttpServletRequest request, Axisage031Action thisAction) {

		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);

		try {

			if (formdata.get("paginar") == null) {

				BigDecimal NLIQMEN = getCampoNumerico(request, "NLIQMEN");
				BigDecimal CEMPRES = getHiddenCampoNumerico(request, "HCEMPRES");
				BigDecimal CAGENTELIQ = getCampoNumerico(request, "CAGENTE");
				BigDecimal CAGENTE = getCampoNumerico(request, "CAGENTE");
				BigDecimal CESTADO = getHiddenCampoNumerico(request, "HCESTADO");
				Date FLIQUIDA = stringToSqlDate(getCampoTextual(request, "FLIQUIDA"));
				Date FCOBRO = stringToSqlDate(getCampoTextual(request, "FCOBRO"));
				BigDecimal CTOMADOR = getCampoNumerico(request, "CTOMADOR");
				String CUSUARIO = getCampoTextual(request, "CUSUARIO");
				BigDecimal IIMPORTE = getCampoNumerico(request, "IIMPORTE");
				BigDecimal IDIFGLOBAL = getCampoNumerico(request, "IDIFGLOBAL");
				// BigDecimal total_difglobal =
				// (BigDecimal)request.getSession().getAttribute("total_difglobal");
				List LISTDOC = (List) request.getSession().getAttribute("lista_liquida_documentos");
				List LISTREC = (List) request.getSession().getAttribute("lista_liquida_recibos");
				List LISTAPU = (List) request.getSession().getAttribute("lista_liquida_apuntes");
				BigDecimal SPROLIQ = getCampoNumerico(request, "SPROLIQ");
				String modo = (String) request.getSession().getAttribute("CMODO");
				BigDecimal YCH = new BigDecimal(1);
				BigDecimal PCPROCES = null;
				BigDecimal PONLIQMEN = null;
				BigDecimal POCESTADO = null;
				BigDecimal NLIQLIN = null;
				boolean unavez = true;
				// INI BUG CONF-379 - 17/03/2016 - JAEG
				BigDecimal IMPPEND = getHiddenCampoNumerico(request, "IMPPEND");
				BigDecimal VABONO = getHiddenCampoNumerico(request, "VABONO");
				Date FABONO = stringToSqlDate(getHiddenCampoTextual(request, "FABONO"));
				BigDecimal DOCRECAUD = getHiddenCampoNumerico(request, "DOCRECAUD");
				BigDecimal CORTEPROD = getHiddenCampoNumerico(request, "CORTEPROD");
				// FIN BUG CONF-379 - 17/03/2016 - JAEG

				boolean guardado_ok = true;

				PAC_IAX_AUTOLIQUIDA pacIaxAutoliquida = new PAC_IAX_AUTOLIQUIDA(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

				Map autoliq = pacIaxAutoliquida.ejecutaPAC_IAX_AUTOLIQUIDA__F_GET_AUTOLIQUIDAAGE(SPROLIQ, CEMPRES,
						CAGENTELIQ);
				ArrayList listautoliq = (ArrayList) autoliq.get("RETURN");

				log.debug(listautoliq);

				HashMap OB_IAX_AUTOLIQUIDAAGE = new HashMap();
				if (!isEmpty(listautoliq)) {
					for (int W = 0; W < listautoliq.size(); W++) {
						if (((Map) ((Map) listautoliq.get(W)).get("OB_IAX_AUTOLIQUIDAAGE")).get("CMARCADO")
								.equals(new BigDecimal(1))) {
							log.debug("est? marcado parece:"
									+ ((Map) ((Map) listautoliq.get(W)).get("OB_IAX_AUTOLIQUIDAAGE")).get("NLIQMEN"));

							NLIQMEN = (BigDecimal) ((Map) ((Map) listautoliq.get(W)).get("OB_IAX_AUTOLIQUIDAAGE"))
									.get("NLIQMEN");
							CAGENTE = (BigDecimal) ((Map) ((Map) listautoliq.get(W)).get("OB_IAX_AUTOLIQUIDAAGE"))
									.get("CAGENTE");
							IDIFGLOBAL = (BigDecimal) ((Map) ((Map) listautoliq.get(W)).get("OB_IAX_AUTOLIQUIDAAGE"))
									.get("IDIFGLOBAL");

							Map CabMap = pacIaxAutoliquida.ejecutaPAC_IAX_AUTOLIQUIDA__F_SET_AUTOLIQUIDACAB("G",
									NLIQMEN, CEMPRES, CAGENTE, CESTADO, FLIQUIDA, FCOBRO, CTOMADOR, CUSUARIO, IIMPORTE,
									SPROLIQ, IDIFGLOBAL);
							log.debug(LISTDOC.size() + "guardar cabecera:" + CabMap);
							if (!CabMap.get("RETURN").equals(new BigDecimal(0))) {
								tratarRETURNyMENSAJES(request, CabMap);
								guardado_ok = false;
							} else {
								PCPROCES = ((BigDecimal) CabMap.get("PCPROCES"));
								PONLIQMEN = ((BigDecimal) CabMap.get("PONLIQMEN"));
							}

							if (unavez) {
								if (LISTDOC != null) {

									for (int i = 0; i < LISTDOC.size(); i++) {

										Date FDOCU = null;
										if (((Map) LISTDOC.get(i)).get("FDOCUMENTO") != null) {
											if (((Map) LISTDOC.get(i)).get("FDOCUMENTO") instanceof Date) {
												FDOCU = (Date) ((Map) LISTDOC.get(i)).get("FDOCUMENTO");
											} else {
												FDOCU = new Date(((Timestamp) ((Map) LISTDOC.get(i)).get("FDOCUMENTO"))
														.getTime());
											}
										}

										// Alberto - Borramos todos los documentos antes de insertar todos. Para ello
										// enviamos un -1 en el idcobro si es el primer registro
										// con lo que indicamos que lo que queremos es borrar los documentos
										if (i == 0) {
											Map CobrosMap = pacIaxAutoliquida.ejecutaPAC_IAX_AUTOLIQUIDA__F_SET_COBROS(
													new BigDecimal(9999), CAGENTE, CEMPRES, SPROLIQ,
													((BigDecimal) ((Map) LISTDOC.get(i)).get("CCOBRO")),
													((String) ((Map) LISTDOC.get(i)).get("DOCUMENTO")), FDOCU,
													((BigDecimal) ((Map) LISTDOC.get(i)).get("BANCO")),
													((BigDecimal) ((Map) LISTDOC.get(i)).get("IMPORTE")),
													((String) ((Map) LISTDOC.get(i)).get("OBSERVACIONES")));
										}

										Map CobrosMap = pacIaxAutoliquida.ejecutaPAC_IAX_AUTOLIQUIDA__F_SET_COBROS(
												new BigDecimal(i + 1), CAGENTE, CEMPRES, SPROLIQ,
												((BigDecimal) ((Map) LISTDOC.get(i)).get("CCOBRO")),
												((String) ((Map) LISTDOC.get(i)).get("DOCUMENTO")), FDOCU,
												((BigDecimal) ((Map) LISTDOC.get(i)).get("BANCO")),
												((BigDecimal) ((Map) LISTDOC.get(i)).get("IMPORTE")),
												((String) ((Map) LISTDOC.get(i)).get("OBSERVACIONES")));
										log.debug("guardar documentos:" + CobrosMap);

										if (!CobrosMap.get("RETURN").equals(new BigDecimal(0))) {
											tratarRETURNyMENSAJES(request, CobrosMap);
											guardado_ok = false;
										}

									}
								}
								unavez = false;
							}

							if (LISTREC != null) {
								// Borramos todos los recibos de la liquidacion JMT - PRBMANT-117 - 07/10/2016
								pacIaxAutoliquida.ejecutaPAC_IAX_AUTOLIQUIDA__F_DEL_RECIBOS(NLIQMEN, CEMPRES, CAGENTE); // JMT
																														// -
																														// PRBMANT-117
																														// -
																														// 07/10/2016
								for (int i = 0; i < LISTREC.size(); i++) {
									if (((Map) LISTREC.get(i)).get("CH").equals(YCH)) {
										if (((BigDecimal) ((Map) LISTREC.get(i)).get("CAGENTE")).equals(CAGENTE)) {
											Date FEFEC = null;
											if (((Map) LISTREC.get(i)).get("FEFECTO") instanceof Date) {
												FEFEC = (Date) ((Map) LISTREC.get(i)).get("FEFECTO");
											} else {
												FEFEC = new Date(
														((Timestamp) ((Map) LISTREC.get(i)).get("FEFECTO")).getTime());
											}

											if (!isEmpty((((Map) LISTREC.get(i)).get("NLIQLIN")))
													&& !(((Map) LISTREC.get(i)).get("NLIQLIN")).equals("null"))
												NLIQLIN = ((BigDecimal) ((Map) LISTREC.get(i)).get("NLIQLIN"));
											else
												NLIQLIN = new BigDecimal(0);

											FEFEC = FLIQUIDA;

											Map RecibosMap = pacIaxAutoliquida
													.ejecutaPAC_IAX_AUTOLIQUIDA__F_SET_RECIBOS("G", NLIQMEN, CEMPRES,
															CAGENTE, NLIQLIN,
															((BigDecimal) ((Map) LISTREC.get(i)).get("NRECIBO")),
															((BigDecimal) ((Map) LISTREC.get(i)).get("CTIPREC")),
															((BigDecimal) ((Map) LISTREC.get(i)).get("FRA")), FEFEC,
															((BigDecimal) ((Map) LISTREC.get(i)).get("ITOTALR")),
															((BigDecimal) ((Map) LISTREC.get(i)).get("COMISION")),
															((BigDecimal) ((Map) LISTREC.get(i)).get("IRPF")),
															((BigDecimal) ((Map) LISTREC.get(i)).get("DIF")), SPROLIQ,
															((BigDecimal) ((Map) LISTREC.get(i)).get("PL")),
															((BigDecimal) ((Map) LISTREC.get(i)).get("DIFPYG")),
															IMPPEND, VABONO, FABONO, DOCRECAUD, CORTEPROD);
											log.debug("guardar recibos:" + RecibosMap);

											if (!RecibosMap.get("RETURN").equals(new BigDecimal(0))) {
												tratarRETURNyMENSAJES(request, RecibosMap);
												guardado_ok = false;
											}
										}
									}
								}
							}

							if (LISTAPU != null) {
								for (int i = 0; i < LISTAPU.size(); i++) {
									if (((Map) LISTAPU.get(i)).get("CH").equals(YCH)) {
										if (((BigDecimal) ((Map) LISTAPU.get(i)).get("CAGENTE")).equals(CAGENTE)) {
											Map CtasMap = pacIaxAutoliquida.ejecutaPAC_IAX_AUTOLIQUIDA__F_SET_CTAS("G",
													CAGENTE, CEMPRES,
													((BigDecimal) ((Map) LISTAPU.get(i)).get("NNUMLIN")), SPROLIQ);
											log.debug("guardar apuntes:" + CtasMap);

											if (!CtasMap.get("RETURN").equals(new BigDecimal(0))) {
												tratarRETURNyMENSAJES(request, CtasMap);
												guardado_ok = false;
											}
										}
									}
								}
							}

							if (guardado_ok) {

								Map ResultMap = pacIaxAutoliquida.ejecutaPAC_IAX_AUTOLIQUIDA__F_SET_AUTOLIQUIDACION("G",
										NLIQMEN, CEMPRES, CAGENTE, SPROLIQ);
								log.debug("set_autoliquidacion:" + ResultMap);

								if (!ResultMap.get("RETURN").equals(new BigDecimal(0))) {
									tratarRETURNyMENSAJES(request, ResultMap);
									guardado_ok = false;
								} else {
									POCESTADO = ((BigDecimal) ResultMap.get("POCESTADO"));
								}
							}

						}

					}

					if (guardado_ok && !unavez) {

						recargar(request, thisAction, SPROLIQ, CEMPRES, CAGENTELIQ, POCESTADO);

						String literal = Traductor.traducir(AxisBaseService.getLocale(request).toString(), "111313");
						thisAction.guardarMensaje(request, "verbatim:" + literal + ": " + SPROLIQ, null,
								Constantes.MENSAJE_INFO);
					}

				}

				if (unavez)
				// no hay liquidaage seleccionado
				{
					String literal = Traductor.traducir(AxisBaseService.getLocale(request).toString(), "9908329");
					thisAction.guardarMensaje(request, "verbatim:" + literal, null, Constantes.MENSAJE_INFO);
				}

			}
		} catch (Exception e) {
			log.error("Error", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	/**
	 * Guardamos las listas y datos de toda la pantalla en base de datos en modo
	 * liquidar. Y si todo a ido bien Liquidamos.
	 * 
	 * @param request    El HttpServletRequest que contiene la petici?n del cliente
	 *                   web.
	 * @param thisAction Una Action abstracta desde donde se ha invocado el servicio
	 *                   (necesaria para el log).
	 */
	public void m_liquidar(HttpServletRequest request, Axisage031Action thisAction) {

		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);

		try {

			if (formdata.get("paginar") == null) {

				BigDecimal NLIQMEN = getCampoNumerico(request, "NLIQMEN");
				BigDecimal CEMPRES = getHiddenCampoNumerico(request, "HCEMPRES");
				BigDecimal CAGENTELIQ = getCampoNumerico(request, "CAGENTE");
				BigDecimal CAGENTE = getCampoNumerico(request, "CAGENTE");
				BigDecimal CESTADO = getHiddenCampoNumerico(request, "HCESTADO");
				Date FLIQUIDA = stringToSqlDate(getCampoTextual(request, "FLIQUIDA"));
				Date FCOBRO = stringToSqlDate(getCampoTextual(request, "FCOBRO"));
				BigDecimal CTOMADOR = getCampoNumerico(request, "CTOMADOR");
				String CUSUARIO = getCampoTextual(request, "CUSUARIO");
				BigDecimal IIMPORTE = getCampoNumerico(request, "IIMPORTE");
				BigDecimal IDIFGLOBAL = getCampoNumerico(request, "IDIFGLOBAL");
				// BigDecimal total_difglobal =
				// (BigDecimal)request.getSession().getAttribute("total_difglobal");
				List LISTDOC = (List) request.getSession().getAttribute("lista_liquida_documentos");
				List LISTREC = (List) request.getSession().getAttribute("lista_liquida_recibos");
				List LISTAPU = (List) request.getSession().getAttribute("lista_liquida_apuntes");
				BigDecimal SPROLIQ = getCampoNumerico(request, "SPROLIQ");
				String modo = (String) request.getSession().getAttribute("CMODO");
				BigDecimal YCH = new BigDecimal(1);
				BigDecimal PCPROCES = null;
				BigDecimal PONLIQMEN = null;
				BigDecimal POCESTADO = null;
				BigDecimal NLIQLIN = null;
				java.util.Date TO_DAY = new java.util.Date();
				boolean unavez = true;

				// INI BUG CONF-379 - 17/03/2016 - JAEG
				BigDecimal IMPPEND = getHiddenCampoNumerico(request, "IMPPEND");
				BigDecimal VABONO = getHiddenCampoNumerico(request, "VABONO");
				Date FABONO = stringToSqlDate(getHiddenCampoTextual(request, "FABONO"));
				BigDecimal DOCRECAUD = getHiddenCampoNumerico(request, "DOCRECAUD");
				BigDecimal CORTEPROD = getHiddenCampoNumerico(request, "CORTEPROD");
				// FIN BUG CONF-379 - 17/03/2016 - JAEG
				boolean guardado_ok = true;

				PAC_IAX_AUTOLIQUIDA pacIaxAutoliquida = new PAC_IAX_AUTOLIQUIDA(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

				Map autoliq = pacIaxAutoliquida.ejecutaPAC_IAX_AUTOLIQUIDA__F_GET_AUTOLIQUIDAAGE(SPROLIQ, CEMPRES,
						CAGENTELIQ);
				ArrayList listautoliq = (ArrayList) autoliq.get("RETURN");

				log.debug(listautoliq);

				HashMap OB_IAX_AUTOLIQUIDAAGE = new HashMap();
				if (!isEmpty(listautoliq)) {
					for (int W = 0; W < listautoliq.size(); W++) {
						if (((Map) ((Map) listautoliq.get(W)).get("OB_IAX_AUTOLIQUIDAAGE")).get("CMARCADO")
								.equals(new BigDecimal(1))) {
							log.debug("est? marcado parece:"
									+ ((Map) ((Map) listautoliq.get(W)).get("OB_IAX_AUTOLIQUIDAAGE")).get("NLIQMEN"));

							NLIQMEN = (BigDecimal) ((Map) ((Map) listautoliq.get(W)).get("OB_IAX_AUTOLIQUIDAAGE"))
									.get("NLIQMEN");
							CAGENTE = (BigDecimal) ((Map) ((Map) listautoliq.get(W)).get("OB_IAX_AUTOLIQUIDAAGE"))
									.get("CAGENTE");
							IDIFGLOBAL = (BigDecimal) ((Map) ((Map) listautoliq.get(W)).get("OB_IAX_AUTOLIQUIDAAGE"))
									.get("IDIFGLOBAL");

							Map CabMap = pacIaxAutoliquida.ejecutaPAC_IAX_AUTOLIQUIDA__F_SET_AUTOLIQUIDACAB("L",
									NLIQMEN, CEMPRES, CAGENTE, CESTADO, FLIQUIDA, FCOBRO, CTOMADOR, CUSUARIO, IIMPORTE,
									SPROLIQ, IDIFGLOBAL);
							log.debug("liquidar cabecera:" + CabMap);
							if (!CabMap.get("RETURN").equals(new BigDecimal(0))) {
								tratarRETURNyMENSAJES(request, CabMap);
								guardado_ok = false;
							} else {
								PCPROCES = ((BigDecimal) CabMap.get("PCPROCES"));
								PONLIQMEN = ((BigDecimal) CabMap.get("PONLIQMEN"));
							}

							if (unavez) {

								if (LISTDOC != null) {
									for (int i = 0; i < LISTDOC.size(); i++) {
										if (((Map) LISTDOC.get(i)).get("CCOBRO").equals(new BigDecimal(2))) {
											Date FDOCU = null;
											if (((Map) LISTDOC.get(i)).get("FDOCUMENTO") != null) {
												if (((Map) LISTDOC.get(i)).get("FDOCUMENTO") instanceof Date) {
													FDOCU = (Date) ((Map) LISTDOC.get(i)).get("FDOCUMENTO");
												} else {
													FDOCU = new Date(
															((Timestamp) ((Map) LISTDOC.get(i)).get("FDOCUMENTO"))
																	.getTime());
												}

												if (FDOCU.getTime() > TO_DAY.getTime()) {
													thisAction.guardarMensaje(request, "9908227", null,
															Constantes.MENSAJE_INFO);
													m_guardar(request, thisAction);
													guardado_ok = false;
												}
											}
										}
									}
								}

								if (LISTDOC != null) {
									for (int i = 0; i < LISTDOC.size(); i++) {

										Date FDOCU = null;
										if (((Map) LISTDOC.get(i)).get("FDOCUMENTO") != null) {
											if (((Map) LISTDOC.get(i)).get("FDOCUMENTO") instanceof Date) {
												FDOCU = (Date) ((Map) LISTDOC.get(i)).get("FDOCUMENTO");
											} else {
												FDOCU = new Date(((Timestamp) ((Map) LISTDOC.get(i)).get("FDOCUMENTO"))
														.getTime());
											}

										}

										// Alberto - Borramos todos los documentos antes de insertar todos. Para ello
										// enviamos un -1 en el idcobro si es el primer registro
										// con lo que indicamos que lo que queremos es borrar los documentos
										if (i == 0) {
											Map CobrosMap = pacIaxAutoliquida.ejecutaPAC_IAX_AUTOLIQUIDA__F_SET_COBROS(
													new BigDecimal(9999), CAGENTE, CEMPRES, SPROLIQ,
													((BigDecimal) ((Map) LISTDOC.get(i)).get("CCOBRO")),
													((String) ((Map) LISTDOC.get(i)).get("DOCUMENTO")), FDOCU,
													((BigDecimal) ((Map) LISTDOC.get(i)).get("BANCO")),
													((BigDecimal) ((Map) LISTDOC.get(i)).get("IMPORTE")),
													((String) ((Map) LISTDOC.get(i)).get("OBSERVACIONES")));
										}

										Map CobrosMap = pacIaxAutoliquida.ejecutaPAC_IAX_AUTOLIQUIDA__F_SET_COBROS(
												new BigDecimal(i + 1), CAGENTE, CEMPRES, SPROLIQ,
												((BigDecimal) ((Map) LISTDOC.get(i)).get("CCOBRO")),
												((String) ((Map) LISTDOC.get(i)).get("DOCUMENTO")), FDOCU,
												((BigDecimal) ((Map) LISTDOC.get(i)).get("BANCO")),
												((BigDecimal) ((Map) LISTDOC.get(i)).get("IMPORTE")),
												((String) ((Map) LISTDOC.get(i)).get("OBSERVACIONES")));
										log.debug("guardar documentos:" + CobrosMap);

										// Map CobrosMap =
										// pacIaxAutoliquida.ejecutaPAC_IAX_AUTOLIQUIDA__F_SET_COBROS(NLIQMEN, CAGENTE,
										// CEMPRES, SPROLIQ, ((BigDecimal)((Map)LISTDOC.get(i)).get("CCOBRO")),
										// ((String)((Map)LISTDOC.get(i)).get("DOCUMENTO")), FDOCU,
										// ((BigDecimal)((Map)LISTDOC.get(i)).get("BANCO")),
										// ((BigDecimal)((Map)LISTDOC.get(i)).get("IMPORTE")),
										// ((String)((Map)LISTDOC.get(i)).get("OBSERVACIONES")));
										// log.debug ("liquidar documentos:" + CobrosMap);

										if (!CobrosMap.get("RETURN").equals(new BigDecimal(0))) {
											tratarRETURNyMENSAJES(request, CobrosMap);
											guardado_ok = false;
										}

									}
								}
								unavez = false;
							}

							if (LISTREC != null) {
								for (int i = 0; i < LISTREC.size(); i++) {
									if (((Map) LISTREC.get(i)).get("CH").equals(YCH)) {
										if (((BigDecimal) ((Map) LISTREC.get(i)).get("CAGENTE")).equals(CAGENTE)) {
											Date FEFEC = null;
											if (((Map) LISTREC.get(i)).get("FEFECTO") instanceof Date) {
												FEFEC = (Date) ((Map) LISTREC.get(i)).get("FEFECTO");
											} else {
												FEFEC = new Date(
														((Timestamp) ((Map) LISTREC.get(i)).get("FEFECTO")).getTime());
											}

											if (!isEmpty((((Map) LISTREC.get(i)).get("NLIQLIN")))
													&& !(((Map) LISTREC.get(i)).get("NLIQLIN")).equals("null"))
												NLIQLIN = ((BigDecimal) ((Map) LISTREC.get(i)).get("NLIQLIN"));
											else
												NLIQLIN = new BigDecimal(0);

											FEFEC = FLIQUIDA;
											BigDecimal totalImporte = BigDecimal.ZERO;
											if (((BigDecimal) ((Map) LISTREC.get(i)).get("DIF"))
													.equals(BigDecimal.ZERO)) {
												totalImporte = (BigDecimal) ((Map) LISTREC.get(i)).get("ITOTALR");
											} else {
												totalImporte = (BigDecimal) ((Map) LISTREC.get(i)).get("ITOTCARG");
											}

											Map RecibosMap = pacIaxAutoliquida
													.ejecutaPAC_IAX_AUTOLIQUIDA__F_SET_RECIBOS("L", NLIQMEN, CEMPRES,
															CAGENTE, NLIQLIN,
															((BigDecimal) ((Map) LISTREC.get(i)).get("NRECIBO")),
															((BigDecimal) ((Map) LISTREC.get(i)).get("CTIPREC")),
															((BigDecimal) ((Map) LISTREC.get(i)).get("FRA")), FEFEC,
															totalImporte,
															((BigDecimal) ((Map) LISTREC.get(i)).get("COMISION")),
															((BigDecimal) ((Map) LISTREC.get(i)).get("IRPF")),
															((BigDecimal) ((Map) LISTREC.get(i)).get("DIF")), SPROLIQ,
															((BigDecimal) ((Map) LISTREC.get(i)).get("PL")),
															((BigDecimal) ((Map) LISTREC.get(i)).get("DIFPYG")),
															IMPPEND, VABONO, FABONO, DOCRECAUD, CORTEPROD);
											log.debug("guardar recibos:" + RecibosMap);

											if (!RecibosMap.get("RETURN").equals(new BigDecimal(0))) {
												tratarRETURNyMENSAJES(request, RecibosMap);
												guardado_ok = false;
											}
										}
									}
								}
							}

							if (LISTAPU != null) {
								for (int i = 0; i < LISTAPU.size(); i++) {
									if (((Map) LISTAPU.get(i)).get("CH").equals(YCH)) {
										if (((BigDecimal) ((Map) LISTAPU.get(i)).get("CAGENTE")).equals(CAGENTE)) {
											Map CtasMap = pacIaxAutoliquida.ejecutaPAC_IAX_AUTOLIQUIDA__F_SET_CTAS("L",
													CAGENTE, CEMPRES,
													((BigDecimal) ((Map) LISTAPU.get(i)).get("NNUMLIN")), SPROLIQ);
											log.debug("guardar apuntes:" + CtasMap);

											if (!CtasMap.get("RETURN").equals(new BigDecimal(0))) {
												tratarRETURNyMENSAJES(request, CtasMap);
												guardado_ok = false;
											}
										}
									}
								}
							}

							if (guardado_ok) {

								Map ResultMap = pacIaxAutoliquida.ejecutaPAC_IAX_AUTOLIQUIDA__F_SET_AUTOLIQUIDACION("L",
										NLIQMEN, CEMPRES, CAGENTE, SPROLIQ);
								log.debug("set_autoliquidacion:" + ResultMap);

								if (!ResultMap.get("RETURN").equals(new BigDecimal(0))) {
									tratarRETURNyMENSAJES(request, ResultMap);
									guardado_ok = false;
								} else {
									POCESTADO = ((BigDecimal) ResultMap.get("POCESTADO"));
								}
							}

						}

					}

					if (guardado_ok && !unavez) {

						recargar(request, thisAction, SPROLIQ, CEMPRES, CAGENTELIQ, POCESTADO);

						String literal = Traductor.traducir(AxisBaseService.getLocale(request).toString(), "111313");
						thisAction.guardarMensaje(request, "verbatim:" + literal + ": " + SPROLIQ, null,
								Constantes.MENSAJE_INFO);
					}

				}
				if (unavez)
				// no hay liquidaage seleccionado
				{
					String literal = Traductor.traducir(AxisBaseService.getLocale(request).toString(), "9908329");
					thisAction.guardarMensaje(request, "verbatim:" + literal, null, Constantes.MENSAJE_INFO);
				}

			}
		} catch (Exception e) {
			log.error("Error", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	/**
	 * A?adimos los datos del documento a la lita de documentos en sesion. se llama
	 * desde la pantalla axisage032.
	 * 
	 * @param request    El HttpServletRequest que contiene la petici?n del cliente
	 *                   web.
	 * @param thisAction Una Action abstracta desde donde se ha invocado el servicio
	 *                   (necesaria para el log).
	 */
	public void m_aceptar_axisage032(HttpServletRequest request, Axisage031Action thisAction) {

		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);

		try {

			if (formdata.get("paginar") == null) {

				BigDecimal CCOBRO = getCampoNumerico(request, "CESTADO_aux");
				String TCOBRO = getCampoTextual(request, "TESTADO_aux");
				BigDecimal CBANCO = getCampoNumerico(request, "CBANCO_aux");
				String TBANCO = getCampoTextual(request, "TBANCO_aux");
				String DOCUM = getCampoTextual(request, "DOCUM_aux");
				BigDecimal IIMPORTE = getCampoNumerico(request, "IIMPORTE_aux");
				Date FDOC = stringToSqlDate(getCampoTextual(request, "FDOC_aux"));
				String TNATRIE = getCampoTextual(request, "TNATRIE_aux");
				BigDecimal NLIQLIN = getCampoNumerico(request, "NLIQLIN_aux");
				List LISTDOC = (List) request.getSession().getAttribute("lista_liquida_documentos");
				Map LISTCAB = (Map) request.getSession().getAttribute("liquida_cabecera");
				BigDecimal total_documentos = (BigDecimal) request.getSession().getAttribute("total_documentos");
				BigDecimal total_dif_dg = (BigDecimal) request.getSession().getAttribute("total_dif_dg");
				String modo = (String) request.getSession().getAttribute("CMODO");
				BigDecimal importe = new BigDecimal(0);

				BigDecimal CEMPRES = getHiddenCampoNumerico(request, "HCEMPRES");
				request.getSession().setAttribute("CEMPRESSEL", CEMPRES);

				if (modo.equals("ALTA")) {
					BigDecimal CAGENTE = getCampoNumerico(request, "CAGENTE");
					String TAGENTE = getCampoTextual(request, "TAGENTE");
					BigDecimal CESTADO = getCampoNumerico(request, "CESTADO");
					Date FLIQUIDA = stringToSqlDate(getCampoTextual(request, "FLIQUIDA"));
					Date FCOBRO = stringToSqlDate(getCampoTextual(request, "FCOBRO"));
					BigDecimal CTOMADOR = getCampoNumerico(request, "CTOMADOR");
					String CUSUARIO = getCampoTextual(request, "CUSUARIO");
					LISTCAB.put("CESTAUTOLIQ", CESTADO);
					LISTCAB.put("CAGENTE", CAGENTE);
					LISTCAB.put("MEDIADOR", TAGENTE);
					LISTCAB.put("FLIQUID", FLIQUIDA);
					LISTCAB.put("FCOBRO", FCOBRO);
					LISTCAB.put("CTOMADOR", CTOMADOR);
					LISTCAB.put("CUSUARI", CUSUARIO);
					request.getSession().setAttribute("liquida_cabecera", LISTCAB);
				}

				if (LISTDOC != null) {

					if (NLIQLIN != null) {

						for (int i = 0; i < LISTDOC.size(); i++) {
							if (((Map) LISTDOC.get(i)).get("NLIQLIN").equals(NLIQLIN)) {
								importe = ((BigDecimal) ((Map) LISTDOC.get(i)).get("IMPORTE"));
								LISTDOC.remove(i);
							}
						}
						request.getSession().setAttribute("lista_liquida_documentos", LISTDOC);
						total_documentos = total_documentos.subtract(importe);
						request.getSession().setAttribute("total_dif_dg", total_dif_dg.subtract(importe));
						request.getSession().setAttribute("total_documentos", total_documentos);

					}

					Map Documento = new Hashtable();

					Documento.put("CCOBRO", CCOBRO);
					Documento.put("TCOBRO", TCOBRO);

					Documento.put("IMPORTE", IIMPORTE);

					if (CBANCO == null) {
						// Documento.put("BANCO", "");
						Documento.put("TBANCO", "");
					} else {
						Documento.put("BANCO", CBANCO);
						Documento.put("TBANCO", TBANCO);
					}
					if (DOCUM == null) {
						// Documento.put("DOCUMENTO", );
					} else {
						Documento.put("DOCUMENTO", DOCUM);
					}
					if (FDOC == null) {
						// Documento.put("FDOCUMENTO", "");
					} else {
						Documento.put("FDOCUMENTO", FDOC);
					}
					if (TNATRIE == null) {
						Documento.put("OBSERVACIONES", "");
					} else {
						Documento.put("OBSERVACIONES", TNATRIE);
					}

					if (NLIQLIN != null) {
						Documento.put("NLIQLIN", NLIQLIN);
					} else {
						Documento.put("NLIQLIN", new BigDecimal(LISTDOC.size() + 1));
					}
					LISTDOC.add(Documento);
					total_dif_dg = (BigDecimal) request.getSession().getAttribute("total_dif_dg");
					total_documentos = total_documentos.add(IIMPORTE);
					request.getSession().setAttribute("total_documentos", total_documentos);
					request.getSession().setAttribute("total_dif_dg", total_dif_dg.add(IIMPORTE));
					request.getSession().setAttribute("lista_liquida_documentos", LISTDOC);
				}
			}
		} catch (Exception e) {
			log.error("Error", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.formattingNumericValues(request);
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	/**
	 * Eliminamos una liquidaci?n.
	 * 
	 * @param request    El HttpServletRequest que contiene la petici?n del cliente
	 *                   web.
	 * @param thisAction Una Action abstracta desde donde se ha invocado el servicio
	 *                   (necesaria para el log).
	 */
	public void m_borrar_liquidacion(HttpServletRequest request, Axisage031Action thisAction) {
		logger.debug("Axisage031Service m_ajax_borrar_liquidacion");

		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);

		try {

			if (formdata.get("paginar") == null) {

				BigDecimal SPROLIQ = this.getCampoNumerico(request, "PSPROLIQ");
				BigDecimal CAGENTE = this.getCampoNumerico(request, "PCAGENTE");
				BigDecimal CEMPRES = this.getCampoNumerico(request, "PCEMPRES");
				BigDecimal NLIQMEN = getCampoNumerico(request, "NLIQMEN");
				String CMODO = this.getCampoTextual(request, "PCMODO");
				request.setAttribute("CMODO", CMODO);
				PAC_IAX_AUTOLIQUIDA pacIaxAutoliquida = new PAC_IAX_AUTOLIQUIDA(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

				Map autoliq = pacIaxAutoliquida.ejecutaPAC_IAX_AUTOLIQUIDA__F_GET_AUTOLIQUIDAAGE(SPROLIQ, CEMPRES,
						CAGENTE);
				ArrayList listautoliq = (ArrayList) autoliq.get("RETURN");

				log.debug(listautoliq);

				HashMap OB_IAX_AUTOLIQUIDAAGE = new HashMap();
				if (!isEmpty(listautoliq)) {
					for (int W = 0; W < listautoliq.size(); W++) {
						if (((Map) ((Map) listautoliq.get(W)).get("OB_IAX_AUTOLIQUIDAAGE")).get("CMARCADO")
								.equals(new BigDecimal(1))) {
							log.debug("est? marcado parece:"
									+ ((Map) ((Map) listautoliq.get(W)).get("OB_IAX_AUTOLIQUIDAAGE")).get("NLIQMEN"));

							NLIQMEN = (BigDecimal) ((Map) ((Map) listautoliq.get(W)).get("OB_IAX_AUTOLIQUIDAAGE"))
									.get("NLIQMEN");

							Map ResultMap = pacIaxAutoliquida.ejecutaPAC_IAX_AUTOLIQUIDA__F_DEL_LIQUIDACION(SPROLIQ,
									CEMPRES, CAGENTE, NLIQMEN);
							log.debug("bORRAR_liquidacion:" + ResultMap);

							tratarRETURNyMENSAJES(request, ResultMap);
						}
					}
				}

			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisage031Service - m?todo m_ajax_borrar_liquidacion", e);

		} finally {
			this.formattingNumericValues(request);
		}
	}

	/**
	 * Procesa la ?ltima versi?n activa del convenio (suplemento masivo de cambio de
	 * versi?n para el convenio). Llamamos a PAC_ CONVENIOS_EMP.
	 * F_PROCESO_CAMB_VERSCON(convenio pantalla) en modo diferido.
	 * 
	 * @param request    El HttpServletRequest que contiene la petici?n del cliente
	 *                   web.
	 * @param thisAction Una Action abstracta desde donde se ha invocado el servicio
	 *                   (necesaria para el log).
	 */
	public void m_ajax_actualizar_dif(HttpServletRequest request) {

		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		logger.debug("Axisage031Service m_ajax_actualizar_dif");
		AjaxContainerService ajax = new AjaxContainerService();

		try {

			if (formdata.get("paginar") == null) {

				BigDecimal NUMRECIBO = getCampoNumerico(request, "NRECIBO_aux");
				BigDecimal VALOR = getCampoNumerico(request, "VALOR_aux");
				BigDecimal COMIS = new BigDecimal(0);
				int DIFER = VALOR.compareTo(COMIS);

				BigDecimal NCH_N = new BigDecimal(0);
				BigDecimal NCH_Y = new BigDecimal(1);
				List LISTREC = (List) request.getSession().getAttribute("lista_liquida_recibos");
				BigDecimal total_recibos_01 = (BigDecimal) request.getSession().getAttribute("total_recibos_01");
				BigDecimal total_recibos_02 = (BigDecimal) request.getSession().getAttribute("total_recibos_02");
				BigDecimal total_recibos_03 = (BigDecimal) request.getSession().getAttribute("total_recibos_03");
				BigDecimal total_recibos_04 = (BigDecimal) request.getSession().getAttribute("total_recibos_04");
				BigDecimal total_recibos_05 = (BigDecimal) request.getSession().getAttribute("total_recibos_05");
				BigDecimal total_recibos_06 = (BigDecimal) request.getSession().getAttribute("total_recibos_06");
				BigDecimal total_recibos_07 = (BigDecimal) request.getSession().getAttribute("total_recibos_07");
				BigDecimal total_documentos = (BigDecimal) request.getSession().getAttribute("total_documentos");
				BigDecimal total_apuntes = (BigDecimal) request.getSession().getAttribute("total_apuntes");
				BigDecimal total_difglobal = (BigDecimal) request.getSession().getAttribute("total_difglobal");
				BigDecimal VALOR_ANT = new BigDecimal(0);

				if (LISTREC != null) {
					for (int i = 0; i < LISTREC.size(); i++) {

						if (((Map) LISTREC.get(i)).get("NRECIBO").equals(NUMRECIBO)) {

							// comentamos la validacion de la diferencia menor que la comision
							COMIS = (BigDecimal) ((Map) LISTREC.get(i)).get("COMISION");
							VALOR_ANT = (BigDecimal) ((Map) LISTREC.get(i)).get("DIF");
							((Map) LISTREC.get(i)).put("DIF", VALOR);

							DIFER = VALOR.compareTo(COMIS);

							if (((Map) LISTREC.get(i)).get("CH").equals(NCH_Y)) {

								// if (DIFER != 1) {
								total_recibos_05 = total_recibos_05.add(VALOR.subtract(VALOR_ANT));
								total_recibos_06 = total_recibos_06.add(VALOR.subtract(VALOR_ANT));
								// }
								// else
								// {
								// total_recibos_05 = total_recibos_05.add(new
								// BigDecimal(0).subtract(VALOR_ANT));
								// total_recibos_06 = total_recibos_06.add(new
								// BigDecimal(0).subtract(VALOR_ANT));
								// }
							}
						}

					}

					request.getSession().setAttribute("lista_liquida_recibos", LISTREC);

					request.getSession().setAttribute("total_recibos_02", total_recibos_02);
					request.getSession().setAttribute("total_recibos_03", total_recibos_03);
					request.getSession().setAttribute("total_recibos_04", total_recibos_04);
					request.getSession().setAttribute("total_recibos_05", total_recibos_05);
					request.getSession().setAttribute("total_recibos_06", total_recibos_06);
					request.getSession().setAttribute("total_dif_dg",
							total_documentos.subtract(total_recibos_06).subtract(total_apuntes));

					Map recibo = new HashMap();
					recibo.put("total_recibos_02", total_recibos_02);
					recibo.put("total_recibos_03", total_recibos_03);
					recibo.put("total_recibos_04", total_recibos_04);
					recibo.put("total_recibos_05", total_recibos_05);
					recibo.put("total_recibos_06", total_recibos_06);
					recibo.put("total_recibos_07", total_recibos_07);
					recibo.put("total_dif_dg", total_documentos.subtract(total_recibos_06).subtract(total_apuntes));

					// recibo.put("difer", DIFER);
					recibo.put("recibo", NUMRECIBO);

					ajax.rellenarPlAContenedorAjax(recibo);
					ajax.guardarContenidoFinalAContenedorAjax(recibo);
				}
			}
		} catch (Exception e) {
			logger.error("Error en el servicio Axisage031Service - m?todo m_ajax_actualizar_dif", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			this.formattingNumericValues(request);
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	public void m_ajax_actualizar_difglobal(HttpServletRequest request) {

		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		logger.debug("Axisage031Service m_ajax_actualizar_difglobal");
		AjaxContainerService ajax = new AjaxContainerService();

		try {

			if (formdata.get("paginar") == null) {

				BigDecimal VALOR = getCampoNumerico(request, "VALOR_aux");
				BigDecimal COMIS = new BigDecimal(0);
				int DIFER = 0;
				BigDecimal NCH_N = new BigDecimal(0);
				BigDecimal NCH_Y = new BigDecimal(1);
				BigDecimal total_recibos_01 = (BigDecimal) request.getSession().getAttribute("total_recibos_01");
				BigDecimal total_recibos_02 = (BigDecimal) request.getSession().getAttribute("total_recibos_02");
				BigDecimal total_recibos_03 = (BigDecimal) request.getSession().getAttribute("total_recibos_03");
				BigDecimal total_recibos_04 = (BigDecimal) request.getSession().getAttribute("total_recibos_04");
				BigDecimal total_recibos_05 = (BigDecimal) request.getSession().getAttribute("total_recibos_05");
				BigDecimal total_recibos_06 = (BigDecimal) request.getSession().getAttribute("total_recibos_06");
				BigDecimal total_recibos_07 = (BigDecimal) request.getSession().getAttribute("total_recibos_07");
				List LISTREC = (List) request.getSession().getAttribute("lista_liquida_recibos");
				BigDecimal total_dif_dg = (BigDecimal) request.getSession().getAttribute("total_dif_dg");

				// BigDecimal total_difglobal =
				// (BigDecimal)request.getSession().getAttribute("total_difglobal");
				BigDecimal VALOR_ANT = (BigDecimal) request.getSession().getAttribute("total_difglobal");

				logger.debug("total_dif_dg antes:" + total_dif_dg);

				request.getSession().setAttribute("total_recibos_02", total_recibos_02);
				request.getSession().setAttribute("total_recibos_03", total_recibos_03);
				request.getSession().setAttribute("total_recibos_04", total_recibos_04);
				request.getSession().setAttribute("total_recibos_05", total_recibos_05);
				request.getSession().setAttribute("total_recibos_06", total_recibos_06);
				request.getSession().setAttribute("total_dif_dg", total_dif_dg.add(VALOR_ANT).subtract(VALOR));
				request.getSession().setAttribute("total_difglobal", VALOR);

				logger.debug("total_dif_dg despues:" + total_dif_dg.add(VALOR_ANT).subtract(VALOR));
				logger.debug("VALOR:" + VALOR);
				logger.debug("VALOR_ANT:" + VALOR_ANT);

				request.getSession().setAttribute("lista_liquida_recibos", LISTREC);

				Map recibo = new HashMap();
				recibo.put("total_recibos_02", total_recibos_02);
				recibo.put("total_recibos_03", total_recibos_03);
				recibo.put("total_recibos_04", total_recibos_04);
				recibo.put("total_recibos_05", total_recibos_05);
				recibo.put("total_recibos_06", total_recibos_06);
				recibo.put("total_recibos_07", total_recibos_07);
				recibo.put("total_dif_dg", total_dif_dg.add(VALOR_ANT).subtract(VALOR));
				recibo.put("total_difglobal", VALOR);
				// cabecera.put("total_difglobal", VALOR);

				logger.debug("dentro:" + VALOR_ANT);

				ajax.rellenarPlAContenedorAjax(recibo);
				ajax.guardarContenidoFinalAContenedorAjax(recibo);

				/*
				 * if (LISTREC != null){
				 * 
				 * request.getSession().setAttribute("lista_liquida_recibos", LISTREC );
				 * 
				 * request.getSession().setAttribute("total_recibos_02", total_recibos_02 );
				 * request.getSession().setAttribute("total_recibos_03", total_recibos_03 );
				 * request.getSession().setAttribute("total_recibos_04", total_recibos_04 );
				 * request.getSession().setAttribute("total_recibos_05", total_recibos_05 );
				 * request.getSession().setAttribute("total_recibos_06", total_recibos_06);
				 * request.getSession().setAttribute("total_dif_dg",
				 * total_documentos.subtract(total_recibos_06).subtract(total_apuntes));
				 * 
				 * Map recibo = new HashMap(); recibo.put("total_recibos_02", total_recibos_02);
				 * recibo.put("total_recibos_03", total_recibos_03);
				 * recibo.put("total_recibos_04", total_recibos_04);
				 * recibo.put("total_recibos_05", total_recibos_05);
				 * recibo.put("total_recibos_06", total_recibos_06);
				 * recibo.put("total_recibos_07", total_recibos_07); recibo.put("total_dif_dg",
				 * total_documentos.subtract(total_recibos_06).subtract(total_apuntes).subtract(
				 * VALOR).add(VALOR_ANT));
				 * 
				 * //recibo.put("difer", DIFER); recibo.put("recibo", NUMRECIBO);
				 * 
				 * 
				 * ajax.rellenarPlAContenedorAjax(recibo);
				 * ajax.guardarContenidoFinalAContenedorAjax(recibo); }
				 */
			}
		} catch (Exception e) {
			logger.error("Error en el servicio Axisage031Service - m?todo m_ajax_actualizar_difglobal", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			this.formattingNumericValues(request);
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	public void m_ajax_actualizar_difpyg(HttpServletRequest request) {

		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		logger.debug("Axisage031Service m_ajax_actualizar_difpyg");
		AjaxContainerService ajax = new AjaxContainerService();

		try {

			if (formdata.get("paginar") == null) {

				BigDecimal NUMRECIBO = getCampoNumerico(request, "NRECIBO_aux");
				BigDecimal VALOR = getCampoNumerico(request, "VALOR_aux");
				BigDecimal COMIS = new BigDecimal(0);
				int DIFER = 0;
				BigDecimal NCH_N = new BigDecimal(0);
				BigDecimal NCH_Y = new BigDecimal(1);
				List LISTREC = (List) request.getSession().getAttribute("lista_liquida_recibos");
				BigDecimal total_recibos_01 = (BigDecimal) request.getSession().getAttribute("total_recibos_01");
				BigDecimal total_recibos_02 = (BigDecimal) request.getSession().getAttribute("total_recibos_02");
				BigDecimal total_recibos_03 = (BigDecimal) request.getSession().getAttribute("total_recibos_03");
				BigDecimal total_recibos_04 = (BigDecimal) request.getSession().getAttribute("total_recibos_04");
				BigDecimal total_recibos_05 = (BigDecimal) request.getSession().getAttribute("total_recibos_05");
				BigDecimal total_recibos_07 = (BigDecimal) request.getSession().getAttribute("total_recibos_07");
				BigDecimal total_recibos_06 = (BigDecimal) request.getSession().getAttribute("total_recibos_06");
				BigDecimal total_documentos = (BigDecimal) request.getSession().getAttribute("total_documentos");
				BigDecimal total_apuntes = (BigDecimal) request.getSession().getAttribute("total_apuntes");
				BigDecimal total_difglobal = (BigDecimal) request.getSession().getAttribute("total_difglobal");
				BigDecimal VALOR_ANT = new BigDecimal(0);

				if (LISTREC != null) {
					for (int i = 0; i < LISTREC.size(); i++) {

						if (((Map) LISTREC.get(i)).get("NRECIBO").equals(NUMRECIBO)) {

							COMIS = (BigDecimal) ((Map) LISTREC.get(i)).get("COMISION");
							VALOR_ANT = (BigDecimal) ((Map) LISTREC.get(i)).get("DIFPYG");
							((Map) LISTREC.get(i)).put("DIFPYG", VALOR);

							DIFER = VALOR.compareTo(COMIS);

							if (((Map) LISTREC.get(i)).get("CH").equals(NCH_Y)) {

								total_recibos_07 = total_recibos_07.subtract(VALOR_ANT);
								total_recibos_07 = total_recibos_07.add(VALOR);
								total_recibos_06 = total_recibos_06.add(VALOR.subtract(VALOR_ANT));

							}
						}

					}
					request.getSession().setAttribute("lista_liquida_recibos", LISTREC);

					request.getSession().setAttribute("total_recibos_02", total_recibos_02);
					request.getSession().setAttribute("total_recibos_03", total_recibos_03);
					request.getSession().setAttribute("total_recibos_04", total_recibos_04);
					request.getSession().setAttribute("total_recibos_05", total_recibos_05);
					request.getSession().setAttribute("total_recibos_07", total_recibos_07);
					request.getSession().setAttribute("total_recibos_06", total_recibos_06);
					request.getSession().setAttribute("total_dif_dg",
							total_documentos.subtract(total_recibos_06).subtract(total_apuntes));

					Map recibo = new HashMap();
					recibo.put("total_recibos_02", total_recibos_02);
					recibo.put("total_recibos_03", total_recibos_03);
					recibo.put("total_recibos_04", total_recibos_04);
					recibo.put("total_recibos_05", total_recibos_05);
					recibo.put("total_recibos_07", total_recibos_07);
					recibo.put("total_recibos_06", total_recibos_06);
					recibo.put("total_dif_dg", total_documentos.subtract(total_recibos_06).subtract(total_apuntes));

					// recibo.put("difer", DIFER);
					recibo.put("recibo", NUMRECIBO);

					ajax.rellenarPlAContenedorAjax(recibo);
					ajax.guardarContenidoFinalAContenedorAjax(recibo);
				}
			}
		} catch (Exception e) {
			logger.error("Error en el servicio Axisage031Service - m?todo m_ajax_actualizar_difpyg", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			this.formattingNumericValues(request);
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	/**
	 * Realiza una b?squeda de productos por Ajax.
	 * 
	 * @see Axisctr001Service#buscaProductos
	 * @param request El HttpServletRequest que contiene la petici?n del cliente
	 *                web.
	 */
	public void m_ajax_actualizar_check_pl(HttpServletRequest request) {

		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		logger.debug("Axisage031Service m_ajax_actualizar_check_pl");
		AjaxContainerService ajax = new AjaxContainerService();

		try {

			if (formdata.get("paginar") == null) {

				BigDecimal NUMRECIBO = getCampoNumerico(request, "NUMRECIBO");
				BigDecimal NCH_N = new BigDecimal(0);
				BigDecimal NCH_Y = new BigDecimal(1);
				BigDecimal pincha = new BigDecimal(1);
				List LISTREC = (List) request.getSession().getAttribute("lista_liquida_recibos");
				BigDecimal total_recibos_01 = (BigDecimal) request.getSession().getAttribute("total_recibos_01");
				BigDecimal total_recibos_02 = (BigDecimal) request.getSession().getAttribute("total_recibos_02");
				BigDecimal total_recibos_03 = (BigDecimal) request.getSession().getAttribute("total_recibos_03");
				BigDecimal total_recibos_04 = (BigDecimal) request.getSession().getAttribute("total_recibos_04");
				BigDecimal total_recibos_05 = (BigDecimal) request.getSession().getAttribute("total_recibos_05");
				BigDecimal total_recibos_06 = (BigDecimal) request.getSession().getAttribute("total_recibos_06");
				BigDecimal total_recibos_07 = (BigDecimal) request.getSession().getAttribute("total_recibos_07");
				BigDecimal total_documentos = (BigDecimal) request.getSession().getAttribute("total_documentos");
				BigDecimal total_apuntes = (BigDecimal) request.getSession().getAttribute("total_apuntes");
				BigDecimal total_difglobal = (BigDecimal) request.getSession().getAttribute("total_difglobal");

				if (LISTREC != null) {
					for (int i = 0; i < LISTREC.size(); i++) {

						if (((Map) LISTREC.get(i)).get("NRECIBO").equals(NUMRECIBO)
								&& ((Map) LISTREC.get(i)).get("PL").equals(NCH_N)) {

							((Map) LISTREC.get(i)).put("PL", new BigDecimal(1));
							pincha = new BigDecimal(1);
							if (((Map) LISTREC.get(i)).get("CH").equals(NCH_Y)) {
								total_recibos_02 = total_recibos_02
										.add((BigDecimal) ((Map) LISTREC.get(i)).get("COMISION"));
								total_recibos_03 = total_recibos_03
										.add((BigDecimal) ((Map) LISTREC.get(i)).get("IRPF"));
								total_recibos_04 = total_recibos_04
										.add((BigDecimal) ((Map) LISTREC.get(i)).get("LIQUIDO"));
								if (((BigDecimal) ((Map) LISTREC.get(i)).get("DIF")).equals(BigDecimal.ZERO)) {
									total_recibos_06 = total_recibos_06
											.subtract((BigDecimal) ((Map) LISTREC.get(i)).get("ITOTALR"));
								} else {
									total_recibos_06 = total_recibos_06
											.subtract((BigDecimal) ((Map) LISTREC.get(i)).get("ITOTCARG"));
								}

								total_recibos_06 = total_recibos_06
										.add((BigDecimal) ((Map) LISTREC.get(i)).get("LIQUIDO"));
							}
						} else if (((Map) LISTREC.get(i)).get("NRECIBO").equals(NUMRECIBO)
								&& ((Map) LISTREC.get(i)).get("PL").equals(NCH_Y)) {

							((Map) LISTREC.get(i)).put("PL", new BigDecimal(0));
							pincha = new BigDecimal(0);

							if (((Map) LISTREC.get(i)).get("CH").equals(NCH_Y)) {
								total_recibos_02 = total_recibos_02
										.subtract((BigDecimal) ((Map) LISTREC.get(i)).get("COMISION"));
								total_recibos_03 = total_recibos_03
										.subtract((BigDecimal) ((Map) LISTREC.get(i)).get("IRPF"));
								total_recibos_04 = total_recibos_04
										.subtract((BigDecimal) ((Map) LISTREC.get(i)).get("LIQUIDO"));
								total_recibos_06 = total_recibos_06
										.subtract((BigDecimal) ((Map) LISTREC.get(i)).get("LIQUIDO"));
								if (((BigDecimal) ((Map) LISTREC.get(i)).get("DIF")).equals(BigDecimal.ZERO)) {
									total_recibos_06 = total_recibos_06
											.add((BigDecimal) ((Map) LISTREC.get(i)).get("ITOTALR"));
								} else {
									total_recibos_06 = total_recibos_06
											.add((BigDecimal) ((Map) LISTREC.get(i)).get("ITOTCARG"));
								}
							}
						}
					}
					request.getSession().setAttribute("lista_liquida_recibos", LISTREC);
					request.getSession().setAttribute("total_recibos_02", total_recibos_02);
					request.getSession().setAttribute("total_recibos_03", total_recibos_03);
					request.getSession().setAttribute("total_recibos_04", total_recibos_04);
					request.getSession().setAttribute("total_recibos_05", total_recibos_05);
					request.getSession().setAttribute("total_recibos_06", total_recibos_06);
					request.getSession().setAttribute("total_recibos_07", total_recibos_07);
					request.getSession().setAttribute("total_dif_dg",
							total_documentos.subtract(total_recibos_06).subtract(total_apuntes));

					Map recibo = new HashMap();
					recibo.put("total_recibos_02", total_recibos_02);
					recibo.put("total_recibos_03", total_recibos_03);
					recibo.put("total_recibos_04", total_recibos_04);
					recibo.put("total_recibos_05", total_recibos_05);
					recibo.put("total_recibos_06", total_recibos_06);
					recibo.put("total_recibos_07", total_recibos_07);
					recibo.put("total_dif_dg", total_documentos.subtract(total_recibos_06).subtract(total_apuntes));

					recibo.put("recibo", NUMRECIBO);
					recibo.put("marcado", pincha);

					ajax.rellenarPlAContenedorAjax(recibo);
					ajax.guardarContenidoFinalAContenedorAjax(recibo);
				}
			}
		} catch (Exception e) {
			logger.error("Error en el servicio Axisage031Service - m?todo m_ajax_actualizar_check_pl", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			this.formattingNumericValues(request);
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	/**
	 * Actualiza el check de recibos y sus totales por Ajax.
	 * 
	 * @see Axisctr031Service#actualizar_check_recibo
	 * @param request El HttpServletRequest que contiene la petici?n del cliente
	 *                web.
	 */
	public void m_ajax_actualizar_check_recibo(HttpServletRequest request) {

		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		logger.debug("Axisage031Service m_ajax_actualizar_check_recibo");
		AjaxContainerService ajax = new AjaxContainerService();

		try {

			if (formdata.get("paginar") == null) {

				BigDecimal NUMRECIBO = getCampoNumerico(request, "NUMRECIBO");
				BigDecimal NCH_N = new BigDecimal(0);
				BigDecimal NCH_Y = new BigDecimal(1);
				BigDecimal CODI_AGENTE = new BigDecimal(0);
				String NOM_AGENTE = "";
				BigDecimal NRECIBO = new BigDecimal(0);
				List LISTREC = (List) request.getSession().getAttribute("lista_liquida_recibos");
				BigDecimal total_recibos_01 = (BigDecimal) request.getSession().getAttribute("total_recibos_01");
				BigDecimal total_recibos_02 = (BigDecimal) request.getSession().getAttribute("total_recibos_02");
				BigDecimal total_recibos_03 = (BigDecimal) request.getSession().getAttribute("total_recibos_03");
				BigDecimal total_recibos_04 = (BigDecimal) request.getSession().getAttribute("total_recibos_04");
				BigDecimal total_recibos_05 = (BigDecimal) request.getSession().getAttribute("total_recibos_05");
				BigDecimal total_recibos_06 = (BigDecimal) request.getSession().getAttribute("total_recibos_06");
				BigDecimal total_recibos_07 = (BigDecimal) request.getSession().getAttribute("total_recibos_07");
				BigDecimal total_documentos = (BigDecimal) request.getSession().getAttribute("total_documentos");
				BigDecimal total_apuntes = (BigDecimal) request.getSession().getAttribute("total_apuntes");
				BigDecimal total_difglobal = (BigDecimal) request.getSession().getAttribute("total_difglobal");

				if (LISTREC != null) {
					for (int i = 0; i < LISTREC.size(); i++) {

						if (((Map) LISTREC.get(i)).get("NRECIBO").equals(NUMRECIBO)
								&& ((Map) LISTREC.get(i)).get("CH").equals(NCH_N)) {

							((Map) LISTREC.get(i)).put("CH", new BigDecimal(1));
							CODI_AGENTE = (BigDecimal) ((Map) LISTREC.get(i)).get("CAGENTE");
							NOM_AGENTE = (String) ((Map) LISTREC.get(i)).get("MEDIADOR");
							NRECIBO = (BigDecimal) ((Map) LISTREC.get(i)).get("NRECIBO");
							total_recibos_01 = total_recibos_01.add((BigDecimal) ((Map) LISTREC.get(i)).get("ITOTALR"));

							if (((Map) LISTREC.get(i)).get("PL").equals(NCH_Y)) {
								total_recibos_02 = total_recibos_02
										.add((BigDecimal) ((Map) LISTREC.get(i)).get("COMISION"));
								total_recibos_03 = total_recibos_03
										.add((BigDecimal) ((Map) LISTREC.get(i)).get("IRPF"));
								total_recibos_04 = total_recibos_04
										.add((BigDecimal) ((Map) LISTREC.get(i)).get("LIQUIDO"));
								total_recibos_06 = total_recibos_06
										.add((BigDecimal) ((Map) LISTREC.get(i)).get("LIQUIDO"));
							} else {

								if (((BigDecimal) ((Map) LISTREC.get(i)).get("DIF")).equals(BigDecimal.ZERO)) {
									total_recibos_06 = total_recibos_06
											.add((BigDecimal) ((Map) LISTREC.get(i)).get("ITOTALR"));
								} else {
									total_recibos_06 = total_recibos_06
											.add((BigDecimal) ((Map) LISTREC.get(i)).get("ITOTCARG"));
								}
							}
							total_recibos_07 = total_recibos_07.add((BigDecimal) ((Map) LISTREC.get(i)).get("DIFPYG"));
							total_recibos_06 = total_recibos_06.add((BigDecimal) ((Map) LISTREC.get(i)).get("DIFPYG"))
									.add((BigDecimal) ((Map) LISTREC.get(i)).get("DIF"));
							total_recibos_05 = total_recibos_05.add((BigDecimal) ((Map) LISTREC.get(i)).get("DIF"));

						} else if (((Map) LISTREC.get(i)).get("NRECIBO").equals(NUMRECIBO)
								&& ((Map) LISTREC.get(i)).get("CH").equals(NCH_Y)) {

							((Map) LISTREC.get(i)).put("CH", new BigDecimal(0));
							total_recibos_01 = total_recibos_01
									.subtract((BigDecimal) ((Map) LISTREC.get(i)).get("ITOTALR"));

							if (((Map) LISTREC.get(i)).get("PL").equals(NCH_Y)) {
								total_recibos_02 = total_recibos_02
										.subtract((BigDecimal) ((Map) LISTREC.get(i)).get("COMISION"));
								total_recibos_03 = total_recibos_03
										.subtract((BigDecimal) ((Map) LISTREC.get(i)).get("IRPF"));
								total_recibos_04 = total_recibos_04
										.subtract((BigDecimal) ((Map) LISTREC.get(i)).get("LIQUIDO"));
								total_recibos_06 = total_recibos_06
										.subtract((BigDecimal) ((Map) LISTREC.get(i)).get("LIQUIDO"));
							} else {
								if (((BigDecimal) ((Map) LISTREC.get(i)).get("DIF")).equals(BigDecimal.ZERO)) {
									total_recibos_06 = total_recibos_06
											.subtract((BigDecimal) ((Map) LISTREC.get(i)).get("ITOTALR"));
								} else {
									total_recibos_06 = total_recibos_06
											.subtract((BigDecimal) ((Map) LISTREC.get(i)).get("ITOTCARG"));
								}
							}
							total_recibos_05 = total_recibos_05
									.subtract((BigDecimal) ((Map) LISTREC.get(i)).get("DIF"));
							total_recibos_07 = total_recibos_07
									.subtract((BigDecimal) ((Map) LISTREC.get(i)).get("DIFPYG"));
							total_recibos_06 = total_recibos_06
									.subtract((BigDecimal) ((Map) LISTREC.get(i)).get("DIFPYG"))
									.subtract((BigDecimal) ((Map) LISTREC.get(i)).get("DIF"));
						}
					}
					request.getSession().setAttribute("lista_liquida_recibos", LISTREC);
					request.getSession().setAttribute("total_recibos_01", total_recibos_01);
					request.getSession().setAttribute("total_recibos_02", total_recibos_02);
					request.getSession().setAttribute("total_recibos_03", total_recibos_03);
					request.getSession().setAttribute("total_recibos_04", total_recibos_04);
					request.getSession().setAttribute("total_recibos_05", total_recibos_05);
					request.getSession().setAttribute("total_recibos_06", total_recibos_06);
					request.getSession().setAttribute("total_recibos_07", total_recibos_07);
					request.getSession().setAttribute("total_dif_dg",
							total_documentos.subtract(total_recibos_06).subtract(total_apuntes));

					Map recibo = new HashMap();
					recibo.put("total_recibos_01", total_recibos_01);
					recibo.put("total_recibos_02", total_recibos_02);
					recibo.put("total_recibos_03", total_recibos_03);
					recibo.put("total_recibos_04", total_recibos_04);
					recibo.put("total_recibos_05", total_recibos_05);
					recibo.put("total_recibos_06", total_recibos_06);
					recibo.put("total_recibos_07", total_recibos_07);
					recibo.put("total_dif_dg", total_documentos.subtract(total_recibos_06).subtract(total_apuntes));
					recibo.put("codi_agente", CODI_AGENTE);
					recibo.put("nom_agente", NOM_AGENTE);
					recibo.put("numero_recibo", NRECIBO);

					ajax.rellenarPlAContenedorAjax(recibo);
					ajax.guardarContenidoFinalAContenedorAjax(recibo);
				}
			}
		} catch (Exception e) {
			logger.error("Error en el servicio Axisage031Service - m?todo m_ajax_actualizar_check_recibo", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			this.formattingNumericValues(request);
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	/**
	 * Actualiza el check de apuntes y sus totales por Ajax.
	 * 
	 * @see Axisctr031Service#actualizar_check_apunte
	 * @param request El HttpServletRequest que contiene la petici?n del cliente
	 *                web.
	 */
	public void m_ajax_actualizar_check_apunte(HttpServletRequest request) {

		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		logger.debug("Axisage031Service m_ajax_actualizar_check_apunte");
		AjaxContainerService ajax = new AjaxContainerService();

		try {

			if (formdata.get("paginar") == null) {

				BigDecimal NUMAPU = getCampoNumerico(request, "NUMAPU");
				BigDecimal NCH_N = new BigDecimal(0);
				BigDecimal NCH_Y = new BigDecimal(1);
				List LISTAPU = (List) request.getSession().getAttribute("lista_liquida_apuntes");
				BigDecimal total_apuntes = (BigDecimal) request.getSession().getAttribute("total_apuntes");
				BigDecimal total_recibos_06 = (BigDecimal) request.getSession().getAttribute("total_recibos_06");
				BigDecimal total_documentos = (BigDecimal) request.getSession().getAttribute("total_documentos");
				BigDecimal total_difglobal = (BigDecimal) request.getSession().getAttribute("total_difglobal");

				if (LISTAPU != null) {
					for (int i = 0; i < LISTAPU.size(); i++) {

						if (((Map) LISTAPU.get(i)).get("NNUMLIN").equals(NUMAPU)
								&& ((Map) LISTAPU.get(i)).get("CH").equals(NCH_N)) {

							((Map) LISTAPU.get(i)).put("CH", new BigDecimal(1));

							if ((BigDecimal) ((Map) LISTAPU.get(i)).get("DEBE") != null) {

								total_apuntes = total_apuntes.subtract((BigDecimal) ((Map) LISTAPU.get(i)).get("DEBE"));

							} else if ((BigDecimal) ((Map) LISTAPU.get(i)).get("HABER") != null) {

								total_apuntes = total_apuntes.add((BigDecimal) ((Map) LISTAPU.get(i)).get("HABER"));

							}

						} else if (((Map) LISTAPU.get(i)).get("NNUMLIN").equals(NUMAPU)
								&& ((Map) LISTAPU.get(i)).get("CH").equals(NCH_Y)) {

							((Map) LISTAPU.get(i)).put("CH", new BigDecimal(0));

							if ((BigDecimal) ((Map) LISTAPU.get(i)).get("DEBE") != null) {

								total_apuntes = total_apuntes.add((BigDecimal) ((Map) LISTAPU.get(i)).get("DEBE"));

							} else if ((BigDecimal) ((Map) LISTAPU.get(i)).get("HABER") != null) {

								total_apuntes = total_apuntes
										.subtract((BigDecimal) ((Map) LISTAPU.get(i)).get("HABER"));

							}
						}
					}
					request.getSession().setAttribute("lista_liquida_apuntes", LISTAPU);
					request.getSession().setAttribute("total_apuntes", total_apuntes);
					request.getSession().setAttribute("total_dif_dg",
							total_documentos.subtract(total_recibos_06).subtract(total_apuntes));

					Map apunte = new HashMap();
					apunte.put("total_apuntes", total_apuntes);
					apunte.put("total_dif_dg", total_documentos.subtract(total_recibos_06).subtract(total_apuntes));

					ajax.rellenarPlAContenedorAjax(apunte);
					ajax.guardarContenidoFinalAContenedorAjax(apunte);
				}
			}
		} catch (Exception e) {
			logger.error("Error en el servicio Axisage031Service - m?todo m_ajax_actualizar_check_apunte", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			this.formattingNumericValues(request);
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	/**
	 * Actualiza recibos, coge el agent del tomador y actualiza la tabla con los
	 * registros de dicho agente y calcula los totales por Ajax.
	 * 
	 * @see Axisctr031Service#actualizar_recibos
	 * @param request El HttpServletRequest que contiene la petici?n del cliente
	 *                web.
	 */
	public void m_actualizar_recibos(HttpServletRequest request, Axisage031Action thisAction) {

		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		BigDecimal EMPRES = getCampoNumerico(request, "CEMPRES_aux");
		// BigDecimal EMPRES = (BigDecimal)request.getSession().getAttribute("CEMPRES");
		BigDecimal AGENTE = getCampoNumerico(request, "AGENTE_aux");
		String NAGENTE = getCampoTextual(request, "NAGENTE_aux");
		BigDecimal TOMADOR = getCampoNumerico(request, "TOMADOR_aux");
		BigDecimal RECIBO = getCampoNumerico(request, "RECIBO");
		BigDecimal SPROLIQ = getCampoNumerico(request, "SPROLIQ_aux");
		request.getSession().setAttribute("SPROLIQ", SPROLIQ);

		try {

			if (formdata.get("paginar") == null) {

				BigDecimal CEMPRES = getCampoNumerico(request, "CEMPRES");
				request.getSession().setAttribute("CEMPRESSEL", CEMPRES);
				Map LISTCAB = (Map) request.getSession().getAttribute("liquida_cabecera");

				BigDecimal CAGENTE = getCampoNumerico(request, "CAGENTE");
				String TAGENTE = getCampoTextual(request, "TAGENTE");
				BigDecimal CESTADO = getCampoNumerico(request, "CESTADO");
				Date FLIQUIDA = stringToSqlDate(getCampoTextual(request, "FLIQUIDA"));
				Date FCOBRO = stringToSqlDate(getCampoTextual(request, "FCOBRO"));
				BigDecimal CTOMADOR = getCampoNumerico(request, "CTOMADOR");
				String CUSUARIO = getCampoTextual(request, "CUSUARIO");
				LISTCAB.put("CESTAUTOLIQ", CESTADO);
				if (AGENTE != null) {
					LISTCAB.put("CAGENTE", AGENTE);
				} else {
					LISTCAB.put("CAGENTE", CAGENTE);
				}
				if (NAGENTE != null) {
					LISTCAB.put("MEDIADOR", NAGENTE);
				} else {
					LISTCAB.put("MEDIADOR", TAGENTE);
				}

				BigDecimal primersproliq = (BigDecimal) LISTCAB.get("SPROLIQ");

				LISTCAB.put("FLIQUID", FLIQUIDA);
				LISTCAB.put("FCOBRO", FCOBRO);
				LISTCAB.put("CTOMADOR", CTOMADOR);
				LISTCAB.put("CUSUARI", CUSUARIO);
				LISTCAB.put("SPROLIQ", SPROLIQ);
				request.getSession().setAttribute("liquida_cabecera", LISTCAB);
				BigDecimal total_recibos_01 = new BigDecimal(0);
				BigDecimal total_recibos_02 = new BigDecimal(0);
				BigDecimal total_recibos_03 = new BigDecimal(0);
				BigDecimal total_recibos_04 = new BigDecimal(0);
				BigDecimal total_recibos_05 = new BigDecimal(0);
				BigDecimal total_recibos_06 = new BigDecimal(0);
				BigDecimal total_recibos_07 = new BigDecimal(0);
				BigDecimal NCH_S = new BigDecimal(1);

				log.debug(EMPRES + " " + CEMPRES);

				if (isEmpty(EMPRES))
					EMPRES = CEMPRES;

				PAC_IAX_AUTOLIQUIDA pacIaxAutoliquida = new PAC_IAX_AUTOLIQUIDA(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
				Map NewRecibosMap = pacIaxAutoliquida.ejecutaPAC_IAX_AUTOLIQUIDA__F_GET_NEW_RECIBOS(SPROLIQ, EMPRES,
						AGENTE, TOMADOR, RECIBO);
				List LISTREC = (List) NewRecibosMap.get("PCCURREC");
				log.debug("actualizar_recibo:" + NewRecibosMap);

				if (TAGENTE != null || NAGENTE != null) {
					Map NewApuntesMap = pacIaxAutoliquida.ejecutaPAC_IAX_AUTOLIQUIDA__F_GET_CTAS(SPROLIQ, EMPRES,
							AGENTE);
					log.debug("actualizar_apuntes:" + NewRecibosMap);
					if (((BigDecimal) tratarRETURNyMENSAJES(request, NewApuntesMap)).intValue() == 0) {

						List PCURCTAS = (List) NewApuntesMap.get("PCURCTAS");
						request.getSession().setAttribute("lista_liquida_apuntes", PCURCTAS);

					}
				} else {
					request.getSession().setAttribute("lista_liquida_apuntes", new ArrayList<Map>());
				}

				if (LISTREC.size() != 0) {

					request.getSession().setAttribute("lista_liquida_recibos", LISTREC);

					for (int i = 0; i < LISTREC.size(); i++) {
						if (((Map) LISTREC.get(i)).get("CH").equals(NCH_S)) {
							total_recibos_01 = total_recibos_01.add((BigDecimal) ((Map) LISTREC.get(i)).get("ITOTALR"));

							if (((Map) LISTREC.get(i)).get("PL").equals(NCH_S)) {
								total_recibos_02 = total_recibos_02
										.add((BigDecimal) ((Map) LISTREC.get(i)).get("COMISION"));
								total_recibos_03 = total_recibos_03
										.add((BigDecimal) ((Map) LISTREC.get(i)).get("IRPF"));
								total_recibos_04 = total_recibos_04
										.add((BigDecimal) ((Map) LISTREC.get(i)).get("LIQUIDO"));
								total_recibos_06 = total_recibos_06
										.add((BigDecimal) ((Map) LISTREC.get(i)).get("LIQUIDO"));
							}
							total_recibos_05 = total_recibos_05.add((BigDecimal) ((Map) LISTREC.get(i)).get("DIF"));
							total_recibos_07 = total_recibos_07.add((BigDecimal) ((Map) LISTREC.get(i)).get("DIFPYG"));
							total_recibos_06 = total_recibos_06.add((BigDecimal) ((Map) LISTREC.get(i)).get("DIF"))
									.add((BigDecimal) ((Map) LISTREC.get(i)).get("DIFPYG"));
						}
					}
					request.getSession().setAttribute("total_recibos_01", total_recibos_01);
					request.getSession().setAttribute("total_recibos_02", total_recibos_02);
					request.getSession().setAttribute("total_recibos_03", total_recibos_03);
					request.getSession().setAttribute("total_recibos_04", total_recibos_04);
					request.getSession().setAttribute("total_recibos_05", total_recibos_05);
					request.getSession().setAttribute("total_recibos_06", total_recibos_06);
					request.getSession().setAttribute("total_recibos_07", total_recibos_07);

				} else {
					request.getSession().setAttribute("lista_liquida_recibos", LISTREC);
					String literal = Traductor.traducir(AxisBaseService.getLocale(request).toString(), "9901229");
					thisAction.guardarMensaje(request, "verbatim:" + literal + ": " + "", null,
							Constantes.MENSAJE_INFO);
				}
				if (!request.getSession().getAttribute("CMODO").equals("ALTA"))
					recargar(request, thisAction, SPROLIQ, EMPRES, CAGENTE, CESTADO);

			}

		} catch (Exception e) {
			log.error("Error", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.formattingNumericValues(request);
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}

	}

	/**
	 * Realiza una b?squeda de agentes por Ajax.
	 * 
	 * @see Axisctr031Service#buscaAgentes
	 * @param request El HttpServletRequest que contiene la petici?n del cliente
	 *                web.
	 */
	public void m_ajax_actualizar_agente(HttpServletRequest request) {

		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		logger.debug("Axisage031Service m_ajax_actualizar_agente");
		AjaxContainerService ajax = new AjaxContainerService();

		try {

			if (formdata.get("paginar") == null) {
				BigDecimal SPROLIQ = this.getCampoNumerico(request, "PASPROLIQ");
				BigDecimal CEMPRES = this.getCampoNumerico(request, "PACEMPRES");
				String CAGENTE = getCampoTextual(request, "PACAGENTE");
				Map m = (Map) this.ActualizaAgente(request, CAGENTE, SPROLIQ, CEMPRES);

				ajax.rellenarPlAContenedorAjax(m);
				ajax.guardarContenidoFinalAContenedorAjax(m);
			}
		} catch (Exception e) {
			logger.error("Error en el servicio Axisage031Service - m?todo m_ajax_actualizar_agente", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			this.formattingNumericValues(request);
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	/**
	 * Carga el agente inicial de la pantalla.
	 * 
	 * @param request El HttpServletRequest que contiene la petici?n del cliente
	 *                web.
	 * @param numero  de agente
	 */
	private Map ActualizaAgente(HttpServletRequest request, String CAGENTE, BigDecimal psproliq, BigDecimal cempres)
			throws Exception {

		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		Map mapAgentes = new HashMap();

		// Cargar Agente de la BD
		Map agente = new HashMap();
		if (!isEmpty(CAGENTE)) {
			UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
			String CONDICION = this.getCampoTextual(request, "CONDICION");
			mapAgentes = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTAGENTES_COND(null, null, new BigDecimal(CAGENTE),
							new BigDecimal(1), CONDICION);
			logger.debug("actualizar_agente:" + mapAgentes);
			List agentes = (List) mapAgentes.get("RETURN");

			if (!isEmpty(mapAgentes.get("RETURN"))) {
				agente = (Map) agentes.get(0);
				request.getSession().setAttribute("CTOMADOR", "");
				request.getSession().setAttribute("TTOMADOR", "");
			}

			PAC_IAX_AUTOLIQUIDA pacIaxAutoliquida = new PAC_IAX_AUTOLIQUIDA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			Map m = pacIaxAutoliquida.ejecutaPAC_IAX_AUTOLIQUIDA__F_DEL_AGENTECLAVE(psproliq, cempres,
					new BigDecimal(CAGENTE));
			BigDecimal RETURN = (BigDecimal) tratarRETURNyMENSAJES(request, m);

		}

		request.getSession().setAttribute("axisage_tagente", agente.get("NOMBRE"));

		return mapAgentes;
	}

	/**
	 * Dado un agente seleccionado en el modal de selecci?n de agentes (axisctr014),
	 * ?ste m?todo recibe el atributo CODI del agente y lo pone en el par?metro de
	 * sesi?n cabecera_agente.
	 * 
	 * @param request El HttpServletRequest que contiene la petici?n del cliente
	 *                web.
	 */
	public void m_ajax_ver_agente(HttpServletRequest request) {

		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		AjaxContainerService ajax = new AjaxContainerService();

		try {

			if (formdata.get("paginar") == null) {

				String CODI = getCampoTextual(request, "CODI");

				if (request.getSession().getAttribute("axisctr014_listaAgentes") != null) {
					List listaAgentes = (List) request.getSession().getAttribute("axisctr014_listaAgentes");
					Map agente = getObjetoDeLista(listaAgentes, CODI, "CODI");

					if (!isEmpty(agente)) {
						ajax.guardarContenidoFinalAContenedorAjax(agente);
						request.getSession().setAttribute("axisage_tagente", agente.get("NOMBRE"));
						request.getSession().setAttribute("CTOMADOR", "");
						request.getSession().setAttribute("TTOMADOR", "");
					}
					listaAgentes = null;
				}
			}
		} catch (Exception e) {
			logger.error("Error", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			this.formattingNumericValues(request);
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	/**
	 * Realiza una b?squeda de personas por Ajax.
	 * 
	 * @see Axisctr031Service#buscaPersonas
	 * @param request El HttpServletRequest que contiene la petici?n del cliente
	 *                web.
	 */
	public void m_ajax_actualizar_persona(HttpServletRequest request) {

		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		logger.debug("Axisage031Service m_ajax_actualizar_persona");
		AjaxContainerService ajax = new AjaxContainerService();

		try {

			if (formdata.get("paginar") == null) {

				String CTOMADOR = getCampoTextual(request, "CTOMADOR");
				Map m = (Map) this.ActualizaPersona(request, CTOMADOR);

				ajax.rellenarPlAContenedorAjax(m);
				ajax.guardarContenidoFinalAContenedorAjax(m);
			}
		} catch (Exception e) {
			logger.error("Error en el servicio Axisage031Service - m?todo m_ajax_actualizar_persona", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			this.formattingNumericValues(request);
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	/**
	 * Carga el persona inicial de la pantalla.
	 * 
	 * @param request El HttpServletRequest que contiene la petici?n del cliente
	 *                web.
	 */
	private Map ActualizaPersona(HttpServletRequest request, String CTOMADOR) throws Exception {

		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		Map mapPersonas = new HashMap();
		// Cargar Agente de la BD
		Map persona = new HashMap();

		if (!isEmpty(CTOMADOR)) {
			String MODO_SWPUBLI = "PERSONAS_PUBPRIV";

			mapPersonas = new PAC_IAX_PERSONA((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_PERSONA__F_GET_PERSONAS_GENERICA_COND(CTOMADOR, null, null, null, null, null, null,
							null, MODO_SWPUBLI, null);

			logger.debug("actualizar_personas:" + mapPersonas);
			List personas = (List) mapPersonas.get("RETURN");

			if (!isEmpty(mapPersonas.get("RETURN"))) {
				persona = (Map) personas.get(0);
				Map LISTCAB = (Map) request.getSession().getAttribute("liquida_cabecera");
				LISTCAB.remove("CAGENTE");
				LISTCAB.remove("MEDIADOR");
				LISTCAB.put("CAGENTE", "");
				LISTCAB.put("MEDIADOR", "");
				request.getSession().setAttribute("liquida_cabecera", LISTCAB);
			}
		}
		request.getSession().setAttribute("TTOMADOR", persona.get("NOMBRE"));
		request.getSession().setAttribute("CTOMADOR", persona.get("NNUMIDE"));

		return mapPersonas;
	}

	/**
	 * Dado un tomador seleccionado en el modal de selecci?n de personas
	 * (axisper008), ?ste m?todo recibe el atributo CODI del tomado y lo pone en el
	 * par?metro de sesi?n TOMADOR.
	 * 
	 * @param request El HttpServletRequest que contiene la petici?n del cliente
	 *                web.
	 */
	public void m_ajax_ver_persona(HttpServletRequest request) {

		logger.debug("Axisage031Service m_ajax_actualizar_persona");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		AjaxContainerService ajax = new AjaxContainerService();

		try {

			if (formdata.get("paginar") == null) {

				BigDecimal SPERSON = this.getCampoNumerico(request, "SPERSON");
				Map map = new PAC_IAX_PERSONA((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_PERSONA__F_GET_PERSONA_PUBLICA(SPERSON);
				logger.debug("get PERSONA()" + map);
				BigDecimal RETURN = (BigDecimal) tratarRETURNyMENSAJES(request, map);
				if (!isEmpty(map) && new BigDecimal(0).equals(RETURN)) {

					Map OB_PERSONA = (Map) map.get("OBPERSONA");
					logger.debug(OB_PERSONA);
					String nombre_completo = "";
					if ((String) OB_PERSONA.get("TNOMBRE") != null) {
						nombre_completo = (String) OB_PERSONA.get("TNOMBRE") + " " + (String) OB_PERSONA.get("TAPELLI1")
								+ " " + (String) OB_PERSONA.get("TAPELLI2");
					} else {
						nombre_completo = (String) OB_PERSONA.get("TAPELLI1");
					}

					request.getSession().setAttribute("CTOMADOR", OB_PERSONA.get("NNUMIDE"));
					request.getSession().setAttribute("TTOMADOR", nombre_completo);
					Map LISTCAB = (Map) request.getSession().getAttribute("liquida_cabecera");
					LISTCAB.remove("CAGENTE");
					LISTCAB.remove("MEDIADOR");
					LISTCAB.put("CAGENTE", "");
					LISTCAB.put("MEDIADOR", "");
					request.getSession().setAttribute("liquida_cabecera", LISTCAB);
					ajax.rellenarPlAContenedorAjax(map);
					ajax.guardarContenidoFinalAContenedorAjax(OB_PERSONA);
				}
			}
		} catch (Exception e) {
			logger.error("Axisctr038Service m_ajax_actualizar_persona - Excepcion", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			this.formattingNumericValues(request);
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

}
