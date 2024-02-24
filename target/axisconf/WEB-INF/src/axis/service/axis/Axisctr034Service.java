//Revision:# 9tyb7tDBCLmeivvrGqn/nw== #
package axis.service.axis;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAXPAR_PRODUCTOS;
import axis.jdbc.PAC_IAX_CFG;
import axis.jdbc.PAC_IAX_DOCREQUERIDA;
import axis.jdbc.PAC_IAX_GESTIONPROPUESTA;
import axis.jdbc.PAC_IAX_INSPECCION;
import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.jdbc.PAC_IAX_PRODUCCION;
import axis.jdbc.PAC_IAX_PSU;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.control.axis.Axisctr034Action;
import axis.mvc.model.UsuarioBean;
import axis.service.modal.Axisctr033Service;
import axis.util.Constantes;

/**
 * Axisctr034Service.java 14/10/2008
 * 
 * @author <a href="rkirchner@csi-ti.com">Roger Kirchner</a>
 * @since Java 5.0
 */
public class Axisctr034Service extends AxisBaseService {
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
	public void m_form(HttpServletRequest request) {
		logger.debug("Axisctr034Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {

			AbstractDispatchAction.removeTopPila(request, "INSPECCION");
			AbstractDispatchAction.removeTopPila(request, "REVISARINSPECC");

			PAC_IAX_GESTIONPROPUESTA pacIaxGestionPropuesta = new PAC_IAX_GESTIONPROPUESTA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map map = pacIaxGestionPropuesta.ejecutaPAC_IAX_GESTIONPROPUESTA__F_GET_NPOLIZAENEMISION();
			logger.debug(map);

			request.setAttribute("NPOLIZAENEMISION", tratarRETURNyMENSAJES(request, map));
			BigDecimal SSEGURO = getCampoNumerico(request, "SSEGURO");
			BigDecimal NMOVIMI = getCampoNumerico(request, "NMOVIMI");
			BigDecimal SPRODUC = getCampoNumerico(request, "SPRODUC");

			if (isEmpty(SPRODUC) && !isEmpty(request.getSession().getAttribute("PRETEN_SPRODUC")))
				SPRODUC = (BigDecimal) (request.getSession().getAttribute("PRETEN_SPRODUC"));
			;

			if (isEmpty(SSEGURO) && !isEmpty(request.getSession().getAttribute("PRETEN_SSEGURO")))
				SSEGURO = (BigDecimal) (request.getSession().getAttribute("PRETEN_SSEGURO"));
			if (isEmpty(NMOVIMI) && !isEmpty(request.getSession().getAttribute("PRETEN_NMOVIMI")))
				NMOVIMI = (BigDecimal) (request.getSession().getAttribute("PRETEN_NMOVIMI"));
			logger.debug("SSEGURO:" + SSEGURO);
			logger.debug("NMOVIMI:" + NMOVIMI);
			// Quitar todo lo que hemos puesto en la pila si hemos saltado y hemos "vuelto"
			AbstractDispatchAction.removeTopPila(request, "CMODO");
			AbstractDispatchAction.removeTopPila(request, "SSEGURO");
			AbstractDispatchAction.removeTopPila(request, "NMOVIMI");
			AbstractDispatchAction.removeTopPila(request, "SPRODUC");
			AbstractDispatchAction.removeTopPila(request, "TTITULO");
			if (!isEmpty(request.getSession().getAttribute("PRETEN_T_IAX_POLIZASRETEN"))) {
				PAC_IAXPAR_PRODUCTOS pacIaxparProductos = new PAC_IAXPAR_PRODUCTOS(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
				logger.debug("SPRODUC:" + SPRODUC);
				if (!isEmpty(SPRODUC)) {
					Map parproducto = pacIaxparProductos.ejecutaPAC_IAXPAR_PRODUCTOS__F_GET_PARPRODUCTO("PSU", SPRODUC);
					logger.debug("parproducto:" + parproducto);

					if (((BigDecimal) this.tratarRETURNyMENSAJES(request, parproducto)).intValue() == 1) {
						formdata.put("permiteModificar", new BigDecimal(0));
						PAC_IAX_PSU pacIaxPsu = new PAC_IAX_PSU(
								(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
						BigDecimal NMOVIMI_psu = isEmpty(NMOVIMI) ? new BigDecimal(1) : NMOVIMI;
						Map col_psu = pacIaxPsu.ejecutaPAC_IAX_PSU__F_GET_COLEC_PSU(SSEGURO, null, null, "POL");

						logger.debug("col_psu:" + col_psu);
						BigDecimal cestpol = new BigDecimal(0);
						formdata.put("CESTPOL_PSU", col_psu.get("P_CESTPOL"));

						if (!isEmpty(col_psu.get("P_CESTPOL"))) {
							cestpol = new BigDecimal(String.valueOf(col_psu.get("P_CESTPOL")));
							// if (cestpol.intValue() == 3)
							// request.getSession().removeAttribute("PRETEN_T_IAX_PSU");
						}
						// se comenta debido al q-tracker : 0008683(lcol)
						// if (cestpol.intValue() != 3){
						try {
							request.setAttribute("PRETEN_T_IAX_PSU", col_psu.get("P_TPSUS"));
							formdata.put("TESTPOL_PSU", col_psu.get("P_TESTPOL"));

							formdata.put("CNIVELBPM_PSU", col_psu.get("P_CNIVELBPM"));
							formdata.put("TNIVELBPM_PSU", col_psu.get("P_TNIVELBPM"));
							if (!isEmpty(col_psu.get("P_CNIVELBPM"))) {
								BigDecimal CNIVELBPM = new BigDecimal(String.valueOf(col_psu.get("P_CNIVELBPM")));

								Map mm = pacIaxPsu.ejecutaPAC_IAX_PSU__F_NIVEL_USUARIO(SSEGURO, "POL");
								logger.debug(mm);
								BigDecimal CNIVEL_USU = new BigDecimal(0);
								if (!isEmpty(mm.get("P_NIVEL")))
									CNIVEL_USU = new BigDecimal(String.valueOf(mm.get("P_NIVEL")));

								if (CNIVEL_USU.intValue() >= CNIVELBPM.intValue())
									formdata.put("permiteModificar", new BigDecimal(1));
								else
									formdata.put("permiteModificar", new BigDecimal(0));

							}
						} catch (Exception e) {
							logger.debug(e.getMessage());
						}
						// }
						formdata.put("TIPODATOS", "PSU");

					}
					parproducto = pacIaxparProductos.ejecutaPAC_IAXPAR_PRODUCTOS__F_GET_PARPRODUCTO("GESTION_IR",
							SPRODUC);
					logger.debug("parproducto:" + parproducto);
					if (((BigDecimal) this.tratarRETURNyMENSAJES(request, parproducto)).intValue() == 1) {

						/* INI SECCION INSPECCIONES RIESGOS */
						PAC_IAX_INSPECCION pac_iax_inspecciones = new PAC_IAX_INSPECCION(
								(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
						Map INSPECCION_RIESGO = new HashMap();
						INSPECCION_RIESGO = (Map) pac_iax_inspecciones
								.ejecutaPAC_IAX_INSPECCION__F_GET_ORD_INSPEC_MOD_CONSULTA(SSEGURO,
										isEmpty(NMOVIMI) ? new BigDecimal(1) : NMOVIMI, new BigDecimal(1));
						logger.debug("INSPECCION_RIESGO m_form:" + INSPECCION_RIESGO);
						ArrayList l_inspeccion_riesgo = (ArrayList) (tratarRETURNyMENSAJES(request, INSPECCION_RIESGO));
						if (!isEmpty(INSPECCION_RIESGO.get("PRESULTADOINSPECCION")))
							request.setAttribute("CRESULTR", INSPECCION_RIESGO.get("PRESULTADOINSPECCION"));

						if (!isEmpty(INSPECCION_RIESGO.get("PNECESITAINSPECCION")))
							request.setAttribute("CINSPREQ", INSPECCION_RIESGO.get("PNECESITAINSPECCION"));
						int size = l_inspeccion_riesgo == null ? 0 : l_inspeccion_riesgo.size();
						if (size > 0) {
							request.setAttribute("INSPECCION_RIESGO", l_inspeccion_riesgo);
						}
					}
					/* FIN SECCION INSPECCIONES RIESGOS */

				}
				Map COBJASE = this.buscaCobjase(request);
				formdata.put("COBJASE", COBJASE.get("COBJASE"));
			} else {
				request.getSession().removeAttribute("PRETEN_T_IAX_PSU");
				formdata.remove("TESTPOL_PSU");
				formdata.remove("CNIVELBPM_PSU");
				formdata.remove("TNIVELBPM_PSU");
				request.removeAttribute("TESTPOL_PSU");
				request.removeAttribute("CNIVELBPM_PSU");
				request.removeAttribute("TNIVELBPM_PSU");
			}

			PAC_IAX_LISTVALORES pac_axis_listValores = new PAC_IAX_LISTVALORES(
					((java.sql.Connection) request.getAttribute(Constantes.DB01CONN)));
			Map listValores = new HashMap();
			// combo si/no
			HashMap mapa_aux = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(9));
			listValores.put("lstInspec1", tratarRETURNyMENSAJES(request, mapa_aux));
			// combo resultado inspecci�n
			mapa_aux = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(755));
			listValores.put("lstInspec2", tratarRETURNyMENSAJES(request, mapa_aux));
			formdata.put("listvalores", listValores);

			////////////////// DATOS POLIZA ////////////////////////////////////
			// BUG 0027876/0153187 - JSV (20/09/2013)
			if (!isEmpty(AbstractDispatchAction.topPila(request, "NRIESGO_034")))
				SSEGURO = null;
			if (SSEGURO != null) {
				PAC_IAX_PRODUCCION pacIaxProduccion = new PAC_IAX_PRODUCCION(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
				map = pacIaxProduccion.ejecutaPAC_IAX_PRODUCCION__F_GET_DATPOLIZA(SSEGURO);
				logger.debug(map);
				Map datosPoliza = (Map) tratarRETURNyMENSAJES(request, map, false);
				BigDecimal CRETENI = (BigDecimal) datosPoliza.get("CRETENI");
				formdata.put("CRETENI", CRETENI);
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr034Service - m�todo m_form", e);
			AbstractDispatchAction.guardarMensaje(request,
					"verbatim:<b>" + e.getClass().getName() + ":</b> " + e.getLocalizedMessage(),
					new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
	}

	/*********************************************************************************************************************/
	/************************************************
	 * M�TODOS DE ACTUALIZACI�N
	 *******************************************/
	/*********************************************************************************************************************/

	/**
	 * 
	 * @param request
	 */
	@SuppressWarnings("all")
	public void borrarAtributosSession(HttpServletRequest request) {
		logger.debug("Axisctr034Service borrarAtributosSession");

		/* Quitar datos de otras b�squedas que hayan quedado en Session */
		Enumeration<String> attributeNames = request.getSession().getAttributeNames();

		while (attributeNames.hasMoreElements()) {
			String attribute = attributeNames.nextElement();
			if (attribute.startsWith("PRETEN_"))
				request.getSession().removeAttribute(attribute);
		}
		this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
	}

	/**
	 * 
	 * @param request
	 */
	@SuppressWarnings("all")
	public void m_cargarMotivos(HttpServletRequest request) {
		logger.debug("Axisctr034Service m_cargarMotivos");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();
		BigDecimal NPOLIZA = getCampoNumerico(request, "NPOLIZA");
		BigDecimal SSEGURO = getCampoNumerico(request, "SSEGURO");
		BigDecimal NMOVIMI = getCampoNumerico(request, "NMOVIMI");
		BigDecimal NSUPLEM = getCampoNumerico(request, "NSUPLEM");
		BigDecimal SPRODUC = getCampoNumerico(request, "SPRODUC");
		BigDecimal NRIESGO = getCampoNumerico(request, "NRIESGO");
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {
			PAC_IAX_PSU pacIaxPsu = new PAC_IAX_PSU((java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			PAC_IAXPAR_PRODUCTOS pacIaxparProductos = new PAC_IAXPAR_PRODUCTOS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map m = null;

			////////////////// DATOS POLIZA //////////////

			Map parproducto = pacIaxparProductos.ejecutaPAC_IAXPAR_PRODUCTOS__F_GET_PARPRODUCTO("GESTION_IR", SPRODUC);
			logger.debug("parproducto:" + parproducto);
			ArrayList l_inspeccion_riesgo = new ArrayList();
			Map INSPECCION_RIESGO = new HashMap();
			if (((BigDecimal) this.tratarRETURNyMENSAJES(request, parproducto)).intValue() == 1) {
				/* INI SECCION INSPECCIONES RIESGOS */
				PAC_IAX_INSPECCION pac_iax_inspecciones = new PAC_IAX_INSPECCION(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

				INSPECCION_RIESGO = (Map) pac_iax_inspecciones.ejecutaPAC_IAX_INSPECCION__F_GET_ORD_INSPEC_MOD_CONSULTA(
						SSEGURO, isEmpty(NMOVIMI) ? new BigDecimal(1) : NMOVIMI, new BigDecimal(1));
				logger.debug("INSPECCION_RIESGO cargamotivos:" + INSPECCION_RIESGO);
				l_inspeccion_riesgo = (ArrayList) (tratarRETURNyMENSAJES(request, INSPECCION_RIESGO));
				if (!isEmpty(INSPECCION_RIESGO.get("PRESULTADOINSPECCION")))
					request.setAttribute("CRESULTR", INSPECCION_RIESGO.get("PRESULTADOINSPECCION"));

				if (!isEmpty(INSPECCION_RIESGO.get("PNECESITAINSPECCION")))
					request.setAttribute("CINSPREQ", INSPECCION_RIESGO.get("PNECESITAINSPECCION"));
				int size = l_inspeccion_riesgo == null ? 0 : l_inspeccion_riesgo.size();
				if (size > 0) {
					request.setAttribute("INSPECCION_RIESGO", l_inspeccion_riesgo);
				}
			}
			/* FIN SECCION INSPECCIONES RIESGOS */
			parproducto = pacIaxparProductos.ejecutaPAC_IAXPAR_PRODUCTOS__F_GET_PARPRODUCTO("PSU", SPRODUC);
			logger.debug("parproducto:" + parproducto);
			if (((BigDecimal) this.tratarRETURNyMENSAJES(request, parproducto)).intValue() == 0) {
				PAC_IAX_GESTIONPROPUESTA pacIaxGestionPropuesta = new PAC_IAX_GESTIONPROPUESTA(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

				Map map = pacIaxGestionPropuesta.ejecutaPAC_IAX_GESTIONPROPUESTA__F_GET_MOTRETENMOV(SSEGURO, NMOVIMI);
				logger.debug(map);

				List PRETEN_T_IAX_POLMVTRETEN = (List) ajax.rellenarPlAContenedorAjax(map);
				request.setAttribute("PRETEN_T_IAX_POLMVTRETEN", PRETEN_T_IAX_POLMVTRETEN);
				if (!isEmpty(l_inspeccion_riesgo))
					PRETEN_T_IAX_POLMVTRETEN.add(INSPECCION_RIESGO);
				ajax.guardarContenidoFinalAContenedorAjax(PRETEN_T_IAX_POLMVTRETEN);

			} else {
				BigDecimal NMOVIMI_psu = isEmpty(NMOVIMI) ? new BigDecimal(1) : NMOVIMI;
				Map col_psu = pacIaxPsu.ejecutaPAC_IAX_PSU__F_GET_COLEC_PSU(SSEGURO, null, null, "POL");

				logger.debug("col_psu:" + col_psu);
				BigDecimal permiteModificar = new BigDecimal(0);
				// Guardamos lo que sea que haya devuelto al contenedor Ajax.
				Object[] resultadoAjax = (Object[]) ajax.rellenarPlAContenedorAjax(col_psu,
						new String[] { "P_TPSUS", "P_TESTPOL", "P_CESTPOL", "P_CNIVELBPM", "P_TNIVELBPM" });
				if (resultadoAjax[0].equals(new BigDecimal(0))) {
					Map PRETEN_T_IAX_PSU = new HashMap();
					PRETEN_T_IAX_PSU.put("PTPSUS", resultadoAjax[1]);
					request.setAttribute("PRETEN_T_IAX_PSU", resultadoAjax[1]);

					Map PTESTPOL = new HashMap();
					PTESTPOL.put("PTESTPOL", resultadoAjax[2]);
					Map PCESTPOL = new HashMap();
					PCESTPOL.put("PCESTPOL", resultadoAjax[3]);
					Map PCNIVELBPM = new HashMap();
					PCNIVELBPM.put("PCNIVELBPM", resultadoAjax[4]);
					Map PTNIVELBPM = new HashMap();
					PTNIVELBPM.put("PTNIVELBPM", resultadoAjax[5]);
					Map TIPODATOS = new HashMap();
					TIPODATOS.put("TIPODATOS", "PSU");

					try {
						BigDecimal CNIVELBPM = new BigDecimal(String.valueOf(resultadoAjax[4]));

						Map mm = pacIaxPsu.ejecutaPAC_IAX_PSU__F_NIVEL_USUARIO(SSEGURO, "POL");

						logger.debug(mm);
						BigDecimal CNIVEL_USU = new BigDecimal(0);
						if (!isEmpty(mm.get("P_NIVEL")))
							CNIVEL_USU = new BigDecimal(String.valueOf(mm.get("P_NIVEL")));

						if (CNIVEL_USU.intValue() >= CNIVELBPM.intValue())
							permiteModificar = new BigDecimal(1);
					} catch (Exception e) {
					}
					Map permiteModificar2 = new HashMap();
					permiteModificar2.put("permiteModificar", permiteModificar);

					List RESULTADO = new ArrayList();
					RESULTADO.add(PRETEN_T_IAX_PSU);
					RESULTADO.add(PTESTPOL);
					RESULTADO.add(PCESTPOL);
					RESULTADO.add(TIPODATOS);
					RESULTADO.add(PCNIVELBPM);
					RESULTADO.add(PTNIVELBPM);
					RESULTADO.add(permiteModificar2);

					Map COBJASE = this.buscaCobjase(request);
					RESULTADO.add(COBJASE);

					if (!isEmpty(INSPECCION_RIESGO.get("PRESULTADOINSPECCION"))) {
						Map CRESULTR = new HashMap();
						CRESULTR.put("CRESULTR", INSPECCION_RIESGO.get("PRESULTADOINSPECCION"));
						RESULTADO.add(CRESULTR);
					}
					if (!isEmpty(INSPECCION_RIESGO.get("PNECESITAINSPECCION"))) {
						Map CINSPREQ = new HashMap();
						CINSPREQ.put("CINSPREQ", INSPECCION_RIESGO.get("PNECESITAINSPECCION"));
						RESULTADO.add(CINSPREQ);
					}

					if (!isEmpty(l_inspeccion_riesgo)) {
						HashMap mmm = new HashMap();
						mmm.put("INSPECCION_RIESGO", INSPECCION_RIESGO);
						RESULTADO.add(mmm);
					}
					Map leeHistPsu = null;
					Map leeHistPsuRet = null;

					ArrayList b = null;
					ArrayList bRetorno = new ArrayList();

					leeHistPsuRet = pacIaxPsu.ejecutaPAC_IAX_PSU__F_LEE_HIS_PSU_RETENIDAS(SSEGURO, null, NRIESGO,
							NMOVIMI);

					if (((BigDecimal) this.tratarRETURNyMENSAJES(request, leeHistPsuRet)).intValue() == 0) {

						b = (ArrayList) leeHistPsuRet.get("P_THIS_PSU_RETENIDAS");

						if (b != null) {
							for (int i = 0; i < b.size(); i++) {

								Map mapa = (Map) b.get(i);
								Map mapa2 = (Map) mapa.get("OB_IAX_PSU_RETENIDAS");

								Iterator it = mapa2.entrySet().iterator();

								Map resultadoPsuRetenida = new HashMap();
								Map resultadoPsuRetenida2 = new HashMap();

								while (it.hasNext()) {
									Map.Entry e = (Map.Entry) it.next();

									resultadoPsuRetenida.put("H" + e.getKey(), e.getValue());

								}

								resultadoPsuRetenida2.put("OB_IAX_PSU_RETENIDAS", resultadoPsuRetenida);
								bRetorno.add(resultadoPsuRetenida2);

							}

						}

					}

					RESULTADO.add(bRetorno);

					logger.debug("RESULTADO : " + RESULTADO);
					ajax.guardarContenidoFinalAContenedorAjax(RESULTADO);
				}
			}
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr034Service - m�todo m_cargarMotivos", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
			request.getSession().setAttribute("PRETEN_NPOLIZA", NPOLIZA);
			request.getSession().setAttribute("PRETEN_SSEGURO", SSEGURO);
			request.getSession().setAttribute("PRETEN_NMOVIMI", NMOVIMI);
			request.getSession().setAttribute("PRETEN_NSUPLEM", NSUPLEM);
			request.getSession().setAttribute("PRETEN_SPRODUC", SPRODUC);
		}
	}

	/*********************************************************************************************************************/
	/*****************************************************
	 * SALTOS DE FLUJO
	 ***********************************************/
	/*********************************************************************************************************************/

	/**
	 * 
	 * @param request
	 */
	@SuppressWarnings("all")
	public void m_consultar(HttpServletRequest request) {
		logger.debug("Axisctr034Service m_consultar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {

			BigDecimal SPRODUC = (BigDecimal) request.getSession().getAttribute("PRETEN_SPRODUC");
			AbstractDispatchAction.topPila(request, "TTITULO",
					tratarRETURNyMENSAJES(request,
							new PAC_IAXPAR_PRODUCTOS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
									.ejecutaPAC_IAXPAR_PRODUCTOS__F_GET_DESCPRODUCTO(SPRODUC)));

			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr034Service - m�todo m_consultar", e);
			AbstractDispatchAction.guardarMensaje(request,
					"verbatim:<b>" + e.getClass().getName() + ":</b> " + e.getLocalizedMessage(),
					new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

	public void m_rechazarTodo(HttpServletRequest request) {
		logger.debug("Axisctr034Service m_rechazarTodo");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {

			BigDecimal SSEGURO = getCampoNumerico(request, "SSEGURO");
			BigDecimal NMOVIMI = getCampoNumerico(request, "NMOVIMI");
			BigDecimal CAUTREC = getCampoNumerico(request, "CAUTREC");
			BigDecimal NOCURRE = getCampoNumerico(request, "NOCURRE");

			PAC_IAX_PSU pacIaxPsu = new PAC_IAX_PSU((java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			Map m = pacIaxPsu.ejecutaPAC_IAX_PSU__F_GESTION_CONTROL(SSEGURO, null, NMOVIMI, null, null, null, CAUTREC,
					null, NOCURRE, null, null, null, null, null, null, "POL", null, null);
			logger.debug(m);

			this.tratarRETURNyMENSAJES(request, m);
			BigDecimal NMOVIMI_psu = isEmpty(NMOVIMI) ? new BigDecimal(1) : NMOVIMI;
			Map col_psu = pacIaxPsu.ejecutaPAC_IAX_PSU__F_GET_COLEC_PSU(SSEGURO, NMOVIMI_psu, null, "POL");

			logger.debug("col_psu:" + col_psu);

			request.getSession().setAttribute("PRETEN_T_IAX_PSU", col_psu.get("P_TPSUS"));
			formdata.put("TESTPOL_PSU", col_psu.get("P_TESTPOL"));
			formdata.put("CESTPOL_PSU", col_psu.get("P_CESTPOL"));
			formdata.put("CNIVELBPM_PSU", col_psu.get("P_CNIVELBPM"));
			formdata.put("TNIVELBPM_PSU", col_psu.get("P_TNIVELBPM"));
			formdata.put("TIPODATOS", "PSU");
			formdata.put("permiteModificar", new BigDecimal(0));
			if (!isEmpty(col_psu.get("P_CNIVELBPM"))) {
				BigDecimal CNIVELBPM = new BigDecimal(String.valueOf(col_psu.get("P_CNIVELBPM")));

				Map mm = pacIaxPsu.ejecutaPAC_IAX_PSU__F_NIVEL_USUARIO(SSEGURO, "POL");
				logger.debug(mm);
				BigDecimal CNIVEL_USU = new BigDecimal(0);
				if (!isEmpty(mm.get("P_NIVEL")))
					CNIVEL_USU = new BigDecimal(String.valueOf(mm.get("P_NIVEL")));

				if (CNIVEL_USU.intValue() >= CNIVELBPM.intValue())
					formdata.put("permiteModificar", new BigDecimal(1));
				else
					formdata.put("permiteModificar", new BigDecimal(0));

			}

			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr034Service - m�todo m_consultar", e);
			AbstractDispatchAction.guardarMensaje(request,
					"verbatim:<b>" + e.getClass().getName() + ":</b> " + e.getLocalizedMessage(),
					new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

	public String m_inspeccionRiesgo(HttpServletRequest request) {
		logger.debug("Axisctr034Service m_inspeccionRiesgo");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {

			PAC_IAX_CFG pacIaxCfg = new PAC_IAX_CFG((java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			PAC_IAX_GESTIONPROPUESTA pacIaxGestionPropuesta = new PAC_IAX_GESTIONPROPUESTA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			BigDecimal SPRODUC = (BigDecimal) request.getSession().getAttribute("PRETEN_SPRODUC");
			BigDecimal SSEGURO = (BigDecimal) request.getSession().getAttribute("PRETEN_SSEGURO");
			String CCAMPO = getCampoTextual(request, "CCAMPO");
			String CMODO = "MODIF_PROP_REVINSPEC";
			/*
			 * if ("BT_SOBREPRIMA".equals(CCAMPO)){ CMODO = "MODIF_PROP_801"; }else if
			 * ("BT_DATOS_AUTO".equals(CCAMPO)){ CMODO = "MODIF_PROP_422"; }else if
			 * ("BT_CONDUCTOR_AUTO".equals(CCAMPO)){ CMODO = "MODIF_PROP_426"; }
			 */
			String CFORM = "AXISCTR034";

			Map map = pacIaxGestionPropuesta.ejecutaPAC_IAX_GESTIONPROPUESTA__F_INICIALIZAR_MODIFICACION(SSEGURO, CMODO,
					CFORM, "BT_REVINSPEC");

			logger.debug(map);
			if (BigDecimal.ZERO.equals(tratarRETURNyMENSAJES(request, map))) {
				AbstractDispatchAction.topPila(request, "SSEGURO", map.get("OESTSSEGURO"));
				AbstractDispatchAction.topPila(request, "MOVIMI", map.get("ONMOVIMI"));
				AbstractDispatchAction.topPila(request, "CMODO", CMODO);
				String ACCION = getCampoTextual(request, "ACCION");
				AbstractDispatchAction.topPila(request, "SSEGUROx", SSEGURO);
				if (!isEmpty(ACCION)) {
					if (ACCION.equals("REVISARINSPECCION"))
						AbstractDispatchAction.topPila(request, "INSPECCION", new BigDecimal(2));
					else if (ACCION.equals("INSPECCION"))
						AbstractDispatchAction.topPila(request, "INSPECCION", new BigDecimal(1));

					AbstractDispatchAction.topPila(request, "REVISARINSPECC", new BigDecimal(1));
				}
				AbstractDispatchAction.topPila(request, "SPRODUC", SPRODUC);
				AbstractDispatchAction.topPila(request, "TTITULO", tratarRETURNyMENSAJES(request,
						new PAC_IAXPAR_PRODUCTOS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
								.ejecutaPAC_IAXPAR_PRODUCTOS__F_GET_DESCPRODUCTO(SPRODUC)));

				map = pacIaxCfg.ejecutaPAC_IAX_CFG__F_GET_FORM_WIZARD(CMODO, SPRODUC, CFORM, CCAMPO,
						BigDecimal.valueOf(2));
				logger.debug(map);

				return (String) tratarRETURNyMENSAJES(request, map);
			}
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
			return null;

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr034Service - m�todo m_inspeccionRiesgo", e);
			AbstractDispatchAction.guardarMensaje(request,
					"verbatim:<b>" + e.getClass().getName() + ":</b> " + e.getLocalizedMessage(),
					new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
			return null;
		}
	}

	public void m_autorizarTodoMenosInspeccion(HttpServletRequest request) {
		logger.debug("Axisctr034Service m_autorizarTodoMenosInspeccion");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {

			BigDecimal SSEGURO = getCampoNumerico(request, "SSEGURO");
			BigDecimal NMOVIMI = getCampoNumerico(request, "NMOVIMI");
			BigDecimal NOCURRE = getCampoNumerico(request, "NOCURRE");
			BigDecimal NRIESGO = getCampoNumerico(request, "NRIESGO");

			PAC_IAX_PSU pacIaxPsu = new PAC_IAX_PSU((java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			PAC_IAX_INSPECCION pac_iax_inspecciones = new PAC_IAX_INSPECCION(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			Map m = pac_iax_inspecciones.ejecutaPAC_IAX_INSPECCION__F_AUTORIZAR_TODO_MENOS_INSPEC("POL", SSEGURO,
					NMOVIMI, NRIESGO, new BigDecimal(1), NOCURRE);
			logger.debug(m);

			this.tratarRETURNyMENSAJES(request, m);
			BigDecimal NMOVIMI_psu = isEmpty(NMOVIMI) ? new BigDecimal(1) : NMOVIMI;
			Map col_psu = pacIaxPsu.ejecutaPAC_IAX_PSU__F_GET_COLEC_PSU(SSEGURO, NMOVIMI_psu, null, "POL");

			logger.debug("col_psu:" + col_psu);

			request.getSession().setAttribute("PRETEN_T_IAX_PSU", col_psu.get("P_TPSUS"));
			formdata.put("TESTPOL_PSU", col_psu.get("P_TESTPOL"));
			formdata.put("CESTPOL_PSU", col_psu.get("P_CESTPOL"));
			formdata.put("CNIVELBPM_PSU", col_psu.get("P_CNIVELBPM"));
			formdata.put("TNIVELBPM_PSU", col_psu.get("P_TNIVELBPM"));
			formdata.put("TIPODATOS", "PSU");
			formdata.put("permiteModificar", new BigDecimal(0));
			if (!isEmpty(col_psu.get("P_CNIVELBPM"))) {
				BigDecimal CNIVELBPM = new BigDecimal(String.valueOf(col_psu.get("P_CNIVELBPM")));

				Map mm = pacIaxPsu.ejecutaPAC_IAX_PSU__F_NIVEL_USUARIO(SSEGURO, "POL");
				logger.debug(mm);
				BigDecimal CNIVEL_USU = new BigDecimal(0);
				if (!isEmpty(mm.get("P_NIVEL")))
					CNIVEL_USU = new BigDecimal(String.valueOf(mm.get("P_NIVEL")));

				if (CNIVEL_USU.intValue() >= CNIVELBPM.intValue())
					formdata.put("permiteModificar", new BigDecimal(1));
				else
					formdata.put("permiteModificar", new BigDecimal(0));

			}
			/* INI SECCION INSPECCIONES RIESGOS */
			Map INSPECCION_RIESGO = new HashMap();
			INSPECCION_RIESGO = (Map) pac_iax_inspecciones.ejecutaPAC_IAX_INSPECCION__F_GET_ORD_INSPEC_MOD_CONSULTA(
					SSEGURO, isEmpty(NMOVIMI) ? new BigDecimal(1) : NMOVIMI, new BigDecimal(1));
			logger.debug("INSPECCION_RIESGO m_form:" + INSPECCION_RIESGO);
			ArrayList l_aux = (ArrayList) (tratarRETURNyMENSAJES(request, INSPECCION_RIESGO));
			if (!isEmpty(INSPECCION_RIESGO.get("PRESULTADOINSPECCION")))
				request.setAttribute("CRESULTR", INSPECCION_RIESGO.get("PRESULTADOINSPECCION"));

			if (!isEmpty(INSPECCION_RIESGO.get("PNECESITAINSPECCION")))
				request.setAttribute("CINSPREQ", INSPECCION_RIESGO.get("PNECESITAINSPECCION"));
			int size = l_aux == null ? 0 : l_aux.size();
			if (size > 0) {
				request.setAttribute("INSPECCION_RIESGO", l_aux);
			}
			Map COBJASE = this.buscaCobjase(request);
			formdata.put("COBJASE", COBJASE.get("COBJASE"));
			/* FIN SECCION INSPECCIONES RIESGOS */

			// se vuelve a recuperar la poliza con los datos actualizados.
			Axisctr033Service axisctr033service = new Axisctr033Service();
			axisctr033service.m_buscar(request);
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr034Service - m�todo m_consultar", e);
			AbstractDispatchAction.guardarMensaje(request,
					"verbatim:<b>" + e.getClass().getName() + ":</b> " + e.getLocalizedMessage(),
					new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

	public void m_autorizarTodo(HttpServletRequest request) {
		logger.debug("Axisctr034Service m_rechazarTodo");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {

			BigDecimal SSEGURO = getCampoNumerico(request, "SSEGURO");
			BigDecimal NMOVIMI = getCampoNumerico(request, "NMOVIMI");
			BigDecimal CAUTREC = getCampoNumerico(request, "CAUTREC");
			BigDecimal NOCURRE = getCampoNumerico(request, "NOCURRE");

			PAC_IAX_PSU pacIaxPsu = new PAC_IAX_PSU((java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			Map m = pacIaxPsu.ejecutaPAC_IAX_PSU__F_GESTION_CONTROL(SSEGURO, null, NMOVIMI, null, null, null, CAUTREC,
					null, NOCURRE, null, null, null, null, null, null, "POL", null, null);
			this.tratarRETURNyMENSAJES(request, m);
			logger.debug(m);
			BigDecimal NMOVIMI_psu = isEmpty(NMOVIMI) ? new BigDecimal(1) : NMOVIMI;
			Map col_psu = pacIaxPsu.ejecutaPAC_IAX_PSU__F_GET_COLEC_PSU(SSEGURO, NMOVIMI_psu, null, "POL");

			logger.debug("col_psu:" + col_psu);

			request.getSession().setAttribute("PRETEN_T_IAX_PSU", col_psu.get("P_TPSUS"));
			formdata.put("TESTPOL_PSU", col_psu.get("P_TESTPOL"));
			formdata.put("CESTPOL_PSU", col_psu.get("P_CESTPOL"));
			formdata.put("CNIVELBPM_PSU", col_psu.get("P_CNIVELBPM"));
			formdata.put("TNIVELBPM_PSU", col_psu.get("P_TNIVELBPM"));
			formdata.put("TIPODATOS", "PSU");
			formdata.put("permiteModificar", new BigDecimal(0));

			if (!isEmpty(col_psu.get("P_CNIVELBPM"))) {
				BigDecimal CNIVELBPM = new BigDecimal(String.valueOf(col_psu.get("P_CNIVELBPM")));

				Map mm = pacIaxPsu.ejecutaPAC_IAX_PSU__F_NIVEL_USUARIO(SSEGURO, "POL");
				logger.debug(mm);
				BigDecimal CNIVEL_USU = new BigDecimal(0);
				if (!isEmpty(mm.get("P_NIVEL")))
					CNIVEL_USU = new BigDecimal(String.valueOf(mm.get("P_NIVEL")));

				if (CNIVEL_USU.intValue() >= CNIVELBPM.intValue())
					formdata.put("permiteModificar", new BigDecimal(1));
				else
					formdata.put("permiteModificar", new BigDecimal(0));

			}
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr034Service - m�todo m_consultar", e);
			AbstractDispatchAction.guardarMensaje(request,
					"verbatim:<b>" + e.getClass().getName() + ":</b> " + e.getLocalizedMessage(),
					new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

	/**
	 * 
	 * @param request
	 * @return String
	 */
	@SuppressWarnings("all")
	public String m_modificar(HttpServletRequest request) {
		logger.debug("Axisctr034Service m_modificar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {

			PAC_IAX_CFG pacIaxCfg = new PAC_IAX_CFG((java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			PAC_IAX_GESTIONPROPUESTA pacIaxGestionPropuesta = new PAC_IAX_GESTIONPROPUESTA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			BigDecimal SPRODUC = (BigDecimal) request.getSession().getAttribute("PRETEN_SPRODUC");
			BigDecimal SSEGURO = (BigDecimal) request.getSession().getAttribute("PRETEN_SSEGURO");
			String CCAMPO = getCampoTextual(request, "CCAMPO");

			BigDecimal NCERTIF = null;
			int result = 0;
			if (SSEGURO != null) {
				PAC_IAX_PRODUCCION pacIaxProduccion = new PAC_IAX_PRODUCCION(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
				Map map = pacIaxProduccion.ejecutaPAC_IAX_PRODUCCION__F_GET_DATPOLIZA(SSEGURO);
				logger.debug(map);
				Map datosPoliza = (Map) tratarRETURNyMENSAJES(request, map, false);
				NCERTIF = (BigDecimal) datosPoliza.get("NCERTIF");

				Map parproducto = new PAC_IAXPAR_PRODUCTOS(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAXPAR_PRODUCTOS__F_GET_PARPRODUCTO("ADMITE_CERTIFICADOS", SPRODUC);
				result = ((BigDecimal) this.tratarRETURNyMENSAJES(request, parproducto)).intValue();

				logger.debug("-----> NCERTIF:" + NCERTIF + " result:" + result);
			}

			String CMODO = "MODIF_PROP_288";
			if ("BT_SOBREPRIMA".equals(CCAMPO)) {

				if (!isEmpty(NCERTIF)) {
					if (NCERTIF.equals(new BigDecimal(0)) && result == 1) {
						CMODO = "MODIF_PROP_801_COLECT";
					} else {
						CMODO = "MODIF_PROP_801";
					}
				} else {
					CMODO = "MODIF_PROP_801";
				}
			} else if ("BT_DATOS_AUTO".equals(CCAMPO)) {
				CMODO = "MODIF_PROP_422";
			} else if ("BT_CONDUCTOR_AUTO".equals(CCAMPO)) {
				CMODO = "MODIF_PROP_426";
			} else if ("BT_MEDICAL_EVIDENCES".equals(CCAMPO)) {
				CMODO = "MODIF_PROP_970";
			} else if ("BT_CONTRAGARAN".equals(CCAMPO)) {
				CMODO = "MODIF_PROP_CGA";
			}

			String CFORM = "AXISCTR034";

			Map map = pacIaxGestionPropuesta.ejecutaPAC_IAX_GESTIONPROPUESTA__F_INICIALIZAR_MODIFICACION(SSEGURO, CMODO,
					CFORM, CCAMPO);

			logger.debug(map);

			if (BigDecimal.ZERO.equals(tratarRETURNyMENSAJES(request, map))) {
				// BUG 0027876/0153187 - JSV (20/09/2013)
				AbstractDispatchAction.topPila(request, "NRIESGO_034", "1");

				AbstractDispatchAction.topPila(request, "SSEGURO", map.get("OESTSSEGURO"));
				AbstractDispatchAction.topPila(request, "MOVIMI", map.get("ONMOVIMI"));
				AbstractDispatchAction.topPila(request, "CMODO", CMODO);
				AbstractDispatchAction.topPila(request, "SPRODUC", SPRODUC);
				AbstractDispatchAction.topPila(request, "TTITULO", tratarRETURNyMENSAJES(request,
						new PAC_IAXPAR_PRODUCTOS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
								.ejecutaPAC_IAXPAR_PRODUCTOS__F_GET_DESCPRODUCTO(SPRODUC)));

				map = pacIaxCfg.ejecutaPAC_IAX_CFG__F_GET_FORM_WIZARD(CMODO, SPRODUC, CFORM, CCAMPO,
						BigDecimal.valueOf(2));
				logger.debug(map);

				return (String) tratarRETURNyMENSAJES(request, map);
			}
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
			return null;

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr034Service - m�todo m_modificar", e);
			AbstractDispatchAction.guardarMensaje(request,
					"verbatim:<b>" + e.getClass().getName() + ":</b> " + e.getLocalizedMessage(),
					new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
			return null;
		}
	}

	/**
	 * 
	 * @param request
	 * @return String
	 */
	@SuppressWarnings("all")
	public void m_editar(HttpServletRequest request, Axisctr034Action thisAction) {
		logger.debug("Axisctr034Service m_editar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {
			// Push de los datos necesarios a la pila
			thisAction.topPila(request, "formdata_axisctr034", formdata);

			// Passformdata: Map "destinado" a convertirse en el "nuevo" formdata
			Map passformdata = new HashMap();
			passformdata.put("SSEGURO", formdata.get("SSEGURO"));
			passformdata.put("NRIESGO", new BigDecimal(1));
			passformdata.put("SPRODUC", formdata.get("SPRODUC"));
			passformdata.put("CESTPOL", "RET");

			if (usuario.getCagente() != null)
				passformdata.put("CAGENTE_TEXT", usuario.getCagente().toString());
			passformdata.put("CMODO", "ALTA_POLIZA");

			logger.debug(thisAction.topPila(request));
			logger.debug(formdata.get("SPRODUC"));
			HashMap MapTitulo = (HashMap) new PAC_IAXPAR_PRODUCTOS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAXPAR_PRODUCTOS__F_GET_DESCPRODUCTO(
							new BigDecimal(String.valueOf(formdata.get("SPRODUC"))));
			logger.debug("TITTULO :: " + MapTitulo.get("RETURN"));
			passformdata.put("TTITULO", MapTitulo.get("RETURN"));

			logger.debug(thisAction.topPila(request));

			logger.debug("axisctr034 passformdata:" + passformdata);
			request.setAttribute(Constantes.PASSFORMDATA, passformdata);
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		} catch (Exception e) {
			logger.error("Error en el servicio axisctr034Service - m�todo m_editar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

	public void m_ajax_guardar(HttpServletRequest request) {
		logger.debug("Axisctr034Service m_ajax_guardar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();

		try {
			/* Recuperar el SSEGURO */
			BigDecimal SSEGURO = (BigDecimal) AbstractDispatchAction.topPila(request, "SSEGURO");
			Map map = new PAC_IAX_GESTIONPROPUESTA((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_GESTIONPROPUESTA__F_GRABAR_ALTA_POLIZA(SSEGURO);
			logger.debug(map);
			ajax.rellenarPlAContenedorAjax(map);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr024Service - m�todo m_aceptar_modif_prop", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	public void m_ajax_haycontrolesmanuales(HttpServletRequest request) {
		logger.debug("Axisctr034Service m_ajax_haycontrolesmanuales");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();

		try {
			/* Recuperar el SSEGURO */
			BigDecimal SSEGURO = this.getHiddenCampoNumerico(request, "SSEGURO");
			if (isEmpty(SSEGURO) && !isEmpty(AbstractDispatchAction.topPila(request, "SSEGURO")))
				SSEGURO = (BigDecimal) AbstractDispatchAction.topPila(request, "SSEGURO");

			PAC_IAX_PSU pacIaxPsu = new PAC_IAX_PSU((java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			Map map = pacIaxPsu.ejecutaPAC_IAX_PSU__F_HAY_CONTROLES_MANUALES(SSEGURO, "POL");
			logger.debug(map);
			ajax.guardarContenidoFinalAContenedorAjax(ajax.rellenarPlAContenedorAjax(map));

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr024Service - m�todo m_ajax_haycontrolesmanuales", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());

		}
	}

	public void m_ajax_valdocrequerida(HttpServletRequest request) {
		logger.debug("Axisctr034Service m_ajax_valdocrequerida");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();

		try {
			// Recuperem l'sseguro
			////////////////// DATOS POLIZA //////////////
			PAC_IAX_PRODUCCION pacIaxProduccion = new PAC_IAX_PRODUCCION(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			BigDecimal pSSEGURO = getCampoNumerico(request, "SSEGURO");
			HashMap datPoliza = pacIaxProduccion.ejecutaPAC_IAX_PRODUCCION__F_GET_DATPOLIZA(pSSEGURO);
			logger.debug("DATOS POLIZA: " + datPoliza);
			tratarRETURNyMENSAJES(request, datPoliza);
			Map datos_poliza = (Map) datPoliza.get("RETURN");

			// Borrem per si de cas el sseguro_out
			AbstractDispatchAction.topPila(request, "SSEGURO_OUT", null);
			// BUG 27532_0148290 - 20130709 - ECP Desde aqui se comenta lo siguiente
			// BigDecimal pNMOVIMI =
			// (datos_poliza.get("NMOVIMI") != null) ?
			// (BigDecimal)datos_poliza.get("NMOVIMI") :
			// new BigDecimal(1);

			BigDecimal pNMOVIMI = getCampoNumerico(request, "NMOVIMI");
			BigDecimal pNMOVIMI_DOC = isEmpty(pNMOVIMI) ? new BigDecimal(1) : pNMOVIMI;
			// BUG 27532_0148290 - 20130709 - ECP Hasta aqui

			if (isEmpty(pNMOVIMI)) {
				pNMOVIMI = (datos_poliza.get("NMOVIMI") != null) ? (BigDecimal) datos_poliza.get("NMOVIMI")
						: new BigDecimal(1);
			}
			BigDecimal pSPRODUC = (datos_poliza.get("SPRODUC") != null) ? (BigDecimal) datos_poliza.get("SPRODUC")
					: null;
			BigDecimal pCACTIVI = (datos_poliza.get("CACTIVI") != null) ? (BigDecimal) datos_poliza.get("CACTIVI")
					: null;
			PAC_IAX_DOCREQUERIDA pacIaxrequerida = new PAC_IAX_DOCREQUERIDA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map map = pacIaxrequerida.ejecutaPAC_IAX_DOCREQUERIDA__F_DOCREQ_PENDIENTE(pSSEGURO, pNMOVIMI, pSPRODUC,
					pCACTIVI);
			logger.debug("ejecutaPAC_IAX_DOCREQUERIDA__F_DOCREQ_PENDIENTE: " + map);
			ajax.rellenarPlAContenedorAjax(map);
			ajax.guardarContenidoFinalAContenedorAjax(map);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr009Service - m�todo m_enviarCorreo", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	public void m_cuadro(HttpServletRequest request, Axisctr034Action thisAction) {
		logger.debug("Axisctr034Service m_cuadro");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		try {
			BigDecimal SSEGURO = getCampoNumerico(request, "SSEGURO");
			BigDecimal NMOVIMI = getCampoNumerico(request, "NMOVIMI");
			Map map = new PAC_IAX_PRODUCCION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_PRODUCCION__F_CREAR_FACUL(SSEGURO, NMOVIMI);
			// Faltar� cambiar por la nueva funci�n: PERMITE ANULAR PROPUESTA
			logger.debug(map);
			BigDecimal rechazar = (BigDecimal) tratarRETURNyMENSAJES(request, map);

			/*
			 * if (rechazar.intValue() == 1) { // Si el mensaje de vuelta es 1: abrimos
			 * ventana modal request.setAttribute("PermisoAnulacion", "1"); }
			 */

		} catch (Exception e) {
			logger.error("Error en el servicio axisctr034Service - m�todo m_cuadro", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
	}

	private Map buscaCobjase(HttpServletRequest request) throws Exception {

		// Recuperar Productos segun ramo seleccionado
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();

		BigDecimal SPRODUC = getCampoNumerico(request, "SPRODUC");

		if (isEmpty(SPRODUC) && !isEmpty(request.getSession().getAttribute("PRETEN_SPRODUC")))
			SPRODUC = (BigDecimal) (request.getSession().getAttribute("PRETEN_SPRODUC"));

		Map map = new PAC_IAXPAR_PRODUCTOS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAXPAR_PRODUCTOS__F_GET_DEFPRODUCTO(SPRODUC);
		Map plCOBJASE = (HashMap) ajax.rellenarPlAContenedorAjax(map);

		return plCOBJASE;
	}

	/*
	 * public void m_emitir_propuesta(HttpServletRequest request, Axisctr018Action
	 * thisAction) { logger.debug("Axisctr018Service m_emitir_propuesta");
	 * UsuarioBean usuario =
	 * (UsuarioBean)request.getSession().getAttribute(Constantes.USUARIO); HashMap
	 * formdata = (HashMap)request.getAttribute(Constantes.FORMDATA);
	 * 
	 * try{
	 * 
	 * BigDecimal NMOVIMI = getCampoNumerico(request, "NMOVIMI"); BigDecimal SSEGURO
	 * = getCampoNumerico(request, "SSEGURO");
	 * 
	 * PAC_IAX_PRODUCCION pacIaxProduccion=new
	 * PAC_IAX_PRODUCCION((java.sql.Connection)request.getAttribute(Constantes.
	 * DB01CONN)); HashMap m=null; // EMITIR PROPUESTA // m =
	 * pacIaxProduccion.ejecutaPAC_IAX_PRODUCCION__F_EMITIRPROPUESTA(SSEGURO,NMOVIMI
	 * ); BigDecimal emitirPropuesta = (BigDecimal) tratarRETURNyMENSAJES (request,
	 * m); if (emitirPropuesta.intValue()==0) { formdata.remove("SSEGURO"); }
	 * logger.debug (emitirPropuesta);
	 * 
	 * renovarLista(request, thisAction);
	 * 
	 * } catch (Exception e) { logger.
	 * error("Error en el servicio Axisctr018Service - m�todo m_emitir_propuesta",
	 * e); thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString()
	 * }, Constantes.MENSAJE_ERROR); }
	 * 
	 * }
	 */

	public void m_autorizarEmitir(HttpServletRequest request) throws Exception {
		logger.debug("Axisctr034Service m_autorizarEmitir");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {

			BigDecimal SSEGURO = getCampoNumerico(request, "SSEGURO");
			BigDecimal NMOVIMI = getCampoNumerico(request, "NMOVIMI");
			BigDecimal CAUTREC = getCampoNumerico(request, "CAUTREC");
			BigDecimal NOCURRE = getCampoNumerico(request, "NOCURRE");

			PAC_IAX_PRODUCCION pacIaxProduccion = new PAC_IAX_PRODUCCION(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map ma = pacIaxProduccion.ejecutaPAC_IAX_PRODUCCION__F_SET_CONSULTAPOLIZA(SSEGURO);
			logger.debug(ma);
			tratarRETURNyMENSAJES(request, ma, false);

			Map me = pacIaxProduccion.ejecutaPAC_IAX_PRODUCCION__F_GET_DATPOLIZA(SSEGURO);
			logger.debug("DATOS POLIZA: " + me);
			tratarRETURNyMENSAJES(request, me);
			Map datos_poliza = (Map) me.get("RETURN");

			PAC_IAX_PSU pacIaxPsu = new PAC_IAX_PSU((java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			Map map = pacIaxPsu.ejecutaPAC_IAX_PSU__F_GESTION_CONTROL(SSEGURO, null, NMOVIMI, null, null, null, CAUTREC,
					null, NOCURRE, null, null, null, null, null, null, "POL", null, null);
			this.tratarRETURNyMENSAJES(request, map);
			logger.debug(map);
			BigDecimal NMOVIMI_psu = isEmpty(NMOVIMI) ? new BigDecimal(1) : NMOVIMI;
			Map col_psu = pacIaxPsu.ejecutaPAC_IAX_PSU__F_GET_COLEC_PSU(SSEGURO, NMOVIMI_psu, null, "POL");

			logger.debug("col_psu:" + col_psu);

			request.getSession().setAttribute("PRETEN_T_IAX_PSU", col_psu.get("P_TPSUS"));
			formdata.put("TESTPOL_PSU", col_psu.get("P_TESTPOL"));
			formdata.put("CESTPOL_PSU", col_psu.get("P_CESTPOL"));
			formdata.put("CNIVELBPM_PSU", col_psu.get("P_CNIVELBPM"));
			formdata.put("TNIVELBPM_PSU", col_psu.get("P_TNIVELBPM"));
			formdata.put("TIPODATOS", "PSU");
			formdata.put("permiteModificar", new BigDecimal(0));

			if (!isEmpty(col_psu.get("P_CNIVELBPM"))) {
				BigDecimal CNIVELBPM = new BigDecimal(String.valueOf(col_psu.get("P_CNIVELBPM")));

				Map mm = pacIaxPsu.ejecutaPAC_IAX_PSU__F_NIVEL_USUARIO(SSEGURO, "POL");
				logger.debug(mm);
				BigDecimal CNIVEL_USU = new BigDecimal(0);
				if (!isEmpty(mm.get("P_NIVEL")))
					CNIVEL_USU = new BigDecimal(String.valueOf(mm.get("P_NIVEL")));

				if (CNIVEL_USU.intValue() >= CNIVELBPM.intValue())
					formdata.put("permiteModificar", new BigDecimal(1));
				else
					formdata.put("permiteModificar", new BigDecimal(0));

			}
			// aceptar propuesta

			PAC_IAX_GESTIONPROPUESTA pacIaxGestionPropuesta = new PAC_IAX_GESTIONPROPUESTA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			String TOBSERV = "Autorizacion Automatica";

			// Bug 0027262/0027262 - 14/08/2013 - RCL - Autorzaci�n masiva propuestas
			// retenidas

			// java.sql.Date FEFECTO = new java.sql.Date( new
			// SimpleDateFormat("yyyy-MM-dd").parse
			// (String.valueOf(request.getSession().getAttribute("PRETEN_FEFECTO_OUT"))).getTime()
			// );
			// java.sql.Date FEFECTO = stringToSqlDate(getCampoTextual(request, "FEFECTO"));
			java.sql.Date FEFECTO = new java.sql.Date(Calendar.getInstance().getTime().getTime());

			logger.debug("PARAMS :: " + SSEGURO + "::" + NMOVIMI + "::" + FEFECTO);

			Map mapA = pacIaxGestionPropuesta.ejecutaPAC_IAX_GESTIONPROPUESTA__F_ACEPTARPROPUESTA(SSEGURO, NMOVIMI,
					FEFECTO, TOBSERV);

			logger.debug(mapA);

			if (((BigDecimal) tratarRETURNyMENSAJES(request, mapA)).intValue() == 0) {
				request.setAttribute("OK_acceptar", "0");

			}

			// emitir propuesta

			// EMITIR PROPUESTA //
			Map m = pacIaxProduccion.ejecutaPAC_IAX_PRODUCCION__F_EMITIRPROPUESTA(SSEGURO, NMOVIMI);
			logger.debug(m);
			BigDecimal emitirPropuesta = (BigDecimal) tratarRETURNyMENSAJES(request, m);
			if (emitirPropuesta.intValue() == 0) {
				formdata.remove("SSEGURO");
				request.setAttribute("OK_POL", "OK");

				// Bug 38217-220860 - 18/04/2016
				request.setAttribute("SSEGURO_IMP", SSEGURO);
				ArrayList m2 = (ArrayList) m.get("MENSAJES");
				Map m3 = (Map) m2.get(0);
				Map m4 = (Map) m3.get("OB_IAX_MENSAJES");
				request.setAttribute("MENSAJES", m4.get("TERROR"));
			}
			logger.debug(emitirPropuesta);
			// Guardamos lo que sea que haya devuelto al contenedor Ajax.
			Axisctr033Service axisctr033service = new Axisctr033Service();
			axisctr033service.m_buscar(request);
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr034Service - m�todo m_autorizarEmitir", e);
			AbstractDispatchAction.guardarMensaje(request,
					"verbatim:<b>" + e.getClass().getName() + ":</b> " + e.getLocalizedMessage(),
					new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

	public void m_psucontrolseg_ajax(HttpServletRequest request) {
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		AjaxContainerService ajax = new AjaxContainerService();

		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		Map leeHistPsu = null;

		try {
			HashMap miDataObject = new HashMap();

			BigDecimal SSEGURO = getCampoNumerico(request, "SSEGURO");
			BigDecimal NMOVIMI = getCampoNumerico(request, "NMOVIMI");
			BigDecimal NRIESGO = getCampoNumerico(request, "NRIESGO");
			BigDecimal pP_NVERSION = getCampoNumerico(request, "NVERSION");
			List b = null;
			PAC_IAX_PSU pacIaxPsu = new PAC_IAX_PSU((java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			leeHistPsu = pacIaxPsu.ejecutaPAC_IAX_PSU__F_LEE_HIS_PSUCONTROLSEG(SSEGURO, pP_NVERSION, NRIESGO, NMOVIMI,
					null);

			if (((BigDecimal) this.tratarRETURNyMENSAJES(request, leeHistPsu)).intValue() == 0) {

				b = (List) leeHistPsu.get("P_THIS_PSUCONTROLSEG");
			}

			List RESULTADO = new ArrayList();
			RESULTADO.add(b);

			ajax.guardarContenidoFinalAContenedorAjax(RESULTADO);

		} catch (Exception e) {
			logger.error("Error en el servicio axisctr018Service - m�todo m_ajax_cargar_motivos", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

}
