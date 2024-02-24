//Revision:# 6Lg1fjFFTc1A4ehrVi6c5A== #
package axis.service.axis;

import java.math.BigDecimal;
import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.csi_ti.security.aes.AESUtil;

import axis.jdbc.PAC_IAXPAR_PRODUCTOS;
import axis.jdbc.PAC_IAX_DATOSCTASEGURO;
import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.jdbc.PAC_IAX_OBTENERDATOS;
import axis.jdbc.PAC_IAX_PARAM;
import axis.jdbc.PAC_IAX_PERSONA;
import axis.jdbc.PAC_IAX_PRODUCCION;
import axis.jdbc.PAC_IAX_RESCATES;
import axis.jdbc.PAC_IAX_SUP_FINAN;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.control.axis.Axisctr038Action;
import axis.mvc.model.UsuarioBean;
import axis.util.Constantes;

public class Axisctr038Service extends AxisBaseService {
	private String SNIP = "";
	private BigDecimal SPERSON;

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE INICIALIZACION
	 *******************************************/
	/*********************************************************************************************************************/

	/**
	 * M�todo que se llama al inicio de este flujo.
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_init(HttpServletRequest request, Axisctr038Action thisAction) {
		try {
		} catch (Exception e) {
			logger.error("Error", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

	/**
	 * M�todo que se llama al inicio de este flujo. En ella cargamos todos los
	 * campos de la p�liza seleccionada.
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_form(HttpServletRequest request, Axisctr038Action thisAction) {

		logger.debug("Axisctr038Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);

		List cuentas = new ArrayList();
		Map c;
		BigDecimal SSEGURO = getCampoNumerico(request, "SSEGURO");
		String recargar = getCampoTextual(request, "RECARGAR");
		request.getSession().setAttribute("SSEGURO", SSEGURO);

		// TODO: NRIESGO SIEMPRE SER� 1
		BigDecimal NRIESGO = new BigDecimal("1");
		// TODO: CCAUSIN siempre ser� 4
		BigDecimal CCAUSIN = new BigDecimal("4");

		Map objetoPantalla = new HashMap();

		try {

			// Obtenemos fecha actual
			// Date FECHA_ACTUAL = (Date)fcGetFechaActual();
			Date FECHA_ACTUAL = AxisBaseService.stringToSqlDate(getCampoTextual(request, "FECHA"));
			logger.debug("DATA 0 :: " + getCampoTextual(request, "FECHA"));
			logger.debug("DATA 1 :: " + FECHA_ACTUAL);
			if (isEmpty(FECHA_ACTUAL))
				FECHA_ACTUAL = (Date) fcGetFechaActual();
			;

			if ("true".equals(getCampoTextual(request, "BORRAR"))) {
				logger.debug("borra");
				Object[] keySet = formdata.keySet().toArray();
				for (int i = 0; i < keySet.length; i++) {
					logger.debug("keyset :: " + keySet[i]);
					formdata.remove(keySet[i]);
				}
				formdata.put("SSEGURO", SSEGURO);
				formdata.put("NRIESGO", NRIESGO);
				formdata.put("FECHA_ACTUAL", FECHA_ACTUAL);

				request.getSession().removeAttribute("axisctr_asegurados");
				request.getSession().removeAttribute("axisctr_tomadores");

			}

			try {
				this.cargarcombos(request, thisAction, SSEGURO);
			} catch (Exception e) {
				logger.error("Error", e);
				thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
			}

			if (SSEGURO != null) {
				BigDecimal inicializa = this.dbInicializaPoliza(request, usuario, SSEGURO);

				if (inicializa.intValue() == 0) {
					PAC_IAX_PARAM pac_iax_param = new PAC_IAX_PARAM(
							(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
					Map m = pac_iax_param.ejecutaPAC_IAX_PARAM__F_PAREMPRESA_N("FCARPRO_AXISCTR038",
							usuario.getCempres());
					tratarRETURNyMENSAJES(request, m);
					logger.debug("return ejecutaPAC_IAX_PARAM__F_PAREMPRESA_N: " + m);
					formdata.put("FCARPRO_AXISCTR038", m.get("RETURN"));
					Map datPolizaReturn = this.dbGetDatPoliza(request, usuario, SSEGURO);

					if (!isEmpty(datPolizaReturn)) {

						AbstractDispatchAction.topPila(request, "SPRODUC", datPolizaReturn.get("SPRODUC"));
						objetoPantalla.putAll(datPolizaReturn);
					}

					// Obtenemos el combo garantias
					m_obtener_lista_garantias(request, thisAction);

					this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));

					HashMap configform = (HashMap) request.getAttribute(Constantes.CONFIGFORM);
					logger.debug("congigform : " + configform);

					BigDecimal SPRODUC = (BigDecimal) AbstractDispatchAction.topPila(request, "SPRODUC");

					List asegurados = (List) tratarRETURNyMENSAJES(request,
							dbLeeAsegurados(request, usuario, NRIESGO, SPRODUC));
					List tomadores = (List) tratarRETURNyMENSAJES(request, dbLeeTomadores(request, usuario));
					Map gestion = (Map) tratarRETURNyMENSAJES(request, dbLeeDatosGestion(request, usuario));
					Map economicos = this.dbGetDatosEconomicos(request, usuario, SSEGURO, NRIESGO, FECHA_ACTUAL);
					// Map simulacion =
					// (Map)this.dbGetValorSimulacion(request,usuario,SSEGURO,NRIESGO,FECHA_ACTUAL,null,null)
					// ;

					// BigDecimal SPERSON = this.dbGetSperson(request,usuario);

					// if(SPERSON!=null){
					// cuentas =
					// (List)tratarRETURNyMENSAJES(request,dbGetCuentasBancarias(request,usuario,SPERSON,null,null));
					// c = dbGetCuTmador(request, usuario);
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
					logger.debug("sp::" + datPolizaReturn.get("SPERTOM"));
					if (isEmpty(configform.get("axisctr038__BT_BUSCARHOST__visible"))
							&& !isEmpty(configform.get("axisctr038__BT_BUSCAR__visible"))) {
						// if (configform.get("axisctr038__PRCAPGARAN__visible").equals(true)){
						c = new HashMap();
						c = new PAC_IAX_PRODUCCION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
								.ejecutaPAC_IAX_PRODUCCION__F_GET_CCC_HOST(AxisBaseService.stringToBigDecimal(
										String.valueOf(datPolizaReturn.get("SPERTOM"))), null, "SEG");
						logger.debug("ejecutaPAC_IAX_PRODUCCION__F_GET_CCC_HOST()" + c);

					} else
						c = dbGetCuTmador(request, usuario);

					if (isEmpty(c.get("RETURN")))
						c = dbGetCuTmador(request, usuario);

					if (!isEmpty(c)) {
						cuentas = (List) tratarRETURNyMENSAJES(request, c);

						// }

					}

					List tipos_cuentas = (List) tratarRETURNyMENSAJES(request, dbGetTiposCuentas(request, usuario));

					Map map = new PAC_IAX_SUP_FINAN((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
							.ejecutaPAC_IAX_SUP_FINAN__F_GET_APORTANTES(SSEGURO);
					logger.debug("DATOS APORTANTES  axisctr038---------------------------------------->" + map);
					// formdata.put("tipo_aport", (List) tratarRETURNyMENSAJES(request, map));

					/*
					 * BigDecimal CTIPAPOR = getCampoNumerico(request, "CTIPAPOR");
					 * logger.debug("CTIPAPOR --------------> "+CTIPAPOR);
					 */

