package axis.service.modal;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_ECO_MONEDAS;
import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.jdbc.PAC_IAX_MNTPROD;
import axis.mvc.control.modal.Axispro005Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AjaxContainerService;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

public class Axispro005Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	/**
	 * M�todo que carga los datos de gesti�n del producto
	 * 
	 * @param request
	 * @param thisAction
	 * @throws Exception
	 */
	private void cargarDatosGestion(HttpServletRequest request) throws Exception {
		Map formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		BigDecimal SPRODUC = getCampoNumerico(request, "SPRODUC");
		// Carga de las PAC_IAX PL/SQL
		PAC_IAX_MNTPROD pac_axis_mntprod = new PAC_IAX_MNTPROD(
				(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

		// Datos gestion
		Map map = pac_axis_mntprod.ejecutaPAC_IAX_MNTPROD__F_GET_GESTION(SPRODUC);
		Map params = (Map) tratarRETURNyMENSAJES(request, map, false);
		logger.debug(params);

		/*
		 * request.setAttribute("OB_IAX_PRODUCTO", !isEmpty(params) ? params : new
		 * HashMap());
		 */

		formdata.putAll(params);
		/*
		 * Map map0 =
		 * pac_axis_listvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTCTIPGES();
		 * logger.debug (map0); List CTIPGES = (List)tratarRETURNyMENSAJES(request,
		 * map0, false);
		 * 
		 * request.setAttribute("axispro001_listaCtipges", !isEmpty(CTIPGES) ? CTIPGES :
		 * new ArrayList());
		 */

		this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
	}

	private void cargarDatosCombos(HttpServletRequest request) throws Exception {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap combos = new HashMap();
		Map map = null;

		BigDecimal SPRODUC = getCampoNumerico(request, "SPRODUC");
		PAC_IAX_LISTVALORES pac_axis_listvalores = new PAC_IAX_LISTVALORES(
				(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
		Map map1 = pac_axis_listvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTCDURACI();
		logger.debug(map1);
		List CDURACI = (List) tratarRETURNyMENSAJES(request, map1, false);

		request.setAttribute("axispro001_listaCduraci", !isEmpty(CDURACI) ? CDURACI : new ArrayList());

		Map map2 = pac_axis_listvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTCTEMPOR();
		logger.debug(map2);
		List CTEMPOR = (List) tratarRETURNyMENSAJES(request, map2, false);

		request.setAttribute("axispro001_listaCtempor", !isEmpty(CTEMPOR) ? CTEMPOR : new ArrayList());

		Map map3 = pac_axis_listvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTCDURMIN();
		logger.debug(map3);
		List CDURMIN = (List) tratarRETURNyMENSAJES(request, map3, false);

		request.setAttribute("axispro001_listaCdurmin", !isEmpty(CDURMIN) ? CDURMIN : new ArrayList());

		Map map4 = pac_axis_listvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTCDURMAX();
		logger.debug(map4);
		List CDURMAX = (List) tratarRETURNyMENSAJES(request, map4, false);

		request.setAttribute("axispro001_listaCdurmaxis", !isEmpty(CDURMAX) ? CDURMAX : new ArrayList());

		Map map5 = pac_axis_listvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTCTIPEFE();
		logger.debug(map5);
		List CTIPEFE = (List) tratarRETURNyMENSAJES(request, map5, false);

		request.setAttribute("axispro001_listaCtipefe", !isEmpty(CTIPEFE) ? CTIPEFE : new ArrayList());

		Map map6 = pac_axis_listvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTCREVALI();
		logger.debug(map6);
		List CREVALI = (List) tratarRETURNyMENSAJES(request, map6, false);

		request.setAttribute("axispro001_listaCrevali", !isEmpty(CREVALI) ? CREVALI : new ArrayList());

		Map map7 = pac_axis_listvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTCTARMAN();
		logger.debug(map7);
		List CTARMAN = (List) tratarRETURNyMENSAJES(request, map7, false);

		request.setAttribute("axispro001_listaCtarman", !isEmpty(CTARMAN) ? CTARMAN : new ArrayList());

		Map map8 = pac_axis_listvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTSINO();
		logger.debug(map8);
		List SINO = (List) tratarRETURNyMENSAJES(request, map8, false);

		request.setAttribute("axispro001_listaSino", !isEmpty(SINO) ? SINO : new ArrayList());

		Map map9 = pac_axis_listvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTCRETENI();
		logger.debug(map9);
		List CRETENI = (List) tratarRETURNyMENSAJES(request, map9, false);

		request.setAttribute("axispro001_listaCreteni", !isEmpty(CRETENI) ? CRETENI : new ArrayList());

		Map map10 = pac_axis_listvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTCPRORRA();
		logger.debug(map10);
		List CPRORRA = (List) tratarRETURNyMENSAJES(request, map10, false);

		request.setAttribute("axispro001_listaCprorra", !isEmpty(CPRORRA) ? CPRORRA : new ArrayList());

		Map map11 = pac_axis_listvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTCPRIMIN();
		logger.debug(map11);
		List CPRIMIN = (List) tratarRETURNyMENSAJES(request, map11, false);

		request.setAttribute("axispro001_listaCprimin", !isEmpty(CPRIMIN) ? CPRIMIN : new ArrayList());

		Map map12 = pac_axis_listvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTFORMULAS(SPRODUC);
		logger.debug(map12);
		List FORMULAS = (List) tratarRETURNyMENSAJES(request, map12, false);

		request.setAttribute("axispro001_listaFormulas", !isEmpty(FORMULAS) ? FORMULAS : new ArrayList());
		this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
	}

	/**
	 * M�todo que se llama al inicio de este flujo. Realiza la carga inicial de los
	 * datos de los combos.
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_form(HttpServletRequest request, Axispro005Action thisAction) {
		logger.debug("Axispro005Service m_form");
		Map formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {

			// if (isEmpty(formdata.get("OK")) &&
			// !String.valueOf(formdata.get("OK")).equals("1"))

			if (!isEmpty(request.getParameter("RECARGAR"))
					|| (!isEmpty(formdata.get("OK")) && String.valueOf(formdata.get("OK")).equals("1"))) {
				int a = 0;

			} else
				cargarDatosGestion(request);

			cargarDatosCombos(request);

			request.setAttribute("hay_cambios_en_duraciones", getCampoTextual(request, "hay_cambios_en_duraciones"));
		} catch (Exception e) {
			logger.error("Error en el servicio Axispro005Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
	}

	/**
	 * M�todo que actualiza los datos de gesti�n de la pantalla via AJAX.
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_ajax_set_datos(HttpServletRequest request, Axispro005Action thisAction) {
		logger.debug("Axispro005Service m_ajax_set_datos");
		AjaxContainerService ajax = new AjaxContainerService();
		try {
			UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

			BigDecimal SPRODUC = getCampoNumerico(request, "SPRODUC");
			logger.debug("Producte(SPRODUC):" + SPRODUC);
			BigDecimal CDURACI = getCampoNumerico(request, "CDURACI");
			logger.debug("Duraci�(CDURACI):" + CDURACI);
			BigDecimal CTEMPOR = getCampoNumerico(request, "CTEMPOR");
			logger.debug("Permet temporal(CTEMPOR):" + CTEMPOR);
			BigDecimal NDURCOB = getCampoNumerico(request, "NDURCOB");
			logger.debug("Duraci� pagaments(NDURCOB):" + NDURCOB);

			BigDecimal CDURMIN = getCampoNumerico(request, "CDURMIN");
			logger.debug("Duraci� m�nima(CDURMIN):" + CDURMIN);
			BigDecimal NVTOMIN = getCampoNumerico(request, "NVTOMIN");
			logger.debug("(NVTOMIN):" + NVTOMIN);
			BigDecimal CDURMAX = getCampoNumerico(request, "CDURMAX");
			logger.debug("Duraci� m�xima(CDURMAX):" + CDURMAX);
			BigDecimal NVTOMAX = getCampoNumerico(request, "NVTOMAX");
			logger.debug("(NVTOMAX):" + NVTOMAX);

			BigDecimal CTIPEFE = getCampoNumerico(request, "CTIPEFE");
			logger.debug("Tipus renovaci�(CTIPEFE):" + CTIPEFE);
			BigDecimal NRENOVA = getCampoNumerico(request, "NRENOVA");
			logger.debug("(NRENOVA):" + NRENOVA);
			BigDecimal CMODREN = getCampoNumerico(request, "CMODREN");
			logger.debug("Mod. dia renovaci�(CMODREN):" + CMODREN);

			BigDecimal CPRODCAR = getCampoNumerico(request, "CPRODCAR");
			logger.debug("Passa cartera(CPRODCAR):" + CPRODCAR);

			BigDecimal CREVALI = getCampoNumerico(request, "CREVALI");
			logger.debug("Tipus revaloritzaci�(CREVALI):" + CREVALI);
			BigDecimal PREVALI = getCampoNumerico(request, "PREVALI");
			logger.debug("(PREVALI):" + PREVALI);
			BigDecimal IREVALI = getCampoNumerico(request, "IREVALI");
			logger.debug("(IREVALI):" + IREVALI);
			BigDecimal CTARMAN = getCampoNumerico(request, "CTARMAN");
			logger.debug("Tipus tarifa(CTARMAN):" + CTARMAN);

			BigDecimal CREASEG = getCampoNumerico(request, "CREASEG");
			logger.debug("Reasseguran�a(CREASEG):" + CREASEG);
			BigDecimal CRETENI = getCampoNumerico(request, "CRETENI");
			logger.debug("Estat proposta(CRETENI):" + CRETENI);
			BigDecimal CPRORRA = getCampoNumerico(request, "CPRORRA");
			logger.debug("T.prorrateig(CPRORRA):" + CPRORRA);
			BigDecimal CPRIMIN = getCampoNumerico(request, "CPRIMIN");
			logger.debug("Tipus Prima min(CPRIMIN):" + CPRIMIN);

			BigDecimal IPRIMIN = getCampoNumerico(request, "IPRIMIN");
			logger.debug("Import prima minima(IPRIMIN):" + IPRIMIN);
			BigDecimal CCLAPRI = getCampoNumerico(request, "CCLAPRI");
			logger.debug("FORMULA(CCLAPRI):" + CCLAPRI);
			BigDecimal IPMINFRA = getCampoNumerico(request, "IPMINFRA");
			logger.debug("Import de la prima minima fraccionada(IPMINFRA):" + IPMINFRA);
			BigDecimal NEDAMIC = getCampoNumerico(request, "NEDAMIC");
			logger.debug("Edat min ctr.(NEDAMIC):" + NEDAMIC);

			BigDecimal CIEDMIC = getCampoNumerico(request, "CIEDMIC");
			logger.debug("(CIEDMIC):" + CIEDMIC);
			BigDecimal NEDAMAC = getCampoNumerico(request, "NEDAMAC");
			logger.debug("Edat m�x ctr.(NEDAMAC):" + NEDAMAC);
			BigDecimal CIEDMAC = getCampoNumerico(request, "CIEDMAC");
			logger.debug("(CIEDMAC):" + CIEDMAC);
			BigDecimal NEDAMAR = getCampoNumerico(request, "NEDAMAR");
			logger.debug("Edat m�x ren.(NEDAMAR):" + NEDAMAR);

			BigDecimal CIEDMAR = getCampoNumerico(request, "CIEDMAR");
			logger.debug("(CIEDMAR):" + CIEDMAR);
			BigDecimal NEDMI2C = getCampoNumerico(request, "NEDMI2C");
			logger.debug("Edat min ctr 2 aseg.(NEDMI2C):" + NEDMI2C);
			BigDecimal CIEMI2C = getCampoNumerico(request, "CIEMI2C");
			logger.debug("(CIEMI2C):" + CIEMI2C);
			BigDecimal NEDMA2C = getCampoNumerico(request, "NEDMA2C");
			logger.debug("Edat m�x ctr 2 aseg.(NEDMA2C):" + NEDMA2C);

			BigDecimal CIEMA2C = getCampoNumerico(request, "CIEMA2C");
			logger.debug("(CIEMA2C):" + CIEMA2C);
			BigDecimal NEDMA2R = getCampoNumerico(request, "NEDMA2R");
			logger.debug("Edat m�x ren 2 ASEG.(NEDMA2R):" + NEDMA2R);
			BigDecimal CIEMA2R = getCampoNumerico(request, "CIEMA2R");
			logger.debug("(CIEMA2R):" + CIEMA2R);
			BigDecimal NSEDMAC = getCampoNumerico(request, "NSEDMAC");
			logger.debug("Sum maxis edad(NSEDMAC):" + NSEDMAC);

			BigDecimal CISEMAC = getCampoNumerico(request, "CISEMAC");
			logger.debug("(CISEMAC):" + CISEMAC);
			BigDecimal CVINPOL = getCampoNumerico(request, "CVINPOL");
			logger.debug("P�lissa vinculada(CVINPOL):" + CVINPOL);
			BigDecimal CVINPRE = getCampoNumerico(request, "CVINPRE");
			logger.debug("edat maxis ctr.(CVINPRE):" + CVINPRE);
			BigDecimal CCUESTI = getCampoNumerico(request, "CCUESTI");
			logger.debug("Questionari salut.(CCUESTI):" + CCUESTI);
			BigDecimal CCTACOR = getCampoNumerico(request, "CCTACOR");
			logger.debug("Llibreta(CCTACOR):" + CCTACOR);
			BigDecimal CPREAVISO = getCampoNumerico(request, "CPREAVISO");
			logger.debug("PREAVISO(CPREAVISO):" + CPREAVISO);

			// Carga de las PAC_IAX PL/SQL
			PAC_IAX_MNTPROD pac_axis_mntprod = new PAC_IAX_MNTPROD(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			// Datos display
			Map map = pac_axis_mntprod.ejecutaPAC_IAX_MNTPROD__F_SET_GESTION(SPRODUC, CDURACI, CTEMPOR, NDURCOB,
					CDURMIN, NVTOMIN, CDURMAX, NVTOMAX, CTIPEFE, NRENOVA, CMODREN, CPRODCAR, CREVALI, PREVALI, IREVALI,
					CTARMAN, CREASEG, CRETENI, CPRORRA, CPRIMIN, IPRIMIN, CCLAPRI, IPMINFRA, NEDAMIC, CIEDMIC, NEDAMAC,
					CIEDMAC, NEDAMAR, CIEDMAR, NEDMI2C, CIEMI2C, NEDMA2C, CIEMA2C, NEDMA2R, CIEMA2R, NSEDMAC, CISEMAC,
					CVINPOL, CVINPRE, CCUESTI, CCTACOR, CPREAVISO);
			logger.debug("set gestio ..." + map);
			BigDecimal params = (BigDecimal) ajax.rellenarPlAContenedorAjax(map);
			System.out.println("Constantes.AJAXCONTAINER :: " + Constantes.AJAXCONTAINER);

			// Guardamos lo que sea que haya devuelto al contenedor Ajax.
			// Object[] resultadoAjax = (Object[]) ajax.rellenarPlAContenedorAjax (map);
			// new String[] {Constantes.OPERACION_AJAX_OK,
			// Constantes.OPERACION_AJAX_ERROR});
			List RESULTADO = new ArrayList();

			if (new BigDecimal("0").equals(params)) {
				Map OK = new HashMap();
				OK.put(Constantes.OPERACION_AJAX_OK, Constantes.OPERACION_AJAX_OK);
				RESULTADO.add(OK);
			} else {
				Map ERROR = new HashMap();
				ERROR.put(Constantes.OPERACION_AJAX_ERROR, Constantes.OPERACION_AJAX_ERROR);
				RESULTADO.add(ERROR);
			}

			ajax.guardarContenidoFinalAContenedorAjax(RESULTADO);

			// System.out.println("params :: "+ params);
			ajax.guardarContenidoFinalAContenedorAjax("hol");
			System.out.println("ajax :: " + ajax.toString());
			System.out.println("ajax 2:: " + ajax);
			System.out.println("ajax 3:: " + ajax.getAjaxContainer());
			// if(new BigDecimal("0").equals(params))
			ajax.guardarContenidoFinalAContenedorAjax(Constantes.OPERACION_AJAX_OK);
			// else
			// ajax.guardarContenidoFinalAContenedorAjax(Constantes.OPERACION_AJAX_ERROR);

			System.out.println("ajax 33:: " + ajax.getAjaxContainer());

		} catch (Exception e) {
			logger.error("Error en el servicio Axispro005Service - m�todo m_ajax_set_datos", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			// request.setAttribute(Constantes.AJAXCONTAINER,
			// ajax.procesarContenedorAjax());
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.getAjaxContainer());
			System.out.println("ajax.procesarContenedorAjax() :: " + ajax.procesarContenedorAjax());
			System.out.println("ajax :: " + ajax.toString());
			System.out.println("ajax 2:: " + ajax);
			System.out.println("ajax 3:: " + ajax.getAjaxContainer());
		}
		this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
	}

	/**
	 * M�todo que actualiza los datos de gesti�n de la pantalla via AJAX.
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_setDatosGestion(HttpServletRequest request, Axispro005Action thisAction) {
		logger.debug("Axispro005Service m_ajax_set_datos");
		Map formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {
			UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

			BigDecimal SPRODUC = getCampoNumerico(request, "SPRODUC");
			logger.debug("Producte(SPRODUC):" + SPRODUC);
			BigDecimal CDURACI = getCampoNumerico(request, "CDURACI");
			logger.debug("Duraci�(CDURACI):" + CDURACI);
			BigDecimal CTEMPOR = getCampoNumerico(request, "CTEMPOR");
			logger.debug("Permet temporal(CTEMPOR):" + CTEMPOR);
			BigDecimal NDURCOB = getCampoNumerico(request, "NDURCOB");
			logger.debug("Duraci� pagaments(NDURCOB):" + NDURCOB);

			BigDecimal CDURMIN = getCampoNumerico(request, "CDURMIN");
			logger.debug("Duraci� m�nima(CDURMIN):" + CDURMIN);
			BigDecimal NVTOMIN = getCampoNumerico(request, "NVTOMIN");
			logger.debug("(NVTOMIN):" + NVTOMIN);
			BigDecimal CDURMAX = getCampoNumerico(request, "CDURMAX");
			logger.debug("Duraci� m�xima(CDURMAX):" + CDURMAX);
			BigDecimal NVTOMAX = getCampoNumerico(request, "NVTOMAX");
			logger.debug("(NVTOMAX):" + NVTOMAX);

			BigDecimal CTIPEFE = getCampoNumerico(request, "CTIPEFE");
			logger.debug("Tipus renovaci�(CTIPEFE):" + CTIPEFE);
			BigDecimal NRENOVA = getCampoNumerico(request, "NRENOVA");
			logger.debug("(NRENOVA):" + NRENOVA);
			BigDecimal CMODREN = getCampoNumerico(request, "CMODNRE");
			logger.debug("Mod. dia renovaci�(CMODNRE):" + CMODREN);
			if (CMODREN == null)
				CMODREN = new BigDecimal(0);
			BigDecimal CPRODCAR = getCampoNumerico(request, "CPRODCAR");
			logger.debug("Passa cartera(CPRODCAR):" + CPRODCAR);
			if (CPRODCAR == null)
				CPRODCAR = new BigDecimal(0);
			BigDecimal CREVALI = getCampoNumerico(request, "CREVALI");
			logger.debug("Tipus revaloritzaci�(CREVALI):" + CREVALI);
			BigDecimal PREVALI = getCampoNumerico(request, "PREVALI");
			logger.debug("(PREVALI):" + PREVALI);
			BigDecimal IREVALI = getCampoNumerico(request, "IREVALI");
			logger.debug("(IREVALI):" + IREVALI);
			BigDecimal CTARMAN = getCampoNumerico(request, "CTARMAN");
			logger.debug("Tipus tarifa(CTARMAN):" + CTARMAN);

			BigDecimal CREASEG = getCampoNumerico(request, "CREASEG");
			logger.debug("Reasseguran�a(CREASEG):" + CREASEG);
			BigDecimal CRETENI = getCampoNumerico(request, "CRETENI");
			logger.debug("Estat proposta(CRETENI):" + CRETENI);
			BigDecimal CPRORRA = getCampoNumerico(request, "CPRORRA");
			logger.debug("T.prorrateig(CPRORRA):" + CPRORRA);
			BigDecimal CPRIMIN = getCampoNumerico(request, "CPRIMIN");
			logger.debug("Tipus Prima min(CPRIMIN):" + CPRIMIN);

			BigDecimal IPRIMIN = getCampoNumerico(request, "IPRIMIN");
			logger.debug("Import prima minima(IPRIMIN):" + IPRIMIN);
			BigDecimal CCLAPRI = getCampoNumerico(request, "CCLAPRI");
			logger.debug("Import prima minima(CCLAPRI):" + CCLAPRI);
			BigDecimal IPMINFRA = getCampoNumerico(request, "IPMINFRA");
			logger.debug("Import de la prima minima fraccionada(IPMINFRA):" + IPMINFRA);
			BigDecimal NEDAMIC = getCampoNumerico(request, "NEDAMIC");
			logger.debug("Edat min ctr.(NEDAMIC):" + NEDAMIC);

			BigDecimal CIEDMIC = getCampoNumerico(request, "CIEDMIC");
			logger.debug("(CIEDMIC):" + CIEDMIC);
			if (CIEDMIC == null)
				CIEDMIC = new BigDecimal(0);
			BigDecimal NEDAMAC = getCampoNumerico(request, "NEDAMAC");
			logger.debug("Edat m�x ctr.(NEDAMAC):" + NEDAMAC);
			BigDecimal CIEDMAC = getCampoNumerico(request, "CIEDMAC");
			logger.debug("(CIEDMAC):" + CIEDMAC);
			if (CIEDMAC == null)
				CIEDMAC = new BigDecimal(0);
			BigDecimal NEDAMAR = getCampoNumerico(request, "NEDAMAR");
			logger.debug("Edat m�x ren.(NEDAMAR):" + NEDAMAR);

			BigDecimal CIEDMAR = getCampoNumerico(request, "CIEDMAR");
			logger.debug("(CIEDMAR):" + CIEDMAR);
			if (CIEDMAR == null)
				CIEDMAR = new BigDecimal(0);
			BigDecimal NEDMI2C = getCampoNumerico(request, "NEDMI2C");
			logger.debug("Edat min ctr 2 aseg.(NEDMI2C):" + NEDMI2C);
			BigDecimal CIEMI2C = getCampoNumerico(request, "CIEMI2C");
			logger.debug("(CIEMI2C):" + CIEMI2C);
			if (CIEMI2C == null)
				CIEMI2C = new BigDecimal(0);
			BigDecimal NEDMA2C = getCampoNumerico(request, "NEDMA2C");
			logger.debug("Edat m�x ctr 2 aseg.(NEDMA2C):" + NEDMA2C);

			BigDecimal CIEMA2C = getCampoNumerico(request, "CIEMA2C");
			logger.debug("(CIEMA2C):" + CIEMA2C);
			if (CIEMA2C == null)
				CIEMA2C = new BigDecimal(0);
			BigDecimal NEDMA2R = getCampoNumerico(request, "NEDMA2R");
			logger.debug("Edat m�x ren 2 ASEG.(NEDMA2R):" + NEDMA2R);
			BigDecimal CIEMA2R = getCampoNumerico(request, "CIEMA2R");
			logger.debug("(CIEMA2R):" + CIEMA2R);
			if (CIEMA2R == null)
				CIEMA2R = new BigDecimal(0);
			BigDecimal NSEDMAC = getCampoNumerico(request, "NSEDMAC");
			logger.debug("Sum maxis edad(NSEDMAC):" + NSEDMAC);

			BigDecimal CISEMAC = getCampoNumerico(request, "CISEMAC");
			logger.debug("(CISEMAC):" + CISEMAC);
			if (CISEMAC == null)
				CISEMAC = new BigDecimal(0);
			BigDecimal CVINPOL = getCampoNumerico(request, "CVINPOL");
			logger.debug("P�lissa vinculada(CVINPOL):" + CVINPOL);
			if (CVINPOL == null)
				CVINPOL = new BigDecimal(0);
			BigDecimal CVINPRE = getCampoNumerico(request, "CVINPRE");
			logger.debug("edat maxis ctr.(CVINPRE):" + CVINPRE);
			if (CVINPRE == null)
				CVINPRE = new BigDecimal(0);
			BigDecimal CCUESTI = getCampoNumerico(request, "CCUESTI");
			logger.debug("Questionari salut.(CCUESTI):" + CCUESTI);
			if (CCUESTI == null)
				CCUESTI = new BigDecimal(0);
			BigDecimal CCTACOR = getCampoNumerico(request, "CCTACOR");
			logger.debug("Llibreta(CCTACOR):" + CCTACOR);
			if (CCTACOR == null)
				CCTACOR = new BigDecimal(0);
			BigDecimal CPREAVISO = getCampoNumerico(request, "CPREAVISO");
			logger.debug("PREAVISO(CPREAVISO):" + CPREAVISO);
			if (CPREAVISO == null)
				CPREAVISO = new BigDecimal(0);

			formdata.put("OK", "1");
			// Carga de las PAC_IAX PL/SQL
			PAC_IAX_MNTPROD pac_axis_mntprod = new PAC_IAX_MNTPROD(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			// Datos display
			Map map = pac_axis_mntprod.ejecutaPAC_IAX_MNTPROD__F_SET_GESTION(SPRODUC, CDURACI, CTEMPOR, NDURCOB,
					CDURMIN, NVTOMIN, CDURMAX, NVTOMAX, CTIPEFE, NRENOVA, CMODREN, CPRODCAR, CREVALI, PREVALI, IREVALI,
					CTARMAN, CREASEG, CRETENI, CPRORRA, CPRIMIN, IPRIMIN, CCLAPRI, IPMINFRA, NEDAMIC, CIEDMIC, NEDAMAC,
					CIEDMAC, NEDAMAR, CIEDMAR, NEDMI2C, CIEMI2C, NEDMA2C, CIEMA2C, NEDMA2R, CIEMA2R, NSEDMAC, CISEMAC,
					CVINPOL, CVINPRE, CCUESTI, CCTACOR, CPREAVISO);
			logger.debug("set gestio ..." + map);
			logger.debug(map);
			BigDecimal resultado = (BigDecimal) tratarRETURNyMENSAJES(request, map);
			if (resultado.intValue() == 0) {
				formdata.put("OK", "0");
				request.getSession().setAttribute("subpantalla_mdl", "gestion");
				// MLR - 05/04/2013 - 0025803: RSA001 - Ampliar los decimales que utiliza iAXIS
				PAC_IAX_ECO_MONEDAS pac_iax_eco_monedas = new PAC_IAX_ECO_MONEDAS(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
				Map mapa = pac_iax_eco_monedas.ejecutaPAC_IAX_ECO_MONEDAS__F_OBTENER_MONEDA_PRODUCTO2(SPRODUC);
				logger.debug(mapa);
				request.getSession().setAttribute(("CMONEDAPROD"), mapa.get("RETURN"));
			}

			// Guardamos lo que sea que haya devuelto al contenedor Ajax.
			// Object[] resultadoAjax = (Object[]) ajax.rellenarPlAContenedorAjax (map);
			// new String[] {Constantes.OPERACION_AJAX_OK,
			// Constantes.OPERACION_AJAX_ERROR});

			// }

			System.out.println("00");

		} catch (Exception e) {
			logger.error("Error en el servicio Axispro005Service - m�todo set_datos", e);

		} finally {

		}
		this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
	}

}
