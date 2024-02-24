//Revision:# 2Z8GyEcT4g7+mL1dtYD1rg== #
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
import axis.jdbc.PAC_IAX_OBTENERDATOS;
import axis.jdbc.PAC_IAX_PRODUCCION;
import axis.jdbc.PAC_IAX_SUPLEMENTOS;
import axis.jdbc.PAC_IAX_VALIDACIONES;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.model.UsuarioBean;
import axis.util.Constantes;

public class Axisctr008Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

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

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE INICIALIZACION
	 *******************************************/
	/*********************************************************************************************************************/

	/**
	 * Inicializa las cl�usulas y las mete en el objeto de request
	 * axisctr_clausulasDefinidas.
	 * 
	 * @param request    El HttpServletRequest que contiene la petici�n del cliente
	 *                   web.
	 * @param thisAction Una Action abstracta desde donde se ha invocado el servicio
	 *                   (necesaria para el log).
	 */
	public void m_form(HttpServletRequest request, AbstractDispatchAction thisAction) {
		logger.debug("Axisctr008Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {
			Map mapGenPoliza = new HashMap();
			HashMap pol = null;
			String CMODO = (String) AbstractDispatchAction.topPila(request, "CMODO");
			BigDecimal pPCMOTMOV = (BigDecimal) AbstractDispatchAction.topPila(request, "CMOTMOV");
			// Inicializamos las clausulas
			initClausulas(request);
			mapGenPoliza = this.dbLeePoliza(request);
			formdata.put("NPOLIZA", mapGenPoliza.get("NPOLIZA"));

			if (CMODO.equals("ALTA_POLIZA")) {
				PAC_IAX_PRODUCCION pacIaxProduccion = new PAC_IAX_PRODUCCION(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
				pol = pacIaxProduccion.ejecutaPAC_IAX_PRODUCCION__F_GET_DATPOLIZA(null);
				tratarRETURNyMENSAJES(request, pol);
				Map datos_poliza = (Map) pol.get("RETURN");
				BigDecimal sseguro = (datos_poliza.get("SSEGURO") != null) ? (BigDecimal) datos_poliza.get("SSEGURO")
						: null;
				formdata.put("SSEGURO", sseguro);
			}

			if (pPCMOTMOV != null) {
				Map map2 = new PAC_IAX_SUPLEMENTOS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_SUPLEMENTOS__F_GET_DESCMOTMOV(pPCMOTMOV, usuario.getCidioma());
				formdata.put("PTMOTMOV", map2.get("PTMOTMOV"));
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr008Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		if (!isEmpty(request.getAttribute("multiPantalla"))
				&& ((Boolean) request.getAttribute("multiPantalla")).booleanValue()) {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(Axisctr004Service.class));
		}
	}

	/**
	 * Inicializa las cl�usulas y las mete en el objeto de request
	 * axisctr_clausulasDefinidas.
	 * 
	 * @param request El HttpServletRequest que contiene la petici�n del cliente
	 *                web.
	 * @throws Exception
	 */
	private void initClausulas(HttpServletRequest request) throws Exception {
		// Recuperamos formData
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		// Inicializamos los ArrayList de HashMaps de Cl�usulas definidas y espec�ficas
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		PAC_IAX_PRODUCCION pac_axis_produccion = new PAC_IAX_PRODUCCION(
				(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
		PAC_IAXPAR_PRODUCTOS pac_axispar_productos = new PAC_IAXPAR_PRODUCTOS(
				(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
		PAC_IAX_OBTENERDATOS pac_axis_obtenerdatos = new PAC_IAX_OBTENERDATOS(
				(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

		String TCLATEX_t = "";
		String nparam_t = "";

		Map map = pac_axis_produccion.ejecutaPAC_IAX_PRODUCCION__F_GRABAROBJETODB();
		logger.debug("Map de grabarObjeto a DB---------------------------------------->" + map);
		tratarRETURNyMENSAJES(request, map);

		map = pac_axis_produccion.ejecutaPAC_IAX_PRODUCCION__F_GRABAPREGUNTASCLAUSULA();
		logger.debug(map);
		tratarRETURNyMENSAJES(request, map);

		map = pac_axispar_productos.ejecutaPAC_IAXPAR_PRODUCTOS__F_GET_CLAUSULAS();
		// logger.debug("ejecutaPAC_IAXPAR_PRODUCTOS__F_GET_CLAUSULAS devuelve:"+map);
		List clausulasDefinidas = (List) tratarRETURNyMENSAJES(request, map);

		// Leer cl�usulas definidas PROD (seleccionadas)
		map = pac_axis_produccion.ejecutaPAC_IAX_PRODUCCION__F_LEECLAUSULASPROD();
		logger.debug(map);
		List clausulasProd = (List) tratarRETURNyMENSAJES(request, map);
		BigDecimal SSEGURO = (BigDecimal) AbstractDispatchAction.topPila(request, "SSEGURO");
		BigDecimal NRIESGO = isEmpty(AbstractDispatchAction.topPila(request, "NRIESGO")) ? new BigDecimal(1)
				: (BigDecimal) AbstractDispatchAction.topPila(request, "NRIESGO");

		map = pac_axis_obtenerdatos.ejecutaPAC_IAX_OBTENERDATOS__F_GET_EXCLUSIONES(SSEGURO, NRIESGO, "EST");
		List exclusionesundw = (List) tratarRETURNyMENSAJES(request, map);
		if (exclusionesundw != null) {
			formdata.put("exclusionesundw", exclusionesundw);
		}

		// Si hay clausulas para el prodcuto
		if (!isEmpty(clausulasProd)) {
			// Recorrer clausulasProd y realizar un merge en clausulasDefinidas
			for (int i = 0; i < clausulasProd.size(); i++) {
				// Coger el map externo
				Map OB_IAX_CLAUSULAS = (Map) clausulasProd.get(i);
				if (isEmpty(OB_IAX_CLAUSULAS))
					continue;

				// Coger el map interno
				OB_IAX_CLAUSULAS = (Map) OB_IAX_CLAUSULAS.get("OB_IAX_CLAUSULAS");
				if (isEmpty(OB_IAX_CLAUSULAS))
					continue;

				// Recuperamos los SCLAGEN de las cl�usulas PROD.
				BigDecimal SCLAGEN = (BigDecimal) OB_IAX_CLAUSULAS.get("SCLAGEN");
				if (isEmpty(SCLAGEN))
					continue;

				Map clausula = getObjetoDeLista(clausulasDefinidas, bigDecimalToString(SCLAGEN), "SCLAGEN",
						"OB_IAXPAR_CLAUSULAS");
				// Si cparams > 0 Recuperemos en caso de que este informado el nombre
				BigDecimal CPARAMS = (BigDecimal) OB_IAX_CLAUSULAS.get("CPARAMS");
				if ((CPARAMS != null) && (CPARAMS.intValue() > 0)) {
					Map map2 = pac_axis_produccion.ejecutaPAC_IAX_PRODUCCION__F_LEECLAUSULAPROD(SCLAGEN);
					logger.debug("pac_axis_produccion.ejecutaPAC_IAX_PRODUCCION__F_LEECLAUSULAPROD return: " + map2);
					if (clausula != null) {
						ArrayList<HashMap> parametros = (ArrayList) clausula.get("PARAMETROS");
						if (parametros != null) {
							for (HashMap obj : parametros) {
								if (obj.get("OB_IAX_CLAUSUPARA") != null) {
									if (((HashMap) obj.get("OB_IAX_CLAUSUPARA")).get("NPARAME") != null) {
										if (clausula.get("TCLATEX") != null) {
											TCLATEX_t = ((String) clausula.get("TCLATEX"));
											nparam_t = "#" + ((HashMap) obj.get("OB_IAX_CLAUSUPARA")).get("NPARAME")
													+ "#";
											TCLATEX_t = TCLATEX_t.replace(nparam_t,
													getTTEXTOClausual((HashMap) map2,
															(BigDecimal) ((HashMap) obj.get("OB_IAX_CLAUSUPARA"))
																	.get("NPARAME"),
															request));
											clausula.put("TCLATEX", TCLATEX_t);
										}
									}

								}
							}
						}

					}

				}

				// Si existe la cl�usula prod. en la cl�usula IAXPAR, la ponemos a seleccionada
				if (!isEmpty(clausula))
					clausula.put("SELECTEDCLAUSULA", Boolean.valueOf(true));
			}
		}
		// Guardamos las clausulas definidas en el Formdata
		splitClausulas(clausulasDefinidas, request);
		logger.debug("Cl�usulas definidas -> " + formdata.get("axisctr_clausulasDefinidas"));

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////        
		map = pac_axispar_productos.ejecutaPAC_IAXPAR_PRODUCTOS__F_GET_CLAUSULASMULT();
		logger.debug("ejecutaPAC_IAXPAR_PRODUCTOS__F_GET_CLAUSULASMULT devuelve:" + map);
		List clausulasProdMult = (List) tratarRETURNyMENSAJES(request, map);

		BigDecimal SCLAGEN = this.getHiddenCampoNumerico(request, "MultipleSelected");
		// Leer cl�usulas definidas PROD (seleccionadas)
		map = pac_axis_produccion.ejecutaPAC_IAX_PRODUCCION__F_LEECLAUSULASPRODMULT(!isEmpty(SCLAGEN) ? SCLAGEN : null,
				null);
		logger.debug("ejecutaPAC_IAX_PRODUCCION__F_LEECLAUSULASPRODMULT devuelve:" + map);
		List clausulasDefinidasMult = (List) tratarRETURNyMENSAJES(request, map);
		List clausulasProdMultParriba = clausulasProdMult;
		logger.debug("clausulasProdMultParriba:" + clausulasProdMultParriba);
		formdata.put("clausulasProdMult", clausulasProdMultParriba);
		formdata.put("clausulasDefinidasMult",
				!isEmpty(clausulasDefinidasMult) ? clausulasDefinidasMult : new ArrayList());
		// Si hay clausulas para el prodcuto
		/*
		 * if (!isEmpty(clausulasDefinidasMult)) { // Recorrer clausulasDefinidasMult y
		 * realizar un merge en clausulasProdMult for (int i = 0; i <
		 * clausulasDefinidasMult.size(); i++) { // Coger el map externo Map
		 * OB_IAX_CLAUSULAS = (Map) clausulasDefinidasMult.get(i); if (isEmpty
		 * (OB_IAX_CLAUSULAS)) continue;
		 * 
		 * // Coger el map interno OB_IAX_CLAUSULAS = (Map)
		 * OB_IAX_CLAUSULAS.get("OB_IAX_CLAUSULAS"); if (isEmpty (OB_IAX_CLAUSULAS))
		 * continue;
		 * 
		 * // Recuperamos los SCLAGEN de las cl�usulas PROD. BigDecimal SCLAGEN =
		 * (BigDecimal) OB_IAX_CLAUSULAS.get("SCLAGEN"); if (isEmpty(SCLAGEN)) continue;
		 * 
		 * BigDecimal CIDENTITY = (BigDecimal) OB_IAX_CLAUSULAS.get("CIDENTITY"); if
		 * (isEmpty(CIDENTITY)) continue;
		 * 
		 * Map clausulaMult = getObjetoDeLista(clausulasProdMult,
		 * bigDecimalToString(SCLAGEN), "SCLAGEN", "OB_IAXPAR_CLAUSULAS"); //Si cparams
		 * > 0 Recuperemos en caso de que este informado el nombre BigDecimal CPARAMS =
		 * (BigDecimal) OB_IAX_CLAUSULAS.get("CPARAMS"); if
		 * ((CPARAMS!=null)&&(CPARAMS.intValue() > 0)){ Map map2 =
		 * pac_axis_produccion.ejecutaPAC_IAX_PRODUCCION__F_LEECLAUSULAPROD(SCLAGEN);
		 * logger.
		 * debug("pac_axis_produccion.ejecutaPAC_IAX_PRODUCCION__F_LEECLAUSULAPRODMULT return: "
		 * +map2); if (clausulaMult != null){ ArrayList<HashMap> parametros =
		 * (ArrayList)clausulaMult.get("PARAMETROS"); if (parametros!=null){ for
		 * (HashMap obj : parametros){ if (obj.get("OB_IAX_CLAUSUPARA")!=null){ if
		 * (((HashMap)obj.get("OB_IAX_CLAUSUPARA")).get("NPARAME")!=null){ if
		 * (clausulaMult.get("TCLATEX")!=null){ TCLATEX_t =
		 * ((String)clausulaMult.get("TCLATEX")); nparam_t =
		 * "#"+((HashMap)obj.get("OB_IAX_CLAUSUPARA")).get("NPARAME")+"#"; TCLATEX_t =
		 * TCLATEX_t.replace(nparam_t,
		 * getTTEXTOClausual((HashMap)map2,(BigDecimal)((HashMap)obj.get(
		 * "OB_IAX_CLAUSUPARA")).get("NPARAME"), request));
		 * //clausulaMult.put("TCLATEX", TCLATEX_t);
		 * 
		 * } }
		 * 
		 * } } }
		 * 
		 * }
		 * 
		 * }
		 * 
		 * // Si existe la cl�usula prod. en la cl�usula IAXPAR, la ponemos a
		 * seleccionada //if (!isEmpty(clausulaMult)) //
		 * clausulaMult.put("SELECTEDCLAUSULA", Boolean.valueOf(true)); } }
		 */
		// Guardamos las clausulas definidas en el Formdata
		if (!isEmpty(clausulasDefinidasMult)) {
			// splitClausulas(clausulasProdMult, request);
			formdata.put("axisctr_clausulasMultiples",
					!isEmpty(clausulasDefinidasMult) ? clausulasDefinidasMult : new ArrayList());
			logger.debug("Cl�usulas definidas -> " + formdata.get("axisctr_clausulasMultiples"));
		}
		/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

		map = pac_axis_produccion.ejecutaPAC_IAX_PRODUCCION__F_LEECLAUSULASESP(null, "EDICION");
		logger.debug(map);
		// Recuperamos las clausulas especificas y las gurdamos en el FormData
		List clausulasEspecificas = (List) tratarRETURNyMENSAJES(request, map);

		List clausulaAuto = (!isEmpty(formdata.get("axisctr_clausulasAutomaticas")))
				? (ArrayList) formdata.get("axisctr_clausulasAutomaticas")
				: new ArrayList();
		clausulasEspecificas = filterClausulasEsp(clausulasEspecificas, clausulaAuto, request);
		this.getTCLATEXClausualCformatEsp(clausulaAuto, request);
		formdata.put("axisctr_clausulasEspecificas",
				!isEmpty(clausulasEspecificas) ? clausulasEspecificas : new ArrayList());
	}

	private void splitClausulas(List clausulasDefinidas, HttpServletRequest request) throws Exception {
		if (clausulasDefinidas != null) {
			Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
			// Inicializamos los ArrayList de HashMaps de Cl�usulas definidas y espec�ficas
			UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
			PAC_IAX_PRODUCCION pac_axis_produccion = new PAC_IAX_PRODUCCION(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			ArrayList clausulasGeneral = new ArrayList();
			ArrayList clausulasAutomaticas = new ArrayList();
			ArrayList clausulasMultiples = new ArrayList();

			HashMap clausula;
			BigDecimal CTIPO, SCLAGEN, CTIPCLA = null;
			for (int i = 0; i < clausulasDefinidas.size(); i++) {
				clausula = !isEmpty(((HashMap) clausulasDefinidas.get(i)).get("OB_IAXPAR_CLAUSULAS"))
						? (HashMap) (((HashMap) clausulasDefinidas.get(i)).get("OB_IAXPAR_CLAUSULAS"))
						: null;
				SCLAGEN = (BigDecimal) clausula.get("SCLAGEN");
				Map map2 = pac_axis_produccion.ejecutaPAC_IAX_PRODUCCION__F_LEECLAUSULAPROD(SCLAGEN);
				logger.debug("pac_axis_produccion.ejecutaPAC_IAX_PRODUCCION__F_LEECLAUSULAPROD return: " + map2);
				HashMap OB_IAX_CLAUSULA = (HashMap) tratarRETURNyMENSAJES(request, map2);
				logger.debug("OB_IAX_CLAUSULA: " + OB_IAX_CLAUSULA);
				if (OB_IAX_CLAUSULA != null) {
					CTIPO = (BigDecimal) OB_IAX_CLAUSULA.get("CTIPO");
					if (clausula != null) {
						if ((new BigDecimal(2).equals(CTIPO)) || ((new BigDecimal(3).equals(CTIPO)))) {
							clausulasAutomaticas.add(clausulasDefinidas.get(i));
						} else {
							if (new BigDecimal(8).equals(CTIPO))
								clausulasMultiples.add(clausulasDefinidas.get(i));
							else
								clausulasGeneral.add(clausulasDefinidas.get(i));
						}
					}
				} else {
					CTIPO = (BigDecimal) clausula.get("CTIPO");

					if (!(new BigDecimal(2).equals(CTIPO)) && (!(new BigDecimal(3).equals(CTIPO)))) {
						if (new BigDecimal(8).equals(CTIPO))
							clausulasMultiples.add(clausulasDefinidas.get(i));
						else
							clausulasGeneral.add(clausulasDefinidas.get(i));
						;
					}
				}
			}

			logger.debug("clausulasGeneral :" + clausulasGeneral);
			formdata.put("axisctr_clausulasDefinidas", !isEmpty(clausulasGeneral) ? clausulasGeneral : new ArrayList());
			formdata.put("axisctr_clausulasMultiples",
					!isEmpty(clausulasMultiples) ? clausulasMultiples : new ArrayList());
			formdata.put("axisctr_clausulasAutomaticas",
					!isEmpty(clausulasAutomaticas) ? clausulasAutomaticas : new ArrayList());
		}
	}

	private void setCIDENTITY(BigDecimal SCLAGEN, BigDecimal CIDENTITY, List clausulas) {
		if ((clausulas != null) && (clausulas.size() > 0)) {
			Map clausula = getObjetoDeLista(clausulas, bigDecimalToString(SCLAGEN), "SCLAGEN", "OB_IAXPAR_CLAUSULAS");
			if (clausula != null) {
				clausula.put("CIDENTITY", CIDENTITY);
			}
		}
	}

	private void setTCLATEX(BigDecimal SCLAGEN, String TCLATEX, List clausulas) {
		if ((clausulas != null) && (clausulas.size() > 0)) {
			Map clausula = getObjetoDeLista(clausulas, bigDecimalToString(SCLAGEN), "SCLAGEN", "OB_IAXPAR_CLAUSULAS");
			if (clausula != null) {
				clausula.put("TCLATEX", TCLATEX);
			}
		}
	}

	private List filterClausulasEsp(List clausulasEspecificas, List clausulasAuto, HttpServletRequest request)
			throws Exception {
		List clausulas = new ArrayList();
		if (clausulasEspecificas != null) {
			if (!isEmpty(clausulasEspecificas)) {
				for (int i = 0; i < clausulasEspecificas.size(); i++) {
					Map OB_IAX_CLAUSULAS = (Map) clausulasEspecificas.get(i);
					if (isEmpty(OB_IAX_CLAUSULAS))
						continue;
					// Coger el map interno
					OB_IAX_CLAUSULAS = (Map) OB_IAX_CLAUSULAS.get("OB_IAX_CLAUSULAS");
					if (isEmpty(OB_IAX_CLAUSULAS))
						continue;
					// Recuperamos los SCLAGEN de las cl�usulas PROD.
					BigDecimal CTIPO = (BigDecimal) OB_IAX_CLAUSULAS.get("CTIPO");
					if (isEmpty(CTIPO))
						continue;
					if ((!new BigDecimal(2).equals(CTIPO)) && ((!new BigDecimal(3).equals(CTIPO)))) {
						clausulas.add(clausulasEspecificas.get(i));
					} else {
						BigDecimal sclagen = !isEmpty(OB_IAX_CLAUSULAS.get("SCLAGEN"))
								? (BigDecimal) OB_IAX_CLAUSULAS.get("SCLAGEN")
								: null;
						BigDecimal cidentity = !isEmpty(OB_IAX_CLAUSULAS.get("CIDENTITY"))
								? (BigDecimal) OB_IAX_CLAUSULAS.get("CIDENTITY")
								: null;
						setCIDENTITY(sclagen, cidentity, clausulasAuto);
						BigDecimal CPARAMS = !isEmpty(OB_IAX_CLAUSULAS.get("CPARAMS"))
								? (BigDecimal) OB_IAX_CLAUSULAS.get("CPARAMS")
								: new BigDecimal(0);
						if (CPARAMS.intValue() > 0) {
							UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
							// A�adir texto de cl�usula espec�fica
							PAC_IAX_PRODUCCION pac_axis_produccion = new PAC_IAX_PRODUCCION(
									(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
							Map map2 = pac_axis_produccion.ejecutaPAC_IAX_PRODUCCION__F_LEECLAUSULAPROD(sclagen);
							logger.debug(
									"pac_axis_produccion.ejecutaPAC_IAX_PRODUCCION__F_LEECLAUSULAPROD return: " + map2);
							Map clausula = getObjetoDeLista(clausulasAuto, bigDecimalToString(sclagen), "SCLAGEN",
									"OB_IAXPAR_CLAUSULAS");
							if (clausula != null) {
								ArrayList<HashMap> parametros = (ArrayList) clausula.get("PARAMETROS");
								if (parametros != null) {
									for (HashMap obj : parametros) {
										if (obj.get("OB_IAX_CLAUSUPARA") != null) {
											if (((HashMap) obj.get("OB_IAX_CLAUSUPARA")).get("NPARAME") != null) {
												if (clausula.get("TCLATEX") != null) {
													String TCLATEX_t = ((String) clausula.get("TCLATEX"));
													String nparam_t = "#"
															+ ((HashMap) obj.get("OB_IAX_CLAUSUPARA")).get("NPARAME")
															+ "#";
													TCLATEX_t = TCLATEX_t.replace(nparam_t, getTTEXTOClausual(
															(HashMap) map2,
															(BigDecimal) ((HashMap) obj.get("OB_IAX_CLAUSUPARA"))
																	.get("NPARAME"),
															request));
													setTCLATEX(sclagen, TCLATEX_t, clausulasAuto);
												}
											}

										}
									}
								}

							}

						}

					}
				}
			}
		}
		return clausulas;

	}

	private String getTTEXTOClausual(HashMap map, BigDecimal NPARAME, HttpServletRequest request) {
		HashMap OB_IAX_CLAUSULA = (HashMap) tratarRETURNyMENSAJES(request, map);
		BigDecimal nparame_temp = null;
		String ttextot = "";
		if (OB_IAX_CLAUSULA != null) {
			ArrayList<HashMap> parametros = (ArrayList) OB_IAX_CLAUSULA.get("PARAMETROS");
			if (parametros != null) {
				for (HashMap obj : parametros) {
					if (obj.get("OB_IAX_CLAUSUPARA") != null) {
						nparame_temp = (BigDecimal) ((HashMap) obj.get("OB_IAX_CLAUSUPARA")).get("NPARAME");
						BigDecimal cformat = (BigDecimal) ((HashMap) obj.get("OB_IAX_CLAUSUPARA")).get("CFORMAT");
						if (cformat.equals(new BigDecimal(8))) {
							if (nparame_temp.equals(NPARAME)) {
								List valores = (List) ((HashMap) obj.get("OB_IAX_CLAUSUPARA")).get("VALORES");
								for (int j = 0; j < valores.size(); j++) {
									if ((NPARAME).equals((BigDecimal) ((HashMap) ((HashMap) valores.get(j))
											.get("OB_IAXCLAUSUPARA_VALORES")).get("NPARAME"))) {
										ttextot = (String) ((HashMap) ((HashMap) valores.get(j))
												.get("OB_IAXCLAUSUPARA_VALORES")).get("TPARAME");
									}

								}
								if (ttextot == null)
									ttextot = "";
								return ttextot;
							}
						} else {
							if (nparame_temp.equals(NPARAME)) {
								ttextot = (String) ((HashMap) obj.get("OB_IAX_CLAUSUPARA")).get("TTEXTO");
								if (ttextot == null)
									ttextot = "";
								return ttextot;
							}
						}
					}
				}
			}

		}
		return ttextot;

	}

	private void getTCLATEXClausualCformatEsp(List clausulas, HttpServletRequest request) {

		for (int i = 0; i < clausulas.size(); i++) {
			Map clausula = (Map) ((Map) clausulas.get(i)).get("OB_IAXPAR_CLAUSULAS");
			String TCLATEX_t = "";
			String nparam_t = "";
			ArrayList<HashMap> parametros = (ArrayList) clausula.get("PARAMETROS");
			if (parametros != null) {
				for (HashMap obj : parametros) {
					BigDecimal cformat = (BigDecimal) ((HashMap) obj.get("OB_IAX_CLAUSUPARA")).get("CFORMAT");
					if (cformat.equals(new BigDecimal(8))) {
						if (obj.get("OB_IAX_CLAUSUPARA") != null) {
							if (((HashMap) obj.get("OB_IAX_CLAUSUPARA")).get("NPARAME") != null) {
								if (clausula.get("TCLATEX") != null) {
									TCLATEX_t = ((String) clausula.get("TCLATEX"));

									nparam_t = "#" + ((HashMap) obj.get("OB_IAX_CLAUSUPARA")).get("NPARAME") + "#";

									List valores = (List) ((HashMap) obj.get("OB_IAX_CLAUSUPARA")).get("VALORES");
									for (int j = 0; j < valores.size(); j++) {
										Map valor = (Map) ((Map) valores.get(j)).get("OB_IAXCLAUSUPARA_VALORES");
										if (((BigDecimal) ((HashMap) obj.get("OB_IAX_CLAUSUPARA")).get("NPARAME"))
												.equals((BigDecimal) valor.get("NPARAME"))) {
											TCLATEX_t = TCLATEX_t.replace(nparam_t,
													((String) valor.get("TPARAME")) == null ? " "
															: (String) valor.get("TPARAME"));
											clausula.put("TCLATEX", TCLATEX_t);
										}
									}
								}
							}

						}
					}
				}
			}
		}
	}

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE ACTUALIZACION
	 ********************************************/
	/*********************************************************************************************************************/

	/**
	 * Permite a�adir por Ajax una cl�usula espec�fica. Esta se pasa por el
	 * par�metro de request CIDENTITY. Graba la nueva cl�usula a BD.
	 * 
	 * @param request El HttpServletRequest que contiene la petici�n del cliente
	 *                web.
	 */
	public void m_ajax_anadir(HttpServletRequest request) {
		logger.debug("Axisctr008Service m_ajax_anadir");
		AjaxContainerService ajax = new AjaxContainerService();
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {
			if (!isEmpty(getCampoTextual(request, "TCLAUESP"))) {
				UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
				// A�adir texto de cl�usula espec�fica
				PAC_IAX_PRODUCCION pac_axis_produccion = new PAC_IAX_PRODUCCION(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
				Map map = pac_axis_produccion.ejecutaPAC_IAX_PRODUCCION__F_GRABACLAUSULASESP(
						getCampoNumerico(request, "CIDENTITY"), getCampoTextual(request, "TCLAUESP"));
				logger.debug(map);
				ajax.rellenarPlAContenedorAjax(map);

				// Leer cl�usulas espec�ficas
				map = pac_axis_produccion.ejecutaPAC_IAX_PRODUCCION__F_LEECLAUSULASESP(null, "EDICION");
				logger.debug(map);
				List clausulasEsp = (List) ajax.rellenarPlAContenedorAjax(map);

				List clausulaAuto = (!isEmpty(formdata.get("axisctr_clausulasAutomaticas")))
						? (ArrayList) formdata.get("axisctr_clausulasAutomaticas")
						: new ArrayList();
				clausulasEsp = filterClausulasEsp(clausulasEsp, clausulaAuto, request);
				ajax.guardarContenidoFinalAContenedorAjax(clausulasEsp);
			}
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr008Service - m�todo m_anadir", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	/**
	 * Elimina una cl�usula espec�fica de BD en base al par�metro de request
	 * CIDENTITY.
	 * 
	 * @param request El HttpServletRequest que contiene la petici�n del cliente
	 *                web.
	 */
	public void m_ajax_delete_clausula(HttpServletRequest request) {
		logger.debug("Axisctr008Service m_ajax_delete_clausula");
		AjaxContainerService ajax = new AjaxContainerService();

		try {
			BigDecimal CIDENTITY = getCampoNumerico(request, "CIDENTITY");

			if (!isEmpty(CIDENTITY)) {
				// Borramos el objeto del List de cl�usulas espec�ficas
				UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
				PAC_IAX_PRODUCCION pac_axis_produccion = new PAC_IAX_PRODUCCION(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

				// Eliminar cl�usula de BD
				Map map = pac_axis_produccion.ejecutaPAC_IAX_PRODUCCION__F_ELIMINACLAUSULAESP(CIDENTITY);
				logger.debug(map);
				ajax.rellenarPlAContenedorAjax(map);

				// Volver a leerlas
				map = pac_axis_produccion.ejecutaPAC_IAX_PRODUCCION__F_LEECLAUSULASESP(null, "EDICION");
				logger.debug(map);
				List clausulasEspecificas = (List) ajax.rellenarPlAContenedorAjax(map);

			}
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr008Service - m�todo m_ajax_delete_clausula", e);
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
	public void m_siguiente(HttpServletRequest request, AbstractDispatchAction thisAction) {
		logger.debug("Axisctr008Service m_siguiente");
		m_guardarEstadoPantalla(request, thisAction, Constantes.SIGUIENTE);
		HashMap m = this.f_Get_Avisos(request, this.whoami(this));
		BigDecimal pRETURN = (BigDecimal) this.tratarRETURNyMENSAJES(request, m);
		request.setAttribute("PLSTAVISOS", m.get("PLSTAVISOS"));

		try {
			request.setAttribute(Constantes.FORWARDACTION,
					AxisCodeWizard.findForward(request, Constantes.SIGUIENTE, whoami(this), null));
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr008Service - m�todo m_siguiente", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		// m_validar(request, thisAction, Constantes.SIGUIENTE);
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));

	}

	/**
	 * Guarda la pantalla, realiza su validaci�n y determina la pantalla anterior a
	 * ejecutar.
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_anterior(HttpServletRequest request, AbstractDispatchAction thisAction) {
		logger.debug("Axisctr008Service m_anterior");
		m_guardarEstadoPantalla(request, thisAction, Constantes.ANTERIOR);
	}

	/**
	 * Guarda las cl�usulas seleccionadas a BD, realiza la validaci�n de la pantalla
	 * y realiza un forward a la siguiente pantalla del flujo.
	 * 
	 * @param request    El HttpServletRequest que contiene la petici�n del cliente
	 *                   web.
	 * @param thisAction Una Action abstracta desde donde se ha invocado el servicio
	 *                   (necesaria para el log).
	 */
	private void m_guardarEstadoPantalla(HttpServletRequest request, AbstractDispatchAction thisAction,
			BigDecimal direccion) {
		logger.debug("Axisctr008Service m_guardaEstadoPantalla");
		try {
			UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

			// Actualizar Casillas
			m_guardaCasillasChecked(request, thisAction);

			// Validaci�n
			Map map = new PAC_IAX_VALIDACIONES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_VALIDACIONES__F_VALIDACLAUSULAS();
			logger.debug(map);
			BigDecimal codiRetorn = (BigDecimal) tratarRETURNyMENSAJES(request, map);
			if (codiRetorn.equals(new BigDecimal(0))) {
				request.setAttribute(Constantes.FORWARDACTION,
						AxisCodeWizard.findForward(request, direccion, whoami(this), null));
			}
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr008Service - m�todo m_guardaEstadoPantalla", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

	private void m_guardaCasillasChecked(HttpServletRequest request, AbstractDispatchAction thisAction) {
		// TODO s'ha de fer de nou perque ho agafa tot de de la sessi�
		logger.debug("Axisctr008Service m_guarda_casillas_checked");
		try {
			Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
			// CL�USULAS DEFINIDAS
			UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
			PAC_IAXPAR_PRODUCTOS pac_axispar_productos = new PAC_IAXPAR_PRODUCTOS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map map = pac_axispar_productos.ejecutaPAC_IAXPAR_PRODUCTOS__F_GET_CLAUSULAS();
			logger.debug(map);
			List clausulasDefinidas = (List) tratarRETURNyMENSAJES(request, map);
			// Guardar cl�usulas actualizadas
			if (clausulasDefinidas != null) {
				guardarSeleccionCheckBoxs(clausulasDefinidas,
						getCampoTextual(request, "listaSelectedClausulasDefinidas"), "SCLAGEN", "SELECTEDCLAUSULA",
						"OB_IAXPAR_CLAUSULAS");
				// Bucle para guardar todas las cl�usulas definidas
				for (int i = 0; i < clausulasDefinidas.size(); i++) {
					Map outerMap = (Map) clausulasDefinidas.get(i);
					Map clausula = (Map) outerMap.get("OB_IAXPAR_CLAUSULAS");

					BigDecimal isSelectedClausula = new BigDecimal(0);
					// Miramos si est� seleccionada en pantalla
					if (clausula.get("SELECTEDCLAUSULA") != null
							&& ((Boolean) clausula.get("SELECTEDCLAUSULA")).booleanValue())
						isSelectedClausula = new BigDecimal(1);
					BigDecimal SCLAGEN = (BigDecimal) clausula.get("SCLAGEN");

					PAC_IAX_PRODUCCION pacproduccion = new PAC_IAX_PRODUCCION(
							(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
					Map rmap = pacproduccion.ejecutaPAC_IAX_PRODUCCION__F_GRABACLAUSULAS(SCLAGEN, isSelectedClausula);
					logger.debug("ejecutaPAC_IAX_PRODUCCION__F_GRABACLAUSULAS: " + rmap);
					tratarRETURNyMENSAJES(request, rmap);

				}

			}
			// CL�USULAS ESPEC�FICAS
			PAC_IAX_PRODUCCION pac_axis_produccion = new PAC_IAX_PRODUCCION(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			map = pac_axis_produccion.ejecutaPAC_IAX_PRODUCCION__F_LEECLAUSULASESP(null, "EDICION");
			logger.debug(map);
			List clausulasEspecificas = (List) tratarRETURNyMENSAJES(request, map);
			if (clausulasEspecificas != null) {
				guardarSeleccionCheckBoxs(clausulasEspecificas,
						getCampoTextual(request, "listaSelectedClausulasEspecificas"), "SCLAGEN", "SELECTEDCLAUSULA",
						"OB_IAX_CLAUSULAS");
				// Volvemos a poner la nueva lista en session
				formdata.put("axisctr_clausulasEspecificas", clausulasEspecificas);
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr008Service - m�todo m_guarda_casillas_checked", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

	public void m_initClausula(HttpServletRequest request, AbstractDispatchAction thisAction) {

		try {
			// Recuperamos formData
			m_guardaCasillasChecked(request, thisAction);
			Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

			UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
			PAC_IAX_PRODUCCION pac_axis_produccion = new PAC_IAX_PRODUCCION(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			BigDecimal sclagen = getCampoNumerico(request, "sclagen");

			Map map = pac_axis_produccion.ejecutaPAC_IAX_PRODUCCION__F_DELCLAUSULAPROD(sclagen);
			tratarRETURNyMENSAJES(request, map);

			initClausulas(request);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr008Service - m�todo m_guarda_casillas_checked", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
	}

	public void m_DelClausuMult(HttpServletRequest request, AbstractDispatchAction thisAction) {

		try {
			Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

			UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
			PAC_IAX_PRODUCCION pac_axis_produccion = new PAC_IAX_PRODUCCION(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			BigDecimal sclagen = getHiddenCampoNumerico(request, "PARSCLAGEN");
			BigDecimal nordcla = getHiddenCampoNumerico(request, "PARCIDENTITY");

			Map map = pac_axis_produccion.ejecutaPAC_IAX_PRODUCCION__F_DELCLAUSULAPRODMULT(sclagen, nordcla);
			tratarRETURNyMENSAJES(request, map);

			initClausulas(request);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr008Service - m�todo m_guarda_casillas_checked", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

	public void m_ValEditClausuEsp(HttpServletRequest request, AbstractDispatchAction thisAction) {

		try {
			Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

			UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
			PAC_IAX_VALIDACIONES pac_axis_validaciones = new PAC_IAX_VALIDACIONES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			BigDecimal nordcla = getHiddenCampoNumerico(request, "PARCIDENTITY");
			String tclauesp = getHiddenCampoTextual(request, "PARTCLAUESP");

			Map map = pac_axis_validaciones.ejecutaPAC_IAX_VALIDACIONES__F_VALIDA_ESCLAUSULACERTIF0(nordcla, tclauesp);
			// tratarRETURNyMENSAJES(request,map);

			if (((BigDecimal) this.tratarRETURNyMENSAJES(request, map, false)).intValue() != 0) {
				logger.debug("OK: 0");
				formdata.put("OK", "0");
			} else {
				logger.debug("OK: 1");
				formdata.put("OK", "1");
			}

			// initClausulas(request);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr008Service - m�todo m_ValEditClausuEsp", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

	public void m_ajax_comprobar(HttpServletRequest request) {
		logger.debug("Axisctr008Service m_ajax_comprobar");
		AjaxContainerService ajax = new AjaxContainerService();
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {

			UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
			// A�adir texto de cl�usula espec�fica
			PAC_IAX_PRODUCCION pac_axis_produccion = new PAC_IAX_PRODUCCION(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			// Leer cl�usulas espec�ficas
			Map map = pac_axis_produccion.ejecutaPAC_IAX_PRODUCCION__F_LEECLAUSULASESP(null, "EDICION");
			logger.debug(map);
			List clausulasEsp = (List) ajax.rellenarPlAContenedorAjax(map);

			// validaciones de clausulas certificado 0
			PAC_IAX_VALIDACIONES pac_axis_validaciones = new PAC_IAX_VALIDACIONES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			BigDecimal nordcla = getHiddenCampoNumerico(request, "PARCIDENTITY");
			String tclauesp = getHiddenCampoTextual(request, "PARTCLAUESP");

			map = pac_axis_validaciones.ejecutaPAC_IAX_VALIDACIONES__F_VALIDA_ESCLAUSULACERTIF0(nordcla, tclauesp);
			// tratarRETURNyMENSAJES(request,map);

			Map OK = new HashMap();

			if (((BigDecimal) this.tratarRETURNyMENSAJES(request, map, false)).intValue() != 0) {
				OK.put("OK", 0);
			} else {
				OK.put("OK", 1);
			}

			ajax.rellenarPlAContenedorAjax(map);

			List clausulaAuto = (!isEmpty(formdata.get("axisctr_clausulasAutomaticas")))
					? (ArrayList) formdata.get("axisctr_clausulasAutomaticas")
					: new ArrayList();
			clausulasEsp = filterClausulasEsp(clausulasEsp, clausulaAuto, request);
			ajax.guardarContenidoFinalAContenedorAjax(clausulasEsp);

			ajax.guardarContenidoFinalAContenedorAjax(OK);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr008Service - m�todo m_comprobar", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

}
