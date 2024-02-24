package axis.service.axis;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_DATOSCTASEGURO;
import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.jdbc.PAC_IAX_PENSIONES;
import axis.jdbc.PAC_IAX_PERSONA;
import axis.jdbc.PAC_IAX_PRODUCCION;
import axis.jdbc.PAC_IAX_TRASPASOS;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.control.axis.Axisctr093Action;
import axis.mvc.control.modal.Axisctr092Action;
import axis.mvc.model.UsuarioBean;
import axis.util.Constantes;

public class Axisctr093Service extends AxisBaseService {
	static Log logger = LogFactory.getLog(Axisctr093Service.class);

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE INICIALIZACION
	 *******************************************/
	/*********************************************************************************************************************/

	/**
	 * M�todo inicial al llamar a �ste flujo.
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_init(HttpServletRequest request, Axisctr092Action thisAction) {
		logger.debug("Axisctr093Service m_init");
		try {

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr092Service - m�todo m_init", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	public void m_form(HttpServletRequest request, Axisctr093Action thisAction) {
		logger.debug("Axisctr093Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {
			this.formattingNumericValues(request);
			BigDecimal SSEGURO = getCampoNumerico(request, "SSEGURO");
			BigDecimal STRAS = getCampoNumerico(request, "STRAS");
			String ACTUALIZA_DATOS = getCampoTextual(request, "ACTUALIZA_DATOS");

			String MODALIDAD = "TR" + getCampoNumerico(request, "STRAS");
			BigDecimal NUEVO = getCampoNumerico(request, "NUEVO");

			logger.debug("actualiza:" + ACTUALIZA_DATOS);

			String mensaje_a_mostrar = this.getCampoTextual(request, "MISS");
			if (!isEmpty(mensaje_a_mostrar)) {
				thisAction.guardarMensaje(request, "verbatim:" + mensaje_a_mostrar, null, Constantes.MENSAJE_INFO);
			}

			String MODO = isEmpty(getCampoTextual(request, "MODO")) ? String.valueOf(request.getParameter("MODO"))
					: getCampoTextual(request, "MODO");
			String MODO_ant = String.valueOf(AbstractDispatchAction.topPila(request, "CMODO"));

			if (!isEmpty(MODO)) {
				if (MODO.equals("NUEVO_TRASPASO") && MODO_ant.equals("TRASPASOS_MIGRADOS")) {
					AbstractDispatchAction.topPila(request, "CMODO", "NUEVO_TRASPASO_MIG");
				} else if (MODO.equals("NUEVO_TRASPASO") && MODO_ant.equals("GESTION_TRASPASOS")) {
					AbstractDispatchAction.topPila(request, "CMODO", MODO);
				}
			}
			logger.debug(MODO);
			logger.debug("actualiza:" + ACTUALIZA_DATOS);
			formdata.put("FHOY", fcGetFechaActual());

			if (!isEmpty(SSEGURO)) {
				PAC_IAX_PRODUCCION pacIaxProduccion = new PAC_IAX_PRODUCCION(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

				PAC_IAX_TRASPASOS pacIaxTraspasos = new PAC_IAX_TRASPASOS(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

				PAC_IAX_PENSIONES pacIaxPensiones = new PAC_IAX_PENSIONES(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

				Map map = pacIaxProduccion.ejecutaPAC_IAX_PRODUCCION__F_SET_CONSULTAPOLIZA(SSEGURO);
				logger.debug(map);
				tratarRETURNyMENSAJES(request, map, false);

				map = pacIaxProduccion.ejecutaPAC_IAX_PRODUCCION__F_GET_DATPOLIZA(SSEGURO);
				logger.debug(map);
				Map datosPoliza = (Map) tratarRETURNyMENSAJES(request, map, false);
				request.setAttribute("datos_poliza", datosPoliza);

				map = pacIaxTraspasos.ejecutaPAC_IAX_TRASPASOS__F_GET_TRASPASOS_POL(SSEGURO, MODALIDAD);
				logger.debug(map);
				List<Map> T_IAX_TRASPASOS = (List) tratarRETURNyMENSAJES(request, map, false);
				logger.debug(T_IAX_TRASPASOS);
				request.setAttribute("T_IAX_TRASPASOS", T_IAX_TRASPASOS);

				map = pacIaxProduccion.ejecutaPAC_IAX_PRODUCCION__F_LEETOMADORES();
				logger.debug(map);
				tratarRETURNyMENSAJES(request, map, false);
				request.setAttribute("tomadores", map.get("RETURN"));

				logger.debug("ESTE ES MI NUEVO:" + NUEVO);

				formdata.put("IIMPORTE", formdata.get("IIMPORTE"));

				this.actualizarImportes(request);
				logger.debug("CACTALIZA_DATOS:" + ACTUALIZA_DATOS + "STRAS:" + STRAS);
				if (isEmpty(ACTUALIZA_DATOS) || !ACTUALIZA_DATOS.equals("NO")) {
					logger.debug("CARGO TRASPASO");
					if (new BigDecimal(1).equals(NUEVO))
						map = pacIaxTraspasos.ejecutaPAC_IAX_TRASPASOS__F_GET_TRASPASO(null);
					else
						map = pacIaxTraspasos.ejecutaPAC_IAX_TRASPASOS__F_GET_TRASPASO(STRAS);
					logger.debug(map);
					if (!isEmpty(tratarRETURNyMENSAJES(request, map, false))) {
						HashMap m2 = (HashMap) tratarRETURNyMENSAJES(request, map, false);
						formdata.putAll(m2);
						if (!isEmpty(m2.get("CCODPLA"))) {
							map = pacIaxPensiones
									.ejecutaPAC_IAX_PENSIONES__F_GET_OB_PLANPENSIONES((BigDecimal) m2.get("CCODPLA"));
							logger.debug(map);

							HashMap m3 = (HashMap) map.get("PLANPENSIONES");
							logger.debug(m3);

							if (new BigDecimal(0).equals(map.get("RETURN"))) {
								logger.debug("LLEGO LLEGO: " + m3.get("CCODFON"));
								formdata.put("CCODPLA_TRASPAS", m3.get("CODDGS"));
								formdata.put("TCODPLA_TRASPAS", m3.get("TNOMPLA"));
								formdata.put("CCODFON_TRASPAS", m3.get("CFONDGS"));
								formdata.put("TCODFON_TRASPAS", m3.get("TFONDO"));
								formdata.put("CCODGES_TRASPAS", m3.get("CGESDGS"));
								formdata.put("TCODGES_TRASPAS", m3.get("TNOMGES"));
							}
						}
					}

				} else {
					if (!isEmpty(request.getParameter("CESTADO_MODIFVISIBLE"))) {
						formdata.put("CESTADO", request.getParameter("CESTADO_MODIFVISIBLE"));
					}
				}

				map = pacIaxProduccion.ejecutaPAC_IAX_PRODUCCION__F_GET_GESTRIESGOS();
				logger.debug(map);
				List<Map> T_IAX_GESTRIESGOS = (List) tratarRETURNyMENSAJES(request, map, false);
				logger.debug(T_IAX_GESTRIESGOS);
				request.setAttribute("T_IAX_GESTRIESGOS", T_IAX_GESTRIESGOS);

				BigDecimal NRIESGO = getCampoNumerico(request, "NRIESGO");
				if (isEmpty(NRIESGO))
					NRIESGO = new BigDecimal(1);

				PAC_IAX_DATOSCTASEGURO pacIaxDatosCtaSeguro = new PAC_IAX_DATOSCTASEGURO(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

				map = new PAC_IAX_PRODUCCION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_PRODUCCION__F_GET_RIESGOCONSULTA(NRIESGO);

				logger.debug(map);

				Map OB_IAX_RIESGOS = (Map) tratarRETURNyMENSAJES(request, map, false);

				if (!isEmpty(OB_IAX_RIESGOS)) {

					java.util.Date d = new java.util.Date();
					java.sql.Date sqlDate = new java.sql.Date(d.getTime());

					/* RKV: bug 9342 */
					Map datoseconomicos = pacIaxDatosCtaSeguro.ejecutaPAC_IAX_DATOSCTASEGURO__F_OBTDATECON(SSEGURO,
							NRIESGO, sqlDate);
					logger.debug(datoseconomicos);

