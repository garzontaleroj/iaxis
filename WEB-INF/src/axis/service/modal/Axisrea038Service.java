package axis.service.modal;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_LIQUIDA;
import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.jdbc.PAC_IAX_REA;
import axis.jdbc.PAC_IAX_REDCOMERCIAL;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

public class Axisrea038Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	public void m_init(HttpServletRequest request, AbstractDispatchAction thisAction) {
		logger.debug("Axisrea038Service m_init");
		this.formattingNumericValues(request);
		try {

		} catch (Exception e) {
			logger.error("Error en el servicio Axisrea038Service - m�todo m_init", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
	}

	public void m_form(HttpServletRequest request, AbstractDispatchAction thisAction) {
		logger.debug("Axisrea038Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		this.formattingNumericValues(request);
		try {
			PAC_IAX_LIQUIDA pac_axis_liquida = new PAC_IAX_LIQUIDA(
					(Connection) request.getAttribute(Constantes.DB01CONN));
			PAC_IAX_REDCOMERCIAL pac_axis_redcomercial = new PAC_IAX_REDCOMERCIAL(
					(Connection) request.getAttribute(Constantes.DB01CONN));

			BigDecimal CAGENTE = this.getCampoNumerico(request, "CAGENTE");
			BigDecimal CEMPRES = this.getCampoNumerico(request, "CEMPRES");

			Date d = new Date(new java.util.Date().getTime());
			if (!isEmpty(CAGENTE)) {
				Map map = pac_axis_redcomercial.ejecutaPAC_IAX_REDCOMERCIAL__F_GET_AGENTES(CEMPRES, d, CAGENTE, null,
						null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null,
						null, null, null, null, null, null, null);
				logger.debug(map);

				List l = (List) this.tratarRETURNyMENSAJES(request, map);
				if (!isEmpty(l) && l.size() > 0) {
					HashMap m = (HashMap) l.get(0);
					formdata.putAll(m);
					CEMPRES = (BigDecimal) m.get("CEMPRES");
				}

				if (!isEmpty(CEMPRES)) {
					map = pac_axis_liquida.ejecutaPAC_IAX_LIQUIDA__F_GET_SALDOAGENTE(CEMPRES, CAGENTE);
					logger.debug(map);
					if (((BigDecimal) this.tratarRETURNyMENSAJES(request, map)).equals(BigDecimal.ZERO))
						formdata.put("SALDO", map.get("PSALDO"));
				}

				map = pac_axis_liquida.ejecutaPAC_IAX_LIQUIDA__F_GET_CTAS(CAGENTE);
				logger.debug(map);
				if (((BigDecimal) this.tratarRETURNyMENSAJES(request, map)).equals(BigDecimal.ZERO))
					formdata.put("cuentas", map.get("PCURCUENTASTEC"));

			}
			this.cargarListas(request);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisrea038Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
	}

	private void cargarListas(HttpServletRequest request) throws Exception {
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map listValores = new HashMap();
		// Carga de las PAC_IAX PL/SQL
		PAC_IAX_LISTVALORES pac_axis_listValores = new PAC_IAX_LISTVALORES(
				(Connection) request.getAttribute(Constantes.DB01CONN));

	}

	public void m_cargar_valores(HttpServletRequest request, AbstractDispatchAction thisAction) {
		logger.debug("Axisrea038Service m_cargar_valores");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		this.formattingNumericValues(request);
		try {
			PAC_IAX_REA pac_axis_rea = new PAC_IAX_REA((Connection) request.getAttribute(Constantes.DB01CONN));

			BigDecimal CEMPRESA = getCampoNumerico(request, "CEMPRES_SEL");
			java.sql.Date FCIERRE = stringToSqlDate(getCampoTextual(request, "FCIERRE_SEL"));
			BigDecimal SPRODUC = getCampoNumerico(request, "SPRODUC_SEL");
			BigDecimal CCOMPANI = getCampoNumerico(request, "CCOMPANI_SEL");
			BigDecimal SCONTRA = getCampoNumerico(request, "SCONTRA_SEL");
			BigDecimal NVERSIO = getCampoNumerico(request, "NVERSIO_SEL");
			BigDecimal CTRAMO = getCampoNumerico(request, "CTRAMO_SEL");
			BigDecimal CESTADO = getCampoNumerico(request, "CESTADO_SEL");
			BigDecimal NPOLIZA = getCampoNumerico(request, "NPOLIZA_SEL");
			BigDecimal CIAPROP = getCampoNumerico(request, "COMPANIA");
			BigDecimal SPAGREA = getCampoNumerico(request, "SPAGREA");

			/*
			 * Para el checkbox de 'Ver todos los conceptos', al marcar ense�a los
			 * Liquidables y los NO Liquidables VER_TODOS = request en el javaScript del
			 * checkbox marcado = 1 no marcado = 0 CHECK_VER_TODOS = request en el formdata,
			 * para conservar el valor al volver de otra pantalla.
			 */
			BigDecimal VER_TODOS = getCampoNumerico(request, "VER_TODOS");
			if (VER_TODOS != null) {
				VER_TODOS = VER_TODOS != null ? VER_TODOS : BigDecimal.ZERO;
				formdata.put("CHECK_VER_TODOS", VER_TODOS);
			} else {
				BigDecimal CHECK_VER_TODOS = getCampoNumerico(request, "CHECK_VER_TODOS");
				VER_TODOS = CHECK_VER_TODOS != null ? CHECK_VER_TODOS : BigDecimal.ZERO;
			}

			/*
			 * ************************* Recuperamos la cabecera *************************
			 */
			Map valor = pac_axis_rea.ejecutaPAC_IAX_REA__F_GET_CAB_MOVCTA(CEMPRESA, SPRODUC, CCOMPANI, SCONTRA, NVERSIO,
					CTRAMO, FCIERRE, CESTADO, NPOLIZA, CIAPROP, SPAGREA);
			logger.debug(valor);

			ArrayList valores = (ArrayList) this.tratarRETURNyMENSAJES(request, valor);
			if (valores != null && valores.size() >= 1) {
				HashMap mapa_valores = (HashMap) valores.get(0);
				formdata.putAll(mapa_valores);
			}

			/*
			 * ************************* Recuperamos movimientos **************************
			 */
			Map lista = pac_axis_rea.ejecutaPAC_IAX_REA__F_GET_MOVCTATECNICA(CEMPRESA, SPRODUC, CCOMPANI, SCONTRA,
					NVERSIO, CTRAMO, FCIERRE, CESTADO, NPOLIZA, CIAPROP, SPAGREA, VER_TODOS);
			logger.debug(lista);
			ArrayList listacta = (ArrayList) this.tratarRETURNyMENSAJES(request, lista);
			formdata.put("listaCta", listacta);

			logger.debug("FORMDATA ******************************************: " + formdata);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisrea038Service - m�todo m_cargar_valores", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
	}

	public void m_delete(HttpServletRequest request, AbstractDispatchAction thisAction) {
		logger.debug("Axisrea038Service m_delete");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		this.formattingNumericValues(request);
		try {
			PAC_IAX_REA pac_axis_rea = new PAC_IAX_REA((Connection) request.getAttribute(Constantes.DB01CONN));

			BigDecimal CEMPRES = this.getCampoNumerico(request, "CEMPRES_SEL");

			java.sql.Date FCIERRE = stringToSqlDate(getCampoTextual(request, "FCIERRE_SEL"));
			BigDecimal SPRODUC = getCampoNumerico(request, "SPRODUC_SEL");
			BigDecimal CCOMPANI = getCampoNumerico(request, "CCOMPANI_SEL");
			BigDecimal SCONTRA = getCampoNumerico(request, "SCONTRA_SEL");
			BigDecimal NVERSIO = getCampoNumerico(request, "NVERSIO_SEL");
			BigDecimal CTRAMO = getCampoNumerico(request, "CTRAMO_SEL");
			BigDecimal CCONCEP = getCampoNumerico(request, "CCONCEP_SEL");
			BigDecimal NNUMLIN = getCampoNumerico(request, "NNUMLIN_SEL");
			// INI - AXIS 4624 - 11/07/2019 - AABG - SE OBTIENE EL CAMPO DE POLIZA,
			// SINIESTRO
			BigDecimal NPOLIZA = getCampoNumerico(request, "NPOLIZA_DEL");
			BigDecimal NSINIES = getCampoNumerico(request, "NSINIES_DEL");
			// FIN - AXIS 4624 - 11/07/2019 - AABG - SE OBTIENE EL CAMPO DE POLIZA,
			// SINIESTRO
			BigDecimal NCERTIF = getCampoNumerico(request, "NCERTIF");
			BigDecimal CIAPROP = getCampoNumerico(request, "COMPANIA");

			Map map = pac_axis_rea.ejecutaPAC_IAX_REA__F_DEL_MOVCTATECNICA(CEMPRES, SPRODUC, CCOMPANI, SCONTRA, NVERSIO,
					CTRAMO, FCIERRE, CCONCEP, NNUMLIN, NPOLIZA, NCERTIF, NSINIES, CIAPROP);
			this.tratarRETURNyMENSAJES(request, map);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisrea038Service - m�todo m_delete", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
	}

	public void m_aceptar(HttpServletRequest request, AbstractDispatchAction thisAction) {
		logger.debug("Axisrea038Service m_liquida");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		this.formattingNumericValues(request);
		try {

			PAC_IAX_REA pac_axis_rea = new PAC_IAX_REA((Connection) request.getAttribute(Constantes.DB01CONN));

			BigDecimal CEMPRESA = getCampoNumerico(request, "CEMPRES_SEL");
			java.sql.Date FCIERRE = stringToSqlDate(getCampoTextual(request, "FCIERRE_SEL"));
			BigDecimal SPRODUC = getCampoNumerico(request, "SPRODUC_SEL");
			BigDecimal CCOMPANI = getCampoNumerico(request, "CCOMPANI_SEL");
			BigDecimal NVERSIO = getCampoNumerico(request, "NVERSIO_SEL");
			BigDecimal SCONTRA = getCampoNumerico(request, "SCONTRA_SEL");
			BigDecimal CTRAMO = getCampoNumerico(request, "CTRAMO_SEL");
			String elementosNS = getCampoTextual(request, "CADENA_VALORES_NS");
			String elementosS = getCampoTextual(request, "CADENA_VALORES_S");
			BigDecimal CESTADO = getCampoNumerico(request, "CESTADO_SEL");
			BigDecimal NPOLIZA = getCampoNumerico(request, "NPOLIZA_SEL");
			BigDecimal CIAPROP = getCampoNumerico(request, "COMPANIA");
			BigDecimal SPAGREA = getCampoNumerico(request, "SPAGREA");

			/*
			 * 1� recuperamos la lista de movimientos de la cual llamaremos uno por uno los
			 * NO SELECCIONADOS
			 */
			// SPAGREA a null, cuando tratamos movimientos cancelables estos no tendran
			// SPAGREA
			Map lista = pac_axis_rea.ejecutaPAC_IAX_REA__F_GET_MOVCTATECNICA(CEMPRESA, SPRODUC, CCOMPANI, SCONTRA,
					NVERSIO, CTRAMO, FCIERRE, CESTADO, NPOLIZA, CIAPROP, SPAGREA, BigDecimal.ZERO);
			logger.debug(lista);
			List<Map> RETURN = (List<Map>) tratarRETURNyMENSAJES(request, lista);

			logger.debug(RETURN);
			BigDecimal ok = new BigDecimal(0);
			if (!isEmpty(elementosNS)) {

				/* Por cada registro no seleccionado invocamos a la fucni�n */
				String cadena[] = elementosNS.split("x");

				for (int i = 0; i < cadena.length; i++) {

					String num_cadena = cadena[i];
					Integer valor = new Integer(num_cadena);

					HashMap mapa = (HashMap) RETURN.get(valor); // Se busca el registro
					BigDecimal NVERSIO_FILA = (BigDecimal) mapa.get("NVERSIO");
					BigDecimal NNUMLIN = (BigDecimal) mapa.get("NNUMLIN");
					BigDecimal CESTADO_FILA = (BigDecimal) mapa.get("CESTADO");

					Map map = pac_axis_rea.ejecutaPAC_IAX_REA__F_SET_RETEN_LIQUIDA(CCOMPANI, NVERSIO_FILA, SCONTRA,
							CTRAMO, NNUMLIN, null, null, null, null, new BigDecimal("4"), CESTADO_FILA);
					ok = (BigDecimal) this.tratarRETURNyMENSAJES(request, map);
					if (ok.intValue() != 0) {
						break;
					}

				}
			}

			if (!isEmpty(elementosS)) {

				/* Por cada registro seleccionado invocamos a la fucni�n */
				String cadena[] = elementosS.split("x");

				for (int i = 0; i < cadena.length; i++) {

					String num_cadena = cadena[i];
					Integer valor = new Integer(num_cadena);

					HashMap mapa = (HashMap) RETURN.get(valor); // Se busca el registro
					BigDecimal NVERSIO_FILA = (BigDecimal) mapa.get("NVERSIO");
					BigDecimal NNUMLIN = (BigDecimal) mapa.get("NNUMLIN");
					BigDecimal CESTADO_FILA = (BigDecimal) mapa.get("CESTADO");

					Map map = pac_axis_rea.ejecutaPAC_IAX_REA__F_SET_RETEN_LIQUIDA(CCOMPANI, NVERSIO_FILA, SCONTRA,
							CTRAMO, NNUMLIN, null, null, null, null, new BigDecimal("1"), CESTADO_FILA);
					ok = (BigDecimal) this.tratarRETURNyMENSAJES(request, map);
					if (ok.intValue() != 0) {
						break;
					}

				}
			}

			if (ok.intValue() == 0)
				request.setAttribute("ok", "0");

			/*
			 * *****************************************************************************
			 * ********************
			 */

		} catch (Exception e) {
			logger.error("Error en el servicio Axisrea038Service - m�todo m_liquida", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
	}

}
