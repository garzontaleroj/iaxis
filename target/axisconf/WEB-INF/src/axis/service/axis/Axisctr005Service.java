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

import axis.cache.AxisCodeWizard;
import axis.jdbc.PAC_IAX_AVISOS;
import axis.jdbc.PAC_IAX_CFG;
import axis.jdbc.PAC_IAX_ECO_MONEDAS;
import axis.jdbc.PAC_IAX_PRODUCCION;
import axis.jdbc.PAC_IAX_SUPLEMENTOS;
import axis.jdbc.PAC_IAX_VALIDACIONES;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.control.axis.Axisctr005Action;
import axis.mvc.model.UsuarioBean;
import axis.mvc.view.VisibleTag;
import axis.util.Constantes;
import axis.util.Traductor;

public class Axisctr005Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	public void m_init(HttpServletRequest request, Axisctr005Action thisAction) {
		logger.debug("Axisctr005Service m_init");
		try {
			m_form(request, thisAction);
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr005Service - m�todo m_init", e);
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

	public void m_form(HttpServletRequest request, Axisctr005Action thisAction) {
		logger.debug("Axisctr005Service m_form");

		BigDecimal SSEGURO = (BigDecimal) AbstractDispatchAction.topPila(request, "SSEGURO_005");
		SSEGURO = SSEGURO == null ? (BigDecimal) AbstractDispatchAction.topPila(request, "SSEGURO") : SSEGURO;
		logger.debug("NOMBRE SSEGURO: " + SSEGURO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {

			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
			// MLR - 05/04/2013 - 0025803: RSA001 - Ampliar los decimales que utiliza iAXIS
			UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
			PAC_IAX_ECO_MONEDAS pac_iax_eco_monedas = new PAC_IAX_ECO_MONEDAS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map mapa = pac_iax_eco_monedas.ejecutaPAC_IAX_ECO_MONEDAS__F_OBTENER_MONEDA_SEGURO2(SSEGURO);
			logger.debug(mapa);
			Map mapGenPoliza = new HashMap();
			BigDecimal pPCMOTMOV = (BigDecimal) AbstractDispatchAction.topPila(request, "CMOTMOV");

			request.getSession().setAttribute(("CMONEDAPROD"), mapa.get("RETURN"));
			mapGenPoliza = this.dbLeePoliza(request);
			formdata.put("NPOLIZA", mapGenPoliza.get("NPOLIZA"));

			if (pPCMOTMOV != null) {
				Map map2 = new PAC_IAX_SUPLEMENTOS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_SUPLEMENTOS__F_GET_DESCMOTMOV(pPCMOTMOV, usuario.getCidioma());
				formdata.put("PTMOTMOV", map2.get("PTMOTMOV"));
			}

			if (request.getSession().getAttribute("axisctr_riesgos") == null) {
				logger.debug("NOMBRE USUARIO" + usuario.getNombre());
				List axisctr005_ListaRiesgos = new ArrayList();
				BigDecimal axisctr005_primaTotal = new BigDecimal(0);

				/* Llamada PL/SQL para recuperar los riesgos */
				PAC_IAX_PRODUCCION pacIaxProduccion = new PAC_IAX_PRODUCCION(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
				Map map = new HashMap();

				map = pacIaxProduccion.ejecutaPAC_IAX_PRODUCCION__F_GET_DETPOLIZA();
				logger.debug("map_aux-->" + map);
				Map datosGestion = (Map) tratarRETURNyMENSAJES(request, map);
				BigDecimal NCERTIF = null;
				if (datosGestion != null) {
					NCERTIF = (BigDecimal) datosGestion.get("NCERTIF");
				}

				logger.debug("++++NCERTIF: " + NCERTIF);
				formdata.put("NCERTIF", NCERTIF);

				map = pacIaxProduccion.ejecutaPAC_IAX_PRODUCCION__F_GET_GESTRIESGOS();
				logger.debug(map);

				// Recogemos el valor/posibles mensajes de error de la llamada a PL
				List axisctr005_Lista = (List) tratarRETURNyMENSAJES(request, map);

				for (int i = 0; i < axisctr005_Lista.size(); i++) {
					Map a = (Map) ((Map) axisctr005_Lista.get(i)).get("OB_IAX_GESTRIESGOS");
					logger.debug("-->a:" + a);
					BigDecimal NRIESGO = (BigDecimal) a.get("NRIESGO");

					if (VisibleTag.esComponenteVisibleDefectoNoVer(request, "axisctr005", "MOD_PLAN_SUPLEM")) {
						logger.debug("-----> comprovamos si se puede modificar");
						Map mapval = new PAC_IAX_VALIDACIONES(
								(java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
								.ejecutaPAC_IAX_VALIDACIONES__F_VALIDAMODI_PLAN(NRIESGO);
						logger.debug(mapval);
						BigDecimal valplan = (BigDecimal) tratarRETURNyMENSAJES(request, mapval);
						Map OB_IAX_GESTRIESGOS = new HashMap();
						a.put("permiteModificarPlan", valplan);
						OB_IAX_GESTRIESGOS.put("OB_IAX_GESTRIESGOS", a);
						axisctr005_Lista.set(i, OB_IAX_GESTRIESGOS);
					}

				}
				logger.debug("-->axisctr005_Lista:" + axisctr005_Lista);

				/* PRIMAS POLIZA */
				Map m = pacIaxProduccion.ejecutaPAC_IAX_PRODUCCION__F_GET_PRIMASPOLIZA();
				logger.debug("m:" + m);
				tratarRETURNyMENSAJES(request, m);
				// request.setAttribute("primas", m.get("RETURN"));

				axisctr005_primaTotal = axisctr005_primaTotal
						.add(new BigDecimal(String.valueOf(((Map) m.get("RETURN")).get("ITOTALR"))));

				request.getSession().setAttribute("axisctr005_ListaRiesgos", axisctr005_Lista);
				request.getSession().setAttribute("axisctr005_primaTotal", axisctr005_primaTotal);
			}
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr005Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
	}

	/**
	 * Guarda la pantalla, realiza su validaci�n y determina la siguiente pantalla a
	 * ejecutar.
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_siguiente(HttpServletRequest request, Axisctr005Action thisAction) {
		logger.debug("Axisctr005Service m_siguiente");

		HashMap m = this.f_Get_Avisos_005(request, this.whoami(this));
		BigDecimal pRETURN = (BigDecimal) this.tratarRETURNyMENSAJES(request, m);
		request.setAttribute("PLSTAVISOS", m.get("PLSTAVISOS"));

		if (pRETURN != null && pRETURN.intValue() != 1)
			m_validar(request, thisAction, Constantes.SIGUIENTE);

		this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
	}

	/**
	 * M�todo que comprueba si la p�liza est� en situaci�n de editar suplementos, en
	 * caso que as� sea, realiza una llamada a BD para saber a qu� pantalla hemos de
	 * saltar para editar suplementos. Devuelve un ActionForward conteniendo la
	 * pantalla a saltar.
	 * 
	 * @param request
	 * @param thisAction
	 * @return ActionForward - Un ActionForward que encapsula el action de la
	 *         pantalla a saltar.
	 */
	public ActionForward m_editar(HttpServletRequest request, Axisctr005Action thisAction) {
		logger.debug("Axisctr020Service m_editar");

		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		Map map = new HashMap();
		try {
			BigDecimal NRIESGO = getCampoNumerico(request, "NRIESGO");

			// String CMODO = "GESTION_RIESGOS";

			// Map map = new
			// PAC_IAX_SUPLEMENTOS((java.sql.Connection)request.getAttribute(Constantes.DB01CONN)).ejecutaPAC_IAX_SUPLEMENTOS__F_EDITARSUPLEMENTO(SSEGURO,
			// CMOTMOV);
			// if (new BigDecimal(0).equals(tratarRETURNyMENSAJES(request,
			// Recuperar el SPRODUC de la PILA
			String CMODO = (String) AbstractDispatchAction.topPila(request, "CMODO");
			BigDecimal SSEGURO = (BigDecimal) AbstractDispatchAction.topPila(request, "SSEGURO_005");
			SSEGURO = SSEGURO == null ? (BigDecimal) AbstractDispatchAction.topPila(request, "SSEGURO") : SSEGURO;
			BigDecimal SPRODUC = (BigDecimal) AbstractDispatchAction.topPila(request, "SPRODUC");
			map = new PAC_IAX_CFG((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_CFG__F_GET_FORM_WIZARD(CMODO, SPRODUC, "AXISCTR005", "BT_EDITAR",
							Constantes.SIGUIENTE);
			logger.debug(map);

			String PANTALLA_DESTINO = (String) tratarRETURNyMENSAJES(request, map);
			// Nos devolver� la pantalla destino, ej: AXCTR006;

			if (!isEmpty(PANTALLA_DESTINO)) {

				// AbstractDispatchAction.topPila(request,
				// "formdata_axisctr006",
				// formdata);

				// Map passTopPila = new HashMap();
				// passTopPila.put("SPRODUC", SPRODUC);
				// passTopPila.put("CMODO", CMODO);
				// passTopPila.put("NRIESGO", NRIESGO);
				// passTopPila.put("SSEGURO",SSEGURO);

				// request.setAttribute(Constantes.PASSTOPPILA, passTopPila);
				// request.getSession().setAttribute("PASSTOPPILA", passTopPila);

				AbstractDispatchAction.topPila(request, "NRIESGO", NRIESGO);
				this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
				return new ActionForward("/axis_" + PANTALLA_DESTINO.toLowerCase() + ".do?operation=form");
			}

			return null;

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr020Service - m�todo m_cobrar_recibo", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
			return null;
		}
	}

	/**
	 * Guarda la pantalla, realiza su validaci�n y determina la pantalla anterior a
	 * ejecutar.
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_anterior(HttpServletRequest request, Axisctr005Action thisAction) {
		logger.debug("Axisctr005Service m_anterior");
		this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		try {
			request.setAttribute(Constantes.FORWARDACTION,
					AxisCodeWizard.findForward(request, Constantes.ANTERIOR, whoami(this), null));
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr005Service - m�todo m_validar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}

	}

	/**
	 * Ejecuta la validaci�n del formulario contra BD.
	 * 
	 * @param request    El HttpServletRequest que contiene la petici�n del cliente
	 *                   web.
	 * @param thisAction Una Action abstracta desde donde se ha invocado el servicio
	 *                   (necesaria para el log).
	 */
	private void m_validar(HttpServletRequest request, Axisctr005Action thisAction, BigDecimal direccion) {
		logger.debug("Axisctr005Service m_validar");
		try {

			UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
			PAC_IAX_VALIDACIONES pacIaxValidacionRiesgos = new PAC_IAX_VALIDACIONES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			BigDecimal codiRetorn = new BigDecimal(0);
			ArrayList<Map> riesgos = (ArrayList<Map>) request.getSession().getAttribute("axisctr005_ListaRiesgos");

			String literalRiesgo = Traductor.traducir(AxisBaseService.getLocale(request).toString(), "100649");
			if (!isEmpty(riesgos))
				for (Map m : riesgos) {
					logger.debug(m);
					if (!isEmpty(m.get("OB_IAX_GESTRIESGOS"))) {
						HashMap gestRiesgos = (HashMap) m.get("OB_IAX_GESTRIESGOS");
						if (!isEmpty(gestRiesgos.get("NRIESGO"))) {
							Map map = new PAC_IAX_PRODUCCION(
									(java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
									.ejecutaPAC_IAX_PRODUCCION__F_LEEPREGUNTASRIESGO(
											(BigDecimal) gestRiesgos.get("NRIESGO"));
							logger.debug(map);
							logger.debug(gestRiesgos.get("NRIESGO"));
							m = pacIaxValidacionRiesgos.ejecutaPAC_IAX_VALIDACIONES__F_VALIDADPREGGARANTRIESGO(
									(BigDecimal) gestRiesgos.get("NRIESGO"));
							logger.debug(m);

							if (((BigDecimal) m.get("RETURN")).intValue() != 0) {
								AbstractDispatchAction.guardarMensaje(request, "verbatim:" + literalRiesgo + " : "
										+ gestRiesgos.get("NRIESGO") + " - " + gestRiesgos.get("TRIESGO"), null,
										Constantes.MENSAJE_ERROR);
								this.tratarRETURNyMENSAJES(request, m);
								codiRetorn = new BigDecimal(1);
							}
						}

					}
				}

			if (codiRetorn.intValue() == 0) {
				Map validacion_riesgos = pacIaxValidacionRiesgos.ejecutaPAC_IAX_VALIDACIONES__F_VALIDAGESTIONRIESGOS();
				logger.debug(validacion_riesgos);
				codiRetorn = (BigDecimal) tratarRETURNyMENSAJES(request, validacion_riesgos);
			}

			request.setAttribute(Constantes.FORWARDACTION,
					AxisCodeWizard.findForward(request, direccion, whoami(this), null));

			/*
			 * TODO: Habilitar la validaci�n, descomentando lo siguiente y borrando la l�nea
			 * anterior. Ahora mismo no funciona la validaci�n retorna
			 * "TERROR=No se han seleccionado garantias para el riesgo 1"
			 */
			if (codiRetorn.intValue() == 0) {
				// vaya al siguiente...
				request.setAttribute(Constantes.FORWARDACTION,
						AxisCodeWizard.findForward(request, direccion, whoami(this), null));
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr005Service - m�todo m_validar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

	/**
	 * M�todo invocado al volver del cambio de flujo. Se encarga de comprobar si hay
	 * suplementos pendientes de emisi�n, y en dicho caso, mostrar el bot�n de
	 * Emitir en la JSP.
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_volver(HttpServletRequest request, Axisctr005Action thisAction) {
		logger.debug("Axisctr005Service m_volver");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		try {

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr005Service - m�todo m_volver", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

	/**
	 * M�todo que comprueba si la p�liza est� en situaci�n de dar de alta un nuevo
	 * riesgo, en caso que as� sea, realiza una llamada a BD para saber a qu�
	 * pantalla hemos de saltar. Devuelve un ActionForward conteniendo la pantalla a
	 * saltar.
	 * 
	 * @param request
	 * @param thisAction
	 * @return ActionForward - Un ActionForward que encapsula el action de la
	 *         pantalla a saltar.
	 */
	public ActionForward m_nou(HttpServletRequest request, Axisctr005Action thisAction) {
		logger.debug("Axisctr020Service m_nou");

		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		Map map = new HashMap();
		try {
			BigDecimal NRIESGO = getCampoNumerico(request, "NRIESGO");

			// String CMODO = "GESTION_RIESGOS";

			// Map map = new
			// PAC_IAX_SUPLEMENTOS((java.sql.Connection)request.getAttribute(Constantes.DB01CONN)).ejecutaPAC_IAX_SUPLEMENTOS__F_EDITARSUPLEMENTO(SSEGURO,
			// CMOTMOV);
			// if (new BigDecimal(0).equals(tratarRETURNyMENSAJES(request,
			// Recuperar el SPRODUC de la PILA
			String CMODO = (String) AbstractDispatchAction.topPila(request, "CMODO");
			BigDecimal SSEGURO = (BigDecimal) AbstractDispatchAction.topPila(request, "SSEGURO_005");
			SSEGURO = SSEGURO == null ? (BigDecimal) AbstractDispatchAction.topPila(request, "SSEGURO") : SSEGURO;
			BigDecimal SPRODUC = (BigDecimal) AbstractDispatchAction.topPila(request, "SPRODUC");
			map = new PAC_IAX_CFG((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_CFG__F_GET_FORM_WIZARD(CMODO, SPRODUC, "AXISCTR005", "BT_NOU_RIE",
							Constantes.SIGUIENTE);
			logger.debug(map);

			String PANTALLA_DESTINO = (String) tratarRETURNyMENSAJES(request, map);
			// Nos devolver� la pantalla destino, ej: AXCTR006;

			if (!isEmpty(PANTALLA_DESTINO)) {
				this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
				AbstractDispatchAction.topPila(request, "NRIESGO", NRIESGO);
				return new ActionForward("/axis_" + PANTALLA_DESTINO.toLowerCase() + ".do?operation=form&opennew=1");
			}

			return null;

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr005Service - m�todo m_nou", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
			return null;
		}
	}

	private BigDecimal dbGrabarObjetoDb(HttpServletRequest request, UsuarioBean usuario) throws Exception {
		Map m = new PAC_IAX_PRODUCCION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_PRODUCCION__F_GRABAROBJETODB();
		logger.debug("Map de grabarObjeto a DB---------------------------------------->" + m);
		return (BigDecimal) tratarRETURNyMENSAJES(request, m);
	}

	/**
	 * Ejecuta la funci�n para borrar un riesgo.
	 * 
	 * @param request    El HttpServletRequest que contiene la petici�n del cliente
	 *                   web.
	 * @param thisAction Una Action abstracta desde donde se ha invocado el servicio
	 *                   (necesaria para el log).
	 */
	public void m_borrar_riesgo(HttpServletRequest request, Axisctr005Action thisAction) {
		logger.debug("Axisctr005Service m_borrar_riesgo");
		try {

			UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

			PAC_IAX_PRODUCCION pacIaxProduccion = new PAC_IAX_PRODUCCION(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			BigDecimal NRIESGO = getCampoNumerico(request, "NRIESGO");
			Map borrar_riesgo = pacIaxProduccion.ejecutaPAC_IAX_PRODUCCION__F_ELIMINARIESGO(NRIESGO);
			logger.debug("eliminar_riesgo");
			BigDecimal codiRetorn = (BigDecimal) tratarRETURNyMENSAJES(request, borrar_riesgo);

			this.dbGrabarObjetoDb(request, usuario);
			m_form(request, thisAction);
			AbstractDispatchAction.topPila(request, "NRIESGO", new BigDecimal(1));
			request.setAttribute("NRIESGO", "1");

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr005Service - m�todo m_borrar_riesgo", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

	private HashMap f_Get_Avisos_005(HttpServletRequest request, String whoami) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {
			PAC_IAX_AVISOS pacIaxAviso = new PAC_IAX_AVISOS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			String CMODO = (String) AbstractDispatchAction.topPila(request, "CMODO");
			BigDecimal CRAMO = (BigDecimal) AbstractDispatchAction.topPila(request, "CRAMO");
			BigDecimal SPRODUC = (BigDecimal) AbstractDispatchAction.topPila(request, "SPRODUC");
			BigDecimal SSEGURO = (BigDecimal) AbstractDispatchAction.topPila(request, "SSEGURO_005");
			SSEGURO = SSEGURO == null ? (BigDecimal) AbstractDispatchAction.topPila(request, "SSEGURO") : SSEGURO;

			request.setAttribute("SSEGURO", SSEGURO);

			String pparams = this.getInfoStringConcatenar_005(request);
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

	private String getInfoStringConcatenar_005(HttpServletRequest request) {
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
							&& !fieldValue.equals("undefined")) {
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
				if (!fieldName.equals("TTITOBS") && !fieldName.equals("TOBS") && !isEmpty(fieldValue)
						&& !fieldValue.equals("undefined") && fieldName.indexOf("javax") == -1
						&& fieldName.indexOf("org") == -1 && fieldName.indexOf("__mensajes") == -1
						&& fieldName.indexOf("__forwardaction") == -1 && fieldName.indexOf("__formdata") == -1
						&& fieldName.indexOf("__configform") == -1 && fieldName.indexOf("DEPENDENCIAS") == -1
						&& fieldName.indexOf("DISPLAY_ITEMS") == -1 && fieldName.indexOf("DEPENDENCIA0") == -1) {
					cadena.append("#").append(fieldName).append(";").append(fieldValue);
				}
			}

			cadena.append("#").append("CIDIOMA").append(";").append(usuario.getCidioma());
			String c = cadena.append("#").toString();

			if (c.length() > 1999)
				c = c.substring(0, 1999);

			return c;
		} catch (Exception e) {
			logger.debug("error : " + e.getMessage());
			return "";
		}
	}

	public void m_tarificar(HttpServletRequest request, Axisctr005Action thisAction) {
		logger.debug("Axisctr005Service m_tarificar");
		try {
			Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
			UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

			PAC_IAX_PRODUCCION pacIaxProduccion = new PAC_IAX_PRODUCCION(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			BigDecimal NRIESGO = getCampoNumerico(request, "NRIESGO");

			Map map = pacIaxProduccion.ejecutaPAC_IAX_PRODUCCION__F_TARIFICAR_TODOS_RIESGOS();
			logger.debug("+++F_TARIFAR_TODOS_RIESGOS: " + map);

			BigDecimal codiRetorn = (BigDecimal) tratarRETURNyMENSAJES(request, map);
			if (codiRetorn.equals(new BigDecimal(0))) {
				formdata.put("OK_TARIF", "OK");
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr005Service - m�todo m_tarificar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

}
