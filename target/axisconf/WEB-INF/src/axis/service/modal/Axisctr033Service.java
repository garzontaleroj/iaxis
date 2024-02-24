package axis.service.modal;

import java.math.BigDecimal;
import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAXPAR_PRODUCTOS;
import axis.jdbc.PAC_IAX_GESTIONPROPUESTA;
import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.jdbc.PAC_IAX_PSU;
import axis.jdbc.PAC_IAX_REDCOMERCIAL;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AjaxContainerService;
import axis.service.axis.AxisBaseService;
import axis.service.axis.Axisctr001Service;
import axis.service.axis.Axisctr034Service;
import axis.service.axis.Axisctr209Service;
import axis.util.Constantes;

/**
 * Axisctr033Service.java 14/10/2008
 * 
 * @author <a href="rkirchner@csi-ti.com">Roger Kirchner</a>
 * @since Java 5.0
 */
public class Axisctr033Service extends AxisBaseService {
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
		logger.debug("Axisctr033Service m_form");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		try {
			Map LISTVALORES = new HashMap();

			String tipo = getCampoTextual(request, "tipo");

			PAC_IAX_LISTVALORES pacIaxListValores = new PAC_IAX_LISTVALORES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			Map map = pacIaxListValores.ejecutaPAC_IAX_LISTVALORES__F_GET_PRODUCTOS(null, null, null);
			logger.debug(map);
			LISTVALORES.put("PRODUCTOS", tratarRETURNyMENSAJES(request, map, false));

			map = pacIaxListValores.ejecutaPAC_IAX_LISTVALORES__F_GET_GSTPOLRETMOT();
			logger.debug(map);
			LISTVALORES.put("GSTPOLRETMOT", tratarRETURNyMENSAJES(request, map));

			map = pacIaxListValores.ejecutaPAC_IAX_LISTVALORES__F_GET_GSTCESTGEST();
			logger.debug(map);
			LISTVALORES.put("GSTCESTGEST", tratarRETURNyMENSAJES(request, map));

			map = pacIaxListValores.ejecutaPAC_IAX_LISTVALORES__F_GET_RAMOS(tipo, null);
			logger.debug(map);
			LISTVALORES.put("listaRamos", tratarRETURNyMENSAJES(request, map));

			// INI IAXIS-10611 CJMR 22/01/2020
			BigDecimal pPSPRODUC = this.getCampoNumerico(request, "SPRODUC");
			if (!this.isEmpty(pPSPRODUC)) {

				// INI IAXIS-3160 CJMR 20/03/2019
				map = pacIaxListValores.ejecutaPAC_IAX_LISTVALORES__F_GET_CACTIVI(pPSPRODUC, null);
				logger.debug(map);
				LISTVALORES.put("listaActividades", tratarRETURNyMENSAJES(request, map));
				// FIN IAXIS-3160 CJMR 20/03/2019
			} else {
				LISTVALORES.put("listaActividades", new ArrayList());
			}
			// FIN IAXIS-10611 CJMR 22/01/2020

			Map tipriesg = pacIaxListValores.ejecutaPAC_IAX_LISTVALORES__F_GET_TIPORIESGO();
			logger.debug(tipriesg);
			request.setAttribute("LST_TIPRIESGO", (List) tratarRETURNyMENSAJES(request, tipriesg, false));

			PAC_IAX_PSU pacIaxPsu = new PAC_IAX_PSU((java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			map = pacIaxPsu.ejecutaPAC_IAX_PSU__F_GET_LSTNIVELES();
			logger.debug(map);
			LISTVALORES.put("listaniveles", tratarRETURNyMENSAJES(request, map));

			formdata.put("LISTVALORES", LISTVALORES);

			PAC_IAX_GESTIONPROPUESTA pacIaxGestionPropuesta = new PAC_IAX_GESTIONPROPUESTA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			map = pacIaxGestionPropuesta.ejecutaPAC_IAX_GESTIONPROPUESTA__F_GET_NPOLIZAENEMISION();
			logger.debug(map);

			request.setAttribute("NPOLIZAENEMISION", tratarRETURNyMENSAJES(request, map));

			PAC_IAX_REDCOMERCIAL pac_iax_redcomercial = new PAC_IAX_REDCOMERCIAL(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			map = pac_iax_redcomercial.ejecutaPAC_IAX_REDCOMERCIAL__F_GET_NIVELES(null, null);
			logger.debug(map);

			request.getSession().setAttribute("AGENIVELES", tratarRETURNyMENSAJES(request, map, false));

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr033Service - m�todo m_form", e);
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
	public void m_buscar(HttpServletRequest request) {
		m_buscar(request, false);
	}

	/**
	 * 
	 * @param request
	 */
	@SuppressWarnings("all")
	public void m_buscar(HttpServletRequest request, boolean buscarDesdeModal) {
		logger.debug("Axisctr033Service m_buscar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		try {

			PAC_IAX_GESTIONPROPUESTA pacIaxGestionPropuesta = new PAC_IAX_GESTIONPROPUESTA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			Map PRETEN_FILTRO_BUSQUEDA = (Map) request.getSession().getAttribute("PRETEN_FILTRO_BUSQUEDA");
			Map PRETEN_FILTRO_BUSQUEDA_ANTERIOR = new HashMap();

			if (!isEmpty(PRETEN_FILTRO_BUSQUEDA))
				// Si el filtro de b�squeda no estaba vac�o, hacemos una "copia de seguridad"
				// Esto es porque, si la b�squeda no devolviera nada y hici�ramos "cancelar",
				// no perdi�ramos la b�squeda anterior
				PRETEN_FILTRO_BUSQUEDA_ANTERIOR.putAll(PRETEN_FILTRO_BUSQUEDA);

			if (buscarDesdeModal)
				PRETEN_FILTRO_BUSQUEDA = null;

			if (isEmpty(PRETEN_FILTRO_BUSQUEDA)) {
				// Rellenar el filtro a cada b�squeda des del modal
				PRETEN_FILTRO_BUSQUEDA = new HashMap();
				PRETEN_FILTRO_BUSQUEDA.put("SPRODUC", getCampoNumerico(request, "SPRODUC"));
				PRETEN_FILTRO_BUSQUEDA.put("NPOLIZA",
						isEmpty(getCampoNumerico(request, "NPOLIZA")) ? getCampoNumerico(request, "NPOLIZA_WIZARD")
								: getCampoNumerico(request, "NPOLIZA"));
				PRETEN_FILTRO_BUSQUEDA.put("NSOLICI", getCampoNumerico(request, "NSOLICI"));
				PRETEN_FILTRO_BUSQUEDA.put("FCANCEL", stringToSqlDate(getCampoTextual(request, "FCANCEL")));
				PRETEN_FILTRO_BUSQUEDA.put("NUMIDE", getCampoTextual(request, "NUMIDE"));
				PRETEN_FILTRO_BUSQUEDA.put("NOMBRE", getCampoTextual(request, "NOMBRE"));
				PRETEN_FILTRO_BUSQUEDA.put("SNIP", getCampoTextual(request, "SNIP"));
				PRETEN_FILTRO_BUSQUEDA.put("CMOTRET", getCampoNumerico(request, "CMOTRET"));
				PRETEN_FILTRO_BUSQUEDA.put("CESTGEST", getCampoNumerico(request, "CESTGEST"));
				PRETEN_FILTRO_BUSQUEDA.put("CRAMO", getCampoNumerico(request, "CRAMO"));
				PRETEN_FILTRO_BUSQUEDA.put("CAGENTE", getCampoNumerico(request, "CAGENTE"));
				PRETEN_FILTRO_BUSQUEDA.put("CTIPO", getCampoNumerico(request, "tipo"));
				PRETEN_FILTRO_BUSQUEDA.put("CNIVELBPM", getCampoNumerico(request, "CNIVELBPM"));
				PRETEN_FILTRO_BUSQUEDA.put("PCPOLCIA", getCampoTextual(request, "PCPOLCIA"));
				PRETEN_FILTRO_BUSQUEDA.put("PFRETTEND", stringToSqlDate(getCampoTextual(request, "PFRETTEND")));
				PRETEN_FILTRO_BUSQUEDA.put("PFRETTENH", stringToSqlDate(getCampoTextual(request, "PFRETTENH")));
				PRETEN_FILTRO_BUSQUEDA.put("CMATRIC", getCampoTextual(request, "CMATRICULA"));
				PRETEN_FILTRO_BUSQUEDA.put("CPOSTAL", getCampoTextual(request, "CPOSTAL"));
				PRETEN_FILTRO_BUSQUEDA.put("TNATRIE", getCampoTextual(request, "DESCRIPCION"));
				PRETEN_FILTRO_BUSQUEDA.put("TDOMICI", getCampoTextual(request, "TDOMICI"));

				PRETEN_FILTRO_BUSQUEDA.put("CSUCURSAL", getCampoNumerico(request, "CAGENTE_2"));
				PRETEN_FILTRO_BUSQUEDA.put("CADN", getCampoNumerico(request, "CAGENTE_3"));
				PRETEN_FILTRO_BUSQUEDA.put("CINTER", getCampoNumerico(request, "CAGENTE_4"));

				if (isEmpty(getCampoNumerico(request, "CAGENTE")))
					PRETEN_FILTRO_BUSQUEDA.put("CAGENTE", getCampoNumerico(request, "CAGENTE_4"));

				PRETEN_FILTRO_BUSQUEDA.put("CMOTOR", getCampoTextual(request, "CMOTOR"));
				PRETEN_FILTRO_BUSQUEDA.put("CCHASIS", getCampoTextual(request, "CCHASIS"));
				PRETEN_FILTRO_BUSQUEDA.put("NBASTID", getCampoTextual(request, "NBASTID"));

				// INI IAXIS-3160 CJMR 20/03/2019
				PRETEN_FILTRO_BUSQUEDA.put("CACTIVI", getCampoNumerico(request, "CACTIVI"));
				PRETEN_FILTRO_BUSQUEDA.put("NUMIDEASE", getCampoTextual(request, "NUMIDEASE"));
				PRETEN_FILTRO_BUSQUEDA.put("NOMBREASE", getCampoTextual(request, "NOMBREASE"));
				// FIN IAXIS-3160 CJMR 20/03/2019
			}

			BigDecimal SPRODUC = (BigDecimal) PRETEN_FILTRO_BUSQUEDA.get("SPRODUC");
			BigDecimal NPOLIZA = (BigDecimal) PRETEN_FILTRO_BUSQUEDA.get("NPOLIZA");
			BigDecimal NSOLICI = (BigDecimal) PRETEN_FILTRO_BUSQUEDA.get("NSOLICI");
			Date FCANCEL = (Date) PRETEN_FILTRO_BUSQUEDA.get("FCANCEL");
			String NUMIDE = (String) PRETEN_FILTRO_BUSQUEDA.get("NUMIDE");
			String NOMBRE = (String) PRETEN_FILTRO_BUSQUEDA.get("NOMBRE");
			String SNIP = (String) PRETEN_FILTRO_BUSQUEDA.get("SNIP");
			BigDecimal CMOTRET = (BigDecimal) PRETEN_FILTRO_BUSQUEDA.get("CMOTRET");
			BigDecimal CESTGEST = (BigDecimal) PRETEN_FILTRO_BUSQUEDA.get("CESTGEST");
			BigDecimal CRAMO = (BigDecimal) PRETEN_FILTRO_BUSQUEDA.get("CRAMO");
			BigDecimal CAGENTE = (BigDecimal) PRETEN_FILTRO_BUSQUEDA.get("CAGENTE");
			BigDecimal CNIVELBPM = (BigDecimal) PRETEN_FILTRO_BUSQUEDA.get("CNIVELBPM");
			String PCPOLCIA = (String) PRETEN_FILTRO_BUSQUEDA.get("PCPOLCIA");
			Date PFRETTEND = (Date) PRETEN_FILTRO_BUSQUEDA.get("PFRETTEND");
			Date PFRETTENH = (Date) PRETEN_FILTRO_BUSQUEDA.get("PFRETTENH");
			String CTIPO = (String) PRETEN_FILTRO_BUSQUEDA.get("CTIPO");
			String CMATRIC = (String) PRETEN_FILTRO_BUSQUEDA.get("CMATRIC");
			String CPOSTAL = (String) PRETEN_FILTRO_BUSQUEDA.get("CPOSTAL");
			String TNATRIE = (String) PRETEN_FILTRO_BUSQUEDA.get("TNATRIE");
			String TDOMICI = (String) PRETEN_FILTRO_BUSQUEDA.get("TDOMICI");

			BigDecimal PCSUCURSAL = (BigDecimal) PRETEN_FILTRO_BUSQUEDA.get("CSUCURSAL");
			BigDecimal PCADN = (BigDecimal) PRETEN_FILTRO_BUSQUEDA.get("CADN");
			BigDecimal PCINTER = (BigDecimal) PRETEN_FILTRO_BUSQUEDA.get("CINTER");

			String CMOTOR = (String) PRETEN_FILTRO_BUSQUEDA.get("CMOTOR");
			String CCHASIS = (String) PRETEN_FILTRO_BUSQUEDA.get("CCHASIS");
			String NBASTID = (String) PRETEN_FILTRO_BUSQUEDA.get("NBASTID");

			// INI IAXIS-3160 CJMR 20/03/2019
			BigDecimal CACTIVI = (BigDecimal) PRETEN_FILTRO_BUSQUEDA.get("CACTIVI");
			String NUMIDEASE = (String) PRETEN_FILTRO_BUSQUEDA.get("NUMIDEASE");
			String NOMBREASE = (String) PRETEN_FILTRO_BUSQUEDA.get("NOMBREASE");
			// FIN IAXIS-3160 CJMR 20/03/2019

			CAGENTE = isEmpty(CAGENTE) ? PCINTER : CAGENTE;

			if (isEmpty(getCampoNumerico(request, "CAGENTE")))
				PRETEN_FILTRO_BUSQUEDA.put("CAGENTE", getCampoTextual(request, "CAGENTE_4"));

			// Inici Bug 0027262/0027262 - 14/08/2013 - RCL - Autorzaci�n masiva propuestas
			// retenidas
			String PMODO = (String) getHiddenCampoTextual(request, "PMODO");
			BigDecimal CCONTROL = (BigDecimal) getHiddenCampoNumerico(request, "CCONTROL");

			Map map = pacIaxGestionPropuesta.ejecutaPAC_IAX_GESTIONPROPUESTA__F_GET_POLIZASRETEN(SPRODUC, NPOLIZA,
					NSOLICI, FCANCEL, NUMIDE, NOMBRE, SNIP, CMOTRET, CESTGEST, CRAMO, CAGENTE, CTIPO, CMATRIC, CPOSTAL,
					TNATRIE, TDOMICI, CNIVELBPM, PCSUCURSAL, PCADN, CMOTOR, CCHASIS, NBASTID, PMODO, CCONTROL, PCPOLCIA,
					PFRETTEND, PFRETTENH, CACTIVI, NUMIDEASE, NOMBREASE);
			// Fi Bug 0027262/0027262 - 14/08/2013 - RCL - Autorzaci�n masiva propuestas
			// retenidas

			logger.debug(map);

			List RETURN = (List) tratarRETURNyMENSAJES(request, map, false);

			if (!isEmpty(RETURN) && map.get("MENSAJES") == null) {
				// B�squeda OK
				BigDecimal SSEGURO = (BigDecimal) request.getSession().getAttribute("PRETEN_SSEGURO");

				if (!isEmpty(SSEGURO)) {
					// Miramos si la p�liza seleccionada anteriormente, sigue estando en la nueva
					// b�squeda
					if (getObjetoDeLista(RETURN, bigDecimalToString(SSEGURO), "SSEGURO",
							"OB_IAX_POLIZASRETEN") == null) {
						// Si no est�, podemos borrar los atributos de session
						new Axisctr034Service().borrarAtributosSession(request);
						AbstractDispatchAction.removeTopPila(request, "dtPolizasOffset");
					}
				}

				request.getSession().setAttribute("PRETEN_T_IAX_POLIZASRETEN", RETURN);
				request.getSession().setAttribute("PRETEN_FILTRO_BUSQUEDA", PRETEN_FILTRO_BUSQUEDA);

				// Inici Bug 0027262/0027262 - 14/08/2013 - RCL - Autorzaci�n masiva propuestas
				// retenidas
				// Guardamos en la session las polizas retenidas con la infomraci�n de las PSUs
				List PPOLRETPSU = (List) map.get("PPOLRETPSU");
				if (!isEmpty(PPOLRETPSU))
					request.getSession().setAttribute("PRETEN_T_IAX_POLRETPSU", PPOLRETPSU);
				else
					request.getSession().removeAttribute("PRETEN_T_IAX_POLRETPSU");
				// Fi Bug 0027262/0027262 - 14/08/2013 - RCL - Autorzaci�n masiva propuestas
				// retenidas

				request.setAttribute("buscarOK", true);

			} else {
				// No hay registros
				if (buscarDesdeModal)
					AbstractDispatchAction.guardarMensaje(request, "1000254", null, Constantes.MENSAJE_INFO);
				// Borrar atributos de session
				new Axisctr034Service().borrarAtributosSession(request);
				new Axisctr209Service().borrarAtributosSession(request);
				AbstractDispatchAction.removeTopPila(request, "dtPolizasOffset");
				// Recuperar la b�squeda anterior (si la hay!) y ponerla en session, para que no
				// se perdiera si al usuario le diera por "cancelar".
				request.getSession().setAttribute("PRETEN_FILTRO_BUSQUEDA", PRETEN_FILTRO_BUSQUEDA_ANTERIOR);
				request.setAttribute("buscarOK", false);
			}

			/*
			 * if (buscarDesdeModal) request.setAttribute("buscarOK", true);
			 */

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr033Service - m�todo m_buscar", e);
			AbstractDispatchAction.guardarMensaje(request,
					"verbatim:<b>" + e.getClass().getName() + ":</b> " + e.getLocalizedMessage(),
					new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
	}

	/**
	 * Dado un List de Objetos en session (listaObjetos), recupera y devuelve el
	 * objeto especificado en idObjeto contenido dentro de dicha List. Si no hay
	 * coincidencia, devuelve null.
	 * 
	 * @param listaObjetos   Un List conteniendo Objetos (Maps).
	 * @param idObjeto       El id del objeto a buscar en este List.
	 * @param nombreClave    El literal que identifica la clave (ejemplo,
	 *                       "idObjeto").
	 * @param nombreOuterMap El nombre del objeto Map que hay en cada posici�n del
	 *                       List, que encapsula otro objeto Map con los datos
	 *                       reales.
	 * @return Map El Objeto con nombreClave = idObjeto.
	 * @throws IllegalArgumentException si los argumentos pasados son nulos.
	 * @Override
	 */
	protected Map getObjetoDeLista(List listaObjetos, String idObjeto, String nombreClave, String nombreOuterMap) {
		if (listaObjetos == null)
			throw new IllegalArgumentException("listaObjetos no puede ser null.");
		if (nombreClave == null)
			throw new IllegalArgumentException("nombreClave no puede ser null.");
		if (isEmpty(idObjeto))
			throw new IllegalArgumentException("idObjeto no puede ser null.");

		nombreClave = nombreClave.trim();
		idObjeto = idObjeto.trim();

		for (int i = 0; i < listaObjetos.size(); i++) {
			Map map = (Map) listaObjetos.get(i);

			Map map_map = (Map) map.get(nombreOuterMap);
			if (!isEmpty(map_map))
				map = map_map;

			Object idAComparar = getTipoAtributo(map, nombreClave);

			if (idAComparar instanceof Integer) {
				// Por si la clave es un Integer
				if (Integer.valueOf(idObjeto).equals(idAComparar))
					return map;
			} else if (idAComparar instanceof BigDecimal) {
				// Por si la clave es un BigDecimal
				if (new BigDecimal(idObjeto).equals(idAComparar))
					return map;
			} else {
				// Por si la clave es un String
				if (idObjeto.equals(idAComparar))
					return map;
			}
		}
		return null;
	}

	/**
	 * Dado un agente seleccionado en el modal de selecci�n de agentes (axisctr014),
	 * �ste m�todo recibe el atributo CODI del agente y lo pone en el par�metro de
	 * sesi�n axisctr_agente.
	 * 
	 * @param request El HttpServletRequest que contiene la petici�n del cliente
	 *                web.
	 */
	public void m_ajax_ver_agente(HttpServletRequest request) {
		AjaxContainerService ajax = new AjaxContainerService();
		try {
			String CODI = getCampoTextual(request, "CODI");

			if (request.getSession().getAttribute("axisctr014_listaAgentes") != null) {
				List listaAgentes = (List) request.getSession().getAttribute("axisctr014_listaAgentes");
				Map agente = getObjetoDeLista(listaAgentes, CODI, "CODI");

				if (!isEmpty(agente)) {
					ajax.guardarContenidoFinalAContenedorAjax(agente);
					request.getSession().setAttribute("axisctr_agente", agente);
				}
				listaAgentes = null;
			}
		} catch (Exception e) {
			logger.error("Error", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	/**
	 * Carga el agente inicial de la pantalla.
	 * 
	 * @param request El HttpServletRequest que contiene la petici�n del cliente
	 *                web.
	 */
	private Map ActualizaAgente(HttpServletRequest request, String CAGENTE) throws Exception {
		Map mapAgentes = new HashMap();

		// Cargar Agente de la BD
		Map agente = new HashMap();
		if (!isEmpty(CAGENTE)) {
			UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
			String CONDICION = this.getCampoTextual(request, "CONDICION");
			mapAgentes = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTAGENTES_COND(null, null, new BigDecimal(CAGENTE),
							new BigDecimal(1), CONDICION);
			logger.debug(mapAgentes);
			List agentes = (List) mapAgentes.get("RETURN");

			if (!isEmpty(mapAgentes.get("RETURN")))
				agente = (Map) agentes.get(0);
		}

		request.getSession().setAttribute("axisctr_agente", agente);

		return mapAgentes;
	}

	/**
	 * Realiza una b�squeda de productos por Ajax.
	 * 
	 * @see Axisctr001Service#buscaProductos
	 * @param request El HttpServletRequest que contiene la petici�n del cliente
	 *                web.
	 */
	public void m_ajax_actualizar_agente(HttpServletRequest request) {
		logger.debug("Axisctr033Service m_ajax_busqueda_productos");
		AjaxContainerService ajax = new AjaxContainerService();

		try {
			String CAGENTE = getCampoTextual(request, "CAGENTE_COD");
			Map m = (Map) this.ActualizaAgente(request, CAGENTE);
			ajax.rellenarPlAContenedorAjax(m);
			ajax.guardarContenidoFinalAContenedorAjax(m);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr001Service - m�todo m_ajax_actualizar_agente", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	/**
	 * Realiza una b�squeda de productos en la BD en funci�n del ramo seleccionado
	 * (CRAMO).
	 * 
	 * @param request El HttpServletRequest que contiene la petici�n del cliente
	 *                web.
	 * @return
	 * @throws Exception
	 */
	private List buscaProductos(HttpServletRequest request) throws Exception {
		// Recuperar Productos segun ramo seleccionado
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();

		String CRAMO = getCampoTextual(request, "CRAMO");
		String TRAMO = getCampoTextual(request, "TRAMO");
		String CTERMFIN = "1"; // a scao: debido al analisis "AN121_..." getCampoTextual(request, "CTERMFIN");

		// Poner ramo seleccionado en session
		Map selectedRamo = new HashMap();
		selectedRamo.put("CRAMO", CRAMO);
		selectedRamo.put("TRAMO", TRAMO);
		request.getSession().setAttribute("axisctr_selectedRamo", selectedRamo);

		// Nos cargamos los productos por si hubiera un query anterior
		request.getSession().removeAttribute("axisctr_listaProductos");

		// Cargamos productos
		if (!isEmpty(CRAMO)) {
			String tipo = this.getCampoTextual(request, "tipo");
			Map map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES__F_GET_RAMPRODUCTOS(tipo, new BigDecimal(CRAMO), new BigDecimal("0")); // ,new
																														// BigDecimal(CTERMFIN));
			List plListaProductos = (List) ajax.rellenarPlAContenedorAjax(map);

			request.getSession().setAttribute("axisctr_listaProductos", plListaProductos);
			logger.debug((List) request.getSession().getAttribute("axisctr_listaProductos"));
			return plListaProductos;
		} else {
			Map map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES__F_GET_PRODUCTOS(null, null, null);
			List plListaProductos = (List) ajax.rellenarPlAContenedorAjax(map);
			request.getSession().setAttribute("axisctr_listaProductos", plListaProductos);
			logger.debug((List) request.getSession().getAttribute("axisctr_listaProductos"));
			return plListaProductos;
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
		// request.getSession().setAttribute("LST_PRODUCTOS",
		// plListaProductos);
		logger.debug((List) request.getSession().getAttribute("LST_PRODUCTOS"));

		return plCOBJASE;

	}

	/**
	 * Realiza una b�squeda de productos por Ajax.
	 * 
	 * @see buscaProductos
	 * @param request El HttpServletRequest que contiene la petici�n del cliente
	 *                web.
	 */
	public void m_ajax_busqueda_productos(HttpServletRequest request) {
		logger.debug("Axisctr001Service m_ajax_busqueda_productos");
		AjaxContainerService ajax = new AjaxContainerService();

		try {
			ajax.guardarContenidoFinalAContenedorAjax(this.buscaProductos(request));
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr001Service - m�todo m_ajax_busqueda_productos", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
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
			logger.error("Error en el servicio Axisctr033Service - m�todo m_ajax_busqueda_cobjase", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	// INI IAXIS-3160 CJMR 20/03/2019
	public void m_ajax_busqueda_actividades(HttpServletRequest request) {
		logger.debug("Axisctr017Service m_ajax_busqueda_actividades");
		AjaxContainerService ajax = new AjaxContainerService();
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {
			BigDecimal SPRODUC = getCampoNumerico(request, "SPRODUC");
			// IAXIS-10611 CJMR 2020/01/23
			Map map = new HashMap();
			if (!this.isEmpty(SPRODUC)) {
				map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_LISTVALORES__F_GET_CACTIVI(SPRODUC, null);
			}

			logger.debug(map);
			ajax.guardarContenidoFinalAContenedorAjax((List) tratarRETURNyMENSAJES(request, map, false));

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr017Service - m�todo m_ajax_busqueda_actividades", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}
	// FIN IAXIS-3160 CJMR 20/03/2019

}