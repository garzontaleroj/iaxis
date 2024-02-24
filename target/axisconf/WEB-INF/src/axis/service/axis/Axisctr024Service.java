//Revision:# ebiLuUVW02B3af9kSMUSKg== #
package axis.service.axis;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.cache.AxisCodeWizard;
import axis.jdbc.PAC_IAXPAR_PRODUCTOS;
import axis.jdbc.PAC_IAX_DOCREQUERIDA;
import axis.jdbc.PAC_IAX_GESTIONPROPUESTA;
import axis.jdbc.PAC_IAX_INSPECCION;
import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.jdbc.PAC_IAX_MARCAS;
import axis.jdbc.PAC_IAX_PRODUCCION;
import axis.jdbc.PAC_IAX_PSU;
import axis.jdbc.PAC_IAX_SUPLEMENTOS;
import axis.jdbc.PAC_IAX_VALIDACIONES;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.control.axis.Axisctr024Action;
import axis.mvc.model.UsuarioBean;
import axis.util.Constantes;

public class Axisctr024Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE INICIALIZACION
	 *******************************************/
	/*********************************************************************************************************************/

	/**
	 * @param request El HttpServletRequest que contiene la petici�n del cliente
	 *                web.
	 */
	public void m_form(HttpServletRequest request, Axisctr024Action thisAction) {
		logger.debug("Axisctr024Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		Map mapa = null;
		BigDecimal CEMPRES = usuario.getCempres();// conf-186
		try {
			PAC_IAX_PRODUCCION pacIaxProduccion = new PAC_IAX_PRODUCCION(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			PAC_IAX_PSU pacIaxPsu = new PAC_IAX_PSU((java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			PAC_IAXPAR_PRODUCTOS pacIaxparProductos = new PAC_IAXPAR_PRODUCTOS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			HashMap m = null;
			PAC_IAX_MARCAS pac_iax_marcas = new PAC_IAX_MARCAS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));// conf-186
			PAC_IAX_SUPLEMENTOS pacIaxSuplementos = new PAC_IAX_SUPLEMENTOS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			BigDecimal CMOTMOV = (BigDecimal) AbstractDispatchAction.topPila(request, "CMOTMOV");
			logger.debug("CMOTMOV: " + CMOTMOV);

			if (CMOTMOV != null) {
				Map map2 = new PAC_IAX_SUPLEMENTOS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_SUPLEMENTOS__F_GET_DESCMOTMOV(CMOTMOV, usuario.getCidioma());
				formdata.put("PTMOTMOV", map2.get("PTMOTMOV"));
			} else {
				CMOTMOV = getCampoNumerico(request, "CMOTMOV");
				logger.debug("CMOTMOV :: " + CMOTMOV);
				if (CMOTMOV == null) {
					String CMODO = (String) AbstractDispatchAction.topPila(request, "CMODO");
					logger.debug("CMODO.substring(11, 14): " + CMODO.substring(11, 14));
					String CMOTMOV1 = CMODO.substring(11, 14);
					logger.debug("CMOTMOV1 " + CMOTMOV1);
					CMOTMOV = new BigDecimal(CMOTMOV1);
					logger.debug("CMOTMOV " + CMOTMOV);
				}
				Map map2 = new PAC_IAX_SUPLEMENTOS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_SUPLEMENTOS__F_GET_DESCMOTMOV(CMOTMOV, usuario.getCidioma());
				formdata.put("PTMOTMOV", map2.get("PTMOTMOV"));

			}

			logger.debug("CMOTMOV: " + CMOTMOV);
			logger.debug("axiscode formdata:" + formdata);
			// CMOTMOV=(String)formdata.get("CMOTMOV");
			logger.debug("CMOTMOV " + CMOTMOV);
			Map map = pacIaxSuplementos.ejecutaPAC_IAX_SUPLEMENTOS__F_GET_DETAILMOVSUPL(CMOTMOV);
			logger.debug(map);
			List T_IAX_DETMOVSEGURO = null;
			if (isEmpty(AbstractDispatchAction.topPila(request, "REVISARINSPECC")))
				T_IAX_DETMOVSEGURO = (List) tratarRETURNyMENSAJES(request, map);
			else
				T_IAX_DETMOVSEGURO = (List) map.get("RETURN");

			formdata.put("T_IAX_DETMOVSEGURO", T_IAX_DETMOVSEGURO);

			/* Validar Emsi�n */
			mapa = pacIaxProduccion.ejecutaPAC_IAX_PRODUCCION__F_CONTROL_EMISION();

			BigDecimal emision_OK = (BigDecimal) tratarRETURNyMENSAJES(request, mapa);

			m = pacIaxProduccion.ejecutaPAC_IAX_PRODUCCION__F_GET_DATPOLIZA(null);
			logger.debug("DATOS POLIZA: " + m);
			tratarRETURNyMENSAJES(request, m);
			Map datos_poliza = (Map) m.get("RETURN");
			logger.debug("pila-->" + AbstractDispatchAction.topPila(request));
			Map parproducto = pacIaxparProductos.ejecutaPAC_IAXPAR_PRODUCTOS__F_GET_PARPRODUCTO("PSU",
					new BigDecimal(String.valueOf(datos_poliza.get("SPRODUC"))));
			logger.debug(parproducto);

			if (((BigDecimal) this.tratarRETURNyMENSAJES(request, parproducto)).intValue() == 0) {
				/* Motivos de retenci�n - Suplementos */
				mapa = pacIaxSuplementos.ejecutaPAC_IAX_SUPLEMENTOS__F_GET_MVTRETENCION();
				logger.debug("m:" + mapa);
				tratarRETURNyMENSAJES(request, mapa);
				request.setAttribute("mvtretencion_sup", mapa.get("RETURN"));
			} else {
				/* Carga de registros PSU */
				BigDecimal NOVISIBLE = getCampoNumerico(request, "NOVISIBLE");
				BigDecimal NMOVIMI = isEmpty(datos_poliza.get("NMOVIMI")) ? null
						: new BigDecimal(String.valueOf(datos_poliza.get("NMOVIMI")));
				Map col_psu = pacIaxPsu.ejecutaPAC_IAX_PSU__F_GET_COLEC_PSU(
						new BigDecimal(String.valueOf(datos_poliza.get("SSEGURO"))), NMOVIMI, null, "EST");
				logger.debug("col_psu:" + col_psu);
				if (((BigDecimal) this.tratarRETURNyMENSAJES(request, col_psu)).intValue() == 0) {
					request.setAttribute("PTESTPOL", col_psu.get("P_TESTPOL"));
					request.setAttribute("PCESTPOL", col_psu.get("P_CESTPOL"));
					request.setAttribute("PTPSUS", col_psu.get("P_TPSUS"));
					request.setAttribute("CNIVELBPM", col_psu.get("P_CNIVELBPM"));
					request.setAttribute("TNIVELBPM", col_psu.get("P_TNIVELBPM"));
					request.setAttribute("TIPODATOS", "PSU");
					BigDecimal resultatBotoFinestra = BigDecimal.ZERO;
					/*
					 * List colsPSU = (ArrayList)col_psu.get("P_TPSUS"); if (colsPSU != null) { for
					 * (int i = 0; i < colsPSU.size(); i++) { BigDecimal codi_a_tratar =
					 * (BigDecimal)((Map)((Map)colsPSU.get(i)).get("OB_IAX_PSU")).get("NOCONTINUA");
					 * if(codi_a_tratar == BigDecimal.ONE ){ resultatBotoFinestra = BigDecimal.ONE;
					 * }
					 * 
					 * } } request.setAttribute("NOMESBOTOCAN",resultatBotoFinestra);
					 */
				}
			}

			/* Modo Modificaci�n de Propuestas Retenidas */
			String CMODO = (String) AbstractDispatchAction.topPila(request, "CMODO");

			if (CMODO.indexOf("MODIF_PROP") == 0) {
				request.setAttribute("MODIF_PROP", true);
			}

			/* Miramos la visualizaci�n del bot�n de diferir */
			map = pacIaxSuplementos.ejecutaPAC_IAX_SUPLEMENTOS__F_MOSTRAR_DIFERIR();
			logger.debug(map);
			tratarRETURNyMENSAJES(request, map);
			request.setAttribute("BOTONDIFERIR", map.get("PMOSTRAR"));

			/* Miramos la activaci�n del bot�n de diferir */

			BigDecimal SSEGURO = (BigDecimal) AbstractDispatchAction.topPila(request, "SSEGURO");
			BigDecimal SSEGURO_OUT = (BigDecimal) AbstractDispatchAction.topPila(request, "SSEGURO_OUT");
			BigDecimal NMOVIMI = (BigDecimal) AbstractDispatchAction.topPila(request, "NMOVIMI");
			logger.debug("--------------------------- SSEGURO " + SSEGURO);
			logger.debug("--------------------------- SSEGURO_OUT " + SSEGURO_OUT);

			// BUG CONF-186 - 22/08/2016 - HRE
			Map mapMarcas = pac_iax_marcas.ejecutaPAC_IAX_MARCAS__F_GET_MARCAS_POLIZAS(CEMPRES, SSEGURO_OUT, "EST");
			formdata.put("CACCION", new BigDecimal(5));
			logger.debug(mapMarcas);
			tratarRETURNyMENSAJES(request, mapMarcas);
			if (!isEmpty(mapMarcas)) {
				request.setAttribute("MARCAS", (List) mapMarcas.get("RETURN"));

				Map mapAccion = pac_iax_marcas.ejecutaPAC_IAX_MARCAS__F_GET_ACCION_POLIZA(CEMPRES, SSEGURO_OUT, "EST");
				logger.debug(mapAccion);
				BigDecimal accion = (BigDecimal) tratarRETURNyMENSAJES(request, mapAccion);
				formdata.put("CACCION", accion);
			}
			// BUG CONF-186 - 22/08/2016 - HRE

			map = pacIaxSuplementos.ejecutaPAC_IAX_SUPLEMENTOS__F_HABILITA_DIFERIR(SSEGURO);
			logger.debug(map);
			tratarRETURNyMENSAJES(request, map);
			request.setAttribute("HAB_BOTONDIFERIR", map.get("PMOSTRAR"));

			// INI Bug: 18351 LCOL003 - Documentaci�n requerida en contrataci�n y
			// suplementos
			////////////////// DATOS POLIZA //////////////
			// HashMap
			// m=pacIaxProduccion.ejecutaPAC_IAX_PRODUCCION__F_GET_DATPOLIZA(SSEGURO);
			m = pacIaxProduccion.ejecutaPAC_IAX_PRODUCCION__F_GET_DATPOLIZA(null);
			logger.debug("DATOS POLIZA: " + m);
			tratarRETURNyMENSAJES(request, m);
			datos_poliza = (Map) m.get("RETURN");
			BigDecimal pCACTIVI = (datos_poliza.get("CACTIVI") != null) ? (BigDecimal) datos_poliza.get("CACTIVI")
					: new BigDecimal(0);
			// BigDecimal pNMOVIMI= (datos_poliza.get("NMOVIMI") != null) ?
			// (BigDecimal)datos_poliza.get("NMOVIMI") : NMOVIMI;
			logger.debug("NMOVIMI 1: " + (BigDecimal) datos_poliza.get("NMOVIMI"));
			logger.debug("NMOVIMI 2: " + NMOVIMI);
			BigDecimal pNMOVIMI = NMOVIMI;
			// Sumem 1 al NMOVIMI
			// pNMOVIMI = new BigDecimal(pNMOVIMI.intValue()+1);
			logger.debug("---------------------------- pNMOVIMI: " + pNMOVIMI);
			BigDecimal SPRODUC = (BigDecimal) AbstractDispatchAction.topPila(request, "SPRODUC");
			Map mdocrequi = pacIaxProduccion.ejecutaPAC_IAX_PRODUCCION__F_LEEDOCREQUERIDA(SPRODUC, SSEGURO_OUT,
					pCACTIVI, pNMOVIMI);
			logger.debug("ejecutaPAC_IAX_PRODUCCION__F_LEEDOCREQUERIDA:" + mdocrequi);
			request.setAttribute("docu_requerida", tratarRETURNyMENSAJES(request, mdocrequi, false));
			// FIN Bug: 18351 LCOL003 - Documentaci�n requerida en contrataci�n y
			// suplementos

			String TABLAS = "EST";
			m = pacIaxProduccion.ejecutaPAC_IAX_PRODUCCION__F_ES_COL_ADMIN((BigDecimal) datos_poliza.get("SSEGURO"),
					TABLAS);
			logger.debug("F_ES_COL_ADMIN: " + m);
			if (!isEmpty(this.tratarRETURNyMENSAJES(request, m))
					&& ((BigDecimal) this.tratarRETURNyMENSAJES(request, m)).intValue() == 0) {
				formdata.put("ES_COL_ADMIN", m.get("ES_COL_ADMIN"));
				formdata.put("ES_CERTIF_CERO", m.get("ES_CERTIF_CERO"));
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
			/* INI SECCION INSPECCIONES RIESGOS */
			PAC_IAX_INSPECCION PAC_IAX_INSPECCION = new PAC_IAX_INSPECCION(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map INSPECCION_RIESGO = new HashMap();

			parproducto = pacIaxparProductos.ejecutaPAC_IAXPAR_PRODUCTOS__F_GET_PARPRODUCTO("GESTION_IR", SPRODUC);
			logger.debug(parproducto);

			if (((BigDecimal) this.tratarRETURNyMENSAJES(request, parproducto)).intValue() == 1) {

				Map mmm = (Map) PAC_IAX_INSPECCION.ejecutaPAC_IAX_INSPECCION__F_GESTION_INSPECCION(
						new BigDecimal(String.valueOf(datos_poliza.get("SSEGURO"))),
						isEmpty(pNMOVIMI) ? new BigDecimal(1) : pNMOVIMI, new BigDecimal(1), TABLAS);
				logger.debug(mmm);
				if (!isEmpty(mmm.get("PRESULTADOINSPECCION")))
					formdata.put("CRESULTR", mmm.get("PRESULTADOINSPECCION"));

				if (!isEmpty(mmm.get("PNECESITAINSPECCION")))
					formdata.put("CINSPREQ", mmm.get("PNECESITAINSPECCION"));

				INSPECCION_RIESGO = (Map) PAC_IAX_INSPECCION.ejecutaPAC_IAX_INSPECCION__F_GET_ORDENES_INSPECCION(
						(BigDecimal) datos_poliza.get("SSEGURO"), pNMOVIMI, new BigDecimal(1), TABLAS);
				logger.debug("INSPECCIOn:" + INSPECCION_RIESGO);
				ArrayList l_aux = (ArrayList) (tratarRETURNyMENSAJES(request, INSPECCION_RIESGO));
				/*
				 * if (!isEmpty(INSPECCION_RIESGO.get("PRESULTADOINSPECCION")))
				 * formdata.put("CRESULTR",INSPECCION_RIESGO.get("PRESULTADOINSPECCION"));
				 * 
				 * if (!isEmpty(INSPECCION_RIESGO.get("PNECESITAINSPECCION")))
				 * formdata.put("CINSPREQ",INSPECCION_RIESGO.get("PNECESITAINSPECCION"));
				 */

				if (l_aux != null) {
					request.setAttribute("INSPECCION_RIESGO", l_aux);
				}
			}
			/* FIN SECCION INSPECCIONES RIESGOS */
			formdata.put("REVISARINSPECCION", AbstractDispatchAction.topPila(request, "REVISARINSPECC"));

			/* CASOS BPM */
			Map casos_bpm = pacIaxProduccion.ejecutaPAC_IAX_PRODUCCION__F_GET_CASOSBMP();
			tratarRETURNyMENSAJES(request, casos_bpm);
			logger.debug("casos_bpm: " + casos_bpm);
			formdata.put("caso_bpm", casos_bpm.get("RETURN"));

			// INI IAXIS-14419 -- 08/10/2020 BJHB

			BigDecimal FACT_ELECTRONICA = BigDecimal.ZERO;

			Map mapFactura = new PAC_IAX_VALIDACIONES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_VALIDACIONES__F_CONSULTA_FACTURA(SSEGURO_OUT, "EST");
			tratarRETURNyMENSAJES(request, mapFactura);
			if (!isEmpty(mapFactura.get("RETURN")))
				FACT_ELECTRONICA = new BigDecimal(mapFactura.get("RETURN").toString());

			formdata.put("FACT_ELECTRONICA", FACT_ELECTRONICA);

			// FIN IAXIS-14419 -- 08/10/2020 BJHB

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr024Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	/*********************************************************************************************************************/
	/************************************************
	 * M�TODOS DE ACTUALIZACI�N
	 *******************************************/
	/*********************************************************************************************************************/

	/**
	 * @param request El HttpServletRequest que contiene la petici�n del cliente
	 *                web.
	 */
	public void m_emitirPropuesta(HttpServletRequest request) {
		logger.debug("Axisctr024Service m_emitirPropuesta");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();

		try {
			// INI 0024278: LCOL_T010 - Suplementos diferidos - Cartera - colectivos
			BigDecimal PCPROPAGASUPL = getCampoNumerico(request, "PCPROPAGASUPL");
			logger.debug("++++ PCPROPAGASUPL" + PCPROPAGASUPL);
			////////////////// DATOS POLIZA //////////////
			PAC_IAX_PRODUCCION pacIaxProduccion = new PAC_IAX_PRODUCCION(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			HashMap datPoliza = pacIaxProduccion.ejecutaPAC_IAX_PRODUCCION__F_GET_DATPOLIZA(null);
			tratarRETURNyMENSAJES(request, datPoliza);
			Map datos_poliza = (Map) datPoliza.get("RETURN");
			BigDecimal SEGURO = (new BigDecimal(String.valueOf(datos_poliza.get("SSEGURO"))));
			BigDecimal NMOVIMI = isEmpty(datos_poliza.get("NMOVIMI")) ? null
					: new BigDecimal(String.valueOf(datos_poliza.get("NMOVIMI")));
			if (isEmpty(AbstractDispatchAction.topPila(request, "REVISARINSPECC"))) {
				Map m = new PAC_IAX_SUPLEMENTOS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_SUPLEMENTOS__F_SET_PROPAGA_SUPLEMENTO("EST", SEGURO, NMOVIMI, null,
								PCPROPAGASUPL);
				logger.debug("+++++PROPAGA SUPLEMENTO EMITIR: " + m);
				// FI INI 0024278: LCOL_T010 - Suplementos diferidos - Cartera - colectivos

				Map map = new PAC_IAX_SUPLEMENTOS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_SUPLEMENTOS__F_EMITIRPROPUESTA();
				logger.debug(map);
				/* recuperar el SSEGURO */

				// 0029991/0166577 - INI
				// Map PILA = (HashMap)request.getSession().getAttribute("PASSTOPPILA");
				// BigDecimal SSEGURO =! isEmpty(PILA.get("SSEGURO")) ? (BigDecimal)
				// PILA.get("SSEGURO") :(BigDecimal)PILA.get("SSEGUROx") ;
				HashMap m2 = pacIaxProduccion.ejecutaPAC_IAX_PRODUCCION__F_GET_DATPOLIZA(null);
				Map datos_poliza2 = (Map) m2.get("RETURN");
				BigDecimal SSEGURO = (new BigDecimal(String.valueOf(datos_poliza2.get("SSEGURO"))));
				// 0029991/0166577 - FIN

				// Esto rellenar� los MENSAJES en pantalla, as� que no nos preocupamos de si el
				// RETURN es 0 � 1
				ajax.rellenarPlAContenedorAjax(map, new String[] { "OSSEGURO", "RETURN" });

				/* Rellenar SSEGURO a contenedor AJAX */
				Map OSSEGURO = new HashMap();
				OSSEGURO.put("OSSEGURO", SSEGURO);
				Map hayError = new HashMap();
				hayError.put("hayError", map.get("RETURN"));
				List RESULTADO = new ArrayList();
				RESULTADO.add(OSSEGURO);
				RESULTADO.add(hayError);

				ajax.guardarContenidoFinalAContenedorAjax(RESULTADO);

			} else {

				String CMODO = (String) AbstractDispatchAction.topPila(request, "CMODO");

				if (CMODO.indexOf("MODIF_PROP_REVINSPEC") == 0) {
					BigDecimal SSEGURO_OUT = (BigDecimal) AbstractDispatchAction.topPila(request, "SSEGUROx");
					NMOVIMI = isEmpty(NMOVIMI) ? new BigDecimal(1) : NMOVIMI;
					PAC_IAX_INSPECCION PAC_IAX_INSPECCION = new PAC_IAX_INSPECCION(
							(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

					Map mm = PAC_IAX_INSPECCION.ejecutaPAC_IAX_INSPECCION__F_DESRETENER(SSEGURO_OUT, NMOVIMI, null,
							null);
					logger.debug(mm);
					Map map = new PAC_IAX_PRODUCCION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
							.ejecutaPAC_IAX_PRODUCCION__F_EMITIRPROPUESTA(SSEGURO_OUT, NMOVIMI);
					logger.debug(map);
					ajax.rellenarPlAContenedorAjax(map, new String[] { "OSSEGURO", "RETURN" });

					/* Rellenar SSEGURO a contenedor AJAX */
					Map OSSEGURO = new HashMap();
					OSSEGURO.put("OSSEGURO", SSEGURO_OUT);
					Map NPOLIZA = new HashMap();
					NPOLIZA.put("ONPOLIZA", map.get("ONPOLIZA"));
					Map hayError = new HashMap();
					hayError.put("hayError", map.get("RETURN"));
					List RESULTADO = new ArrayList();
					RESULTADO.add(OSSEGURO);
					RESULTADO.add(hayError);

					ajax.guardarContenidoFinalAContenedorAjax(RESULTADO);
				} /*
					 * else{ Map map=new
					 * PAC_IAX_SUPLEMENTOS((java.sql.Connection)request.getAttribute(Constantes.
					 * DB01CONN)).ejecutaPAC_IAX_SUPLEMENTOS__F_SET_PROPAGA_SUPLEMENTO("EST",SEGURO,
					 * NMOVIMI,null,PCPROPAGASUPL);
					 * logger.debug("+++++PROPAGA SUPLEMENTO EMITIR: "+m); Map PILA =
					 * (HashMap)request.getSession().getAttribute("PASSTOPPILA"); BigDecimal SSEGURO
					 * =! isEmpty(PILA.get("SSEGURO")) ? (BigDecimal) PILA.get("SSEGURO")
					 * :(BigDecimal)PILA.get("SSEGUROx") ; // Esto rellenar� los MENSAJES en
					 * pantalla, as� que no nos preocupamos de si el RETURN es 0 � 1
					 * ajax.rellenarPlAContenedorAjax (map, new String[] {"OSSEGURO","RETURN"});
					 * 
					 * Map OSSEGURO = new HashMap(); OSSEGURO.put("OSSEGURO", SSEGURO); Map hayError
					 * = new HashMap(); hayError.put("hayError", map.get("RETURN")); List RESULTADO
					 * = new ArrayList(); RESULTADO.add (OSSEGURO); RESULTADO.add (hayError);
					 * 
					 * ajax.guardarContenidoFinalAContenedorAjax(RESULTADO); }
					 */

			}
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr24Service - m�todo m_aceptar", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	/**
	 * @param request El HttpServletRequest que contiene la petici�n del cliente
	 *                web.
	 */
	public void m_aceptar(HttpServletRequest request) {
		logger.debug("Axisctr024Service m_aceptar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();

		try {

			// INI 0024278: LCOL_T010 - Suplementos diferidos - Cartera - colectivos
			/*
			 * BigDecimal PCPROPAGASUPL=getCampoNumerico(request, "PCPROPAGASUPL");
			 * logger.debug("++++ PCPROPAGASUPL"+ PCPROPAGASUPL);
			 */
			////////////////// DATOS POLIZA //////////////
			PAC_IAX_PRODUCCION pacIaxProduccion = new PAC_IAX_PRODUCCION(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			HashMap datPoliza = pacIaxProduccion.ejecutaPAC_IAX_PRODUCCION__F_GET_DATPOLIZA(null);
			tratarRETURNyMENSAJES(request, datPoliza);
			Map datos_poliza = (Map) datPoliza.get("RETURN");
			BigDecimal NMOVIMI = isEmpty(datos_poliza.get("NMOVIMI")) ? null
					: new BigDecimal(String.valueOf(datos_poliza.get("NMOVIMI")));
			BigDecimal SEGURO = (new BigDecimal(String.valueOf(datos_poliza.get("SSEGURO"))));

//            Map m=new PAC_IAX_SUPLEMENTOS((java.sql.Connection)request.getAttribute(Constantes.DB01CONN)).ejecutaPAC_IAX_SUPLEMENTOS__F_SET_PROPAGA_SUPLEMENTO("EST",SEGURO,NMOVIMI,null,PCPROPAGASUPL);
//             logger.debug("+++++PROPAGA SUPLEMENTO ACEPTAR: "+m);
			// FI INI 0024278: LCOL_T010 - Suplementos diferidos - Cartera - colectivos

			Map map = new PAC_IAX_PRODUCCION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_PRODUCCION__F_RETENERPROPUESTA();
			logger.debug(map);

			BigDecimal SSEGURO = (BigDecimal) map.get("OSSEGURO");

			// Esto rellenar� los MENSAJES en pantalla, as� que no nos preocupamos de si el
			// RETURN es 0 � 1
			ajax.rellenarPlAContenedorAjax(map, new String[] { "OSSEGURO" });

			/* Rellenar SSEGURO a contenedor AJAX */
			Map OSSEGURO = new HashMap();
			OSSEGURO.put("OSSEGURO", SSEGURO);
			List RESULTADO = new ArrayList();
			RESULTADO.add(OSSEGURO);

			ajax.guardarContenidoFinalAContenedorAjax(RESULTADO);

			// Esto rellenar� los MENSAJES en pantalla, as� que no nos preocupamos de si el
			// RETURN es 0 � 1
			// ajax.rellenarPlAContenedorAjax (map);
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr024Service - m�todo m_aceptar", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	/**
	 * Guarda la pantalla, realiza su validacin y determina la pantalla anterior a
	 * ejecutar.
	 * 
	 * @param request
	 * @param thisAction Added for back button (IAXIS-4321) PK-16/06/2019 Start
	 */
	public void m_anterior(HttpServletRequest request, AbstractDispatchAction thisAction) {
		logger.debug("Axisctr024Service m_anterior");
		try {
			if (!Boolean.valueOf(true).equals(request.getAttribute("multiPantalla")))
				request.setAttribute(Constantes.FORWARDACTION,
						AxisCodeWizard.findForward(request, Constantes.ANTERIOR, whoami(this), null));
		} catch (Exception e) {
			AbstractDispatchAction.guardarMensaje(request, "1000050", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
			this.f_Cargar_Propiedades_Pantalla(request, AxisBaseService.whoami(this));
		}
	}

	/** Added for back button (IAXIS-4321) PK-16/06/2019 End */

	/**
	 * @param request El HttpServletRequest que contiene la petici�n del cliente
	 *                web.
	 */
	public void m_aceptar_modif_prop(HttpServletRequest request) {
		logger.debug("Axisctr024Service m_aceptar_modif_prop");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();

		try {
			/* Recuperar el SSEGURO */
			BigDecimal SSEGURO = (BigDecimal) AbstractDispatchAction.topPila(request, "SSEGURO");

			// INI 0024278: LCOL_T010 - Suplementos diferidos - Cartera - colectivos
			BigDecimal PCPROPAGASUPL = getCampoNumerico(request, "PCPROPAGASUPL");
			logger.debug("++++ PCPROPAGASUPL" + PCPROPAGASUPL);
			////////////////// DATOS POLIZA //////////////
			PAC_IAX_PRODUCCION pacIaxProduccion = new PAC_IAX_PRODUCCION(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			HashMap datPoliza = pacIaxProduccion.ejecutaPAC_IAX_PRODUCCION__F_GET_DATPOLIZA(null);
			tratarRETURNyMENSAJES(request, datPoliza);
			Map datos_poliza = (Map) datPoliza.get("RETURN");
			BigDecimal NMOVIMI = isEmpty(datos_poliza.get("NMOVIMI")) ? null
					: new BigDecimal(String.valueOf(datos_poliza.get("NMOVIMI")));
			BigDecimal SEGURO = (new BigDecimal(String.valueOf(datos_poliza.get("SSEGURO"))));

			Map m = new PAC_IAX_SUPLEMENTOS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_SUPLEMENTOS__F_SET_PROPAGA_SUPLEMENTO("EST", SEGURO, NMOVIMI, null, PCPROPAGASUPL);
			logger.debug("+++++PROPAGA SUPLEMENTO MODIF PROP: " + m);
			// FI INI 0024278: LCOL_T010 - Suplementos diferidos - Cartera - colectivos

			Map map = new PAC_IAX_GESTIONPROPUESTA((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_GESTIONPROPUESTA__F_GRABAR_ALTA_POLIZA(SSEGURO);
			logger.debug(map);
			PAC_IAX_INSPECCION PAC_IAX_INSPECCION = new PAC_IAX_INSPECCION(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			BigDecimal SSEGURO_OUT = (BigDecimal) AbstractDispatchAction.topPila(request, "SSEGUROx");
			if (!isEmpty(AbstractDispatchAction.topPila(request, "INSPECCION"))) {
				BigDecimal ins = new BigDecimal(String.valueOf(AbstractDispatchAction.topPila(request, "INSPECCION")));
				if (ins.intValue() == 1) {// Pedir inspecci�n

					Map mmm = PAC_IAX_INSPECCION.ejecutaPAC_IAX_INSPECCION__F_LANZA_SOLICITUD_INSP("POL", SSEGURO_OUT,
							NMOVIMI, null);
					logger.debug(mmm);
				} else {
					if (ins.intValue() == 2) {// revisar inspecci�n
						Map mmm = PAC_IAX_INSPECCION.ejecutaPAC_IAX_INSPECCION__F_REVISAR_INSPECCION("POL", SSEGURO_OUT,
								NMOVIMI, null);
						logger.debug(mmm);
					}

				}

			}
			ajax.rellenarPlAContenedorAjax(map);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr024Service - m�todo m_aceptar_modif_prop", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	/**
	 * @param request El HttpServletRequest que contiene la petici�n del cliente
	 *                web.
	 */
	public void m_guardar_prop(HttpServletRequest request) {
		logger.debug("Axisctr024Service m_guardar_prop");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();

		try {
			/* Recuperar el SSEGURO */
			BigDecimal SSEGURO = (BigDecimal) AbstractDispatchAction.topPila(request, "SSEGURO");
			Map map = new PAC_IAX_GESTIONPROPUESTA((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_GESTIONPROPUESTA__F_ACTUALIZAR_SOL_SUPLEMENTO(SSEGURO);
			logger.debug(map);
			// ajax.rellenarPlAContenedorAjax (map);

			// Esto rellenar� los MENSAJES en pantalla, as� que no nos preocupamos de si el
			// RETURN es 0 � 1
			ajax.rellenarPlAContenedorAjax(map, new String[] { "OSSEGURO" });

			/* Rellenar SSEGURO a contenedor AJAX */
			Map OSSEGURO = new HashMap();
			OSSEGURO.put("OSSEGURO", SSEGURO);
			List RESULTADO = new ArrayList();
			RESULTADO.add(OSSEGURO);

			ajax.guardarContenidoFinalAContenedorAjax(RESULTADO);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr024Service - m�todo m_aceptar_modif_prop", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	// INI 18351 LCOL003 - Documentaci�n requerida en contrataci�n y suplementos
	//

	public void m_ajax_valdocrequerida(HttpServletRequest request) {
		logger.debug("Axisctr009Service m_ajax_valdocrequerida");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();

		try {
			// Recuperem l'sseguro
			////////////////// DATOS POLIZA //////////////
			PAC_IAX_PRODUCCION pacIaxProduccion = new PAC_IAX_PRODUCCION(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			HashMap datPoliza = pacIaxProduccion.ejecutaPAC_IAX_PRODUCCION__F_GET_DATPOLIZA(null);
			logger.debug("DATOS POLIZA: " + datPoliza);
			tratarRETURNyMENSAJES(request, datPoliza);
			Map datos_poliza = (Map) datPoliza.get("RETURN");
			BigDecimal pSSEGURO = (datos_poliza.get("SSEGURO") != null) ? (BigDecimal) datos_poliza.get("SSEGURO")
					: null;

			// BigDecimal pNMOVIMI= (datos_poliza.get("NMOVIMI") != null) ?
			// (BigDecimal)datos_poliza.get("NMOVIMI") : new BigDecimal(1);
			BigDecimal pNMOVIMI = (BigDecimal) AbstractDispatchAction.topPila(request, "NMOVIMI");
			BigDecimal SSEGURO_OUT = (BigDecimal) AbstractDispatchAction.topPila(request, "SSEGURO_OUT");
			BigDecimal pSPRODUC = (datos_poliza.get("SPRODUC") != null) ? (BigDecimal) datos_poliza.get("SPRODUC")
					: null;
			BigDecimal pCACTIVI = (datos_poliza.get("CACTIVI") != null) ? (BigDecimal) datos_poliza.get("CACTIVI")
					: null;

			PAC_IAX_DOCREQUERIDA pacIaxrequerida = new PAC_IAX_DOCREQUERIDA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map map = pacIaxrequerida.ejecutaPAC_IAX_DOCREQUERIDA__F_AVISO_DOCREQ_PENDIENTE(pSSEGURO, pNMOVIMI,
					pSPRODUC, pCACTIVI);
			logger.debug("ejecutaPAC_IAX_DOCREQUERIDA__F_AVISO_DOCREQ_PENDIENTE: " + map);

			// INI BUG 30700#c171051. JDS.31/03/2014. para determinar si mostrar o no bot�n
			// aceptar al volver a la pantalla ctr020.
			try {
				BigDecimal PCESTPOL = "".equals(request.getParameter("PCESTPOL"))
						|| null == request.getParameter("PCESTPOL") ? new BigDecimal(-1)
								: new BigDecimal(request.getParameter("PCESTPOL"));
				BigDecimal CINSPREQ = "".equals(request.getParameter("CINSPREQ"))
						|| null == request.getParameter("CINSPREQ") ? new BigDecimal(-1)
								: new BigDecimal(request.getParameter("CINSPREQ"));
				map.put("PCESTPOL", PCESTPOL);
				map.put("CINSPREQ", CINSPREQ);
			} catch (NumberFormatException e) {
				map.put("PCESTPOL", new BigDecimal(-1));
				map.put("CINSPREQ", new BigDecimal(-1));
			}
			// FIN BUG 30700#c171051
			ajax.rellenarPlAContenedorAjax(map);
			ajax.guardarContenidoFinalAContenedorAjax(map);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr009Service - m�todo m_enviarCorreo", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
			// this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}

	// FI 18351: LCOL003 - Documentaci�n requerida en contrataci�n y suplementos

	// INI 0024278: LCOL_T010 - Suplementos diferidos - Cartera - colectivos
	public void m_preguntaProgagaSupl_json(HttpServletRequest request) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		AjaxContainerService ajax = new AjaxContainerService();
		try {
			HashMap miDataObject = new HashMap();
			logger.debug("++++DENTRO PREGUNTA PROPAGA SUPLEMENTO");
			////////////////// DATOS POLIZA //////////////
			PAC_IAX_PRODUCCION pacIaxProduccion = new PAC_IAX_PRODUCCION(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			HashMap datPoliza = pacIaxProduccion.ejecutaPAC_IAX_PRODUCCION__F_GET_DATPOLIZA(null);
			logger.debug("DATOS POLIZA: " + datPoliza);
			tratarRETURNyMENSAJES(request, datPoliza);
			Map datos_poliza = (Map) datPoliza.get("RETURN");

			BigDecimal SSEGURO = (new BigDecimal(String.valueOf(datos_poliza.get("SSEGURO"))));

			BigDecimal NMOVIMI = isEmpty(datos_poliza.get("NMOVIMI")) ? null
					: new BigDecimal(String.valueOf(datos_poliza.get("NMOVIMI")));

			// nueva funcion que nos dir� que botones activar
			Map m = new PAC_IAX_SUPLEMENTOS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_SUPLEMENTOS__F_PREGUNTA_PROPAGA_SUPLEMENTO("EST", SSEGURO, NMOVIMI, null, null);
			logger.debug(m);

			miDataObject.put("resultado", m);
			ajax.rellenarPlAContenedorAjax(m);

			request.setAttribute(Constantes.AJAXCONTAINER, miDataObject);
		} catch (Exception e) {
			logger.error("Error.", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		} finally {
			// this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}

	// FI INI 0024278: LCOL_T010 - Suplementos diferidos - Cartera - colectivos
	public void m_guardar_supl(HttpServletRequest request) {
		logger.debug("Axisctr024Service m_aceptar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();

		try {

			PAC_IAX_PRODUCCION pacIaxProduccion = new PAC_IAX_PRODUCCION(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			HashMap datPoliza = pacIaxProduccion.ejecutaPAC_IAX_PRODUCCION__F_GET_DATPOLIZA(null);
			tratarRETURNyMENSAJES(request, datPoliza);
			Map datos_poliza = (Map) datPoliza.get("RETURN");
			BigDecimal NMOVIMI = isEmpty(datos_poliza.get("NMOVIMI")) ? null
					: new BigDecimal(String.valueOf(datos_poliza.get("NMOVIMI")));
			BigDecimal SEGURO = (new BigDecimal(String.valueOf(datos_poliza.get("SSEGURO"))));

			HashMap map = pacIaxProduccion.ejecutaPAC_IAX_PRODUCCION__F_GRABARPROPUESTA(new BigDecimal(1));

			BigDecimal SSEGURO = (BigDecimal) map.get("OSSEGURO");

			ajax.rellenarPlAContenedorAjax(map, new String[] { "OSSEGURO" });

			Map OSSEGURO = new HashMap();
			OSSEGURO.put("OSSEGURO", SSEGURO);
			List RESULTADO = new ArrayList();
			RESULTADO.add(OSSEGURO);

			ajax.guardarContenidoFinalAContenedorAjax(RESULTADO);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr024Service - m�todo m_aceptar", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

}