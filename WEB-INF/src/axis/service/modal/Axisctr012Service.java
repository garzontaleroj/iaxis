package axis.service.modal;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAXPAR_PRODUCTOS;
import axis.jdbc.PAC_IAX_PRODUCCION;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.control.modal.Axisctr012Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

public class Axisctr012Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());
	String CRESPUE = "";
	String CRESPUE_6622 = "";

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE INICIALIZACION
	 *******************************************/
	/*********************************************************************************************************************/

	/**
	 * M�todo que se llama al iniciar este modal.
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_init(HttpServletRequest request, Axisctr012Action thisAction) {
		logger.debug("Axisctr012Service m_init");
		try {
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr012Service - m�todo m_init", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, whoami(Axisctr012Service.class));
	}

	/**
	 * Carga en axisctr_garantia la garant�a seleccionada, y en
	 * axisctr_preguntasGarantia su lista de preguntas con sus respuestas.
	 * 
	 * @param request    El HttpServletRequest que contiene la petici�n del cliente
	 *                   web.
	 * @param thisAction Una Action abstracta desde donde se ha invocado el servicio
	 *                   (necesaria para el log).
	 */
	public void m_form(HttpServletRequest request, Axisctr012Action thisAction) {
		logger.debug("Axisctr012Service m_form3");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {
			// Borrar garant�a de session si hemos estado editando alguna
			request.getSession().removeAttribute("axisctr_garantia");
			// Recuperar garant�a seleccionada y sus preguntas
			initPreguntasGarantia(request);
			BigDecimal SSEGURO = this.getCampoNumerico(request, "SSEGURO");
			BigDecimal NRIESGO = this.getCampoNumerico(request, "NRIESGO");
			BigDecimal NMOVIMI = this.getCampoNumerico(request, "NMOVIMI");
			formdata.put("SSEGURO", SSEGURO);
			formdata.put("NRIESGO", NRIESGO);
			formdata.put("NMOVIMI", NMOVIMI);

			BigDecimal SPRODUC = (BigDecimal) AbstractDispatchAction.topPila(request, "SPRODUC");
			PAC_IAXPAR_PRODUCTOS parproductos = new PAC_IAXPAR_PRODUCTOS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map param = parproductos.ejecutaPAC_IAXPAR_PRODUCTOS__F_GET_PARPRODUCTO("MOD_PREG_INNO", SPRODUC);
			formdata.put("modpreginno", tratarRETURNyMENSAJES(request, param));

			formdata.put("SPRODUC", SPRODUC);
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr012Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, whoami(Axisctr012Service.class));
	}

	/**
	 * M�todo que recupera de BD las Preguntas Garant�a.
	 * 
	 * @param request
	 * @throws Exception
	 */
	private void initPreguntasGarantia(HttpServletRequest request) throws Exception {
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		String CGARANT = getCampoTextual(request, "selectedGarantia");

		if (!isEmpty(CGARANT) && (!isEmpty(request.getSession().getAttribute("axisctr_garantias_ini"))
				|| !isEmpty(request.getSession().getAttribute("axisctr_garantias")))) {
			List g = null;
			if (!isEmpty(request.getSession().getAttribute("axisctr_garantias_ini")))
				g = (List) request.getSession().getAttribute("axisctr_garantias_ini");
			else
				g = (List) request.getSession().getAttribute("axisctr_garantias");

			Map garantia = getObjetoDeLista(g, CGARANT, "CGARANT", "OB_IAX_GARANTIAS");
			UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

			// Inicializar preguntas
			Map map = new PAC_IAXPAR_PRODUCTOS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAXPAR_PRODUCTOS__F_GET_PREGGARANT(new BigDecimal(CGARANT));
			logger.debug(map);

			List preguntas = (List) tratarRETURNyMENSAJES(request, map);

			// TODO: Es la forma correcta de recuperar NRIESGO?
			BigDecimal NRIESGO = (BigDecimal) AbstractDispatchAction.topPila(request, "NRIESGO");
			map = new PAC_IAX_PRODUCCION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_PRODUCCION__F_GET_PREGGARANT(NRIESGO, new BigDecimal(CGARANT));
			logger.debug(map);

			List respuestas = (List) tratarRETURNyMENSAJES(request, map);

			// Mezclar las respuestas con las preguntas iniciales
			inicializarPreguntas(preguntas, respuestas);

			logger.debug("Preguntas/Respuestas despu�s del merge -> " + preguntas);

			List pregGarQuestSalut = null;
			List pregGarDespeses = null;
			if (!isEmpty(preguntas)) {
				getPreguntasTablaLlena(preguntas, request, new BigDecimal(CGARANT));
				pregGarQuestSalut = dividirPregPerCtipgru(preguntas, Constantes.CTIPGRU_QUESTIONARI_SALUT);

				pregGarDespeses = dividirPregPerCtipgru(preguntas, Constantes.CTIPGRU_DESPESES);

			}

			// Guardar lista de preguntas para mostrarla en la pantalla mediante un
			// DisplayTag
			// es guarden els diferents grups de preguntes
			request.getSession().setAttribute("axisctr_pregGarQuestSalut",
					!isEmpty(pregGarQuestSalut) ? pregGarQuestSalut : new ArrayList());
			request.getSession().setAttribute("axisctr_pregGarDespeses",
					!isEmpty(pregGarDespeses) ? pregGarDespeses : new ArrayList());
			request.getSession().setAttribute("axisctr_preguntasGarantia",
					!isEmpty(preguntas) ? preguntas : new ArrayList());
			request.getSession().setAttribute("axisctr_garantia", garantia);
			request.getSession().setAttribute("existeConvenio", CRESPUE);
			request.getSession().setAttribute("existeTasaMigrada", CRESPUE_6622);
		}
	}

	private void getPreguntasTablaLlena(List<HashMap> preguntas, HttpServletRequest request, BigDecimal CGARANT) {
		BigDecimal NRIESGO = (BigDecimal) AbstractDispatchAction.topPila(request, "NRIESGO");

		try {
			for (HashMap OB_IAXPAR_PREGUNTAS : preguntas) {
				HashMap preg = (HashMap) OB_IAXPAR_PREGUNTAS.get("OB_IAXPAR_PREGUNTAS");
				BigDecimal CPREGUN = (BigDecimal) preg.get("CPREGUN");

				Map map = new PAC_IAX_PRODUCCION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_PRODUCCION__F_GET_PREGUNTAB("G", NRIESGO, CGARANT, CPREGUN);
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

				BigDecimal CPREGUN = BigDecimal.ZERO;
				if (!isEmpty(preg.get("CPREGUN")))
					CPREGUN = (BigDecimal) preg.get("CPREGUN");

				if (CTIPGRU == 2 && CPREGUN.equals(new BigDecimal("2701"))) {

					if (!isEmpty(preg.get("CRESPUE")))
						CRESPUE = preg.get("CRESPUE").toString();
					else
						CRESPUE = "";

				}

				if (CTIPGRU == 2 && CPREGUN.equals(new BigDecimal("6622"))) {

					if (!isEmpty(preg.get("CRESPUE")))
						CRESPUE_6622 = preg.get("CRESPUE").toString();
					else
						CRESPUE_6622 = "";

				}

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
	 * M�TODOS DE ACTUALIZACION
	 ********************************************/
	/*********************************************************************************************************************/

	/**
	 * Guarda las respuestas del usuario a cada una de las preguntas.
	 * 9284�20090227�ecg�Mostrar mensajes de error si F_GRABAPREGUNTASGARANTIA los
	 * retornan
	 * 
	 * @param request    El HttpServletRequest que contiene la petici�n del cliente
	 *                   web.
	 * @param thisAction Una Action abstracta desde donde se ha invocado el servicio
	 *                   (necesaria para el log).
	 */
	public void m_guardarCambios(HttpServletRequest request, Axisctr012Action thisAction) {
		logger.debug("Axisctr012Service m_guardarCambios");
		try {

			List preguntas = (List) request.getSession().getAttribute("axisctr_preguntasGarantia");
			logger.debug("preguntas sin merged grabades ::" + preguntas);
			List<HashMap> pregQuestSalut = (List) request.getSession().getAttribute("axisctr_pregGarQuestSalut");
			logger.debug("pregQuestSalut sin merged grabades ::" + pregQuestSalut);
			List<HashMap> pregDespeses = (List) request.getSession().getAttribute("axisctr_pregGarDespeses");
			if (!isEmpty(pregQuestSalut))
				for (HashMap OB_IAXPAR_PREGUNTAS : pregQuestSalut) {
					preguntas.add(OB_IAXPAR_PREGUNTAS);
				}

			if (!isEmpty(pregDespeses))
				for (HashMap OB_IAXPAR_PREGUNTAS : pregDespeses) {
					preguntas.add(OB_IAXPAR_PREGUNTAS);
				}
			logger.debug("preguntas merged grabades ::" + preguntas);

			if (!isEmpty(preguntas)) {
				// Recuperamos garant�a a procesar
				Map garantia = (Map) request.getSession().getAttribute("axisctr_garantia");
				// TODO: Es la forma correcta de recuperar NRIESGO?
				BigDecimal NRIESGO = (BigDecimal) AbstractDispatchAction.topPila(request, "NRIESGO");

				HashMap m = this.f_Get_Avisos(request, this.whoami(this));

				BigDecimal retorno = (BigDecimal) this.tratarRETURNyMENSAJES(request, m);
				if (retorno.intValue() == 0) {
					/* Guardar preguntas */
					guardarPreguntas(request, preguntas, "PAC_IAX_PRODUCCION__F_GRABAPREGUNTASGARANTIA",
							new Object[] { NRIESGO, garantia.get("CGARANT") });

					if (Axisctr012Action.maxistipoMENSAJE(request) < Constantes.MENSAJE_ERROR) { // 9284�20090227�ecg
						request.setAttribute("guardarCambios_sin_errores", true);
						request.getSession().removeAttribute("axisctr_garantia");
					}
				}
			}

			/*
			 * // Buclamos por todas las preguntas... for (int i = 0; i < preguntas.size();
			 * i++) { Map pregunta = (Map) ((Map)
			 * preguntas.get(i)).get("OB_IAXPAR_PREGUNTAS"); BigDecimal CRESTIP =
			 * (BigDecimal) pregunta.get("CRESTIP"); BigDecimal CRESPUE = null; String
			 * TRESPUE = null;
			 * 
			 * // Obtenemos la respuesta del usuario... String respuestaUsuario =
			 * getCampoTextual(request, "respuesta_" + i);
			 * 
			 * if (new BigDecimal(1).equals(CRESTIP)) { try { CRESPUE = new
			 * BigDecimal(respuestaUsuario); } catch (Exception e) { CRESPUE = null; } }
			 * else { TRESPUE = respuestaUsuario; }
			 * 
			 * // La guardamos... logger.debug(new
			 * PAC_IAX_PRODUCCION((java.sql.Connection)request.getAttribute(Constantes.
			 * DB01CONN)).ejecutaPAC_IAX_PRODUCCION__F_GRABAPREGUNTASGARANTIA( NRIESGO,
			 * (BigDecimal) garantia.get("CGARANT"), (BigDecimal) pregunta.get("CPREGUN"),
			 * CRESPUE, TRESPUE)); }
			 */

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr012Service - m�todo m_guardarCambios", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
			request.getSession().removeAttribute("axisctr_garantia");
		}
		this.f_Cargar_Propiedades_Pantalla(request, whoami(Axisctr012Service.class));

	}

}