					Map OB_IAX_DATOSECONOMICOS = (Map) tratarRETURNyMENSAJES(request, datoseconomicos);
					OB_IAX_RIESGOS.put("OB_IAX_DATOSECONOMICOS", OB_IAX_DATOSECONOMICOS);

					/* RKV: bug 9342 */
					Map movctaseguros = pacIaxDatosCtaSeguro
							.ejecutaPAC_IAX_DATOSCTASEGURO__F_OBTENERMOVIMIENTOS(SSEGURO, NRIESGO, null, null);
					logger.debug(movctaseguros);

					List OB_IAX_DATOSCTASEGURO = (List) movctaseguros.get("RETURN");
					OB_IAX_RIESGOS.put("T_IAX_DATOSCTASEGURO", OB_IAX_DATOSCTASEGURO);

				}

				request.setAttribute("OB_IAX_RIESGOS", OB_IAX_RIESGOS);
			}

			if (STRAS != null) {
				// Recupero las secciones modificadas desde alg�n flujo y las desplego
				Map PILA = ((isEmpty(request.getSession().getAttribute("PASSTOPPILA"))) ? null
						: (HashMap) request.getSession().getAttribute("PASSTOPPILA"));
				List SECACTIVA = ((!isEmpty(PILA) && !isEmpty(PILA.get("SECACTIVA"))) ? (List) PILA.get("SECACTIVA")
						: null);
				if (!isEmpty(SECACTIVA) && SECACTIVA.size() > 0) {
					request.setAttribute("SECACTIVA", SECACTIVA);
				} else {
					if (!isEmpty(this.getCampoTextual(request, "SECACTIVA"))) {
						logger.debug("sec-->" + this.getCampoTextual(request, "SECACTIVA"));
						SECACTIVA = new ArrayList();
						SECACTIVA.add(this.getCampoTextual(request, "SECACTIVA"));
						request.setAttribute("SECACTIVA", SECACTIVA);
					}
				}
			}
			formdata.put("SSEGURO", SSEGURO);
			this.m_cargarValors(request, thisAction);
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr093Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	private void m_cargarValors(HttpServletRequest request, Axisctr093Action thisAction) {
		logger.debug("Axisctr092Service m_listvalores");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		HashMap listValores = new HashMap();
		try {

			PAC_IAX_LISTVALORES pac_axis_listValores = new PAC_IAX_LISTVALORES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			Map map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(679));
			listValores.put("entradasalida", (List) tratarRETURNyMENSAJES(request, map));

			map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(675));
			listValores.put("estado", (List) tratarRETURNyMENSAJES(request, map));

			map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(652));
			listValores.put("tiptraspas", (List) tratarRETURNyMENSAJES(request, map));

			map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(676));
			listValores.put("tiptras", (List) tratarRETURNyMENSAJES(request, map));

			map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(330));
			listValores.put("tiptrassol", (List) tratarRETURNyMENSAJES(request, map));

			map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(332));
			listValores.put("lcmotivo", (List) tratarRETURNyMENSAJES(request, map));

			map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(719));
			listValores.put("tipctipcont", (List) tratarRETURNyMENSAJES(request, map));

			map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(720));
			listValores.put("tipctipcap", (List) tratarRETURNyMENSAJES(request, map));

			request.setAttribute("listValores", listValores);

			// Lista tipo de cuentas
			map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_GET_TIPCCC();
			logger.debug("cccc:" + map);
			listValores.put("tipCCC", (List) tratarRETURNyMENSAJES(request, map));

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr093Service - m�todo m_listvalores", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	public void m_aceptar(HttpServletRequest request, Axisctr093Action thisAction) {
		logger.debug("Axisctr093Service m_emitirPropuesta");
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {
			this.actualizarImportes(request);
			formdata.put("recargar", "0");

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr093Service - m�todo m_emitirPropuesta", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));

			String MODO = String.valueOf(AbstractDispatchAction.topPila(request, "CMODO"));

			if (!isEmpty(MODO) && (MODO.equals("NUEVO_TRASPASO") || MODO.equals("NUEVO_TRASPASO_MIG"))) {
				AbstractDispatchAction.topPila(request, "CMODO",
						AbstractDispatchAction.topPila(request, "CMODO_ORIGINAL"));
			}

			logger.debug(MODO);
		}
	}

	public void m_ajax_poliza_destino(HttpServletRequest request) {
		logger.debug("Axisctr093Service m_ajax_poliza_destino");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();
		try {
			PAC_IAX_PRODUCCION pacIaxProduccion = new PAC_IAX_PRODUCCION(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			BigDecimal SSEGURO = this.getCampoNumerico(request, "SSEGURO_DESTINO");
			Map map = pacIaxProduccion.ejecutaPAC_IAX_PRODUCCION__F_GET_DATPOLIZA(SSEGURO);
			logger.debug(map);
			Map datosPoliza = (Map) tratarRETURNyMENSAJES(request, map, false);

			// ajax.rellenarPlAContenedorAjax(datosPoliza);
			ajax.guardarContenidoFinalAContenedorAjax(datosPoliza);
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr093Service - m�todo m_ajax_poliza_destino", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	public void m_demorar(HttpServletRequest request, Axisctr093Action thisAction) {
		logger.debug("Axisctr093Service m_demorar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {
			BigDecimal STRAS = this.getCampoNumerico(request, "STRAS");
			BigDecimal CINOUT = this.getCampoNumerico(request, "CINOUT");
			BigDecimal CEXTERN = this.getCampoNumerico(request, "CEXTERN");
			BigDecimal CMOTIVO = this.getCampoNumerico(request, "CMOTIVO");

			HashMap m = new PAC_IAX_TRASPASOS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_TRASPASOS__F_DEMORAR_TRASPASO(STRAS, CINOUT, CEXTERN, CMOTIVO);
			logger.debug(m);
			tratarRETURNyMENSAJES(request, m, false);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr093Service - m�todo m_confirmar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.actualizarImportes(request);
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));

			String MODO = String.valueOf(AbstractDispatchAction.topPila(request, "CMODO"));

			if (!isEmpty(MODO) && (MODO.equals("NUEVO_TRASPASO") || MODO.equals("NUEVO_TRASPASO_MIG"))) {
				AbstractDispatchAction.topPila(request, "CMODO",
						AbstractDispatchAction.topPila(request, "CMODO_ORIGINAL"));
			}

			logger.debug(MODO);
		}
	}

	public void m_rechazar(HttpServletRequest request, Axisctr093Action thisAction) {
		logger.debug("Axisctr093Service m_rechazar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);

		try {
			BigDecimal STRAS = this.getCampoNumerico(request, "STRAS");
			BigDecimal CINOUT = this.getCampoNumerico(request, "CINOUT");
			BigDecimal CEXTERN = this.getCampoNumerico(request, "CEXTERN");
			BigDecimal CMOTIVO = this.getCampoNumerico(request, "CMOTIVO");

			HashMap m = new PAC_IAX_TRASPASOS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_TRASPASOS__F_RECHAZAR_TRASPASO(STRAS, CINOUT, CEXTERN, CMOTIVO);
			logger.debug(m);

			// tratarRETURNyMENSAJES(request, m, false);
			if (((BigDecimal) tratarRETURNyMENSAJES(request, m, false)).intValue() == 0) {
				formdata.put("RECHAZADO", new BigDecimal(1));
			} else {
				formdata.put("RECHAZADO", new BigDecimal(0));
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr093Service - m�todo m_rechazar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.actualizarImportes(request);
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));

			String MODO = String.valueOf(AbstractDispatchAction.topPila(request, "CMODO"));

			if (!isEmpty(MODO) && (MODO.equals("NUEVO_TRASPASO") || MODO.equals("NUEVO_TRASPASO_MIG"))) {
				AbstractDispatchAction.topPila(request, "CMODO",
						AbstractDispatchAction.topPila(request, "CMODO_ORIGINAL"));
			}

			logger.debug(MODO);
		}
	}

	public void m_anular(HttpServletRequest request, Axisctr093Action thisAction) {

		logger.debug("Axisctr093Service m_anular");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);

		try {
			BigDecimal STRAS = this.getCampoNumerico(request, "STRAS");
			BigDecimal CMOTIVO = this.getCampoNumerico(request, "CMOTIVO");

			HashMap m = new PAC_IAX_TRASPASOS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_TRASPASOS__F_ANULAR_TRASPASO(STRAS, CMOTIVO);
			logger.debug(m);
			if (((BigDecimal) tratarRETURNyMENSAJES(request, m, false)).intValue() == 0) {

				formdata.put("missatge_OK", this.obtenerMensajes(m));
				formdata.put("recargar", "0");
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr093Service - m�todo m_anular", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.actualizarImportes(request);
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));

			String MODO = String.valueOf(AbstractDispatchAction.topPila(request, "CMODO"));

			if (!isEmpty(MODO) && (MODO.equals("NUEVO_TRASPASO") || MODO.equals("NUEVO_TRASPASO_MIG"))) {
				AbstractDispatchAction.topPila(request, "CMODO",
						AbstractDispatchAction.topPila(request, "CMODO_ORIGINAL"));
			}

			logger.debug(MODO);
		}
	}

	private String obtenerMensajes(HashMap m) {
		ArrayList arraym = (ArrayList) m.get("MENSAJES");
		String TERROR = "";
		if (!isEmpty(arraym) && arraym.size() > 0) {
			HashMap mm = (HashMap) arraym.get(0);
			TERROR = String.valueOf(((HashMap) mm.get("OB_IAX_MENSAJES")).get("TERROR"));
		}
		return TERROR;
	}

	public void m_grabar(HttpServletRequest request, Axisctr093Action thisAction) {
		logger.debug("Axisctr093Service m_grabar");
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {
			BigDecimal STRAS = this.getCampoNumerico(request, "STRAS");
			BigDecimal STRAS_OUT = this.getCampoNumerico(request, "STRAS");
			PAC_IAX_PERSONA pac_axis_persona = new PAC_IAX_PERSONA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			BigDecimal SSEGURO = this.getCampoNumerico(request, "SSEGURO");
			BigDecimal SPRODUC = this.getCampoNumerico(request, "SPRODUC");
			BigDecimal CAGRPRO = this.getCampoNumerico(request, "CAGRPRO");
			java.sql.Date FSOLICI = this.stringToSqlDate(this.getCampoTextual(request, "FSOLICI"));
			BigDecimal CINOUT = isEmpty(this.getCampoNumerico(request, "CINOUT"))
					? this.getCampoNumerico(request, "CINOUT_MODIFVISIBLE")
					: this.getCampoNumerico(request, "CINOUT");
			// BigDecimal CTIPTRAS = this.getCampoNumerico(request, "CTIPTRAS");
			BigDecimal CTIPTRAS = isEmpty(this.getCampoNumerico(request, "CTIPTRAS"))
					? this.getCampoNumerico(request, "CTIPTRAS_MODIFVISIBLE")
					: this.getCampoNumerico(request, "CTIPTRAS");
			BigDecimal CEXTERN = this.getHiddenCampoNumerico(request, "CEXTERN");
			// BigDecimal CTIPDER = this.getCampoNumerico(request, "CTIPDER");
			BigDecimal CTIPDER = isEmpty(this.getCampoNumerico(request, "CTIPDER"))
					? this.getCampoNumerico(request, "CTIPDER_MODIFVISIBLE")
					: this.getCampoNumerico(request, "CTIPDER");
			BigDecimal CESTADO = getCampoNumerico(request, "CESTADO");
			// String CPARAMETROS = getCampoTextual(request, "CPARAMETROS");
			// BigDecimal CTIPTRASSOL = this.getCampoNumerico(request, "CTIPTRASSOL");
			BigDecimal CTIPTRASSOL = isEmpty(this.getCampoNumerico(request, "CTIPTRASSOL"))
					? this.getCampoNumerico(request, "CTIPTRASSOL_MODIFVISIBLE")
					: this.getCampoNumerico(request, "CTIPTRASSOL");
			BigDecimal IMPTEMP = this.getCampoNumerico(request, "IIMPTEMP");
			BigDecimal NPORCEN = this.getCampoNumerico(request, "NPORCEN");
			BigDecimal NPARPLA = this.getCampoNumerico(request, "NPARPLA");
			// BigDecimal CTIPBAN = this.getCampoNumerico(request, "CTIPBAN");
			BigDecimal CTIPBAN = isEmpty(this.getCampoNumerico(request, "CTIPBAN"))
					? this.getCampoNumerico(request, "CTIPBAN_MODIFVISIBLE")
					: this.getCampoNumerico(request, "CTIPBAN");
			String CBANCAR = getCampoTextual(request, "CBANCAR");
			String TPOLEXT = getCampoTextual(request, "TPOLEXT");
			BigDecimal NCERTEXT = this.getCampoNumerico(request, "NCERTEXT");
			java.sql.Date FANTIGI = this.stringToSqlDate(this.getCampoTextual(request, "FANTIGI"));
			BigDecimal IIMPANU = this.getCampoNumerico(request, "IIMPANU");
			BigDecimal CMOTIVO = this.getCampoNumerico(request, "CMOTIVO");
			BigDecimal NPARRET = this.getCampoNumerico(request, "NPARRET");
			// JGM:antesBigDecimal IIMPRET = this.getCampoNumerico(request, "IIMPRET");
			BigDecimal IIMPRET = this.getCampoNumerico(request, "IIMPORTE");
			BigDecimal NPARPOS2006 = this.getCampoNumerico(request, "NPARPOS2006");
			BigDecimal PPORCPOS2006 = this.getCampoNumerico(request, "PORCPOS2006");
			BigDecimal NPARANT2007 = this.getCampoNumerico(request, "NPARANT2007");
			BigDecimal PORCANT2007 = this.getCampoNumerico(request, "PORCANT2007");
			String TMEMO = getCampoTextual(request, "TMEMO");
			String NREF = getCampoTextual(request, "NREF");
			java.sql.Date FEFECTO = this.stringToSqlDate(this.getCampoTextual(request, "FEFECTO"));
			java.sql.Date FVALOR = this.stringToSqlDate(this.getCampoTextual(request, "FVALOR"));
			BigDecimal CCOMPANI;
			String TCOMPANI;
			BigDecimal CCODPLA_DGS;
			String TCCODPLA;
			BigDecimal CCODPLA;

			BigDecimal CTIPCONT = getCampoNumerico(request, "CTIPCONT");
			java.sql.Date FCONTING = this.stringToSqlDate(this.getCampoTextual(request, "FCONTING"));
			BigDecimal CTIPCAP = getCampoNumerico(request, "CTIPCAP");
			BigDecimal IMPORTE = getCampoNumerico(request, "IMPORTE");
			java.sql.Date FABONOCAP = this.stringToSqlDate(this.getCampoTextual(request, "FABONOCAP"));

			logger.debug("es_fons:" + request.getParameter("ES_FONS"));

			if (request.getParameter("ES_FONS") == null) {
				CCOMPANI = this.getCampoNumerico(request, "CCOMPANI");
				TCOMPANI = getCampoTextual(request, "TCOMPANI");
				CCODPLA_DGS = null;
				TCCODPLA = null;
				CCODPLA = null;
			} else {
				CCOMPANI = null;
				TCOMPANI = null;
				CCODPLA_DGS = this.getCampoNumerico(request, "CCODPLA_TRASPAS");
				TCCODPLA = getCampoTextual(request, "TCODPLA_TRASPAS");
				CCODPLA = this.getCampoNumerico(request, "CCODPLA");
			}

			if (!isEmpty(CBANCAR)) {
				CBANCAR = CBANCAR.replaceAll("-", "");

				Map map = pac_axis_persona.ejecutaPAC_IAX_PERSONA__F_VALIDACCC(CTIPBAN, CBANCAR);
				logger.debug(map);

				if (new BigDecimal(0).equals(tratarRETURNyMENSAJES(request, map))) {

					HashMap m = new PAC_IAX_TRASPASOS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
							.ejecutaPAC_IAX_TRASPASOS__F_SET_TRASPASO(SSEGURO, SPRODUC, CAGRPRO, FSOLICI, CINOUT,
									CTIPTRAS, CEXTERN, CTIPDER, CESTADO, CTIPTRASSOL, IMPTEMP, NPORCEN, NPARPLA,
									CCODPLA, TCCODPLA, CCOMPANI, TCOMPANI, CTIPBAN, CBANCAR, TPOLEXT, NCERTEXT, FANTIGI,
									IIMPANU, NPARRET, IIMPRET, NPARPOS2006, PPORCPOS2006, NPARANT2007, PORCANT2007,
									TMEMO, NREF, CMOTIVO, FEFECTO, FVALOR, STRAS, CTIPCONT, FCONTING, CTIPCAP, IMPORTE,
									FABONOCAP);
					logger.debug(m);
					if (new BigDecimal(0).equals(m.get("RETURN"))) {
						formdata.put("STRAS", m.get("PSTRAS_OUT"));
						logger.debug("Pongo el STRASS");
					}
					if (((BigDecimal) tratarRETURNyMENSAJES(request, m, false)).intValue() == 0) {
						formdata.put("missatge_OK", this.obtenerMensajes(m));
						formdata.put("recargar", "0");
					}
				}
			} else {

				CTIPBAN = null;

				HashMap m = new PAC_IAX_TRASPASOS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_TRASPASOS__F_SET_TRASPASO(SSEGURO, SPRODUC, CAGRPRO, FSOLICI, CINOUT, CTIPTRAS,
								CEXTERN, CTIPDER, CESTADO, CTIPTRASSOL, IMPTEMP, NPORCEN, NPARPLA, CCODPLA, TCCODPLA,
								CCOMPANI, TCOMPANI, CTIPBAN, CBANCAR, TPOLEXT, NCERTEXT, FANTIGI, IIMPANU, NPARRET,
								IIMPRET, NPARPOS2006, PPORCPOS2006, NPARANT2007, PORCANT2007, TMEMO, NREF, CMOTIVO,
								FEFECTO, FVALOR, STRAS, CTIPCONT, FCONTING, CTIPCAP, IMPORTE, FABONOCAP);
				logger.debug(m);
				if (new BigDecimal(0).equals(m.get("RETURN"))) {
					formdata.put("STRAS", m.get("PSTRAS_OUT"));
					logger.debug("Pongo el STRASS");
				}
				if (((BigDecimal) tratarRETURNyMENSAJES(request, m, false)).intValue() == 0) {
					formdata.put("missatge_OK", this.obtenerMensajes(m));
					formdata.put("recargar", "0");
				}
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr093Service - m�todo m_grabar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.actualizarImportes(request);
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));

			String MODO = String.valueOf(AbstractDispatchAction.topPila(request, "CMODO"));

			if (!isEmpty(MODO) && (MODO.equals("NUEVO_TRASPASO") || MODO.equals("NUEVO_TRASPASO_MIG"))) {
				AbstractDispatchAction.topPila(request, "CMODO",
						AbstractDispatchAction.topPila(request, "CMODO_ORIGINAL"));
			}

			logger.debug(MODO);
		}
	}

	public void m_desconfirmar(HttpServletRequest request, Axisctr093Action thisAction) {
		logger.debug("Axisctr093Service m_desconfirmar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {
			BigDecimal STRAS = this.getCampoNumerico(request, "STRAS");
			HashMap m = new PAC_IAX_TRASPASOS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_TRASPASOS__F_DESCONFIRMAR_TRASPASO(STRAS);
			logger.debug(m);

			if (((BigDecimal) tratarRETURNyMENSAJES(request, m, false)).intValue() == 0) {
				// formdata.put("missatge_OK",m.get("MENSAJES"));
				formdata.put("missatge_OK", this.obtenerMensajes(m));
				formdata.put("recargar", "0");
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr093Service - m�todo m_desconfirmar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.actualizarImportes(request);
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));

			String MODO = String.valueOf(AbstractDispatchAction.topPila(request, "CMODO"));

			if (!isEmpty(MODO) && (MODO.equals("NUEVO_TRASPASO") || MODO.equals("NUEVO_TRASPASO_MIG"))) {
				AbstractDispatchAction.topPila(request, "CMODO",
						AbstractDispatchAction.topPila(request, "CMODO_ORIGINAL"));
			}

			logger.debug(MODO);
		}
	}

	public void m_traspasar(HttpServletRequest request, Axisctr093Action thisAction) {
		logger.debug("Axisctr093Service m_traspasar");
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {
			// Gravo primero
			m_grabar(request, thisAction);

			BigDecimal STRAS = this.getCampoNumerico(request, "STRAS");
			BigDecimal SSEGURO = this.getCampoNumerico(request, "SSEGURO");
			BigDecimal NRIESGO = this.getCampoNumerico(request, "NRIESGO");
			if (isEmpty(NRIESGO))
				NRIESGO = new BigDecimal(1);
			BigDecimal CAGRPRO = this.getCampoNumerico(request, "CAGRPRO");
			BigDecimal CINOUT = this.getCampoNumerico(request, "CINOUT");
			BigDecimal CTIPTRAS = this.getCampoNumerico(request, "CTIPTRAS");
			BigDecimal CEXTERN = this.getCampoNumerico(request, "CEXTERN");
			BigDecimal CTIPDER = this.getCampoNumerico(request, "CTIPDER");
			BigDecimal CTIPTRASSOL = this.getCampoNumerico(request, "CTIPTRASSOL");
			BigDecimal NPORCEN = this.getCampoNumerico(request, "NPORCEN");
			BigDecimal NPARPLA = this.getCampoNumerico(request, "NPARPLA");
			BigDecimal CCODPLA = this.getCampoNumerico(request, "CCODPLA");
			BigDecimal CCOMPANI = this.getCampoNumerico(request, "CCOMPANI");
			BigDecimal CTIPBAN = this.getCampoNumerico(request, "CTIPBAN");
			String CBANCAR = getCampoTextual(request, "CBANCAR");
			String TPOLEXT = getCampoTextual(request, "TPOLEXT");
			BigDecimal NCERTEXT = this.getCampoNumerico(request, "NCERTEXT");
			java.sql.Date FEFECTO = this.stringToSqlDate(this.getCampoTextual(request, "FEFECTO"));
			java.sql.Date FVALMOV = this.stringToSqlDate(this.getCampoTextual(request, "FVALOR"));
			// JGM:antes BigDecimal IMPTEMP = this.getCampoNumerico(request, "IIMPTEMP");
			BigDecimal IMPTEMP;

			if (CINOUT.equals(new BigDecimal(1)))
				IMPTEMP = this.getCampoNumerico(request, "IIMPORTE");
			else
				IMPTEMP = this.getCampoNumerico(request, "IIMPTEMP");

			// 20856
			HashMap mensajes = (HashMap) request.getAttribute(Constantes.MENSAJES);
			mensajes = new HashMap();
			request.setAttribute(Constantes.MENSAJES, mensajes);

			HashMap m = new PAC_IAX_TRASPASOS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_TRASPASOS__F_EJECUTAR_TRASPASO(STRAS, SSEGURO, NRIESGO, CAGRPRO, CINOUT, CTIPTRAS,
							CEXTERN, CTIPDER, CTIPTRASSOL, IMPTEMP, NPORCEN, NPARPLA, CCODPLA, CCOMPANI, CTIPBAN,
							CBANCAR, TPOLEXT, NCERTEXT, FEFECTO, FVALMOV);
			logger.debug("MAP DEVUELTA TRASPASO ------>>>" + m);

			if (((BigDecimal) tratarRETURNyMENSAJES(request, m, false)).intValue() == 0) {
				logger.debug("--->>> ENTRO ERROR TRASPASO");
				formdata.put("missatge_OK", this.obtenerMensajes(m));
				formdata.put("recargar", "0");
			} else {
				formdata.put("recargar", "1");
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr093Service - m�todo m_traspasar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.actualizarImportes(request);
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));

			String MODO = String.valueOf(AbstractDispatchAction.topPila(request, "CMODO"));

			if (!isEmpty(MODO) && (MODO.equals("NUEVO_TRASPASO") || MODO.equals("NUEVO_TRASPASO_MIG"))) {
				AbstractDispatchAction.topPila(request, "CMODO",
						AbstractDispatchAction.topPila(request, "CMODO_ORIGINAL"));
			}

			logger.debug(MODO);
		}
	}

	public void m_infoDatosFiscales(HttpServletRequest request, Axisctr093Action thisAction) {
		logger.debug("Axisctr093Service m_infoDatosFiscales");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {
			BigDecimal STRAS = this.getCampoNumerico(request, "STRAS");
			java.sql.Date FANTIGI = this.stringToSqlDate(this.getCampoTextual(request, "FANTIGI"));
			BigDecimal IIMPANU = this.getCampoNumerico(request, "IIMPANU");
			BigDecimal NPARRET = this.getCampoNumerico(request, "NPARRET");
			BigDecimal IIMPRET = this.getCampoNumerico(request, "IIMPRET");
			BigDecimal NPARPOS2006 = this.getCampoNumerico(request, "NPARPOS2006");
			BigDecimal PORCPOS2006 = this.getCampoNumerico(request, "PORCPOS2006");
			BigDecimal NPARANT2007 = this.getCampoNumerico(request, "NPARANT2007");
			BigDecimal PORCANT2007 = this.getCampoNumerico(request, "PORCANT2007");
			String TMEMO = this.getCampoTextual(request, "TMEMO");

			HashMap m = new PAC_IAX_TRASPASOS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_TRASPASOS__F_INFORMAR_TRASPASO(STRAS, FANTIGI, IIMPANU, NPARRET, IIMPRET, TMEMO,
							NPARPOS2006, PORCPOS2006, NPARANT2007, PORCANT2007);
			logger.debug(m);

			if (((BigDecimal) tratarRETURNyMENSAJES(request, m, false)).intValue() == 0) {
				// formdata.put("missatge_OK",m.get("MENSAJES"));
				formdata.put("missatge_OK", this.obtenerMensajes(m));
				formdata.put("recargar", "0");
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr093Service - m�todo m_infoDatosFiscales", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.actualizarImportes(request);
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));

			String MODO = String.valueOf(AbstractDispatchAction.topPila(request, "CMODO"));

			if (!isEmpty(MODO) && (MODO.equals("NUEVO_TRASPASO") || MODO.equals("NUEVO_TRASPASO_MIG"))) {
				AbstractDispatchAction.topPila(request, "CMODO",
						AbstractDispatchAction.topPila(request, "CMODO_ORIGINAL"));
			}

			logger.debug(MODO);
		}
	}

	public void m_ajax_ccodpla_traspas(HttpServletRequest request) {

		logger.debug("Axisctr093Service m_ajax_ccodpla_traspas");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();
		try {
			PAC_IAX_PRODUCCION pacIaxProduccion = new PAC_IAX_PRODUCCION(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			String CCODPLATRASPAS = this.getCampoTextual(request, "CCODPLATRASPAS");

			logger.debug("planpen:" + CCODPLATRASPAS);

			HashMap m0 = new PAC_IAX_TRASPASOS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_TRASPASOS__F_GET_CCODPLA(CCODPLATRASPAS);
			logger.debug(m0);

			if (new BigDecimal(0).equals(tratarRETURNyMENSAJES(request, m0))) {
				// encuentro datos
				HashMap m = new PAC_IAX_PENSIONES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_PENSIONES__F_GET_OB_PLANPENSIONES((BigDecimal) m0.get("PCCODPLA"));
				logger.debug(m);
				ajax.guardarContenidoFinalAContenedorAjax(m.get("PLANPENSIONES"));
			} else {
				logger.debug("ENTRO ENTRO");

				ajax.rellenarPlAContenedorAjax(m0);
				ajax.guardarContenidoFinalAContenedorAjax(m0);
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr093Service - m�todo m_ajax_poliza_destino", e);
			ajax.rellenarExcepcionAContenedorAjax(e);

		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	public void m_ajax_ccompani_traspas(HttpServletRequest request) {
		logger.debug("Axisctr093Service m_ajax_ccompani_traspas");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();
		try {
			String CCOMPANI = getCampoTextual(request, "CCOMPANI");

			HashMap m = new PAC_IAX_TRASPASOS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_TRASPASOS__F_GET_TCOMPANI(CCOMPANI);
			logger.debug(m);

			Map resultado = new HashMap();
			// resultado.put("TCOMPANI", "perico palotes"); //resultadoAjax[0]);

			Object[] resultadoAjax = (Object[]) ajax.rellenarPlAContenedorAjax(m,
					new String[] { "PCCOMPANI", "PTCOMPANI", "PCBANCAR", "PCTIPBAN" });

			if (resultadoAjax[0].equals(new BigDecimal(0))) {
				Map PCCOMPANI = new HashMap();
				PCCOMPANI.put("PCCOMPANI", resultadoAjax[1]);
				Map PTCOMPANI = new HashMap();
				PTCOMPANI.put("PTCOMPANI", resultadoAjax[2]);
				Map PCBANCAR = new HashMap();
				PCBANCAR.put("PCBANCAR", resultadoAjax[3]);
				Map PCTIPBAN = new HashMap();
				PCTIPBAN.put("PCTIPBAN", resultadoAjax[4]);

				List RESULTADO = new ArrayList();
				RESULTADO.add(PCCOMPANI);
				RESULTADO.add(PTCOMPANI);
				RESULTADO.add(PCBANCAR);
				RESULTADO.add(PCTIPBAN);
				ajax.guardarContenidoFinalAContenedorAjax(RESULTADO);
			} else {
				logger.debug("error");
				ajax.guardarContenidoFinalAContenedorAjax(m);
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr093Service - m�todo m_ajax_ccompani_traspas", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());

		}
	}

	private void actualizarImportes(HttpServletRequest request) {
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {
			if (!isEmpty(formdata.get("IIMPRET")))
				formdata.put("IIMPRET", formdata.get("IIMPRET"));

			if (!isEmpty(formdata.get("IIMPTEMP")))
				formdata.put("IIMPTEMP", formdata.get("IIMPTEMP"));
			if (!isEmpty(formdata.get("NPARPLA")))
				formdata.put("NPARPLA", formdata.get("NPARPLA"));
			if (!isEmpty(formdata.get("NPORCEN")))
				formdata.put("NPORCEN", formdata.get("NPORCEN"));
			if (!isEmpty(formdata.get("IIMPANU")))
				formdata.put("IIMPANU", formdata.get("IIMPANU"));
			if (!isEmpty(formdata.get("IIMPORTE")))
				formdata.put("IIMPORTE", formdata.get("IIMPORTE"));
			if (!isEmpty(formdata.get("CTIPTRASSOL")))
				formdata.put("CTIPTRASSOL", formdata.get("CTIPTRASSOL"));
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr093Service - m�todo actualizarImportes", e);
		}
	}

	private Date fcGetFechaActual() throws Exception {
		java.util.Date today = new java.util.Date();
		java.sql.Date FECHA_ACTUAL = new java.sql.Date(today.getTime());
		logger.debug("FECHA FEHCA:" + FECHA_ACTUAL);
		return FECHA_ACTUAL;
	}

	public void m_confirmar(HttpServletRequest request, Axisctr093Action thisAction) {
		logger.debug("Axisctr093Service m_confirmar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {
			BigDecimal STRAS = this.getCampoNumerico(request, "STRAS");
			BigDecimal CINOUT = this.getCampoNumerico(request, "CINOUT");
			BigDecimal CEXTERN = this.getCampoNumerico(request, "CEXTERN");

			// Gravo primero
			m_grabar(request, thisAction);

			// Bug 17187 - RSC - 04/01/2010 - TRASPASSOS SORTIDA DONA ERROR AL CONFIRMAR I
			// DESPAREIX BOT� TRASPASSAR
			PAC_IAX_PERSONA pac_axis_persona = new PAC_IAX_PERSONA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			BigDecimal CTIPBAN = isEmpty(this.getCampoNumerico(request, "CTIPBAN"))
					? this.getCampoNumerico(request, "CTIPBAN_MODIFVISIBLE")
					: this.getCampoNumerico(request, "CTIPBAN");
			String CBANCAR = getCampoTextual(request, "CBANCAR");

			if (!isEmpty(CBANCAR)) {
				CBANCAR = CBANCAR.replaceAll("-", "");

				Map map = pac_axis_persona.ejecutaPAC_IAX_PERSONA__F_VALIDACCC(CTIPBAN, CBANCAR);

				logger.debug(map);

				if (new BigDecimal(0).equals(tratarRETURNyMENSAJES(request, map))) {

					HashMap m = new PAC_IAX_TRASPASOS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
							.ejecutaPAC_IAX_TRASPASOS__F_CONFIRMAR_TRASPASO(STRAS, CINOUT, CEXTERN);
					logger.debug(m);
					tratarRETURNyMENSAJES(request, m, false);
				}
			} else {
				HashMap m = new PAC_IAX_TRASPASOS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_TRASPASOS__F_CONFIRMAR_TRASPASO(STRAS, CINOUT, CEXTERN);
				logger.debug(m);
				tratarRETURNyMENSAJES(request, m, false);
			}
			// Fin Bug 17187

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr093Service - m�todo m_confirmar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.actualizarImportes(request);
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));

			String MODO = String.valueOf(AbstractDispatchAction.topPila(request, "CMODO"));

			if (!isEmpty(MODO) && (MODO.equals("NUEVO_TRASPASO") || MODO.equals("NUEVO_TRASPASO_MIG"))) {
				AbstractDispatchAction.topPila(request, "CMODO",
						AbstractDispatchAction.topPila(request, "CMODO_ORIGINAL"));
			}

			logger.debug(MODO);

		}
	}

}
