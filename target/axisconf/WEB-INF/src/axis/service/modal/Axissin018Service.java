package axis.service.modal;

import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.jdbc.PAC_IAX_SINIESTROS;
import axis.mvc.control.modal.Axissin018Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

public class Axissin018Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());
	SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");

	/**
	 * M�todo que carga los datos de administraci�n del producto
	 * 
	 * @param request
	 * @param thisAction
	 * @throws Exception
	 */
	private void cargarListas(HttpServletRequest request, Axissin018Action thisAction) throws Exception {

		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map listValores = new HashMap();
		// Carga de las PAC_IAX PL/SQL
		PAC_IAX_LISTVALORES pac_axis_listValores = new PAC_IAX_LISTVALORES(
				(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

		BigDecimal SPRODUC = getCampoNumerico(request, "SPRODUC");
		BigDecimal CACTIVI = getCampoNumerico(request, "CACTIVI");
		Map map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(802));
		listValores.put("tipo_inf", (List) tratarRETURNyMENSAJES(request, map));
		request.setAttribute("listValores", listValores);

	}

	/**
	 * M�todo que se llama al inicio de este flujo. Realiza la carga inicial de los
	 * datos de los combos.
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_form(HttpServletRequest request, Axissin018Action thisAction) {
		logger.debug("Axissin011Service m_guardar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		logger.debug("Axissin011Service m_form");

		String MOD_TRAM = getCampoTextual(request, "MOD_TRAM");
		if (MOD_TRAM != null) {
			formdata.put("MOD_TRAM", MOD_TRAM);

		}

		try {

			BigDecimal NTRAMIT = getCampoNumerico(request, "NTRAMIT");
			if (isEmpty(NTRAMIT))
				NTRAMIT = getCampoNumerico(request, "indexTramitacio");
			BigDecimal NDANO = getCampoNumerico(request, "NDANO");
			String NSINIES = getCampoTextual(request, "NSINIES");
			String isNew = getCampoTextual(request, "isNew");
			logger.debug(isNew);

			cargarListas(request, thisAction);

			PAC_IAX_SINIESTROS pac_axis_siniestros = new PAC_IAX_SINIESTROS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			if (!isEmpty(isNew) && !isNew.equals("yes")) {
				Map map = pac_axis_siniestros.ejecutaPAC_IAX_SINIESTROS__F_GET_OBJETO_SINTRAMIDANYO(NSINIES, NTRAMIT,
						NDANO);

				logger.debug(map);
				if (!isEmpty((Map) tratarRETURNyMENSAJES(request, map))) {
					formdata.putAll((Map) map.get("RETURN"));
				}

			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axissin018Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.configForm(request, whoami(this));
		}
	}

	public void m_guardar(HttpServletRequest request, Axissin018Action thisAction) {

		logger.debug("Axissin011Service m_guardar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {

			PAC_IAX_SINIESTROS pac_axis_siniestros = new PAC_IAX_SINIESTROS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			request.setAttribute("OK", "!OK");
			BigDecimal SSEGURO = this.getCampoNumerico(request, "SSEGURO");
			logger.debug("SSEGURO-->" + SSEGURO);
			String NSINIES = this.getCampoTextual(request, "NSINIES");
			logger.debug("NSINIES-->" + NSINIES);
			BigDecimal NTRAMIT = getCampoNumerico(request, "NTRAMIT");
			logger.debug("NTRAMIT-->" + NTRAMIT);
			BigDecimal NDANO = getCampoNumerico(request, "NDANO");
			logger.debug("NDANO-->" + NDANO);
			BigDecimal CTPINF = getCampoNumerico(request, "CTPINF");
			logger.debug("CTPINF-->" + CTPINF);
			String TDANO = this.getCampoTextual(request, "comentario");
			logger.debug("TDANO-->" + NSINIES);

			/* Recoger valores de los danyos */
			BigDecimal DANO0 = getCampoNumerico(request, "coddanyo_SIND");
			BigDecimal DANO1 = getCampoNumerico(request, "coddanyo_01");
			BigDecimal DANO2 = getCampoNumerico(request, "coddanyo_02");
			BigDecimal DANO3 = getCampoNumerico(request, "coddanyo_03");
			BigDecimal DANO4 = getCampoNumerico(request, "coddanyo_04");
			BigDecimal DANO5 = getCampoNumerico(request, "coddanyo_05");
			BigDecimal DANO6 = getCampoNumerico(request, "coddanyo_06");
			BigDecimal DANO7 = getCampoNumerico(request, "coddanyo_07");
			BigDecimal DANO8 = getCampoNumerico(request, "coddanyo_GENE");
			BigDecimal DANO9 = getCampoNumerico(request, "coddanyo_LUNA");
			BigDecimal DANO10 = getCampoNumerico(request, "coddanyo_BAJO");

			/* Si est� marcado inicializamos el valor a uno */
			if (DANO0 != null) {
				DANO0 = new BigDecimal("1");
			}
			if (DANO1 != null) {
				DANO1 = new BigDecimal("1");
			}
			if (DANO2 != null) {
				DANO2 = new BigDecimal("1");
			}
			if (DANO3 != null) {
				DANO3 = new BigDecimal("1");
			}
			if (DANO4 != null) {
				DANO4 = new BigDecimal("1");
			}
			if (DANO5 != null) {
				DANO5 = new BigDecimal("1");
			}
			if (DANO6 != null) {
				DANO6 = new BigDecimal("1");
			}
			if (DANO7 != null) {
				DANO7 = new BigDecimal("1");
			}
			if (DANO8 != null) {
				DANO8 = new BigDecimal("1");
			}
			if (DANO9 != null) {
				DANO9 = new BigDecimal("1");
			}
			if (DANO10 != null) {
				DANO10 = new BigDecimal("1");
			}

			Map map = pac_axis_siniestros.ejecutaPAC_IAX_SINIESTROS__F_SET_OBJETO_SINTRAMIDETDANYO(NSINIES, NTRAMIT,
					NDANO, CTPINF, TDANO, DANO0, DANO1, DANO2, DANO3, DANO4, DANO5, DANO6, DANO7, DANO8, DANO9, DANO10);

			logger.debug(map);

			if (((BigDecimal) tratarRETURNyMENSAJES(request, map)).intValue() == 0) {
				request.setAttribute("OK", "OK"); // guardamos, etc y no ha habido error
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axissin018Service - m�todo m_guardar", e);
			thisAction.guardarMensaje(request, "1000052", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.configForm(request, whoami(this));
		}
	}

	/*
	 * ******************************************
	 * **************************************
	 */
	/*
	 * ************************************* AJAX
	 * **************************************
	 */
	/*
	 * *****************************************************************************
	 * ****
	 */

}