					List tipo_aport = (List) tratarRETURNyMENSAJES(request, map);
					formdata.put("tipo_aport", tipo_aport);

					/*
					 * if (!isEmpty(tipo_aport)) { int index = 0; Iterator it =
					 * tipo_aport.iterator(); while (it.hasNext()) { Map e = (Map)it.next();
					 * logger.debug("e.get(CDEFECTO)--------------------->"+e.get("CDEFECTO"));
					 * BigDecimal cdefecto = (BigDecimal)e.get("CDEFECTO"); if (
					 * cdefecto.compareTo(BigDecimal.ONE)==0) {
					 * logger.debug("e.get(CATRIBU)--------------------->"+e.get("CATRIBU"));
					 * formdata.put("CTIPAPOR",e.get("CATRIBU")); } index=index+1; } }
					 * 
					 * BigDecimal CTIPAPOR2 = getCampoNumerico(request, "CTIPAPOR");
					 * logger.debug("CTIPAPOR2 --------------> "+CTIPAPOR2);
					 */

					map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
							.ejecutaPAC_IAX_LISTVALORES__F_GET_TIPOCOBRO();
					logger.debug(map);
					List tipoCobro = (List) tratarRETURNyMENSAJES(request, map);
					// opcionesDatosGestion.put("tipoCobro", tipoCobro);
					request.getSession().setAttribute("tipoCobro", tipoCobro);

					if (!isEmpty(gestion))
						objetoPantalla.putAll(gestion);

					if (!isEmpty(economicos))
						objetoPantalla.putAll(economicos);
					// if (!isEmpty(simulacion))
					// objetoPantalla.putAll(simulacion);

