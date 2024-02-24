//Revision:# 6Lg1fjFFTc1A4ehrVi6c5A== #
package axis.service.modal;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_DESCVALORES;
import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.jdbc.PAC_IAX_PARAM;
import axis.jdbc.PAC_IAX_PERSONA;
import axis.jdbc.PAC_IAX_PRODUCCION;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.control.modal.Axisper002Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AjaxContainerService;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

public class Axisper002Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	/*********************************************************************************************************************/
	/************************************************
	 * M�TODOS DE INICIALIZACI�N
	 *******************************************/
	/*********************************************************************************************************************/

	/**
	 * Realiza la carga inicial de la pantalla.
	 * 
	 * @param request El HttpServletRequest que contiene la petici�n del cliente
	 *                web.
	 */
	public void m_form(HttpServletRequest request) {
		logger.debug("Axisper002Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {
			/* Desplegables */
			cargarValoresDesplegables(request, usuario, formdata);

			/* Cargar direcci�n (s�lo si hay CDOMICI) */
			BigDecimal SPERSON = getCampoNumerico(request, "SPERSON");
			BigDecimal CDOMICI = getCampoNumerico(request, "CDOMICI");
			formdata.put("SPERSON", bigDecimalToString(SPERSON));
			formdata.put("CDOMICI", bigDecimalToString(CDOMICI));

			String FACEPTAR = getCampoTextual(request, "faceptar");
			formdata.put("FACEPTAR", FACEPTAR);

			if (!isEmpty(CDOMICI)) {
				PAC_IAX_PERSONA pac_axis_persona = new PAC_IAX_PERSONA(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
				Map map = pac_axis_persona.ejecutaPAC_IAX_PERSONA__F_GET_ESTDIRECCION(SPERSON, CDOMICI);
				logger.debug(map);
				if (new BigDecimal(0).equals(tratarRETURNyMENSAJES(request, map))) {
					Map OB_IAX_DIRECCIONES = (Map) map.get("PDIRECCIONES");
					if (!isEmpty(OB_IAX_DIRECCIONES))
						formdata.putAll(OB_IAX_DIRECCIONES);
					// formdata.put("TNOMVIACOL",OB_IAX_DIRECCIONES.get("TNOMVIA"));
				}

				map = pac_axis_persona.ejecutaPAC_IAX_PERSONA__F_DIRECCION_ORIGEN_INT(SPERSON, CDOMICI);
				logger.debug(map);
				if (((BigDecimal) tratarRETURNyMENSAJES(request, map)).intValue() == 0)
					formdata.put("esHost", "0");
				else
					formdata.put("esHost", "1");
			} else
				formdata.put("esHost", "1");

		} catch (Exception e) {
			logger.error("Error en el m�todo Axisper002Service.m_form", e);
			formdata.put("esHost", "1");
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	/**
	 * Realiza una carga de BD de los valores est�ticos que contiene cada
	 * desplegable de la pantalla.
	 * 
	 * @param request  El HttpServletRequest que contiene la petici�n del cliente
	 *                 web.
	 * @param usuario  El UsuarioBean activo.
	 * @param formdata HashMap que contiene los valores de los request parameters.
	 * @throws Exception
	 */

	private void cargarValoresDesplegables(HttpServletRequest request, UsuarioBean usuario, Map formdata)
			throws Exception {
		// Carga de valores de los desplegables
		Map listValores = new HashMap();
		try {
			PAC_IAX_LISTVALORES pac_axis_listValores = new PAC_IAX_LISTVALORES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			PAC_IAX_PARAM pac_axis_param = new PAC_IAX_PARAM(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			// Lista tipo direcciones
			Map map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTTIPODIRECCION();
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

			if (valor == null)
				valor = new BigDecimal(800046);

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

			map = pac_axis_param.ejecutaPAC_IAX_PARAM__F_PAREMPRESA_N("SIN_PROVINCIAS", usuario.getCempres());
			BigDecimal sin_provincias = (BigDecimal) tratarRETURNyMENSAJES(request, map);
			formdata.put("sin_provincias", sin_provincias);

		} catch (Exception e) {
			logger.error("Error en el m�todo Axisper005Service.cargarValoresDesplegables", e);
			AbstractDispatchAction.guardarMensaje(request, "1000050", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		} finally {
			formdata.put("listValores", listValores);
		}
	}

	/*********************************************************************************************************************/
	/************************************************
	 * M�TODOS DE ACTUALIZACI�N
	 *******************************************/
	/*********************************************************************************************************************/

	/**
	 * M�todo para grabar la direcci�n de la persona.
	 * 
	 * @param request    El HttpServletRequest que contiene la petici�n del cliente
	 *                   web.
	 * @param thisAction Una Action abstracta desde donde se ha invocado el servicio
	 *                   (necesaria para el log).
	 * @throws Exception
	 */

	public void m_grabarDireccion(HttpServletRequest request, AbstractDispatchAction thisAction) {
		logger.debug("Axisper002Service m_grabarDireccionPersona");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {
			PAC_IAX_PERSONA pac_axis_persona = new PAC_IAX_PERSONA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			BigDecimal SPERSON = getCampoNumerico(request, "SPERSON");
			BigDecimal CEMPRES = null; // null siempre
			// BigDecimal CAGENTE = usuario.getCagente();
			BigDecimal CAGENTE = null; // null siempre
			BigDecimal CDOMICI = getCampoNumerico(request, "CDOMICI");
			BigDecimal CTIPDIR = getCampoNumerico(request, "CTIPDIR");
			BigDecimal CSIGLAS = getCampoNumerico(request, "CSIGLAS");
			String TNOMVIA = getCampoTextual(request, "TNOMVIA");
			BigDecimal NNUMVIA = getCampoNumerico(request, "NNUMVIA");
			String TCOMPLE = getCampoTextual(request, "TCOMPLE");
			String CPOSTAL = getCampoTextual(request, "CPOSTAL");
			if (!isEmpty(CPOSTAL))
				CPOSTAL = CPOSTAL.toUpperCase();
			BigDecimal CPOBLAC = getCampoNumerico(request, "CPOBLAC");
			BigDecimal CPROVIN = getCampoNumerico(request, "CPROVIN");
			BigDecimal CPAIS = getCampoNumerico(request, "CPAIS");

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
			String TALIAS = getCampoTextual(request, "TALIAS");

			String FACEPTAR = getCampoTextual(request, "FACEPTAR");

			/*
			 * String TNOMV; if(isEmpty(TNOMVIACOL)) TNOMV = TNOMVIA; else TNOMV =
			 * TNOMVIACOL;
			 */
			String LOCALIDAD = getCampoTextual(request, "LOCALIDAD");

			Map map = pac_axis_persona.ejecutaPAC_IAX_PERSONA__F_SET_ESTDIRECCION(SPERSON, CAGENTE, CDOMICI, CTIPDIR,
					CSIGLAS, TNOMVIA, NNUMVIA, TCOMPLE, CPOSTAL, CPOBLAC, CPROVIN, CPAIS, CVIAVP, CLITVP, CBISVP, CORVP,
					NVIAADCO, CLITCO, CORCO, NPLACACO, COR2CO, CDET1IA, TNUM1IA, CDET2IA, TNUM2IA, CDET3IA, TNUM3IA,
					LOCALIDAD);

			logger.debug(map);

			if (!isEmpty(map) && !isEmpty(map.get("PCDOMICIOUT"))) {
				CDOMICI = (BigDecimal) map.get("PCDOMICIOUT");
				formdata.put("CDOMICI", CDOMICI);

			}

			Map map2 = new HashMap();
			if (FACEPTAR.indexOf("asegurados") > 0) {
				map2 = this.dbGetAsegurado(request, usuario, SPERSON);
			} else if (FACEPTAR.indexOf("tomadores") > 0) {
				map2 = this.dbGetTomador(request, usuario, SPERSON);
			}

			Map PERSONA = (Map) map2.get("RETURN");
			BigDecimal SPEREAL = (BigDecimal) PERSONA.get("SPEREAL");

			map2 = pac_axis_persona.ejecutaPAC_IAX_PERSONA__F_SET_DIRECCION(SPEREAL, null, CDOMICI, CTIPDIR, CSIGLAS,
					TNOMVIA, NNUMVIA, TCOMPLE, CPOSTAL, CPOBLAC, CPROVIN, CPAIS, CVIAVP, CLITVP, CBISVP, CORVP,
					NVIAADCO, CLITCO, CORCO, NPLACACO, COR2CO, CDET1IA, TNUM1IA, CDET2IA, TNUM2IA, CDET3IA, TNUM3IA,
					LOCALIDAD, TALIAS);
			request.setAttribute("grabarOK", (BigDecimal) tratarRETURNyMENSAJES(request, map));

		} catch (Exception e) {
			logger.error("Error en el m�todo Axisper002Service.m_grabarDireccionPersona", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	/**
	 * @param request El HttpServletRequest que contiene la petici�n del cliente
	 *                web.
	 * @throws Exception
	 */

	public void m_ajax_getProvinPobla(HttpServletRequest request) {
		logger.debug("Axisper002Service m_ajax_getProvinPobla");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {
			PAC_IAX_PERSONA pac_axis_persona = new PAC_IAX_PERSONA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			String CPOSTAL = getCampoTextual(request, "CPOSTAL");

			if (!isEmpty(CPOSTAL)) {
				CPOSTAL = CPOSTAL.toUpperCase();
				Map map = pac_axis_persona.ejecutaPAC_IAX_PERSONA__F_GET_PROVINPOBLA(CPOSTAL);
				if (!isEmpty(map) && (new BigDecimal(0).equals(ajax.rellenarPlAContenedorAjax(map))
						|| new BigDecimal(2).equals(ajax.rellenarPlAContenedorAjax(map)))) {
					Map direccion = new HashMap();
					direccion.putAll(map);
					formdata.putAll(map);
					ajax.guardarContenidoFinalAContenedorAjax(direccion);
				}
				logger.debug(map);
			}
		} catch (Exception e) {
			logger.error("Error en el servicio Axisper002Service - m�todo m_ajax_getProvinPobla", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	public void m_ajax_direccion(HttpServletRequest request, Axisper002Action thisAction) {
		logger.debug("Axisper002Service m_ajax_direccion");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {
			String op = this.getCampoTextual(request, "op");
			BigDecimal CPAIS = this.getCampoNumerico(request, "CPAIS");
			BigDecimal CPOBLAC = this.getCampoNumerico(request, "CPOBLAC");
			BigDecimal CPROVIN = this.getCampoNumerico(request, "CPROVIN");

			if (CPAIS == null) {
				CPAIS = new BigDecimal("-999");
			}
			if (CPROVIN == null) {
				CPROVIN = new BigDecimal("-999");
			}
			if (CPOBLAC == null) {
				CPOBLAC = new BigDecimal("-999");
			}

			PAC_IAX_DESCVALORES pac_axis_persona = new PAC_IAX_DESCVALORES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			if (!isEmpty(op) && op.equalsIgnoreCase("CPAIS")) {

				Map map = pac_axis_persona.ejecutaPAC_IAX_DESCVALORES__F_GET_DESCPAIS(CPAIS);
				logger.debug(map);
				ajax.rellenarPlAContenedorAjax(map);
				if (!isEmpty(map) && !isEmpty(map.get("RETURN")) && !"**".equals((String) map.get("RETURN"))) {
					Map pais = new HashMap();
					pais.put("CPAIS", CPAIS);
					pais.put("TPAIS", map.get("RETURN"));
					formdata.put("CPAIS", CPAIS);
					formdata.put("TPAIS", map.get("RETURN"));
					ajax.guardarContenidoFinalAContenedorAjax(pais);
				} else if ("**".equals((String) map.get("RETURN"))) {
					Map pais = new HashMap();
					pais.put("CPAIS", CPAIS);
					formdata.put("CPROVIN", CPROVIN);
					pais.put(Constantes.OPERACION_AJAX_ERROR, Constantes.OPERACION_AJAX_ERROR);
					ajax.guardarContenidoFinalAContenedorAjax(pais);
				}
			} else if (!isEmpty(op) && op.equalsIgnoreCase("CPROVIN")) {
				Map map = pac_axis_persona.ejecutaPAC_IAX_DESCVALORES__F_GET_DESCPROVINCIA(CPROVIN, CPAIS);
				logger.debug(map);
				ajax.rellenarPlAContenedorAjax(map);
				if (!isEmpty(map) && !isEmpty(map.get("RETURN")) && !"**".equals((String) map.get("RETURN"))) {
					Map provincia = new HashMap();
					provincia.put("CPROVIN", CPROVIN);
					provincia.put("TPROVIN", map.get("RETURN"));
					formdata.put("CPROVIN", CPROVIN);
					formdata.put("TPROVIN", map.get("RETURN"));
					ajax.guardarContenidoFinalAContenedorAjax(provincia);
				} else if ("**".equals((String) map.get("RETURN"))) {
					Map provincia = new HashMap();
					provincia.put("CPROVIN", CPROVIN);
					formdata.put("CPROVIN", CPROVIN);
					provincia.put(Constantes.OPERACION_AJAX_ERROR, Constantes.OPERACION_AJAX_ERROR);
					ajax.guardarContenidoFinalAContenedorAjax(provincia);
				}
			} else if (!isEmpty(op) && op.equalsIgnoreCase("CPOBLAC")) {
				Map map = pac_axis_persona.ejecutaPAC_IAX_DESCVALORES__F_GET_DESCPROBLACION(CPROVIN, CPOBLAC);
				logger.debug(map);
				ajax.rellenarPlAContenedorAjax(map);
				if (!isEmpty(map) && !isEmpty(map.get("RETURN")) && !"**".equals((String) map.get("RETURN"))) {
					Map poblacion = new HashMap();
					poblacion.put("CPOBLAC", CPOBLAC);
					poblacion.put("TPOBLAC", map.get("RETURN"));
					formdata.put("CPOBLAC", CPOBLAC);
					formdata.put("TPOBLAC", map.get("RETURN"));
					ajax.guardarContenidoFinalAContenedorAjax(poblacion);
				} else if ("**".equals((String) map.get("RETURN"))) {
					Map poblacion = new HashMap();
					poblacion.put("CPOBLAC", CPOBLAC);
					formdata.put("CPOBLAC", CPOBLAC);
					poblacion.put(Constantes.OPERACION_AJAX_ERROR, Constantes.OPERACION_AJAX_ERROR);
					ajax.guardarContenidoFinalAContenedorAjax(poblacion);
				}
			} else if (!isEmpty(op) && op.equalsIgnoreCase("CPOBLACSINPROV")) {
				Map map = pac_axis_persona.ejecutaPAC_IAX_DESCVALORES__F_GET_DESCPOBLACIONSINPROV(CPOBLAC);
				logger.debug(map);
				ajax.rellenarPlAContenedorAjax(map);
				if (!isEmpty(map) && !isEmpty(map.get("RETURN")) && !"**".equals((String) map.get("RETURN"))) {
					Map poblacion = new HashMap();
					poblacion.put("CPOBLAC", CPOBLAC);
					poblacion.put("TPOBLAC", map.get("RETURN"));
					poblacion.put("CPROVIN", map.get("CPROVIN"));
					formdata.put("CPOBLAC", CPOBLAC);
					formdata.put("TPOBLAC", map.get("RETURN"));
					formdata.put("CPROVIN", map.get("CPROVIN"));
					ajax.guardarContenidoFinalAContenedorAjax(poblacion);
				} else if ("**".equals((String) map.get("RETURN"))) {
					Map poblacion = new HashMap();
					poblacion.put("CPOBLAC", CPOBLAC);
					formdata.put("CPOBLAC", CPOBLAC);
					poblacion.put(Constantes.OPERACION_AJAX_ERROR, Constantes.OPERACION_AJAX_ERROR);
					ajax.guardarContenidoFinalAContenedorAjax(poblacion);
				}
			} else {
				ajax.guardarContenidoFinalAContenedorAjax(Constantes.OPERACION_AJAX_ERROR);
			}
		} catch (Exception e) {
			logger.error("Error en el servicio Axisper005Service - m�todo m_ajax_direccion", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	public void m_ajaxgetInfoHost(HttpServletRequest request, Axisper002Action thisAction) {
		logger.debug("Axisper002Service m_ajaxgetInfoHost");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {
			BigDecimal SPERSON = getCampoNumerico(request, "SPERSON");
			BigDecimal CDOMICI = getCampoNumerico(request, "CDOMICI");

			/*
			 * SPERSON = new BigDecimal(17327); CDOMICI = new BigDecimal(1);
			 */
			logger.debug(SPERSON);
			PAC_IAX_PERSONA pac_axis_persona = new PAC_IAX_PERSONA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map map = pac_axis_persona.ejecutaPAC_IAX_PERSONA__F_GET_DIRECCION_TRECIBIDO(SPERSON, CDOMICI);
			logger.debug(map);
			ajax.rellenarPlAContenedorAjax(map);
		} catch (Exception e) {
			logger.error("Error en el servicio Axisper002Service - m�todo m_ajaxgetInfoHost", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	/**
	 * Recupera un tomador especificado.
	 * 
	 * @param usuario
	 * @param SPERSON
	 * @return
	 * @throws Exception
	 */
	private Map dbGetTomador(HttpServletRequest request, UsuarioBean usuario, BigDecimal SPERSON) throws Exception {
		Map map = new PAC_IAX_PRODUCCION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_PRODUCCION__F_GET_TOMADOR(SPERSON);
		logger.debug(map);
		return map;
	}

	/**
	 * Recupera un asegurado especificado.
	 * 
	 * @param usuario
	 * @param SPERSON
	 * @return
	 * @throws Exception
	 */
	private Map dbGetAsegurado(HttpServletRequest request, UsuarioBean usuario, BigDecimal SPERSON) throws Exception {
		Map map = new PAC_IAX_PRODUCCION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_PRODUCCION__F_GET_ASEGURADO(SPERSON);
		logger.debug(map);
		return map;
	}

}
