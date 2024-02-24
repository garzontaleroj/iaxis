package axis.service.axis;

import java.math.BigDecimal;
import java.sql.Date;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_CAMPANAS;
import axis.jdbc.PAC_IAX_INFORMES;
import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.jdbc.PAC_IAX_MNTPROD;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.control.axis.Axisage035Action;
import axis.mvc.model.ObIaxInfo;
import axis.mvc.model.TIaxInfo;
import axis.mvc.model.UsuarioBean;
import axis.util.Constantes;

public class Axisage035Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	public Axisage035Service() {
		super();
	}

	/**
	 * Carga formulario
	 * 
	 * @param request
	 * @param axisage035Action
	 */
	public void m_form(HttpServletRequest request, Axisage035Action Axisage035Action) {
		logger.debug("Axisage035Service m_form");
		PAC_IAX_CAMPANAS pac_iax_campanas = new PAC_IAX_CAMPANAS(
				(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		Map LSTVALORES = new HashMap();

		try {

			m_cargarCombos(request, Axisage035Action);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisage035Service - m�todo m_form", e);
			AbstractDispatchAction.guardarMensaje(request,
					"verbatim:<b>" + e.getClass().getName() + ":</b> " + e.getLocalizedMessage(),
					new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}

	public void m_buscar(HttpServletRequest request, Axisage035Action thisAction) throws Exception {
		logger.debug("Axisage035Service m_form");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		PAC_IAX_CAMPANAS pac_iax_campanas = new PAC_IAX_CAMPANAS(
				(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

		BigDecimal pPCEMPRES = getCampoNumerico(request, "CEMPRES");
		BigDecimal pPCRAMO = getCampoNumerico(request, "CRAMO");
		BigDecimal pPSPRODUC = getCampoNumerico(request, "SPRODUC");
		BigDecimal pPCAGENTE = getCampoNumerico(request, "CAGENTE");
		BigDecimal pPNMES = getCampoNumerico(request, "NMES");
		BigDecimal pPNANO = getCampoNumerico(request, "NANO");
		BigDecimal pPCCAMPANA = getCampoNumerico(request, "CCAMPANA");
		BigDecimal pPCSUCURS = getCampoNumerico(request, "CSUCURS");
		BigDecimal pPCTIPO = getCampoNumerico(request, "CTIPO");

		Date pPFCIERRE = stringToSqlDate(getHiddenCampoTextual(request, "FCIERRE"));
		Date pPFINICAM = stringToSqlDate(getHiddenCampoTextual(request, "FINICAM"));
		Date pPFFINCAM = stringToSqlDate(getHiddenCampoTextual(request, "FFINCAM"));
		Date pPFINIREC = stringToSqlDate(getHiddenCampoTextual(request, "FINIREC"));
		Date pPFFINREC = stringToSqlDate(getHiddenCampoTextual(request, "FFINREC"));

		try {
			Map map = pac_iax_campanas.ejecutaPAC_IAX_CAMPANAS__F_GET_CAMPA_CIERRE(pPCTIPO, pPCAGENTE, pPCCAMPANA,
					pPNMES, pPNANO, pPCRAMO, pPCEMPRES, pPSPRODUC, pPCSUCURS);
			logger.debug(map);
			formdata.put("CAMPANAS", tratarRETURNyMENSAJES(request, map));

			Map map2 = pac_iax_campanas.ejecutaPAC_IAX_CAMPANAS__F_GET_CAMPA(pPCCAMPANA);
			ArrayList PLISTPROD = (ArrayList) map2.get("PLISTPROD");
			Map datosCampana = (Map) PLISTPROD.get(0);

			Timestamp FCIERRE = (Timestamp) datosCampana.get("FCIERRE");
			Timestamp FINICAM = (Timestamp) datosCampana.get("FINICAM");
			Timestamp FFINCAM = (Timestamp) datosCampana.get("FFINCAM");
			Timestamp FINIREC = (Timestamp) datosCampana.get("FINIREC");
			Timestamp FFINREC = (Timestamp) datosCampana.get("FFINREC");

			formdata.put("FCIERRE", FCIERRE);
			formdata.put("FINICAM", FINICAM);
			formdata.put("FFINCAM", FFINCAM);
			formdata.put("FINIREC", FINIREC);
			formdata.put("FFINREC", FFINREC);
			formdata.put("haydatos", "1");

		} catch (Exception e) {
			logger.error("Error en el servicio Axisage035Service - m�todo m_buscar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}

	public void m_generar_correo(HttpServletRequest request, Axisage035Action thisAction) throws Exception {

		try {

			logger.debug("Axisage035Service m_form");
			PAC_IAX_CAMPANAS pac_iax_campanas = new PAC_IAX_CAMPANAS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);

			BigDecimal pPCTIPO = getCampoNumerico(request, "CTIPO");
			BigDecimal pPCAGENTE = getCampoNumerico(request, "CAGENTE");
			BigDecimal pPCCAMPANA = getCampoNumerico(request, "CCAMPANA");
			BigDecimal pPNMES = getCampoNumerico(request, "NMES");
			BigDecimal pPNANO = getCampoNumerico(request, "NANO");
			BigDecimal pPCRAMO = getCampoNumerico(request, "CRAMO");
			BigDecimal pPCEMPRES = getCampoNumerico(request, "CEMPRESA");
			BigDecimal pPSPRODUC = getCampoNumerico(request, "SPRODUC");
			BigDecimal pPCSUCURS = getCampoNumerico(request, "CSUCURS");

			Date pPFCIERRE = stringToSqlDate(getHiddenCampoTextual(request, "FCIERRE"));
			Date pPFINICAM = stringToSqlDate(getHiddenCampoTextual(request, "FINICAM"));
			Date pPFFINCAM = stringToSqlDate(getHiddenCampoTextual(request, "FFINCAM"));
			Date pPFINIREC = stringToSqlDate(getHiddenCampoTextual(request, "FINIREC"));
			Date pPFFINREC = stringToSqlDate(getHiddenCampoTextual(request, "FFINREC"));

			Map map1 = new PAC_IAX_CAMPANAS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_CAMPANAS__F_GENERAR_CORREO(pPCTIPO, pPCAGENTE, pPCCAMPANA, pPNMES, pPNANO, pPCRAMO,
							pPCEMPRES, pPSPRODUC, pPCSUCURS);
			logger.debug(map1);
			formdata.put("CESTADO", tratarRETURNyMENSAJES(request, map1));

		} catch (Exception e) {
			logger.error("Error en el servicio Axisage035Service - m�todo m_generar_correo", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {

			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}

	}

	private void m_cargarCombos(HttpServletRequest request, Axisage035Action thisAction) throws Exception {
		logger.debug("Axisage035Service m_cargarCombos");
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map listValores = new HashMap();
		try {
			PAC_IAX_LISTVALORES pac_axis_listValores = new PAC_IAX_LISTVALORES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			PAC_IAX_CAMPANAS pac_iax_campanas = new PAC_IAX_CAMPANAS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			/* LISTVALORES */
			Map map2 = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTEMPRESAS();
			logger.debug(map2);
			listValores.put("LSTEMPRESAS", tratarRETURNyMENSAJES(request, map2));

			// Map map3 =
			// pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTCAMPANA(null);
			// listValores.put("LSTCAMPANA", tratarRETURNyMENSAJES(request, map3));

			/* LISTVALORES */
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

			BigDecimal CIDIOMA = usuario.getCidioma();
			Map map5 = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_GET_AGENTESTIPO(new BigDecimal(2), CIDIOMA,
					null);
			listValores.put("LSAGENTESTIPO", tratarRETURNyMENSAJES(request, map5));

			Map map6 = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTAGENTES(null, null, null,
					new BigDecimal(1));
			listValores.put("LSAGENTES", tratarRETURNyMENSAJES(request, map6));

			// Carga combo meses
			Map map7 = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTMESES();
			listValores.put("LSTMESES", tratarRETURNyMENSAJES(request, map7));

		} catch (Exception e) {
			logger.error("Error en el m�todo Axisage035 cargarCombos", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			formdata.put("listValores", listValores);
		}
	}

	/**
	 * Carga la lista inicial de ramos en la pantalla.
	 * 
	 * @param request El HttpServletRequest que contiene la petici�n del cliente
	 *                web.
	 */
	private void cargaListaRamos(HttpServletRequest request) throws Exception {
		List listaRamos = dbGetCompaniRams(request);
		request.setAttribute("axisctr_listaRamos", listaRamos != null ? listaRamos : new ArrayList());
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
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		logger.debug("----Buscamos productos TIPO:" + getCampoTextual(request, "tipo") + "------------");
		Map m;
		m = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_LISTVALORES__F_GET_PRODUCTOSCOMPANIA(null, getCampoNumerico(request, "CRAMO"));

		logger.debug(m);
		List productos = (List) tratarRETURNyMENSAJES(request, m, false);
		formdata.put("productos", ((productos == null) ? new ArrayList() : productos));
		return productos;
	}

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

	private List dbGetCompaniRams(HttpServletRequest request) throws Exception {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		String tipo = this.getCampoTextual(request, "tipo");
		BigDecimal pCOMPANI = null; // this.getCampoNumerico(request, "CEMPRES");
		// Carga de ramos de la BD
		Map map;
		if ((pCOMPANI != null) && (pCOMPANI.intValue() > 0)) {
			map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES__F_GET_RAMOSCOMPANIA(pCOMPANI);
		} else {
			map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES__F_GET_RAMOS(tipo, null);
		}
		List listaRamos = (List) tratarRETURNyMENSAJES(request, map, false);

		return listaRamos;
	}

	public void m_ajax_busqueda_productos(HttpServletRequest request) {
		logger.debug("Axissin019Service m_ajax_busqueda_productos");
		AjaxContainerService ajax = new AjaxContainerService();
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {
			if ((!isEmpty(this.getCampoNumerico(request, "CRAMO")))) {
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

	public void m_generar_list(HttpServletRequest request, Axisage035Action thisAction) {
		logger.debug("Axisage035Service m_generar_list");
		Map map = new HashMap();
		Map mapINFORME = new HashMap();

		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);

		String CMAP = "reporteCampana";
		BigDecimal pPCEMPRES = getCampoNumerico(request, "CEMPRES");
		String CEXPORT = "XLS";
		Enumeration parameters = request.getParameterNames();
		String p = null;
		HashMap<String, String> PARAMETROS__ = new HashMap();
		HashMap<String, String> TPARAMETROS__ = new HashMap();
		BigDecimal batch = new BigDecimal(0);
		BigDecimal CIDIOMA = usuario.getCidioma();
		String CEMAIL = null;
		BigDecimal pPCCAMPANA = getCampoNumerico(request, "CCAMPANA");
		BigDecimal pPCAGENTE = getCampoNumerico(request, "CAGENTE");

		if (pPCCAMPANA != null) {
			PARAMETROS__.put("PCCAMPANA", "" + pPCCAMPANA);
			TPARAMETROS__.put("TPCCAMPANA", "1");
		}

		if (pPCAGENTE != null) {
			PARAMETROS__.put("PCAGENTE", "" + pPCAGENTE);
			TPARAMETROS__.put("TPCAGENTE", "1");
		}
		// BigDecimal pPCTIPO = getCampoNumerico(request, "CEXCEPCION1");
		try {

			TIaxInfo params = this.generarT_IAX_Info(request, usuario, PARAMETROS__, TPARAMETROS__);
			mapINFORME = new PAC_IAX_INFORMES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_INFORMES__F_EJECUTA_INFORME(CMAP, pPCEMPRES, CEXPORT, params, CIDIOMA, batch,
							CEMAIL, new BigDecimal(0));
			logger.debug("Resultado accion ejecutar mapINFORME: " + mapINFORME);
			map.put("LIST_FICHEROS", mapINFORME);
			logger.debug("map:" + map);
			request.setAttribute(Constantes.AJAXCONTAINER, map);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisage035Service - m�todo m_generar_list", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	private TIaxInfo generarT_IAX_Info(HttpServletRequest request, UsuarioBean usuario, HashMap PARAMETROS__,
			HashMap TPARAMETROS__) throws Exception {
		logger.debug("******** GENERART_IAX_INFO ****************");
		Object[] keyArray = PARAMETROS__.keySet().toArray();

		ArrayList tinfo = null;

		String USERNAME = ((java.sql.Connection) request.getAttribute(Constantes.DB01CONN)).getMetaData().getUserName();

		ObIaxInfo[] paramsList = new ObIaxInfo[PARAMETROS__.keySet().toArray().length];
		// primero, llenar los parametros
		{
			ObIaxInfo paramObj = null;
			for (int i = 0; i < keyArray.length; i++) {
				if (PARAMETROS__.get(keyArray[i].toString()).toString().length() > 0) {
					String valorParametro = "T" + keyArray[i].toString();
					String tipoParametro = TPARAMETROS__.get(valorParametro).toString();
					paramObj = new ObIaxInfo(keyArray[i].toString(),
							PARAMETROS__.get(keyArray[i].toString()).toString(), tipoParametro, BigDecimal.ONE);
					paramObj._SQL_NAME = UsuarioBean.fixOwner(USERNAME, "OB_IAX_INFO");
					paramsList[i] = paramObj;
				}

			}
		}
		// con la lista de parametros llenar el ojeto table
		TIaxInfo params = new TIaxInfo(paramsList);
		params._SQL_NAME = UsuarioBean.fixOwner(USERNAME, "T_IAX_INFO");
		logger.debug("*********** VA A DEVOLVER LOS PARAMETROS ***************");
		return params;
	}
}