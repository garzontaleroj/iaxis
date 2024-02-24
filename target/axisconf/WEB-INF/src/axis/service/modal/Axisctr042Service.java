//Revision:# 6Lg1fjFFTc1A4ehrVi6c5A== #
package axis.service.modal;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.cache.AxisCodeWizard;
import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.jdbc.PAC_IAX_PARAM;
import axis.jdbc.PAC_IAX_PRODUCCION;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;
import axis.util.ConversionUtil;

/**
 * Axispro042Service.java 24/07/2008
 * 
 * @author <a href="rkirchner@csi-ti.com">Roger Kirchner</a>
 * @since Java 5.0
 */
public class Axisctr042Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE INICIALIZACION
	 *******************************************/
	/*********************************************************************************************************************/

	/**
	 * Recupera los datos de un riesgo si viene un NRIESGO informado, si no, no hace
	 * nada.
	 * 
	 * @param request
	 */
	@SuppressWarnings("all")
	public void m_form(HttpServletRequest request) {
		logger.debug("Axisctr042Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {

			if (!isEmpty(this.getCampoTextual(request, "origen"))
					&& this.getCampoTextual(request, "origen").equals("axisctr009"))
				AbstractDispatchAction.topPila(request, "CMODO", "GENERAL");

			BigDecimal NRIESGO = getCampoNumerico(request, "NRIESGO");

			if (isEmpty(NRIESGO) && !isEmpty(AbstractDispatchAction.topPila(request, "NRIESGO")))
				NRIESGO = (BigDecimal) AbstractDispatchAction.topPila(request, "NRIESGO");

			BigDecimal UNICO = getCampoNumerico(request, "UNICO");
			cargarValoresDesplegables(request, usuario, formdata);

			logger.debug("------------------------------>" + UNICO);

			/* Si NRIESGO viene informado, estamos editando, recuperar datos del riesgo */
			if (!isEmpty(NRIESGO) || !isEmpty(UNICO)) {

				if (isEmpty(NRIESGO) && !isEmpty(UNICO))
					NRIESGO = UNICO;

				Map map = new PAC_IAX_PRODUCCION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_PRODUCCION__F_GET_RIESGO(NRIESGO);
				logger.debug(map);
				Map OB_IAX_RIESGO = (Map) tratarRETURNyMENSAJES(request, map);
				logger.debug(
						"---------------------------> " + ConversionUtil.printAsXML(OB_IAX_RIESGO, "OB_IAX_RIESGO"));

				/* Recuperar su RIESDIRECCION y NRIESGO y ponerlos en formdata */
				if (!isEmpty(OB_IAX_RIESGO)) {
					Map RIESDIRECCION = (Map) OB_IAX_RIESGO.get("RIESDIRECCION");
					if (!isEmpty(RIESDIRECCION))
						formdata.putAll(RIESDIRECCION);
				}

				formdata.put("NRIESGO", NRIESGO);
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr042Service - m�todo m_form", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}

	}

	/*********************************************************************************************************************/
	/************************************************
	 * M�TODOS DE ACTUALIZACI�N
	 *******************************************/
	/*********************************************************************************************************************/

	/**
	 * Graba el riesgo domicilio.
	 * 
	 * @param request
	 * @return boolean indicando si la grabaci�n ha sido correcta o no.
	 */
	@SuppressWarnings("all")
	public boolean m_grabarRieDomicilio(HttpServletRequest request) {
		logger.debug("Axisctr042Service m_grabarRieDomicilio");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map map = new HashMap();
		HashMap m2 = this.f_Get_Avisos(request, this.whoami(this));
		BigDecimal pRETURN = (BigDecimal) this.tratarRETURNyMENSAJES(request, m2);
		try {
			if (pRETURN != null && pRETURN.intValue() != 1) {
				/* Recuperar campos formulario */
				BigDecimal NRIESGO = getCampoNumerico(request, "NRIESGO");
				String TDOMICI = getCampoTextual(request, "TDOMICI");
				String CPOSTAL = getCampoTextual(request, "CPOSTAL");
				BigDecimal CPOBLAC = getCampoNumerico(request, "CPOBLAC");
				BigDecimal CPROVIN = getCampoNumerico(request, "CPROVIN");
				BigDecimal CPAIS = getCampoNumerico(request, "CPAIS");

				// Bug 12668 - 17/02/2010 - AMC
				BigDecimal CSIGLAS = getCampoNumerico(request, "CSIGLAS_COD");
				String CSIGLAS_T = getCampoTextual(request, "CSIGLAS_TEXT");
				String TNOMVIA = getCampoTextual(request, "TNOMVIA");
				BigDecimal NNUMVIA = getCampoNumerico(request, "NNUMVIA");
				String TCOMPLE = getCampoTextual(request, "TCOMPLE");
				BigDecimal FGISX = getCampoNumerico(request, "FGISX");
				BigDecimal FGISY = getCampoNumerico(request, "FGISY");
				BigDecimal FGISZ = getCampoNumerico(request, "FGISZ");
				BigDecimal CVALIDA = getCampoNumerico(request, "CVALIDA");

				BigDecimal CVIAVP = getCampoNumerico(request, "CVIAVP");
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
				String LOCALIDAD = getCampoTextual(request, "LOCALIDAD");
				String DESCRIPCION = getCampoTextual(request, "DESCRIPCION");

				String nnumvia = isEmpty(NNUMVIA) ? "" : NNUMVIA.toString();
				String tnomvia = isEmpty(TNOMVIA) ? "" : TNOMVIA;
				String tcomple = isEmpty(TCOMPLE) ? "" : TCOMPLE;
				String csiglas_t = isEmpty(CSIGLAS_T) ? "" : CSIGLAS_T;

				if (isEmpty(TDOMICI))
					TDOMICI = csiglas_t + ' ' + tnomvia + ' ' + nnumvia + ' ' + tcomple;

				/* Grabar datos */
				map = new PAC_IAX_PRODUCCION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_PRODUCCION__F_GRABARIEDOMICILIO(NRIESGO, TDOMICI, CPOSTAL, CPOBLAC, CPROVIN,
								CPAIS, CSIGLAS, TNOMVIA, NNUMVIA, TCOMPLE, null, FGISX, FGISY, FGISZ, CVALIDA, null,
								null, CVIAVP, CLITVP, CBISVP, CORVP, NVIAADCO, CLITCO, CORCO, NPLACACO, COR2CO, CDET1IA,
								TNUM1IA, CDET2IA, TNUM2IA, CDET3IA, TNUM3IA, null, LOCALIDAD, null, DESCRIPCION);

				logger.debug(map);
				tratarRETURNyMENSAJES(request, map);
				return BigDecimal.ZERO.equals(tratarRETURNyMENSAJES(request, map));
			} else {
				return BigDecimal.ZERO.equals(pRETURN);
			}
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr042Service - m�todo m_grabarRieDomicilio", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);

			return BigDecimal.ZERO.equals(tratarRETURNyMENSAJES(request, map));
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}

	public void m_datosTomador(HttpServletRequest request) {
		logger.debug("Axisctr042Service m_datosTomador");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map map = new HashMap();
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {

			/* Obtener datos Tomador */
			map = new PAC_IAX_PRODUCCION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_PRODUCCION__F_GET_DOMICILI_PRENEDOR();
			// Map mapa_valores = (Map)tratarRETURNyMENSAJES(request,map);
			logger.debug("----> datos tomador:" + map);

			if (((BigDecimal) this.tratarRETURNyMENSAJES(request, map)).intValue() == 0) {
				formdata.putAll((Map) map.get("PSITRIESGO"));

				// tratarRETURNyMENSAJES(request,map);
				cargarValoresDesplegables(request, usuario, formdata);
			}
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr042Service - m�todo m_datosTomador", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}

	}

	private void cargarValoresDesplegables(HttpServletRequest request, UsuarioBean usuario, Map formdata)
			throws Exception {
		// Carga de valores de los desplegables
		Map listValores = new HashMap();
		try {

			PAC_IAX_LISTVALORES pac_axis_listValores = new PAC_IAX_LISTVALORES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			PAC_IAX_PARAM pac_axis_param = new PAC_IAX_PARAM(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			Map map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTTIPOVIA();
			request.setAttribute("listtipovia", (List) tratarRETURNyMENSAJES(request, map));

			map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(1006));
			request.setAttribute("listvalida", (List) tratarRETURNyMENSAJES(request, map));

			// Lista tipo direcciones
			map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTTIPODIRECCION();
			logger.debug(map);
			listValores.put("lstTipoDireccion", (List) tratarRETURNyMENSAJES(request, map));

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
			map = pac_axis_param.ejecutaPAC_IAX_PARAM__F_PAREMPRESA_N("PER_BISLETRA", usuario.getCempres());
			logger.debug(map);
			BigDecimal valor = (BigDecimal) tratarRETURNyMENSAJES(request, map);

			if (valor == null) {
				valor = new BigDecimal(800046);
			}

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

			// Lista pa�ses
//              map=pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTPAISES();
//              logger.debug(map);
//              listValores.put("lstPaises", (List)tratarRETURNyMENSAJES(request, map, false));

//              map = pac_axis_param.ejecutaPAC_IAX_PARAM__F_PAREMPRESA_N("SIN_PROVINCIAS",usuario.getCempres());   
//              BigDecimal sin_provincias = (BigDecimal)tratarRETURNyMENSAJES(request, map); 
//              formdata.put("sin_provincias", sin_provincias);

		} catch (Exception e) {
			logger.error("Error en el m�todo Axisctr042Service.cargarValoresDesplegables", e);
			AbstractDispatchAction.guardarMensaje(request, "1000050", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		} finally {
			formdata.put("listValores", listValores);
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}

	/**
	 * Guarda la pantalla, realiza su validaci�n y determina la siguiente pantalla a
	 * ejecutar.
	 * 
	 * @param request
	 */
	public void m_siguiente(HttpServletRequest request) {
		logger.debug("Axisctr042Service m_siguiente");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map map = new HashMap();
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		HashMap m2 = this.f_Get_Avisos(request, this.whoami(this));
		BigDecimal pRETURN = (BigDecimal) this.tratarRETURNyMENSAJES(request, m2);
		if (pRETURN != null && pRETURN.intValue() != 1) {
			try {
				request.setAttribute("UNICO", "UNICO");
				Boolean Ok = m_grabarRieDomicilio(request);
				if (Ok)
					request.setAttribute(Constantes.FORWARDACTION,
							AxisCodeWizard.findForward(request, Constantes.SIGUIENTE, whoami(this), null));

			} catch (Exception e) {
				logger.error("Error en el servicio Axisctr042Service - m�todo m_siguiente", e);
				AbstractDispatchAction.guardarMensaje(request, "1000050", new Object[] { e.toString() },
						Constantes.MENSAJE_ERROR);
			}
		}
	}

	/**
	 * Guarda la pantalla y determina la pantalla anterior a ejecutar.
	 * 
	 * @param request
	 */
	public void m_anterior(HttpServletRequest request) {
		logger.debug("Axisctr042Service m_anterior");
		try {
			request.setAttribute(Constantes.FORWARDACTION,
					AxisCodeWizard.findForward(request, Constantes.ANTERIOR, whoami(this), null));
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr042Service - m�todo m_anterior", e);
			AbstractDispatchAction.guardarMensaje(request, "1000050", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
	}

}
