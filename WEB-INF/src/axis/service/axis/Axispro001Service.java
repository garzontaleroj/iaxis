package axis.service.axis;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.struts.action.ActionForward;

import axis.jdbc.PAC_IAX_ECO_MONEDAS;
import axis.jdbc.PAC_IAX_FONDOS;
import axis.jdbc.PAC_IAX_MNTPROD;
import axis.mvc.control.axis.Axispro001Action;
import axis.mvc.model.UsuarioBean;
import axis.util.Constantes;

public class Axispro001Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE INICIALIZACION
	 *******************************************/
	/*********************************************************************************************************************/

	/**
	 * @param request    El HttpServletRequest que contiene la petici�n del cliente
	 *                   web.
	 * @param thisAction El Action que invoca a este Servicio.
	 */
	public void m_form(HttpServletRequest request, Axispro001Action thisAction) {
		logger.debug("Axispro001Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map OB_IAX_PRODUCTO = new HashMap();

		try {

			BigDecimal SPRODUC = getCampoNumerico(request, "SPRODUC");
			request.setAttribute("SPRODUCKEY", SPRODUC);

			request.getSession().setAttribute("SPRODUCKEY", SPRODUC);
			BigDecimal CACTIVI = getCampoNumerico(request, "CACTIVI");

			if (!isEmpty(SPRODUC)) {

				Map map = new PAC_IAX_MNTPROD((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_MNTPROD__F_GET_PRODUCTO(SPRODUC);
				logger.debug(map);
				OB_IAX_PRODUCTO = (Map) tratarRETURNyMENSAJES(request, map);

				// logger.debug(ConversionUtil.printAsXML(OB_IAX_PRODUCTO, "OB_IAX_PRODUCTO"));
				List ACTIVID = (List) OB_IAX_PRODUCTO.get("ACTIVID");

				if ((CACTIVI == null) && (!isEmpty(ACTIVID))) {
					recuperarDatosActividades(SPRODUC, OB_IAX_PRODUCTO, usuario, request);
					CACTIVI = (BigDecimal) ((Map) ((Map) ACTIVID.get(0)).get("OB_IAX_PRODACTIVIDADES")).get("CACTIVI");

				}
				map = new PAC_IAX_MNTPROD((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_MNTPROD__F_GET_DOCUMENTOS(SPRODUC);
				ArrayList lstdoc = (ArrayList) tratarRETURNyMENSAJES(request, map);
				request.setAttribute("lstdoc", lstdoc);

				// MLR - 05/04/2013 - 0025803: RSA001 - Ampliar los decimales que utiliza iAXIS
				PAC_IAX_ECO_MONEDAS pac_iax_eco_monedas = new PAC_IAX_ECO_MONEDAS(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
				Map mapa = pac_iax_eco_monedas.ejecutaPAC_IAX_ECO_MONEDAS__F_OBTENER_MONEDA_PRODUCTO2(SPRODUC);
				logger.debug(mapa);
				request.getSession().setAttribute(("CMONEDAPROD"), mapa.get("RETURN"));
			}

			this.m_garantias_lista(request, thisAction, CACTIVI);

		} catch (Exception e) {
			logger.error("Error en el servicio axispro001Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			request.setAttribute("mntproducto", OB_IAX_PRODUCTO);
			request.getSession().setAttribute("mntproducto", OB_IAX_PRODUCTO);

			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}

	}

	/**
	 * M�todo que se llama al inicio de este flujo.
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_init(HttpServletRequest request, Axispro001Action thisAction) {

		if (request.getParameter("paginar") == null) {
			/*
			 * Quitar ciertos datos de otros productos que hayan quedado en Session Debido
			 * al Ajax o a otras circunstancias
			 */

			// Atributos de displaytags Ajax
			Enumeration<String> attributeNames = request.getSession().getAttributeNames();

			while (attributeNames.hasMoreElements()) {
				String attribute = attributeNames.nextElement();
				if (attribute.startsWith("DATTECN_") || attribute.startsWith("UNITULK_"))
					request.getSession().removeAttribute(attribute);
			}

			// Otros atributos
			request.getSession().removeAttribute("AXISMPRXXX");
			request.getSession().removeAttribute("ACTIVIDAD");
		}

		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));

	}

	private void recuperarDatosActividades(BigDecimal SPRODUC, Map OB_IAX_PRODUCTO, UsuarioBean usuario,
			HttpServletRequest request) throws Exception {
		/* Recuperar datos de actividades */
		List ACTIVID = (List) OB_IAX_PRODUCTO.get("ACTIVID");

		if (ACTIVID != null) {
			// existen valores para cada una
			BigDecimal CACTIVI = (BigDecimal) ((Map) ((Map) ACTIVID.get(0)).get("OB_IAX_PRODACTIVIDADES"))
					.get("CACTIVI");
			String TACTIVI = (String) ((Map) ((Map) ACTIVID.get(0)).get("OB_IAX_PRODACTIVIDADES")).get("TACTIVI");

			request.setAttribute("ACTIVIDAD", CACTIVI);
			request.setAttribute("TACTIVIDAD", TACTIVI);

			request.getSession().setAttribute("ACTIVIDAD", CACTIVI);
			request.getSession().setAttribute("TACTIVIDAD", TACTIVI);

			Map map = new PAC_IAX_MNTPROD((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_MNTPROD__F_GET_DETAILACTIVID(SPRODUC, CACTIVI);
			logger.debug(map);
			Map actividades = (Map) tratarRETURNyMENSAJES(request, map);

			request.setAttribute("mntproducto_actividades", actividades);

			request.getSession().setAttribute("mntproducto_actividades", actividades);

		}

		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	/*********************************************************************************************************************/
	/************************************************
	 * M�TODOS DE ACTUALIZACI�N
	 *******************************************/
	/*********************************************************************************************************************/

	/**
	 * AXISPRO001_DATOSTECNICOS
	 */
	public void datosTecnicos_RecargarVigencias(HttpServletRequest request) {
		logger.debug("Axispro001Service datosTecnicos_RecargarVigencias");
		AjaxContainerService ajax = new AjaxContainerService();
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {

			BigDecimal NCODINT = getCampoNumerico(request, "NCODINT");
			BigDecimal CTIPO = getCampoNumerico(request, "CTIPO");

			// Guardamos en sessi�n el CTIPO seleccionado
			request.setAttribute("DATTECN_NCODINT", NCODINT);
			request.setAttribute("DATTECN_CTIPO", CTIPO);

			request.getSession().setAttribute("DATTECN_NCODINT", NCODINT);
			request.getSession().setAttribute("DATTECN_CTIPO", CTIPO);

			PAC_IAX_MNTPROD pac_iax_mntprod = new PAC_IAX_MNTPROD(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map map = pac_iax_mntprod.ejecutaPAC_IAX_MNTPROD__F_GET_INTERTECMOV(NCODINT, CTIPO);
			logger.debug(map);
			List<Map> INTERTECMOV = (List<Map>) ajax.rellenarPlAContenedorAjax(map);

			HashMap prueba = new HashMap();
			prueba.put("DATTECN_CTIPO", CTIPO);

			INTERTECMOV.add(prueba);

			// Guardar la lista en Ajax y en session
			ajax.guardarContenidoFinalAContenedorAjax(INTERTECMOV);

			request.setAttribute("DATTECN_INTERTECMOV", INTERTECMOV);
			request.getSession().removeAttribute("DATTECN_INTERTECMOVDET");

			request.getSession().setAttribute("DATTECN_INTERTECMOV", INTERTECMOV);

		} catch (Exception e) {
			logger.error("Error en el servicio axispro001Service - m�todo datosTecnicos_RecargarVigencias", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
			request.getSession().removeAttribute("DATTECN_INTERTECMOV");
			request.getSession().removeAttribute("DATTECN_INTERTECMOVDET");
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());

			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));

		}
	}

	public void datosTecnicos_RecargarTramos(HttpServletRequest request) {
		logger.debug("Axispro001Service datosTecnicos_RecargarTramos");
		AjaxContainerService ajax = new AjaxContainerService();
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {

			BigDecimal NCODINT = getCampoNumerico(request, "NCODINT");
			BigDecimal CTIPO = getCampoNumerico(request, "CTIPO");
			java.sql.Date FINICIO = stringToSqlDate(getCampoTextual(request, "FINICIO"));

			request.setAttribute("NCODINT", NCODINT);
			request.setAttribute("CTIPO", CTIPO);
			request.setAttribute("FINICIO", FINICIO);

			request.getSession().setAttribute("NCODINT", NCODINT);
			request.getSession().setAttribute("CTIPO", CTIPO);
			request.getSession().setAttribute("FINICIO", FINICIO);

			// Guardamos en sessi�n el CTIPO seleccionado
			request.setAttribute("DATTECN_CTIPO", CTIPO);
			// Guardamos en sessi�n el FINICIO seleccionado
			request.setAttribute("DATTECN_FINICIO", FINICIO);

			// Guardamos en sessi�n el CTIPO seleccionado
			request.getSession().setAttribute("DATTECN_CTIPO", CTIPO);
			// Guardamos en sessi�n el FINICIO seleccionado
			request.getSession().setAttribute("DATTECN_FINICIO", FINICIO);

			HashMap prueba = new HashMap();
			prueba.put("DATTECN_CTIPO", CTIPO);
			prueba.put("DATTECN_FINICIO", FINICIO);

			PAC_IAX_MNTPROD pac_iax_mntprod = new PAC_IAX_MNTPROD(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map map = pac_iax_mntprod.ejecutaPAC_IAX_MNTPROD__F_GET_INTERTECMOVDET(NCODINT, CTIPO, FINICIO);
			logger.debug(map);
			List<Map> INTERTECMOVDET = (List<Map>) ajax.rellenarPlAContenedorAjax(map);

			INTERTECMOVDET.add(prueba);

			// Guardar la lista en Ajax y en session
			ajax.guardarContenidoFinalAContenedorAjax(INTERTECMOVDET);

			// ajax.guardarContenidoFinalAContenedorAjax(prueba);

			request.setAttribute("DATTECN_INTERTECMOVDET", INTERTECMOVDET);
			request.getSession().setAttribute("DATTECN_INTERTECMOVDET", INTERTECMOVDET);

		} catch (Exception e) {
			logger.error("Error en el servicio axispro001Service - m�todo datosTecnicos_RecargarTramos", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
			request.getSession().removeAttribute("DATTECN_INTERTECMOVDET");
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	/*
	 * void testUnitLinked(Map OB_IAX_PRODUCTO) { // Test para
	 * axispro001_datosunitlinked List MODELOSINV=new ArrayList(); Map
	 * OB_IAX_MODINV=new HashMap(); Map map=new HashMap();
	 * 
	 * OB_IAX_MODINV.put("CMODINV", new BigDecimal(1)); OB_IAX_MODINV.put("TMODINV",
	 * "FIX - Un model d'inversi�"); map.put("OB_IAX_MODINV", OB_IAX_MODINV);
	 * MODELOSINV.add(map);
	 * 
	 * OB_IAX_MODINV=new HashMap(); map=new HashMap(); OB_IAX_MODINV.put("CMODINV",
	 * new BigDecimal(2)); OB_IAX_MODINV.put("TMODINV",
	 * "VARIABLE - Un altre model d'inversi�"); map.put("OB_IAX_MODINV",
	 * OB_IAX_MODINV);
	 * 
	 * MODELOSINV.add(map);
	 * 
	 * List MODINVFONDO=new ArrayList(); Map OB_IAX_CODFON=new HashMap(); map=new
	 * HashMap();
	 * 
	 * OB_IAX_CODFON.put("CMODINV", new BigDecimal(1)); OB_IAX_CODFON.put("CCODFON",
	 * new BigDecimal(1)); OB_IAX_CODFON.put("TCODFON", "Fons 1 del model FIX");
	 * OB_IAX_CODFON.put("PINVERS", "48"); map.put("OB_IAX_CODFON", OB_IAX_CODFON);
	 * MODINVFONDO.add(map);
	 * 
	 * OB_IAX_CODFON=new HashMap(); map=new HashMap();
	 * 
	 * OB_IAX_CODFON.put("CMODINV", new BigDecimal(2)); OB_IAX_CODFON.put("CCODFON",
	 * new BigDecimal(2)); OB_IAX_CODFON.put("TCODFON",
	 * "Fons 1 del model VARIABLE"); OB_IAX_CODFON.put("PINVERS", "93");
	 * map.put("OB_IAX_CODFON", OB_IAX_CODFON); MODINVFONDO.add(map);
	 * 
	 * OB_IAX_CODFON=new HashMap(); map=new HashMap();
	 * 
	 * OB_IAX_CODFON.put("CMODINV", new BigDecimal(2)); OB_IAX_CODFON.put("CCODFON",
	 * new BigDecimal(3)); OB_IAX_CODFON.put("TCODFON",
	 * "Fons 2 del model VARIABLE"); OB_IAX_CODFON.put("PINVERS", "54");
	 * map.put("OB_IAX_CODFON", OB_IAX_CODFON);
	 * 
	 * MODINVFONDO.add(map);
	 * 
	 * OB_IAX_PRODUCTO.put("MODELOSINV", MODELOSINV);
	 * OB_IAX_PRODUCTO.put("MODINVFONDO", MODINVFONDO);
	 * 
	 * 
	 * // this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	 * 
	 * }
	 */

	/**
	 * AXPRO001_DATOSUNITLINKED
	 */
	public void datosUnitLinked_RecargarMODINVFONDO(HttpServletRequest request) {
		logger.debug("Axispro001Service datosUnitLinked_RecargarMODINVFONDO");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		AjaxContainerService ajax = new AjaxContainerService();
		try {
			BigDecimal CMODINV = getCampoNumerico(request, "CMODINV");
			BigDecimal sproduc = getCampoNumerico(request, "SPRODUC");
			logger.debug(CMODINV);
			// Guardamos en sessi�n el CMODINV seleccionado

			// Cutrez...pero no podemos recuperar el producto (sta en request)
			// Por lo que lo construimos de nuevo...
			Map OB_IAX_PRODUCTO = new HashMap();
			// testUnitLinked(OB_IAX_PRODUCTO);
			// request.setAttribute("mntproducto", OB_IAX_PRODUCTO); // Volver a "pasarlo" a
			// la request
			// request.getSession().setAttribute("mntproducto", OB_IAX_PRODUCTO); // Volver
			// a "pasarlo" a la request

			PAC_IAX_FONDOS pac_fondos = new PAC_IAX_FONDOS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map mFondos = pac_fondos.ejecutaPAC_IAX_FONDOS__F_GET_MODINVFONDOS(sproduc, CMODINV);
			List lstFondos = (List) mFondos.get("PMODINVFONDO");
			formdata.put("MODINVFONDO", lstFondos);
			ajax.guardarContenidoFinalAContenedorAjax(lstFondos);
			// List MODINVFONDO_SELECCION=new ArrayList();

			/*
			 * if (!isEmpty(OB_IAX_PRODUCTO)) { // Recuperar toda la lista MODINVFONDO List
			 * MODINVFONDO=(List)OB_IAX_PRODUCTO.get("MODINVFONDO"); if
			 * (!isEmpty(MODINVFONDO)) { // Emular una "SELECT": recuperar los registros
			 * OB_IAX_CODFON // de la lista que tengan el CMODINV solicitado for (int i=0;
			 * i<MODINVFONDO.size(); i++) { Map map=(Map)MODINVFONDO.get(i); // Outermap if
			 * (!isEmpty(map)) { Map OB_IAX_CODFON=(Map)map.get("OB_IAX_CODFON"); if
			 * (!isEmpty(OB_IAX_CODFON)) { if
			 * (CMODINV.equals((BigDecimal)OB_IAX_CODFON.get("CMODINV")))
			 * MODINVFONDO_SELECCION.add(map); } } }
			 * 
			 * // Guardar la lista en Ajax y en session
			 * ajax.guardarContenidoFinalAContenedorAjax(MODINVFONDO_SELECCION);
			 * 
			 * } }
			 */
		} catch (Exception e) {
			logger.error("Error en el servicio axispro001Service - m�todo datosUnitLinked_RecargarMODINVFONDO", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());

			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}

	/**
	 * ACTUALIZAR SECCION ACTIVIDADES
	 *
	 */
	public

			void m_cargar_actividades(HttpServletRequest request, Axispro001Action thisAction) {
		logger.debug("Axispro001Service m_cargar_actividades");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);

		// BigDecimal CACTIVI = (BigDecimal)formdata.get("CACTIVI");

		BigDecimal CACTIVI = getCampoNumerico(request, "CACTIVI");

		if (CACTIVI == null) {
			CACTIVI = (BigDecimal) request.getSession().getAttribute("ACTIVIDAD");
		}

		try {
			// TODO: Recuperar SPRODUC de modal
			BigDecimal SPRODUC = getCampoNumerico(request, "SPRODUC");
			Map map = new PAC_IAX_MNTPROD((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_MNTPROD__F_GET_DETAILACTIVID(SPRODUC, CACTIVI);
			logger.debug(map);
			Map actividades = (Map) tratarRETURNyMENSAJES(request, map);

			request.setAttribute("mntproducto_actividades", actividades);

			request.getSession().setAttribute("mntproducto_actividades", actividades);

		} catch (Exception e) {
			logger.error("Error en el servicio axispro001Service - m�todo m_cargar_actividades", e);

		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}

	/**
	 * Grabar datos modificados en la pantalla de edifici�n de datos generales
	 */
	public

			void m_cargar_datos_generales(HttpServletRequest request, Axispro001Action thisAction) {
		logger.debug("Axispro001Service m_cargar_datos_generales");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {
			// TODO: Recuperar TACTIVO de modal

			BigDecimal SPRODUC = getCampoNumerico(request, "SPRODUC");
			BigDecimal CRAMO = getCampoNumerico(request, "CRAMO");
			BigDecimal CMODALI = getCampoNumerico(request, "CMODALI");
			BigDecimal CTIPSEG = getCampoNumerico(request, "CTIPSEG");
			BigDecimal CCOLECT = getCampoNumerico(request, "CCOLECT");

			BigDecimal CACTIVO = getCampoNumerico(request, "CACTIVO");
			BigDecimal CTERMFIN = getCampoNumerico(request, "CTERMFIN");
			BigDecimal CTIPRIE = getCampoNumerico(request, "CTIPRIE");
			BigDecimal COBJASE = getCampoNumerico(request, "COBJASE");
			BigDecimal CSUBPRO = getCampoNumerico(request, "CSUBPRO");
			BigDecimal NMAXRIE = getCampoNumerico(request, "NMAXRIE");
			BigDecimal C2CABEZAS = getCampoNumerico(request, "C2CABEZAS");
			BigDecimal CAGRPRO = getCampoNumerico(request, "CAGRPRO");
			BigDecimal CDIVISA = getCampoNumerico(request, "CDIVISA");
			BigDecimal CPRPROD = getCampoNumerico(request, "CPRPROD");
			String TPRPROD = getCampoTextual(request, "TPRPROD");
			BigDecimal CCOMPANI = getCampoNumerico(request, "CCOMPANI");

			Map map = new PAC_IAX_MNTPROD((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_MNTPROD__F_SET_DATOSGENERALES(SPRODUC, CRAMO, CMODALI, CTIPSEG, CCOLECT, CACTIVO,
							CTERMFIN, CTIPRIE, COBJASE, CSUBPRO, NMAXRIE, C2CABEZAS, CAGRPRO, CDIVISA, CPRPROD,
							CCOMPANI);
			logger.debug(map);
			BigDecimal resultado = (BigDecimal) tratarRETURNyMENSAJES(request, map);
			if (SPRODUC == null)
				SPRODUC = new BigDecimal(String.valueOf(map.get("SPRODUC_NOU")));
			formdata.put("SPRODUC", String.valueOf(map.get("SPRODUC_NOU")));
			request.setAttribute("SPRODUC", String.valueOf(map.get("SPRODUC_NOU")));

			request.getSession().setAttribute("SPRODUC", String.valueOf(map.get("SPRODUC_NOU")));

			m_form(request, thisAction);

		} catch (Exception e) {
			logger.error("Error en el servicio axispro001Service - m�todo m_cargar_datos_generales", e);

		} finally {

			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));

		}
	}

	/**
	 * AXPRO001 PARA ACCEDER A GFI
	 */
	public void m_buscar_formula(HttpServletRequest request, Axispro001Action thisAction) {
		logger.debug("Axispro001Service m_buscar_formula");
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {
			// 1. push de los datos necesarios a la pila
			thisAction.topPila(request, "formdata_axispro001", formdata);

		} catch (Exception e) {
			logger.error("Error en el servicio Axispro001Service - m�todo m_buscar_formula", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}

	/**
	 * M�todo que prepara el salto a axispro031 desde axispro001 copi�ndole todo su
	 * formdata y pas�ndole los par�metros que axispro031 necesitar� para su flujo.
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_editar_actividad(HttpServletRequest request, Axispro001Action thisAction) {
		logger.debug("Axispro001Service m_editar_actividad");
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);

		try {

			logger.debug(formdata);
			thisAction.topPila(request, "formdata_axispro001", formdata);
			thisAction.topPila(request, Constantes.SALTARDESTINOACTION,
					new ActionForward("/axis_axispro031.do?operation=form"));
			thisAction.topPila(request, Constantes.SALTARORIGENACTION,
					new ActionForward("/axis_axispro001.do?operation=volverActividad"));

		} catch (Exception e) {
			logger.error("Error en el servicio Axispro001Service - m�todo m_editar_actividad", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}

	public void m_consultarParametros(HttpServletRequest request, Axispro001Action thisAction) {
		logger.debug("Axispro001Service m_consultarParametros");
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);

		try {
			// Push de los datos necesarios a la pila
			BigDecimal SPRODUC = getCampoNumerico(request, "SPRODUC");
			BigDecimal CACTIVI = (BigDecimal) request.getSession().getAttribute("ACTIVIDAD");
			thisAction.topPila(request, "SPRODUC", SPRODUC);
			thisAction.topPila(request, "CACTIVI", CACTIVI);

		} catch (Exception e) {
			logger.error("Error en el servicio Axispro001Service - m�todo m_consultarParametros", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}

	/**
	 * M�todo que prepara el salto a axispro032 desde axispro001 copi�ndole todo su
	 * formdata y pas�ndole los par�metros que axispro032 necesitar� para su flujo
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_consultarRecargo(HttpServletRequest request, Axispro001Action thisAction) {
		logger.debug("Axispro001Service m_consultarRecargo");
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);

		try {

			thisAction.topPila(request, "formdata_axispro001", formdata);
			thisAction.topPila(request, Constantes.SALTARDESTINOACTION,
					new ActionForward("/axis_axispro032.do?operation=form"));
			thisAction.topPila(request, Constantes.SALTARORIGENACTION,
					new ActionForward("/axis_axispro001.do?operation=volverRecargo"));

		} catch (Exception e) {
			logger.error("Error en el servicio Axispro001Service - m�todo m_consultarRecargo", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}

	public void m_volver(HttpServletRequest request, Axispro001Action thisAction) {
		logger.debug("Axispro001Service m_volver");
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {
			Map formdata_axispro001 = (Map) thisAction.removeTopPila(request, "formdata_axispro001");
			if (!isEmpty(formdata_axispro001)) {
				formdata.putAll(formdata_axispro001);
			}

			request.setAttribute("subpantalla", "garantias");
			request.getSession().setAttribute("subpantalla", "garantias");

			// renovarLista( request, thisAction); // por si las moscas
		} catch (Exception e) {
			logger.error("Error en el servicio Axispro001Service - m�todo m_volver", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

	public void m_volverActividad(HttpServletRequest request, Axispro001Action thisAction) {
		logger.debug("Axispro001Service m_volverActividad");
		Map formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);

		try {
			Map formdata_axispro001 = (Map) thisAction.removeTopPila(request, "formdata_axispro001");

			if (!AxisBaseService.isEmpty(formdata_axispro001))
				formdata.putAll(formdata_axispro001);
		} catch (Exception e) {
			logger.error("Error en el servicio Axispro001Service - m�todo m_volverActividad", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

	public void m_volverRecargo(HttpServletRequest request, Axispro001Action thisAction) {
		logger.debug("Axispro001Service m_volverRecargo");
		Map formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);

		try {
			Map formdata_axispro001 = (Map) thisAction.removeTopPila(request, "formdata_axispro001");

			if (!AxisBaseService.isEmpty(formdata_axispro001))
				formdata.putAll(formdata_axispro001);
		} catch (Exception e) {
			logger.error("Error en el servicio Axispro001Service - m�todo m_volverRecargo", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

	public void m_volverParam(HttpServletRequest request, Axispro001Action thisAction) {
		logger.debug("Axispro001Service m_volver");
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {
			formdata.put("SPRODUC", bigDecimalToString((BigDecimal) thisAction.removeTopPila(request, "SPRODUC")));
			formdata.put("CACTIVI", bigDecimalToString((BigDecimal) thisAction.removeTopPila(request, "CACTIVI")));

			request.setAttribute("ACTIVIDAD",
					bigDecimalToString((BigDecimal) thisAction.removeTopPila(request, "CACTIVI")));

			request.getSession().setAttribute("ACTIVIDAD",
					bigDecimalToString((BigDecimal) thisAction.removeTopPila(request, "CACTIVI")));

			// renovarLista( request, thisAction); // por si las moscas
		} catch (Exception e) {
			logger.error("Error en el servicio Axispro001Service - m�todo m_volver", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

	/**
	 * Recupera para el iframe de lista de garantias su contenido
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_garantias_lista(HttpServletRequest request, Axispro001Action thisAction, BigDecimal CACTIVI) {
		logger.debug("Axispro001Service m_garantias_lista");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {
			BigDecimal SPRODUC = getCampoNumerico(request, "SPRODUC");
			if (isEmpty(CACTIVI) && !isEmpty(request.getAttribute("ACTIVIDAD"))) {
				CACTIVI = new BigDecimal(String.valueOf(request.getAttribute("ACTIVIDAD")));
			}
			if (isEmpty(CACTIVI)) {
				CACTIVI = getCampoNumerico(request, "CACTIVI");
			}
			if (isEmpty(CACTIVI) && !isEmpty(request.getSession().getAttribute("ACTIVIDAD"))) {
				CACTIVI = new BigDecimal(String.valueOf(request.getSession().getAttribute("ACTIVIDAD")));
			}
			if (!isEmpty(CACTIVI) && !isEmpty(SPRODUC)) {
				ArrayList mntproducto_garantias = (ArrayList) this.tratarRETURNyMENSAJES(request,
						new PAC_IAX_MNTPROD((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
								.ejecutaPAC_IAX_MNTPROD__F_GET_GARANTIAS(SPRODUC, CACTIVI));
				request.setAttribute("mntproducto_garantias", mntproducto_garantias);
				request.getSession().setAttribute("mntproducto_garantias", mntproducto_garantias);

			}
		} catch (Exception e) {
			logger.error("Error en el servicio axispro001Service - m�todo m_garantias_lista", e);
		} finally {
		}
	}

	/**
	 * Recupera para el iframe de lista de garantias su contenido
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_garantias_lista(HttpServletRequest request, Axispro001Action thisAction) {
		logger.debug("Axispro001Service m_garantias_lista");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {
			BigDecimal SPRODUC = getCampoNumerico(request, "SPRODUC");
			BigDecimal CACTIVI = getCampoNumerico(request, "CACTIVI");

			if (isEmpty(CACTIVI) && !isEmpty(request.getSession().getAttribute("ACTIVIDAD"))) {
				CACTIVI = new BigDecimal(String.valueOf(request.getSession().getAttribute("ACTIVIDAD")));
			}
			if (isEmpty(CACTIVI) && !isEmpty(request.getAttribute("ACTIVIDAD"))) {
				CACTIVI = new BigDecimal(String.valueOf(request.getAttribute("ACTIVIDAD")));
			}

			if (!isEmpty(CACTIVI) && !isEmpty(SPRODUC)) {
				ArrayList mntproducto_garantias = (ArrayList) this.tratarRETURNyMENSAJES(request,
						new PAC_IAX_MNTPROD((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
								.ejecutaPAC_IAX_MNTPROD__F_GET_GARANTIAS(SPRODUC, CACTIVI));
				request.setAttribute("mntproducto_garantias", mntproducto_garantias);

				request.getSession().setAttribute("mntproducto_garantias", mntproducto_garantias);

				request.getSession().setAttribute("ACTIVIDAD", CACTIVI);

			}
		} catch (Exception e) {
			logger.error("Error en el servicio axispro001Service - m�todo m_garantias_lista", e);
		} finally {
		}
	}

	/**
	 * Recupera para el iframe de lista de garantias su contenido
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_delete_garantia(HttpServletRequest request, Axispro001Action thisAction) {
		logger.debug("Axispro001Service m_delete_garantia");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {
			BigDecimal SPRODUC = getCampoNumerico(request, "SPRODUC");
			BigDecimal CGARANT = getCampoNumerico(request, "GARANTIA");
			BigDecimal CACTIVI = getCampoNumerico(request, "CACTIVI");
			Map map = new PAC_IAX_MNTPROD((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_MNTPROD__F_DEL_GARANTIA(SPRODUC, CGARANT, CACTIVI);

			tratarRETURNyMENSAJES(request, map);

		} catch (Exception e) {
			logger.error("Error en el servicio axispro001Service - m�todo m_delete_garantia", e);
		}
	}

	public void m_eliminar(HttpServletRequest request, Axispro001Action thisAction) {
		logger.debug("Axispro001Service m_eliminar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {
			PAC_IAX_MNTPROD pac_axis_mntprod = new PAC_IAX_MNTPROD(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			request.setAttribute("OK", "!OK");

			String CCODIGO = getCampoTextual(request, "CCODIGO");
			logger.debug("CCODIGO=" + CCODIGO);
			String CVALAXIS = getCampoTextual(request, "CVALAXIS");
			logger.debug("CVALAXIS=" + CVALAXIS);
			BigDecimal SPRODUC = getCampoNumerico(request, "SPRODUC");
			logger.debug("SPRODUC=" + SPRODUC);

			Map map = pac_axis_mntprod.ejecutaPAC_IAX_MNTPROD__F_DEL_INTERFICIE(CCODIGO, CVALAXIS);
			logger.debug(map);

			if (((BigDecimal) tratarRETURNyMENSAJES(request, map)).intValue() == 0) {
				request.setAttribute("OK", "OK"); // guardamos, no ha habido error

			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axispro052Service - m�todo m_eliminar", e);
			thisAction.guardarMensaje(request, "1000052", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(Axisctr031Service.class));

		}
	}

}
