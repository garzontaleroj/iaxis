package axis.service.modal;

import java.math.BigDecimal;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_COMMON;
import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.jdbc.PAC_IAX_PARAM;
import axis.jdbc.PAC_IAX_PERSONA;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.control.modal.Axisper014Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AjaxContainerService;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

public class Axisper014Service extends AxisBaseService {
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
		logger.debug("Axisper014Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {
			/* Desplegables */
			cargarValoresDesplegables(request, usuario, formdata);

			/* Cargar CCC (s�lo si hay CNORDBAN) */

			BigDecimal SPERSON = getCampoNumerico(request, "SPERSON");
			BigDecimal CNORDBAN = getCampoNumerico(request, "CNORDBAN");
			BigDecimal CBANCO = null;
			String MODO = getCampoTextual(request, "MODO");

			formdata.put("SPERSON", bigDecimalToString(SPERSON));
			formdata.put("CNORDBAN", bigDecimalToString(CNORDBAN));
			formdata.put("MODO", MODO);

			if (!isEmpty(CNORDBAN) && isEmpty(getCampoTextual(request, "TTIPBAN"))) {
				PAC_IAX_PERSONA pac_axis_persona = new PAC_IAX_PERSONA(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
				Map map = pac_axis_persona.ejecutaPAC_IAX_PERSONA__F_GET_CCC(SPERSON, CNORDBAN);
				logger.debug(map);
				PAC_IAX_COMMON PAC_IAX_COMMON = new PAC_IAX_COMMON(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

				if (new BigDecimal(0).equals(tratarRETURNyMENSAJES(request, map, false))) {
					Map OB_IAX_CCC = (Map) map.get("CCC");
					if (!isEmpty(OB_IAX_CCC)) {
						Map CFORMAT = PAC_IAX_COMMON.ejecutaPAC_IAX_COMMON__F_FORMATCCC(
								new BigDecimal(String.valueOf(OB_IAX_CCC.get("CTIPBAN"))),
								(String) OB_IAX_CCC.get("CBANCAR"));
						OB_IAX_CCC.put("CBANCAR", CFORMAT.get("RETURN"));

						String CBANCAR_COMPLETO = (String) OB_IAX_CCC.get("CBANCAR");
						String BANCO = "";
						String CUENTA = "";

						if (!isEmpty(CBANCAR_COMPLETO) && CBANCAR_COMPLETO.length() >= 5) {

							BANCO = CBANCAR_COMPLETO.substring(0, 4); // A veces viene guion y a veces no !!
							CUENTA = CBANCAR_COMPLETO.substring(4, CBANCAR_COMPLETO.length());

							if (CUENTA.substring(0, 1).equals("-")) {
								CUENTA = CUENTA.substring(1, CUENTA.length()); // Si la primera posicion es un - se
																				// recorta, si no, no
							}

						}

						if (!isEmpty(BANCO)) {
							BANCO = BANCO.replaceAll("-", "");

							try {
								CBANCO = new BigDecimal(BANCO);
							} catch (Exception e) {
								CBANCO = null;
							}
						}

						OB_IAX_CCC.put("CBANCO", CBANCO);
						OB_IAX_CCC.put("CCUENTA", CUENTA);

						formdata.putAll(OB_IAX_CCC);
					}
				}
			}

		} catch (Exception e) {
			logger.error("Error en el m�todo Axisper014Service.m_form", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	/**
	 * Realiza una carga de BD de los valores est�ticos que contiene cada
	 * desplegable de la pantalla.
	 * 
	 * @param request    El HttpServletRequest que contiene la petici�n del cliente
	 *                   web.
	 * @param thisAction Una Action abstracta desde donde se ha invocado el servicio
	 *                   (necesaria para el log).
	 * @param usuario    El UsuarioBean activo.
	 * @param formdata   HashMap que contiene los valores de los request parameters.
	 * @throws Exception
	 */

	private void cargarValoresDesplegables(HttpServletRequest request, UsuarioBean usuario, Map formdata)
			throws Exception {
		// Carga de valores de los desplegables
		Map listValores = new HashMap();

		try {

			PAC_IAX_PERSONA pac_axis_persona = new PAC_IAX_PERSONA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			PAC_IAX_LISTVALORES pac_axis_lstvalores = new PAC_IAX_LISTVALORES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			// Lista tipo de tarjetas
			Map map = pac_axis_persona.ejecutaPAC_IAX_PERSONA__F_GET_TIPCCC(new BigDecimal("2"));
			logger.debug(map);
			listValores.put("tipTARJETA", (List) tratarRETURNyMENSAJES(request, map, false));

			// Lista tipo de cuentas
			map = pac_axis_persona.ejecutaPAC_IAX_PERSONA__F_GET_TIPCCC(new BigDecimal("1"));
			logger.debug(map);
			listValores.put("tipCCC", (List) tratarRETURNyMENSAJES(request, map, false));

			map = pac_axis_lstvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTBANCOS(null, null);
			logger.debug(map);
			listValores.put("tipBANCO", (List) tratarRETURNyMENSAJES(request, map, false));

			map = pac_axis_lstvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTTIPCC(new BigDecimal("2"));
			logger.debug(map);
			listValores.put("tipBCC_tarjetas", (List) tratarRETURNyMENSAJES(request, map, false));

			map = pac_axis_lstvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTTIPCC(new BigDecimal("1"));
			logger.debug(map);
			listValores.put("tipBCC_cuentas", (List) tratarRETURNyMENSAJES(request, map, false));

		} catch (Exception e) {
			logger.error("Error en el m�todo Axisper014Service.cargarValoresDesplegables", e);
			AbstractDispatchAction.guardarMensaje(request, "1000050", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		} finally {
			formdata.put("listValores", listValores);
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	/*********************************************************************************************************************/
	/************************************************
	 * M�TODOS DE ACTUALIZACI�N
	 *******************************************/
	/*********************************************************************************************************************/

	public void m_grabarCCC(HttpServletRequest request, AbstractDispatchAction thisAction) {
		logger.debug("Axisper014Service m_grabarCCCPersona");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		HashMap orden;

		try {
			PAC_IAX_PERSONA pac_axis_persona = new PAC_IAX_PERSONA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			BigDecimal SPERSON = getCampoNumerico(request, "SPERSON");
			BigDecimal CEMPRES = null; // null siempre
			// BigDecimal CAGENTE = usuario.getCagente();
			BigDecimal CAGENTE = getCampoNumerico(request, "CAGENTE");
			BigDecimal CTIPBAN = getHiddenCampoNumerico(request, "CTIPBANC"); // Changes for IAXIS-4149 PK-18/07/2019
			String CBANCAR = getHiddenCampoTextual(request, "CBANCAR");
			String CTIPCC = getHiddenCampoTextual(request, "CTIPCC");

			BigDecimal CBANCO = getHiddenCampoNumerico(request, "CBANCO");
			String CCUENTA = getHiddenCampoTextual(request, "CCUENTA");

			if (!isEmpty(CCUENTA))
				// quitamos los guiones en todos los casos
				CCUENTA = CCUENTA.replaceAll("-", "");
			int valorDigitosEmpresa = 4;
			if (isEmpty(CBANCAR) && !isEmpty(CCUENTA)) {
				if (CTIPCC != null) {
					try {

						PAC_IAX_PARAM param = new PAC_IAX_PARAM(
								(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
						orden = param.ejecutaPAC_IAX_PARAM__F_PAREMPRESA_N("DIGITOSBANCO", usuario.getCempres());
						valorDigitosEmpresa = Integer.parseInt(String.valueOf(orden.get("RETURN")));
					} catch (Exception e) {
						e.toString();
					}
				}
				CBANCAR = StringUtils.leftPad(CBANCO + "", valorDigitosEmpresa, '0') + CCUENTA; // Si el banco no existe
																								// por pantalla se
																								// tomar� la
																								// concatenaci�n de
																								// ambos campos

			}
			BigDecimal CNORDBAN = getCampoNumerico(request, "CNORDBAN");
			BigDecimal CDEFECTO = getCampoNumerico(request, "CDEFECTO");
			BigDecimal CPAGSIN = getCampoNumerico(request, "CPAGSIN");

			if (CDEFECTO == null)
				CDEFECTO = new BigDecimal(0); // COMBO VALIDA

			if (!isEmpty(CBANCAR))
				// quitamos los guiones en todos los casos
				CBANCAR = CBANCAR.replaceAll("-", "");

			/* *************** TRATAMIENTO FVENCIM ****************** */
			String FVENCIM_CADENA = getCampoTextual(request, "FVENCIM");
			java.sql.Date FVENCIM = stringToSqlDate(getCampoTextual(request, "FVENCIM"));
			if (!isEmpty(FVENCIM_CADENA)) {
				Calendar calendar = Calendar.getInstance();
				int ANYO = new Integer(FVENCIM_CADENA.substring(3, 7));
				int MES = 0;
				String mes = FVENCIM_CADENA.substring(0, 2);

				MES = this.getMes(mes);

				calendar.set(ANYO, MES, 1);
				int maxDay = calendar.getActualMaximum(Calendar.DAY_OF_MONTH);

				FVENCIM = stringToSqlDate(maxDay + "/" + FVENCIM_CADENA);
				formdata.put("FVENCIM", FVENCIM);
			}
			/* ******************************************************* */

			String TSEGURI = getCampoTextual(request, "TSEGURI");

			if (CPAGSIN == null)
				CPAGSIN = new BigDecimal(0); // COMBO SINIESTROS //lcf: si no se informa no se grabar� a uno.

			BigDecimal resultado = new BigDecimal("0");
			/** Start Changed for IAXIS-4149 by PranayK on 18/07/2019 */
			if (isEmpty(CTIPBAN)) {
				Map tipBancMap = pac_axis_persona.ejecutaPAC_IAX_PERSONA__F_GET_CODITIPOBANC(CBANCO, CTIPCC);
				logger.debug("tipBancMap -> " + tipBancMap);
				CTIPBAN = (BigDecimal) tipBancMap.get("CTIPBAN");
			}
			formdata.put("CTIPBAN", CTIPBAN);
			/** End Changed for IAXIS-4149 by PranayK on 18/07/2019 */
			if (!isEmpty(CTIPBAN)) {
				Map map = pac_axis_persona.ejecutaPAC_IAX_PERSONA__F_VALIDACCC(CTIPBAN, CBANCAR);
				logger.debug(map);
				resultado = (BigDecimal) tratarRETURNyMENSAJES(request, map, false);

			}

			if (new BigDecimal(0).equals(resultado)) {
				Map map = pac_axis_persona.ejecutaPAC_IAX_PERSONA__F_SET_CCC(SPERSON, CAGENTE, CNORDBAN, CTIPBAN,
						CBANCAR, CDEFECTO, CPAGSIN, FVENCIM, TSEGURI, CTIPCC);

				logger.debug(map);
				if (!isEmpty(map) && !isEmpty(map.get("CNORDBANOUT")))
					formdata.put("CNORDBAN", map.get("CNORDBANOUT").toString());
				request.setAttribute("grabarOK", (BigDecimal) tratarRETURNyMENSAJES(request, map, false));

			}

		} catch (Exception e) {
			logger.error("Error en el m�todo Axisper014Service.m_grabarCCCPersona", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	public int getMes(String mes) {
		Calendar calendar = Calendar.getInstance();
		if (mes.equals("01")) {
			return calendar.JANUARY;
		} else if (mes.equals("02")) {
			return calendar.FEBRUARY;
		} else if (mes.equals("03")) {
			return calendar.MARCH;
		} else if (mes.equals("04")) {
			return calendar.APRIL;
		} else if (mes.equals("05")) {
			return calendar.MAY;
		} else if (mes.equals("06")) {
			return calendar.JUNE;
		} else if (mes.equals("07")) {
			return calendar.JULY;
		} else if (mes.equals("08")) {
			return calendar.AUGUST;
		} else if (mes.equals("09")) {
			return calendar.SEPTEMBER;
		} else if (mes.equals("10")) {
			return calendar.OCTOBER;
		} else if (mes.equals("11")) {
			return calendar.NOVEMBER;
		} else if (mes.equals("12")) {
			return calendar.DECEMBER;
		} else {
			return calendar.DECEMBER;
		}
	}

	public void m_ajax_ValidarPago(HttpServletRequest request, Axisper014Action thisAction) {
		logger.debug("Axisper014Service m_ajax_ValidarPago");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {
			BigDecimal SPERSON = getCampoNumerico(request, "SPERSON");
			BigDecimal CAGENTE = getCampoNumerico(request, "CAGENTE");
			BigDecimal CNORDBAN = getCampoNumerico(request, "CNORDBAN");

			logger.debug(SPERSON);
			// SPERSON = new BigDecimal(17071);
			PAC_IAX_PERSONA pac_axis_persona = new PAC_IAX_PERSONA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			Map map = pac_axis_persona.ejecutaPAC_IAX_PERSONA__F_VALIDA_PAGOCCC(SPERSON, CAGENTE, CNORDBAN);

			logger.debug("--->validamos pago:" + map);
			ajax.rellenarPlAContenedorAjax(map);
			Map lite = new HashMap();
			String valor = (String) map.get("PCODILIT");
			lite.put("LITERAL", valor);
			ajax.guardarContenidoFinalAContenedorAjax(lite);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisper005Service - m�todo m_ajaxgetInfoHost", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

}