					// guardamos datos
					request.getSession().setAttribute("axisctr_asegurados",
							((asegurados == null) ? new ArrayList() : asegurados));
					request.getSession().setAttribute("axisctr_tomadores",
							((tomadores == null) ? new ArrayList() : tomadores));
					request.getSession().setAttribute("axisctr_cuentas",
							((cuentas == null) ? new ArrayList() : cuentas));
					request.getSession().setAttribute("axisctr_tipos_cuentas",
							((tipos_cuentas == null) ? new ArrayList() : tipos_cuentas));
					formdata.putAll(objetoPantalla);

				}
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr038Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}

		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));

	}

	/*********************************************************************************************************************/
	/************************************************
	 * M�TODOS DE ACTUALIZACI�N
	 *******************************************/
	/*********************************************************************************************************************/

	/**
	 * 
	 */

	public void m_obtener_lista_garantias(HttpServletRequest request, Axisctr038Action thisAction) {

		logger.debug("Axisctr038Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);

		try {

			BigDecimal SPRODUC = (BigDecimal) AbstractDispatchAction.topPila(request, "SPRODUC");
			BigDecimal CEMPRES = (BigDecimal) usuario.getCempres();
			BigDecimal CIDIOMA = (BigDecimal) usuario.getCidioma();
			BigDecimal NRIESGO = getCampoNumerico(request, "NRIESGO");
			if (NRIESGO == null)
				NRIESGO = (BigDecimal) AbstractDispatchAction.topPila(request, "NRIESGO");

			Map m = new PAC_IAXPAR_PRODUCTOS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAXPAR_PRODUCTOS__F_INICIALIZA(SPRODUC, null, CEMPRES, CIDIOMA, null, null, null);
			tratarRETURNyMENSAJES(request, m);
			Map activi = new PAC_IAXPAR_PRODUCTOS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAXPAR_PRODUCTOS__P_SET_PRODACTIVITI(new BigDecimal("0"));
			tratarRETURNyMENSAJES(request, activi);
			Map mapa_garan = new PAC_IAXPAR_PRODUCTOS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAXPAR_PRODUCTOS__F_GET_GARANTIAS(NRIESGO);
			ArrayList lista_garan = (ArrayList) tratarRETURNyMENSAJES(request, mapa_garan);

			ArrayList listaGarantias = new ArrayList();

			for (int i = 0; i < lista_garan.size(); i++) { // recorremos la totalidad de garant�as para descartar las
															// que no interesan

				Map mapa = (Map) ((Map) lista_garan.get(i)).get("OB_IAXPAR_GARANTIAS");
				HashMap valores = new HashMap();
				BigDecimal CTIPO = (BigDecimal) mapa.get("CTIPO"); // S�lo escogemos las garant�as del tipo 4 y 12
				if (CTIPO.intValue() == 4 || CTIPO.intValue() == 12) {
					valores.put("CGARANT", (BigDecimal) mapa.get("CGARANT"));
					valores.put("DESCRIPCION", mapa.get("DESCRIPCION"));
					listaGarantias.add(valores);
				}

				request.getSession().setAttribute("listaGarantias",
						((listaGarantias == null) ? new ArrayList() : listaGarantias));

			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr038Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}

		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));

	}

	/**
	 * M�todo que se encarga de la actualizaci�n de la pantalla y su posterior
	 * recalculo de primas en funci�n de la aportaci�n introducida
	 * 
	 * 
	 * @param request
	 * @param thisAction
	 */

	public void m_tarifar(HttpServletRequest request) {
		logger.debug("Axisctr038Service m_emitirPropuesta");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();

		try {

			BigDecimal SSEGURO = getCampoNumerico(request, "SSEGURO");
			BigDecimal NRIESGO = getCampoNumerico(request, "NRIESGO");
			// Date FECHA_ACTUAL = (Date)fcGetFechaActual();
			Date FECHA_ACTUAL = AxisBaseService.stringToSqlDate(getCampoTextual(request, "FECHA"));
			BigDecimal IMPORTE = getCampoNumerico(request, "IMPORTE");
			BigDecimal GARANTIA = getCampoNumerico(request, "GARANTIA1");
			BigDecimal GARANPRU = getCampoNumerico(request, "GARANTIA");

			logger.debug("GARAN_PRUU ---------------------> " + GARANPRU);

			logger.debug("Datos TARIFAR nriesgo - importe - sseguro - garantia:" + NRIESGO + "-" + IMPORTE + "-"
					+ SSEGURO + "-" + FECHA_ACTUAL + "-" + GARANTIA);
			Map map = this.dbTarifar(request, usuario, SSEGURO, NRIESGO, FECHA_ACTUAL, IMPORTE, GARANTIA);
			// BigDecimal resultado = (BigDecimal)ajax.rellenarPlAContenedorAjax (map);
			// logger.debug(resultado);
			// BigDecimal CAPGARAN = (BigDecimal)map.get("AECAPGARAN");
			BigDecimal CAPGARAN = (BigDecimal) map.get("CAPITALGARAN");
			// Map analizar = (Map)tratarRETURNyMENSAJES(request,map);
			// if(analizar!=null){
			ajax.rellenarPlAContenedorAjax(map, new String[] { "CAPITAL" });
			// }
			// ajax.guardarErrorAContenedorAjax("ERROR");

			/* Rellenar CAPGARAN a contenedor AJAX */
			Map CAPITAL = new HashMap();
			CAPITAL.put("CAPITAL", CAPGARAN);
			List RESULTADO = new ArrayList();
			RESULTADO.add(CAPITAL);
			ajax.guardarContenidoFinalAContenedorAjax(RESULTADO);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr38Service - m�todo m_aceptar", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	/*********************************************************************************************************************/
	/**************************************************
	 * M�TODOS DE NAVEGACI�N
	 ********************************************/
	/*********************************************************************************************************************/

	/**
	 * Guarda la pantalla, realiza su validaci�n y determina la siguiente pantalla a
	 * ejecutar.
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_aceptar(HttpServletRequest request, AbstractDispatchAction thisAction) {
		AESUtil encryptedVal = new AESUtil();
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);

		AjaxContainerService ajax = new AjaxContainerService();

		try {
			// ini bug 0019412
			HashMap m = this.f_Get_Avisos(request, this.whoami(this));
			BigDecimal pRETURN = (BigDecimal) this.tratarRETURNyMENSAJES(request, m);
			request.setAttribute("PLSTAVISOS", m.get("PLSTAVISOS"));
			logger.debug("avisos pRETURN = " + pRETURN.intValue());

			if (pRETURN != null && pRETURN.intValue() == 1) {
				ajax.rellenarPlAContenedorAjax(m);
				// fin bug 0019412
			} else {
				String CUENTA = getCampoTextual(request, "CBANCAR");
				BigDecimal encrypt_CBANCAR = getCampoNumerico(request, "encrypt_CBANCAR");
				BigDecimal TIPO = getCampoNumerico(request, "CTIPBAN");
				BigDecimal SSEGURO = getCampoNumerico(request, "SSEGURO");
				BigDecimal NRIESGO = getCampoNumerico(request, "NRIESGO");
				BigDecimal GARANTIA = getCampoNumerico(request, "GARANTIA1");
				BigDecimal TIPBAN = getCampoNumerico(request, "TIPBAN");
				BigDecimal CTIPAPOR = getCampoNumerico(request, "CTIPAPOR");
				BigDecimal SPERSON = getCampoNumerico(request, "SPERSON");
				// Date FECHA_ACTUAL = (Date)fcGetFechaActual();
				Date FECHA_ACTUAL = AxisBaseService.stringToSqlDate(getCampoTextual(request, "FECHA"));
				BigDecimal IMPORTE = getCampoNumerico(request, "IMPORTE");
				logger.debug("Datos ACEPTAR nriesgo - importe - sseguro - tipo - ctipapor - sperson :" + NRIESGO + "-"
						+ IMPORTE + "-" + SSEGURO + "-" + TIPO + "-" + TIPBAN + "-" + CTIPAPOR + "-" + SPERSON);

				/*
				 * if (!isEmpty(encrypt_CBANCAR) && !isEmpty(CUENTA) &&
				 * encrypt_CBANCAR.intValue() == 1) { CUENTA = encryptedVal.decrypt(CUENTA);
				 * logger.debug("[CUENTA] Desencriptada: " + CUENTA); }
				 */

				if (!isEmpty(CUENTA)) {
					String[] CBANCAR_S = CUENTA.split("@@");
					CUENTA = CBANCAR_S[0];
					logger.debug("PRU CBANCAR ---------------------------> " + CUENTA);
					if (!isEmpty(encrypt_CBANCAR) && encrypt_CBANCAR.intValue() == 1) {
						CUENTA = encryptedVal.decrypt(CUENTA);
						logger.debug("DESCRYPTED CBANCAR ---------------------------> " + CUENTA);
					}
				}

				BigDecimal ccc = new BigDecimal("0");
				// Validamos que el n�mero de cuenta sea correcto
				if (TIPO.intValue() != 0) {
					Map resultado = this.dbAceptar(request, usuario, TIPO, CUENTA);
					ccc = (BigDecimal) ajax.rellenarPlAContenedorAjax(resultado);
				}

				logger.debug("TIPBAN: " + TIPBAN + " CTIPBAN :" + TIPO);

				if (BigDecimal.ZERO.equals(ccc)) {

					Map resultado_final = this.dbFinalizar(request, usuario, SSEGURO, NRIESGO, FECHA_ACTUAL, IMPORTE,
							((TIPO.intValue() == 0) ? TIPBAN : TIPO), CUENTA, GARANTIA, CTIPAPOR, SPERSON);

					logger.debug(resultado_final);

					// Esto rellenar� los MENSAJES en pantalla, as� que no nos preocupamos de si el
					// RETURN es 0 � 1
					ajax.rellenarPlAContenedorAjax(resultado_final, new String[] { "OSSEGURO" });

					/* Rellenar SSEGURO a contenedor AJAX */
					Map OSSEGURO = new HashMap();
					OSSEGURO.put("OSSEGURO", SSEGURO);
					Map ERROR = new HashMap();
					ERROR.put("ERROR", resultado_final.get("RETURN"));

					List RESULTADO = new ArrayList();
					RESULTADO.add(OSSEGURO);
					RESULTADO.add(ERROR);

					ajax.guardarContenidoFinalAContenedorAjax(RESULTADO);

				}
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr38Service - m�todo m_aceptar", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}

	}

	/**
	 * Guarda la pantalla, realiza su validaci�n y determina la siguiente pantalla a
	 * ejecutar.
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_recargar(HttpServletRequest request, AbstractDispatchAction thisAction) {
		logger.debug("axisctr038 m_recargar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);

		AjaxContainerService ajax = new AjaxContainerService();

		try {

			BigDecimal IMPORTE = getCampoNumerico(request, "IMPORTE");
			logger.debug("Datos ACEPTAR nriesgo - importe - sseguro - tipo:" + IMPORTE);
			BigDecimal ccc = new BigDecimal("0");
			/* Rellenar SSEGURO a contenedor AJAX */
			/*
			 * NumberFormat nf = NumberFormat.getInstance(new
			 * Locale(ConversionUtil.getDefaultLocale())); nf.setMinimumFractionDigits(2);
			 * nf.setMaximumFractionDigits(2);
			 */
			Map IMPORTEmap = new HashMap();
			IMPORTEmap.put("IMPORTE", IMPORTE);

			List RESULTADO = new ArrayList();
			RESULTADO.add(IMPORTEmap);
			ajax.guardarContenidoFinalAContenedorAjax(RESULTADO);

			// ajax.rellenarPlAContenedorAjax(resultado_final);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr38Service - m�todo m_recargar", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}

	}

	/**
	 * Guarda la pantalla, realiza su validaci�n y determina la pantalla anterior a
	 * ejecutar.
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_anterior(HttpServletRequest request, AbstractDispatchAction thisAction) {

	}

	/**
	 * M�todo que llama a la funci�n pl correspondiente para cargar los datos de una
	 * p�liza seleccionada.
	 * 
	 * @param request
	 * @param usuario
	 * @param SSEGURO
	 * @return
	 * @throws Exception
	 */
	private Map dbGetDatPoliza(HttpServletRequest request, UsuarioBean usuario, BigDecimal SSEGURO) throws Exception {
		Map m = new PAC_IAX_PRODUCCION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_PRODUCCION__F_GET_DATPOLIZA(SSEGURO);
		logger.debug("PRIMERA PARTE DE LA PANTALLA axisctr038---------------------------------------->" + m);
		return (Map) tratarRETURNyMENSAJES(request, m);
	}

	private Map dbGetCuTmador(HttpServletRequest request, UsuarioBean usuario) throws Exception {
		Map m = new PAC_IAX_PRODUCCION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_PRODUCCION__F_GET_TOMADORCCC();
		logger.debug("PRIMERA PARTE DE LA PANTALLA axisctr038---------------------------------------->" + m);
		return m;
	}

	/**
	 * M�todo que llama a la funci�n pl correspondiente para cargar los ASEGURADOS
	 * de una p�liza seleccionada.
	 * 
	 * @param request
	 * @param usuario
	 * @param SSEGURO
	 * @param NRIESGO
	 * @param FECHA   ACTUAL
	 * @return
	 * @throws Exception
	 */
	private Map dbGetDatosEconomicos(HttpServletRequest request, UsuarioBean usuario, BigDecimal SSEGURO,
			BigDecimal NRIESGO, Date FECHA) throws Exception {
		Map map;
		map = new PAC_IAX_DATOSCTASEGURO((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_DATOSCTASEGURO__F_OBTDATECON(SSEGURO, NRIESGO, FECHA);
		logger.debug("OBTIENE DATOS ECONOMICOS axisctr038---------------------------------------->" + map);
		return (Map) tratarRETURNyMENSAJES(request, map);
	}

	/**
	 * M�todo que llama a la funci�n pl correspondiente para cargar los ASEGURADOS
	 * de una p�liza seleccionada.
	 *
	 * @param request
	 * @param usuario
	 * @param SPERSON
	 * @param CEMPRES
	 * @param CAGENTE
	 * @return
	 * @throws Exception
	 */
	/*
	 * private BigDecimal dbEstCuentasBancarias(HttpServletRequest request,
	 * UsuarioBean usuario, BigDecimal SPERSON, BigDecimal CEMPRES, BigDecimal
	 * CAGENTE) throws Exception{ Map map; map = new
	 * PAC_IAX_PERSONA((java.sql.Connection)request.getAttribute(Constantes.DB01CONN
	 * )).ejecutaPAC_IAX_PERSONA__F_GET_ESTCUENTASBANCARIAS(SPERSON,CEMPRES,CAGENTE)
	 * ; logger.
	 * debug("CUENTAS BANCARIAS  axisctr038---------------------------------------->"
	 * +map); return (BigDecimal)tratarRETURNyMENSAJES (request, map); }
	 */

	/**
	 * Lee los asegurados de la p�liza.
	 * 
	 * @param usuario
	 * @return
	 * @throws Exception
	 */
	protected Map dbLeeAsegurados(HttpServletRequest request, UsuarioBean usuario, BigDecimal NRIESGO,
			BigDecimal SPRODUC) throws Exception {
		Map map = new PAC_IAX_PRODUCCION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_PRODUCCION__F_LEEASEGURADOS(NRIESGO, SPRODUC);
		logger.debug("DATOS ASEGURADOS  axisctr038---------------------------------------->" + map);
		return map;
	}

	/**
	 * Lee los datos gestion de la poliza
	 * 
	 * @param usuario
	 * @return
	 * @throws Exception
	 */
	protected Map dbLeeDatosGestion(HttpServletRequest request, UsuarioBean usuario) throws Exception {
		Map map = new PAC_IAX_PRODUCCION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_PRODUCCION__F_LEEDATOSGESTION();
		logger.debug("DATOS GESTION POLIZA  axisctr038---------------------------------------->" + map);
		return map;
	}

	/**
	 * Lee los datos gestion de la poliza
	 * 
	 * @param usuario
	 * @return
	 * @throws Exception
	 */
	/*
	 * protected Map dbGetCuentasBancarias(HttpServletRequest request, UsuarioBean
	 * usuario, BigDecimal SPERSON, BigDecimal CEMPRES, BigDecimal CAGENTE) throws
	 * Exception{ Map map = new
	 * PAC_IAX_PERSONA((java.sql.Connection)request.getAttribute(Constantes.DB01CONN
	 * )).ejecutaPAC_IAX_PERSONA__F_GET_ESTCUENTASBANCARIAS(SPERSON,CEMPRES,CAGENTE)
	 * ; logger.
	 * debug("DATOS CUENTAS BANCARIAS  axisctr038---------------------------------------->"
	 * +map); return map; }
	 */

	/**
	 * Lee los datos gestion de la poliza
	 * 
	 * @param usuario
	 * @return
	 * @throws Exception
	 */
	protected Map dbGetTiposCuentas(HttpServletRequest request, UsuarioBean usuario) throws Exception {
		Map map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTTIPOCUENTA();
		logger.debug("DATOS CUENTAS BANCARIAS  axisctr038---------------------------------------->" + map);
		return map;
	}

	/**
	 * Inicializa los datos de la p�liza
	 * 
	 * @param usuario
	 * @param SSEGURO
	 * @return
	 * @throws Exception
	 */
	protected BigDecimal dbInicializaPoliza(HttpServletRequest request, UsuarioBean usuario, BigDecimal SSEGURO)
			throws Exception {
		Map map = new PAC_IAX_PRODUCCION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_PRODUCCION__F_SET_CONSULTAPOLIZA(SSEGURO);
		logger.debug("CUENTAS BANCARIAS  axisctr038---------------------------------------->" + map);
		return (BigDecimal) tratarRETURNyMENSAJES(request, map);
	}

	protected Map dbAceptar(HttpServletRequest request, UsuarioBean usuario, BigDecimal TIPO, String CUENTA)
			throws Exception {
		Map m = new PAC_IAX_PERSONA((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_PERSONA__F_VALIDACCC(TIPO, CUENTA);
		return m;
	}

	protected Map dbFinalizar(HttpServletRequest request, UsuarioBean usuario, BigDecimal SSEGURO, BigDecimal NRIESGO,
			Date FECHA_ACTUAL, BigDecimal IMPORTE, BigDecimal TIPO, String CUENTA, BigDecimal GARANTIA,
			BigDecimal CTIPAPOR, BigDecimal SPERSON) throws Exception {
		// Map m = new
		// PAC_IAX_SUP_FINAN((java.sql.Connection)request.getAttribute(Constantes.DB01CONN)).ejecutaPAC_IAX_SUP_FINAN__F_TARIF_APORT_EXTRAORDINARIA(SSEGURO,NRIESGO,FECHA_ACTUAL,IMPORTE);
		logger.debug("LLAMARDBFINALIZAR" + TIPO);
		Map m = new PAC_IAX_SUP_FINAN((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_SUP_FINAN__F_APORTACION_EXTRAORDINARIA(SSEGURO, NRIESGO, FECHA_ACTUAL, IMPORTE, TIPO,
						CUENTA, GARANTIA, CTIPAPOR, SPERSON);
		return m;
	}

	/**
	 * M�todo que devuelve el SPERSON del primero de los tomadores
	 * 
	 * @param request
	 * @param usuario
	 * @return
	 * @throws Exception
	 */
	private BigDecimal dbGetSperson(HttpServletRequest request, UsuarioBean usuario) throws Exception {
		Map map = new PAC_IAX_PRODUCCION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_PRODUCCION__F_LEETOMADORES();
		logger.debug("RECUPERA SPERSON  axisctr038---------------------------------------->" + map);
		List lista_tomadores = (List) tratarRETURNyMENSAJES(request, map);
		if (!isEmpty(lista_tomadores)) {
			return (BigDecimal) ((Map) ((Map) lista_tomadores.get(0)).get("OB_IAX_TOMADORES")).get("SPERSON");
		} else {
			return null;
		}

	}

	/**
	 * M�todo que devuelve el SPERSON del primero de los tomadores
	 * 
	 * @param request
	 * @param usuario
	 * @return
	 * @throws Exception
	 */
	private Map dbLeeTomadores(HttpServletRequest request, UsuarioBean usuario) throws Exception {
		Map map = new PAC_IAX_PRODUCCION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_PRODUCCION__F_LEETOMADORES();
		logger.debug("RECUPERA TOMADORES axisctr038---------------------------------------->" + map);
		return map;

	}

	/**
	 * Lee los datos de la simulacion
	 * 
	 * @param usuario
	 * @return
	 * @throws Exception
	 */
	private Map dbTarifar(HttpServletRequest request, UsuarioBean usuario, BigDecimal SSEGURO, BigDecimal NRIESGO,
			java.sql.Date FECHA_ACTUAL, BigDecimal IMPORTE, BigDecimal GARANTIA) throws Exception {
		Map map = new PAC_IAX_SUP_FINAN((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_SUP_FINAN__F_TARIF_APORT_EXTRAORDINARIA(SSEGURO, NRIESGO, FECHA_ACTUAL, IMPORTE,
						GARANTIA);
		logger.debug("DATOS GESTION POLIZA  axisctr038---------------------------------------->" + map);
		return map;
	}

	/**
	 * Lee los datos de la simulacion
	 * 
	 * @param usuario
	 * @return
	 * @throws Exception
	 */
	protected Map dbGetValorSimulacion(HttpServletRequest request, UsuarioBean usuario, BigDecimal SSEGURO,
			BigDecimal NRIESGO, Date FECHA_ACTUAL, BigDecimal IMPORTE, BigDecimal CCAUSIN) throws Exception {
		Map map = new PAC_IAX_RESCATES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_RESCATES__F_VALOR_SIMULACION(SSEGURO, NRIESGO, FECHA_ACTUAL, IMPORTE, CCAUSIN);
		logger.debug("DATOS GESTION POLIZA  axisctr038---------------------------------------->" + map);
		return map;
	}

	/**
	 * Lee los datos de la simulacion
	 * 
	 * @param usuario
	 * @return
	 * @throws Exception
	 */
	private Date fcGetFechaActual() throws Exception {

		java.util.Date today = new java.util.Date();
		java.sql.Date FECHA_ACTUAL = new java.sql.Date(today.getTime());
		return FECHA_ACTUAL;

	}

	/**
	 * Funci�n que nos compara dos fechas
	 * 
	 * @param usuario
	 * @return
	 * @throws Exception
	 */
	public static Integer compararFechas(java.lang.Object d1, java.lang.Object d2) {
		try {
			if (isEmpty(d1) || isEmpty(d2))
				return null;

			java.sql.Date sqldate1;
			java.sql.Date sqldate2;

			if (d1 instanceof java.util.Date)
				sqldate1 = new java.sql.Date(((java.util.Date) d1).getTime());
			else if (d1 instanceof java.sql.Date)
				sqldate1 = (java.sql.Date) d1;
			else
				sqldate1 = AxisBaseService.stringToSqlDate(String.valueOf(d1));

			if (d2 instanceof java.util.Date)
				sqldate2 = new java.sql.Date(((java.util.Date) d2).getTime());
			else if (d2 instanceof java.sql.Date)
				sqldate2 = (java.sql.Date) d2;
			else
				sqldate2 = AxisBaseService.stringToSqlDate(String.valueOf(d2));

			return sqldate1.compareTo(sqldate2);

		} catch (Exception e) {
			logger.error("Error al comparar Fechas:: " + e.getMessage(), e);
			return null;
		}
	}

	public void m_ajax_cargar_cuentas_tomadorAXIS(HttpServletRequest request) {
		logger.debug("Axisctr038Service m_ajax_cargar_cuentas_tomador");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();
		try {

			SPERSON = getCampoNumerico(request, "SPERSON");
			logger.debug("SPERSON : -----------------> " + SPERSON);

			BigDecimal SSEGURO = (BigDecimal) AbstractDispatchAction.topPila(request, "SSEGURO");
			Map map1 = new PAC_IAX_PRODUCCION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_PRODUCCION__TRASPASO_CCC(SSEGURO, null, SPERSON);
			logger.debug("ejecutaPAC_IAX_PRODUCCION__traspasoccc()" + map1);
			Map map = new PAC_IAX_PRODUCCION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_PRODUCCION__F_GET_TOMADORCCC();
			logger.debug("ejecutaPAC_IAX_PRODUCCION__F_GET_TOMADORCCC()" + map);
			if (!isEmpty(map)) {
				List cuentasTomador = (List) ajax.rellenarPlAContenedorAjax(map);
				ajax.guardarContenidoFinalAContenedorAjax(cuentasTomador);
			}
			request.getSession().removeAttribute("cargaHost");
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr038Service - m�todo m_ajax_cargar_cuentas_tomador", e);
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
		logger.debug("Axisctr038Service m_ajax_cargar_cuentas_HOST");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();
		try {

			SPERSON = getCampoNumerico(request, "SPERSON");
			SNIP = getCampoTextual(request, "SNIP");

			logger.debug("SPERSON : -----------------> " + SPERSON);

			Map map = new PAC_IAX_PRODUCCION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_PRODUCCION__F_GET_CCC_HOST(SPERSON, SNIP, "SEG");
			logger.debug("ejecutaPAC_IAX_PRODUCCION__F_GET_CCC_HOST()" + map);
			if (!isEmpty(map)) {
				List cuentasTomador = (List) ajax.rellenarPlAContenedorAjax(map);

				request.getSession().setAttribute("cargaHost", "0");
				ajax.guardarContenidoFinalAContenedorAjax(cuentasTomador);
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr038Service - m�todo m_ajax_cargar_cuentas_HOST", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	public void m_ajax_actualizar_persona(HttpServletRequest request, Axisctr038Action thisAction) {
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

	public void m_ajax_actualizar_aportante(HttpServletRequest request, Axisctr038Action thisAction) {
		logger.debug("Axisctr038Service m_ajax_actualizar_aportante");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		AjaxContainerService ajax = new AjaxContainerService();

		try {

			BigDecimal CTIPAPOR = this.getCampoNumerico(request, "CTIPAPOR");
			BigDecimal SSEGURO = this.getCampoNumerico(request, "SSEGURO");

			logger.debug("CTIPAPOR ACTUALIZAR ----------------------> " + CTIPAPOR);
			logger.debug("SSEGURO ACTUALIZAR ----------------------> " + SSEGURO);

			Map map1 = new PAC_IAX_SUP_FINAN((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_SUP_FINAN__F_GET_INFOAPORTANTE(CTIPAPOR, SSEGURO);

			logger.debug("M_ajax_actualizar_aportante  axisctr038---------------------------------------->" + map1);

			tratarRETURNyMENSAJES(request, map1);

			if (!isEmpty(map1.get("PSPERAPOR"))) {

				BigDecimal SPERSON = (BigDecimal) map1.get("PSPERAPOR");
				BigDecimal CAGENTE = (BigDecimal) map1.get("PCAGENTE");

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
			}

		} catch (Exception e) {
			logger.error("Axisctr038Service m_ajax_actualizar_aportante - Excepcion", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	public void m_actualiza_evoluprov(HttpServletRequest request, AbstractDispatchAction thisAction) {
		logger.debug("Axisctr038Service m_actualiza_evoluprov");
		AjaxContainerService ajax = new AjaxContainerService();

		try {
			UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
			Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
			String TABLA = "";

			PAC_IAX_OBTENERDATOS pac_iax_obtenerdatos = new PAC_IAX_OBTENERDATOS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			BigDecimal PSSEGURO = this.getHiddenCampoNumerico(request, "PSSEGURO");
			if (PSSEGURO == null)
				PSSEGURO = (BigDecimal) AbstractDispatchAction.topPila(request, "SSEGURO");// getCampoNumerico(request,"SSEGURO");
			BigDecimal PNESCENA = this.getHiddenCampoNumerico(request, "PNESCENA");// getCampoNumerico(request,
																					// "ESCENA");
			if (PNESCENA == null) {
				if (!isEmpty(PSSEGURO)) {
					Map mesce = pac_iax_obtenerdatos.ejecutaPAC_IAX_OBTENERDATOS__F_LEEEVOLUPROVMATSEG_MINSCEN(PSSEGURO,
							TABLA);
					BigDecimal minesce = (BigDecimal) tratarRETURNyMENSAJES(request, mesce, false);
					PNESCENA = minesce;
				}
			}
			formdata.put("NESCENA", PNESCENA);
			formdata.put("SSEGURO", PSSEGURO);
			// request.getSession().setAttribute("SSEGURO",PSSEGURO);

			if (!isEmpty(PSSEGURO)) {
				Map m = pac_iax_obtenerdatos.ejecutaPAC_IAX_OBTENERDATOS__F_LEEEVOLUPROVMATSEG(PSSEGURO, TABLA,
						PNESCENA);
				List evolu = (List) tratarRETURNyMENSAJES(request, m, false);
				formdata.put("evoluprovmatseg", evolu);
				ajax.guardarContenidoFinalAContenedorAjax(evolu);
			}
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr038Service - m�todo m_actualiza_evoluprov", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
			// this.f_Cargar_Propiedades_Pantalla(request, whoami(Axisctr031Service.class));
		}
	}

	private void cargarcombos(HttpServletRequest request, Axisctr038Action thisAction, BigDecimal PSSEGURO) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		Map listValores = new HashMap();
		/*
		 * BigDecimal SSEGURO=(BigDecimal) AbstractDispatchAction.topPila(request,
		 * "SSEGURO");
		 */
		if (!isEmpty(PSSEGURO)) {
			try {
				if (PSSEGURO != null) {
					PAC_IAX_OBTENERDATOS pac_axis_listValores = new PAC_IAX_OBTENERDATOS(
							(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

					// Escenarios de proyeccion
					Map map = pac_axis_listValores.ejecutaPAC_IAX_OBTENERDATOS__F_LEEEVOLUPROVMATSEG_SCEN(PSSEGURO,
							null);
					listValores.put("tipEscen", (List) tratarRETURNyMENSAJES(request, map, false));
					formdata.put("listValores", listValores);
				}
			} catch (Exception e) {
				logger.error("Error", e);
				thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
			}
		}
	}

}
