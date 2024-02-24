//Revision:# qWMl/GCkCla6wkaw+a0tYQ== #
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

import axis.cache.AxisCodeWizard;
import axis.jdbc.PAC_IAXPAR_PRODUCTOS;
import axis.jdbc.PAC_IAX_AGENDA;
import axis.jdbc.PAC_IAX_AVISOS;
import axis.jdbc.PAC_IAX_CAJA;
import axis.jdbc.PAC_IAX_CARGA_PREGUNTAB;
import axis.jdbc.PAC_IAX_CFG;
import axis.jdbc.PAC_IAX_COMMON;
import axis.jdbc.PAC_IAX_CONTRAGARAN;
import axis.jdbc.PAC_IAX_DOCREQUERIDA;
import axis.jdbc.PAC_IAX_INSPECCION;
import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.jdbc.PAC_IAX_MARCAS;
import axis.jdbc.PAC_IAX_OBTENERDATOS;
import axis.jdbc.PAC_IAX_PARAM;
import axis.jdbc.PAC_IAX_PERSONA;
import axis.jdbc.PAC_IAX_PRODUCCION;
import axis.jdbc.PAC_IAX_PRODUCCION_AUT;
import axis.jdbc.PAC_IAX_PSU;
import axis.jdbc.PAC_IAX_VALIDACIONES;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.control.axis.Axisctr009Action;
import axis.mvc.model.UsuarioBean;
import axis.mvc.view.VisibleTag;
import axis.util.Constantes;
import axis.util.ConversionUtil;

public class Axisctr009Service extends AxisBaseService {
	static Log logger = LogFactory.getLog(Axisctr009Service.class);

