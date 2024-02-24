//Revision:# 2xphxvZLkbyu8+gnePiNuQ== #
package axis.service.modal;

import java.math.BigDecimal;
// IAXIS-2169 AABC Adicion campo Fecha de apertura 
import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAXPAR_PRODUCTOS;
import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.jdbc.PAC_IAX_LISTVALORES_SIN;
import axis.jdbc.PAC_IAX_MNTPROD;
import axis.jdbc.PAC_IAX_SINIESTROS;
import axis.mvc.control.modal.Axissin019Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AjaxContainerService;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

/**
 * Axissin002Service.java
 * 
 * @author <a href="mailto:lcalvo@csi-ti.com">Luz Calvo</a>
 */
public class Axissin019Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE INICIALIZACION
	 *******************************************/

	/**
	 */
	public void m_init(HttpServletRequest request, Axissin019Action thisAction) {

	}

	public void m_form(HttpServletRequest request, Axissin019Action thisAction) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		Map listValores = new HashMap();
		try {

			// Cargar lista de estados
			Map map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES__F_GET_ESTADOSSINI();
			List ESTADOSSINI = (List) tratarRETURNyMENSAJES(request, map, false);
			formdata.put("AXISSIN_ESTADOSSINI", ESTADOSSINI);

			// Cargar lista de subestados
			Map map2 = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES__F_GET_SUBESTADOSSINI();
			List SUBESTADOSSINI = (List) tratarRETURNyMENSAJES(request, map2, false);
			formdata.put("AXISSIN_SUBESTADOSSINI", SUBESTADOSSINI);

			// Lista pa�ses
			map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTPAISES();
			listValores.put("lstPaises", (List) tratarRETURNyMENSAJES(request, map, false));
			formdata.put("listValores", listValores);

			PAC_IAX_LISTVALORES pac_iax_listvalores = new PAC_IAX_LISTVALORES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map tipriesg = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_TIPORIESGO();
			request.setAttribute("LST_TIPRIESGO", (List) tratarRETURNyMENSAJES(request, tipriesg, false));

			// Carreguem aquest per controlar el que ve d'apertura d'expedient
			String MODO = getCampoTextual(request, "MODO");
			// Prov� d'apertura d'expedient
			if (!isEmpty(MODO) && MODO.equals("APERTURASINIESTROS"))
				this.m_busqueda_siniestro(request, thisAction);

			this.m_cargarValors(request, thisAction);
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		} catch (Exception e) {
			logger.error("Error en el servicio axissin019Service - m�todo m_form", e);
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

	public void m_busqueda_poliza(HttpServletRequest request, Axissin019Action thisAction) {
		// Recuperar siniestro a buscar
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {

			BigDecimal NPOLIZA = getCampoNumerico(request, "NPOLIZA");
			String NSINIES = getCampoTextual(request, "NSINIES");
			BigDecimal NCERTIF = getCampoNumerico(request, "NCERTIF");
			BigDecimal CESTSIN = getCampoNumerico(request, "CESTSIN");
			String SNIP = getCampoTextual(request, "SNIP");
			String NNUMIDE = getCampoTextual(request, "NNUMIDE");
			String BUSCAR = getCampoTextual(request, "BUSCAR");
			BigDecimal TIPOPERSONA = getCampoNumerico(request, "TIPOPERSONA");
			BigDecimal SUBESTADO = getCampoNumerico(request, "CSUBEST");
			BigDecimal RAMO = getCampoNumerico(request, "CRAMO");
			BigDecimal SPRODUC = getCampoNumerico(request, "SPRODUC");
			String NSINCIA = getCampoTextual(request, "NSINCIA");
			// IAXIS-2169 AABC Adicion campo Fecha de apertura
			Date FALTA = stringToSqlDate(getCampoTextual(request, "FALTA"));
			BigDecimal CCOMPANI = getCampoNumerico(request, "CCOMPANI");
			String NPRESIN = getCampoTextual(request, "NPRESIN");

			String TNOMBRE = getCampoTextual(request, "TNOMBRE");
			String TNOMVIA = getCampoTextual(request, "TNOMVIA");
			BigDecimal NNUMVIA = getCampoNumerico(request, "NNUMVIA");
			String TCOMPLE = getCampoTextual(request, "TCOMPLE");
			String CPOSTAL = getCampoTextual(request, "CPOSTAL");
			BigDecimal CCIUDAD = getCampoNumerico(request, "CPOBLAC");
			BigDecimal CPROVIN = getCampoNumerico(request, "CPROVIN");
			BigDecimal FGISX = getCampoNumerico(request, "FGISX");
			BigDecimal FGISY = getCampoNumerico(request, "FGISY");
			BigDecimal FGISZ = getCampoNumerico(request, "FGISZ");
			String TDESCRI = getCampoTextual(request, "TDESCRI");
			BigDecimal CTIPMAT = getCampoNumerico(request, "CTIPMAT");
			String CMATRIC = getCampoTextual(request, "CMATRIC");
			BigDecimal TIPORISC = this.getHiddenCampoNumerico(request, "COBJASE");
			BigDecimal CSIGLAS = getCampoNumerico(request, "CSIGLAS");
			BigDecimal CAGENTE = getCampoNumerico(request, "CAGENTE");
			String NDOCU = getCampoTextual(request, "NDOCU");
			String CPOLCIA = getCampoTextual(request, "CPOLCIA");
			BigDecimal CACTIVI = getCampoNumerico(request, "CACTIVI");
			String TREFEXT = getCampoTextual(request, "TREFEXT");
			BigDecimal CTIPREF = getCampoNumerico(request, "CTIPREF");
			String TDESCRIE = getCampoTextual(request, "TDESCRIE"); // BUG CONF_309 - 10/09/2016 - JAEG
			String NCONTRATO = getCampoTextual(request, "NCONTRATO");

			String CMOTOR = getCampoTextual(request, "CMOTOR");
			String CCHASIS = getCampoTextual(request, "CCHASIS");
			String NBASTID = getCampoTextual(request, "NBASTID");

			formdata.put("CESTSIN", CESTSIN);
			BigDecimal filtro = this.getFiltro(request);
			PAC_IAX_SINIESTROS pac_axis_siniestros = new PAC_IAX_SINIESTROS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map map = pac_axis_siniestros.ejecutaPAC_IAX_SINIESTROS__F_CONSULTASINI(RAMO, SPRODUC, NPOLIZA, NCERTIF,
					NSINIES, CESTSIN, NNUMIDE, SNIP, BUSCAR, TIPOPERSONA, SUBESTADO, NSINCIA, FALTA, // IAXIS-2169 AABC
																										// Adicion campo
																										// Fecha de
																										// apertura
					CCOMPANI, NPRESIN, CSIGLAS, TNOMVIA, NNUMVIA, TCOMPLE, CPOSTAL, CCIUDAD, CPROVIN, FGISX, FGISY,
					FGISZ, TDESCRI, CTIPMAT, CMATRIC, TIPORISC, CPOLCIA, CACTIVI, filtro, CAGENTE, CMOTOR, CCHASIS,
					NBASTID, TREFEXT, CTIPREF, TDESCRIE, // BUG CONF_309 - 10/09/2016 - JAEG
					NCONTRATO);
			List listaPolizas = (List) tratarRETURNyMENSAJES(request, map);

			formdata.put("AXISSIN_POLIZAS", listaPolizas);

		} catch (Exception e) {
			logger.error("Error en el servicio Axissin019Service - m�todo m_busqueda_siniestro", e);
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
	public void m_ajax_busqueda_siniestros(HttpServletRequest request) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();
		try {

			BigDecimal CESTSIN = getCampoNumerico(request, "CESTSIN");
			BigDecimal NPOLIZA = getCampoNumerico(request, "NPOLIZA");
			String NSINIES = getCampoTextual(request, "NSINIES");
			BigDecimal NCERTIF = getCampoNumerico(request, "NCERTIF");
			BigDecimal NRIESGO = getCampoNumerico(request, "NRIESGO");

			PAC_IAX_SINIESTROS pac_axis_siniestros = new PAC_IAX_SINIESTROS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			BigDecimal filtro = this.getFiltro(request);
			Map map = pac_axis_siniestros.ejecutaPAC_IAX_SINIESTROS__F_CONSULTA_LSTSINI(NPOLIZA, NCERTIF, NSINIES,
					CESTSIN, filtro, NRIESGO);

			if (!isEmpty(map)) {
				List listaSiniestros = (List) tratarRETURNyMENSAJES(request, map);
				ajax.guardarContenidoFinalAContenedorAjax(listaSiniestros);
			}
		} catch (Exception e) {
			logger.error("Error en el servicio Axissin019Service - m�todo m_ajax_busqueda_siniestros", e);
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
	public void m_busqueda_siniestro(HttpServletRequest request, Axissin019Action thisAction) {
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
			// F_CONSULTA_LSTSINI(NPOLIZA,NCERTIF,NSINIES); Se le puede pasar
			// un numero de p�liza o se le puede pasar
			// un numero de siniestro, en ese caso, buscar� primero el NPOLIZA DEL NSINIES
			// y cargar� primero la primera lista y luego la segunda
			// Map map =
			// pac_axis_siniestros.ejecutaPAC_IAX_SINIESTROS__F_CONSULTA_LSTSINI(NPOLIZA,NCERTIF,NSINIES,CESTSIN
			// , filtro);

			// BigDecimal NCERTIF = getCampoNumerico(request, "NCERTIF");

			String SNIP = getCampoTextual(request, "SNIP");
			String NNUMIDE = getCampoTextual(request, "NNUMIDE");
			String BUSCAR = getCampoTextual(request, "BUSCAR");
			BigDecimal TIPOPERSONA = getCampoNumerico(request, "TIPOPERSONA");
			BigDecimal SUBESTADO = getCampoNumerico(request, "CSUBEST");
			BigDecimal RAMO = getCampoNumerico(request, "CRAMO");
			BigDecimal SPRODUC = getCampoNumerico(request, "SPRODUC");
			String NSINCIA = getCampoTextual(request, "NSINCIA");
			// IAXIS-2169 AABC Adicion campo Fecha de apertura
			Date FALTA = stringToSqlDate(getCampoTextual(request, "FALTA"));
			BigDecimal CCOMPANI = getCampoNumerico(request, "CCOMPANI");
			String NPRESIN = getCampoTextual(request, "NPRESIN");

			String TNOMBRE = getCampoTextual(request, "TNOMBRE");
			String TNOMVIA = getCampoTextual(request, "TNOMVIA");
			BigDecimal NNUMVIA = getCampoNumerico(request, "NNUMVIA");
			String TCOMPLE = getCampoTextual(request, "TCOMPLE");
			String CPOSTAL = getCampoTextual(request, "CPOSTAL");
			BigDecimal CCIUDAD = getCampoNumerico(request, "CPOBLAC");
			BigDecimal CPROVIN = getCampoNumerico(request, "CPROVIN");
			BigDecimal FGISX = getCampoNumerico(request, "FGISX");
			BigDecimal FGISY = getCampoNumerico(request, "FGISY");
			BigDecimal FGISZ = getCampoNumerico(request, "FGISZ");
			String TDESCRI = getCampoTextual(request, "TDESCRI");
			BigDecimal CTIPMAT = getCampoNumerico(request, "CTIPMAT");
			String CMATRIC = getCampoTextual(request, "CMATRIC");
			BigDecimal TIPORISC = this.getHiddenCampoNumerico(request, "TIPRIESGO");
			BigDecimal CSIGLAS = getCampoNumerico(request, "CSIGLAS");
			BigDecimal CAGENTE = getCampoNumerico(request, "CAGENTE");
			String NDOCU = getCampoTextual(request, "NDOCU");
			String CPOLCIA = getCampoTextual(request, "CPOLCIA");
			String TREFEXT = getCampoTextual(request, "TREFEXT");
			BigDecimal CTIPREF = getCampoNumerico(request, "CTIPREF");

			BigDecimal CACTIVI = getCampoNumerico(request, "CACTIVI");
			String TDESCRIE = getCampoTextual(request, "TDESCRIE"); // BUG CONF_309 - 10/09/2016 - JAEG
			String NCONTRATO = getCampoTextual(request, "NCONTRATO");

			formdata.put("CESTSIN", CESTSIN);

			Map map = pac_axis_siniestros.ejecutaPAC_IAX_SINIESTROS__F_CONSULTASINI2(RAMO, SPRODUC, NPOLIZA, NCERTIF,
					NSINIES, CESTSIN, NNUMIDE, SNIP, BUSCAR, TIPOPERSONA, SUBESTADO, NSINCIA, FALTA, // IAXIS-2169 AABC
																										// Adicion campo
																										// Fecha de
																										// apertura
					CCOMPANI, NPRESIN, CSIGLAS, TNOMVIA, NNUMVIA, TCOMPLE, CPOSTAL, CCIUDAD, CPROVIN, FGISX, FGISY,
					FGISZ, TDESCRI, CTIPMAT, CMATRIC, TIPORISC, CPOLCIA, CACTIVI, filtro, CAGENTE, TREFEXT, CTIPREF,
					TDESCRIE, // BUG CONF_309 - 10/09/2016 - JAEG
					NCONTRATO);
			List listaSiniestros = (List) tratarRETURNyMENSAJES(request, map);

			formdata.put("AXISSIN_LISTASINIESTROS", listaSiniestros);

		} catch (Exception e) {
			logger.error("Error en el servicio Axissin019Service - m�todo m_busqueda_siniestro", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
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
		AjaxContainerService ajax = new AjaxContainerService();
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {
			if (!isEmpty(this.getCampoNumerico(request, "CRAMO"))) {

				ajax.guardarContenidoFinalAContenedorAjax(this.dbGetRamProductos(request));

			} else
				ajax.guardarContenidoFinalAContenedorAjax(this.dbGetProductos(request, usuario));
		} catch (Exception e) {
			logger.error("Error en el servicio Axissin019Service - m�todo m_ajax_busqueda_productos", e);
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
		Map m = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_LISTVALORES__F_GET_RAMPRODUCTOS(getCampoTextual(request, "tipo"),
						getCampoNumerico(request, "CRAMO"), new BigDecimal(0));
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
		Map m = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_LISTVALORES__F_GET_PRODUCTOS(getCampoTextual(request, "tipo"), null, null);
		List primas = (List) tratarRETURNyMENSAJES(request, m, false);

		return primas;
	}

	private void m_cargarValors(HttpServletRequest request, Axissin019Action thisAction) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {
			BigDecimal CRAMO = getCampoNumerico(request, "CRAMO");
			BigDecimal SPRODUC = getCampoNumerico(request, "SPRODUC");

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
			request.setAttribute("CIAS", (List) tratarRETURNyMENSAJES(request, cias, false));

			// LISTA DE TIPO DE RIESGO TODO: Funcion provisional de Pablo?
			Map tipriesg = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_TIPORIESGO();
			request.setAttribute("LST_TIPRIESGO", (List) tratarRETURNyMENSAJES(request, tipriesg, false));

			// Lista tipo v�as
			Map map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTTIPOVIA();
			request.setAttribute("lstTipoVia", (List) tratarRETURNyMENSAJES(request, map, false));

			// Lista tipo matr�cula
			map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(290));
			request.setAttribute("TMATRICULA", (List) tratarRETURNyMENSAJES(request, map, false));

			Map listValores = new HashMap();

			// Lista pa�ses
			map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTPAISES();
			listValores.put("lstPaises", (List) tratarRETURNyMENSAJES(request, map, false));
			formdata.put("listValores", listValores);

			// Cargar lista de estados
			map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES__F_GET_ESTADOSSINI();
			formdata.put("AXISSIN_ESTADOSSINI", (List) tratarRETURNyMENSAJES(request, map, false));

			List actividades = this.dbGetActividades(request);
			formdata.put("actividades", ((actividades == null) ? new ArrayList() : actividades));

			String CUNITRA = getCampoTextual(request, "CUNITRA");
			BigDecimal CEMPRES = usuario.getCempres();
			formdata.put("CEMPRES", CEMPRES);

			List getCunitraIni = this.dbGetCunitraIni(request, usuario, CEMPRES);
			listValores.put("lstcunitra", (List) getCunitraIni);

			CUNITRA = null;
			request.setAttribute("TRAMDEF", new BigDecimal(0));
			formdata.put("CUNITRA", CUNITRA);

			if (!isEmpty(CUNITRA)) {
				Map GectramitadIni = this.dbGectramitadIni(request, usuario, CEMPRES, CUNITRA);
				listValores.put("lsttramit", (List) tratarRETURNyMENSAJES(request, GectramitadIni, false));
			} else {
				formdata.put("CTRAMIT", null);
				listValores.put("lsttramit", null);
			}
			formdata.put("listvalores", listValores);

			Map mapCTIPREF = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(800022));
			List lsCTIPREF = (List) tratarRETURNyMENSAJES(request, mapCTIPREF);
			formdata.put("listaCTIPREF", lsCTIPREF);

		} catch (Exception e) {
			logger.error("Error en el servicio Axissin019Service - m�todo m_form", e);
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
		AjaxContainerService ajax = new AjaxContainerService();

		try {
			ajax.guardarContenidoFinalAContenedorAjax(this.buscaCobjase(request));
		} catch (Exception e) {
			logger.error("Error en el servicio Axissin019Service - m�todo m_ajax_busqueda_cobjase", e);
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

	/**
	 * M�todo que llama a la funci�n pl correspondiente para cargar los motivos
	 * (seg�n la causa seleccionada) de una p�liza seleccionada.
	 * 
	 * @param usuario
	 * @param pcempres
	 * @param pctramitpad
	 * @return
	 * @throws Exception
	 */
	private

			Map dbGectramitadIni(HttpServletRequest request, UsuarioBean usuario, BigDecimal CCEMPRES,
					String CTRAMITPAD) throws Exception {
		Map m = new PAC_IAX_LISTVALORES_SIN((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_LISTVALORES_SIN__F_GET_CTRAMITAD(CCEMPRES, CTRAMITPAD);
		return m;
	}

	/**
	 * M�todo que llama a la funci�n pl correspondiente para cargar las unidades de
	 * tramitacion.
	 * 
	 * @param request
	 * @param usuario
	 * @return
	 * @throws Exception
	 */
	private List dbGetCunitraIni(HttpServletRequest request, UsuarioBean usuario, BigDecimal CCEMPRES)
			throws Exception {
		Map m = new PAC_IAX_LISTVALORES_SIN((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_LISTVALORES_SIN__F_GET_CUNITRA(CCEMPRES);
		return (List) tratarRETURNyMENSAJES(request, m);

	}

	/**
	 * M�todo que se llama al seleccionar una unidad de tramitacion de la lista. Con
	 * ello se pretende carga una lista de tramitadores.
	 * 
	 * @param request
	 */
	public void m_ajax_selected_cunitra(HttpServletRequest request) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();

		try {
			String CUNITRA = getCampoTextual(request, "CUNITRA");
			BigDecimal CEMPRES = getCampoNumerico(request, "CEMPRES");

			if (!isEmpty(CUNITRA)) {
				Map GectramitadIni = this.dbGectramitadIni(request, usuario, CEMPRES, CUNITRA);
				List tramitadIni = (List) ajax.rellenarPlAContenedorAjax(GectramitadIni);
				ajax.guardarContenidoFinalAContenedorAjax((List) tramitadIni);
			}
		} catch (Exception e) {
			logger.error("Axissin001Service m_ajax_selected_causa - Excepcion", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	public void m_ajax_actualizar_agente(HttpServletRequest request) {
		AjaxContainerService ajax = new AjaxContainerService();

		try {
			String CAGENTE = getCampoTextual(request, "CAGENTE");
			Map m = (Map) this.ActualizaAgente(request, CAGENTE);
			ajax.rellenarPlAContenedorAjax(m);
			ajax.guardarContenidoFinalAContenedorAjax(m);

		} catch (Exception e) {
			logger.error("Error en el servicio Axissin019Service - m�todo m_ajax_actualizar_agente", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	/**
	 * Carga el agente inicial de la pantalla.
	 * 
	 * @param request El HttpServletRequest que contiene la petici�n del cliente
	 *                web.
	 */
	private Map ActualizaAgente(HttpServletRequest request, String CAGENTE) throws Exception {
		// joan
		Map mapAgentes = new HashMap();

		// Cargar Agente de la BD
		Map agente = new HashMap();
		if (!isEmpty(CAGENTE)) {
			UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
			String CONDICION = this.getCampoTextual(request, "CONDICION");
			mapAgentes = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTAGENTES_COND(null, null, new BigDecimal(CAGENTE),
							new BigDecimal(1), CONDICION);
			List agentes = (List) mapAgentes.get("RETURN");

			if (!isEmpty(mapAgentes.get("RETURN")))
				agente = (Map) agentes.get(0);
		}

		request.setAttribute("axisctr_agente", agente);

		return mapAgentes;
	}
}
