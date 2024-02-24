//Revision:# t3zkJRv1AGufQSWNrOSxXw== #
package axis.service.axis;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_CFG;
import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.jdbc.PAC_IAX_LISTVALORES_SIN;
import axis.jdbc.PAC_IAX_MNTPREGUNPROD;
import axis.jdbc.PAC_IAX_OPERATIVA_FINV;
import axis.jdbc.PAC_IAX_PARAM;
import axis.jdbc.PAC_IAX_PERSONA;
import axis.jdbc.PAC_IAX_UTILES;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.control.axis.Axislist002Action;
import axis.mvc.model.UsuarioBean;
import axis.util.Constantes;

/**
 * NOMBRE: Axislist002Service.java Fecha: 04/01/2011 PROP�SITO (descripci�n
 * pantalla): Ejemplo : Pantalla de Listados generica
 * 
 * REVISIONES: Ver Fecha Autor Descripci�n --------- ---------- ---------------
 * ------------------------------------ 1.0 04/01/2011 XPL 1. Creaci�n de la
 * pantalla. bug 17179: AGA003 - Modificaci�n de listados de administraci�n
 * (filtro por fmovdia)
 * 
 */
public class Axislist002Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE INICIALIZACION
	 *******************************************/
	/*********************************************************************************************************************/

	/**
	 * M�todo que se llama al inicio de este flujo. Puede servirnos para inicializar
	 * variables.
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_init(HttpServletRequest request, Axislist002Action thisAction) {
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {

		} catch (Exception e) {
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}

	}

	/**
	 * 
	 * @param request
	 */
	@SuppressWarnings("all")
	public void m_form(HttpServletRequest request, Axislist002Action thisAction) {
		logger.debug("Axislist002Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		// Metode que ens formatejar� tots els imports, Sistema europeo o americ�
		// En el cas que no hi hagi cap import per pantalla millor treure aquesta crida
		this.formattingNumericValues(request);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {
			formdata.put("CIDIOMA", usuario.getCidioma());
			BigDecimal CEMPRES = isEmpty((String) AbstractDispatchAction.topPila(request, "CEMPRES")) ? null
					: new BigDecimal((String) AbstractDispatchAction.topPila(request, "CEMPRES"));
			// this.getHiddenCampoNumerico(request, "CEMPRES");
			BigDecimal SPRODUC = isEmpty((String) AbstractDispatchAction.topPila(request, "SPRODUC")) ? null
					: new BigDecimal((String) AbstractDispatchAction.topPila(request, "SPRODUC"));
			// this.getHiddenCampoNumerico(request, "SPRODUC");

			String CMODO = (String) AbstractDispatchAction.topPila(request, "CMODO");

			// INI IAXI BUG 7632 AABG: Se precargar el tipo de Reaseguro
			String VTIPREAS = getCampoTextual(request, "VTIPREAS");
			if (VTIPREAS != null && !isEmpty(VTIPREAS))
				formdata.put("VTIPREAS", VTIPREAS);
			// FIN IAXI BUG 7632 AABG: Se precargar el tipo de Reaseguro

			Map map = new PAC_IAX_CFG((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_CFG__F_GET_INFORMES(CEMPRES, whoami(this).toUpperCase(), CMODO, SPRODUC);

			logger.debug(map);
			if (isEmpty(CEMPRES))
				formdata.put("CEMPRES", usuario.getCempres());

			if (((BigDecimal) tratarRETURNyMENSAJES(request, map, false)).intValue() == 0)
				request.setAttribute("LISTADOS", map.get("PCURCONFIGSINF"));

			Map mapComp = new PAC_IAX_UTILES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_UTILES__F_GET_USER_COMP(usuario.getUsuario());
			List listaCOMPANI = (List) tratarRETURNyMENSAJES(request, mapComp, false);
			if (!isEmpty(listaCOMPANI) && listaCOMPANI.size() == 1) {
				BigDecimal USU_CCOMPANI = (BigDecimal) ((HashMap) listaCOMPANI.get(0)).get("CCOMPANI");
				formdata.put("CCOMPANI", USU_CCOMPANI);
				formdata.put("USU_CCOMPANI", (USU_CCOMPANI != null) ? 999 : null);
			}

			this.m_cargarCombos(request, thisAction);

		} catch (Exception e) {
			logger.error("Error en el servicio Axislist002Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));

		}
	}

	/**
	 * Metodo que cargar� la lista de valores de la pantalla. XPL 040111 17179:
	 * AGA003 - Modificaci�n de listados de administraci�n (filtro por fmovdia)
	 * 
	 * @param request
	 */
	private void m_cargarCombos(HttpServletRequest request, Axislist002Action thisAction) {
		logger.debug("Axislist002Service m_cargarCombos");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		HashMap listValores = new HashMap();
		try {

			Map map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTEMPRESAS();
			logger.debug("------- Empresas:" + map);
			listValores.put("EMPRESAS", (List) tratarRETURNyMENSAJES(request, map, false));

			map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(1));
			logger.debug(map);
			listValores.put("ESTRECS", tratarRETURNyMENSAJES(request, map, false));

			map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(8));
			logger.debug(map);
			listValores.put("TIPRECS", tratarRETURNyMENSAJES(request, map, false));

			map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(61));
			logger.debug(map);
			listValores.put("ESTADOS", tratarRETURNyMENSAJES(request, map, false));

			// BUG 22376 INI
			map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(800124));
			logger.debug(map);
			listValores.put("TIPCONTR", tratarRETURNyMENSAJES(request, map, false));

			map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(800123));
			logger.debug(map);
			listValores.put("TIPCUENTA", tratarRETURNyMENSAJES(request, map, false));

			map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES__F_GET_CIAPRODUCTOS();
			logger.debug(map);
			listValores.put("REASEG_BROK", (List) tratarRETURNyMENSAJES(request, map, false));

			// bug 0026430
			map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES__F_GET_COMPANIAS(new BigDecimal(0), new BigDecimal(2));
			logger.debug(map);
			listValores.put("lstBROKER", (List) tratarRETURNyMENSAJES(request, map, false));

			HashMap orden;
			Map mapa_monedas = null;
			try {
				PAC_IAX_PARAM param = new PAC_IAX_PARAM(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
				orden = param.ejecutaPAC_IAX_PARAM__F_PAREMPRESA_N("LSTMONEDA", usuario.getCempres());

				if (orden.get("RETURN") != null && orden.get("RETURN").equals(BigDecimal.ONE)) {
					mapa_monedas = new PAC_IAX_LISTVALORES(
							(java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
							.ejecutaPAC_IAX_LISTVALORES__F_GET_MONEDAS_COND("FILTRO_MONEDAS");
				} else {
					mapa_monedas = new PAC_IAX_OPERATIVA_FINV(
							(java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
							.ejecutaPAC_IAX_OPERATIVA_FINV__F_MONEDAS();
				}

			} catch (Exception e) {
				e.toString();
			}
			List listaMonedas = (List) tratarRETURNyMENSAJES(request, mapa_monedas, false);
			formdata.put("listaMonedas", listaMonedas);
			logger.debug(mapa_monedas);
			listaMonedas = null;

			map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(800125));
			logger.debug(map);
			listValores.put("TIPOLISTADO", tratarRETURNyMENSAJES(request, map, false)); // CTIPOLIST

			map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(800126));
			logger.debug(map);
			listValores.put("TIPOLIST", tratarRETURNyMENSAJES(request, map, false)); // CTIPOLIST

			// Bug 26898 - APD - 13/05/2013
			BigDecimal CEMPRES = this.getCampoNumerico(request, "CEMPRES");
			map = new PAC_IAX_PARAM((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_PARAM__F_PAREMPRESA_N("CTIPAGE_LISTADOS", CEMPRES);
			BigDecimal ctipage_listado = (BigDecimal) map.get("RETURN");

			if (ctipage_listado == null)
				ctipage_listado = new BigDecimal(2);

			// map=new
			// PAC_IAX_LISTVALORES((java.sql.Connection)request.getAttribute(Constantes.DB01CONN)).ejecutaPAC_IAX_LISTVALORES__F_GET_AGENTESTIPO(new
			// BigDecimal("2"), usuario.getCidioma(), null);
			map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES__F_GET_AGENTESTIPO(ctipage_listado, usuario.getCidioma(), null);
			// fin Bug 26898 - APD - 13/05/2013

			logger.debug(map);
			listValores.put("LSTASUC", this.tratarRETURNyMENSAJES(request, map, false)); // sucursal

			// BUG 22376 FIN

			map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(1005));
			logger.debug(map);
			listValores.put("MODALIS", tratarRETURNyMENSAJES(request, map, false));

			// INI IAXI BUG 7632 AABG: Se carga combo para Tipos de Reaseguro
			map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(8002035));
			logger.debug(map);
			listValores.put("TIPREASEGLIS", tratarRETURNyMENSAJES(request, map, false));
			// FIN IAXI BUG 7632 AABG: Se carga combo para Tipos de Reaseguro

			map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(3));
			logger.debug(map);
			listValores.put("TIPSINS", tratarRETURNyMENSAJES(request, map, false));

			map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(106));
			logger.debug(map);
			listValores.put("TIPREAS", tratarRETURNyMENSAJES(request, map, false));

			map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(106));
			logger.debug(map);
			listValores.put("TIPREAS", tratarRETURNyMENSAJES(request, map, false));

			BigDecimal CPREVIO = this.getCampoNumerico(request, "CPREVIO");
			BigDecimal CCOMPANI = this.getCampoNumerico(request, "CCOMPANI");
			BigDecimal CAGRPRO = this.getCampoNumerico(request, "CAGRPRO");
			BigDecimal CRAMO = this.getCampoNumerico(request, "CRAMO");
			// BigDecimal CEMPRES=this.getCampoNumerico(request, "CEMPRES"); //Bug 26898 -
			// APD - 13/05/2013
			BigDecimal CCAUSIN = this.getCampoNumerico(request, "CCAUSIN");

			map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES__F_GET_CIAPRODUCTOS();
			logger.debug(map);
			listValores.put("lstCIAS", (List) tratarRETURNyMENSAJES(request, map, false));

			map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES__F_GET_COMPANIAS(new BigDecimal(0), new BigDecimal(4));
			logger.debug(map);
			listValores.put("lstCIASLCOL", (List) tratarRETURNyMENSAJES(request, map, false));
			map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTDESCCOBRADORES(CEMPRES);
			logger.debug(map);
			listValores.put("lstCOBBAN", (List) tratarRETURNyMENSAJES(request, map, false));

			/*
			 * if (this.isEmpty(CCOMPANI)) { map = new
			 * PAC_IAX_LISTVALORES((java.sql.Connection)request.getAttribute(Constantes.
			 * DB01CONN)).ejecutaPAC_IAX_LISTVALORES__F_GET_LSTAGRUPPROD();
			 * logger.debug("------- Agrupaciones:" + map); listValores.put("AGRUPACIONES",
			 * (List)tratarRETURNyMENSAJES(request, map, false));
			 * 
			 * } else {
			 */

			map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES__F_GET_AGRUPCOMPANIA(CCOMPANI);
			logger.debug("------- Agrupaciones:" + map);
			listValores.put("AGRUPACIONES", (List) tratarRETURNyMENSAJES(request, map, false));
			// }

			if (this.isEmpty(CAGRPRO) && this.isEmpty(CCOMPANI)) {
				List listaRamos = this.cargaListaRamos(request);
				listValores.put("ramos", listaRamos);
				if (!isEmpty(listaRamos) && listaRamos.size() == 1) {
					CRAMO = (BigDecimal) ((HashMap) listaRamos.get(0)).get("CRAMO");
					formdata.put("CRAMO", CRAMO);
				}

			} else {
				map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_LISTVALORES__F_GET_RAMOSCOMPAGRUPA(CAGRPRO, CCOMPANI);
				logger.debug(map);
				List listaRamos = (List) tratarRETURNyMENSAJES(request, map, false);
				if (!isEmpty(listaRamos) && listaRamos.size() == 1) {
					CRAMO = (BigDecimal) ((HashMap) listaRamos.get(0)).get("CRAMO");
					formdata.put("CRAMO", CRAMO);

				}
				listValores.put("ramos", listaRamos);
			}

			if (this.isEmpty(CRAMO)) {
				listValores.put("productos", this.dbGetProductos(request, usuario));
			} else {
				if (this.isEmpty(CCOMPANI))
					listValores.put("productos", this.dbGetRamProductos(request));
				else {
					map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
							.ejecutaPAC_IAX_LISTVALORES__F_GET_PRODUCTOSCOMPANIA(CCOMPANI, CRAMO);
					logger.debug(map);
					listValores.put("productos", (List) tratarRETURNyMENSAJES(request, map, false));
				}

			}

			map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(6));
			logger.debug("---- estados:" + map);
			listValores.put("estadosSiniestro", tratarRETURNyMENSAJES(request, map, false));

			// BUG 21838 - 20120530 -JLTS Desde aqui
			map = new PAC_IAX_LISTVALORES_SIN((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES_SIN__F_GET_CUNITRA(CEMPRES);
			logger.debug("---- UnidadTramitadores:" + map);
			listValores.put("unidadTramitadores", tratarRETURNyMENSAJES(request, map, false));

			map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTUSUARIOSAGENDA();
			logger.debug("---- usuarios:" + map);
			listValores.put("usuarios", tratarRETURNyMENSAJES(request, map, false));

			map = new PAC_IAX_LISTVALORES_SIN((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES_SIN__F_GET_LSTCASSIN_CODMOTCAU();
			logger.debug("---- causasSiniestros:" + map);
			listValores.put("causasSiniestros", tratarRETURNyMENSAJES(request, map, false));

			// ETM bug 24776 ini
			if (!this.isEmpty(CCAUSIN)) {
				map = new PAC_IAX_LISTVALORES_SIN((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_LISTVALORES_SIN__F_GET_LSTMOTSIN_CODMOTCAU(CCAUSIN);
				logger.debug("---- motivosSiniestros:" + map);
				listValores.put("motivosSiniestros", tratarRETURNyMENSAJES(request, map, false));
			}
			// ETM bug 24776 f

			map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(108));
			logger.debug("---- asistencia:" + map);
			listValores.put("asistencia", tratarRETURNyMENSAJES(request, map, false));

			map = new PAC_IAX_LISTVALORES_SIN((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES_SIN__F_GET_LSTPROFESIONALES();
			logger.debug("---- profesionales:" + map);
			listValores.put("profesionales", tratarRETURNyMENSAJES(request, map, false));

			map = new PAC_IAX_PARAM((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_PARAM__F_PARINSTALACION_NN("PAIS_DEF");
			BigDecimal pais = (BigDecimal) map.get("RETURN");

			map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES__F_GET_CONSULTA("LISTA_PROVINCIA", pais.toString() + "|");
			logger.debug("---- provincias:" + map);
			listValores.put("provincias", tratarRETURNyMENSAJES(request, map, false));

			// BUG 21838 - 20120530 -JLTS Hasta aqui

			map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(54));
			logger.debug(map);

			ArrayList meses = new ArrayList();
			meses = (ArrayList) tratarRETURNyMENSAJES(request, map, false);

			if (!meses.isEmpty()) {
				for (int i = 0; i < meses.size(); i++) {
					BigDecimal mes = new BigDecimal(((Map) meses.get(i)).get("CATRIBU").toString());
					if (mes.intValue() < 10) {
						String m = "0" + mes.toString();
						HashMap x = new HashMap();
						x.put("CATRIBU", m);
						x.put("TATRIBU", ((Map) meses.get(i)).get("TATRIBU"));
						meses.set(i, x);
					}
				}
			}
			listValores.put("MESES", meses);

			map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(3));
			logger.debug("---- estados:" + map);
			listValores.put("estadosPago", tratarRETURNyMENSAJES(request, map, false));

			map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(10));
			logger.debug("---- TIPOS DESTINATARIO:" + map);
			listValores.put("LSTCTIPDES", tratarRETURNyMENSAJES(request, map, false));

			String DESCPREG4010 = this.getCampoTextual(request, "DESCPREG4010");
			formdata.put("DESCPREG4010", DESCPREG4010);
			PAC_IAX_MNTPREGUNPROD pac_iax_mntpregunprod = new PAC_IAX_MNTPREGUNPROD(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			if (this.isEmpty(DESCPREG4010)) {
				map = pac_iax_mntpregunprod.ejecutaPAC_IAX_MNTPREGUNPROD__F_GET_DESCPREGUN(new BigDecimal(4010), "PROD",
						new BigDecimal(0), new BigDecimal(0), new BigDecimal(0), usuario.getCidioma());
				formdata.put("DESCPREG4010", map.get("PDESCPREG"));
			}

			BigDecimal PREG4010 = this.getCampoNumerico(request, "PREG4010");
			formdata.put("PREG4010", PREG4010);
			map = pac_iax_mntpregunprod.ejecutaPAC_IAX_MNTPREGUNPROD__F_GET_LISTRESPUE(new BigDecimal(4010),
					new BigDecimal(1), usuario.getCidioma());
			listValores.put("LSTPREG4010", tratarRETURNyMENSAJES(request, map, false));

			String DESCPREG9108 = this.getCampoTextual(request, "DESCPREG9108");
			formdata.put("DESCPREG9108", DESCPREG9108);
			if (this.isEmpty(DESCPREG9108)) {
				map = pac_iax_mntpregunprod.ejecutaPAC_IAX_MNTPREGUNPROD__F_GET_DESCPREGUN(new BigDecimal(9108), "PROD",
						new BigDecimal(0), new BigDecimal(0), new BigDecimal(0), usuario.getCidioma());
				formdata.put("DESCPREG9108", map.get("PDESCPREG"));
			}

			BigDecimal PREG9108 = this.getCampoNumerico(request, "PREG9108");
			formdata.put("PREG9108", PREG9108);
			map = pac_iax_mntpregunprod.ejecutaPAC_IAX_MNTPREGUNPROD__F_GET_LISTRESPUE(new BigDecimal(9108),
					new BigDecimal(2), usuario.getCidioma());
			List<HashMap> listrespreg9108 = (List) tratarRETURNyMENSAJES(request, map, false);
			// la funci�n anterior devuelve los valores como Double hay que transformarlos a
			// int, sino dar� error al pasarlo al informe.
			if (!this.isEmpty(listrespreg9108)) {
				for (HashMap x : listrespreg9108) {
					if (x.get("CATRIBU") instanceof Double)
						x.put("CATRIBU", ((Double) x.get("CATRIBU")).intValue());
					else if (x.get("CATRIBU") instanceof Float)
						x.put("CATRIBU", ((Float) x.get("CATRIBU")).intValue());
				}
			}
			listValores.put("LSTPREG9108", listrespreg9108);

			BigDecimal CSITUAC = this.getCampoNumerico(request, "CSITUAC");
			formdata.put("CSITUAC", CSITUAC);
			PAC_IAX_LISTVALORES pac_iax_listvalores = new PAC_IAX_LISTVALORES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal("61"));
			listValores.put("LSTCSITUAC", tratarRETURNyMENSAJES(request, map, false));
			logger.debug(
					"******************************------------------------------------------------******************************");
			logger.debug("RECUPERO NOUS VALORS");
			Map map6 = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal("8001111"));
			List lcgescar = (List) tratarRETURNyMENSAJES(request, map6);
			listValores.put("lcgescar", lcgescar);
			logger.debug(lcgescar);
			logger.debug(
					"******************************------------------------------------------------******************************");

			formdata.put("listValores", listValores);

		} catch (Exception e) {
			logger.error("Error en el servicio Axislist002Service - m�todo m_cargarCombos", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
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
		logger.debug("----Buscamos productos TIPO:" + getCampoTextual(request, "tipo") + "------------");

		Map m = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_LISTVALORES__F_GET_RAMPRODUCTOS(getCampoTextual(request, "tipo"),
						getCampoNumerico(request, "CRAMO"), new BigDecimal(0));
		logger.debug(m);
		List productos = (List) tratarRETURNyMENSAJES(request, m, false);

		return productos;
	}

	private List cargaListaRamos(HttpServletRequest request) throws Exception {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		String tipo = this.getCampoTextual(request, "tipo");
		// Carga de ramos de la BD

		Map map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_LISTVALORES__F_GET_RAMOS(tipo, null);
		List listaRamos = (List) tratarRETURNyMENSAJES(request, map, false);
		return listaRamos;
	}
	// etm ini 24776

	private List cargaListaMotivos(HttpServletRequest request) throws Exception {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		BigDecimal CCAUSIN = this.getCampoNumerico(request, "CCAUSIN");
		// Carga de ramos de la BD
		Map map = new HashMap();
		if (!this.isEmpty(CCAUSIN)) {
			map = new PAC_IAX_LISTVALORES_SIN((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES_SIN__F_GET_LSTMOTSIN_CODMOTCAU(CCAUSIN);
			logger.debug("---- motivosSiniestros:" + map);
		}
		List listaMotivos = (List) tratarRETURNyMENSAJES(request, map, false);
		return listaMotivos;
	}
	// etm fin 24776
	// BUG 21838 - 20120530 -JLTS Desde aqui

	private List cargaListaUnidtrami(HttpServletRequest request) throws Exception {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		String tipo = this.getCampoTextual(request, "tipo");
		// Carga las Unidades de Tramitacion de la BD

		Map map = new PAC_IAX_LISTVALORES_SIN((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_LISTVALORES_SIN__F_GET_CUNITRA(getCampoNumerico(request, "CEMPRES"));
		List listaUnidtrami = (List) tratarRETURNyMENSAJES(request, map, false);
		return listaUnidtrami;
	}

	private List cargaListaPoblaciones(HttpServletRequest request) throws Exception {
		/*
		 * UsuarioBean usuario =
		 * (UsuarioBean)request.getSession().getAttribute(Constantes.USUARIO); String
		 * valor = this.getCampoTextual(request, "valor");
		 */
		// Cargar los datos de la Poblaciones (Ciudades)

		Map map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_LISTVALORES__F_GET_CONSULTA("LISTA_POBLACION", String.format("%1|||", "CPROVIN"));
		List listaUnidpoblac = (List) tratarRETURNyMENSAJES(request, map, false);
		return listaUnidpoblac;
	}

	// BUG 21838 - 20120530 -JLTS Hasta aqui

	@SuppressWarnings("all")
	public void m_ejecutar(HttpServletRequest request, Axislist002Action thisAction) {
		logger.debug("Axislist002Service m_ejecutar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		// Metode que ens formatejar� tots els imports, Sistema europeo o americ�
		// En el cas que no hi hagi cap import per pantalla millor treure aquesta crida
		this.formattingNumericValues(request);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {
			// Parametro que indica si se ejecuta en modo BATCH (1/0)
			String cBatch = this.getCampoTextual(request, "CBATCH");

			BigDecimal CEMPRES = isEmpty((String) AbstractDispatchAction.topPila(request, "CEMPRES")) ? null
					: new BigDecimal((String) AbstractDispatchAction.topPila(request, "CEMPRES"));
			// this.getHiddenCampoNumerico(request, "CEMPRES");
			BigDecimal SPRODUC = isEmpty((String) AbstractDispatchAction.topPila(request, "SPRODUC")) ? null
					: new BigDecimal((String) AbstractDispatchAction.topPila(request, "SPRODUC"));
			// this.getHiddenCampoNumerico(request, "SPRODUC");
			String CLISTADO = this.getHiddenCampoTextual(request, "CLISTADO");
			String CMODO = (String) AbstractDispatchAction.topPila(request, "CMODO");

			String PPARAMS = this.getHiddenCampoTextual(request, "PPARAMS");
			if (PPARAMS.toUpperCase().indexOf("CEMPRES") == -1) {
				PPARAMS += "CEMPRES:" + usuario.getCempres() + "|";
			}
			if (isEmpty(CEMPRES))
				CEMPRES = usuario.getCempres();

			PAC_IAX_CFG paxIaxCfg = new PAC_IAX_CFG((java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			if ("1".equals(cBatch)) {
				// EJECUCI�N EN MODO BATCH
				Map map = paxIaxCfg.ejecutaPAC_IAX_CFG__F_EJECUTAR_INFORME_BATCH(CEMPRES, whoami(this).toUpperCase(),
						CMODO, SPRODUC, "|" + CLISTADO + "|", PPARAMS, null);

				logger.debug(map);

				if (((BigDecimal) tratarRETURNyMENSAJES(request, map)).intValue() == 0) {

					formdata.put("LIST_FICHEROS", map.get("VTIMP"));
				}
			} else {
				Map map = paxIaxCfg.ejecutaPAC_IAX_CFG__F_EJECUTAR_INFORME(CEMPRES, whoami(this).toUpperCase(), CMODO,
						SPRODUC, "|" + CLISTADO + "|", PPARAMS);

				logger.debug(map);

				if (((BigDecimal) tratarRETURNyMENSAJES(request, map)).intValue() == 0) {

					formdata.put("LIST_FICHEROS", map.get("VTIMP"));
				}
			}
		} catch (Exception e) {
			logger.error("Error en el servicio Axislist002Service - m�todo m_ejecutar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
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

		request.setAttribute("axisctr_agente", agente);

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
		logger.debug("Axisadm047Service m_ajax_busqueda_productos");
		AjaxContainerService ajax = new AjaxContainerService();

		try {
			String CAGENTE = getCampoTextual(request, "CAGENTE");
			Map m = (Map) this.ActualizaAgente(request, CAGENTE);
			ajax.rellenarPlAContenedorAjax(m);
			ajax.guardarContenidoFinalAContenedorAjax(m);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr001Service - m�todo m_ajax_actualizar_agente", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	public void m_ajax_actualizar_persona(HttpServletRequest request, Axislist002Action thisAction) {
		// joan
		logger.debug("Axisctr038Service m_ajax_actualizar_persona");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		AjaxContainerService ajax = new AjaxContainerService();

		try {
			BigDecimal SPERSON = this.getCampoNumerico(request, "SPERSON"); // (BigDecimal)
																			// AbstractDispatchAction.topPila(request,
																			// "SSEGURO");
			BigDecimal CAGENTE = this.getCampoNumerico(request, "CAGENTE1"); // (BigDecimal)
																				// AbstractDispatchAction.topPila(request,
																				// "SSEGURO");
			Map map = new PAC_IAX_PERSONA((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_PERSONA__F_GET_PERSONA(SPERSON, CAGENTE);
			logger.debug("get PERSONA()" + map);
			BigDecimal RETURN = (BigDecimal) tratarRETURNyMENSAJES(request, map);
			if (!isEmpty(map) && new BigDecimal(0).equals(RETURN)) {
				// ajax.rellenarPlAContenedorAjax((Map)map.get("OBPERSONA"));
				Map OB_PERSONA = (Map) map.get("OBPERSONA");
				logger.debug(OB_PERSONA);
				ajax.rellenarPlAContenedorAjax(map);

				ajax.guardarContenidoFinalAContenedorAjax(OB_PERSONA);
			}

		} catch (Exception e) {
			logger.error("Axisctr038Service m_ajax_actualizar_persona - Excepcion", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
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
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {
			String CODI = getCampoTextual(request, "CODI");
			String CONDICION = this.getCampoTextual(request, "CONDICION");
			HashMap map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTAGENTES_COND(null, null, new BigDecimal(CODI),
							new BigDecimal(1), CONDICION);
			logger.debug(map);
			List listaAgentes = (List) tratarRETURNyMENSAJES(request, map, false);
			if (!isEmpty(listaAgentes)) {
				Map agente = getObjetoDeLista(listaAgentes, CODI, "CODI");
				if (!isEmpty(agente)) {
					ajax.guardarContenidoFinalAContenedorAjax(agente);
				}
				listaAgentes = null;
			}
		} catch (Exception e) {
			logger.error("Error", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	/**
	 * Dado un agente seleccionado en el modal de selecci�n de agentes (axisctr014),
	 * �ste m�todo recibe el atributo CODI del agente y lo pone en el par�metro de
	 * sesi�n axisctr_agente.
	 * 
	 * @param request El HttpServletRequest que contiene la petici�n del cliente
	 *                web.
	 */
	public void m_ajax_ver_personaagente(HttpServletRequest request) {
		AjaxContainerService ajax = new AjaxContainerService();
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {
			String CODI = getCampoTextual(request, "CODI");
			String CONDICION = this.getCampoTextual(request, "CONDICION");
			HashMap map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTAGENTES_COND(null, null, new BigDecimal(CODI),
							new BigDecimal(1), CONDICION);
			logger.debug(map);
			List listaAgentes = (List) tratarRETURNyMENSAJES(request, map, false);
			if (!isEmpty(listaAgentes)) {
				Map agente = getObjetoDeLista(listaAgentes, CODI, "CODI");
				if (!isEmpty(agente)) {
					ajax.guardarContenidoFinalAContenedorAjax(agente);
				}
				listaAgentes = null;
			}
		} catch (Exception e) {
			logger.error("Error", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	/**
	 * Realiza una b�squeda de productos por Ajax.
	 * 
	 * @see buscaProductos
	 * @param request El HttpServletRequest que contiene la petici�n del cliente
	 *                web.
	 */
	public void m_ajax_cargaragrupaciones(HttpServletRequest request) {
		logger.debug("Axislist002Service m_ajax_cargaragrupaciones");
		AjaxContainerService ajax = new AjaxContainerService();
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {

			BigDecimal CPREVIO = this.getCampoNumerico(request, "CPREVIO");
			BigDecimal CCOMPANI = this.getCampoNumerico(request, "CCOMPANI");
			BigDecimal CAGRPRO = this.getCampoNumerico(request, "CAGRPRO");
			BigDecimal CRAMO = this.getCampoNumerico(request, "CRAMO");
			BigDecimal CEMPRES = this.getCampoNumerico(request, "CEMPRES");

			/*
			 * if (this.isEmpty(CCOMPANI)) { Map map = new
			 * PAC_IAX_LISTVALORES((java.sql.Connection)request.getAttribute(Constantes.
			 * DB01CONN)).ejecutaPAC_IAX_LISTVALORES__F_GET_LSTAGRUPPROD();
			 * logger.debug("------- Agrupaciones:" + map);
			 * ajax.guardarContenidoFinalAContenedorAjax((List)tratarRETURNyMENSAJES(
			 * request, map, false));
			 * 
			 * } else {
			 */
			Map map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES__F_GET_AGRUPCOMPANIA(CCOMPANI);
			logger.debug("------- Agrupaciones:" + map);
			ajax.guardarContenidoFinalAContenedorAjax((List) tratarRETURNyMENSAJES(request, map, false));
			// }

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr001Service - m�todo m_ajax_cargaragrupaciones", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());

		}
	}

	/**
	 * Realiza una b�squeda de productos por Ajax.
	 * 
	 * @see buscaProductos
	 * @param request El HttpServletRequest que contiene la petici�n del cliente
	 *                web.
	 */
	public void m_ajax_cargarRamos(HttpServletRequest request) {
		logger.debug("Axislist002Service m_ajax_cargarRamos");
		AjaxContainerService ajax = new AjaxContainerService();
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {

			BigDecimal CPREVIO = this.getCampoNumerico(request, "CPREVIO");
			BigDecimal CCOMPANI = this.getCampoNumerico(request, "CCOMPANI");
			BigDecimal CAGRPRO = this.getCampoNumerico(request, "CAGRPRO");
			BigDecimal CRAMO = this.getCampoNumerico(request, "CRAMO");
			BigDecimal CEMPRES = this.getCampoNumerico(request, "CEMPRES");

			if (this.isEmpty(CAGRPRO) && this.isEmpty(CCOMPANI)) {
				ajax.guardarContenidoFinalAContenedorAjax(this.cargaListaRamos(request));
			} else {
				Map map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_LISTVALORES__F_GET_RAMOSCOMPAGRUPA(CAGRPRO, CCOMPANI);
				logger.debug(map);
				ajax.guardarContenidoFinalAContenedorAjax((List) tratarRETURNyMENSAJES(request, map, false));
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axislist002Service - m�todo m_ajax_cargarRamos", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());

		}
	}

	/**
	 * Realiza una b�squeda de productos por Ajax.
	 * 
	 * @see buscaProductos
	 * @param request El HttpServletRequest que contiene la petici�n del cliente
	 *                web.
	 */
	public void m_ajax_cargarProductos(HttpServletRequest request) {
		logger.debug("Axislist002Service m_ajax_cargarProductos");
		AjaxContainerService ajax = new AjaxContainerService();
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {

			BigDecimal CPREVIO = this.getCampoNumerico(request, "CPREVIO");
			BigDecimal CCOMPANI = this.getCampoNumerico(request, "CCOMPANI");
			BigDecimal CAGRPRO = this.getCampoNumerico(request, "CAGRPRO");
			BigDecimal CRAMO = this.getCampoNumerico(request, "CRAMO");
			BigDecimal CEMPRES = this.getCampoNumerico(request, "CEMPRES");
			logger.debug(CCOMPANI);

			logger.debug(request.getParameter("CCOMPANI"));

			logger.debug(request.getAttribute("CCOMPANI"));
			if (this.isEmpty(CRAMO)) {
				if (this.isEmpty(CCOMPANI))
					ajax.guardarContenidoFinalAContenedorAjax(this.dbGetProductos(request, usuario));
				else {
					Map map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
							.ejecutaPAC_IAX_LISTVALORES__F_GET_PRODUCTOSCOMPANIA(CCOMPANI, CRAMO);
					logger.debug(map);
					ajax.guardarContenidoFinalAContenedorAjax((List) tratarRETURNyMENSAJES(request, map, false));
				}

			} else {
				if (this.isEmpty(CCOMPANI))
					ajax.guardarContenidoFinalAContenedorAjax(this.dbGetRamProductos(request));
				else {
					Map map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
							.ejecutaPAC_IAX_LISTVALORES__F_GET_PRODUCTOSCOMPANIA(CCOMPANI, CRAMO);
					logger.debug(map);
					ajax.guardarContenidoFinalAContenedorAjax((List) tratarRETURNyMENSAJES(request, map, false));
				}

			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axislist002Service - m�todo m_ajax_cargarProductos", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());

		}
	}

	// etm ini 24776

	public void m_ajax_cargarMotivos(HttpServletRequest request) {
		logger.debug("Axislist002Service m_ajax_cargarMotivos");
		AjaxContainerService ajax = new AjaxContainerService();
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {
			BigDecimal CCAUSIN = this.getCampoNumerico(request, "CCAUSIN");

			if (!this.isEmpty(CCAUSIN)) {
				ajax.guardarContenidoFinalAContenedorAjax(this.cargaListaMotivos(request));
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axislist002Service - m�todo m_ajax_cargarMotivos", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());

		}
	}

	// cargar persona
	public void m_ajax_cargarDatosPersona(HttpServletRequest request) {
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		logger.debug("Axispro018Service m_cargarDatosPersona");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();

		try {
			String NNUMIDE = getCampoTextual(request, "NNUMIDE");
			String TNOMBRE = getCampoTextual(request, "TNOMBRE");

			if (NNUMIDE == null)
				NNUMIDE = "";
			if (TNOMBRE == null)
				TNOMBRE = "";

			String CODIGO = "DATOSPERSONA";
			String CONDICION = NNUMIDE + "|" + TNOMBRE;

			Map map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES__F_GET_CONSULTA(CODIGO, CONDICION);
			logger.debug(map);

			List DATOSPERSONA = (List) ajax.rellenarPlAContenedorAjax(map);
			ajax.guardarContenidoFinalAContenedorAjax(DATOSPERSONA);
			// request.getSession().removeAttribute("REC_LSTRECIBOS");
			// formdata.put("TIPORECIBO",getCampoTextual(request, "TIPORECIBO"));
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
			// this.cargaComboCompania(request);

		} catch (Exception e) {
			logger.error("Error en el servicio Axispro022Service - m�todo m_cargarDatosPersona", e);
			ajax.rellenarExcepcionAContenedorAjax(e);

		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	// etm fin 24776

	// BUG 21838 - 20120530 -JLTS Desde aqui

	/**
	 * Realiza una b�squeda de productos por Ajax.
	 * 
	 * @see buscaProductos
	 * @param request El HttpServletRequest que contiene la petici�n del cliente
	 *                web.
	 */
	public void m_ajax_cargarTramitadores(HttpServletRequest request) {
		logger.debug("Axislist002Service m_ajax_cargarTramitadores");
		AjaxContainerService ajax = new AjaxContainerService();
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		try {

			String CTRAMITPAD = this.getCampoTextual(request, "CTRAMITPAD");
			logger.debug(CTRAMITPAD);

			Map map = new PAC_IAX_LISTVALORES_SIN((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES_SIN__F_GET_CTRAMITAD(usuario.getCempres(), CTRAMITPAD);
			logger.debug(map);
			ajax.guardarContenidoFinalAContenedorAjax((List) tratarRETURNyMENSAJES(request, map, false));
		} catch (Exception e) {
			logger.error("Error en el servicio Axislist002Service - m�todo m_ajax_cargarTramitadores", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	/**
	 * Realiza una b�squeda de productos por Ajax.
	 * 
	 * @see buscaProductos
	 * @param request El HttpServletRequest que contiene la petici�n del cliente
	 *                web.
	 */
	public void m_ajax_cargarPoblaciones(HttpServletRequest request) {
		logger.debug("Axislist002Service m_ajax_cargarPoblaciones");
		AjaxContainerService ajax = new AjaxContainerService();
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		try {

			String CPROVIN = this.getCampoTextual(request, "CPROVIN");
			logger.debug(CPROVIN);

			Map map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES__F_GET_CONSULTA("LISTA_POBLACION", CPROVIN + "|||");
			logger.debug(map);
			ajax.guardarContenidoFinalAContenedorAjax((List) tratarRETURNyMENSAJES(request, map, false));
		} catch (Exception e) {
			logger.error("Error en el servicio Axislist002Service - m�todo m_ajax_cargarPoblaciones", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}
	// BUG 21838 - 20120530 -JLTS Hasta aqui
}