	public void m_init(HttpServletRequest request, Axisctr009Action thisAction) {
		logger.debug("Axisctr009Service m_init");
		try {
			String CMODO = (String) AbstractDispatchAction.topPila(request, "CMODO");
			request.getSession().setAttribute("CMODO", CMODO);
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr009Service - m�todo m_init", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

	/**
	 * Lee el numero de la p�liza.
	 * 
	 * @param request El HttpServletRequest que contiene la petici�n del cliente
	 *                web.
	 * @return
	 * @throws Exception
	 */
	private Map dbLeePoliza(HttpServletRequest request) throws Exception {
		Map map = new PAC_IAX_PRODUCCION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_PRODUCCION__F_GET_DATPOLIZA(null);
		logger.debug("OBJETO POLIZA  BBDD ->" + map);
		Map mapPoliza = (HashMap) map.get("RETURN");
		// Map mapPoliza
		return mapPoliza;
	}

	public void m_form(HttpServletRequest request, Axisctr009Action thisAction) {
		logger.debug("Axisctr009Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		BigDecimal CEMPRES = usuario.getCempres();
		try {
			Map mapGenPoliza = new HashMap();
			PAC_IAX_PSU pacIaxPsu = new PAC_IAX_PSU((java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			PAC_IAX_MARCAS pac_iax_marcas = new PAC_IAX_MARCAS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));// CONF-186
			mapGenPoliza = this.dbLeePoliza(request);
			formdata.put("NPOLIZA", mapGenPoliza.get("NPOLIZA"));
			formdata.put("SPRODUC", mapGenPoliza.get("SPRODUC"));

			if (isEmpty(getCampoNumerico(request, "NCONTADOR"))) {
				formdata.put("NCONTADOR", 0);
			}
			PAC_IAX_PRODUCCION pacIaxProduccion = new PAC_IAX_PRODUCCION(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			PAC_IAXPAR_PRODUCTOS pacIaxparProductos = new PAC_IAXPAR_PRODUCTOS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			PAC_IAX_COMMON pacIaxCommon = new PAC_IAX_COMMON(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			HashMap m = null;
			// Bug 36596 IGIL ini
			m_buscar_cita(request, thisAction);
			// Bug 36596 IGIL fin

			/* Bug 20893/111636 - 02/05/2012 - AMC */
			PAC_IAX_PARAM pac_iax_param = new PAC_IAX_PARAM(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
			if (VisibleTag.esComponenteVisible(request, "axisctr009", "GRABAROBJETODB")) {
				m = new PAC_IAX_PRODUCCION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_PRODUCCION__F_GRABAROBJETODB();
				logger.debug("Map de grabarObjeto a DB---------------------------------------->" + m);
			}
			;

			String CMODO = (String) AbstractDispatchAction.topPila(request, "CMODO");
			// Per assegurar-nos que tingui el mode correcte li tornem a posar el seu mode
			// ja que si hem anat al detall dautos se li ha canviat el mode per GENERAL
			if (CMODO.equals("GENERAL"))
				AbstractDispatchAction.topPila(request, "CMODO", request.getSession().getAttribute("CMODO"));
			else
				request.getSession().setAttribute("CMODO", CMODO);

			//////////// REVISION CONTROL EMSION ////////////////////////////
			m = pacIaxProduccion.ejecutaPAC_IAX_PRODUCCION__F_CONTROL_EMISION();
			logger.debug("m:" + m);
			// tratarRETURNyMENSAJES(request, m);
			BigDecimal emision_OK = (BigDecimal) tratarRETURNyMENSAJES(request, m);
			request.setAttribute("emision_OK", emision_OK + "");

			////////////////// DATOS POLIZA //////////////
			m = pacIaxProduccion.ejecutaPAC_IAX_PRODUCCION__F_GET_DATPOLIZA(null);
			logger.debug("DATOS POLIZA: " + m);
			tratarRETURNyMENSAJES(request, m);
			Map datos_poliza = (Map) m.get("RETURN");
			BigDecimal SPERSON = (BigDecimal) datos_poliza.get("SPERTOM");
			Map parproducto = pacIaxparProductos.ejecutaPAC_IAXPAR_PRODUCTOS__F_GET_PARPRODUCTO("PSU",
					new BigDecimal(String.valueOf(datos_poliza.get("SPRODUC"))));
			logger.debug(parproducto);

			if (((BigDecimal) this.tratarRETURNyMENSAJES(request, parproducto)).intValue() == 0) {
				m = pacIaxProduccion.ejecutaPAC_IAX_PRODUCCION__F_GET_MVTRETENCION();
				logger.debug("m:" + m);
				tratarRETURNyMENSAJES(request, m);
				request.setAttribute("mvtretencion", m.get("RETURN"));
			} else {
				BigDecimal NOVISIBLE = getCampoNumerico(request, "NOVISIBLE");
				BigDecimal NMOVIMI = isEmpty(datos_poliza.get("NMOVIMI")) ? new BigDecimal(1)
						: new BigDecimal(String.valueOf(datos_poliza.get("NMOVIMI")));
				Map col_psu = pacIaxPsu.ejecutaPAC_IAX_PSU__F_GET_COLEC_PSU(
						new BigDecimal(String.valueOf(datos_poliza.get("SSEGURO"))), null, null, "EST");
				logger.debug("col_psu:" + col_psu);
				if (((BigDecimal) this.tratarRETURNyMENSAJES(request, col_psu)).intValue() == 0) {
					request.setAttribute("PTESTPOL", col_psu.get("P_TESTPOL"));
					request.setAttribute("PCESTPOL", col_psu.get("P_CESTPOL"));
					request.setAttribute("PCNIVELBPM", col_psu.get("P_CNIVELBPM"));
					request.setAttribute("PTNIVELBPM", col_psu.get("P_TNIVELBPM"));
					request.setAttribute("POBPSU_RETENIDAS", col_psu.get("POBPSU_RETENIDAS"));
					request.setAttribute("PTPSUS", col_psu.get("P_TPSUS"));

					logger.debug(col_psu.get("POBPSU_RETENIDAS"));
					HashMap mm = (HashMap) col_psu.get("POBPSU_RETENIDAS");
					logger.debug(m.get("NOCONTINUA"));
					try {
						request.setAttribute("PERMITE_EMITIR", mm.get("NOCONTINUA"));
					} catch (Exception e) {
						logger.debug("No hay valor para mm.get(NOCONTINUA)");
					}
					/*
					 * BigDecimal resultatBotoFinestra = BigDecimal.ZERO; List colsPSU =
					 * (ArrayList)col_psu.get("P_TPSUS"); if (colsPSU != null) { for (int i = 0; i <
					 * colsPSU.size(); i++) { BigDecimal codi_a_tratar =
					 * (BigDecimal)((Map)((Map)colsPSU.get(i)).get("OB_IAX_PSU")).get("NOCONTINUA");
					 * if(codi_a_tratar == BigDecimal.ONE ){ resultatBotoFinestra = BigDecimal.ONE;
					 * }
					 * 
					 * } } request.setAttribute("NOCONTINUA",resultatBotoFinestra);
					 */
				}
			}

			BigDecimal sseguro = (datos_poliza.get("SSEGURO") != null) ? (BigDecimal) datos_poliza.get("SSEGURO")
					: null;
			formdata.put("SSEGURO_EST", sseguro);
			formdata.put("SSEGURO", sseguro);
			// BUG CONF-186 - 22/08/2016 - HRE
			Map mapMarcas = pac_iax_marcas.ejecutaPAC_IAX_MARCAS__F_GET_MARCAS_POLIZAS(CEMPRES, sseguro, "EST");
			formdata.put("CACCION", new BigDecimal(5));
			logger.debug(mapMarcas);
			tratarRETURNyMENSAJES(request, mapMarcas);
			if (!isEmpty(mapMarcas)) {
				request.setAttribute("MARCAS", (List) mapMarcas.get("RETURN"));

				Map mapAccion = pac_iax_marcas.ejecutaPAC_IAX_MARCAS__F_GET_ACCION_POLIZA(CEMPRES, sseguro, "EST");
				logger.debug(mapAccion);
				BigDecimal accion = (BigDecimal) tratarRETURNyMENSAJES(request, mapAccion);

				formdata.put("CACCION", accion);
				System.out.println("LA ACCION ES:" + accion);
			}
			// BUG CONF-186 - 22/08/2016 - HRE

			try {
				// Obtener el nombre del agente
				String Agente = String.valueOf(datos_poliza.get("CAGENTE"));
				if (!isEmpty(Agente)) {
					HashMap mapAgent = new PAC_IAX_LISTVALORES(
							(java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
							.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTAGENTES(null, null, Agente, new BigDecimal(1));
					List listaAgentes = (List) tratarRETURNyMENSAJES(request, mapAgent);
					Map agente = getObjetoDeLista(listaAgentes, Agente, "CODI");
					datos_poliza.put("axisctr009_agente", agente);
				}
			} catch (Exception e) {
			}

			// Bug 27500 13/032014
			BigDecimal CFOLNUM = (BigDecimal) datos_poliza.get("NUMFOLIO");
			if (CFOLNUM != null && CFOLNUM.intValue() != 0) {
				datos_poliza.put("CFOLNUM", CFOLNUM);
			}

			Timestamp FMANDATO = (Timestamp) datos_poliza.get("FMANDATO");
			Date CFECMAN = FMANDATO == null ? null : new Date(FMANDATO.getTime());
			datos_poliza.put("CFECMAN", CFECMAN);

			String SUCURSAL = (String) datos_poliza.get("SUCURSAL");
			datos_poliza.put("CSUCURSAL", SUCURSAL);
			// fin Bug 27500

			// Obtener datos Promotor bug 19372/91763 - 12/09/2011 - AMC
			Map promotor = new PAC_IAX_PERSONA((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_PERSONA__F_GET_PERSONA_AGENTE((BigDecimal) datos_poliza.get("CPROMOTOR"),
							(BigDecimal) datos_poliza.get("CAGENTE"), new String("POL"));

			Map pro = (Map) promotor.get("OBPERSONA");
			logger.debug("-----> pro:" + pro);
			if (!isEmpty(pro)) {
				String TPROMOTOR = new String(pro.get("NNUMIDE") + " - " + pro.get("TNOMBRE") + ","
						+ pro.get("TAPELLI1") + " " + ((pro.get("TAPELLI2") != null) ? pro.get("TAPELLI2") : ""));
				datos_poliza.put("axisctr009_promotor", TPROMOTOR);
			}

			// Formatear la cuenta banc�ria
			if (!AxisBaseService.isEmpty(datos_poliza.get("CTIPCOB"))
					&& new BigDecimal("2").equals(datos_poliza.get("CTIPCOB"))) {
				BigDecimal CTIPBAN = ((!AxisBaseService.isEmpty(datos_poliza.get("CTIPBAN")))
						? (BigDecimal) datos_poliza.get("CTIPBAN")
						: null);
				String CBANCAR = ((!AxisBaseService.isEmpty(datos_poliza.get("CBANCAR")))
						? (String) datos_poliza.get("CBANCAR")
						: null);
				Map mf = pacIaxCommon.ejecutaPAC_IAX_COMMON__F_FORMATCCC(CTIPBAN, CBANCAR);
				logger.debug("CBANCAR FORMATEADO: " + mf);
				tratarRETURNyMENSAJES(request, mf);
				datos_poliza.put("CBANCAR_FORMATEADO", mf.get("RETURN"));
			}

			request.setAttribute("datos_poliza", datos_poliza);

			/* DATOS DE CONVENIO */
			Map mapDetPoliza = pacIaxProduccion.ejecutaPAC_IAX_PRODUCCION__F_GET_DETPOLIZA();
			logger.debug("Datos_Convenio" + mapDetPoliza);
			Map datosDetPoliza = (Map) tratarRETURNyMENSAJES(request, mapDetPoliza);
			request.setAttribute("datosconvenio", datosDetPoliza.get("CONVEMPVERS"));

			/* CASOS BPM */
			Map casos_bpm = pacIaxProduccion.ejecutaPAC_IAX_PRODUCCION__F_GET_CASOSBMP();
			tratarRETURNyMENSAJES(request, casos_bpm);
			logger.debug("casos_bpm: " + casos_bpm);
			request.setAttribute("casos_bpm", casos_bpm.get("RETURN"));

			initParametrosRentasIrregulares(new BigDecimal(String.valueOf(datos_poliza.get("SPRODUC"))), request,
					usuario);

			m = pacIaxProduccion.ejecutaPAC_IAX_PRODUCCION__F_LEETOMADORES();
			logger.debug("TOMADORES: " + m);
			tratarRETURNyMENSAJES(request, m);
			request.setAttribute("tomadores", m.get("RETURN"));

			m = pacIaxProduccion.ejecutaPAC_IAX_PRODUCCION__F_GET_GESTRIESGOS();
			logger.debug(m);
			List T_IAX_GESTRIESGOS = (List) tratarRETURNyMENSAJES(request, m);
			logger.debug(T_IAX_GESTRIESGOS);
			request.setAttribute("T_IAX_GESTRIESGOS", T_IAX_GESTRIESGOS);

			if (!isEmpty(T_IAX_GESTRIESGOS)) {
				try {
					// Mirar si hay un riesgo seleccionado
					BigDecimal NRIESGO = getCampoNumerico(request, "NRIESGO");
					// Si no hay ning�n riesgo seleccionado, seleccionar el primer RIESGO
					if (isEmpty(NRIESGO)) {
						NRIESGO = (BigDecimal) ((Map) ((Map) T_IAX_GESTRIESGOS.get(0)).get("OB_IAX_GESTRIESGOS"))
								.get("NRIESGO");
						formdata.put("NRIESGO", bigDecimalToString(NRIESGO));
					}
					// Recuperar el riesgo
					m_getRiesgo(request, thisAction);

					// COBJASE-> Para accede a un modal diferente en riesgo. de momento s�lo
					// funciona cuando ==1
					request.setAttribute("COBJASE", datos_poliza.get("COBJASE"));

				} catch (Exception e) {
					// El primer registro de la tabla no contiene un NRIESGO
				}
			}

			/* RETORNOS */
			Map mapa_prod_retorno = pacIaxProduccion.ejecutaPAC_IAX_PRODUCCION__F_LEERETORNO();
			logger.debug("************************************" + mapa_prod_retorno);
			ArrayList lista_retornos = (ArrayList) tratarRETURNyMENSAJES(request, mapa_prod_retorno, false);
			request.setAttribute("lista_retornos", lista_retornos);

			/* CORRETAJE */
			// INI -IAXIS-10627 -21/01/2020. Se adiciona el paar�metro pPNOMIVI
			Map map = pacIaxProduccion.ejecutaPAC_IAX_PRODUCCION__F_LEECORRETAJE(null);
			// FIN -IAXIS-10627 -21/01/2020.
			logger.debug(map);
			tratarRETURNyMENSAJES(request, map, false);
			ArrayList lista_corretaje = (ArrayList) map.get("RETURN");

			request.setAttribute("lista_corretaje", lista_corretaje);

			m = pacIaxProduccion.ejecutaPAC_IAX_PRODUCCION__F_GET_PREGUNPOLIZACONSULTA();
			logger.debug(m);
			List T_IAX_PREGUNTAS = (List) tratarRETURNyMENSAJES(request, m);
			logger.debug(T_IAX_PREGUNTAS);
			logger.debug("PREG POL-->" + T_IAX_PREGUNTAS);

			List pregQuestSalut = null;
			List pregDespeses = null;
			if (!isEmpty(T_IAX_PREGUNTAS)) {
				pregQuestSalut = dividirPregPerCtipgru(T_IAX_PREGUNTAS, Constantes.CTIPGRU_QUESTIONARI_SALUT);
				pregDespeses = dividirPregPerCtipgru(T_IAX_PREGUNTAS, Constantes.CTIPGRU_DESPESES);
			}

			request.setAttribute("T_IAX_PREGUNTAS", T_IAX_PREGUNTAS);
			request.setAttribute("pregQuestSalut", pregQuestSalut);
			request.setAttribute("pregDespeses", pregDespeses);
			/* CLAUSULAS PROD MULT */

			/*
			 * map=pacIaxProduccion.ejecutaPAC_IAX_PRODUCCION__F_LEECLAUSULASPRODMULT(null,
			 * null); logger.debug(map); tratarRETURNyMENSAJES(request, map, false);
			 * 
			 * ArrayList lista_clausulasprodmult=(ArrayList)map.get("RETURN"); if
			 * (lista_clausulasprodmult!=null) { for (int i=0;
			 * i<lista_clausulasprodmult.size(); i++) { BigDecimal
			 * codi_clausula=(BigDecimal)((Map)((Map)lista_clausulasprodmult.get(i)).get(
			 * "OB_IAX_CLAUSULAS")).get("SCLAGEN"); BigDecimal
			 * cnordcla_clausula=(BigDecimal)((Map)((Map)lista_clausulasprodmult.get(i)).get
			 * ("OB_IAX_CLAUSULAS")).get("CIDENTITY"); BigDecimal
			 * clausula_params=(BigDecimal)((Map)((Map)lista_clausulasprodmult.get(i)).get(
			 * "OB_IAX_CLAUSULAS")).get("CPARAMS"); if
			 * ((clausula_params!=null)&&(clausula_params.intValue()<=0)){ HashMap
			 * n=pacIaxparProductos.ejecutaPAC_IAXPAR_PRODUCTOS__F_GET_DESCCLAUSULA(
			 * codi_clausula); String descripcion=(String)n.get("RETURN");
			 * ((Map)((Map)lista_clausulasprodmult.get(i)).get("OB_IAX_CLAUSULAS")).put(
			 * "TCLAESP", descripcion); }else{ //recuperem els parametres de la clusula
			 * HashMap
			 * n=pacIaxparProductos.ejecutaPAC_IAXPAR_PRODUCTOS__F_GET_DESCCLAUSULAPARMULT(
			 * codi_clausula,cnordcla_clausula, new
			 * BigDecimal(String.valueOf(datos_poliza.get("SSEGURO")))); String
			 * descripcion=(String)n.get("RETURN");
			 * ((Map)((Map)lista_clausulasprodmult.get(i)).get("OB_IAX_CLAUSULAS")).put(
			 * "TCLAESP", descripcion); } } }
			 */

			// Decimal SCLAGEN = this.getHiddenCampoNumerico(request, "MultipleSelected");
			// Leer cl�usulas definidas PROD (seleccionadas)
			map = pacIaxProduccion.ejecutaPAC_IAX_PRODUCCION__F_LEECLAUSULASPRODMULT(null, null);
			logger.debug("ejecutaPAC_IAX_PRODUCCION__F_LEECLAUSULASPRODMULT devuelve:" + map);
			List lista_clausulasprodmult = (List) tratarRETURNyMENSAJES(request, map);
			request.setAttribute("clausulasprodmult", lista_clausulasprodmult);

			/* CLAUSULAS PROD */
			m = pacIaxProduccion.ejecutaPAC_IAX_PRODUCCION__F_LEECLAUSULASPROD();
			logger.debug(m);
			tratarRETURNyMENSAJES(request, m);
			ArrayList lista_clausulasprod = (ArrayList) m.get("RETURN");
			if (lista_clausulasprod != null) {
				for (int i = 0; i < lista_clausulasprod.size(); i++) {
					BigDecimal codi_clausula = (BigDecimal) ((Map) ((Map) lista_clausulasprod.get(i))
							.get("OB_IAX_CLAUSULAS")).get("SCLAGEN");
					BigDecimal clausula_params = (BigDecimal) ((Map) ((Map) lista_clausulasprod.get(i))
							.get("OB_IAX_CLAUSULAS")).get("CPARAMS");
					HashMap n = pacIaxparProductos.ejecutaPAC_IAXPAR_PRODUCTOS__F_GET_DESCCLAUSULA(codi_clausula);
					String descripcion = (String) n.get("RETURN");
					if ((clausula_params != null) && (clausula_params.intValue() <= 0)) {
						((Map) ((Map) lista_clausulasprod.get(i)).get("OB_IAX_CLAUSULAS")).put("TCLAESP", descripcion);
					} else {
						// recuperem els parametres de la clusula
						ArrayList<HashMap> params = (ArrayList) ((Map) ((Map) lista_clausulasprod.get(i))
								.get("OB_IAX_CLAUSULAS")).get("PARAMETROS");
						for (int z = 0; z < params.size(); z++) {
							HashMap OB_IAX_CLAUSUPARA = (HashMap) params.get(z);
							OB_IAX_CLAUSUPARA = (HashMap) OB_IAX_CLAUSUPARA.get("OB_IAX_CLAUSUPARA");
							String texto = ((String) OB_IAX_CLAUSUPARA.get("TTEXTO"));
							BigDecimal nparame = ((BigDecimal) OB_IAX_CLAUSUPARA.get("NPARAME"));
							descripcion = descripcion.replace("#" + nparame.intValue() + "#", texto);
						}
						((Map) ((Map) lista_clausulasprod.get(i)).get("OB_IAX_CLAUSULAS")).put("TCLAESP", descripcion);
					}
				}
			}
			request.setAttribute("clausulasprod", lista_clausulasprod);

			/* CLAUSULAS ESPECIFICAS */
			m = pacIaxProduccion.ejecutaPAC_IAX_PRODUCCION__F_LEECLAUSULASESP(null, "CONSULTA");
			logger.debug("m:" + m);
			tratarRETURNyMENSAJES(request, m);
			request.setAttribute("clausulasesp", m.get("RETURN"));

			/* PRIMAS POLIZA */
			m = pacIaxProduccion.ejecutaPAC_IAX_PRODUCCION__F_GET_PRIMASPOLIZA();
			logger.debug("m:" + m);
			tratarRETURNyMENSAJES(request, m);
			request.setAttribute("primas", m.get("RETURN"));
			ArrayList primas = new ArrayList();
			primas.add((Map) m.get("RETURN"));
			request.setAttribute("primastotals", primas);

			/* DOCUMENTACI�N NECESARIA */
			// Recuperar el SPRODUC de la pila o de BD
			BigDecimal SPRODUC = (BigDecimal) AbstractDispatchAction.topPila(request, "SPRODUC");
			if (SPRODUC == null) {
				m = pacIaxProduccion.ejecutaPAC_IAX_PRODUCCION__F_GET_PRODUCTO();
				logger.debug(m);
				SPRODUC = (BigDecimal) tratarRETURNyMENSAJES(request, m);
			}

			// Leer Documentaci�n necesaria del producto
			m = pacIaxparProductos.ejecutaPAC_IAXPAR_PRODUCTOS__F_GET_DOCUMNECALTA(SPRODUC);
			logger.debug(m);
			List PAC_IAXPAR_PRODUCTOS__DOCUMNECALTA = (List) tratarRETURNyMENSAJES(request, m);

			// Leer Documentaci�n necesaria de producci�n
			m = pacIaxProduccion.ejecutaPAC_IAX_PRODUCCION__F_LEEDOCUMALTA();
			logger.debug(m);
			List PAC_IAX_PRODUCCION__DOCUMALTA = (List) tratarRETURNyMENSAJES(request, m);

			if (!isEmpty(PAC_IAXPAR_PRODUCTOS__DOCUMNECALTA) && !isEmpty(PAC_IAX_PRODUCCION__DOCUMALTA)) {
				// Merge Producci�n - Axispar
				for (int i = 0; i < PAC_IAX_PRODUCCION__DOCUMALTA.size(); i++) {
					// Examinar objeto a objeto PAC_IAX_PRODUCCION__DOCUMALTA
					Map outerMap = (Map) PAC_IAX_PRODUCCION__DOCUMALTA.get(i);
					if (!isEmpty(outerMap)) {
						// Si no est� vac�o, extraer el objeto interno (OB_IAX_DOCUMNEC)
						Map OB_IAX_DOCUMNEC = (Map) outerMap.get("OB_IAX_DOCUMNEC");
						if (!isEmpty(OB_IAX_DOCUMNEC)) {
							// Inspeccionar sus CDOCUMENT y NVERSION
							BigDecimal CDOCUMENT = (BigDecimal) OB_IAX_DOCUMNEC.get("CDOCUMENT");
							BigDecimal NVERSION = (BigDecimal) OB_IAX_DOCUMNEC.get("NVERSION");
							if (CDOCUMENT != null && NVERSION != null) {
								// Buscar el objeto de la lista del PRODUCTO (IAXPAR) que tiene este CDOCUMENT
								Map DOCUMENTO_IAXPAR = getObjetoDeLista(PAC_IAXPAR_PRODUCTOS__DOCUMNECALTA,
										CDOCUMENT.toString(), "CDOCUMENT");
								if (!isEmpty(DOCUMENTO_IAXPAR)
										&& NVERSION.equals((BigDecimal) DOCUMENTO_IAXPAR.get("NVERSION")))
									// Si lo encontramos y tiene igual NVERSION al objeto de PRODUCCION, marcarlo
									DOCUMENTO_IAXPAR.put("CSELEC", new BigDecimal(1));
							}
						}
					}
				}
			}

			BigDecimal SSEGURO = (BigDecimal) AbstractDispatchAction.topPila(request, "SSEGURO");
			formdata.put("SSEGURO", SSEGURO);
			BigDecimal SSEGURO_OUT = (BigDecimal) AbstractDispatchAction.topPila(request, "SSEGURO_OUT");
			formdata.put("SSEGURO_OUT", SSEGURO_OUT);
			BigDecimal CESCENA = getCampoNumerico(request, "CESCENA");
			String TABLAS = "EST";
			formdata.put("CESCENA", CESCENA);

			cargarContragarantias(request, thisAction, SSEGURO);

			/*
			 * PAC_IAX_OBTENERDATOS pac_iax_obtenerdatos=new
			 * PAC_IAX_OBTENERDATOS((java.sql.Connection)request.getAttribute(Constantes.
			 * DB01CONN)); Map evolu =
			 * pac_iax_obtenerdatos.ejecutaPAC_IAX_OBTENERDATOS__F_LEEEVOLUPROVMATSEG(
			 * SSEGURO, TABLAS); tratarRETURNyMENSAJES(request, evolu, false);
			 * logger.debug(evolu); request.setAttribute("evoluprovmatseg",
			 * evolu.get("RETURN"));
			 */
			logger.debug("Lista de Documentos definitiva:" + PAC_IAXPAR_PRODUCTOS__DOCUMNECALTA);
			formdata.put("T_IAX_DOCUMENTACION", PAC_IAXPAR_PRODUCTOS__DOCUMNECALTA);

			// INI Bug: 18351 LCOL003 - Documentaci�n requerida en contrataci�n y
			// suplementos
			BigDecimal pCACTIVI = (datos_poliza.get("CACTIVI") != null) ? (BigDecimal) datos_poliza.get("CACTIVI")
					: null;
			BigDecimal pNMOVIMI = (datos_poliza.get("NMOVIMI") != null) ? (BigDecimal) datos_poliza.get("NMOVIMI")
					: new BigDecimal(1);
			Map mdocrequi = pacIaxProduccion.ejecutaPAC_IAX_PRODUCCION__F_LEEDOCREQUERIDA(SPRODUC, sseguro, pCACTIVI,
					pNMOVIMI);
			logger.debug("ejecutaPAC_IAX_PRODUCCION__F_LEEDOCREQUERIDA:" + mdocrequi);
			request.setAttribute("docu_requerida", tratarRETURNyMENSAJES(request, mdocrequi, false));
			// FIN Bug: 18351 LCOL003 - Documentaci�n requerida en contrataci�n y
			// suplementos
			gestionarOrdenacionTablas(request);

			SPRODUC = (BigDecimal) AbstractDispatchAction.topPila(request, "SPRODUC");

			PAC_IAXPAR_PRODUCTOS pac_iaxpar_productos = new PAC_IAXPAR_PRODUCTOS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map mmoneda = (Map) pac_iaxpar_productos.ejecutaPAC_IAXPAR_PRODUCTOS__F_GET_MONEDAPRODUCTO(SPRODUC);

			logger.debug(mmoneda);
			if (!isEmpty(this.tratarRETURNyMENSAJES(request, mmoneda))
					&& ((BigDecimal) this.tratarRETURNyMENSAJES(request, mmoneda)).intValue() == 0) {
				request.setAttribute("CMONPROD", mmoneda.get("PCMONEDA"));
				request.setAttribute("TMONPROD", mmoneda.get("PTMONEDA"));
				request.setAttribute("CMONPRODINT", mmoneda.get("PCMONINT"));

			}

			/* Bug 20893/111636 - 02/05/2012 - AMC */
			m = pac_iax_param.ejecutaPAC_IAX_PARAM__F_PAREMPRESA_N("GEODIRECCION", usuario.getCempres());
			logger.debug("---> geo:" + m);
			formdata.put("GEODIRECCION", tratarRETURNyMENSAJES(request, m));

			map = pacIaxProduccion.ejecutaPAC_IAX_PRODUCCION__F_LEEDETCOASEGURO();
			Map coa = (HashMap) map.get("RETURN");
			logger.debug("----> datos coaseguro:" + coa);
			request.setAttribute("DATCOASEGURO", coa);

			m = pacIaxProduccion.ejecutaPAC_IAX_PRODUCCION__F_ES_COL_ADMIN(SSEGURO, TABLAS);
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
			request.getSession().setAttribute("GESTION_IR", this.tratarRETURNyMENSAJES(request, parproducto));

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
						new BigDecimal(String.valueOf(datos_poliza.get("SSEGURO"))),
						isEmpty(pNMOVIMI) ? new BigDecimal(1) : pNMOVIMI, new BigDecimal(1), TABLAS);
				logger.debug("INSPECCIOn:" + INSPECCION_RIESGO);
				ArrayList l_aux = (ArrayList) (tratarRETURNyMENSAJES(request, INSPECCION_RIESGO));
				/*
				 * if (!isEmpty(INSPECCION_RIESGO.get("PRESULTADOINSPECCION")))
				 * formdata.put("CRESULTR",INSPECCION_RIESGO.get("PRESULTADOINSPECCION"));
				 * 
				 * if (!isEmpty(INSPECCION_RIESGO.get("PNECESITAINSPECCION")))
				 * formdata.put("CINSPREQ",INSPECCION_RIESGO.get("PNECESITAINSPECCION"));
				 */
				int size = l_aux == null ? 0 : l_aux.size();
				if (size > 0) {
					request.setAttribute("INSPECCION_RIESGO", l_aux);
				}
				/* FIN SECCION INSPECCIONES RIESGOS */

			}

			map = new PAC_IAX_CARGA_PREGUNTAB((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_CARGA_PREGUNTAB__F_CARGAS_VALIDADAS(
							new BigDecimal(String.valueOf(datos_poliza.get("SSEGURO"))));
			logger.debug(map);
			tratarRETURNyMENSAJES(request, map);
			BigDecimal pmemitir = (BigDecimal) map.get("PEMITIR");

			formdata.put("PERMITEEMITIR", pmemitir);

			try {
				this.cargarcombos(request, thisAction, SSEGURO);

			} catch (Exception e) {
				logger.error("Error", e);
				thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
			}

			BigDecimal pnescena = null;
			Object obj = request.getSession().getAttribute("PNESCENA");

			if (obj != null) {
				pnescena = (BigDecimal) obj;
				request.setAttribute("PNESCENA", pnescena);
				recupera_evoluprov(request, SSEGURO, pnescena);
			}

			// INI IAXIS-14419 -- 08/10/2020 BJHB

			BigDecimal FACT_ELECTRONICA = BigDecimal.ZERO;

			Map mapFactura = new PAC_IAX_VALIDACIONES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_VALIDACIONES__F_CONSULTA_FACTURA(sseguro, "EST");
			tratarRETURNyMENSAJES(request, mapFactura);
			if (!isEmpty(mapFactura.get("RETURN")))
				FACT_ELECTRONICA = new BigDecimal(mapFactura.get("RETURN").toString());

			formdata.put("FACT_ELECTRONICA", FACT_ELECTRONICA);

			// FIN IAXIS-14419 -- 08/10/2020 BJHB

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr009Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
	}

	private List dividirFranqPerCtipgru(List<HashMap> franquicias, int CTIPGRU) {

		List franqdividides = new ArrayList();
		List<HashMap> objBorrar = new ArrayList();

		for (HashMap OB_IAX_BONFRANSEG : franquicias) {
			HashMap franq = (HashMap) OB_IAX_BONFRANSEG.get("OB_IAX_BONFRANSEG");
			BigDecimal CTIPGRUobj = (BigDecimal) franq.get("CTIPVISGRUP");
			if (!isEmpty(CTIPGRUobj) && CTIPGRUobj.intValue() == CTIPGRU) {
				franqdividides.add(OB_IAX_BONFRANSEG);
				objBorrar.add(OB_IAX_BONFRANSEG);
			}

		}

		for (HashMap OB_IAX_BF_PROACTGRUP : objBorrar) {
			franquicias.remove(OB_IAX_BF_PROACTGRUP);
		}

		return franqdividides;

	}

	private List dividirFranqLibres(List<HashMap> franquicias, List<HashMap> franquiciasgar) {

		List franqdividides = new ArrayList();
		List<HashMap> objBorrar = new ArrayList();

		for (HashMap OB_IAX_BONFRANSEG : franquicias) {
			HashMap franq = (HashMap) OB_IAX_BONFRANSEG.get("OB_IAX_BONFRANSEG");
			logger.debug("franq-->" + franq);
			BigDecimal CTIPGRUPSUBGRUP = (BigDecimal) franq.get("CTIPGRUPSUBGRUP");
			if (!isEmpty(CTIPGRUPSUBGRUP) && CTIPGRUPSUBGRUP.intValue() == 3) {
				franqdividides.add(OB_IAX_BONFRANSEG);
				objBorrar.add(OB_IAX_BONFRANSEG);
			} else {
				if (!isEmpty(CTIPGRUPSUBGRUP) && CTIPGRUPSUBGRUP.intValue() == 4) {
					objBorrar.add(OB_IAX_BONFRANSEG);
					franquiciasgar.add(OB_IAX_BONFRANSEG);
				}

			}
		}
		logger.debug("franqdividides-->" + franqdividides);
		for (HashMap OB_IAX_BONFRANSEG : objBorrar) {
			franquicias.remove(OB_IAX_BONFRANSEG);
		}

		return franqdividides;

	}

	private void m_getRiesgo(HttpServletRequest request, Axisctr009Action thisAction) {
		logger.debug("Axisctr009Service m_getRiesgo");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		try {
			BigDecimal NRIESGO = getCampoNumerico(request, "NRIESGO");

			// BUG: 0027953/0151258 - JSV 21/08/2013 - INI

			Map mapmod = new PAC_IAX_PRODUCCION_AUT((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_PRODUCCION_AUT__F_LEE_RIESAUTO(NRIESGO);
			logger.debug("------ auto recuperado:" + mapmod);
			mapmod = (Map) tratarRETURNyMENSAJES(request, mapmod);
			request.setAttribute("TMODALIDAD", mapmod.get("TMODALIDAD"));

			// BUG: 0027953/0151258 - JSV 21/08/2013 - INI

			Map map = new PAC_IAX_PRODUCCION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_PRODUCCION__F_GET_RIESGOCONSULTA(NRIESGO);

			logger.debug(map);

			Map OB_IAX_RIESGOS = (Map) tratarRETURNyMENSAJES(request, map);

			if (!isEmpty(OB_IAX_RIESGOS)) {

				if (!isEmpty(OB_IAX_RIESGOS.get("BONFRANSEG"))) {
					List franquicias = (List) OB_IAX_RIESGOS.get("BONFRANSEG");
					List franqtecnicas = null;
					// INI IAXIS-4936
					franquicias = obtenerDetCtipMin(franquicias, request);
					// FIN IAXIS-4936
					List bonusmalus = null;
					List franqtecnicaslibres = null;
					List bonusmaluslibres = null;
					List franqgartecnicaslibres = new ArrayList();
					List franqgarlibres = new ArrayList();
					List bonusmalusgarlibres = new ArrayList();
					if (!isEmpty(franquicias)) {
						franqtecnicas = dividirFranqPerCtipgru(franquicias, 1); // tecnicas
						franqtecnicaslibres = dividirFranqLibres(franqtecnicas, franqgartecnicaslibres); // tecnicas
																											// libres
						bonusmalus = dividirFranqPerCtipgru(franquicias, 2); // bonusmalus
						bonusmaluslibres = dividirFranqLibres(bonusmalus, bonusmalusgarlibres); // bonusmalus libres
					}

					OB_IAX_RIESGOS.put("franqlibres", dividirFranqLibres(franquicias, franqgarlibres));

					OB_IAX_RIESGOS.put("franqtecnicas", franqtecnicas);
					OB_IAX_RIESGOS.put("franqtecnicaslibres", franqtecnicaslibres);
					OB_IAX_RIESGOS.put("bonusmalus", bonusmalus);
					OB_IAX_RIESGOS.put("bonusmaluslibres", bonusmaluslibres);
					OB_IAX_RIESGOS.put("franqgartecnicaslibres", franqgartecnicaslibres);
					OB_IAX_RIESGOS.put("franqgarlibres", franqgarlibres);
					OB_IAX_RIESGOS.put("bonusmalusgarlibres", bonusmalusgarlibres);
				}

				if (!isEmpty(OB_IAX_RIESGOS.get("PREGUNTAS"))) {
					List preguntas = (List) OB_IAX_RIESGOS.get("PREGUNTAS");
					List pregQuestSalut = null;
					List pregDespeses = null;
					if (!isEmpty(preguntas)) {
						pregQuestSalut = dividirPregPerCtipgru(preguntas, Constantes.CTIPGRU_QUESTIONARI_SALUT);
						pregDespeses = dividirPregPerCtipgru(preguntas, Constantes.CTIPGRU_DESPESES);
					}

					OB_IAX_RIESGOS.put("pregQuestSalut", pregQuestSalut);
					OB_IAX_RIESGOS.put("pregDespeses", pregDespeses);

					logger.debug("PREG RISC-->" + OB_IAX_RIESGOS.get("PREGUNTAS"));
				}

				// Consultar la DESCRIPCI�N del BENEFICIARIO
				Map BENEFICIARIO = (Map) OB_IAX_RIESGOS.get("BENEFICIARIO");

				if (!isEmpty(BENEFICIARIO)) {
					String DESCRIPCION = "";
					BigDecimal CTIPO = (BigDecimal) BENEFICIARIO.get("CTIPO");
					// Poner una cosa u otra en funci�n de si tiene SCLABEN
					if (new BigDecimal(1).equals(CTIPO)) {
						DESCRIPCION = (String) BENEFICIARIO.get("TCLAESP");
					} else if (new BigDecimal(2).equals(CTIPO)) {
						DESCRIPCION = (String) BENEFICIARIO.get("TCLABEN");
					}
					BENEFICIARIO.put("DESCRIPCION", DESCRIPCION);
				}
				// A�adir BENEFICIARIO en LISTA
				List OB_IAX_BENEFICIARIOS = new ArrayList();
				OB_IAX_BENEFICIARIOS.add(BENEFICIARIO);
				OB_IAX_RIESGOS.put("OB_IAX_BENEFICIARIOS", OB_IAX_BENEFICIARIOS);

				List rentasIrregulares = this.dbLeeRentasIrregulares(request, usuario, NRIESGO);

				logger.debug(rentasIrregulares);

				List garantiasEntrada = this.getGarantiasSelecEntrada((List) OB_IAX_RIESGOS.get("GARANTIAS"));
				List garantiasSortida = this.getGarantiasSelecSalida((List) OB_IAX_RIESGOS.get("GARANTIAS"));
				List garantiasGeneral = this.getGarantiasSelecGenerales((List) OB_IAX_RIESGOS.get("GARANTIAS"));

				request.getSession().setAttribute("garantiasEntrada",
						((garantiasEntrada == null) ? new ArrayList() : garantiasEntrada));
				request.getSession().setAttribute("garantiasSortida",
						((garantiasSortida == null) ? new ArrayList() : garantiasSortida));
				request.getSession().setAttribute("garantiasGeneral",
						((garantiasGeneral == null) ? new ArrayList() : garantiasGeneral));
				if (!isEmpty(rentasIrregulares)) {
					request.getSession().setAttribute("rentasIrregulares",
							((rentasIrregulares == null) ? new ArrayList() : rentasIrregulares));
				}

				logger.debug("garantiasGeneral:" + garantiasGeneral);
				ArrayList partidas = new ArrayList();
				ArrayList garantiasg = new ArrayList();
				for (int i = 0; i < garantiasGeneral.size(); i++) {
					HashMap garantia = (HashMap) garantiasGeneral.get(i);
					HashMap gar = (HashMap) garantia.get("OB_IAX_GARANTIAS");

					BigDecimal CPARTIDA = new BigDecimal(String.valueOf(gar.get("CPARTIDA")));
					if (CPARTIDA.intValue() != 1)
						garantiasg.add(garantia);
					else
						partidas.add(garantia);
				}
				garantiasg = reestructurarGarantias(request, (List<HashMap>) garantiasg);
				logger.debug("garantiasg:" + garantiasg);
				request.getSession().setAttribute("garantiasGeneral",
						((garantiasg == null) ? new ArrayList() : garantiasg));

				if (!isEmpty(partidas)) {
					logger.debug("lipartidas=" + partidas);
					request.getSession().setAttribute("num_partidas", partidas.size());
					partidas = reestructurarGarantias(request, partidas);
					// request.getSession().setAttribute("axisctr_partidas", ((lipartidas==null)?new
					// ArrayList():lipartidas));
					request.getSession().setAttribute("axisctr_partidas", partidas);
				}

				if (!isEmpty(OB_IAX_RIESGOS.get("PRESTAMO"))) {
					// Nom�s mostrem els capitals assegurats marcats
					ArrayList<HashMap> saldodeutors = (ArrayList<HashMap>) OB_IAX_RIESGOS.get("PRESTAMO");
					ArrayList<HashMap> saldodeutors_nomesmarcats = new ArrayList<HashMap>();
					for (HashMap m : saldodeutors) {
						HashMap saldo = (HashMap) m.get("OB_IAX_PRESTAMOSEG");
						if (!isEmpty(saldo.get("SELSALDO"))
								&& new BigDecimal(String.valueOf(saldo.get("SELSALDO"))).intValue() == 1)
							saldodeutors_nomesmarcats.add(m);
					}
					OB_IAX_RIESGOS.put("PRESTAMO", saldodeutors_nomesmarcats);
				}

			}
			request.setAttribute("OB_IAX_RIESGOS", OB_IAX_RIESGOS);

			// Para testear qu� hay dentro...
			logger.debug(ConversionUtil.printAsXML(OB_IAX_RIESGOS, "OB_IAX_RIESGOS"));

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr020Service - m�todo m_getRiesgo", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

	// INI IAXIS-4936
	/**
	 * Agrega al HashMap que contiene los deducibles el DetValores del tipo de
	 * importe
	 * 
	 * @param franquicias
	 * @param request
	 * @return
	 * @throws Exception
	 */
	private List obtenerDetCtipMin(List<HashMap> franquicias, HttpServletRequest request) throws Exception {

		for (HashMap OB_IAX_BONFRANSEG : franquicias) {
			HashMap franq = (HashMap) OB_IAX_BONFRANSEG.get("OB_IAX_BONFRANSEG");
			logger.debug(franq);
			BigDecimal CtipMin = new BigDecimal(franq.get("CIMPMIN").toString());

			Map map = null;
			PAC_IAX_CAJA pac_iax_caja = new PAC_IAX_CAJA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			map = pac_iax_caja.ejecutaPAC_IAX_CAJA__F_GETDESCRIPVALORES(new BigDecimal(1104), CtipMin);
			String CTIPMIN = (String) tratarRETURNyMENSAJES(request, map, false);
			franq.put("CTIPMIN", CTIPMIN);
		}

		return franquicias;
	}
	// FIN IAXIS-4936

	public static ArrayList reestructurarGarantias(HttpServletRequest request, List<HashMap> li) {
		boolean situat = false;

		ArrayList resultat = new ArrayList();
		try {

			for (int i = 0; i < li.size(); i++) {
				HashMap garantia = (HashMap) li.get(i);
				HashMap gar = (HashMap) garantia.get("OB_IAX_GARANTIAS");
				if (!isEmpty(gar)) {
					logger.debug(gar.get("CGARPADRE"));
					BigDecimal CGARPADRE = isEmpty(gar.get("CGARPADRE")) ? new BigDecimal(0)
							: new BigDecimal(String.valueOf(gar.get("CGARPADRE")));
					BigDecimal CVISIBLE = isEmpty(gar.get("CVISIBLE")) ? new BigDecimal(1)
							: new BigDecimal(String.valueOf(gar.get("CVISIBLE")));
					BigDecimal CGARANT = new BigDecimal(String.valueOf(gar.get("CGARANT")));
					if (CGARPADRE.intValue() == 0 && CVISIBLE.intValue() == 1) {
						// resultat.add((HashMap)li.get(i));
						resultat.add(garantia);
						mirarquipenja(CGARANT.intValue(), li, resultat, gar);
					}
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return resultat;

	}

	private static void mirarquipenja(int cgarant, List li, ArrayList resultat, HashMap garPadre) {

		for (int i = 0; i < li.size(); i++) {
			HashMap garantia = (HashMap) li.get(i);
			HashMap garh = (HashMap) garantia.get("OB_IAX_GARANTIAS");

			BigDecimal CGARPADRE = isEmpty(garh.get("CGARPADRE")) ? new BigDecimal(0)
					: new BigDecimal(String.valueOf(garh.get("CGARPADRE")));
			BigDecimal CGARANT = new BigDecimal(String.valueOf(garh.get("CGARANT")));
			BigDecimal CVISIBLE = isEmpty(garh.get("CVISIBLE")) ? new BigDecimal(1)
					: new BigDecimal(String.valueOf(garh.get("CVISIBLE")));

			if (CGARPADRE.intValue() == cgarant && CVISIBLE.intValue() == 1) {

				if (isEmpty(garPadre.get("T_IAX_HIJOS"))) {
					ArrayList hijos = new ArrayList();
					hijos.add(garantia);
					garPadre.put("T_IAX_HIJOS", hijos);
				} else {
					ArrayList hhh = (ArrayList) garPadre.get("T_IAX_HIJOS");
					if (!existe(hhh, CGARANT))
						hhh.add(garantia);
				}

				// resultat.add(garantia);
				mirarquipenja(CGARANT.intValue(), li, resultat, garh);
			}

		}
	}

	private static boolean existe(ArrayList li, BigDecimal pCGARANT) {

		for (int i = 0; i < li.size(); i++) {
			HashMap garantia = (HashMap) li.get(i);
			HashMap garh = (HashMap) garantia.get("OB_IAX_GARANTIAS");
			BigDecimal CGARANT = new BigDecimal(String.valueOf(garh.get("CGARANT")));

			if (CGARANT.intValue() == pCGARANT.intValue())
				return true;
		}

		return false;

	}

	private List dividirPregPerCtipgru(List<HashMap> preguntas, int CTIPGRU) {

		List pregdividides = new ArrayList();
		List<HashMap> objBorrar = new ArrayList();

		for (HashMap OB_IAX_PREGUNTAS : preguntas) {
			HashMap preg = (HashMap) OB_IAX_PREGUNTAS.get("OB_IAX_PREGUNTAS");
			BigDecimal CTIPGRUobj = (BigDecimal) preg.get("CTIPGRU");
			logger.debug("CTIPGRUobj-->" + CTIPGRUobj);
			if (!isEmpty(CTIPGRUobj) && CTIPGRUobj.intValue() == CTIPGRU) {
				pregdividides.add(OB_IAX_PREGUNTAS);
				objBorrar.add(OB_IAX_PREGUNTAS);
			}

			logger.debug("PREG-->" + OB_IAX_PREGUNTAS);
		}

		for (HashMap OB_IAX_PREGUNTAS : objBorrar) {
			preguntas.remove(OB_IAX_PREGUNTAS);
		}

		return pregdividides;

	}

	public void m_imprimir(HttpServletRequest request, Axisctr009Action thisAction) {
		this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
	}

	public void m_anterior(HttpServletRequest request, Axisctr009Action thisAction) {
		try {
			String CMODO = (String) AbstractDispatchAction.topPila(request, "CMODO");
			// Per assegurar-nos que tingui el mode correcte li tornem a posar el seu mode
			// ja que si hem anat al detall dautos se li ha canviat el mode per GENERAL
			if (CMODO.equals("GENERAL"))
				AbstractDispatchAction.topPila(request, "CMODO", request.getSession().getAttribute("CMODO"));
			else
				request.getSession().setAttribute("CMODO", CMODO);
			request.setAttribute(Constantes.FORWARDACTION,
					AxisCodeWizard.findForward(request, Constantes.ANTERIOR, whoami(this), null));

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr009Service - m�todo m_anterior", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

	public void m_documentacion(HttpServletRequest request, Axisctr009Action thisAction) {
		this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
	}

	public void m_seleccionar_documentacion(HttpServletRequest request) {
		logger.debug("Axisctr009Service m_seleccionar_documentacion");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();

		try {
			BigDecimal CDOCUMENT = getCampoNumerico(request, "CDOCUMENT");
			BigDecimal CSELEC = getCampoNumerico(request, "CSELEC");
			BigDecimal NVERSION = getCampoNumerico(request, "NVERSION");
			BigDecimal CMOTMOV = getCampoNumerico(request, "CMOTMOV");
			String CMODO = (String) AbstractDispatchAction.topPila(request, "CMODO");
			// Per assegurar-nos que tingui el mode correcte li tornem a posar el seu mode
			// ja que si hem anat al detall dautos se li ha canviat el mode per GENERAL
			if (CMODO.equals("GENERAL"))
				AbstractDispatchAction.topPila(request, "CMODO", request.getSession().getAttribute("CMODO"));
			else
				request.getSession().setAttribute("CMODO", CMODO);
			// Guardar a BD el documento seleccionado/des-seleccionado
			Map map = new PAC_IAX_PRODUCCION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_PRODUCCION__F_GRABADOCUMMOV(CDOCUMENT, NVERSION, CMOTMOV, CSELEC);
			logger.debug(map);

			ajax.rellenarPlAContenedorAjax(map);
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr009Service - m�todo m_aceptar", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	public void m_aceptar(HttpServletRequest request) {
		logger.debug("Axisctr009Service m_aceptar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();

		try {
			PAC_IAX_PRODUCCION pacIaxProduccion = new PAC_IAX_PRODUCCION(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map map = pacIaxProduccion.ejecutaPAC_IAX_PRODUCCION__F_RETENERPROPUESTA();
			logger.debug(map);
			String CMODO = (String) AbstractDispatchAction.topPila(request, "CMODO");
			// Per assegurar-nos que tingui el mode correcte li tornem a posar el seu mode
			// ja que si hem anat al detall dautos se li ha canviat el mode per GENERAL
			if (CMODO.equals("GENERAL"))
				AbstractDispatchAction.topPila(request, "CMODO", request.getSession().getAttribute("CMODO"));
			else
				request.getSession().setAttribute("CMODO", CMODO);

			// Guardamos lo que sea que haya devuelto al contenedor Ajax.
			Object[] resultadoAjax = (Object[]) ajax.rellenarPlAContenedorAjax(map,
					new String[] { "ONPOLIZA", "OSSEGURO" });

			if (resultadoAjax[0].equals(new BigDecimal(0))) {
				Map ONPOLIZA = new HashMap();
				ONPOLIZA.put("ONPOLIZA", resultadoAjax[1]);
				Map OSSEGURO = new HashMap();
				OSSEGURO.put("OSSEGURO", resultadoAjax[2]);
				List RESULTADO = new ArrayList();
				RESULTADO.add(ONPOLIZA);
				RESULTADO.add(OSSEGURO);

				ajax.guardarContenidoFinalAContenedorAjax(RESULTADO);
				map = pacIaxProduccion.ejecutaPAC_IAX_PRODUCCION__F_BORRAR_SIMULACIONES(
						AxisBaseService.stringToBigDecimal(String.valueOf(resultadoAjax[2])));

			}
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr009Service - m�todo m_aceptar", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	public void m_guardar(HttpServletRequest request) {
		logger.debug("Axisctr009Service m_guardar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();

		try {
			PAC_IAX_PRODUCCION pacIaxProduccion = new PAC_IAX_PRODUCCION(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map map = pacIaxProduccion.ejecutaPAC_IAX_PRODUCCION__F_GRABARPROPUESTA();
			logger.debug(map);
			String CMODO = (String) AbstractDispatchAction.topPila(request, "CMODO");
			// Per assegurar-nos que tingui el mode correcte li tornem a posar el seu mode
			// ja que si hem anat al detall dautos se li ha canviat el mode per GENERAL
			if (CMODO.equals("GENERAL"))
				AbstractDispatchAction.topPila(request, "CMODO", request.getSession().getAttribute("CMODO"));
			else
				request.getSession().setAttribute("CMODO", CMODO);

			// Guardamos lo que sea que haya devuelto al contenedor Ajax.
			Object[] resultadoAjax = (Object[]) ajax.rellenarPlAContenedorAjax(map,
					new String[] { "ONPOLIZA", "OSSEGURO" });

			if (resultadoAjax[0].equals(new BigDecimal(0))) {
				Map ONPOLIZA = new HashMap();
				ONPOLIZA.put("ONPOLIZA", resultadoAjax[1]);
				Map OSSEGURO = new HashMap();
				OSSEGURO.put("OSSEGURO", resultadoAjax[2]);
				List RESULTADO = new ArrayList();
				RESULTADO.add(ONPOLIZA);
				RESULTADO.add(OSSEGURO);

				ajax.guardarContenidoFinalAContenedorAjax(RESULTADO);

				map = pacIaxProduccion.ejecutaPAC_IAX_PRODUCCION__F_BORRAR_SIMULACIONES(
						AxisBaseService.stringToBigDecimal(String.valueOf(resultadoAjax[2])));

			}
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr009Service - m�todo m_guardar", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	public void m_contratar(HttpServletRequest request) {
		logger.debug("Axisctr009Service m_contratar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();

		try {
			PAC_IAX_PRODUCCION pacIaxProduccion = new PAC_IAX_PRODUCCION(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map map = pacIaxProduccion.ejecutaPAC_IAX_PRODUCCION__F_EMITIR();
			logger.debug(map);
			String CMODO = (String) AbstractDispatchAction.topPila(request, "CMODO");
			// Per assegurar-nos que tingui el mode correcte li tornem a posar el seu mode
			// ja que si hem anat al detall dautos se li ha canviat el mode per GENERAL
			if (CMODO.equals("GENERAL"))
				AbstractDispatchAction.topPila(request, "CMODO", request.getSession().getAttribute("CMODO"));
			else
				request.getSession().setAttribute("CMODO", CMODO);

			// Guardamos lo que sea que haya devuelto al contenedor Ajax.
			Object[] resultadoAjax = (Object[]) ajax.rellenarPlAContenedorAjax(map,
					new String[] { "ONPOLIZA", "OSSEGURO" });
			logger.debug(resultadoAjax[0]);
			if (resultadoAjax[0].equals(new BigDecimal(0))) {
				Map ONPOLIZA = new HashMap();
				ONPOLIZA.put("ONPOLIZA", resultadoAjax[1]);
				Map OSSEGURO = new HashMap();
				OSSEGURO.put("OSSEGURO", resultadoAjax[2]);
				map = pacIaxProduccion.ejecutaPAC_IAX_PRODUCCION__F_COBRO_RETENIDO(
						AxisBaseService.stringToBigDecimal(String.valueOf(resultadoAjax[2])), new BigDecimal(1));
				logger.debug(map);
				List RESULTADO = new ArrayList();
				Map OMOTRETEN = new HashMap();
				OMOTRETEN.put("OMOTRETEN ", map.get("RETURN"));

				RESULTADO.add(ONPOLIZA);
				RESULTADO.add(OSSEGURO);
				RESULTADO.add(OMOTRETEN);

				request.getSession().setAttribute("SSEGURO", resultadoAjax[2]);
				ajax.guardarContenidoFinalAContenedorAjax(RESULTADO);

				map = pacIaxProduccion.ejecutaPAC_IAX_PRODUCCION__F_BORRAR_SIMULACIONES(
						AxisBaseService.stringToBigDecimal(String.valueOf(resultadoAjax[2])));

				// Si hemos contratado bien, en el caso que estuvi�ramos editando la p�liza, no
				// queremos volver a la pantalla 18.
				// Por eso, limpiaremos el top de la pila para evitar la navegaci�n al flujo de
				// pendientes.
				AbstractDispatchAction.popPila(request);
				AbstractDispatchAction.removeTopPila(request, Constantes.SALTARORIGENACTION);
			}
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr009Service - m�todo m_contratar", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	public void m_getreten(HttpServletRequest request) {
		logger.debug("Axisctr009Service m_getreten");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();

		try {
			String MENSAJE = getCampoTextual(request, "MENSAJE");
			PAC_IAX_PRODUCCION pacIaxProduccion = new PAC_IAX_PRODUCCION(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map map = pacIaxProduccion.ejecutaPAC_IAX_PRODUCCION__F_COBRO_RETENIDO(
					AxisBaseService.stringToBigDecimal(String.valueOf(request.getSession().getAttribute("SSEGURO"))),
					new BigDecimal(1));
			logger.debug(map);
			logger.debug(MENSAJE);
			// AbstractDispatchAction.guardarMensaje(request, MENSAJE, null,
			// Constantes.MENSAJE_ERROR);

			// ajax.rellenarExcepcionAContenedorAjax(new Exception(MENSAJE));
			ajax.rellenarPlAContenedorAjax(map);
			logger.debug(map.get("RETURN"));
			if (!isEmpty((map.get("RETURN")))) {

				BigDecimal MOTRET = AxisBaseService.stringToBigDecimal(String.valueOf(map.get("RETURN")));
				logger.debug(map.get("RETURN"));
				logger.debug(MOTRET);
				if (MOTRET.intValue() == 1) {
					logger.debug("motretenmov ::" + map);
					Map OMOTRET = new HashMap();
					OMOTRET.put("OMOTRET", MOTRET);
					Map mapMENSAJE = new HashMap();
					mapMENSAJE.put("MENSAJE", MENSAJE);
					List retorn = new ArrayList();
					retorn.add(OMOTRET);
					retorn.add(mapMENSAJE);

					ajax.guardarContenidoFinalAContenedorAjax(retorn);
				} else
					ajax.guardarErrorAContenedorAjax(MENSAJE);

			} else
				ajax.guardarErrorAContenedorAjax(MENSAJE);

			// Si hemos contratado bien, en el caso que estuvi�ramos editando la p�liza, no
			// queremos volver a la pantalla 18.
			// Por eso, limpiaremos el top de la pila para evitar la navegaci�n al flujo de
			// pendientes.
			// AbstractDispatchAction.popPila(request);
			// AbstractDispatchAction.removeTopPila(request, Constantes.SALTARORIGENACTION);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr009Service - m�todo m_getreten", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	private List dbLeeRentasIrregulares(HttpServletRequest request, UsuarioBean usuario, BigDecimal NRIESGO)
			throws Exception {
		Map m = new PAC_IAX_PRODUCCION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_PRODUCCION__F_LEERENTASIRREGULARES(NRIESGO);
		logger.debug("Map rentas irregulares---------------------------------------->" + m);
		return (List) tratarRETURNyMENSAJES(request, m);
	}

	private void initParametrosRentasIrregulares(BigDecimal SPRODUC, HttpServletRequest request, UsuarioBean usuario)
			throws Exception {

		// BigDecimal SPRODUC =
		// (BigDecimal)AbstractDispatchAction.topPila(request, "SPRODUC");
		List lista_anyos = this.dbLeeAnyosRentasIrregulares(request, usuario, SPRODUC);
		logger.debug("Map de lista_anyos---------------------------------------->" + lista_anyos);
		request.getSession().setAttribute("axisctr_lista_anyos", lista_anyos);
	}

	private List dbLeeAnyosRentasIrregulares(HttpServletRequest request, UsuarioBean usuario, BigDecimal SPRODUC)
			throws Exception {
		Map m = new PAC_IAXPAR_PRODUCTOS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAXPAR_PRODUCTOS__GET_ANYOSRENTASIRREG(SPRODUC);
		logger.debug("Map de preguntas riesgo---------------------------------------->" + m);
		return (List) tratarRETURNyMENSAJES(request, m);
	}

	/**
	 * M�todo que obtiene las garantias de entrada a partir de la lista de garant�a
	 * inicial
	 * 
	 * @param listaGarantias
	 * @return
	 * @throws Exception
	 */
	private List getGarantiasSelecEntrada(List lista_garantias) {

		Map aux = new HashMap();
		ArrayList lista_aux = new ArrayList();

		if (!isEmpty(lista_garantias)) {
			for (int i = 0; i < lista_garantias.size(); i++) {
				BigDecimal ctipo = (BigDecimal) ((Map) ((HashMap) lista_garantias.get(i)).get("OB_IAX_GARANTIAS"))
						.get("CTIPO");
				if (ctipo != null && (ctipo.intValue() == 3 || ctipo.intValue() == 4)) {
					lista_aux.add(((HashMap) lista_garantias.get(i)).get("OB_IAX_GARANTIAS"));
				}
			}
		}
		return lista_aux;
	}

	/**
	 * M�todo que obtiene las garantias de salida a partir de la lista de garant�a
	 * inicial
	 * 
	 * @param listaGarantias
	 * @return
	 * @throws Exception
	 */
	private List getGarantiasSelecSalida(List lista_garantias) {
		Map aux = new HashMap();
		ArrayList lista_aux = new ArrayList();

		if (!isEmpty(lista_garantias)) {
			for (int i = 0; i < lista_garantias.size(); i++) {
				BigDecimal ctipo = (BigDecimal) ((Map) ((HashMap) lista_garantias.get(i)).get("OB_IAX_GARANTIAS"))
						.get("CTIPO");
				if (ctipo != null && (ctipo.intValue() == 5 || ctipo.intValue() == 8 || ctipo.intValue() == 9)) {
					lista_aux.add(((HashMap) lista_garantias.get(i)).get("OB_IAX_GARANTIAS"));
				}
			}
		}
		return lista_aux;
	}

	/**
	 * M�todo que obtiene las garantias de salida a partir de la lista de garant�as
	 * 
	 * @param listaGarantias
	 * @return
	 * @throws Exception
	 */
	private List getGarantiasSelecGenerales(List lista_garantias) {
		Map aux = new HashMap();
		ArrayList lista_aux = new ArrayList();

		if (!isEmpty(lista_garantias)) {
			for (int i = 0; i < lista_garantias.size(); i++) {
				BigDecimal ctipo = (BigDecimal) ((Map) ((HashMap) lista_garantias.get(i)).get("OB_IAX_GARANTIAS"))
						.get("CTIPO");
				if (ctipo.intValue() != 5 && ctipo.intValue() != 8 && ctipo.intValue() != 9 && ctipo.intValue() != 3
						&& ctipo.intValue() != 4) {

					BigDecimal ctipgar = (BigDecimal) ((Map) ((HashMap) lista_garantias.get(i)).get("OB_IAX_GARANTIAS"))
							.get("CTIPGAR");

					if (!isEmpty(ctipgar) && ctipgar.intValue() != 8) {
						lista_aux.add(((HashMap) lista_garantias.get(i)));
					}

				}

			}
		}
		return lista_aux;
	}

	public void m_consultarCuadros(HttpServletRequest request, Axisctr009Action thisAction) {
		logger.debug("Axisctr009Service m_consultarCuadros");
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);

		try {
			// Push de los datos necesarios a la pila
			request.setAttribute("subpantalla", "DSP_SALDODEUTOR");

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr009Service - m�todo m_consultarCuadros", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			// Gesti�n de campos y dependencias
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
			this.configSuplementos(request);
		}
	}

	public void m_enviarCorreo(HttpServletRequest request) {
		logger.debug("Axisctr009Service m_enviarCorreo");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();

		try {
			PAC_IAX_PRODUCCION pacIaxProduccion = new PAC_IAX_PRODUCCION(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map map = pacIaxProduccion.ejecutaPAC_IAX_PRODUCCION__F_GRABARPROPUESTA();
			logger.debug(map);
			String CMODO = (String) AbstractDispatchAction.topPila(request, "CMODO");
			BigDecimal CSITUAC = getCampoNumerico(request, "CSITUAC");
			// Per assegurar-nos que tingui el mode correcte li tornem a posar el seu mode
			// ja que si hem anat al detall dautos se li ha canviat el mode per GENERAL
			if (CMODO.equals("GENERAL"))
				AbstractDispatchAction.topPila(request, "CMODO", request.getSession().getAttribute("CMODO"));
			else
				request.getSession().setAttribute("CMODO", CMODO);

			// Guardamos lo que sea que haya devuelto al contenedor Ajax.
			Object[] resultadoAjax = (Object[]) ajax.rellenarPlAContenedorAjax(map,
					new String[] { "ONPOLIZA", "OSSEGURO" });

			if (resultadoAjax[0].equals(new BigDecimal(0))) {
				Map ONPOLIZA = new HashMap();
				ONPOLIZA.put("ONPOLIZA", resultadoAjax[1]);
				Map OSSEGURO = new HashMap();
				OSSEGURO.put("OSSEGURO", resultadoAjax[2]);
				List RESULTADO = new ArrayList();
				RESULTADO.add(ONPOLIZA);
				RESULTADO.add(OSSEGURO);

				ajax.guardarContenidoFinalAContenedorAjax(RESULTADO);

				BigDecimal SPRODUC = (BigDecimal) AbstractDispatchAction.topPila(request, "SPRODUC");
//                BigDecimal SSEGURO = (BigDecimal) AbstractDispatchAction.topPila(request, "SSEGURO");
				BigDecimal NRIESGO = (BigDecimal) AbstractDispatchAction.topPila(request, "NRIESGO");

				// Si �s solicitud de projecte gen�ric s'envia tasca d'agenda, S'hauria de
				// parametritzar quin
				// �s el CSITUAC que permet enviar tasca.
				if (!isEmpty(CSITUAC) && (CSITUAC.intValue() == 12 || CSITUAC.intValue() == 4)) {
					PAC_IAX_AGENDA pacIaxAgenda = new PAC_IAX_AGENDA(
							(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
					Map m = pacIaxAgenda.ejecutaPAC_IAX_AGENDA__F_TAREA_SOL_PROYECTO(
							new BigDecimal(String.valueOf(resultadoAjax[2])));
					logger.debug(m);
				} else {
					PAC_IAX_CFG pacIaxCfg = new PAC_IAX_CFG(
							(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
					map = pacIaxCfg.ejecutaPAC_IAX_CFG__F_ENVIAR_NOTIFICACION(null, CMODO, null, SPRODUC,
							new BigDecimal(String.valueOf(resultadoAjax[2])), NRIESGO, null, null);
					logger.debug(map);
				}
			}
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr009Service - m�todo m_enviarCorreo", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	public void m_ajax_valdocrequerida(HttpServletRequest request) {
		logger.debug("Axisctr009Service m_ajax_valdocrequerida");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();

		try {
			HashMap map = this.f_Get_Avisos_retener(request, this.whoami(this), "RETENER");
			logger.debug(map);
			BigDecimal pRETURN = (BigDecimal) this.tratarRETURNyMENSAJES(request, map);

			if (pRETURN != null && pRETURN.intValue() != 1) { /////////// AVISOS

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
				BigDecimal pNMOVIMI = (datos_poliza.get("NMOVIMI") != null) ? (BigDecimal) datos_poliza.get("NMOVIMI")
						: new BigDecimal(1);
				BigDecimal pSPRODUC = (datos_poliza.get("SPRODUC") != null) ? (BigDecimal) datos_poliza.get("SPRODUC")
						: null;
				BigDecimal pCACTIVI = (datos_poliza.get("CACTIVI") != null) ? (BigDecimal) datos_poliza.get("CACTIVI")
						: null;
				PAC_IAX_DOCREQUERIDA pacIaxrequerida = new PAC_IAX_DOCREQUERIDA(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
				map = pacIaxrequerida.ejecutaPAC_IAX_DOCREQUERIDA__F_AVISO_DOCREQ_PENDIENTE(pSSEGURO, pNMOVIMI,
						pSPRODUC, pCACTIVI);
				logger.debug("ejecutaPAC_IAX_DOCREQUERIDA__F_AVISO_DOCREQ_PENDIENTE: " + map);

				ajax.rellenarPlAContenedorAjax(map);
				ajax.guardarContenidoFinalAContenedorAjax(map);
			} else {

				ajax.guardarContenidoFinalAContenedorAjax(ajax.rellenarPlAContenedorAjax(map));

			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr009Service - m�todo m_enviarCorreo", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	private HashMap f_Get_Avisos_retener(HttpServletRequest request, String whoami, String MODO) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {
			PAC_IAX_AVISOS pacIaxAviso = new PAC_IAX_AVISOS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			String CMODO = MODO;
			if (isEmpty(MODO))
				CMODO = (String) AbstractDispatchAction.topPila(request, "CMODO");

			BigDecimal CRAMO = (BigDecimal) AbstractDispatchAction.topPila(request, "CRAMO");
			BigDecimal SPRODUC = (BigDecimal) AbstractDispatchAction.topPila(request, "SPRODUC");
			BigDecimal SSEGURO = (BigDecimal) AbstractDispatchAction.topPila(request, "SSEGURO");
			BigDecimal NRIESGO = (BigDecimal) AbstractDispatchAction.topPila(request, "NRIESGO");

			if (!isEmpty(AbstractDispatchAction.topPila(request, "SSEGURO_OUT"))) {
				SSEGURO = (BigDecimal) AbstractDispatchAction.topPila(request, "SSEGURO_OUT");
			}

			request.setAttribute("SSEGURO", SSEGURO);
			request.setAttribute("NRIESGO", NRIESGO);

			String pparams = this.getInfoStringConcatenarRetener(request);
			logger.debug("1->" + pparams);

			HashMap m = pacIaxAviso.ejecutaPAC_IAX_AVISOS__F_GET_AVISOS(whoami.toUpperCase(), CMODO, CRAMO, SPRODUC,
					pparams);

			logger.debug(m);

			return m;

		} catch (Exception e) {
			logger.error("avisos para f_Get_Avisos_031 " + whoami + " ha causado un error", e);
			return null;
		}

	}

	private String getInfoStringConcatenarRetener(HttpServletRequest request) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {
			StringBuffer cadena = new StringBuffer();
			request.setAttribute("CIDIOMA", usuario.getCidioma());

			Enumeration enumera = request.getParameterNames();

			while (enumera.hasMoreElements()) {
				String fieldName = (String) enumera.nextElement();
				logger.debug("fieldName -->" + fieldName);
				String[] todos_valores = request.getParameterValues(fieldName);
				for (int i = 0; i < todos_valores.length; i++) {
					String fieldValue = todos_valores[i];

					if (!fieldName.equals("TTITOBS") && !fieldName.equals("TOBS") && !isEmpty(fieldValue)
							&& !fieldValue.equals("undefined") && fieldName.indexOf("respuesta") == -1) {
						if (i == 0)
							cadena.append("#").append(fieldName).append(";").append(fieldValue);
						else
							cadena.append("#").append(fieldName).append("__").append(i).append(";").append(fieldValue);
					}

				}
			}

			enumera = request.getAttributeNames();

			while (enumera.hasMoreElements()) {
				String fieldName = (String) enumera.nextElement();
				logger.debug("fieldName attributos -->" + fieldName);
				String fieldValue = String.valueOf(request.getAttribute(fieldName));
				logger.debug("fieldValue attributos -->" + fieldValue);
				if (!fieldName.equals("TTITOBS") && fieldName.indexOf("respuesta") == -1 && !fieldName.equals("TOBS")
						&& !isEmpty(fieldValue) && !fieldValue.equals("undefined") && fieldName.indexOf("javax") == -1
						&& fieldName.indexOf("org") == -1 && fieldName.indexOf("__mensajes") == -1
						&& fieldName.indexOf("__forwardaction") == -1 && fieldName.indexOf("__formdata") == -1
						&& fieldName.indexOf("__configform") == -1 && fieldName.indexOf("DEPENDENCIAS") == -1
						&& fieldName.indexOf("DISPLAY_ITEMS") == -1 && fieldName.indexOf("DEPENDENCIA0") == -1) {
					cadena.append("#").append(fieldName).append(";").append(fieldValue);
				}
			}

			cadena.append("#").append("CIDIOMA").append(";").append(usuario.getCidioma());
			String c = cadena.append("#").toString();
			/*
			 * logger.debug("cadena avisos sin recorte -->"+cadena); if (c.length()>1999)
			 * c=c.substring(0, 1999);
			 */
			logger.debug("cadena avisos length-->" + cadena.length());
			return c;
		} catch (Exception e) {
			logger.debug("error : " + e.getMessage());
			return "";
		}
	}

	public void recupera_evoluprov(HttpServletRequest request, BigDecimal PSSEGURO, BigDecimal PESCENA) {
		logger.debug("Axisctr009Service recupera_evoluprov");
		AjaxContainerService ajax = new AjaxContainerService();

		try {
			UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
			Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

			PAC_IAX_OBTENERDATOS pac_iax_obtenerdatos = new PAC_IAX_OBTENERDATOS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			String TABLA = "EST";

			formdata.put("NESCENA", PESCENA);
			formdata.put("SSEGURO", PSSEGURO);

			Map m = pac_iax_obtenerdatos.ejecutaPAC_IAX_OBTENERDATOS__F_LEEEVOLUPROVMATSEG(PSSEGURO, TABLA, PESCENA);
			List evolu = (List) tratarRETURNyMENSAJES(request, m, false);
			formdata.put("evoluprovmatseg", evolu);
			ajax.guardarContenidoFinalAContenedorAjax(evolu);
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr009Service - m�todo recupera_evoluprov", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
			this.f_Cargar_Propiedades_Pantalla(request, whoami(Axisctr009Service.class));
		}
	}

	public void m_actualiza_evoluprov(HttpServletRequest request, AbstractDispatchAction thisAction) {
		logger.debug("Axisctr009Service m_actualiza_evoluprov");
		AjaxContainerService ajax = new AjaxContainerService();

		try {
			UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
			Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

			PAC_IAX_OBTENERDATOS pac_iax_obtenerdatos = new PAC_IAX_OBTENERDATOS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			String TABLA = "EST";
			BigDecimal PSSEGURO = this.getHiddenCampoNumerico(request, "PSSEGURO");
			if (PSSEGURO == null)
				PSSEGURO = (BigDecimal) AbstractDispatchAction.topPila(request, "SSEGURO");

			BigDecimal PNESCENA = this.getHiddenCampoNumerico(request, "PNESCENA");
			if (PNESCENA == null)
				PNESCENA = (BigDecimal) AbstractDispatchAction.topPila(request, "PNESCENA");

			if (PNESCENA == null) {
				if (!isEmpty(PSSEGURO)) {
					Map mesce = pac_iax_obtenerdatos.ejecutaPAC_IAX_OBTENERDATOS__F_LEEEVOLUPROVMATSEG_MINSCEN(PSSEGURO,
							TABLA);
					BigDecimal minesce = (BigDecimal) tratarRETURNyMENSAJES(request, mesce, false);
					PNESCENA = minesce;
				}
			}

			request.getSession().setAttribute("PNESCENA", PNESCENA);

			formdata.put("NESCENA", PNESCENA);
			formdata.put("SSEGURO", PSSEGURO);

			if (!isEmpty(PSSEGURO)) {
				Map m = pac_iax_obtenerdatos.ejecutaPAC_IAX_OBTENERDATOS__F_LEEEVOLUPROVMATSEG(PSSEGURO, TABLA,
						PNESCENA);
				List evolu = (List) tratarRETURNyMENSAJES(request, m, false);
				formdata.put("evoluprovmatseg", evolu);
				ajax.guardarContenidoFinalAContenedorAjax(evolu);
			}
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr009Service - m�todo m_actualiza_evoluprov", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
			this.f_Cargar_Propiedades_Pantalla(request, whoami(Axisctr009Service.class));
		}
	}

	private void cargarcombos(HttpServletRequest request, Axisctr009Action thisAction, BigDecimal PSSEGURO) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		Map listValores = new HashMap();
		if (!isEmpty(PSSEGURO)) {
			try {
				if (PSSEGURO != null) {
					PAC_IAX_OBTENERDATOS pac_axis_listValores = new PAC_IAX_OBTENERDATOS(
							(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

					// Escenarios de proyeccion
					Map map = pac_axis_listValores.ejecutaPAC_IAX_OBTENERDATOS__F_LEEEVOLUPROVMATSEG_SCEN(PSSEGURO,
							"EST");
					listValores.put("tipEscen", (List) tratarRETURNyMENSAJES(request, map, false));
					formdata.put("listValores", listValores);
				}
			} catch (Exception e) {
				logger.error("Error", e);
				thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
			}
		}
	}

	// Bug 36596 IGIL ini
	public void m_buscar_cita(HttpServletRequest request, AbstractDispatchAction thisAction) {
		logger.debug("Axisctr009Service m_buscar");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {

			Map map = new PAC_IAX_PRODUCCION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_PRODUCCION__F_GET_CITASMEDICAS();
			logger.debug(map);
			List lista = (ArrayList) tratarRETURNyMENSAJES(request, map);

			formdata.put("T_IAX_CITAMEDICA", lista);
			request.setAttribute("T_IAX_CITAMEDICA", map.get("RETURN"));

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr009Service  -  m_buscar", e);
			AbstractDispatchAction.guardarMensaje(request, "1000050", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}

	}
	// Bug 36596 IGIL fin

	public void cargarContragarantias(HttpServletRequest request, AbstractDispatchAction thisAction,
			BigDecimal SSEGURO) {
		logger.debug("Axisctr009Service argarContragarantias");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {

			Map mapContragaran = new PAC_IAX_CONTRAGARAN(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_CONTRAGARANTIAS__F_GET_CONTRAGARAN_SEG(SSEGURO);
			logger.debug(mapContragaran);
			List listaContragaran = (ArrayList) tratarRETURNyMENSAJES(request, mapContragaran);

			formdata.put("T_IAX_CONTRAGARAN", listaContragaran);
			request.setAttribute("T_IAX_CONTRAGARAN", mapContragaran.get("RETURN"));

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr009Service  -  argarContragarantias", e);
			AbstractDispatchAction.guardarMensaje(request, "1000050", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
	}
}
