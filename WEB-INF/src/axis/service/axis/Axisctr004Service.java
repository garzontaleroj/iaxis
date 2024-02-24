//Revision:# clH2HmBtEwWAIU8ACz5gCw== #
package axis.service.axis;

//import com.google.common.base.Splitter;

import java.math.BigDecimal;
import java.sql.Date;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.csi_ti.security.aes.AESUtil;

import axis.cache.AxisCodeWizard;
import axis.jdbc.PAC_IAXPAR_PRODUCTOS;
import axis.jdbc.PAC_IAX_COMISIONEGOCIO;
import axis.jdbc.PAC_IAX_ESC_RIESGO;
import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.jdbc.PAC_IAX_LISTVALORES_COA;
import axis.jdbc.PAC_IAX_MNTPROD;
import axis.jdbc.PAC_IAX_PARAM;
import axis.jdbc.PAC_IAX_PERSONA;
import axis.jdbc.PAC_IAX_PRODUCCION;
import axis.jdbc.PAC_IAX_SUPLEMENTOS;
import axis.jdbc.PAC_IAX_VALIDACIONES;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.control.axis.Axisctr004Action;
import axis.mvc.model.UsuarioBean;
import axis.mvc.view.VisibleTag;
import axis.util.Constantes;

public class Axisctr004Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());
	private String SNIP = "";
	private BigDecimal SPERSON;

	/**
	 * Lee el numero de la pliza.
	 * 
	 * @param request El HttpServletRequest que contiene la peticin del cliente web.
	 * @return
	 * @throws Exception
	 */
	private Map dbLeePoliza(HttpServletRequest request) throws Exception {
		Map map = new PAC_IAX_PRODUCCION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_PRODUCCION__F_GET_DATPOLIZA(null);
		logger.debug("OBJETO POLIZA  BBDD ->" + map);
		Map mapPoliza = (HashMap) map.get("RETURN");
		return mapPoliza;
	}

	/*********************************************************************************************************************/
	/***********************************************
	 * MTODOS DE INICIALIZACION
	 *******************************************/
	/*********************************************************************************************************************/

	/**
	 * Inicializa los datos gestin y las preguntas y las guarda en los objetos
	 * axisctr_opcionesDatosGestion (las opciones seleccionables),
	 * axisctr_datosGestion (los campos no seleccionables y las respuestas del
	 * usuario) y axisctr_preguntasPoliza.
	 * 
	 * @param request    El HttpServletRequest que contiene la peticin del cliente
	 *                   web.
	 * @param thisAction Una Action abstracta desde donde se ha invocado el servicio
	 *                   (necesaria para el log).
	 */
	public void m_form(HttpServletRequest request, AbstractDispatchAction thisAction) {
		logger.debug("Axisctr004Service m_form");
		// Gestin de campos y dependencias
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {
			BigDecimal pPCMOTMOV = (BigDecimal) AbstractDispatchAction.topPila(request, "CMOTMOV");
			/** Added for blocking Calculator in IAXIS-4321 PK-16/06/2019 Start */
			logger.debug("Code for Amparos movement --> " + pPCMOTMOV);
			formdata.put("CMOTMOV", pPCMOTMOV);
			/** Added for blocking Calculator in IAXIS-4321 PK-16/06/2019 End */

			if (pPCMOTMOV != null) {

				Map map2 = new PAC_IAX_SUPLEMENTOS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_SUPLEMENTOS__F_GET_DESCMOTMOV(pPCMOTMOV, usuario.getCidioma());
				formdata.put("PTMOTMOV", map2.get("PTMOTMOV"));
			}

			Map mapGenPoliza = new HashMap();
			formdata.put("CAGENTE", usuario.getCagente());
			initDatosGestion(request);
			mapGenPoliza = this.dbLeePoliza(request);
			formdata.put("NPOLIZA", mapGenPoliza.get("NPOLIZA"));

			if (VisibleTag.esComponenteVisible(request, "axisctr004", "DSP_PREG")) {
				initPreguntas(request, thisAction);
			}
			this.cargaAgente(request); // BUG:8613
			if (VisibleTag.esComponenteVisible(request, "axisctr004", "DSP_PRESTAMOS")) {
				m_cargarPrestamos(request, thisAction);

			}

			BigDecimal SSEGURO = (BigDecimal) AbstractDispatchAction.topPila(request, "SSEGURO");
			formdata.put("SSEGURO_CARGA", SSEGURO);

		} catch (Exception e) {
			// logger.error("Error en el servicio Axisctr004Service - mtodo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));

		}
	}

	private void initDatosGestion(HttpServletRequest request) throws Exception {
		AESUtil encryptedVal = new AESUtil();
		Map opcionesDatosGestion = new HashMap();
		Map opcionesDatosRenta = new HashMap();
		Map datosGestion = new HashMap();
		Map datosGestion_aux = new HashMap();
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		// Carga de las PAC_IAX PL/SQL
		PAC_IAX_PRODUCCION pac_iax_produccion = new PAC_IAX_PRODUCCION(
				(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
		PAC_IAX_LISTVALORES pac_iax_listvalores = new PAC_IAX_LISTVALORES(
				(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
		PAC_IAX_LISTVALORES_COA pac_iax_listvalores_coa = new PAC_IAX_LISTVALORES_COA(
				(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
		PAC_IAXPAR_PRODUCTOS pac_axispar_productos = new PAC_IAXPAR_PRODUCTOS(
				(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
		PAC_IAX_PERSONA pac_axis_personas = new PAC_IAX_PERSONA(
				(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
		PAC_IAX_MNTPROD pac_iax_mntprod = new PAC_IAX_MNTPROD(
				(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
		PAC_IAX_COMISIONEGOCIO pac_iax_comisionegocio = new PAC_IAX_COMISIONEGOCIO(
				(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

		/* Datos gestin */
		Map map = pac_iax_produccion.ejecutaPAC_IAX_PRODUCCION__F_LEEDATOSGESTION();
		logger.debug("gestion-->" + map);
		datosGestion = (Map) tratarRETURNyMENSAJES(request, map);

		/* Datos poliza NRENOVA */
		BigDecimal NRENOVA = null;
		String CPOLCIA = null;
		BigDecimal CCOMPANI = null;
		BigDecimal CREATIP = null;
		BigDecimal CEMPRES = null;
		BigDecimal NCERTIF = null;
		Boolean VCHANGE_CBANCAR = false;

		String CMODO = (String) AbstractDispatchAction.topPila(request, "CMODO");
		Map map_aux = pac_iax_produccion.ejecutaPAC_IAX_PRODUCCION__F_GET_DETPOLIZA();
		logger.debug("map_aux-->" + map_aux);
		datosGestion_aux = (Map) tratarRETURNyMENSAJES(request, map_aux);
		if (datosGestion_aux != null) {
			NRENOVA = (BigDecimal) datosGestion_aux.get("NRENOVA");
			CEMPRES = (BigDecimal) datosGestion_aux.get("CEMPRES");
			NCERTIF = (BigDecimal) datosGestion_aux.get("NCERTIF");

			if (NRENOVA == null) {
				java.sql.Date FEFECTO = AxisBaseService.stringToSqlDate(getHiddenCampoTextual(request, "FEFECTO"));
				Map map2 = pac_iax_produccion.ejecutaPAC_IAX_PRODUCCION__F_SET_NRENOVA(FEFECTO);
				logger.debug("MAPA2--------------------------: " + map2);
				NRENOVA = (BigDecimal) map2.get("PNRENOVA");
			}
			CPOLCIA = (String) datosGestion_aux.get("CPOLCIA");
			CCOMPANI = (BigDecimal) datosGestion_aux.get("CCOMPANI");

			Map promotor = new PAC_IAX_PERSONA((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_PERSONA__F_GET_PERSONA_AGENTE((BigDecimal) datosGestion_aux.get("CPROMOTOR"),
							(BigDecimal) datosGestion_aux.get("CAGENTE"), new String("POL"));
			Map pro = (Map) promotor.get("OBPERSONA");
			logger.debug("-----> pro:" + pro);
			if (!isEmpty(pro)) {
				formdata.put("NNUMIDEPRO", pro.get("NNUMIDE"));
				formdata.put("TNOMBREPRO", pro.get("TNOMBRE1"));
				formdata.put("TNOMBREPRO2", pro.get("TNOMBRE2"));
				formdata.put("TAPELLI1PRO", pro.get("TAPELLI1"));
				formdata.put("TAPELLI2PRO", pro.get("TAPELLI2"));
				formdata.put("PRO_SPERSON", pro.get("SPERSON"));
			}

			CREATIP = (BigDecimal) datosGestion_aux.get("CREATIP");

			BigDecimal CCOMPANIVNV = (BigDecimal) datosGestion_aux.get("CCOMPANI");
			formdata.put("CCOMPANIVNV", CCOMPANIVNV);
		}
		/* Pasamos el valor al mapa de Datos Gestion */
		logger.debug("MAPA: " + map_aux);
		logger.debug("MAPA POLIZA: " + datosGestion_aux);
		datosGestion.put("NRENOVA", NRENOVA);
		datosGestion.put("CPOLCIA", CPOLCIA);
		datosGestion.put("CREATIP", CREATIP);
		formdata.put("CCOMPANI", CCOMPANI);

		BigDecimal SPRODUC = (BigDecimal) AbstractDispatchAction.topPila(request, "SPRODUC");
		formdata.put("SPRODUC", SPRODUC);

		// -- RKV - Bug 9916
		/* Actividades */
		// INI-CES: 24/05/2019 Ajuste error CACTIVI en el momento de recargar la pagina
		// if (VisibleTag.esComponenteVisible(request, "axisctr004", "CACTIVI")) {
		if (!isEmpty(datosGestion)) {
			// INI IAXIS-4205 CJMR
			BigDecimal CACTIVI;
			if (!isEmpty(getCampoNumerico(request, "CACTIVI"))) {
				CACTIVI = ((BigDecimal) datosGestion.get("CACTIVI"))
						.intValue() >= ((BigDecimal) getCampoNumerico(request, "CACTIVI")).intValue()
								? (BigDecimal) datosGestion.get("CACTIVI")
								: getCampoNumerico(request, "CACTIVI");
			} else {
				CACTIVI = (BigDecimal) datosGestion.get("CACTIVI");
			}
			formdata.put("CACTIVI", CACTIVI);
			// FIN IAXIS-4205 CJMR
			map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_CACTIVI(SPRODUC, null);
			logger.debug(map);
			opcionesDatosGestion.put("lstCactivi", tratarRETURNyMENSAJES(request, map, false));
		}
		// }
		// END-CES: 24/05/2019 Ajuste error CACTIVI en el momento de recargar la pagina

		// -- Fin RKV - Bug 9916
		// (BigDecimal)AbstractDispatchAction.topPila(request, "SSEGURO");
		BigDecimal SSEGURO = (BigDecimal) AbstractDispatchAction.topPila(request, "SSEGURO");// stringToBigDecimal((String)formdata.get("SSEGURO_CARGA"));
		BigDecimal SPERSON = getCampoNumerico(request, "SPERSON_TOMAD");// stringToBigDecimal((String)formdata.get("SPERSON"));
		if (CMODO.equals("SUPLEMENTO_696")) {
			Map m3 = pac_iax_produccion.ejecutaPAC_IAX_PRODUCCION__F_VAL_TOMADOR_CBANCAR(SSEGURO, SPERSON);
			BigDecimal codiRetorn = (BigDecimal) tratarRETURNyMENSAJES(request, m3);
		}
		List<HashMap> cuentasTomador = new ArrayList();
		List<HashMap> cuentasTomadoraux = new ArrayList();
		/* Cuentas tomador */
		map = pac_iax_produccion.ejecutaPAC_IAX_PRODUCCION__F_GET_TOMADORCCC();
		logger.debug("ejecutaPAC_IAX_PRODUCCION__F_GET_TOMADORCCC()" + map);
		// Leer el PSPERSON y establecerlo en formdata
		formdata.put("SPERSON", map.get("PSPERSON"));
		SPERSON = (BigDecimal) map.get("PSPERSON");
		if (!isEmpty(map)) {

			cuentasTomadoraux = (List) tratarRETURNyMENSAJES(request, map);
			if (!isEmpty(cuentasTomadoraux) && cuentasTomadoraux.size() > 1) {
				for (HashMap pers : cuentasTomadoraux) {
					if (((BigDecimal) pers.get("SPERSON")).intValue() == SPERSON.intValue()) {
						cuentasTomador.add(pers);
					}
				}
				if (!isEmpty(cuentasTomador) && cuentasTomador.size() > 1)
					formdata.put("SNIP", ((Map) cuentasTomador.get(0)).get("SNIP"));
			} else {
				cuentasTomador = cuentasTomadoraux;
			}
		}

		if (isEmpty(request.getSession().getAttribute("cargaHost")) && !isEmpty(cuentasTomador)) {
			opcionesDatosGestion.put("cuentasTomador", cuentasTomador);

		} else if (!isEmpty(request.getSession().getAttribute("cargaHost"))) {

			if (!isEmpty(getCampoNumerico(request, "SPERSON")))
				SPERSON = getCampoNumerico(request, "SPERSON");

			if (isEmpty(SNIP))
				SNIP = getCampoTextual(request, "SNIP");

			map = new PAC_IAX_PRODUCCION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_PRODUCCION__F_GET_CCC_HOST(SPERSON, SNIP, "EST");
			logger.debug("ejecutaPAC_IAX_PRODUCCION__F_GET_CCC_HOST()" + map);
			if (!isEmpty(map)) {
				cuentasTomador = (List) tratarRETURNyMENSAJES(request, map);
				opcionesDatosGestion.put("cuentasTomador", cuentasTomador);
			}

		}

		String encrypt_CBANCAR = "0";
		String CBANCAR = null; // ecg20120105 incializacion con null requerida abajo
		BigDecimal CTIPBAN = null; // ecg20120105 incializacion con null requerida abajo

		String CBANCAR2 = null; // ecg20120105 incializacion con null requerida abajo
		BigDecimal CTIPBAN2 = null; // ecg20120105 incializacion con null requerida abajo

		datosGestion.put("encrypt_CBANCAR", encrypt_CBANCAR);
		logger.debug("##########ENCRYPT_CBANCAR#########" + encrypt_CBANCAR);
		if (!isEmpty(datosGestion.get("CBANCAR"))) {
			if (!isEmpty(datosGestion.get("encrypt_CBANCAR"))
					&& datosGestion.get("encrypt_CBANCAR").toString() == "1") {
				CBANCAR = encryptedVal.decrypt(datosGestion.get("CBANCAR").toString());
				logger.debug("##########CBANCAR#1########" + CBANCAR);
			} else {
				CBANCAR = datosGestion.get("CBANCAR").toString();
				CTIPBAN = (BigDecimal) datosGestion.get("CTIPBAN");

				logger.debug("##########CBANCAR#2########" + CBANCAR);

				try { // ecg20120105 encapsulando en try catch porq en la version orginal petaba si no
						// hubo elementos en la lista cuentasTomados
					CBANCAR2 = ((Map) cuentasTomador.get(0)).get("CBANCAR").toString();
					CTIPBAN2 = (BigDecimal) ((Map) cuentasTomador.get(0)).get("CTIPBAN");
					if (!CBANCAR.equals(CBANCAR2) || CTIPBAN2.intValue() != CTIPBAN.intValue()) {
						CBANCAR = CBANCAR2;
						CTIPBAN = CTIPBAN2;
						VCHANGE_CBANCAR = true;
						request.getSession().setAttribute("CBANCAR", CBANCAR);
						request.getSession().setAttribute("CTIPBAN", CTIPBAN2);
					}
				} catch (Exception ee) {
					logger.warn(
							"No se ha localizado CBANCAR en datosgestion ni en la lista de cuentas Tomador. Dejamos CBANCAR y CTIPBAN como anteriormente");
				}

				logger.debug("##########CBANCAR#2despues########" + CBANCAR);

				logger.debug("##########CBANCAR#2########" + CBANCAR);
				logger.debug("PRU CBANCAR1 ---------------------------> " + CBANCAR);
			}
		} else {
			try { // ecg20120105 encapsulando en try catch porq en la version orginal petaba si no
					// hubo elementos en la lista cuentasTomados
				CBANCAR = ((Map) cuentasTomador.get(0)).get("CBANCAR").toString();
				CTIPBAN = (BigDecimal) ((Map) cuentasTomador.get(0)).get("CTIPBAN");
				logger.debug("##########CBANCAR#3########" + CBANCAR);
				logger.debug("Cbancar ---------------> " + CBANCAR);
				logger.debug("Ctipban ---------------> " + CTIPBAN);

			} catch (Exception ee) {
				logger.warn(
						"No se ha localizado CBANCAR en datosgestion ni en la lista de cuentas Tomador. Dejamos CBANCAR y CTIPBAN nulos");
			}
		}

		/*
		 * *****************************************************************************
		 * *********************
		 */
		if (!isEmpty(CTIPBAN)) {
			try {
				Map mapa_tarjeta = new PAC_IAX_PRODUCCION(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_PRODUCCION__F_GET_TARJETA(CTIPBAN);
				logger.debug("mapa_tarjeta : " + mapa_tarjeta);
				BigDecimal tarjeta = (BigDecimal) tratarRETURNyMENSAJES(request, mapa_tarjeta, false);
				if (!isEmpty(tarjeta)) {
					datosGestion.put("TARJETA", tarjeta);
				}
			} catch (Exception exc) {
				logger.warn("Error al get_tarjeta");
			}
		} else {
			datosGestion.put("TARJETA", new BigDecimal(0));
		}
		/*
		 * *****************************************************************************
		 * **********************
		 */

		/* Lista idiomas */
		map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTIDIOMAS();
		List idiomas = (List) tratarRETURNyMENSAJES(request, map);
		opcionesDatosGestion.put("idiomas", idiomas);
		idiomas = null;

		/* Comisin */
		map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTCOMISION();
		logger.debug(map);
		List comisiones = (List) tratarRETURNyMENSAJES(request, map);
		opcionesDatosGestion.put("comision", comisiones);

		// BUG : 24685 2013-feb-05 aeg seccion preimpresos
		map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTPREIMPRESOS();
		logger.debug(map);
		List lis_preimpresos = (List) tratarRETURNyMENSAJES(request, map);
		opcionesDatosGestion.put("preimpreso", lis_preimpresos);
		// fin BUG : 24685 2013-feb-05 aeg seccion preimpresos

		/* Tipo duracin */
		map = pac_axispar_productos.ejecutaPAC_IAXPAR_PRODUCTOS__F_GET_TIPDURACION();
		logger.debug(map);
		List tipoDuracion = (List) tratarRETURNyMENSAJES(request, map);
		opcionesDatosGestion.put("tipoDuracion", tipoDuracion);

		BigDecimal CAGENTE = getHiddenCampoNumerico(request, "CAGENTE_TEXT");
		Map agentes = (Map) request.getSession().getAttribute("axisctr004_agente");
		if (isEmpty(CAGENTE)) {
			logger.debug("agentes:" + agentes);
			if (!isEmpty(agentes) && !isEmpty(agentes.get("CODI")))
				CAGENTE = new BigDecimal(String.valueOf(agentes.get("CODI")));
		}

		/* Tipo retribucion ETM 21924 */
		map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTTIPRETRIBU(CAGENTE);
		logger.debug(map);
		List tipoRetribu = (List) tratarRETURNyMENSAJES(request, map);
		opcionesDatosGestion.put("tipoRetribu", tipoRetribu);
		/* revalorizacion de franquicia bug 21924 --etm */
		// bfp bug 22253 ini
		map = pac_iax_mntprod.ejecutaPAC_IAX_MNTPROD__F_GET_DURCOBROPROD(SPRODUC);
		logger.debug(map);
		List lDurCob = (List) tratarRETURNyMENSAJES(request, map);
		opcionesDatosGestion.put("lDurCob", lDurCob);
		// bfp bug 22253 fi
		map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTREVALFRANQ();
		logger.debug(map);
		List revalFran = (List) tratarRETURNyMENSAJES(request, map);
		opcionesDatosGestion.put("revalFran", revalFran);
		/* FIN ETM */
		/* Tipo reaseguro */
		// map=pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new
		// BigDecimal(74));

		map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES_DEP(usuario.getCempres(), SPRODUC,
				new BigDecimal(1), new BigDecimal(74)); // IAXIS-5342 CJMR 20/09/20199999

		map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES_DEP(usuario.getCempres(), SPRODUC,
				new BigDecimal(1), new BigDecimal(74)); // IAXIS-5342 CJMR 20/09/2019

		logger.debug(map);
		List tipoReaseguro = (List) tratarRETURNyMENSAJES(request, map);
		opcionesDatosGestion.put("tipoReaseguro", tipoReaseguro);

		// AMC - Bug 23183
		/* Tipo coaseguro */
		// Map map2=pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new
		// BigDecimal(800109));
		Map map2 = pac_iax_listvalores_coa.ejecutaPAC_IAX_LISTVALORES_COA__F_GET_TIPCOASEGURO(CEMPRES, SPRODUC,
				new BigDecimal(1), new BigDecimal(800109));
		logger.debug(map2);
		List coaseguro = (List) tratarRETURNyMENSAJES(request, map2);
		opcionesDatosGestion.put("coaseguro", coaseguro);

		Map map3 = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_COASEGURADORAS();
		List companias = (List) tratarRETURNyMENSAJES(request, map3, false);
		opcionesDatosGestion.put("companias", companias);

		map = pac_iax_produccion.ejecutaPAC_IAX_PRODUCCION__F_LEEDETCOASEGURO();
		Map coa = (HashMap) map.get("RETURN");
		logger.debug("----> datos coaseguro:" + coa);
		datosGestion.put("datcoaseguro", coa);

		datosGestion.put("CTIPCOA", datosGestion_aux.get("CTIPCOA"));

		// Fin AMC - Bug 23183

		/* Forma pago */
		map = pac_axispar_productos.ejecutaPAC_IAXPAR_PRODUCTOS__F_GET_FORMAPAGO();
		logger.debug(map);
		List formaPago = (List) tratarRETURNyMENSAJES(request, map);
		opcionesDatosGestion.put("formaPago", formaPago);

		if (!isEmpty(datosGestion)) {
			map = pac_iax_produccion.ejecutaPAC_IAX_PRODUCCION__F_GET_GARFORPAG();
			logger.debug(map);
			BigDecimal CFORPAG = (BigDecimal) tratarRETURNyMENSAJES(request, map);
			datosGestion.put("CFORPAG", CFORPAG);
		}

		/* Tipo cobro */
		map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_TIPOCOBRO();
		logger.debug(map);
		List tipoCobro = (List) tratarRETURNyMENSAJES(request, map);
		opcionesDatosGestion.put("tipoCobro", tipoCobro);

		/* Admite temporalidad */
		map = pac_iax_mntprod.ejecutaPAC_IAX_MNTPROD__F_GET_GESTION(SPRODUC);
		Map OB_IAX_PRODGARDATGESTION = (Map) tratarRETURNyMENSAJES(request, map);
		// opcionesDatosGestion.put("CTEMPOR", OB_IAX_PRODGARDATGESTION);
		formdata.putAll(OB_IAX_PRODGARDATGESTION);

		/* Subagentes */
		BigDecimal CAGENTEx = usuario.getCagente();
		if (!isEmpty(CAGENTEx)) {
			map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_SUBAGENTES(CAGENTEx);
			logger.debug(map);
			List subagentes = (List) tratarRETURNyMENSAJES(request, map);
			opcionesDatosGestion.put("subagentes", subagentes);

		}

		// Para ENSA el cobrador bancario es independiente del tipo de cobro y va
		// nicamente por SPRODUC (lo han de informar siempre)

		map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_DESCOBRADORES_RAMO(SPRODUC, CBANCAR, CTIPBAN);
		List cobradores = (List) tratarRETURNyMENSAJES(request, map);
		opcionesDatosGestion.put("cobradores", cobradores);
		cobradores = null;
		logger.debug("Cobradores -----------------> " + map);

		/* PerRevision */
		map = pac_axispar_productos.ejecutaPAC_IAXPAR_PRODUCTOS__F_GET_PERREVISION(SPRODUC);
		logger.debug(map);
		List NDURPER = (List) tratarRETURNyMENSAJES(request, map);
		// opciones
		opcionesDatosRenta.put("NDURPER", NDURPER);

		/* ForPagRent */
		map = pac_axispar_productos.ejecutaPAC_IAXPAR_PRODUCTOS__GET_FORPAGREN(SPRODUC);
		logger.debug(map);
		List CFORPAGREN = (List) tratarRETURNyMENSAJES(request, map);
		// opcionesDatosRenta.put("CFORPAGREN", CFORPAGREN);
		opcionesDatosRenta.put("CFORPAGREN", CFORPAGREN);
		map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_MONEDAS();
		List monedas = (List) tratarRETURNyMENSAJES(request, map);
		opcionesDatosGestion.put("monedasPago", monedas);
		monedas = null;
		logger.debug("monedas -----------------> " + map);

		// Bug 23963/125448 - 15/10/2012 - AMC
		map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_COMPANIAS(SPRODUC, new BigDecimal(4));
		logger.debug("---> companias:" + map);
		companias = (List) tratarRETURNyMENSAJES(request, map);
		opcionesDatosGestion.put("lstcompanias", companias);

		// Bug 0025584/135342 - 25/02/2013 - MMS
		/* Lista NEDAMAR */
		map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTEDADESPROD(SPRODUC);
		logger.debug(map);
		List lstNEDAMAR = (List) tratarRETURNyMENSAJES(request, map);
		opcionesDatosGestion.put("lstNEDAMAR", lstNEDAMAR);

		// Inici BUG 27854/150657 - 08/08/2013 - RCL - Comisin especial negocio, existe
		// convenio en la fecha de vigencia
		java.sql.Date FEFECTO = null;
		if (!isEmpty(datosGestion)) {
			java.sql.Timestamp timestamp = (java.sql.Timestamp) datosGestion.get("FEFECTO");
			FEFECTO = new java.sql.Date(timestamp.getTime());
		} else {
			FEFECTO = new java.sql.Date(java.util.Calendar.getInstance().getTimeInMillis());
		}

		BigDecimal spereal = SPERSON;
		try {
			spereal = (BigDecimal) ((Map) ((Map) ((List) datosGestion_aux.get("TOMADORES")).get(0))
					.get("OB_IAX_TOMADORES")).get("SPEREAL");
		} catch (Exception e) {
			spereal = SPERSON;
		}

		map = pac_iax_comisionegocio.ejecutaPAC_IAX_COMISIONEGOCIO__F_GET_TIENECONVCOMESP(spereal, CAGENTEx, SPRODUC,
				FEFECTO);
		// Fi BUG 27854/150657 - 08/08/2013 - RCL - Comisin especial negocio, existe
		// convenio en la fecha de vigencia

		logger.debug("--> tiene convenio:" + map);
		formdata.put("TIENECOMI", map.get("PCONVENIO"));
		logger.debug("---> CTIPCOM:" + datosGestion.get("CTIPCOM"));
		formdata.put("CTIPCOM", datosGestion.get("CTIPCOM"));
		request.getSession().setAttribute("COMIS_CTIPCOM", datosGestion.get("CTIPCOM"));

		BigDecimal PCONVENIO = (BigDecimal) map.get("PCONVENIO");
		if (!isEmpty(PCONVENIO) && PCONVENIO.equals(new BigDecimal(1))) {
			BigDecimal pCTIPCOM = new BigDecimal(92);
			datosGestion.put("CTIPCOM", pCTIPCOM);

			// Inici BUG 27854/150644 - 07/08/2013 - RCL - SI tiene comision especial,
			// guardamos valores por defecto.
			Map mapGestComision = pac_iax_produccion
					.ejecutaPAC_IAX_PRODUCCION__F_LEEGESTIONCOMISION(new BigDecimal(92));
			logger.debug(mapGestComision);
			List listGestComision = (List) tratarRETURNyMENSAJES(request, mapGestComision);

			BigDecimal guardat = new BigDecimal(0);
			for (int i = 0; i < listGestComision.size(); i++) {
				Map obj = (Map) listGestComision.get(i);
				Map obj2 = (Map) obj.get("OB_IAX_GSTCOMISION");

				BigDecimal cmodcom = (BigDecimal) obj2.get("CMODCOM");
				BigDecimal pcomisi = (BigDecimal) obj2.get("PCOMISI");
				// BUG 27854/150997 - 14/08/2013 - RCL - PCOMISI can be null.
				if (pcomisi == null)
					pcomisi = new BigDecimal(0);

				BigDecimal ninialt = (BigDecimal) obj2.get("NINIALT");
				BigDecimal nfinalt = (BigDecimal) obj2.get("NFINALT");

				Map comisi = pac_iax_produccion.ejecutaPAC_IAX_PRODUCCION__F_GRABAGESTIONCOMISION(cmodcom, pcomisi,
						ninialt, nfinalt);
				if ((comisi.get("RETURN") != null && comisi.get("RETURN") instanceof BigDecimal)
						&& (((BigDecimal) comisi.get("RETURN")).intValue() != 0)) {
					guardat = new BigDecimal(1);
				}
				logger.debug("ejecutaPAC_IAX_PRODUCCION__F_GRABAGESTIONCOMISION: " + comisi);
			}

			if (guardat.intValue() == 0) {
				// Cridrem a pac_md_grabarDatos
				Map mpgrabar = pac_iax_produccion.ejecutaPAC_IAX_PRODUCCION__F_GRABARCOMISIONES(pCTIPCOM);
				tratarRETURNyMENSAJES(request, mpgrabar);
				logger.debug("ejecutaPAC_IAX_PRODUCCION__F_GRABARCOMISIONES: " + mpgrabar);
				if ((mpgrabar.get("RETURN") != null && mpgrabar.get("RETURN") instanceof BigDecimal)
						&& (((BigDecimal) mpgrabar.get("RETURN")).intValue() != 0)) {
					guardat = new BigDecimal(1);
				}
			}
			// Fi BUG 27854/150644 - 07/08/2013 - RCL - SI tiene comision especial,
			// guardamos valores por defecto.
		}

		// Bug 27500 10/03/2014
//INI RAL BUG 36948: Temporal Renovable - Se limpia Nro. y fecha mandato: Recuperamos datos escritos en la ventana      
		BigDecimal CFOLNUM = getHiddenCampoNumerico(request, "CFOLNUM");
		logger.debug("CFOLNUM: " + CFOLNUM);
		// BigDecimal CFOLNUM = null;
		Timestamp FMANDATO = null;

		// Date CFECMAN = null;
		Date CFECMAN = stringToSqlDate(getCampoTextual(request, "CFECMAN"));

		// String SUCURSAL = null;
		String SUCURSAL = getHiddenCampoTextual(request, "CSUCURSAL");
//FIN RAL BUG 36948: Temporal Renovable - Se limpia Nro. y fecha mandato        
		BigDecimal HAYMANDATPREV = null;

		if (VCHANGE_CBANCAR && !isEmpty(CBANCAR) && datosGestion != null) {
			Map map_folio = new PAC_IAX_PRODUCCION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_PRODUCCION__F_GET_FOLIO(CBANCAR);
			logger.debug("ejecutaPAC_IAX_PRODUCCION__F_GET_FOLIO()" + map_folio);
			BigDecimal CFOLNUM2 = (BigDecimal) map_folio.get("PNUMFOLIO");
			Date CFECMAN2 = (Date) map_folio.get("PFECHAMANDATO");
			String SUCURSAL2 = (String) map_folio.get("PSUCURSAL");

//INI RAL BUG 36948: Temporal Renovable - Se limpia Nro. y fecha mandato: Si ya existen datos en la ventana, no los machaca        
			// CFOLNUM = CFOLNUM2;
			if (CFOLNUM == null) {
				CFOLNUM = CFOLNUM2;
			}

			if (CFOLNUM != null && CFOLNUM.intValue() == 0) {
				CFOLNUM = null;
			}
			datosGestion.put("CFOLNUM", CFOLNUM);

			// CFECMAN = CFECMAN2;
			if (CFECMAN == null) {
				CFECMAN = CFECMAN2;
			}

			datosGestion.put("CFECMAN", CFECMAN);

			// SUCURSAL = SUCURSAL2;
			if (SUCURSAL == null) {
				SUCURSAL = SUCURSAL2;
			}

			datosGestion.put("CSUCURSAL", SUCURSAL);
//FIN RAL BUG 36948: Temporal Renovable - Se limpia Nro. y fecha mandato        

			// flag utilizado para indicar si hay mandato previo, cuando entra por primera
			// vez en la pantalla
			// ha de ser null, y dependiendo de si viene informado el numero de folio le
			// asignamos valor 0 (false,
			// no hay mandato previo) o 1 (true, hay mandato previo
			HAYMANDATPREV = (BigDecimal) datosGestion.get("HAYMANDATPREV");
			if (HAYMANDATPREV == null) {
				if (CFOLNUM == null) {
					HAYMANDATPREV = BigDecimal.ZERO;
				} else {
					HAYMANDATPREV = BigDecimal.ONE;
				}
			}

			formdata.put("HAYMANDATPREV", HAYMANDATPREV);

			// Inicio Bug 32676 - 20141016 - MMS -- Agregammos ffinvin
			// java.sql.Timestamp timestamp = (java.sql.Timestamp)
			// datosGestion.get("FEFECTO");
			// FEFECTO = new java.sql.Date(timestamp.getTime());

			Timestamp FFINVIG = (Timestamp) datosGestion.get("FFINVIG");
			formdata.put("FFINVIG", FFINVIG);
		} else if (VCHANGE_CBANCAR && isEmpty(CBANCAR)) {
			datosGestion.put("CFOLNUM", CFOLNUM);

			datosGestion.put("CFECMAN", CFECMAN);

			datosGestion.put("CSUCURSAL", SUCURSAL);

			// flag utilizado para indicar si hay mandato previo, cuando entra por primera
			// vez en la pantalla
			// ha de ser null, y dependiendo de si viene informado el numero de folio le
			// asignamos valor 0 (false,
			// no hay mandato previo) o 1 (true, hay mandato previo

			if (HAYMANDATPREV == null) {
				if (CFOLNUM == null) {
					HAYMANDATPREV = BigDecimal.ZERO;
				} else {
					HAYMANDATPREV = BigDecimal.ONE;
				}
			}

			formdata.put("HAYMANDATPREV", HAYMANDATPREV);

			// Inicio Bug 32676 - 20141016 - MMS -- Agregammos ffinvin
			// java.sql.Timestamp timestamp = (java.sql.Timestamp)
			// datosGestion.get("FEFECTO");
			// FEFECTO = new java.sql.Date(timestamp.getTime());

			Timestamp FFINVIG = (Timestamp) datosGestion.get("FFINVIG");
			formdata.put("FFINVIG", FFINVIG);
		} else if (datosGestion != null) {

			CFOLNUM = (BigDecimal) datosGestion.get("NUMFOLIO");

			if (CFOLNUM != null && CFOLNUM.intValue() == 0) {
				CFOLNUM = null;
			}
			datosGestion.put("CFOLNUM", CFOLNUM);

			FMANDATO = (Timestamp) datosGestion.get("FMANDATO");
			CFECMAN = FMANDATO == null ? null : new Date(FMANDATO.getTime());
			datosGestion.put("CFECMAN", CFECMAN);

			SUCURSAL = (String) datosGestion.get("SUCURSAL");
			datosGestion.put("CSUCURSAL", SUCURSAL);

			// flag utilizado para indicar si hay mandato previo, cuando entra por primera
			// vez en la pantalla
			// ha de ser null, y dependiendo de si viene informado el numero de folio le
			// asignamos valor 0 (false,
			// no hay mandato previo) o 1 (true, hay mandato previo
			HAYMANDATPREV = (BigDecimal) datosGestion.get("HAYMANDATPREV");
			if (HAYMANDATPREV == null) {
				if (CFOLNUM == null) {
					HAYMANDATPREV = BigDecimal.ZERO;
				} else {
					HAYMANDATPREV = BigDecimal.ONE;
				}
			}

			formdata.put("HAYMANDATPREV", HAYMANDATPREV);

			// Inicio Bug 32676 - 20141016 - MMS -- Agregammos ffinvin
			// java.sql.Timestamp timestamp = (java.sql.Timestamp)
			// datosGestion.get("FEFECTO");
			// FEFECTO = new java.sql.Date(timestamp.getTime());

			Timestamp FFINVIG = (Timestamp) datosGestion.get("FFINVIG");
			formdata.put("FFINVIG", FFINVIG);
			// Fin Bug 32676 - 20141016 - MMS
		}
		// fin Bug 27500

		opcionesDatosGestion.put("convempvers", datosGestion_aux.get("CONVEMPVERS"));

		BigDecimal NDIAS_SUSP = getCampoNumerico(request, "NDIAS_SUSP");

		if (!isEmpty(NDIAS_SUSP)) {

			Calendar calendar = Calendar.getInstance();

			Timestamp FVENCIM = (Timestamp) datosGestion.get("FVENCIM");
			calendar.setTime(FVENCIM);
			calendar.add(Calendar.DAY_OF_YEAR, NDIAS_SUSP.intValue());
			datosGestion.put("FVENCIM", calendar.getTime());

			Timestamp FVENCPLAZO = (Timestamp) datosGestion.get("FVENCPLAZO");
			calendar.setTime(FVENCPLAZO);
			calendar.add(Calendar.DAY_OF_YEAR, NDIAS_SUSP.intValue());
			datosGestion.put("FVENCPLAZO", calendar.getTime());
		}

		// INI IAXIS-4205 CJMR
		if ((((BigDecimal) datosGestion_aux.get("CRAMO")).intValue() == 802) && CMODO.equals("ALTA_POLIZA")
				&& isEmpty(datosGestion.get("FEFEPLAZO"))) {
			Calendar calendar = Calendar.getInstance();
			calendar.setTime(FEFECTO);
			calendar.add(Calendar.YEAR, 1);
			datosGestion.put("FVENCIM", calendar.getTime());
		}

		// Metemos el ArrayList en session para poder mostralo en la pantalla
		request.getSession().setAttribute("axisctr_opcionesDatosGestion",
				!isEmpty(opcionesDatosGestion) ? opcionesDatosGestion : new HashMap());
		request.getSession().setAttribute("axisctr_datosGestion",
				!isEmpty(datosGestion) ? datosGestion : new HashMap());
		request.getSession().setAttribute("axisctr_opcionesDatosRenta",
				!isEmpty(opcionesDatosRenta) ? opcionesDatosRenta : new HashMap());

		opcionesDatosGestion = null;
		datosGestion = null;
		opcionesDatosRenta = null;

	}

	public void m_cargarPrestamos(HttpServletRequest request, AbstractDispatchAction thisAction) {
		logger.debug("Axisctr004Service m_cargarPrestamos");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {

			PAC_IAX_PRODUCCION pac_iax_produccion = new PAC_IAX_PRODUCCION(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			PAC_IAX_PERSONA pac_aix_persona = new PAC_IAX_PERSONA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			BigDecimal NRIESGO = isEmpty(getCampoNumerico(request, "NRIESGO"))
					? new BigDecimal(String.valueOf(AbstractDispatchAction.topPila(request, "NRIESGO")))
					: getCampoNumerico(request, "NRIESGO");
			formdata.put("NRIESGO", NRIESGO);
			logger.debug("bt_ctrhost-->" + request.getSession().getAttribute("bt_ctrhost"));
			if (isEmpty(request.getSession().getAttribute("bt_ctrhost"))) {
				ArrayList<HashMap> lstsaldo = new ArrayList<HashMap>();

				Map m = pac_aix_persona.ejecutaPAC_IAX_PERSONA__F_GET_CTR_PRESTAMOSEG_HOST(NRIESGO,
						(String) AbstractDispatchAction.topPila(request, "CMODO"));
				logger.debug(m);
				if (!isEmpty(this.tratarRETURNyMENSAJES(request, m))
						&& ((BigDecimal) this.tratarRETURNyMENSAJES(request, m)).intValue() == 0) {
					lstsaldo = (ArrayList<HashMap>) m.get("PT_PRESTAMOSEG");

					// ---------------
					boolean indicadorSelsaldo = false;
					HashMap selectedHash = new HashMap();
					if (!isEmpty(lstsaldo) && lstsaldo.size() > 0) {
						if (lstsaldo.size() == 1) {
							logger.debug(lstsaldo);
							HashMap prestamos = lstsaldo.get(0);
							// recorre el HashMap
							Set entries = prestamos.entrySet();
							Iterator it = entries.iterator();
							while (it.hasNext()) {
								Map.Entry entry = (Map.Entry) it.next();
								HashMap mapValor = (HashMap) entry.getValue();
								BigDecimal selSald = (BigDecimal) mapValor.get("SELSALDO");
								selectedHash = mapValor;
								if (selSald.compareTo(BigDecimal.ONE) == 0) {
									indicadorSelsaldo = true;
								}
							}

							if (indicadorSelsaldo == false) {
								BigDecimal ICAPMAXPOL = getCampoNumerico(request, "ICAPMAXPOL");
								formdata.put("ICAPMAXPOL", ICAPMAXPOL);
								logger.debug("------ icapmaxpol:" + ICAPMAXPOL);
								String IDCUENTA = (String) selectedHash.get("IDCUENTA");
								BigDecimal CTIPCUENTA = (BigDecimal) selectedHash.get("CTIPCUENTA");
								BigDecimal CTIPBAN = (BigDecimal) selectedHash.get("CTIPBAN");
								BigDecimal CTIPIMP = (BigDecimal) selectedHash.get("CTIPIMP");
								BigDecimal ISALDO = (BigDecimal) selectedHash.get("ISALDO");
								BigDecimal PORCEN = (BigDecimal) selectedHash.get("PORCEN");
								BigDecimal ILIMITE = (BigDecimal) selectedHash.get("ILIMITE");
								BigDecimal ICAPMAX = (BigDecimal) selectedHash.get("ICAPMAX");
								String CMONEDA = (String) selectedHash.get("CMONEDA");
								BigDecimal ICAPASE = (BigDecimal) selectedHash.get("ICAPASEG");
								String DESCRIPCION = (String) selectedHash.get("DESCRIPCION");

								// Date ip = (Date)selectedHash.get("FINIPREST");
								// Date fp = (Date)selectedHash.get("FINIPREST");
								long lip = ((Timestamp) selectedHash.get("FINIPREST")).getTime();
								long lfp = ((Timestamp) selectedHash.get("FFINPREST")).getTime();
								Date ip = new Date(lip);
								Date fp = new Date(lfp);

								Date FINIPREST = isEmpty(selectedHash.get("FINIPREST")) ? null : ip;
								Date FFINPREST = isEmpty(selectedHash.get("FFINPREST")) ? null : fp;

								// Date FINIPREST =isEmpty(selectedHash.get("FFINPREST")) ? null :
								// AxisBaseService.stringToSqlDate(String.valueOf(selectedHash.get("FFINPREST").);
								// Date FFINPREST =isEmpty(selectedHash.get("FFINPREST")) ? null :
								// AxisBaseService.stringToSqlDate(String.valueOf(selectedHash.get("FFINPREST")));
								Map map = pac_iax_produccion.ejecutaPAC_IAX_PRODUCCION__F_SET_PRESTAMOSEG(NRIESGO,
										new BigDecimal(1), IDCUENTA, CTIPCUENTA, CTIPBAN, CTIPIMP, ISALDO, PORCEN,
										ILIMITE, ICAPMAX, CMONEDA, ICAPMAXPOL, ICAPASE, DESCRIPCION, FINIPREST,
										FFINPREST);

							}
						}
					}
				}
				// i tornar a fer la carrega del prestec actualizat amb :

				Map mPrestec = pac_aix_persona.ejecutaPAC_IAX_PERSONA__F_GET_CONTRATOS_HOST(
						(String) AbstractDispatchAction.topPila(request, "CMODO"));
				logger.debug(mPrestec);

				if (!isEmpty(this.tratarRETURNyMENSAJES(request, mPrestec))
						&& ((BigDecimal) this.tratarRETURNyMENSAJES(request, mPrestec)).intValue() == 0) {
					lstsaldo = (ArrayList<HashMap>) mPrestec.get("PT_PRESTAMO");
					request.getSession().setAttribute("prestamos", lstsaldo);
				}

			}

		} catch (Exception e) {
			// logger.error("Error en el servicio Axisctr004Service - m_cargarPrestamos",
			// e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
			request.getSession().removeAttribute("bt_ctrhost");

		}
	}

	private void initPreguntas(HttpServletRequest request, AbstractDispatchAction thisAction) throws Exception {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		PAC_IAXPAR_PRODUCTOS pac_axispar_productos = new PAC_IAXPAR_PRODUCTOS(
				(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
		PAC_IAX_PRODUCCION pac_iax_produccion = new PAC_IAX_PRODUCCION(
				(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

		// Leer preguntas producto
		Map map = pac_axispar_productos.ejecutaPAC_IAXPAR_PRODUCTOS__F_GET_PREGPOLIZA();
		logger.debug("Preguntas Poliza -> " + map);

		List preguntas = (List) tratarRETURNyMENSAJES(request, map);

		map = pac_iax_produccion.ejecutaPAC_IAX_PRODUCCION__F_LEEPREGUNTASPOLIZA();
		logger.debug("Preguntas Usuario -> " + map);

		// RSC - 03/11/2011
		List pregs = (List) tratarRETURNyMENSAJES(request, map);
		logger.debug("Pregs -> " + pregs);
		if (pregs != null) {
			HashMap mapa_preg = (HashMap) pregs.get(0);
			if (mapa_preg != null) {
				HashMap NMOVIMI_map = (HashMap) mapa_preg.get("OB_IAX_PREGUNTAS");
				if (NMOVIMI_map != null) {
					BigDecimal NMOVIMI = (BigDecimal) NMOVIMI_map.get("NMOVIMI");
					AbstractDispatchAction.topPila(request, "NMOVIMI", NMOVIMI);
				}
			}

		} // Fin RSC - 03/11/2011

		// Leer preguntas/respuestas del usuario
		List respuestas = (List) tratarRETURNyMENSAJES(request, map);

		// Mezclar las respuestas con las preguntas iniciales
		inicializarPreguntas(preguntas, respuestas, request, "axisPreguntas");
		logger.debug(
				"GUARDAMOS RESPUESTAS EN SESSION PORQUE PODEMOS TENER DESACTIVO EL MULTIREGISTRO PREGUNTAS/RESPUESTAS: "
						+ request.getSession().getAttribute("axisPreguntas"));

		logger.debug("Preguntas/Respuestas despus del merge -> " + preguntas);

		List pregQuestSalut = null;
		List pregDespeses = null;
		if (!isEmpty(preguntas)) {
			this.getPreguntasTablaLlena(preguntas, request);
			pregQuestSalut = dividirPregPerCtipgru(preguntas, Constantes.CTIPGRU_QUESTIONARI_SALUT);
			pregDespeses = dividirPregPerCtipgru(preguntas, Constantes.CTIPGRU_DESPESES);
		}
		// Guardar lista de preguntas para mostrarla en la pantalla mediante un
		// DisplayTag
		// es guarden els diferents grups de preguntes
		request.getSession().setAttribute("axisctr_pregQuestSalut",
				((pregQuestSalut == null) ? new ArrayList() : pregQuestSalut));
		request.getSession().setAttribute("axisctr_pregDespeses",
				((pregDespeses == null) ? new ArrayList() : pregDespeses));
		request.getSession().setAttribute("axisctr_preguntasPoliza",
				((preguntas == null) ? new ArrayList() : preguntas));
		preguntas = null;
		pregQuestSalut = null;
		pregDespeses = null;

	}

	private void getPreguntasTablaLlena(List<HashMap> preguntas, HttpServletRequest request) {
		BigDecimal NRIESGO = (BigDecimal) AbstractDispatchAction.topPila(request, "NRIESGO");

		try {
			for (HashMap OB_IAXPAR_PREGUNTAS : preguntas) {
				HashMap preg = (HashMap) OB_IAXPAR_PREGUNTAS.get("OB_IAXPAR_PREGUNTAS");
				BigDecimal CPREGUN = (BigDecimal) preg.get("CPREGUN");

				Map map = new PAC_IAX_PRODUCCION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_PRODUCCION__F_GET_PREGUNTAB("P", NRIESGO, null, CPREGUN);
				logger.debug(map);
				if (!isEmpty(this.tratarRETURNyMENSAJES(request, map))) {
					ArrayList pt = (ArrayList) this.tratarRETURNyMENSAJES(request, map);
					if (pt.size() > 0)
						preg.put("PREGTABLA", new BigDecimal(1));
				} else {
					preg.put("PREGTABLA", new BigDecimal(0));
				}
				logger.debug("preg : " + preg);
			}

			// return preguntas;
		} catch (Exception e) {
			logger.debug(e.getMessage());
			// return preguntas;
		}

	}

	private List dividirPregPerCtipgru(List<HashMap> preguntas, int CTIPGRU) {

		List pregdividides = new ArrayList();
		List<HashMap> objBorrar = new ArrayList();

		for (HashMap OB_IAXPAR_PREGUNTAS : preguntas) {
			HashMap preg = (HashMap) OB_IAXPAR_PREGUNTAS.get("OB_IAXPAR_PREGUNTAS");
			BigDecimal CTIPGRUobj = (BigDecimal) preg.get("CTIPGRU");
			logger.debug("CTIPGRUobj-->" + CTIPGRUobj);
			if (!isEmpty(CTIPGRUobj) && CTIPGRUobj.intValue() == CTIPGRU) {
				pregdividides.add(OB_IAXPAR_PREGUNTAS);
				objBorrar.add(OB_IAXPAR_PREGUNTAS);
			}

			logger.debug("PREG-->" + OB_IAXPAR_PREGUNTAS);
		}

		for (HashMap OB_IAXPAR_PREGUNTAS : objBorrar) {
			preguntas.remove(OB_IAXPAR_PREGUNTAS);
		}

		return pregdividides;

	}

	/*********************************************************************************************************************/
	/***********************************************
	 * MTODOS DE ACTUALIZACION
	 ********************************************/
	/*********************************************************************************************************************/

	/**
	 * Guarda las selecciones del usuario a BD, guarda las preguntas y las
	 * respuestas del usuario en BBDD y en axisctr_preguntasPoliza.
	 * 
	 * @param request    El HttpServletRequest que contiene la peticin del cliente
	 *                   web.
	 * @param thisAction Una Action abstracta desde donde se ha invocado el servicio
	 *                   (necesaria para el log).
	 */
	public void m_guardarEstadoPantalla(HttpServletRequest request, AbstractDispatchAction thisAction,
			BigDecimal recargaforpag) {

		AESUtil encryptedVal = new AESUtil();

		logger.debug("Axisctr004Service m_guardarDatos");
		try {
			// Guardamos en session los parmetros seleccionados / introducidos en la
			// pantalla
			UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

			List preguntas = (List) request.getSession().getAttribute("axisctr_preguntasPoliza");
			// CONF-1243_QT_647 -- 13/02/2018 - Se inicializa si es nula
			if (preguntas == null)
				preguntas = new ArrayList();
			List<HashMap> pregQuestSalut = (List) request.getSession().getAttribute("axisctr_pregQuestSalut");
			List<HashMap> pregDespeses = (List) request.getSession().getAttribute("axisctr_pregDespeses");
			if (!isEmpty(pregQuestSalut))
				for (HashMap OB_IAXPAR_PREGUNTAS : pregQuestSalut) {
					preguntas.add(OB_IAXPAR_PREGUNTAS);
				}

			if (!isEmpty(pregDespeses))
				for (HashMap OB_IAXPAR_PREGUNTAS : pregDespeses) {
					preguntas.add(OB_IAXPAR_PREGUNTAS);
				}
			logger.debug("preguntas merged grabades ::" + preguntas);

			int cant = 0, resp = 0;
			BigDecimal SPRODUC = (BigDecimal) AbstractDispatchAction.topPila(request, "SPRODUC");
			Map varParametro = new PAC_IAXPAR_PRODUCTOS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAXPAR_PRODUCTOS__F_GET_PARPRODUCTO("ISPROPERTY", SPRODUC);
			BigDecimal valorParamtero = (BigDecimal) tratarRETURNyMENSAJES(request, varParametro);

			if (valorParamtero.intValue() != 0) {
				for (int i = 0; i < preguntas.size(); i++) {
					Map pregunta = (Map) ((Map) preguntas.get(i)).get("OB_IAXPAR_PREGUNTAS");
					BigDecimal CPREGUN = (BigDecimal) pregunta.get("CPREGUN");
					BigDecimal CRESPUE = null;
					int cpregunA[] = { 251, 252, 253, 254, 255, 256, 257, 258, 259, 262, 263 };
					for (int j = 0; j < cpregunA.length; j++) {
						if (new BigDecimal(cpregunA[j]).equals(CPREGUN)) {
							CRESPUE = getCampoNumerico(request, "respuesta_" + i);
							if (new BigDecimal(251).equals(CPREGUN) && BigDecimal.ZERO.equals(CRESPUE)) {
								resp++;
							} else if (BigDecimal.ZERO.equals(CRESPUE) || isEmpty(CRESPUE)) {
								cant++;
							}
						}
					}
				}
			}

			if (cant == 10 && resp == 1) {
				thisAction.guardarMensaje(request, "1000266",
						new Object[] { "Debe colocar por lo menos un limite mayor a cero." }, Constantes.MENSAJE_ERROR);
			}

			if (!isEmpty(preguntas)) {
				// Guardar preguntas. La pantalla puede esconder el mutiregistro de
				// preguntas/respuestas.
				// En ese caso, recuperamos las respuestas desde una variable de sesin
				if (!isEmpty(request.getSession().getAttribute("axisPreguntas"))) {
					guardarPreguntasProvisional(request, preguntas, "PAC_IAX_PRODUCCION__F_GRABAPREGUNTASPOLIZA",
							"axisPreguntas", recargaforpag);
					request.getSession().removeAttribute("axisPreguntas");
				} else {
					guardarPreguntasProvisional(request, preguntas, "PAC_IAX_PRODUCCION__F_GRABAPREGUNTASPOLIZA",
							recargaforpag);
				}
			}

			BigDecimal INTTEC = getHiddenCampoNumerico(request, "INTTEC");
			java.sql.Date FPPREN = AxisBaseService.stringToSqlDate(getHiddenCampoTextual(request, "FPPREN"));
			java.sql.Date FEFECTO = AxisBaseService.stringToSqlDate(getHiddenCampoTextual(request, "FEFECTO"));
			java.sql.Date FVENCIM = AxisBaseService.stringToSqlDate(getHiddenCampoTextual(request, "FVENCIM"));

			BigDecimal CDURACI = getHiddenCampoNumerico(request, "CDURACI");
			BigDecimal NDURACI = getHiddenCampoNumerico(request, "NDURACI");
			if (isEmpty(NDURACI)) {
				NDURACI = getHiddenCampoNumerico(request, "NDURACI_AUX");
			}
			BigDecimal NDURCOB = getHiddenCampoNumerico(request, "NDURCOB");
			logger.debug(NDURCOB);

			BigDecimal CFORPAG = getHiddenCampoNumerico(request, "CFORPAG");
			BigDecimal CTIPCOB = getHiddenCampoNumerico(request, "CTIPCOB");
			if (isEmpty(CTIPCOB)) {
				CTIPCOB = getCampoNumerico(request, "CTIPCOB_MOD");
			}

			BigDecimal CTIPCOM = getHiddenCampoNumerico(request, "CTIPCOM");
			BigDecimal PDTOCOM = getHiddenCampoNumerico(request, "PDTOCOM");

			BigDecimal CIDIOMA = getHiddenCampoNumerico(request, "CIDIOMA");

			BigDecimal encrypt_CBANCAR = getHiddenCampoNumerico(request, "encrypt_CBANCAR");
			String CBANCAR = getHiddenCampoTextual(request, "CBANCAR");

			if (!isEmpty(CBANCAR)) {
				if (!CBANCAR.equals("@@")) {
					String[] CBANCAR_S = CBANCAR.split("@@");
					CBANCAR = CBANCAR_S[0];
					logger.debug("PRU CBANCAR ---------------------------> " + CBANCAR);
					if (!isEmpty(encrypt_CBANCAR) && encrypt_CBANCAR.intValue() == 1) {
						CBANCAR = encryptedVal.decrypt(CBANCAR);
						logger.debug("DESCRYPTED CBANCAR ---------------------------> " + CBANCAR);
					}
				} else {
					CBANCAR = null;
				}
			}

			// bug 20761
			BigDecimal NCUOTAR = getHiddenCampoNumerico(request, "NCUOTAR");

			BigDecimal CSUBAGE = getHiddenCampoNumerico(request, "CSUBAGE");
			// BigDecimal NDURPER=getHiddenCampoNumerico(request, "NDURPER");
			BigDecimal CCOBBAN = getHiddenCampoNumerico(request, "CCOBBAN");
			logger.debug("CCOBBAN -----------------------> " + CCOBBAN);
			BigDecimal CCOMPANI = getCampoNumerico(request, "CCOMPANI");
			logger.debug("CCOMPANI -----------------------> " + CCOMPANI);

			BigDecimal CTIPREA = getHiddenCampoNumerico(request, "CTIPREA");
			BigDecimal CREAFAC = getHiddenCampoNumerico(request, "CREAFAC");
			BigDecimal CREATIP = getHiddenCampoNumerico(request, "CREATIP");
			BigDecimal PFACULT = getHiddenCampoNumerico(request, "PFACULT"); // TASK 16151 MPC 17/09/2021 Se crea
																				// variable.

			BigDecimal NDURPER = getCampoNumerico(request, "NDURPER");
			if (isEmpty(NDURPER))
				// Si no es modificable, pillar el valor original
				NDURPER = (BigDecimal) ((Map) request.getSession().getAttribute("axisctr_datosGestion")).get("NDURPER");

			NDURPER = isEmpty(NDURPER) ? getHiddenCampoNumerico(request, "NDURPER") : NDURPER;
			// BigDecimal PCAPFALL=getHiddenCampoNumerico(request, "PCAPFALL");

			BigDecimal NRENOVA = getCampoNumerico(request, "NRENOVA");
			/*
			 * if (isEmpty(NRENOVA)) // Si no es modificable, pillar el valor original
			 * NRENOVA =
			 * (BigDecimal)((Map)request.getSession().getAttribute("axisctr_datosGestion")).
			 * get("NRENOVA");
			 * 
			 * NRENOVA= isEmpty(NRENOVA) ? getHiddenCampoNumerico(request, "NRENOVA") :
			 * NRENOVA;
			 */

			// Bug 0025584/135342 - 25/02/2013 - MMS
			BigDecimal NEDAMAR = getCampoNumerico(request, "NEDAMAR");
			if (isEmpty(NEDAMAR))
				// Si no es modificable, pillar el valor original
				NEDAMAR = (BigDecimal) ((Map) request.getSession().getAttribute("axisctr_datosGestion")).get("NEDAMAR");

			NEDAMAR = isEmpty(NEDAMAR) ? getHiddenCampoNumerico(request, "NEDAMAR") : NEDAMAR;

			BigDecimal PCAPFALL = getCampoNumerico(request, "PCAPFALL");
			if (isEmpty(PCAPFALL))
				// Si no es modificable, pillar el valor original
				PCAPFALL = (BigDecimal) ((Map) request.getSession().getAttribute("axisctr_datosGestion"))
						.get("PCAPFALL");

			BigDecimal CFPREST = getCampoNumerico(request, "CFPREST");
			if (isEmpty(CFPREST))
				// Si no es modificable, pillar el valor original
				CFPREST = (BigDecimal) ((Map) request.getSession().getAttribute("axisctr_datosGestion")).get("CFPREST");

			// BigDecimal PDOSCAB=getHiddenCampoNumerico(request, "PDOSCAB");
			BigDecimal PDOSCAB = getCampoNumerico(request, "PDOSCAB");
			if (isEmpty(PDOSCAB))
				// Si no es modificable, pillar el valor original
				PDOSCAB = (BigDecimal) ((Map) request.getSession().getAttribute("axisctr_datosGestion")).get("PDOSCAB");

			// BigDecimal CFORPAGREN=getHiddenCampoNumerico(request, "CFORPAGREN");
			BigDecimal CFORPAGREN = getCampoNumerico(request, "CFORPAGREN");
			if (isEmpty(CFORPAGREN))
				// Si no es modificable, pillar el valor original
				CFORPAGREN = (BigDecimal) ((Map) request.getSession().getAttribute("axisctr_datosGestion"))
						.get("CFORPAGREN");

			String POLISSA_INI = getHiddenCampoTextual(request, "POLISSA_INI");
			BigDecimal CAGENTE = getHiddenCampoNumerico(request, "CAGENTE_TEXT");
			BigDecimal CRECFRA = isEmpty(getHiddenCampoNumerico(request, "CRECFRA")) ? new BigDecimal(0)
					: getHiddenCampoNumerico(request, "CRECFRA");

			String CPOLCIA = getHiddenCampoTextual(request, "CPOLCIA");

			PAC_IAX_PRODUCCION pacIaxProduccion = new PAC_IAX_PRODUCCION(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			Map agentes = (Map) request.getSession().getAttribute("axisctr004_agente");
			if (isEmpty(CAGENTE)) {
				logger.debug("agentes:" + agentes);
				CAGENTE = new BigDecimal(String.valueOf(agentes.get("CODI")));
			}
			BigDecimal CPROMOTOR = getHiddenCampoNumerico(request, "PRO_SPERSON");
			BigDecimal CMONPOL = getHiddenCampoNumerico(request, "CMONPOL");
			BigDecimal CTIPRETR = getHiddenCampoNumerico(request, "CTIPRETR");
			BigDecimal CINDREVFRAN = getHiddenCampoNumerico(request, "CINDREVFRAN");
			BigDecimal PRECARG = getHiddenCampoNumerico(request, "PRECARG");
			BigDecimal PDTOTEC = getHiddenCampoNumerico(request, "PDTOTEC");
			BigDecimal PRECCOM = getHiddenCampoNumerico(request, "PRECCOM");

			BigDecimal CDOMPER = isEmpty(getHiddenCampoNumerico(request, "CDOMPER")) ? new BigDecimal(0)
					: getHiddenCampoNumerico(request, "CDOMPER");

			java.sql.Date FRENOVA = AxisBaseService.stringToSqlDate(getHiddenCampoTextual(request, "FRENOVA"));

			// Bug 23963/125448 - 15/10/2012 - AMC
			BigDecimal CCOMPANIVNV = getCampoNumerico(request, "CCOMPANIVNV");
			logger.debug("CCOMPANIVNV -----------------------> " + CCOMPANIVNV);
			logger.debug("CCOMPANI -----------------------> " + CCOMPANI);
			CCOMPANI = isEmpty(CCOMPANIVNV) ? CCOMPANI : CCOMPANIVNV;

			// AMC - Bug 23183
			BigDecimal PTIPOCOA = (getCampoNumerico(request, "CTIPCOA") == null)
					? (BigDecimal) request.getSession().getAttribute("CTIPCOA")
					: getCampoNumerico(request, "CTIPCOA");

			BigDecimal PCTLOCAL = getCampoNumerico(request, "PLOCCOA");
			BigDecimal SCIACOA = getCampoNumerico(request, "SCIACOA");
			String NPOLCIA = getCampoTextual(request, "NPOLCIA");
			BigDecimal ENDOSO = getCampoNumerico(request, "ENDOSO");

			Map map2 = pacIaxProduccion.ejecutaPAC_IAX_PRODUCCION__F_GRABACUADROCOASEGURO(PTIPOCOA, PCTLOCAL, SCIACOA,
					NPOLCIA, ENDOSO);
			logger.debug(map2);
			tratarRETURNyMENSAJES(request, map2);

			// Fin AMC - Bug 23183

			/* Grabar Datos Gestin */
			// bug 20761: afegir ncuotar

			// bug 24685 2013-02-12 AEG Preimpresos
			// logger.error("quitar aeg dentra grabarDatosGestion ");
			BigDecimal LIS_TIPOASIG = getCampoNumerico(request, "CTIPOASIGNUM");
			BigDecimal NUM_POLMANUAL = getCampoNumerico(request, "NPOLIZAMANUAL");
			BigDecimal NUM_PREIMPRESO = getCampoNumerico(request, "NPREIMPRESO");
			// fin bug 24685 2013-02-12 AEG Preimpresos

			// Bug 27500 10/03/2014
			BigDecimal HAYMANDATPREV = getCampoNumerico(request, "HAYMANDATPREV");
			BigDecimal CFOLNUM = getCampoNumerico(request, "CFOLNUM");
			Date CFECMAN = stringToSqlDate(getCampoTextual(request, "CFECMAN"));
			Date FFINVIG = stringToSqlDate(getCampoTextual(request, "FFINVIG"));
			String CSUCURSAL = getCampoTextual(request, "CSUCURSAL");
			// fin Bug 27500

			// BUG 41143/229973 - 17/03/2016 - JAEG
			Date FEFEPLAZO = stringToSqlDate(getCampoTextual(request, "FEFEPLAZO"));
			Date FVENCPLAZO = stringToSqlDate(getCampoTextual(request, "FVENCPLAZO"));

			request.getSession().setAttribute("POLIZA_FEFEPLAZO", getCampoTextual(request, "FEFEPLAZO"));
			request.getSession().setAttribute("POLIZA_FVENCPLAZO", getCampoTextual(request, "FVENCPLAZO"));
			// BUG 41143/229973 - 17/03/2016 - JAEG

			// BUG 41143/229973 - 17/03/2016 - JAEG - (FEFEPLAZO - FVENCPLAZO)
			// Bug 0025584/135342 - 25/02/2013 - MMS - add NEDAMAR
			Map grabarDatosGestion = pacIaxProduccion.ejecutaPAC_IAX_PRODUCCION__F_GRABARDATOSGESTION(FEFECTO, CDURACI,
					NDURACI, FVENCIM, CFORPAG, CTIPCOB, POLISSA_INI, CTIPCOM, PDTOCOM, CIDIOMA, CPOLCIA, CBANCAR,
					NCUOTAR, CSUBAGE, NDURPER, PCAPFALL, PDOSCAB, CFORPAGREN, NDURCOB, CRECFRA, CAGENTE, INTTEC, FPPREN,
					CFPREST, NRENOVA, CCOBBAN, CCOMPANI, CPROMOTOR, CTIPREA, CREAFAC, CREATIP, CMONPOL, CTIPRETR,
					CINDREVFRAN, PRECARG, PDTOTEC, PRECCOM, CDOMPER, FRENOVA, LIS_TIPOASIG, NUM_POLMANUAL,
					NUM_PREIMPRESO, NEDAMAR, CFOLNUM, CFECMAN, CSUCURSAL, HAYMANDATPREV, FFINVIG, FEFEPLAZO, FVENCPLAZO,
					PFACULT);
			// logger.error("quitar aeg dentra grabarDatosGestion 2");
			logger.debug("CAGENTE -----------------------> " + CAGENTE);
			// fin bug 24685 2013-02-12 AEG Preimpresos

			logger.debug(grabarDatosGestion);
			tratarRETURNyMENSAJES(request, grabarDatosGestion);

			// INI BUG 724 - 23/01/2018 - JLTS se adidionan las valiables SSEGURO, CMOTMOV y
			// FINIEFE al llamado de la funcion
			// ejecutaPAC_IAX_SUPLEMENTOS__F_EDITARSUPLEMENTO
			BigDecimal SSEGURO = (BigDecimal) AbstractDispatchAction.topPila(request, "SSEGURO");
			BigDecimal CMOTMOV = (BigDecimal) AbstractDispatchAction.topPila(request, "CMOTMOV");

			Map m = pacIaxProduccion.ejecutaPAC_IAX_PRODUCCION__F_GET_FINIEFE();
			logger.debug(m);
			java.sql.Date FINIEFE = (Date) tratarRETURNyMENSAJES(request, m);
			if (FINIEFE != null) {
				// FINIEFE es realmente la fecha de efecto FEFECTO
				BigDecimal NDIAS = getCampoNumerico(request, "NDIAS");
				logger.debug("NDIAS" + NDIAS);
				BigDecimal NMESES = getCampoNumerico(request, "NMESES");
				logger.debug("NMESES" + NMESES);
				BigDecimal NAOS = getCampoNumerico(request, "NAOS");
				logger.debug("NAOS" + NAOS);
				// CJMR Se agrega CMOTMOV para manejo de vigencias en suplememntos
				Map maps = new PAC_IAX_PRODUCCION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_PRODUCCION__F_ACTUALIZA_FECHAS(SSEGURO, FINIEFE, FEFECTO, FVENCIM, FEFEPLAZO,
								FVENCPLAZO, CMOTMOV, NDIAS, NMESES, NAOS);
				logger.debug(maps);
			}
			// FIN BUG 724 - 23/01/2018

			// -- RKV - Bug 9916
			// Grabar actividad
			if (VisibleTag.esComponenteVisible(request, "axisctr004", "CACTIVI")) {
				BigDecimal CACTIVI = getCampoNumerico(request, "CACTIVI");
				Map map = pacIaxProduccion.ejecutaPAC_IAX_PRODUCCION__F_SET_ACTIVIDAD(CACTIVI);
				logger.debug(map);
				tratarRETURNyMENSAJES(request, map);
				// INI IAXIS-4205 CJMR
				((Map) request.getAttribute(Constantes.FORMDATA)).put("CACTIVI", CACTIVI);
				((Map) request.getSession().getAttribute("axisctr_datosGestion")).put("CACTIVI", CACTIVI);
				// FIN IAXIS-4205 CJMR
			}
			// -- Fin RKV - Bug 9916

		} catch (Exception e) {
			// logger.error("Error en el servicio Axisctr004Service - mtodo m_guardarDatos",
			// e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
			// Gestin de campos y dependencias
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}

	/**
	 * Guarda la pantalla, realiza su validacin y determina la siguiente pantalla a
	 * ejecutar.
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_siguiente(HttpServletRequest request, AbstractDispatchAction thisAction) {
		logger.debug("Axisctr004Service m_siguiente");

		// BUG: 24685 2012-02-06 AEG preimpresos
		Map m1, m2;
		BigDecimal b1;
		try {
			PAC_IAX_ESC_RIESGO pac_iax_esc_riesgo = new PAC_IAX_ESC_RIESGO(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN)); // IAXIS-2016: Scoring 11/03/2019
			m1 = new PAC_IAX_PRODUCCION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_PRODUCCION__F_GET_DETPOLIZA();
			m2 = (Map) tratarRETURNyMENSAJES(request, m1);
			if (m2 != null) {
				b1 = (BigDecimal) m2.get("CRAMO");
				// logger.error("quitar aeg CRAMO : "+b1.toString());
			}

			// ini JDS- BUG 29582#c164933
			BigDecimal SSEGURO = (BigDecimal) m2.get("SSEGURO");
			AbstractDispatchAction.topPila(request, "SSEGURO_005", SSEGURO);
			// fin JDS- BUG 29582#c164933

			// Inicio IAXIS-2016: Scoring 11/03/2019

			// INI IAXIS-4205 CJMR
			BigDecimal pSPERSON = isEmpty(
					(BigDecimal) ((Map) ((Map) ((List) m2.get("TOMADORES")).get(0)).get("OB_IAX_TOMADORES"))
							.get("SPEREAL"))
									? (BigDecimal) ((Map) ((Map) ((List) m2.get("TOMADORES")).get(0))
											.get("OB_IAX_TOMADORES")).get("SPERSON")
									: (BigDecimal) ((Map) ((Map) ((List) m2.get("TOMADORES")).get(0))
											.get("OB_IAX_TOMADORES")).get("SPEREAL");
			// FIN IAXIS-4205 CJMR
			BigDecimal pSPRODUC = (BigDecimal) m2.get("SPRODUC");
			BigDecimal pCAGENTE = (BigDecimal) m2.get("CAGENTE");
			BigDecimal pCDOMICI = (BigDecimal) ((Map) ((Map) ((List) (((Map) ((Map) ((List) m2.get("TOMADORES")).get(0))
					.get("OB_IAX_TOMADORES")).get("DIRECCIONES"))).get(0)).get("OB_IAX_DIRECCIONES")).get("CDOMICI");
			// Inicio IAXIS-2016: Scoring 10/08/2020 BJHB
			BigDecimal pCagrupa = null;

			if (!isEmpty((BigDecimal) ((Map) ((Map) ((List) m2.get("TOMADORES")).get(0)).get("OB_IAX_TOMADORES"))
					.get("CAGRUPA")))
				pCagrupa = (BigDecimal) ((Map) ((Map) ((List) m2.get("TOMADORES")).get(0)).get("OB_IAX_TOMADORES"))
						.get("CAGRUPA");

			Map mapRies1 = pac_iax_esc_riesgo.ejecutaPAC_IAX_ESC_RIESGO__F_CALCULA_MODELO(pSPERSON, pSPRODUC, pCAGENTE,
					pCDOMICI, pCagrupa);
			// fin IAXIS-2016: Scoring 10/08/2020 BJHB
			BigDecimal pReturn = (BigDecimal) tratarRETURNyMENSAJES(request, mapRies1);

			// Fin IAXIS-2016: Scoring 11/03/2019

		} catch (Exception e) {

			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR); // IAXIS-2016:
																													// Scoring
																													// 11/03/2019

		}
		// fin BUG: 24685 2012-02-06 AEG

		m_guardarEstadoPantalla(request, thisAction, null);
		if (VisibleTag.esComponenteVisible(request, "axisctr004", "DSP_PRESTAMOS"))
			m_guardarPrestamo(request, thisAction);
		HashMap orden;
		HashMap m = this.f_Get_Avisos(request, this.whoami(this));
		BigDecimal pRETURN = (BigDecimal) this.tratarRETURNyMENSAJES(request, m);
		request.setAttribute("PLSTAVISOS", m.get("PLSTAVISOS"));
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		try {
			// BUG: 0026968: RSAG101 - Producto RC Argentina. Incidencias (14/5)
			PAC_IAX_PARAM param = new PAC_IAX_PARAM((java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			orden = param.ejecutaPAC_IAX_PARAM__F_PAREMPRESA_N("ORDEN_DATOS_VEHICULO", usuario.getCempres());

			if (orden.get("RETURN") != null && orden.get("RETURN").equals(BigDecimal.ONE)) {
				request.getSession().setAttribute("Mostrar", 1);
			} else {
				request.getSession().setAttribute("Mostrar", 0);
			}

		} catch (Exception e) {
			e.toString();
		}
		// Creamos las sesiones de usuario

		if (pRETURN != null && pRETURN.intValue() != 1)
			m_validar(request, thisAction, Constantes.SIGUIENTE);

		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	/**
	 * Guarda la pantalla, realiza su validacin y determina la pantalla anterior a
	 * ejecutar.
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_anterior(HttpServletRequest request, AbstractDispatchAction thisAction) {
		logger.debug("Axisctr004Service m_anterior");
		m_guardarEstadoPantalla(request, thisAction, null);
		if (VisibleTag.esComponenteVisible(request, "axisctr004", "DSP_PRESTAMOS"))
			m_guardarPrestamo(request, thisAction);
		// Bug 9733 - AMC
		// m_validar(request, thisAction, Constantes.ANTERIOR);
		try {
			if (!Boolean.valueOf(true).equals(request.getAttribute("multiPantalla")))
				// No hace falta buscar el forward si estamos en multi-pantalla, lo buscar la
				// AXCTR027
				request.setAttribute(Constantes.FORWARDACTION,
						AxisCodeWizard.findForward(request, Constantes.ANTERIOR, whoami(this), null));
		} catch (Exception e) {
			// logger.error("Error en el servicio Axisctr004Service - mtodo m_validar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);

			// Gestin de campos y dependencias
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}

	}

	/**
	 * Realiza la validacin de la pantalla y guarda en FORWARDACTION la siguiente
	 * pgina donde vamos a navegar.
	 * 
	 * @param request
	 * @param thisAction
	 * @param direccion
	 */
	private void m_validar(HttpServletRequest request, AbstractDispatchAction thisAction, BigDecimal direccion) {
		logger.debug("Axisctr004Service m_validar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap map = null;
		try {
			/* Validacin */
			String CMODO = (String) AbstractDispatchAction.topPila(request, "CMODO");
			if (isEmpty(CMODO))
				CMODO = "EST";
			// Map map = new
			// PAC_IAX_VALIDACIONES((java.sql.Connection)request.getAttribute(Constantes.DB01CONN)).ejecutaPAC_IAX_VALIDACIONES__F_VALIDADATOSGESTION(CMODO);
			// logger.debug (map);
			// BigDecimal codiRetorn = (BigDecimal) tratarRETURNyMENSAJES(request, map);

			map = new PAC_IAX_VALIDACIONES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_VALIDACIONES__F_VALIDADATOSGSTPREGPOL();
			logger.debug(map);

			BigDecimal codiRetorn2 = (BigDecimal) tratarRETURNyMENSAJES(request, map);

			if (codiRetorn2.intValue() == 0) {
				// vaya al siguiente...
				if (!Boolean.valueOf(true).equals(request.getAttribute("multiPantalla")))
					// No hace falta buscar el forward si estamos en multi-pantalla, lo buscar la
					// AXCTR027
					request.setAttribute(Constantes.FORWARDACTION,
							AxisCodeWizard.findForward(request, direccion, whoami(this), null));
			}
		} catch (Exception e) {
			// logger.error("Error en el servicio Axisctr004Service - mtodo m_validar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);

			// Gestin de campos y dependencias
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}

	/**
	 * Carga las cuentas del tomador y las devuelve en modo Ajax.
	 * 
	 * @param request
	 */
	public void m_ajax_cargar_cuentas_tomador(HttpServletRequest request) {
		AESUtil encryptedVal = new AESUtil();
		String TCBANCAR = "";
		String CBANCAR = "";
		String maskingData = "";
		BigDecimal encrypt_CBANCAR = getHiddenCampoNumerico(request, "encrypt_CBANCAR");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();
		HashMap cuentaTomador = null;
		Map map2 = new HashMap();

		logger.debug("Axisctr004Service m_ajax_cargar_cuentas_tomador");
		logger.debug(
				"Axisctr004Service m_ajax_cargar_cuentas_tomador [encrypt_CBANCAR]: " + encrypt_CBANCAR.intValue());

		try {
			Map map = new PAC_IAX_PRODUCCION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_PRODUCCION__F_GET_TOMADORCCC();
			map2 = map;
			logger.debug("ejecutaPAC_IAX_PRODUCCION__F_GET_TOMADORCCC()" + map);

			if (!isEmpty(map)) {
				if (!isEmpty(map2.get("RETURN"))) {

					SPERSON = (BigDecimal) map2.get("PSPERSON");
					ArrayList<HashMap> lista = (ArrayList) map2.get("RETURN");
					ArrayList<HashMap> lista2 = new ArrayList<HashMap>();
					// lista2=lista;
					if (!isEmpty(lista) && lista.size() > 0) {
						for (Map pers : lista) {
							if (((BigDecimal) pers.get("SPERSON")).intValue() == SPERSON.intValue()) {
								lista2.add((HashMap) pers);
							}
						}
					}
					lista.clear();
					if (!isEmpty(lista2) && lista2.size() > 0) {
						for (Map pers : lista2) {

							lista.add((HashMap) pers);

						}
					}

					logger.debug("lista.size" + lista.size());
					for (int i = 0; i < lista.size(); i++) {
						cuentaTomador = (HashMap) lista.get(i);
						CBANCAR = (String) cuentaTomador.get("CBANCAR");
						TCBANCAR = (String) cuentaTomador.get("TCBANCAR");
						if (!isEmpty(encrypt_CBANCAR) && encrypt_CBANCAR.intValue() == 1) {
							maskingData = "";
							for (int j = 0; j < TCBANCAR.length() - 4; j++) {
								maskingData += "X";
							}
							maskingData += TCBANCAR.substring(TCBANCAR.length() - 4, TCBANCAR.length());
							cuentaTomador.put("masc_CBANCAR", maskingData);
							cuentaTomador.put("encrypted_CBANCAR", encryptedVal.encrypt(CBANCAR));
						} else {
							cuentaTomador.put("masc_CBANCAR", TCBANCAR);
							cuentaTomador.put("encrypted_CBANCAR", CBANCAR);
						}
					}
				}
				map = map2;
				List cuentasTomador = (List) ajax.rellenarPlAContenedorAjax(map);
				ajax.guardarContenidoFinalAContenedorAjax(cuentasTomador);
				logger.debug("cuentasTomador --> " + cuentasTomador);
			}
		} catch (Exception e) {
			// logger.error("Error en el servicio Axisctr004Service - mtodo
			// m_ajax_cargar_cuentas_tomador", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	public void m_ajax_cargar_cuentas_tomadorAXIS(HttpServletRequest request) {
		logger.debug("Axisctr004Service m_ajax_cargar_cuentas_tomadorAXIS");
		AESUtil encryptedVal = new AESUtil();
		String TCBANCAR = "";
		String CBANCAR = "";
		String maskingData = "";
		BigDecimal encrypt_CBANCAR = getHiddenCampoNumerico(request, "encrypt_CBANCAR");
		HashMap cuentaTomador = null;
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();
		try {

			BigDecimal SSEGURO = (BigDecimal) AbstractDispatchAction.topPila(request, "SSEGURO");
			Map map1 = new PAC_IAX_PRODUCCION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_PRODUCCION__TRASPASO_CCC(SSEGURO, null, SPERSON);
			logger.debug("ejecutaPAC_IAX_PRODUCCION__traspasoccc()" + map1);
			Map map = new PAC_IAX_PRODUCCION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_PRODUCCION__F_GET_TOMADORCCC();
			logger.debug("ejecutaPAC_IAX_PRODUCCION__F_GET_TOMADORCCC()" + map);
			if (!isEmpty(map)) {
				if (!isEmpty(map.get("RETURN"))) {
					SPERSON = (BigDecimal) map.get("PSPERSON");
					ArrayList<HashMap> lista = (ArrayList) map.get("RETURN");
					if (!isEmpty(lista) && lista.size() > 1) {
						for (Map pers : lista) {
							if (((BigDecimal) pers.get("SPERSON")).intValue() != SPERSON.intValue()) {
								lista.remove(pers);
							}
						}
					}
					for (int i = 0; i < lista.size(); i++) {
						cuentaTomador = (HashMap) lista.get(i);
						CBANCAR = (String) cuentaTomador.get("CBANCAR");
						TCBANCAR = (String) cuentaTomador.get("TCBANCAR");
						if (!isEmpty(encrypt_CBANCAR) && encrypt_CBANCAR.intValue() == 1) {
							maskingData = "";
							for (int j = 0; j <= TCBANCAR.length() - 4; j++) {
								maskingData += "X";
							}
							maskingData += TCBANCAR.substring(TCBANCAR.length() - 5, TCBANCAR.length());
							cuentaTomador.put("masc_CBANCAR", maskingData);
							cuentaTomador.put("encrypted_CBANCAR", encryptedVal.encrypt(CBANCAR));
						} else {
							cuentaTomador.put("masc_CBANCAR", TCBANCAR);
							cuentaTomador.put("encrypted_CBANCAR", CBANCAR);
						}
					}

				}
				List cuentasTomador = (List) ajax.rellenarPlAContenedorAjax(map);
				ajax.guardarContenidoFinalAContenedorAjax(cuentasTomador);
			}
			request.getSession().removeAttribute("cargaHost");
		} catch (Exception e) {
			// logger.error("Error en el servicio Axisctr004Service - mtodo
			// m_ajax_cargar_cuentas_tomador", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	/**
	 * Carga las cuentas del tomador y las devuelve en modo Ajax.
	 * 
	 * @param request
	 */
	public void m_ajax_actualiza_fefecto(HttpServletRequest request) {
		logger.debug("Axisctr004Service m_ajax_cargar_cuentas_tomador");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();
		try {

			Date FEFECTO = AxisBaseService.stringToSqlDate(getHiddenCampoTextual(request, "FEFECTO"));

			Map map = new PAC_IAX_PRODUCCION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_PRODUCCION__F_SET_NRENOVA(FEFECTO);
			logger.debug("ejecutaPAC_IAX_PRODUCCION__F_SET_NRENOVA()" + map);
			if (!isEmpty(map)) {
				ajax.rellenarPlAContenedorAjax(map);
				ajax.guardarContenidoFinalAContenedorAjax(map);
			}
		} catch (Exception e) {
			// logger.error("Error en el servicio Axisctr004Service - mtodo
			// m_ajax_actualiza_fefecto", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	/**
	 * Carga las cuentas del tomador y las devuelve en modo Ajax.
	 * 
	 * @param request
	 */
	public void m_ajax_cargar_cuentas_HOST(HttpServletRequest request) {
		logger.debug("Axisctr004Service m_ajax_cargar_cuentas_HOST");
		AESUtil encryptedVal = new AESUtil();
		String TCBANCAR = "";
		String CBANCAR = "";
		String maskingData = "";
		BigDecimal encrypt_CBANCAR = getHiddenCampoNumerico(request, "encrypt_CBANCAR");
		HashMap cuentaTomador = null;

		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();
		try {

			SPERSON = getCampoNumerico(request, "SPERSON");
			SNIP = getCampoTextual(request, "SNIP");

			Map map = new PAC_IAX_PRODUCCION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_PRODUCCION__F_GET_CCC_HOST(SPERSON, SNIP, "EST");
			logger.debug("ejecutaPAC_IAX_PRODUCCION__F_GET_CCC_HOST()" + map);
			if (!isEmpty(map)) {

				List cuentasTomador = (List) ajax.rellenarPlAContenedorAjax(map);
				ArrayList lista = (ArrayList) map.get("RETURN");
				if (!isEmpty(map.get("RETURN"))) {

					for (int i = 0; i < lista.size(); i++) {
						cuentaTomador = (HashMap) lista.get(i);
						CBANCAR = (String) cuentaTomador.get("CBANCAR");
						TCBANCAR = (String) cuentaTomador.get("TCBANCAR");
						if (!isEmpty(encrypt_CBANCAR) && encrypt_CBANCAR.intValue() == 1) {
							maskingData = "";
							for (int j = 0; j <= TCBANCAR.length() - 4; j++) {
								maskingData += "X";
							}
							maskingData += TCBANCAR.substring(TCBANCAR.length() - 5, TCBANCAR.length());
							cuentaTomador.put("masc_CBANCAR", maskingData);
							cuentaTomador.put("encrypted_CBANCAR", encryptedVal.encrypt(CBANCAR));
						} else {
							cuentaTomador.put("masc_CBANCAR", TCBANCAR);
							cuentaTomador.put("encrypted_CBANCAR", CBANCAR);
						}
					}
				}
				request.getSession().setAttribute("cargaHost", "0");
				ajax.guardarContenidoFinalAContenedorAjax(cuentasTomador);
			}

		} catch (Exception e) {
			// logger.error("Error en el servicio Axisctr004Service - mtodo
			// m_ajax_cargar_cuentas_HOST", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	/**
	 * Actualiza el campo de vencimiento y las devuelve en modo Ajax.
	 * 
	 * @param request
	 */
	public void m_ajax_actualiza_fvencim(HttpServletRequest request) {
		logger.debug("Axisctr004Service m_ajax_actualiza_fvencim");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();
		try {
			BigDecimal NDURACI = getCampoNumerico(request, "NDURACI");
			Date FEFECTO = AxisBaseService.stringToSqlDate(getCampoTextual(request, "FEFECTO"), "dd/MM/yyyy");

			// Bug 19412 - RSC - 26/10/2011 - LCOL_T004: Completar parametrizacin de los
			// productos de Vida Individua
			BigDecimal CDURACI = getCampoNumerico(request, "CDURACI");
			// Fin Bug 19412

			Map map2 = new PAC_IAX_PRODUCCION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_PRODUCCION__F_SET_NRENOVA(FEFECTO);
			Map map = new PAC_IAX_PRODUCCION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_PRODUCCION__F_SET_NDURACI(FEFECTO, NDURACI, CDURACI);
			// Bug 23117 - RSC - 13/08/2012
			Map map3 = new PAC_IAX_PRODUCCION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_PRODUCCION__F_SET_FRENOVA(FEFECTO, CDURACI);
			// Fin Bug 23117

			logger.debug("ejecutaPAC_IAX_PRODUCCION__F_SET_NDURACI()" + map);
			logger.debug("ejecutaPAC_IAX_PRODUCCION__F_SET_NRENOVA()" + map2);
			logger.debug("ejecutaPAC_IAX_PRODUCCION__F_SET_NRENOVA()" + map3);

			map.putAll(map2);

			// Bug 23117 - RSC - 13/08/2012
			map.putAll(map3);
			// Fin Bug 23117

			if (!isEmpty(map)) {
				ajax.guardarContenidoFinalAContenedorAjax(map);
			}
		} catch (Exception e) {
			// logger.error("Error en el servicio Axisctr004Service - mtodo
			// m_ajax_actualiza_fvencim", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());

		}
	}

	// BUG:8613

	/**
	 * Realiza una bsqueda de productos por Ajax.
	 * 
	 * @see Axisctr004Service#buscaProductos
	 * @param request El HttpServletRequest que contiene la peticin del cliente web.
	 */
	public void m_ajax_actualizar_agente(HttpServletRequest request) {
		logger.debug("Axisctr004Service m_ajax_busqueda_productos");
		AjaxContainerService ajax = new AjaxContainerService();

		try {
			String CAGENTE = getCampoTextual(request, "CAGENTE");
			Map agents = this.ActualizaAgente(request, CAGENTE);

			ajax.guardarContenidoFinalAContenedorAjax(agents);
			ajax.rellenarPlAContenedorAjax(agents);
		} catch (Exception e) {
			// logger.error("Error en el servicio Axisctr004Service - mtodo
			// m_ajax_actualizar_agente", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {

			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	/**
	 * Realiza una bsqueda de productos por Ajax.
	 * 
	 * @see Axisctr004Service#buscaProductos
	 * @param request El HttpServletRequest que contiene la peticin del cliente web.
	 */
	public void m_ajax_actualizar_actividad(HttpServletRequest request) {
		logger.debug("Axisctr004Service m_ajax_actualizar_actividad");
		AjaxContainerService ajax = new AjaxContainerService();

		try {
			String TDESCRI = getCampoTextual(request, "TDESCRI");
			String NVERSION = getCampoTextual(request, "NVERSION");
			String ob_iax = getCampoTextual(request, "OB_IAX");

			ob_iax = ob_iax.replaceAll("\\{", "");
			ob_iax = ob_iax.replaceAll("\\}", "");

			Map map_ob_iax = new HashMap();
			// Map map_ob_iax2 = new HashMap();
			String[] pairs = ob_iax.split(",");
			for (int i = 0; i < pairs.length; i++) {
				String pair = pairs[i];
				for (int j = i + 1; j < pairs.length; j++) {
					if (!pairs[j].contains("=")) {
						pair.concat(pairs[j]);
						i++;
					} else {
						break;
					}
				}
				String[] keyValue = pair.split("=");
				String keyUno = keyValue[0].trim();
				String keyDos = keyValue[1].trim();
				map_ob_iax.put(keyUno, keyDos);
			}

			logger.debug("######MAP####### " + map_ob_iax);

			// map_ob_iax2 = Splitter.on(",").withKeyValueSeparator("=").split(ob_iax);

			// logger.debug("#####SPLITTER######## "+map_ob_iax2);

			// ajax.guardarContenidoFinalAContenedorAjax(TDESCRI);
			// ajax.guardarContenidoFinalAContenedorAjax(NVERSION);

			BigDecimal idversion = null;
			BigDecimal idconv = null;
			String tcodconv = null;
			BigDecimal cestado = null;
			BigDecimal cperfil = null;
			String tdescri = null;
			BigDecimal corganismo = null;
			BigDecimal cvida = null;
			BigDecimal nversion = null;
			BigDecimal cestadovers = null;
			BigDecimal nversion_ant = null;
			String testado = null;
			String tperfil = null;
			String torganismo = null;
			String testadovers = null;
			String tvida = null;
			String tobserv = null;

			if (!isEmpty(map_ob_iax.get("IDVERSION")) && !(map_ob_iax.get("IDVERSION").equals("null")))
				idversion = new BigDecimal(map_ob_iax.get("IDVERSION").toString());
			if (!isEmpty(map_ob_iax.get("IDCONV")) && !(map_ob_iax.get("IDCONV").equals("null")))
				idconv = new BigDecimal(String.valueOf(map_ob_iax.get("IDCONV")));
			tcodconv = map_ob_iax.get("TCODCONV").toString();
			if (!isEmpty(map_ob_iax.get("CESTADO")) && !(map_ob_iax.get("CESTADO").equals("null")))
				cestado = new BigDecimal(map_ob_iax.get("CESTADO").toString());
			if (!isEmpty(map_ob_iax.get("CPERFIL")) && !(map_ob_iax.get("CPERFIL").equals("null")))
				cperfil = new BigDecimal(map_ob_iax.get("CPERFIL").toString());
			tdescri = map_ob_iax.get("TDESCRI").toString();
			if (!isEmpty(map_ob_iax.get("CPERFIL")) && !(map_ob_iax.get("CPERFIL").equals("null")))
				corganismo = new BigDecimal(map_ob_iax.get("CPERFIL").toString());
			if (!isEmpty(map_ob_iax.get("CVIDA")) && !(map_ob_iax.get("CVIDA").equals("null")))
				cvida = new BigDecimal(map_ob_iax.get("CVIDA").toString());
			if (!isEmpty(map_ob_iax.get("NVERSION")) && !(map_ob_iax.get("NVERSION").equals("null")))
				nversion = new BigDecimal(map_ob_iax.get("NVERSION").toString());
			if (!isEmpty(map_ob_iax.get("CESTADOVERS")) && !(map_ob_iax.get("CESTADOVERS").equals("null")))
				cestadovers = new BigDecimal(map_ob_iax.get("CESTADOVERS").toString());
			if (!isEmpty(map_ob_iax.get("NVERSION_ANT")) && !(map_ob_iax.get("NVERSION_ANT").equals("null")))
				nversion_ant = new BigDecimal(map_ob_iax.get("NVERSION_ANT").toString());
			testado = map_ob_iax.get("TESTADO").toString();
			tperfil = map_ob_iax.get("TPERFIL").toString();
			torganismo = map_ob_iax.get("TORGANISMO").toString();
			testadovers = map_ob_iax.get("TESTADOVERS").toString();
			tvida = map_ob_iax.get("TVIDA").toString();
			tobserv = map_ob_iax.get("TOBSERV").toString();

			request.getSession().setAttribute("NVERSION_ANT", nversion_ant);

			// Map map = new
			// PAC_IAX_CONVENIOS_EMP((java.sql.Connection)request.getAttribute(Constantes.DB01CONN)).ejecutaPAC_IAX_CONVENIOS_EMP__F_SET_GRABARCONVEMPVERS(idversion,idconv,tcodconv,cestado,cperfil,tdescri,corganismo,cvida,nversion,cestadovers,nversion_ant,testado,tperfil,
			// torganismo,testadovers,tvida,tobserv);
			Map map = new PAC_IAX_PRODUCCION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_PRODUCCION__F_SET_GRABARCONVEMPVERS(idversion, idconv, tcodconv, cestado, cperfil,
							tdescri, corganismo, cvida, nversion, cestadovers, nversion_ant, testado, tperfil,
							torganismo, testadovers, tvida, tobserv);

			/* Comisin */
			PAC_IAX_LISTVALORES pac_iax_listvalores = new PAC_IAX_LISTVALORES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			Map map2 = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTCOMISION();
			logger.debug(map2);
			List comisiones = (List) tratarRETURNyMENSAJES(request, map2);

			map.put("comisiones", comisiones);

			initDatosGestion(request);

			map.put("CTIPCOM_COM", request.getSession().getAttribute("COMIS_CTIPCOM"));

			logger.debug("AQUICOMISIONES" + map);

			ajax.rellenarPlAContenedorAjax(map);

			ajax.guardarContenidoFinalAContenedorAjax(map);
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr004Service - mtodo m_ajax_actualizar_actividad", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {

			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	/**
	 * Carga el agente inicial de la pantalla.
	 * 
	 * @param request El HttpServletRequest que contiene la peticin del cliente web.
	 */
	private void cargaAgente(HttpServletRequest request) throws Exception {

		// Cargar Agente de la BD
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		BigDecimal CAGENTE_TEXT = this.getCampoNumerico(request, "CAGENTE_TEXT");
		Map agente = new HashMap();
		if (isEmpty(CAGENTE_TEXT)) {
			// --BUG 8613 - 160309 - ACC - Suplement Canvi d'agent
			// Es canvia la forma de recuperar l'agent per la plissa
			// Map mapCX = new
			// PAC_IAX_COMMON((java.sql.Connection)request.getAttribute(Constantes.DB01CONN)).ejecutaPAC_IAX_COMMON__F_GET_CXTAGENTE();

			Map mapCX = new PAC_IAX_PRODUCCION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_PRODUCCION__F_GET_DATPOLIZA(null);
			logger.debug(mapCX);
			Map datosPoliza = (Map) tratarRETURNyMENSAJES(request, mapCX);
			// --FI BUG 8613 - 160309 - ACC - Suplement Canvi d'agent

			// --BUG 8613 - 160309 - ACC - Suplement Canvi d'agent
			// HashMap map=new
			// PAC_IAX_LISTVALORES((java.sql.Connection)request.getAttribute(Constantes.DB01CONN)).ejecutaPAC_IAX_LISTVALORES__F_GET_LSTAGENTES(null,
			// null, String.valueOf(mapCX.get("RETURN")), new BigDecimal(1));
			String CONDICION = this.getCampoTextual(request, "CONDICION");
			HashMap map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTAGENTES_COND(null, null,
							(BigDecimal) (datosPoliza.get("CAGENTE")), new BigDecimal(1), CONDICION);
			// --FI BUG 8613 - 160309 - ACC - Suplement Canvi d'agent
			logger.debug("agente : " + map);
			List listaAgentes = (List) tratarRETURNyMENSAJES(request, map);

			// --BUG 8613 - 160309 - ACC - Suplement Canvi d'agent
			// Map agente = getObjetoDeLista(listaAgentes,
			// String.valueOf(mapCX.get("RETURN")), "CODI");
			agente = getObjetoDeLista(listaAgentes, String.valueOf(datosPoliza.get("CAGENTE")), "CODI");
			// --FI BUG 8613 - 160309 - ACC - Suplement Canvi d'agent
		} else {
			Map mapCX = new PAC_IAX_PRODUCCION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_PRODUCCION__F_GET_DATPOLIZA(null);
			logger.debug(mapCX);
			Map datosPoliza = (Map) tratarRETURNyMENSAJES(request, mapCX);
			String CONDICION = this.getCampoTextual(request, "CONDICION");
			HashMap map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTAGENTES_COND(null, null,
							(BigDecimal) (datosPoliza.get("CAGENTE")), new BigDecimal(1), CONDICION);
			// --FI BUG 8613 - 160309 - ACC - Suplement Canvi d'agent
			logger.debug("agente : " + map);
			List listaAgentes = (List) tratarRETURNyMENSAJES(request, map);

			agente = getObjetoDeLista(listaAgentes, String.valueOf(datosPoliza.get("CAGENTE")), "CODI");
			logger.debug("agente : " + agente);

		}

		request.getSession().setAttribute("axisctr004_agente", agente);

	}

	/**
	 * Carga el agente inicial de la pantalla.
	 * 
	 * @param request El HttpServletRequest que contiene la peticin del cliente web.
	 */
	private Map ActualizaAgente(HttpServletRequest request, String CAGENTE) throws Exception {
		Map mapAgentes = new HashMap();

		// Cargar Agente de la BD
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		String CONDICION = this.getCampoTextual(request, "CONDICION");
		mapAgentes = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTAGENTES_COND(null, null, new BigDecimal(CAGENTE),
						new BigDecimal(1), CONDICION);
		List agentes = new ArrayList();

		Map agente = new HashMap();
		if (!isEmpty(tratarRETURNyMENSAJES(request, mapAgentes))) {
			agentes = (List) mapAgentes.get("RETURN");
			if (agente.size() > 0)
				agente = (Map) agentes.get(0);
			// agente = getObjetoDeLista(agentes, String.valueOf(mapAgentes.get("RETURN")),
			// "CODI");
		}
		request.getSession().setAttribute("axisctr004_agente", agente);

		return mapAgentes;

	}

	public void m_ctrhost(HttpServletRequest request, AbstractDispatchAction thisAction) {
		logger.debug("Axisctr004Service m_ctrhost");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {
			m_guardarEstadoPantalla(request, thisAction, null);
			// this.actualizarPrestamos(request);
			PAC_IAX_PERSONA pac_iax_persona = new PAC_IAX_PERSONA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			PAC_IAX_PRODUCCION pac_iax_produccion = new PAC_IAX_PRODUCCION(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			BigDecimal NRIESGO = this.getCampoNumerico(request, "NRIESGO");
			Map m = pac_iax_persona.ejecutaPAC_IAX_PERSONA__F_GET_CONTRATOS_HOST(
					(String) AbstractDispatchAction.topPila(request, "CMODO"));
			logger.debug(m);
			if (((BigDecimal) this.tratarRETURNyMENSAJES(request, m)).intValue() == 0) {

				ArrayList lstsaldo = (ArrayList<HashMap>) m.get("PT_PRESTAMO");
				if (!isEmpty(lstsaldo) && lstsaldo.size() > 0) {
					request.getSession().setAttribute("prestamos", lstsaldo);
					request.getSession().setAttribute("bt_ctrhost", new BigDecimal(1));
				}

			}

		} catch (Exception e) {
			// logger.error("Error en el servicio Axisctr004Service - mtodo m_ctrhost", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {

			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));

		}
	}

	public void m_guardarPrestamo(HttpServletRequest request, AbstractDispatchAction thisAction) {
		logger.debug("Axisctr004Service m_guardarPrestamo");

		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {

			PAC_IAX_PRODUCCION pac_iax_produccion = new PAC_IAX_PRODUCCION(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			BigDecimal NRIESGO = getCampoNumerico(request, "NRIESGO");
			BigDecimal ICAPMAXPOL = getCampoNumerico(request, "ICAPMAXPOL");

			String IDCUENTA = this.getCampoTextual(request, "IDCUENTA");
			logger.debug("IDCUENTA-" + IDCUENTA);
			if (!isEmpty(IDCUENTA)) {
				// this.actualizarPrestamos(request);

				BigDecimal CTIPCUENTA = getCampoNumerico(request, "CTIPCUENTA");
				logger.debug("CTIPCUENTA-" + CTIPCUENTA);

				BigDecimal CTIPBAN = getCampoNumerico(request, "CTIPBAN");
				logger.debug("CTIPBAN-" + CTIPBAN);

				BigDecimal CTIPIMP = getCampoNumerico(request, "CTIPIMP");
				logger.debug("CTIPIMP-" + CTIPIMP);

				BigDecimal ISALDO = getCampoNumerico(request, "ISALDO");
				logger.debug("ISALDO-" + ISALDO);

				BigDecimal PORCEN = getCampoNumerico(request, "PORCEN");
				logger.debug("PORCEN-" + PORCEN);

				BigDecimal ILIMITE = getCampoNumerico(request, "ILIMITE");
				logger.debug("ILIMITE-" + ILIMITE);

				BigDecimal ICAPMAX = getCampoNumerico(request, "ICAPMAX");
				logger.debug("ICAPMAX-" + ICAPMAX);
				String CMONEDA = this.getCampoTextual(request, "CMONEDA");
				logger.debug("CMONEDA-" + CMONEDA);
				BigDecimal ICAPASE = getCampoNumerico(request, "ICAPASE");
				logger.debug("ICAPASEG-" + ICAPASE);
				String DESCRIPCION = this.getCampoTextual(request, "DESCRIPCION");
				logger.debug("DESCRIPCION-" + DESCRIPCION);
				Date FINIPREST = AxisBaseService.stringToSqlDate(getCampoTextual(request, "FINIPREST"));
				Date FFINPREST = AxisBaseService.stringToSqlDate(getCampoTextual(request, "FFINPREST"));

				Map map = // seleccionar
						pac_iax_produccion.ejecutaPAC_IAX_PRODUCCION__F_SET_PRESTAMOSEG(NRIESGO, new BigDecimal(1),
								IDCUENTA, CTIPCUENTA, CTIPBAN, CTIPIMP, ISALDO, PORCEN, ILIMITE, ICAPMAX, CMONEDA,
								ICAPMAXPOL, ICAPASE, DESCRIPCION, FINIPREST, FFINPREST);
				logger.debug(map);
			}

		} catch (Exception e) {
			// logger.error("Error en el servicio Axisctr004Service - mtodo m_guardar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {

			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));

		}

	}

	// ejemplo

	private void actualizarPrestamos(HttpServletRequest request) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {
			PAC_IAX_PRODUCCION pac_iax_produccion = new PAC_IAX_PRODUCCION(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			BigDecimal NRIESGO = getCampoNumerico(request, "NRIESGO");
			BigDecimal ICAPMAXPOL = getCampoNumerico(request, "ICAPMAXPOL");
			formdata.put("ICAPMAXPOL", ICAPMAXPOL);
			logger.debug("------ icapmaxpol:" + ICAPMAXPOL);
			ArrayList<HashMap> saldo = (ArrayList<HashMap>) request.getSession().getAttribute("prestamos");
			for (HashMap s : saldo) {
				HashMap m = (HashMap) s.get("OB_IAX_PRESTAMOSEG");
				logger.debug(m);
				if (!isEmpty(m.get("IDCUENTA"))) {
					BigDecimal SELSALDO = isEmpty(m.get("SELSALDO")) ? new BigDecimal(0)
							: new BigDecimal(String.valueOf(m.get("SELSALDO")));
					logger.debug("SELSALDO-" + SELSALDO);

					String IDCUENTA = isEmpty(m.get("IDCUENTA")) ? null : String.valueOf(m.get("IDCUENTA"));
					logger.debug("IDCUENTA-" + IDCUENTA);

					BigDecimal CTIPCUENTA = isEmpty(m.get("CTIPCUENTA")) ? null
							: new BigDecimal(String.valueOf(m.get("CTIPCUENTA")));
					logger.debug("CTIPCUENTA-" + CTIPCUENTA);

					BigDecimal CTIPBAN = isEmpty(m.get("CTIPBAN")) ? null
							: new BigDecimal(String.valueOf(m.get("CTIPBAN")));
					logger.debug("CTIPBAN-" + CTIPBAN);

					BigDecimal CTIPIMP = isEmpty(m.get("CTIPIMP")) ? null
							: new BigDecimal(String.valueOf(m.get("CTIPIMP")));
					logger.debug("CTIPIMP-" + CTIPIMP);

					BigDecimal ISALDO = isEmpty(m.get("ISALDO")) ? null
							: new BigDecimal(String.valueOf(m.get("ISALDO")));
					logger.debug("ISALDO-" + ISALDO);

					BigDecimal PORCEN = isEmpty(m.get("PORCEN")) ? null
							: new BigDecimal(String.valueOf(m.get("PORCEN")));
					logger.debug("PORCEN-" + PORCEN);

					BigDecimal ILIMITE = isEmpty(m.get("ILIMITE")) ? null
							: new BigDecimal(String.valueOf(m.get("ILIMITE")));
					logger.debug("ILIMITE-" + ILIMITE);

					BigDecimal ICAPMAX = isEmpty(m.get("ICAPMAX")) ? null
							: new BigDecimal(String.valueOf(m.get("ICAPMAX")));
					logger.debug("ICAPMAX-" + ICAPMAX);
					String CMONEDA = isEmpty(m.get("CMONEDA")) ? null : String.valueOf(m.get("CMONEDA"));
					logger.debug("CMONEDA-" + CMONEDA);
					BigDecimal ICAPASE = isEmpty(m.get("ICAPASEG")) ? null
							: new BigDecimal(String.valueOf(m.get("ICAPASEG")));
					logger.debug("ICAPASEG-" + ICAPASE);
					String DESCRIPCION = this.getCampoTextual(request, "DESCRIPCION");
					logger.debug("DESCRIPCION-" + DESCRIPCION);
					if (isEmpty(DESCRIPCION))
						DESCRIPCION = isEmpty(m.get("DESCRIPCION")) ? null : String.valueOf(m.get("DESCRIPCION"));
					logger.debug("DESCRIPCION-" + DESCRIPCION);

					Date FINIPREST = AxisBaseService.stringToSqlDate(getCampoTextual(request, "FINIPREST"));
					logger.debug("FINIPREST-" + FINIPREST);
					if (isEmpty(FINIPREST))
						FINIPREST = isEmpty(m.get("FINIPREST")) ? null
								: AxisBaseService.stringToSqlDate(String.valueOf(m.get("FINIPREST")));

					logger.debug("FINIPREST-" + FINIPREST);
					Date FFINPREST = AxisBaseService.stringToSqlDate(getCampoTextual(request, "FFINPREST"));
					logger.debug("FFINPREST-" + FFINPREST);
					if (isEmpty(FFINPREST))
						FINIPREST = isEmpty(m.get("FFINPREST")) ? null
								: AxisBaseService.stringToSqlDate(String.valueOf(m.get("FFINPREST")));
					logger.debug("FFINPREST-" + FFINPREST);
					Map map = pac_iax_produccion.ejecutaPAC_IAX_PRODUCCION__F_SET_PRESTAMOSEG(NRIESGO,
							new BigDecimal(0), IDCUENTA, CTIPCUENTA, CTIPBAN, CTIPIMP, ISALDO, PORCEN, ILIMITE, ICAPMAX,
							CMONEDA, ICAPMAXPOL, ICAPASE, DESCRIPCION, FINIPREST, FFINPREST);

					logger.debug(map);
					logger.debug("------- resultado guardar:" + map);
					this.tratarRETURNyMENSAJES(request, map);

				}

			}
		} catch (Exception e) {
			// logger.error("Error en el servicio Axisctr004Service - mtodo m_actualiza",
			// e);

		}

	}

	public void m_riesgos_host(HttpServletRequest request, AbstractDispatchAction thisAction) {
		logger.debug("Axisctr004Service m_riesgos_host");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {
			m_guardarEstadoPantalla(request, thisAction, null);
			m_validar(request, thisAction, Constantes.SIGUIENTE);
			PAC_IAX_PRODUCCION pac_iax_produccion = new PAC_IAX_PRODUCCION(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map m = pac_iax_produccion.ejecutaPAC_IAX_PRODUCCION__F_GET_DATOS_HOST(
					(String) AbstractDispatchAction.topPila(request, "CMODO"));
			logger.debug(m);
			this.tratarRETURNyMENSAJES(request, m);
		} catch (Exception e) {
			// logger.error("Error en el servicio Axisctr004Service - mtodo m_riesgos_host",
			// e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}

	public void m_ajax_existe_persona(HttpServletRequest request) {
		logger.debug("Axissin017Service AJAX m_ajax_existe_persona");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {
			PAC_IAX_PERSONA pac_axis_persona = new PAC_IAX_PERSONA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			String NNUMIDE = getCampoTextual(request, "NNUMIDE");
			String SNIP = getCampoTextual(request, "SNIP");
			BigDecimal CSEXPER = getCampoNumerico(request, "CSEXPER");
			BigDecimal SPERREAL = getCampoNumerico(request, "SPERREAL");
			BigDecimal CAGENTE = isEmpty(getCampoNumerico(request, "CAGENTE"))
					? new BigDecimal(request.getParameter("CAGENTE"))
					: getCampoNumerico(request, "CAGENTE");
			java.sql.Date FNACIMI = AxisBaseService.stringToSqlDate(this.getCampoTextual(request, "FNACIMI"));
			Map plReturn = pac_axis_persona.ejecutaPAC_IAX_PERSONA__F_EXISTE_PERSONA(NNUMIDE, CSEXPER, FNACIMI, SNIP,
					SPERREAL, CAGENTE);
			logger.debug(plReturn);
			ajax.rellenarPlAContenedorAjax(plReturn);
			ajax.guardarContenidoFinalAContenedorAjax(plReturn);
		} catch (Exception e) {
			// logger.error("Axissin017Service m_ajax_existe_persona - Excepcion", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	public void m_ajax_get_persona(HttpServletRequest request) {
		logger.debug("Axisctr004Service AJAX m_ajax_get_persona");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {
			PAC_IAX_PERSONA pac_axis_persona = new PAC_IAX_PERSONA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			request.getSession().removeAttribute("SPERSON_ALTA");
			BigDecimal SPERSON = getCampoNumerico(request, "SPERSON");
			BigDecimal CAGENTE = isEmpty(getCampoNumerico(request, "CAGENTE"))
					? new BigDecimal(request.getParameter("CAGENTE"))
					: getCampoNumerico(request, "CAGENTE");
			String PMODE = new String("POL");
			Map map = new PAC_IAX_PERSONA((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_PERSONA__F_GET_PERSONA_AGENTE(SPERSON, CAGENTE, PMODE);
			logger.debug("---------> get PERSONA()" + map);
			Map OB_PERSONA = (Map) map.get("OBPERSONA");
			formdata.putAll(OB_PERSONA);
			ajax.rellenarPlAContenedorAjax(map);
			ajax.guardarContenidoFinalAContenedorAjax(map);
		} catch (Exception e) {
			// logger.error("Axisctr004Service m_ajax_existe_persona - Excepcion", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	public void m_volver_per(HttpServletRequest request, Axisctr004Action thisAction) {
		logger.debug("Axissin039Service m_volver_per");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {
			Map formdata_axisctr004 = (Map) AbstractDispatchAction.removeTopPila(request, "formdata_axisctr004");
			logger.debug("************************* formdata004: " + formdata_axisctr004);
			logger.debug(AbstractDispatchAction.topPila(request, "SPERSON_ALTA"));
			logger.debug(request.getSession().getAttribute("SPERSON_ALTA"));
			if (!isEmpty(AbstractDispatchAction.topPila(request, "SPERSON_ALTA")))
				formdata.put("DEC_SPERSON_ALTA", AbstractDispatchAction.topPila(request, "SPERSON_ALTA"));
			if (!isEmpty(request.getSession().getAttribute("SPERSON_ALTA")))
				formdata.put("DEC_SPERSON_ALTA", request.getSession().getAttribute("SPERSON_ALTA"));
		} catch (Exception e) {
			// logger.error("Error en el servicio Axissin017Service - mtodo m_volver_per",
			// e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	public BigDecimal m_consulta_persona(HttpServletRequest request, Axisctr004Action thisAction) {
		logger.debug("Axisctr004Service m_consulta_persona");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		BigDecimal SPERSON = this.getCampoNumerico(request, "SPERSON");
		try {
			logger.debug(SPERSON);
			thisAction.topPila(request, "formdata_axisctr004", formdata);
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
			return SPERSON;
		} catch (Exception e) {
			// logger.error("Error en el servicio Axisctr004Service - mtodo
			// m_consulta_persona", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
			return SPERSON;
		}
	}

	public void m_ajax_cargar_cobradores(HttpServletRequest request) {
		AESUtil encryptedVal = new AESUtil();
		logger.debug("Axisctr004Service m_ajax_cargar_cobradores");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();

		try {
			String CBANCAR = getCampoTextual(request, "CBANCAR");
			BigDecimal CTIPBAN = getCampoNumerico(request, "CTIPBAN");
			BigDecimal encrypt_CBANCAR = getCampoNumerico(request, "encrypt_CBANCAR");
			BigDecimal SPRODUC = (BigDecimal) AbstractDispatchAction.topPila(request, "SPRODUC");

			if (!isEmpty(encrypt_CBANCAR) && encrypt_CBANCAR.intValue() == 1) {
				CBANCAR = encryptedVal.decrypt(CBANCAR);
			}

			logger.debug("[DEBUG] [encrypt_CBANCAR] ---------------> " + encrypt_CBANCAR);
			logger.debug("[DEBUG] [CBANCAR] ---------------> " + CBANCAR);
			logger.debug("[DEBUG] [SPRODUC] ---------------> " + SPRODUC);

			Map map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES__F_GET_DESCOBRADORES_RAMO(SPRODUC, CBANCAR, CTIPBAN);
			logger.debug("ejecutaPAC_IAX_PRODUCCION__F_GET_DESCOBRADORES_RAMO()" + map);
			if (!isEmpty(map)) {
				List Cobradores = (List) ajax.rellenarPlAContenedorAjax(map);
				logger.debug("Cobradores --> " + Cobradores);

				ajax.guardarContenidoFinalAContenedorAjax(Cobradores);
			}

		} catch (Exception e) {
			// logger.error("Error en el servicio Axisctr004Service - mtodo
			// m_ajax_cargar_cobradores", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	public void m_ajax_cargar_mandatos(HttpServletRequest request) {
		AESUtil encryptedVal = new AESUtil();
		logger.debug("Axisctr004Service m_ajax_cargar_mandatos");
		AjaxContainerService ajax = new AjaxContainerService();

		try {
			String CBANCAR = getCampoTextual(request, "CBANCAR");
			BigDecimal encrypt_CBANCAR = getCampoNumerico(request, "encrypt_CBANCAR");

			if (!isEmpty(encrypt_CBANCAR) && encrypt_CBANCAR.intValue() == 1) {
				CBANCAR = encryptedVal.decrypt(CBANCAR);
			}

			logger.debug("[DEBUG] [encrypt_CBANCAR] ---------------> " + encrypt_CBANCAR);
			logger.debug("[DEBUG] [CBANCAR] ---------------> " + CBANCAR);

			Map map = new PAC_IAX_PRODUCCION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_PRODUCCION__F_GET_FOLIO(CBANCAR);
			logger.debug("ejecutaPAC_IAX_PRODUCCION__F_GET_FOLIO()" + map);

			if (!isEmpty(map)) {
				ajax.guardarContenidoFinalAContenedorAjax(map);
			}
		} catch (Exception e) {
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	public void m_ajax_cargar_tarjeta(HttpServletRequest request) {
		logger.debug("Axisctr004Service m_ajax_cargar_tarjeta");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();
		try {

			BigDecimal CTIPBAN = getCampoNumerico(request, "CTIPBAN");

			Map map = new PAC_IAX_PRODUCCION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_PRODUCCION__F_GET_TARJETA(CTIPBAN);
			HashMap mapa = new HashMap();
			HashMap cargador = new HashMap();

			if (!isEmpty(map)) {
				BigDecimal tarjeta = (BigDecimal) tratarRETURNyMENSAJES(request, map, false);
				// (BigDecimal)ajax.rellenarPlAContenedorAjax(map);

				if (!isEmpty(tarjeta)) {
					mapa.put("RESULTADO", tarjeta);
					ArrayList lista = new ArrayList();
					lista.add(0, mapa);
					map.put("valor", lista);
					// ajax.rellenarPlAContenedorAjax(map);
					ajax.guardarContenidoFinalAContenedorAjax(map);
				} else {
					ajax.rellenarPlAContenedorAjax(map);
				}

				// ajax.rellenarPlAContenedorAjax(map);
				// ajax.guardarContenidoFinalAContenedorAjax(tarjeta);
			}

		} catch (Exception e) {
			// logger.error("Error en el servicio Axisctr004Service - mtodo
			// m_ajax_cargar_tarjeta", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	public void m_selected_tipo_retr_json(HttpServletRequest request) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		AjaxContainerService ajax = new AjaxContainerService();
		try {
			PAC_IAX_LISTVALORES pac_iax_listvalores = new PAC_IAX_LISTVALORES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			HashMap miDataObject = new HashMap();

			BigDecimal CAGENTE = getCampoNumerico(request, "CAGENTE");

			HashMap opcionesDatosGestion = (HashMap) request.getSession().getAttribute("axisctr_opcionesDatosGestion");

			Map map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTTIPRETRIBU(CAGENTE);
			logger.debug(map);
			List tipoRetribu = (List) tratarRETURNyMENSAJES(request, map);
			opcionesDatosGestion.put("tipoRetribu", tipoRetribu);

			request.getSession().setAttribute("axisctr_opcionesDatosGestion",
					!isEmpty(opcionesDatosGestion) ? opcionesDatosGestion : new HashMap());

			request.getSession().setAttribute("hayCambios", "true");
			miDataObject.put("hayCambios", "true");
			miDataObject.put("tipoRetribu", tipoRetribu);
			miDataObject.put("resultado", map);
			ajax.rellenarPlAContenedorAjax(map);

			request.setAttribute(Constantes.AJAXCONTAINER, miDataObject);
		} catch (Exception e) {
			// logger.error("Error en el servicio axisctr004Service - mtodo
			// m_selected_tipo_retr_json", e);

		}
	}

	/**
	 * Guarda la pantalla
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_recargar(HttpServletRequest request, AbstractDispatchAction thisAction) {

		logger.debug("Axisctr004Service m_recargar");
		m_guardarEstadoPantalla(request, thisAction, null);
		if (VisibleTag.esComponenteVisible(request, "axisctr004", "DSP_PRESTAMOS"))
			m_guardarPrestamo(request, thisAction);

		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));

	}

	/**
	 * Guarda la pantalla
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_recargar_forpag(HttpServletRequest request, AbstractDispatchAction thisAction) {
		logger.debug("Axisctr004Service m_recargar");
		m_guardarEstadoPantalla(request, thisAction, new BigDecimal(1));
		if (VisibleTag.esComponenteVisible(request, "axisctr004", "DSP_PRESTAMOS"))
			m_guardarPrestamo(request, thisAction);

		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));

	}

}
