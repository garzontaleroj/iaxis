package axis.service.modal;

import java.math.BigDecimal;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAXPAR_PRODUCTOS;
import axis.jdbc.PAC_IAX_ECO_MONEDAS;
import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.jdbc.PAC_IAX_MNTPROD;
import axis.jdbc.PAC_IAX_PRESTAMOS;
import axis.jdbc.PAC_IAX_SINIESTROS;
import axis.mvc.control.modal.Axisctr181Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AjaxContainerService;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

public class Axisctr181Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	public void m_init(HttpServletRequest request, Axisctr181Action thisAction) {
		try {

			// request.getSession().removeAttribute("AXISSIN_LISTASINIESTROS");

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr181Service - m�todo m_init", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}

	}

	public void m_form(HttpServletRequest request, Axisctr181Action thisAction) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		Map listValores = new HashMap();
		try {

			// Cargar lista de estados
			Map map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES__F_GET_ESTADOSSINI();
			logger.debug(map);
			List ESTADOSSINI = (List) tratarRETURNyMENSAJES(request, map, false);
			formdata.put("AXISSIN_ESTADOSSINI", ESTADOSSINI);
			// Cargar lista de subestados
			Map map2 = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES__F_GET_SUBESTADOSSINI();
			logger.debug(map2);
			List SUBESTADOSSINI = (List) tratarRETURNyMENSAJES(request, map2, false);
			formdata.put("AXISSIN_SUBESTADOSSINI", SUBESTADOSSINI);
			// Lista pa�ses
			map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTPAISES();
			logger.debug(map);
			listValores.put("lstPaises", (List) tratarRETURNyMENSAJES(request, map, false));
			formdata.put("listValores", listValores);

			// bug 0019238
			formdata.put("tipo", "PERMITE_PREST");

			// Carreguem aquest per controlar el que ve d'apertura d'expedient
			String MODO = getCampoTextual(request, "MODO");
			this.m_cargarValors(request, thisAction);
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		} catch (Exception e) {
			logger.error("Error en el servicio axisctr181Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}

	}

	/*********************************************************************************************************************/
	/************************************************
	 * M�TODOS DE ACTUALIZACI�N
	 *******************************************/
	/*********************************************************************************************************************/

	/**
	 * Realiza la b�squeda de un siniestro, dados los par�metros del formulario.
	 * Dichos par�metros pueden estar a null. Pone el resultado en una List en
	 * sesi�n llamada AXISSIN_LISTASINIESTROS.
	 * 
	 * @param request    El HttpServletRequest que contiene la petici�n del cliente
	 *                   web.
	 * @param thisAction Una Action abstracta desde donde se ha invocado el servicio
	 *                   (necesaria para el log).
	 */
	public

			void m_busqueda_poliza(HttpServletRequest request, Axisctr181Action thisAction) {
		// Recuperar siniestro a buscar
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {
			BigDecimal pPCRAMO = getCampoNumerico(request, "CRAMO");
			BigDecimal pPSPRODUC = getCampoNumerico(request, "SPRODUC");
			BigDecimal pPNPOLIZA = getCampoNumerico(request, "NPOLIZA");
			BigDecimal pPNCERTIF = getCampoNumerico(request, "NCERTIF");
			String pPCTAPRES = getCampoTextual(request, "CTAPRES");
			String pPNNUMIDE = getCampoTextual(request, "NNUMIDE");
			BigDecimal pPFILTRO = this.getFiltro(request);
			String pPBUSCAR = getCampoTextual(request, "BUSCAR");
			BigDecimal pPTIPOPER = getCampoNumerico(request, "TIPOPERSONA");
			BigDecimal pPCACTIVI = getCampoNumerico(request, "CACTIVI");
			String pPSNIP = getCampoTextual(request, "SNIP");
			PAC_IAX_PRESTAMOS pac_axis_prestamos = new PAC_IAX_PRESTAMOS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map map = pac_axis_prestamos.ejecutaPAC_IAX_PRESTAMOS__F_CONSULTA_PRESTA(pPCRAMO, pPSPRODUC, pPNPOLIZA,
					pPNCERTIF, pPCTAPRES, pPNNUMIDE, pPSNIP, pPBUSCAR, pPTIPOPER, pPCACTIVI, pPFILTRO);
			logger.debug("ejecutaPAC_IAX_PRESTAMOS__F_CONSULTA_PRESTA: " + map);
			List listaPolizas = (List) tratarRETURNyMENSAJES(request, map);
			logger.debug("listaPolizas: " + listaPolizas);
			formdata.put("AXIS_POLIZAS", listaPolizas);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr181Service - m�todo m_busqueda_siniestro", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			m_cargarValors(request, thisAction);
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
			this.formattingNumericValues(request);
		}
	}

	/**
	 * Carga las cuentas del tomador y las devuelve en modo Ajax.
	 * 
	 * @param request
	 */
	public void m_ajax_busqueda_prestamos(HttpServletRequest request) {
		logger.debug("Axisctr181Service m_ajax_busqueda_prestamos");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();
		try {

			BigDecimal pPSSEGURO = getCampoNumerico(request, "SSEGURO");
			BigDecimal pPNRIESGO = getCampoNumerico(request, "NRIESGO");
			String pPCTAPRES = getCampoTextual(request, "CTAPRES");
			PAC_IAX_PRESTAMOS pac_axis_prestamos = new PAC_IAX_PRESTAMOS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			BigDecimal filtro = this.getFiltro(request);
			Map map = pac_axis_prestamos.ejecutaPAC_IAX_PRESTAMOS__F_CONSULTA_LSTPRST(pPSSEGURO, pPNRIESGO, pPCTAPRES);

			logger.debug(map);
			ajax.guardarContenidoFinalAContenedorAjax(map);

			if (!isEmpty(map)) {
				List<HashMap> listaPrestamos = (List) tratarRETURNyMENSAJES(request, map);
				// ecg http://mantis.srvcsi.com/view.php?id=23252#c122310 hemos de recorrer la
				// lista para formatear la fecha para ajax en formato dd/MM/yyyy
				HashMap miM = null;
				if (listaPrestamos != null) {
					for (int i = 0; i < listaPrestamos.size(); i++) {
						miM = (HashMap) listaPrestamos.get(i);
						if (miM.get("FINIPREST") != null) {
							// ecg en CSI retorna un sql.Date, y en UAT un sql.Timestamp
							if (miM.get("FINIPREST") instanceof java.sql.Date) {
								miM.put("FINIPRESTformateado",
										this.datePrintf(
												new java.util.Date(((java.sql.Date) miM.get("FINIPREST")).getTime()),
												"dd/MM/yyyy"));
							}
							if (miM.get("FINIPREST") instanceof java.sql.Timestamp) {
								miM.put("FINIPRESTformateado",
										this.datePrintf(
												new java.util.Date(
														((java.sql.Timestamp) miM.get("FINIPREST")).getTime()),
												"dd/MM/yyyy"));
							}
						} else {
							miM.put("FINIPRESTformateado", "");
						}
						if (miM.get("FFINPREST") != null) {
							if (miM.get("FFINPREST") instanceof java.sql.Date) {
								miM.put("FFINPRESTformateado",
										this.datePrintf(
												new java.util.Date(((java.sql.Date) miM.get("FFINPREST")).getTime()),
												"dd/MM/yyyy"));
							}
							if (miM.get("FFINPREST") instanceof java.sql.Timestamp) {
								miM.put("FFINPRESTformateado",
										this.datePrintf(
												new java.util.Date(
														((java.sql.Timestamp) miM.get("FFINPREST")).getTime()),
												"dd/MM/yyyy"));
							}
						} else {
							miM.put("FFINPRESTformateado", "");
						}

					}
				}

				Map mformat = (HashMap) request.getSession().getServletContext().getAttribute("__formatNumberPatterns");
				if (mformat != null) {
					PAC_IAX_ECO_MONEDAS pac_iax_eco_monedas = new PAC_IAX_ECO_MONEDAS(
							(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
					Map mapa = pac_iax_eco_monedas.ejecutaPAC_IAX_ECO_MONEDAS__F_OBTENER_MONEDA_SEGURO2(pPSSEGURO);
					logger.debug(mapa);
					request.setAttribute(("CMONEDAPROD"), mapa.get("RETURN"));
					String format = (String) mformat.get(mapa.get("RETURN"));
					logger.debug(format);
					DecimalFormat formatear = new DecimalFormat(format);

					logger.debug("listaPrestamos:" + listaPrestamos); // ecg20130703: hay que controlar si
																		// listaPrestamos no es nulo antes de mandarlo
																		// al for, ver
																		// http://mantis.srvcsi.com/view.php?id=24448#c148207
					if (listaPrestamos != null) {
						logger.debug("listaPrestamos.size():" + listaPrestamos.size());
						for (HashMap x : listaPrestamos) {
							x.put("ICAPITAL", formatear.format(x.get("ICAPITAL")));
							logger.debug(x.get("ICAPITAL"));
							x.put("ITOTALPEND", formatear.format(x.get("ITOTALPEND")));
							logger.debug(x.get("ITOTALPEND"));
						}
					} else {
						logger.debug("no se formateaban CAPITAL etc por ser listaPrestamos nulo");
					}

				}

				ajax.guardarContenidoFinalAContenedorAjax(listaPrestamos);
			}
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr181Service - m�todo m_ajax_busqueda_prestamos", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	/**
	 * Realiza la b�squeda de un siniestro, dados los par�metros del formulario.
	 * Dichos par�metros pueden estar a null. Pone el resultado en una List en
	 * sesi�n llamada AXISSIN_LISTASINIESTROS.
	 * 
	 * @param request    El HttpServletRequest que contiene la petici�n del cliente
	 *                   web.
	 * @param thisAction Una Action abstracta desde donde se ha invocado el servicio
	 *                   (necesaria para el log).
	 */
	public void m_busqueda_siniestro(HttpServletRequest request, Axisctr181Action thisAction) {
		// Recuperar siniestro a buscar
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {
			// Recuperar par�metros de b�squeda
			BigDecimal CESTSIN = getCampoNumerico(request, "CESTSIN");
			BigDecimal NPOLIZA = getCampoNumerico(request, "NPOLIZA");
			String NSINIES = getCampoTextual(request, "NSINIES");
			BigDecimal NCERTIF = ((isEmpty(getCampoNumerico(request, "NCERTIF"))) ? new BigDecimal(0)
					: getCampoNumerico(request, "NCERTIF"));

			formdata.put("CESTSIN", CESTSIN);

			PAC_IAX_SINIESTROS pac_axis_siniestros = new PAC_IAX_SINIESTROS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			BigDecimal filtro = this.getFiltro(request);

			BigDecimal pPSSEGURO = getCampoNumerico(request, "SSEGURO");
			BigDecimal pPNRIESGO = getCampoNumerico(request, "NRIESGO");
			String pPCTAPRES = getCampoTextual(request, "CTAPRES");
			PAC_IAX_PRESTAMOS pac_axis_prestamos = new PAC_IAX_PRESTAMOS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			Map map = pac_axis_prestamos.ejecutaPAC_IAX_PRESTAMOS__F_CONSULTA_LSTPRST(pPSSEGURO, pPNRIESGO, pPCTAPRES);

			logger.debug(map);
			List listaSiniestros = (List) tratarRETURNyMENSAJES(request, map);
			logger.debug(listaSiniestros);

			formdata.put("AXIS_PRESTAMOS", listaSiniestros);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr181Service - m�todo m_busqueda_siniestro", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			logger.debug("fin metodo");
			this.m_cargarValors(request, thisAction);
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}

	/**
	 * Realiza una b�squeda de productos por Ajax.
	 * 
	 * @see buscaProductos
	 * @param request El HttpServletRequest que contiene la petici�n del cliente
	 *                web.
	 */
	public void m_ajax_busqueda_productos(HttpServletRequest request) {
		logger.debug("Axisctr181Service m_ajax_busqueda_productos");
		AjaxContainerService ajax = new AjaxContainerService();
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {
			if (!isEmpty(this.getCampoNumerico(request, "CRAMO"))) {

				ajax.guardarContenidoFinalAContenedorAjax(this.dbGetRamProductos(request));

			} else
				ajax.guardarContenidoFinalAContenedorAjax(this.dbGetProductos(request, usuario));
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr181Service - m�todo m_ajax_busqueda_productos", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	/**
	 * M�todo que llama a la funci�n pl correspondiente a la carga de productos para
	 * seleccionar una p�liza.
	 * 
	 * @param request
	 * @param usuario
	 * @return
	 * @throws Exception
	 */
	private List dbGetRamProductos(HttpServletRequest request) throws Exception {
		// TODO: PCTERMFIN a hard-code
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		logger.debug("----Buscamos productos TIPO:" + getCampoTextual(request, "tipo") + "------------");
		Map m = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_LISTVALORES__F_GET_RAMPRODUCTOS(getCampoTextual(request, "tipo"),
						getCampoNumerico(request, "CRAMO"), new BigDecimal(0));
		logger.debug(m);
		List productos = (List) tratarRETURNyMENSAJES(request, m, false);

		return productos;
	}

	/**
	 * M�todo que llama a la funci�n pl correspondiente a la carga de productos para
	 * seleccionar una p�liza.
	 * 
	 * @param request
	 * @param usuario
	 * @return
	 * @throws Exception
	 */
	private List dbGetProductos(HttpServletRequest request, UsuarioBean usuario) throws Exception {
		// TODO: PCTERMFIN a hard-code
		logger.debug("----Buscamos productos TIPO:" + getCampoTextual(request, "tipo") + "------------");
		Map m = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_LISTVALORES__F_GET_PRODUCTOS(getCampoTextual(request, "tipo"), null, null);
		logger.debug(m);
		List primas = (List) tratarRETURNyMENSAJES(request, m, false);

		return primas;
	}

	private void m_cargarValors(HttpServletRequest request, Axisctr181Action thisAction) {
		logger.debug("Axisctr181Service m_cargarValors");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {
			BigDecimal CRAMO = getCampoNumerico(request, "CRAMO");
			BigDecimal SPRODUC = getCampoNumerico(request, "SPRODUC");
			logger.debug("CRAMO-->" + CRAMO);

			this.cargaListaRamos(request);

			if ((!isEmpty(request.getAttribute("axisctr_listaRamos"))) && (CRAMO == null)) {
				ArrayList lista = (ArrayList) request.getAttribute("axisctr_listaRamos");
				if (lista.size() == 1)
					CRAMO = (BigDecimal) (((HashMap) lista.get(0)).get("CRAMO"));
			}
			formdata.put("CRAMO", CRAMO);
			List productos = new ArrayList();
			if (isEmpty(CRAMO)) {
				productos = dbGetProductos(request, usuario);
			} else {
				productos = dbGetRamProductos(request);
			}

			if (!isEmpty(productos)) {
				if ((productos.size() == 1) && (SPRODUC == null)) {
					formdata.put("SPRODUC", (BigDecimal) (((HashMap) productos.get(0)).get("SPRODUC")));
				} else {
					formdata.put("SPRODUC", SPRODUC);
				}
				formdata.put("productos", ((productos == null) ? new ArrayList() : productos));
			}

			// LISTA DE COMPANYIAS
			PAC_IAX_LISTVALORES pac_iax_listvalores = new PAC_IAX_LISTVALORES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map cias = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_CIAPRODUCTOS();
			logger.debug("PAC_IAX_LISTVALORES__F_GET_CIAPRODUCTOS devuelve:" + cias);
			request.setAttribute("CIAS", (List) tratarRETURNyMENSAJES(request, cias, false));

			// LISTA DE TIPO DE RIESGO TODO: Funcion provisional de Pablo?
			Map tipriesg = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_TIPORIESGO();
			logger.debug(tipriesg);
			request.setAttribute("LST_TIPRIESGO", (List) tratarRETURNyMENSAJES(request, tipriesg, false));

			// Lista tipo v�as
			Map map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTTIPOVIA();
			logger.debug(map);
			request.setAttribute("lstTipoVia", (List) tratarRETURNyMENSAJES(request, map, false));

			// Lista tipo matr�cula
			map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(290));
			logger.debug(map);
			request.setAttribute("TMATRICULA", (List) tratarRETURNyMENSAJES(request, map, false));
			Map listValores = new HashMap();
			// Lista pa�ses
			map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTPAISES();
			logger.debug(map);
			listValores.put("lstPaises", (List) tratarRETURNyMENSAJES(request, map, false));
			formdata.put("listValores", listValores);
			// Cargar lista de estados
			map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES__F_GET_ESTADOSSINI();
			logger.debug(map);
			formdata.put("AXISSIN_ESTADOSSINI", (List) tratarRETURNyMENSAJES(request, map, false));
			List actividades = this.dbGetActividades(request);
			formdata.put("actividades", ((actividades == null) ? new ArrayList() : actividades));

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr181Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

	/**
	 * Carga la lista inicial de ramos en la pantalla.
	 * 
	 * @param request El HttpServletRequest que contiene la petici�n del cliente
	 *                web.
	 */
	private void cargaListaRamos(HttpServletRequest request) throws Exception {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		String tipo = this.getCampoTextual(request, "tipo");
		// Carga de ramos de la BD
		Map map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_LISTVALORES__F_GET_RAMOS(tipo, null);
		List listaRamos = (List) tratarRETURNyMENSAJES(request, map, false);
		request.setAttribute("axisctr_listaRamos", listaRamos != null ? listaRamos : new ArrayList());
		listaRamos = null;
	}

	/**
	 * Realiza una b�squeda de productos por Ajax.
	 * 
	 * @see buscaProductos
	 * @param request El HttpServletRequest que contiene la petici�n del cliente
	 *                web.
	 */
	public void m_ajax_busqueda_cobjase(HttpServletRequest request) {
		logger.debug("Axisctr071Service m_ajax_busqueda_cobjase");
		AjaxContainerService ajax = new AjaxContainerService();

		try {
			ajax.guardarContenidoFinalAContenedorAjax(this.buscaCobjase(request));
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr181Service - m�todo m_ajax_busqueda_cobjase", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());

		}
	}

	/**
	 * Realiza una b�squeda de cobjase seleccionado (SPRODUC).
	 * 
	 * @param request El HttpServletRequest que contiene la petici�n del cliente
	 *                web.
	 * @return
	 * @throws Exception
	 */
	private Map buscaCobjase(HttpServletRequest request) throws Exception {
		// Recuperar Productos segun ramo seleccionado
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();

		BigDecimal SPRODUC = getCampoNumerico(request, "SPRODUC");

		Map map = new PAC_IAXPAR_PRODUCTOS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAXPAR_PRODUCTOS__F_GET_DEFPRODUCTO(SPRODUC);
		Map plCOBJASE = (HashMap) ajax.rellenarPlAContenedorAjax(map);
		logger.debug((List) request.getSession().getAttribute("LST_PRODUCTOS"));

		return plCOBJASE;

	}

	/**
	 * M�todo que llama a la funci�n pl correspondiente a la carga de actividades
	 * 
	 * @param request
	 * @param usuario
	 * @return
	 * @throws Exception
	 */
	private List dbGetActividades(HttpServletRequest request) throws Exception {
		// TODO: PCTERMFIN a hard-code
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		BigDecimal pPSPRODUC = this.getCampoNumerico(request, "SPRODUC");
		BigDecimal pPCRAMO = this.getCampoNumerico(request, "CRAMO");
		List productos;
		if (!this.isEmpty(pPSPRODUC)) {
			Map m = new PAC_IAX_MNTPROD((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_MNTPROD__F_GET_ACTIVID(pPSPRODUC);
			logger.debug(m);
			productos = (List) tratarRETURNyMENSAJES(request, m, false);
		} else {
			productos = new ArrayList();
		}

		return productos;
	}

	/**
	 * Realiza una b�squeda de productos por Ajax.
	 * 
	 * @see buscaProductos
	 * @param request El HttpServletRequest que contiene la petici�n del cliente
	 *                web.
	 */
	public void m_ajax_busqueda_actividades(HttpServletRequest request) {
		logger.debug("Axisctr019Service m_ajax_busqueda_actividades");
		AjaxContainerService ajax = new AjaxContainerService();
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		try {
			ajax.guardarContenidoFinalAContenedorAjax(this.dbGetActividades(request));
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr001Service - m�todo m_ajax_busqueda_actividades", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());

		}
	}
}
