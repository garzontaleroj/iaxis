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
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

public class Axisper004Service extends AxisBaseService {
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
		logger.debug("Axisper004Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {
			/* Desplegables */
			cargarValoresDesplegables(request, usuario, formdata);
			BigDecimal SPERSON = null;
			BigDecimal CNORDBAN = null;

			SPERSON = getCampoNumerico(request, "SPERSON");
			CNORDBAN = getCampoNumerico(request, "CNORDBAN");

			formdata.put("SPERSON", bigDecimalToString(SPERSON));
			formdata.put("CNORDBAN", bigDecimalToString(CNORDBAN));
			BigDecimal CBANCO = null;

			if (!isEmpty(CNORDBAN)) {
				PAC_IAX_PERSONA pac_axis_persona = new PAC_IAX_PERSONA(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
				Map map = pac_axis_persona.ejecutaPAC_IAX_PERSONA__F_GET_ESTCCC(SPERSON, CNORDBAN);
				logger.debug(map);
				PAC_IAX_COMMON PAC_IAX_COMMON = new PAC_IAX_COMMON(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

				if (new BigDecimal(0).equals(tratarRETURNyMENSAJES(request, map))) {
					Map OB_IAX_CCC = (Map) map.get("CCC");
					if (!isEmpty(OB_IAX_CCC)) {
						Map CFORMAT = PAC_IAX_COMMON.ejecutaPAC_IAX_COMMON__F_FORMATCCC(
								new BigDecimal(String.valueOf(OB_IAX_CCC.get("CTIPBAN"))),
								(String) OB_IAX_CCC.get("CBANCAR"));
						OB_IAX_CCC.put("CBANCAR", CFORMAT.get("RETURN"));
						formdata.putAll(OB_IAX_CCC);

						/* ************************************************* */
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
						/* ************************************************* */
					}
				}
			}

		} catch (Exception e) {
			logger.error("Error en el m�todo Axisper004Service.m_form", e);
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
	private

			void cargarValoresDesplegables(HttpServletRequest request, UsuarioBean usuario, Map formdata)
					throws Exception {
		// Carga de valores de los desplegables
		Map listValores = new HashMap();
		try {
			PAC_IAX_LISTVALORES pac_axis_listValores = new PAC_IAX_LISTVALORES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			PAC_IAX_PERSONA pac_axis_persona = new PAC_IAX_PERSONA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			BigDecimal SPERSON = getCampoNumerico(request, "SPERSON");

			// Lista tipo de tarjetas
			Map map = pac_axis_persona.ejecutaPAC_IAX_PERSONA__F_GET_TIPCCC(new BigDecimal("2"));
			logger.debug(map);
			listValores.put("tipTARJETA", (List) tratarRETURNyMENSAJES(request, map));

			// Lista tipo de cuentas
			map = pac_axis_persona.ejecutaPAC_IAX_PERSONA__F_GET_TIPCCC(new BigDecimal("1"));
			logger.debug(map);
			listValores.put("tipCCC", (List) tratarRETURNyMENSAJES(request, map));

			map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTBANCOS(null, null);
			logger.debug(map);
			listValores.put("tipBANCO", (List) tratarRETURNyMENSAJES(request, map));

			// Lista TIPBANCC
			map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTTIPCC(new BigDecimal("2"));
			logger.debug(map);
			listValores.put("tipBCC_tarjetas", (List) tratarRETURNyMENSAJES(request, map));

			map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTTIPCC(new BigDecimal("1"));
			logger.debug(map);
			listValores.put("tipBCC_cuentas", (List) tratarRETURNyMENSAJES(request, map));

		} catch (Exception e) {
			logger.error("Error en el m�todo Axisper005Service.cargarValoresDesplegables", e);
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

	/**
	 * M�todo para grabar la cuenta corriente de la persona.
	 * 
	 * @param request    El HttpServletRequest que contiene la petici�n del cliente
	 *                   web.
	 * @param thisAction Una Action abstracta desde donde se ha invocado el servicio
	 *                   (necesaria para el log).
	 * @throws Exception
	 */
	public

			void m_grabarCCC(HttpServletRequest request, AbstractDispatchAction thisAction) {
		logger.debug("Axisper004Service m_grabarCCCPersona");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		HashMap orden;// Bug 33346 MMS Arreglo formato banco

		try {
			PAC_IAX_PERSONA pac_axis_persona = new PAC_IAX_PERSONA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			BigDecimal SPERSON = getCampoNumerico(request, "SPERSON");
			BigDecimal CEMPRES = null; // null siempre
			// BigDecimal CAGENTE = usuario.getCagente();
			BigDecimal CAGENTE = null; // null siempre
			BigDecimal CTIPBAN = getCampoNumerico(request, "CTIPBAN");
			String CBANCAR = getCampoTextual(request, "CBANCAR");
			String CTIPCC = getCampoTextual(request, "CTIPCC");
			BigDecimal CNORDBAN = getCampoNumerico(request, "CNORDBAN");
			BigDecimal CDEFECTO = getCampoNumerico(request, "CDEFECTO");

			/* *********************************************************** */
			BigDecimal CBANCO = getCampoNumerico(request, "CBANCO");
			String CCUENTA = getCampoTextual(request, "CCUENTA");
			// Bug 33346 MMS Arreglo formato banco
			// BigDecimal NLONGBANCO=getCampoNumerico(request, "NLONGBANCO");
			int valorDigitosEmpresa = 4;

			if (!isEmpty(CCUENTA))
				// quitamos los guiones en todos los casos
				CCUENTA = CCUENTA.replaceAll("-", "");

			if (isEmpty(CBANCAR) && !isEmpty(CCUENTA)) {
				// Si el banco no existe por pantalla se tomar� la concatenaci�n de ambos campos
				// Bug 33346 MMS Arreglo formato banco
				/*
				 * NLONGBANCO=(NLONGBANCO==null)?new BigDecimal(4):NLONGBANCO;
				 * CBANCAR=StringUtils.leftPad(CBANCO+"", NLONGBANCO.intValue(), '0')+CCUENTA;
				 */
				try {
					PAC_IAX_PARAM param = new PAC_IAX_PARAM(
							(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
					orden = param.ejecutaPAC_IAX_PARAM__F_PAREMPRESA_N("DIGITOSBANCO", usuario.getCempres());
					valorDigitosEmpresa = Integer.parseInt(String.valueOf(orden.get("RETURN")));
				} catch (Exception e) {
					e.toString();
				}
				CBANCAR = StringUtils.leftPad(CBANCO + "", valorDigitosEmpresa, '0') + CCUENTA;
			}

			/* *********************************************************** */

			if (CDEFECTO == null)
				CDEFECTO = new BigDecimal(0);

			if (!isEmpty(CBANCAR))
				// quitamos siempre los guiones
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
			BigDecimal CPAGSIN = getCampoNumerico(request, "CPAGSIN");

			if (CPAGSIN == null)
				CPAGSIN = new BigDecimal(0); // COMBO SINIESTROS

			BigDecimal resultado = new BigDecimal("0");

			if (!isEmpty(CTIPBAN)) {
				Map map = pac_axis_persona.ejecutaPAC_IAX_PERSONA__F_VALIDACCC(CTIPBAN, CBANCAR);
				logger.debug(map);
				resultado = (BigDecimal) tratarRETURNyMENSAJES(request, map);
			}

			if (new BigDecimal(0).equals(resultado)) {
				Map map = pac_axis_persona.ejecutaPAC_IAX_PERSONA__F_SET_ESTCCC(SPERSON, CAGENTE, CNORDBAN, CTIPBAN,
						CBANCAR, CDEFECTO, CPAGSIN, FVENCIM, TSEGURI, CTIPCC);
				logger.debug(map);

				if (!isEmpty(map) && !isEmpty(map.get("CNORDBANOUT")))
					formdata.put("CNORDBAN", map.get("CNORDBANOUT").toString());
				request.setAttribute("grabarOK", (BigDecimal) tratarRETURNyMENSAJES(request, map));
			}

		} catch (Exception e) {
			logger.error("Error en el m�todo Axisper004Service.m_grabarCCCPersona", e);
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

}
