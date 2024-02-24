package axis.service.modal;

import java.math.BigDecimal;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.jdbc.PAC_IAX_MNTPREGUNPROD;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.control.modal.Axispro041Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

/**
 * Axispro041Service.java
 * 
 * @author <a href="rkirchner@csi-ti.com">Roger Kirchner</a>
 * @since Java 5.0
 */
public class Axispro041Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());
	public static BigDecimal CTIPPRE;

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE INICIALIZACION
	 *******************************************/
	/*********************************************************************************************************************/

	/**
	 * Carga inicial de la pantalla. Carga de BD: - Los datos t�cnicos. - Los
	 * diferentes valores de los combos. - Llama a #m_cargarCuadroInteres
	 * 
	 * @param request
	 */

	@SuppressWarnings("all")
	public void m_form(HttpServletRequest request) {
		logger.debug("Axispro041Service m_form");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {

			Map map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(787));
			request.setAttribute("LISTTIPO", tratarRETURNyMENSAJES(request, map));

			map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(52));
			request.setAttribute("LISTOBLI", tratarRETURNyMENSAJES(request, map));

			map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(1007));
			request.setAttribute("LISTNIVEL", tratarRETURNyMENSAJES(request, map));

			map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(1008));
			request.setAttribute("LISTMODO", tratarRETURNyMENSAJES(request, map));

			map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(1121));
			request.setAttribute("LISTVISI", tratarRETURNyMENSAJES(request, map));

			CTIPPRE = getCampoNumerico(request, "CTIPPRE");
			BigDecimal PCPREGUN = getCampoNumerico(request, "CPREGUN");
			BigDecimal SPRODUC = getCampoNumerico(request, "SPRODUC");
			BigDecimal CACTIVI = getCampoNumerico(request, "CACTIVI");
			BigDecimal CGARANT = getCampoNumerico(request, "CGARANT");
			BigDecimal CPREGUN = getCampoNumerico(request, "CPREGUN");
			String MODO = getCampoTextual(request, "MODO");

			if (!isEmpty(PCPREGUN)) {
				map = new PAC_IAX_MNTPREGUNPROD((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_MNTPREGUNPROD__F_GET_DESCPREGUN(PCPREGUN, MODO, SPRODUC, CACTIVI, CGARANT,
								usuario.getCidioma());
				CTIPPRE = (BigDecimal) map.get("PCTIPPRE");
				formdata.put("CTIPPRE", CTIPPRE);
			}

			logger.debug("---> form CTIPPRE:" + CTIPPRE);

			if (!isEmpty(CTIPPRE)) {
				if (CTIPPRE.equals(new BigDecimal(1)) || CTIPPRE.equals(new BigDecimal(2))) {
					map = new PAC_IAX_MNTPREGUNPROD((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
							.ejecutaPAC_IAX_MNTPREGUNPROD__F_GET_LISTRESPUE(PCPREGUN, CTIPPRE, usuario.getCidioma());
					logger.debug("----> lista respuestas:" + map);
					request.setAttribute("LISTARESP", tratarRETURNyMENSAJES(request, map));
				}
			}

			logger.debug("---> SPRODUC:" + SPRODUC + " CACTIVI:" + CACTIVI + " CGARANT:" + CGARANT + " MODO:" + MODO);

			formdata.put("MODO", MODO);
			formdata.put("SPRODUC", SPRODUC);
			formdata.put("CACTIVI", CACTIVI);
			formdata.put("CGARANT", CGARANT);

			if (!isEmpty(CPREGUN)) {
				map = new PAC_IAX_MNTPREGUNPROD((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_MNTPREGUNPROD__F_GET_PREGUNTA(PCPREGUN, MODO, SPRODUC, CACTIVI, CGARANT);
				logger.debug("----> pregunta:" + map);
				if (MODO.equals(new String("PROD"))) {
					formdata.putAll((Map) map.get("PROPREGUNTAS"));
				}

				if (MODO.equals(new String("ACT"))) {
					formdata.putAll((Map) map.get("PACTPREGUNTAS"));
				}

				if (MODO.equals(new String("GAR"))) {
					formdata.putAll((Map) map.get("PGARPREGUNTAS"));
				}

			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axispro041Service - m�todo m_form", e);
			AbstractDispatchAction.guardarMensaje(request, "1000050", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}

	/**
	 * M�todo que realiza la b�squeda de preguntas en funci�n de los par�metros de
	 * filtro seleccionados.
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_buscarpreg(HttpServletRequest request, Axispro041Action thisAction) {
		logger.debug("Axispro041Service m_buscarpreg");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {

			BigDecimal CPREGUNTA = getCampoNumerico(request, "CPREGUN");
			BigDecimal SPRODUC = getCampoNumerico(request, "SPRODUC");
			BigDecimal CACTIVI = getCampoNumerico(request, "CACTIVI");
			BigDecimal CGARANT = getCampoNumerico(request, "CGARANT");
			String MODO = getCampoTextual(request, "MODO");

			Map map = new PAC_IAX_MNTPREGUNPROD((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_MNTPREGUNPROD__F_GET_DESCPREGUN(CPREGUNTA, MODO, SPRODUC, CACTIVI, CGARANT,
							usuario.getCidioma());
			logger.debug("---> pregunta:" + map);

			if (map.get("RETURN").equals(new BigDecimal(0))) {
				formdata.put("TPREGUN", map.get("PDESCPREG"));
				formdata.put("CTIPPRE", map.get("PCTIPPRE"));
				logger.debug("---> CTIPPRE:" + map.get("PCTIPPRE"));
			} else {
				formdata.remove("CPREGUN");
				formdata.remove("TPREGUN");
			}
			tratarRETURNyMENSAJES(request, map);

		} catch (Exception e) {
			logger.error("Error en el servicio Axispro042Service - m�todo m_buscarpreg", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}

	}

	/**
	 * M�todo que realiza la inserci�n de la una pregunta.
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_guardarpreg(HttpServletRequest request, Axispro041Action thisAction) {
		logger.debug("Axispro041Service m_guardarpreg");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {

			BigDecimal PCPREGUN = getCampoNumerico(request, "CPREGUN");
			String PTABLA = getCampoTextual(request, "MODO");
			BigDecimal PSPRODUC = getCampoNumerico(request, "SPRODUC");
			BigDecimal PCACTIVI = getCampoNumerico(request, "CACTIVI");
			BigDecimal PCGARANT = getCampoNumerico(request, "CGARANT");
			BigDecimal PCPRETIP = getCampoNumerico(request, "CPRETIP");
			BigDecimal PNPREORD = getCampoNumerico(request, "NPREORD");
			String PTPREFOR = getCampoTextual(request, "TPREFOR");
			BigDecimal PCPREOBL = getCampoNumerico(request, "CPREOBL");
			BigDecimal PNPREIMP = getCampoNumerico(request, "NPREIMP");
			BigDecimal PCRESDEF = null;
			if (CTIPPRE.intValue() == 2) {
				String field = null;
				field = (String) formdata.get("CRESDEF");
				if (!isEmpty(field)) {
					if (field.indexOf(".") != -1)
						field = field.substring(0, field.indexOf("."));

					formdata.put("CRESDEF", new BigDecimal(field));
					PCRESDEF = new BigDecimal(field);
				}
			}

			else
				PCRESDEF = getCampoNumerico(request, "CRESDEF");
			BigDecimal PCOFERSN = getCampoNumerico(request, "COFERSN");
			String PTVALFOR = getCampoTextual(request, "TVALFOR");
			BigDecimal PCMODO = getCampoNumerico(request, "CMODO");
			BigDecimal PCNIVEL = getCampoNumerico(request, "CNIVEL");
			BigDecimal PCTARPOL = getCampoNumerico(request, "CTARPOL");
			BigDecimal PCVISIBLE = getCampoNumerico(request, "CVISIBLE");
			BigDecimal PCESCCERO = getCampoNumerico(request, "ESCCERO");
			BigDecimal PCVISIBLECOL = getCampoNumerico(request, "VISIBLECOL");
			BigDecimal PCVISIBLECERT = getCampoNumerico(request, "VISIBLECERT");
			BigDecimal PCCRECARG = getCampoNumerico(request, "CRECARG");

			Map map = new PAC_IAX_MNTPREGUNPROD((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_MNTPREGUNPROD__F_SET_PREGUNTA(PCPREGUN, PTABLA, PSPRODUC, PCACTIVI, PCGARANT,
							PCPRETIP, PNPREORD, PTPREFOR, PCPREOBL, PNPREIMP, PCRESDEF, PCOFERSN, PTVALFOR, PCMODO,
							PCNIVEL, PCTARPOL, PCVISIBLE, PCESCCERO, PCVISIBLECOL, PCVISIBLECERT, PCCRECARG);
			logger.debug("---> pregunta:" + map);

			if (map.get("RETURN").equals(new BigDecimal(0))) {
				request.setAttribute("OK", 1);
			}
			tratarRETURNyMENSAJES(request, map);

		} catch (Exception e) {
			logger.error("Error en el servicio Axispro042Service - m�todo m_guardarpreg", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}

	}

}
