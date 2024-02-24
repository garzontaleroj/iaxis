//Revision:# 6Lg1fjFFTc1A4ehrVi6c5A== #
package axis.service.modal;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_DIRECCIONES;
import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.jdbc.PAC_IAX_PRODUCCION;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AjaxContainerService;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;
import axis.util.ConversionUtil;

/**
 * Axisdir002Service.java 03/04/2012
 * 
 * @author <a href="amartinez@csi-ti.com">Alex Martinez</a>
 * @since Java 5.0
 */
public class Axisdir002Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE INICIALIZACION
	 *******************************************/
	/*********************************************************************************************************************/

	/**
	 * Carga de los riesgos a mostrar en la pantalla.
	 * 
	 * @param request
	 */
	@SuppressWarnings("all")
	public void m_form(HttpServletRequest request) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		logger.debug("Axisdir002Service m_form");
		PAC_IAX_DIRECCIONES pac_iax_direcciones = null;
		PAC_IAX_LISTVALORES pac_iax_listvalores = null;

		try {

			pac_iax_direcciones = new PAC_IAX_DIRECCIONES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			pac_iax_listvalores = new PAC_IAX_LISTVALORES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			String MODO = getCampoTextual(request, "MODO");
			formdata.put("MODO", MODO);
			BigDecimal NRIESGO = getCampoNumerico(request, "NRIESGO");
			BigDecimal UNICO = getCampoNumerico(request, "UNICO");
			logger.debug("------------------------------>" + UNICO);

			/* Si NRIESGO viene informado, estamos editando, recuperar datos del riesgo */
			if (!isEmpty(NRIESGO) || !isEmpty(UNICO)) {

				if (isEmpty(NRIESGO) && !isEmpty(UNICO))
					NRIESGO = UNICO;

				Map map = new PAC_IAX_PRODUCCION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_PRODUCCION__F_GET_RIESGO(NRIESGO);
				tratarRETURNyMENSAJES(request, map);
				logger.debug(map);
				Map OB_IAX_RIESGO = (Map) tratarRETURNyMENSAJES(request, map);
				logger.debug(
						"---------------------------> " + ConversionUtil.printAsXML(OB_IAX_RIESGO, "OB_IAX_RIESGO"));

				/* Recuperar su RIESDIRECCION y NRIESGO y ponerlos en formdata */
				if (!isEmpty(OB_IAX_RIESGO)) {
					Map RIESDIRECCION = (Map) OB_IAX_RIESGO.get("RIESDIRECCION");
					logger.debug("----> RIESDIRECCION:" + RIESDIRECCION);
					if (!isEmpty(RIESDIRECCION)) {

						List DOMICILIOS = (List) RIESDIRECCION.get("DOMICILIOS");
						logger.debug("----> DOMICILIOS:" + DOMICILIOS);

						if (!isEmpty(DOMICILIOS)) {

							ArrayList RESULTADOSBUSQUEDA = new ArrayList();
							ArrayList LISTAPORTALES = new ArrayList();
							ArrayList LISTADEPART = new ArrayList();

							Map DOMICILIO = (Map) DOMICILIOS.get(0);
							logger.debug("----> domicilio:" + DOMICILIO);
							Map DOMI = (Map) DOMICILIO.get("OB_IAX_DIR_DOMICILIOS");

							logger.debug("----> OB_IAX_DIR_FINCAS:" + DOMI);

							Map fincas = pac_iax_direcciones
									.ejecutaPAC_IAX_DIRECCIONES__F_GET_FINCA((BigDecimal) DOMI.get("IDFINCA"));
							logger.debug("---> finca:" + fincas);
							if (!isEmpty(fincas)) {
								ArrayList finca = (ArrayList) fincas.get("RETURN");
								HashMap f = (HashMap) finca.get(0);
								logger.debug("---> f:" + f);

								Map OB_IAX_DIR_FINCAS = new HashMap();
								OB_IAX_DIR_FINCAS.put("IDFINCA", f.get("IDFINCA"));
								OB_IAX_DIR_FINCAS.put("CCATAST", f.get("CCATAST"));
								OB_IAX_DIR_FINCAS.put("CNOASEG", f.get("CNOASEG"));
								OB_IAX_DIR_FINCAS.put("TNOASEG", f.get("TNOASEG"));
								OB_IAX_DIR_FINCAS.put("CPOSTALFIN", f.get("CPOSTAL"));
								OB_IAX_DIR_FINCAS.put("CPAISFIN", f.get("CPAIS"));
								OB_IAX_DIR_FINCAS.put("CPROVINFIN", f.get("CPROVIN"));
								OB_IAX_DIR_FINCAS.put("CPOBLACFIN", f.get("CPOBLAC"));
								OB_IAX_DIR_FINCAS.put("CTIPVIAFIN", f.get("CTIPVIA"));
								OB_IAX_DIR_FINCAS.put("CSIGLASFIN", f.get("CSIGLAS"));
								OB_IAX_DIR_FINCAS.put("TCALLEFIN", f.get("TCALLE"));
								OB_IAX_DIR_FINCAS.put("NDESDEFIN", f.get("NDESDE"));
								OB_IAX_DIR_FINCAS.put("TDESDEFIN", f.get("TDESDE"));
								OB_IAX_DIR_FINCAS.put("CPOSTALFIN", f.get("CPOSTAL"));
								OB_IAX_DIR_FINCAS.put("TLOCALIFIN", f.get("TLOCALI"));
								OB_IAX_DIR_FINCAS.put("TPOBLACFIN", f.get("TPOBLAC"));
								OB_IAX_DIR_FINCAS.put("TPROVINFIN", f.get("TPROVIN"));
								OB_IAX_DIR_FINCAS.put("TPAISFIN", f.get("TPAIS"));
								OB_IAX_DIR_FINCAS.put("TFUENTEFIN", f.get("TFUENTE"));

								HashMap m = new HashMap();
								m.put("OB_IAX_DIR_FINCAS", OB_IAX_DIR_FINCAS);
								RESULTADOSBUSQUEDA.add(m);
								logger.debug("----> RESULTADOSBUSQUEDA:" + RESULTADOSBUSQUEDA);

								if (!isEmpty(DOMI.get("IDFINCA")) && !isEmpty(DOMI.get("IDPORTAL"))) {
									for (int i = 0; i < DOMICILIOS.size(); i++) {

										Map domicilio = (Map) DOMICILIOS.get(i);
										logger.debug("----> domicilio:" + DOMICILIO);
										Map domi = (Map) domicilio.get("OB_IAX_DIR_DOMICILIOS");
										Map portal = pac_iax_direcciones
												.ejecutaPAC_IAX_DIRECCIONES__F_GET_BUSQUEDAPORTAL(
														(BigDecimal) domi.get("IDFINCA"),
														(BigDecimal) domi.get("IDPORTAL"));

										logger.debug("---->1 portal:" + portal);
										tratarRETURNyMENSAJES(request, portal);
										if (portal.get("RETURN").equals(new BigDecimal(0))) {
											logger.debug("----> portal:" + portal.get("PPORTAL"));
											Map OB_IAX_DIR_PORTALES = new HashMap();
											OB_IAX_DIR_PORTALES = (Map) portal.get("PPORTAL");

											HashMap n = new HashMap();
											n.put("OB_IAX_DIR_PORTALES", OB_IAX_DIR_PORTALES);
											LISTAPORTALES.add(n);

											if (!isEmpty(domi.get("CPLANTA"))) {
												Map domici = pac_iax_direcciones
														.ejecutaPAC_IAX_DIRECCIONES__F_GET_DEPARTAMENTO(
																(BigDecimal) domi.get("IDDOMICI"));
												logger.debug("----> domici:" + domici);
												tratarRETURNyMENSAJES(request, portal);
												if (domici.get("RETURN").equals(new BigDecimal(0))) {

													HashMap y = new HashMap();
													y.put("LISTADEPART", domici.get("PDOMICI"));
													formdata.put("LISTADEPART", y);
												}
											}

										}
									}

								}
							}
							formdata.put("RESULTADOSBUSQUEDA", RESULTADOSBUSQUEDA);
							formdata.put("LISTAPORTALES", LISTAPORTALES);

						}
					}
				}

				// formdata.put("NRIESGO", NRIESGO);
			}

			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		} catch (Exception e) {
			logger.error("Error en el servicioAxisdir000Service - m�todo m_form", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
	}

	/**
	 * Guarda la pantalla y determina la pantalla anterior a ejecutar.
	 * 
	 * @param request
	 */
	public void m_buscar_direcciones(HttpServletRequest request) {

		BigDecimal CTIPVIA = getCampoNumerico(request, "CTIPVIA");
		BigDecimal NDESDE = getCampoNumerico(request, "NDESDE");
		BigDecimal NHASTA = getCampoNumerico(request, "NHASTA");
		BigDecimal CTIPFINCA = getCampoNumerico(request, "CTIPFINCA");
		BigDecimal CPAIS = getCampoNumerico(request, "CPAIS");
		BigDecimal CPROVIN = getCampoNumerico(request, "CPROVIN");
		BigDecimal CPOBLAC = getCampoNumerico(request, "CPOBLAC");
		BigDecimal CLOCALIDAD = getCampoNumerico(request, "CLOCALIDAD");
		BigDecimal ESCALERA = getCampoNumerico(request, "ESCALERA");
		BigDecimal PISO = getCampoNumerico(request, "PISO");
		BigDecimal IDFINCA = getCampoNumerico(request, "IDFINCA");

		String CPOSTAL = getCampoTextual(request, "CPOSTAL");
		String TNOMVIA = getCampoTextual(request, "TNOMVIA");
		String AFINCA = getCampoTextual(request, "AFINCA");
		String INE = getCampoTextual(request, "INE");
		String REFERENCIA = getCampoTextual(request, "REFERENCIA");
		String PUERTA = getCampoTextual(request, "PUERTA");
		String CDESDE = getCampoTextual(request, "CDESDE");
		String CHASTA = getCampoTextual(request, "CHASTA");

		BigDecimal TBUSQUEDA;
		if (!isEmpty(REFERENCIA)) {
			TBUSQUEDA = new BigDecimal(2);
		} else
			TBUSQUEDA = new BigDecimal(1);

		Map mapBusqueda = null, formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		PAC_IAX_DIRECCIONES pac_iax_direcciones = null;

		logger.debug("Axisdir000Service m_buscar_direcciones");
		try {
			pac_iax_direcciones = new PAC_IAX_DIRECCIONES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			logger.debug("---> IDFINCA" + IDFINCA);
			ArrayList LISTAPORTALES = new ArrayList();

			if (isEmpty(IDFINCA)) {

				mapBusqueda = pac_iax_direcciones.ejecutaPAC_IAX_DIRECCIONES__F_GET_BUSQUEDADIRDIRECCIONES(TBUSQUEDA,
						CPOSTAL, CTIPVIA, TNOMVIA, NDESDE, NHASTA, CDESDE, CHASTA, CTIPFINCA, CPAIS, CPROVIN, CPOBLAC,
						CLOCALIDAD, AFINCA, INE, ESCALERA, PISO, PUERTA, REFERENCIA, IDFINCA);

				// formdata.put("RESULTADOSBUSQUEDA", tratarRETURNyMENSAJES(request,
				// mapBusqueda));
				logger.debug(mapBusqueda);
			} else {
				mapBusqueda = pac_iax_direcciones.ejecutaPAC_IAX_DIRECCIONES__F_SET_NUEVOPORTAL(IDFINCA, TBUSQUEDA,
						CPOSTAL, CTIPVIA, TNOMVIA, NDESDE, NHASTA, CDESDE, CHASTA, CTIPFINCA, CPAIS, CPROVIN, CPOBLAC,
						CLOCALIDAD, AFINCA, INE, ESCALERA, PISO, PUERTA, REFERENCIA);

				// formdata.put("RESULTADOSBUSQUEDA", tratarRETURNyMENSAJES(request,
				// mapBusqueda));
				logger.debug(mapBusqueda);

			}

			formdata.put("RESULTADOSBUSQUEDA", tratarRETURNyMENSAJES(request, mapBusqueda));
			ArrayList retorno = (ArrayList) mapBusqueda.get("RETURN");
			logger.debug("---> retorno:" + retorno);
			HashMap fincas = (HashMap) retorno.get(0);
			logger.debug("---> fincas:" + fincas);
			Map finca = (Map) fincas.get("OB_IAX_DIR_FINCAS");
			logger.debug("---> IDFINCA:" + finca.get("IDFINCA"));
			formdata.put("FINCASELECT", finca.get("IDFINCA"));
			ArrayList portales = (ArrayList) finca.get("PORTALES");
			logger.debug("---> portales:" + portales);

			for (int i = 0; i < portales.size(); i++) {
				HashMap OB_IAX_DIR_PORTALES = (HashMap) portales.get(i);

				logger.debug("---> PORTALSELECT:" + OB_IAX_DIR_PORTALES);
				Map portal = (Map) OB_IAX_DIR_PORTALES.get("OB_IAX_DIR_PORTALES");

				logger.debug("---> PORTALSELECT:" + portal.get("IDPORTAL"));
				if (portal.get("CPRINCIP").equals(new BigDecimal(1)))
					formdata.put("PORTALSELECT", portal.get("IDPORTAL"));

				ArrayList PORTALDIRS = (ArrayList) portal.get("PORTALESDIR");
				Map PORTALDIR = (Map) PORTALDIRS.get(0);
				if (!isEmpty(PORTALDIR)) {
					Map DOMIS = (Map) PORTALDIR.get("OB_IAX_DIR_PORTALESDIRECCIONES");
					ArrayList DOMI = (ArrayList) DOMIS.get("DOMICILIOS");
					if (!isEmpty(DOMI)) {
						Map D = (Map) DOMI.get(0);
						if (!isEmpty(D)) {
							Map OB_IAX_DIR_DOMICILIOS = (Map) D.get("OB_IAX_DIR_DOMICILIOS");
							formdata.put("DOMISELECT", OB_IAX_DIR_DOMICILIOS.get("IDDOMICI"));
						}
					}
				}
			}
			formdata.put("LISTAPORTALES", portales);

			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		} catch (Exception e) {
			logger.error("Error en el servicioAxisdir000Service - m�todo m_buscar_direcciones", e);
			AbstractDispatchAction.guardarMensaje(request, "1000050", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
	}

	/**
	 * Guarda la pantalla y determina la pantalla anterior a ejecutar.
	 * 
	 * @param request
	 */
	public void m_ajax_buscar_portales(HttpServletRequest request) {

		BigDecimal IDFINCA = getCampoNumerico(request, "IDFINCA");
		List listaPortales = null;
		Map mapPortales = null, formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		PAC_IAX_DIRECCIONES pac_iax_direcciones = null;

		AjaxContainerService ajax = new AjaxContainerService();

		logger.debug("Axisdir002Service m_ajax_buscar_portales");
		try {
			pac_iax_direcciones = new PAC_IAX_DIRECCIONES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			mapPortales = pac_iax_direcciones.ejecutaPAC_IAX_DIRECCIONES__F_GET_PORTALES(IDFINCA);
			// formdata.put("LISTAPORTALES", tratarRETURNyMENSAJES(request, mapPortales));
			logger.debug(mapPortales);

			if (!isEmpty(mapPortales)) {
				listaPortales = (List) tratarRETURNyMENSAJES(request, mapPortales);
				ajax.guardarContenidoFinalAContenedorAjax(listaPortales);
			}
		} catch (Exception e) {
			logger.error("Error en el servicioAxisdir000Service - m�todo m_ajax_buscar_portales", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	public void m_ajax_buscar_departamentos(HttpServletRequest request) {

		BigDecimal IDFINCA = getCampoNumerico(request, "IDFINCA");
		BigDecimal IDPORTAL = getCampoNumerico(request, "IDPORTAL");
		List listaDepart = null;
		Map mapDepart = null, formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		PAC_IAX_DIRECCIONES pac_iax_direcciones = null;

		AjaxContainerService ajax = new AjaxContainerService();

		logger.debug("Axisdir002Service m_ajax_buscar_portales");
		try {
			pac_iax_direcciones = new PAC_IAX_DIRECCIONES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			mapDepart = pac_iax_direcciones.ejecutaPAC_IAX_DIRECCIONES__F_GET_DEPARTAMENTOS(IDFINCA, IDPORTAL);
			// formdata.put("LISTAPORTALES", tratarRETURNyMENSAJES(request, mapPortales));
			logger.debug(mapDepart);

			if (!isEmpty(mapDepart)) {
				listaDepart = (List) tratarRETURNyMENSAJES(request, mapDepart);
				ajax.guardarContenidoFinalAContenedorAjax(listaDepart);
			}
		} catch (Exception e) {
			logger.error("Error en el servicioAxisdir000Service - m�todo m_ajax_buscar_portales", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	public void m_aceptar(HttpServletRequest request) {

		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		PAC_IAX_DIRECCIONES pac_iax_direcciones = null;

		logger.debug("Axisdir000Service m_buscar_direcciones");
		try {

			pac_iax_direcciones = new PAC_IAX_DIRECCIONES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			BigDecimal PIDDOMICI = getCampoNumerico(request, "DOMISELECT");
			String PIDPORTAL = getCampoTextual(request, "PORTALSELECT");
			BigDecimal PIDFINCA = getCampoNumerico(request, "FINCASELECT");

			BigDecimal IDGEODIR = getCampoNumerico(request, "IDGEODIRSELECT");
			String ESCALERA = getCampoTextual(request, "ESCALERASELECT");
			String PLANTA = getCampoTextual(request, "PLANTASELECT");
			String PUERTA = getCampoTextual(request, "PUERTASELECT");
			String CCATAST = getCampoTextual(request, "CCATASTSELECT");
			BigDecimal NM2CONS = getCampoNumerico(request, "NM2CONSSELECT");
			BigDecimal CTIPDPT = getCampoNumerico(request, "CTIPDPTSELECT");
			String TALIAS = getCampoTextual(request, "TALIASSELECT");
			BigDecimal CNOASEG = getCampoNumerico(request, "CNOASEGSELECT");
			BigDecimal TNOASEG = getCampoNumerico(request, "TNOASEGSELECT");

			String[] S = StringUtils.split(PIDPORTAL, "|");
			String VPIDDOMICI = null;
			BigDecimal PPIDDOMICI = null;
			for (String s : S) {

				BigDecimal portal = new BigDecimal(s);

				Map m = pac_iax_direcciones.ejecutaPAC_IAX_DIRECCIONES__F_EXISTE_DOMI(PIDFINCA, portal, PIDDOMICI,
						IDGEODIR, ESCALERA, PLANTA, PUERTA);
				logger.debug("---> existe domi:" + m);
				tratarRETURNyMENSAJES(request, m);

				if (m.get("VEXISTE").equals(new BigDecimal(0)) && m.get("RETURN").equals(new BigDecimal(0))) {
					Map mm = pac_iax_direcciones.ejecutaPAC_IAX_DIRECCIONES__F_SET_DOMICI(PIDFINCA, portal, IDGEODIR,
							ESCALERA, PLANTA, PUERTA, CCATAST, NM2CONS, CTIPDPT, TALIAS, CNOASEG, TNOASEG);

					logger.debug("---> set domi:" + mm);
					tratarRETURNyMENSAJES(request, mm);

					if (mm.get("RETURN").equals(new BigDecimal(0))) {
						BigDecimal iddomici = (BigDecimal) mm.get("PIDDOMICIOUT");
						logger.debug("---> domici salida:" + iddomici);
						formdata.put("DOMISELECT", iddomici);
						PPIDDOMICI = iddomici;
						if (isEmpty(VPIDDOMICI))
							VPIDDOMICI = iddomici + "|";
						else
							VPIDDOMICI = VPIDDOMICI + iddomici + "|";
					}

				} else {

					BigDecimal iddomici = (BigDecimal) m.get("VIDDOMICI");
					logger.debug("---> domici salida:" + iddomici);
					formdata.put("DOMISELECT", iddomici);
					PPIDDOMICI = iddomici;
					if (isEmpty(VPIDDOMICI))
						VPIDDOMICI = iddomici + "|";
					else
						VPIDDOMICI = VPIDDOMICI + iddomici + "|";
				}

			}

			Map ma = pac_iax_direcciones.ejecutaPAC_IAX_DIRECCIONES__F_SET_FINCASBD();
			logger.debug("--> guardo en bbdd:" + ma);
			tratarRETURNyMENSAJES(request, ma);

			BigDecimal NRIESGO = getCampoNumerico(request, "NRIESGO");
			BigDecimal CPAIS = getCampoNumerico(request, "CPAIS");
			BigDecimal CPROVIN = getCampoNumerico(request, "CPROVIN");
			BigDecimal CPOBLAC = getCampoNumerico(request, "CPOBLAC");
			String CPOSTAL = getCampoTextual(request, "CPOSTAL");
			BigDecimal CSIGLAS = getCampoNumerico(request, "CSIGLAS");
			String TNOMVIA = getCampoTextual(request, "TNOMVIA");
			BigDecimal NNUMVIA = getCampoNumerico(request, "NDESDE");

			if (isEmpty(VPIDDOMICI) && !isEmpty(PPIDDOMICI))
				VPIDDOMICI = PPIDDOMICI.toString();

			Map map = new PAC_IAX_PRODUCCION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_PRODUCCION__F_GRABARIEDOMICILIO(NRIESGO, null, CPOSTAL, CPOBLAC, CPROVIN, CPAIS,
							CSIGLAS, TNOMVIA, NNUMVIA, null, null, null, null, null, null, null, VPIDDOMICI, null, null,
							null, null, null, null, null, null, null, null, null, null, null, null, null, null, null,
							null, null);
			logger.debug("--->grabamos riesgo:" + map);
			tratarRETURNyMENSAJES(request, map);

			if (map.get("RETURN").equals(new BigDecimal(0))) {
				formdata.put("OK", "ok");
			}

			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));

		} catch (Exception e) {
			logger.error("Error en el servicioAxisdir000Service - m�todo m_buscar_direcciones", e);
			AbstractDispatchAction.guardarMensaje(request, "1000050", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
	}

	public void m_recargar(HttpServletRequest request) {

		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		PAC_IAX_DIRECCIONES pac_iax_direcciones = null;

		logger.debug("Axisdir000Service m_recargar");
		try {

			pac_iax_direcciones = new PAC_IAX_DIRECCIONES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			Map m = pac_iax_direcciones.ejecutaPAC_IAX_DIRECCIONES__F_GET_FINCASMEN();
			logger.debug("---> existe domi:" + m);
			tratarRETURNyMENSAJES(request, m);

			formdata.put("RESULTADOSBUSQUEDA", tratarRETURNyMENSAJES(request, m));
			ArrayList retorno = (ArrayList) m.get("RETURN");
			logger.debug("---> retorno:" + retorno);
			HashMap fincas = (HashMap) retorno.get(0);
			logger.debug("---> fincas:" + fincas);
			Map finca = (Map) fincas.get("OB_IAX_DIR_FINCAS");
			logger.debug("---> IDFINCA:" + finca.get("IDFINCA"));
			formdata.put("FINCASELECT", finca.get("IDFINCA"));
			ArrayList portales = (ArrayList) finca.get("PORTALES");
			logger.debug("---> portales:" + portales);

			for (int i = 0; i < portales.size(); i++) {
				HashMap OB_IAX_DIR_PORTALES = (HashMap) portales.get(i);

				logger.debug("---> PORTALSELECT:" + OB_IAX_DIR_PORTALES);
				Map portal = (Map) OB_IAX_DIR_PORTALES.get("OB_IAX_DIR_PORTALES");

				logger.debug("---> PORTALSELECT:" + portal.get("IDPORTAL"));
				if (portal.get("CPRINCIP").equals(new BigDecimal(1)))
					formdata.put("PORTALSELECT", portal.get("IDPORTAL"));

			}
			formdata.put("LISTAPORTALES", portales);

			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));

		} catch (Exception e) {
			logger.error("Error en el servicioAxisdir000Service - m�todo m_buscar_direcciones", e);
			AbstractDispatchAction.guardarMensaje(request, "1000050", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
	}
}
