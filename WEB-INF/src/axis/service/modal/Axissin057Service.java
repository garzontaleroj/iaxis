package axis.service.modal;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_SINIESTROS;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.control.modal.Axissin057Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

public class Axissin057Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	/**
	 * M�todo que se llama al inicio de este flujo. Realiza la carga inicial de los
	 * datos de los combos.
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_form(HttpServletRequest request, Axissin057Action thisAction) {
		logger.debug("Axissin057Service m_form");
		PAC_IAX_SINIESTROS pac_axis_siniestros = new PAC_IAX_SINIESTROS(
				(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		logger.debug("Axissin057Service m_form " + formdata);
		this.f_Cargar_Propiedades_Pantalla(request, whoami(thisAction));

		BigDecimal NSINIES = getCampoNumerico(request, "NSINIES");
		formdata.put("NSINIES", NSINIES);
		BigDecimal SPRODUC = getCampoNumerico(request, "SPRODUC");
		formdata.put("SPRODUC", SPRODUC);
		BigDecimal CACTIVI = getCampoNumerico(request, "CACTIVI");
		formdata.put("CACTIVI", CACTIVI);
		String CTRAMIT = getCampoTextual(request, "CTRAMITAD");
		formdata.put("CTRAMITAD", CTRAMIT);

		try {
			Map map = pac_axis_siniestros.ejecutaPAC_IAX_SINIESTROS__F_GET_SINIESTRO();
			logger.debug("------> datos sini:" + map);
			Map datosSiniestro = (Map) tratarRETURNyMENSAJES(request, map);

			this.initPreguntas(request, thisAction, (List) datosSiniestro.get("PREGUNTAS"));
		} catch (Exception e) {
			logger.error("Error en el servicio Axissin057Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

	public void m_guardar(HttpServletRequest request, Axissin057Action thisAction) {

		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		logger.debug("AXISSIN056Service m_guardar " + formdata);

		try {
			PAC_IAX_SINIESTROS pac_axis_siniestros = new PAC_IAX_SINIESTROS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			request.setAttribute("OK", "!OK");

			String NSINIES = this.getCampoTextual(request, "NSINIES");
			logger.debug("NSINIES-->" + NSINIES);
			BigDecimal pSPRODUC = this.getCampoNumerico(request, "SPRODUC");
			logger.debug("SPRODUC-->" + pSPRODUC);
			BigDecimal pCACTIVI = this.getCampoNumerico(request, "CACTIVI");
			logger.debug("CACTIVI-->" + pCACTIVI);
			String pPREGUNTAS = this.getCampoTextual(request, "preg_resp");
			logger.debug("++++preguntas respondidas: " + pPREGUNTAS);

			Map map = new PAC_IAX_SINIESTROS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_SINIESTROS__F_SET_OBJ_PREGUNTAS(new BigDecimal(NSINIES), pSPRODUC, pCACTIVI,
							pPREGUNTAS);
			logger.debug("++++map set obj preguntas: " + map);

			if (((BigDecimal) tratarRETURNyMENSAJES(request, map)).intValue() == 0) {
				request.setAttribute("OK", "OK"); // guardamos, etc y no ha habido error
			}
			this.f_Cargar_Propiedades_Pantalla(request, whoami(thisAction));
		} catch (Exception e) {
			logger.error("Error en el servicio AXISSIN057Service - m�todo m_guardar", e);
			thisAction.guardarMensaje(request, "1000052", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

	private void initPreguntas(HttpServletRequest request, AbstractDispatchAction thisAction, List preguntas)
			throws Exception {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		PAC_IAX_SINIESTROS pac_axis_siniestros = new PAC_IAX_SINIESTROS(
				(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

		// Leer preguntas siniestro
		logger.debug("Preguntas Siniestro -> " + preguntas);

		String pCPREGUN = new String();
		for (int i = 0; i < preguntas.size(); i++) {
			Map pregunta = (Map) ((Map) preguntas.get(i)).get("OB_IAX_SIN_PREGUNTAS");
			if (i == 0) {
				pCPREGUN += pregunta.get("CPREGUN");
			} else {
				pCPREGUN += ", " + pregunta.get("CPREGUN");
			}
		}
		// Leer respuestas siniestro
		Map map = pac_axis_siniestros.ejecutaPAC_IAX_SINIESTROS__F_GET_RESP_SINIESTRO(pCPREGUN);
		logger.debug("Respuestas Siniestro -> " + map);
		List respuestas = (List) tratarRETURNyMENSAJES(request, map);

		// Mezclar las respuestas con las preguntas iniciales
		inicializarPreguntas(preguntas, respuestas, request, "axisPreguntas");
		logger.debug(
				"GUARDAMOS RESPUESTAS EN SESSION PORQUE PODEMOS TENER DESACTIVO EL MULTIREGISTRO PREGUNTAS/RESPUESTAS: "
						+ request.getSession().getAttribute("axisPreguntas"));

		logger.debug("Preguntas/Respuestas despu�s del merge -> " + preguntas);

		preguntas = separaBloques(preguntas);

		request.getSession().setAttribute("axissin_preguntasSiniestro",
				((preguntas == null) ? new ArrayList() : preguntas));

		request.getSession().setAttribute("axissin_respuestasSiniestro",
				((respuestas == null) ? new ArrayList() : respuestas));

		logger.debug("+++++++++++PREGUNTAS++++: " + preguntas);
		logger.debug("+++++++++++RESPUESTAS++++: " + respuestas);
		preguntas = null;
	}

	/*** Anade una linea en blanco cuando las preguntas cambian de bloque *****/
	private List separaBloques(List preguntas) {
		BigDecimal nbloque_ant = new BigDecimal(0);
		ArrayList preguntas_separadas = new ArrayList();
		HashMap bloque = new HashMap();
		for (int i = 0; i < preguntas.size(); i++) {
			Map pregunta = (Map) ((Map) preguntas.get(i)).get("OB_IAX_SIN_PREGUNTAS");
			logger.debug("++++pregunta: " + pregunta);
			if (i == 0) {
				nbloque_ant = (BigDecimal) pregunta.get("NBLOQUE");
			}
			if (pregunta.get("NBLOQUE").equals(nbloque_ant)) {
				preguntas_separadas.add(pregunta);
			} else {
				bloque = new HashMap();
				bloque.put("NBLOQUE", (BigDecimal) pregunta.get("NBLOQUE"));
				bloque.put("CPREGUN", "<br/>");
				logger.debug("++++bloque: " + bloque);
				preguntas_separadas.add(bloque);
				logger.debug("++++pregunta: " + pregunta);
				preguntas_separadas.add(pregunta);
			}
			nbloque_ant = (BigDecimal) pregunta.get("NBLOQUE");
		}
		logger.debug("++++preguntas_separadas: " + preguntas_separadas);

		return preguntas_separadas;
	}
}
