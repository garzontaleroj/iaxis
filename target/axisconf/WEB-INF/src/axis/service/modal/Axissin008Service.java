package axis.service.modal;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.jdbc.PAC_IAX_PARAM;
import axis.jdbc.PAC_IAX_SINIESTROS;
import axis.mvc.control.modal.Axissin008Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AjaxContainerService;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

public class Axissin008Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	/**
	 * M�todo que carga los datos de administraci�n del producto
	 * 
	 * @param request
	 * @param thisAction
	 * @throws Exception
	 */
	private void cargarListas(HttpServletRequest request) throws Exception {
		logger.debug("Axissin008Service m_cargarCombos");
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map listValores = new HashMap();
		PAC_IAX_LISTVALORES pac_axis_listValores = new PAC_IAX_LISTVALORES(
				(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

		PAC_IAX_SINIESTROS pac_iax_siniestros = new PAC_IAX_SINIESTROS(
				(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

		PAC_IAX_PARAM pac_axis_param = new PAC_IAX_PARAM(
				(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

		// Lista pa�ses
		Map map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTPAISES();
		logger.debug(map);
		listValores.put("lstPaises", (List) tratarRETURNyMENSAJES(request, map, false));

		// Lista tipo v�as
		map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTTIPOVIA();
		logger.debug(map);
		listValores.put("lstTipoVia", (List) tratarRETURNyMENSAJES(request, map));

		// Lista C�digo V�a predio
		map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(800042));
		logger.debug(map);
		listValores.put("lstCodViaPrevio", (List) tratarRETURNyMENSAJES(request, map));

		// Lista Literal predio
		map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(800043));
		logger.debug(map);
		listValores.put("lstCLITVP", (List) tratarRETURNyMENSAJES(request, map));

		// Bis predio
		map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(800044));
		logger.debug(map);
		listValores.put("lstCBISVP", (List) tratarRETURNyMENSAJES(request, map));

		// Cod. Orientaci�n predio
		map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(800046));
		logger.debug(map);
		listValores.put("lstCORVP", (List) tratarRETURNyMENSAJES(request, map));

		// Literal predio
		map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(800043));
		logger.debug(map);
		listValores.put("lstCLITCO", (List) tratarRETURNyMENSAJES(request, map));

		// Cod. Orientaci�n predio
		// Cod. Orientaci�n predio
		map = pac_axis_param.ejecutaPAC_IAX_PARAM__F_PAREMPRESA_N("PER_BISLETRA", usuario.getCempres());
		logger.debug(map);
		BigDecimal valor = (BigDecimal) tratarRETURNyMENSAJES(request, map);

		if (valor == null)
			valor = new BigDecimal(800046);

		logger.debug("LSTCORCO ++++valor" + valor);
		map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(valor);
		logger.debug(map);
		listValores.put("lstCORCO", (List) tratarRETURNyMENSAJES(request, map));

		// Cod. Orientaci�n predio
		map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(800046));
		logger.debug(map);
		listValores.put("lstCOR2CO", (List) tratarRETURNyMENSAJES(request, map));

		// Detalle predio
		map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(800047));
		logger.debug(map);
		listValores.put("lstCDET", (List) tratarRETURNyMENSAJES(request, map));

		formdata.put("listvalores", listValores);

		// Localizaciones existentes para copiar
		String NSINIES = getCampoTextual(request, "NSINIES");
		BigDecimal NTRAMIT = getCampoNumerico(request, "NTRAMIT");

		map = pac_iax_siniestros.ejecutaPAC_IAX_SINIESTROS__F_GET_LSTLOCALIZA(NSINIES, NTRAMIT);
		logger.debug(map);
		formdata.put("LSTLOCALIZA", (List) tratarRETURNyMENSAJES(request, map));

	}

	/**
	 * M�todo que se llama al inicio de este flujo. Realiza la carga inicial de los
	 * datos de los combos.
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_form(HttpServletRequest request, Axissin008Action thisAction) {
		logger.debug("Axissin008Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {
			BigDecimal indexTramitacio = getCampoNumerico(request, "indexTramitacio");
			BigDecimal NLOCALI = getCampoNumerico(request, "NLOCALI");
			String NSINIES = getCampoTextual(request, "NSINIES");
			formdata.put("NSINIES", NSINIES);
			logger.debug("++++NSINIES" + NSINIES);
			String isNew = getCampoTextual(request, "isNew");
			BigDecimal NTRAMIT = getCampoNumerico(request, "NTRAMIT");
			formdata.put("NTRAMIT", NTRAMIT);
			logger.debug("++++NTRAMIT" + NTRAMIT);

			// consulta de datos localizacion AB
			BigDecimal CMODO = getCampoNumerico(request, "MODO");
			formdata.put("CMODO", CMODO);

			logger.debug(isNew);
			this.cargarListas(request);

			if (!isEmpty(isNew) && !isNew.equals("yes")) {
				PAC_IAX_SINIESTROS pac_axis_siniestros = new PAC_IAX_SINIESTROS(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
				Map map = pac_axis_siniestros.ejecutaPAC_IAX_SINIESTROS__F_GET_OBJETO_SINTRAMILOCALI(NSINIES, NTRAMIT,
						NLOCALI);

				logger.debug(map);
				if (!isEmpty((Map) tratarRETURNyMENSAJES(request, map))) {
					formdata.putAll((Map) map.get("RETURN"));
					// Map m = (Map)map.get("RETURN");
					// formdata.put("TNOMVIACOL",m.get("TNOMVIA"));

				}
			}
			logger.debug("ee");

		} catch (Exception e) {
			logger.error("Error en el servicio Axispro004Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	public void m_guardar(HttpServletRequest request, Axissin008Action thisAction) {

		logger.debug("Axissin008Service m_guardar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {

			PAC_IAX_SINIESTROS pac_axis_siniestros = new PAC_IAX_SINIESTROS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			request.setAttribute("OK", "!OK");
			String TLOCALI = isEmpty(this.getCampoTextual(request, "TLOCALI")) ? null
					: this.getCampoTextual(request, "TLOCALI");
			logger.debug("TLOCALI-->" + TLOCALI);
			BigDecimal SSEGURO = this.getCampoNumerico(request, "SSEGURO");
			logger.debug("SSEGURO-->" + SSEGURO);
			String NSINIES = this.getCampoTextual(request, "NSINIES");
			logger.debug("NSINIES-->" + NSINIES);
			BigDecimal NTRAMIT = getCampoNumerico(request, "NTRAMIT");
			logger.debug("NTRAMIT-->" + NTRAMIT);
			BigDecimal NLOCALI = getCampoNumerico(request, "NLOCALI");
			logger.debug("NLOCALI-->" + NLOCALI);
			BigDecimal SPERSON = getCampoNumerico(request, "SPERSON");
			logger.debug("SPERSON-->" + SPERSON);
			BigDecimal CSIGLAS = !isEmpty(TLOCALI) ? null : getCampoNumerico(request, "CSIGLAS");
			logger.debug("CSIGLAS-->" + CSIGLAS);
			BigDecimal NNUMVIA = !isEmpty(TLOCALI) ? null : getCampoNumerico(request, "NNUMVIA");
			logger.debug("NNUMVIA-->" + NNUMVIA);
			String TNOMVIA = !isEmpty(TLOCALI) ? null : this.getCampoTextual(request, "TNOMVIA");
			logger.debug("TNOMVIA-->" + TNOMVIA);
			String TCOMPLE = !isEmpty(TLOCALI) ? null : this.getCampoTextual(request, "TCOMPLE");
			logger.debug("TCOMPLE-->" + TCOMPLE);

			BigDecimal CPAIS = !isEmpty(TLOCALI) ? null : getCampoNumerico(request, "CPAIS");
			logger.debug("CPAIS-->" + CPAIS);
			BigDecimal CPROVIN = !isEmpty(TLOCALI) ? null : getCampoNumerico(request, "CPROVIN");
			logger.debug("CPROVIN-->" + CPROVIN);
			BigDecimal CPOBLAC = !isEmpty(TLOCALI) ? null : getCampoNumerico(request, "CPOBLAC");
			logger.debug("CPOBLAC-->" + CPOBLAC);
			String CPOSTAL = !isEmpty(TLOCALI) ? null : this.getCampoTextual(request, "CPOSTAL");
			if (!isEmpty(CPOSTAL))
				CPOSTAL = CPOSTAL.toUpperCase();
			logger.debug("CPOSTAL-->" + CPOSTAL);

			// Bug 18940/92686 - 29/09/2011 - AMC
			BigDecimal CVIAVP = getCampoNumerico(request, "CVIAVP");
			// String TNOMVIACOL = getCampoTextual(request, "TNOMVIACOL");
			BigDecimal CLITVP = getCampoNumerico(request, "CLITVP");
			BigDecimal CBISVP = getCampoNumerico(request, "CBISVP");
			BigDecimal CORVP = getCampoNumerico(request, "CORVP");
			BigDecimal NVIAADCO = getCampoNumerico(request, "NVIAADCO");
			BigDecimal CLITCO = getCampoNumerico(request, "CLITCO");
			BigDecimal CORCO = getCampoNumerico(request, "CORCO");
			BigDecimal NPLACACO = getCampoNumerico(request, "NPLACACO");
			BigDecimal COR2CO = getCampoNumerico(request, "COR2CO");
			BigDecimal CDET1IA = getCampoNumerico(request, "CDET1IA");
			String TNUM1IA = getCampoTextual(request, "TNUM1IA");
			BigDecimal CDET2IA = getCampoNumerico(request, "CDET2IA");
			String TNUM2IA = getCampoTextual(request, "TNUM2IA");
			BigDecimal CDET3IA = getCampoNumerico(request, "CDET3IA");
			String TNUM3IA = getCampoTextual(request, "TNUM3IA");

			/*
			 * String TNOMV; if(isEmpty(TNOMVIACOL)) TNOMV = TNOMVIA; else TNOMV =
			 * TNOMVIACOL;
			 */
			String LOCALIDAD = getCampoTextual(request, "LOCALIDAD");
			/* INI IAXIS-4961 EAD:13/08/2020 */
			BigDecimal CCONTABLE;
			if (getCampoNumerico(request, "CCONTABLE") == null) {
				CCONTABLE = BigDecimal.ZERO;
			} else {
				CCONTABLE = getCampoNumerico(request, "CCONTABLE");
			}
			/* FIN IAXIS-4961 EAD:13/08/2020 */
			Map map = pac_axis_siniestros.ejecutaPAC_IAX_SINIESTROS__F_SET_OBJETO_SINTRAMILOCALI(NSINIES, NTRAMIT,
					NLOCALI, SPERSON, CSIGLAS, TNOMVIA, NNUMVIA, TCOMPLE, TLOCALI, CPAIS, CPROVIN, CPOBLAC, CPOSTAL,
					CVIAVP, CLITVP, CBISVP, CORVP, NVIAADCO, CLITCO, CORCO, NPLACACO, COR2CO, CDET1IA, TNUM1IA, CDET2IA,
					TNUM2IA, CDET3IA, TNUM3IA, LOCALIDAD, CCONTABLE/* IAXIS-4961 EAD:13/08/2020 */);

			logger.debug(map);

			if (((BigDecimal) tratarRETURNyMENSAJES(request, map)).intValue() == 0) {
				request.setAttribute("OK", "OK"); // guardamos, etc y no ha habido error
			}
		} catch (Exception e) {
			logger.error("Error en el servicio Axissin009Service - m�todo m_guardar", e);
			thisAction.guardarMensaje(request, "1000052", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);

		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	public void m_ajax_getDatosLocali(HttpServletRequest request) {
		logger.debug("Axissin008Service m_ajax_getDatosLocali");
		AjaxContainerService ajax = new AjaxContainerService();
		try {
			ajax.guardarContenidoFinalAContenedorAjax(this.get_datos_locali(request));
		} catch (Exception e) {
			logger.error("Error en el servicio Axissin008Service - m�todo m_ajax_getDatosLocali", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	private List get_datos_locali(HttpServletRequest request) throws Exception {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();

		String pNSINIES = this.getCampoTextual(request, "NSINIES");
		BigDecimal pNTRAMIT = this.getCampoNumerico(request, "NTRAMIT");
		BigDecimal pNLOCALI = this.getCampoNumerico(request, "NLOCALI");

		PAC_IAX_SINIESTROS pac_iax_siniestros = new PAC_IAX_SINIESTROS(
				(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

		Map map = pac_iax_siniestros.ejecutaPAC_IAX_SINIESTROS__F_GET_LOCALIZA(pNSINIES, pNTRAMIT, pNLOCALI);

		logger.debug("++++map datos locali " + map);
		List listaDatos = (List) ajax.rellenarPlAContenedorAjax(map);

		return listaDatos;
	}
}
