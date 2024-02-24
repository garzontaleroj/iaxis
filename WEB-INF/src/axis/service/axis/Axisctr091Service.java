package axis.service.axis;

import java.math.BigDecimal;
import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.cache.AxisCodeWizard;
import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.jdbc.PAC_IAX_PERSONA;
import axis.jdbc.PAC_IAX_PRODUCCION;
import axis.jdbc.PAC_IAX_VALIDACIONES;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.control.axis.Axisctr091Action;
import axis.mvc.model.UsuarioBean;
import axis.util.Constantes;

public class Axisctr091Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	public void m_init(HttpServletRequest request, Axisctr091Action thisAction) {
		logger.debug("Axisctr091Service m_init");
		try {
			request.getSession().removeAttribute("lstsaldodeutors");
			m_form(request, thisAction);
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr091Service - m�todo m_init", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

	public void m_form(HttpServletRequest request, Axisctr091Action thisAction) {
		logger.debug("Axisctr091Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {
			reformatearImporte(request);
			PAC_IAX_PRODUCCION pac_iax_produccion = new PAC_IAX_PRODUCCION(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			PAC_IAX_PERSONA pac_aix_persona = new PAC_IAX_PERSONA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			BigDecimal NRIESGO = isEmpty(getCampoNumerico(request, "NRIESGO"))
					? new BigDecimal(String.valueOf(AbstractDispatchAction.topPila(request, "NRIESGO")))
					: getCampoNumerico(request, "NRIESGO");

			String SNIP = isEmpty(getCampoTextual(request, "SNIP"))
					? String.valueOf(AbstractDispatchAction.topPila(request, "SNIP"))
					: getCampoTextual(request, "SNIP");
			logger.debug("SNIP-->" + SNIP);
			formdata.put("SNIP", SNIP);
			formdata.put("NRIESGO", NRIESGO);

			ArrayList<HashMap> lstsaldo = new ArrayList<HashMap>();

			Map m = pac_aix_persona.ejecutaPAC_IAX_PERSONA__F_GET_CTR_PRESTAMOSEG_HOST(NRIESGO,
					(String) AbstractDispatchAction.topPila(request, "CMODO"));
			logger.debug(m);

			if (!isEmpty(this.tratarRETURNyMENSAJES(request, m))
					&& ((BigDecimal) this.tratarRETURNyMENSAJES(request, m)).intValue() == 0) {
				lstsaldo = (ArrayList<HashMap>) m.get("PT_PRESTAMOSEG");

				if (!isEmpty(lstsaldo) && lstsaldo.size() > 0) {
					formdata.put("TOTAL", this.recalcularTotal(lstsaldo));
					request.getSession().setAttribute("lstsaldodeutors", lstsaldo);
				}

				Map dat = pac_iax_produccion.ejecutaPAC_IAX_PRODUCCION__F_GET_DETPOLIZA();
				logger.debug(dat);
				Map detpoliza = (Map) this.tratarRETURNyMENSAJES(request, dat);
				logger.debug(detpoliza.get("ICAPMAXPOL"));
				formdata.put("ICAPMAXPOL", detpoliza.get("ICAPMAXPOL"));

			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr091Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.configForm(request, whoami(this));
			cargarListas(request, thisAction);
		}

	}

	private BigDecimal recalcularTotal(ArrayList<HashMap> saldo) {

		BigDecimal total = new BigDecimal(0);

		for (HashMap s : saldo) {
			// Map m = (HashMap)s.get("OB_IAX_SALDODEUTORSEG");
			Map m = (HashMap) s.get("OB_IAX_PRESTAMOSEG");
			logger.debug(m);
			if (!isEmpty(m.get("ICAPASEG")) && !isEmpty(m.get("SELSALDO"))
					&& new BigDecimal((String.valueOf(m.get("SELSALDO")))).intValue() == 1)
				total = total = total.add(new BigDecimal(String.valueOf(m.get("ICAPASEG"))));
		}

		return total;
	}

	private void cargarListas(HttpServletRequest request, Axisctr091Action thisAction) {
		logger.debug("Axisctr091Service cargarLista");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {
			PAC_IAX_LISTVALORES pac_iax_listvalores = new PAC_IAX_LISTVALORES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			HashMap listvalores = new HashMap();
			Map m = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(402));
			logger.debug(m);
			listvalores.put("lsttipimp", (List) this.tratarRETURNyMENSAJES(request, m));

			formdata.put("listvalores", listvalores);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr091Service - m�todo m_validar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

	public void m_recargar(HttpServletRequest request, Axisctr091Action thisAction) {
		logger.debug("Axisctr091Service m_recargar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {
			reformatearImporte(request);
			BigDecimal TIPIMP = this.getCampoNumerico(request, "TIPIMP");
			String ID = this.getCampoTextual(request, "ID");
			BigDecimal SELSALDO = isEmpty(this.getCampoNumerico(request, "SELSALDO")) ? new BigDecimal(0)
					: this.getCampoNumerico(request, "SELSALDO");

			BigDecimal ISALDO = this.getCampoNumerico(request, "ISALDO");
			BigDecimal PORCEN = this.getCampoNumerico(request, "PORCEN");
			BigDecimal ICAPMAX = this.getCampoNumerico(request, "ICAPMAX");

			BigDecimal ILIMITE = this.getCampoNumerico(request, "ILIMITE");
			logger.debug(ILIMITE);

			if (TIPIMP.intValue() != 3)
				ILIMITE = null;

			// if (TIPIMP.intValue() != 2)
			// PORCEN = null;

			logger.debug("id-->" + ID);
			logger.debug("TIPIMP-->" + TIPIMP);

			ArrayList<HashMap> saldo = (ArrayList<HashMap>) request.getSession().getAttribute("lstsaldodeutors");

			if (!isEmpty(saldo) && saldo.size() > 0) {
				for (HashMap s : saldo) {
					HashMap m = (HashMap) s.get("OB_IAX_PRESTAMOSEG");
					logger.debug(m);
					if (!isEmpty(m.get("IDCUENTA")) && String.valueOf(m.get("IDCUENTA")).equals(ID)) {

						PAC_IAX_PRODUCCION pac_iax_produccion = new PAC_IAX_PRODUCCION(
								(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
						if (SELSALDO.intValue() == 1) {
							Map map = pac_iax_produccion.ejecutaPAC_IAX_PRODUCCION__F_CALCULA_CAPASE(TIPIMP, ISALDO,
									PORCEN, ILIMITE, ICAPMAX);
							logger.debug(map);

							if (((BigDecimal) this.tratarRETURNyMENSAJES(request, map)).intValue() == 0)
								m.put("ICAPASEG", map.get("PICAPASE"));
						} else
							m.put("ICAPASEG", new BigDecimal(0));

						if (TIPIMP.intValue() == 3)
							m.put("ILIMITE", ILIMITE);

						// if (TIPIMP.intValue() == 2)
						m.put("PORCEN", PORCEN);

						logger.debug("-------- ICAPMAX:" + ICAPMAX);
						m.put("ICAPMAX", ICAPMAX);

						if (!isEmpty(TIPIMP))
							m.put("CTIPIMP", TIPIMP);

						m.put("SELSALDO", SELSALDO);
					}
					logger.debug("--------------- m:" + m);
				}
				formdata.put("TOTAL", this.recalcularTotal(saldo));

			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr091Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {

			this.configForm(request, whoami(this));
			cargarListas(request, thisAction);
		}

	}

	/**
	 * Guarda la pantalla, realiza su validaci�n y determina la siguiente pantalla a
	 * ejecutar.
	 * 
	 * @param request
	 * @param thisAction
	 */
	public BigDecimal m_siguiente(HttpServletRequest request, Axisctr091Action thisAction) {
		logger.debug("Axisctr091Service m_siguiente");
		m_guardar(request, thisAction);
		BigDecimal perror = new BigDecimal(0);
		if (isEmpty(this.getCampoNumerico(request, "isSimul")))
			perror = m_validar(request, thisAction, Constantes.SIGUIENTE);
		return perror;
	}

	/**
	 * Ejecuta la validaci�n del formulario contra BD.
	 * 
	 * @param request    El HttpServletRequest que contiene la petici�n del cliente
	 *                   web.
	 * @param thisAction Una Action abstracta desde donde se ha invocado el servicio
	 *                   (necesaria para el log).
	 */
	private BigDecimal m_validar(HttpServletRequest request, Axisctr091Action thisAction, BigDecimal direccion) {
		logger.debug("Axisctr091Service m_validar 3 params");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {
			reformatearImporte(request);
			PAC_IAX_VALIDACIONES pac_iax_validaciones = new PAC_IAX_VALIDACIONES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			PAC_IAX_PRODUCCION pac_iax_produccion = new PAC_IAX_PRODUCCION(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			BigDecimal NRIESGO = this.getCampoNumerico(request, "NRIESGO");
			BigDecimal TOTAL = this.getCampoNumerico(request, "TOTAL");
			formdata.put("TOTAL", TOTAL);
			BigDecimal ICAPMAXPOL = getCampoNumerico(request, "ICAPMAXPOL");
			formdata.put("ICAPMAXPOL", ICAPMAXPOL);
			Map m = pac_iax_validaciones.ejecutaPAC_IAX_VALIDACIONES__F_VALIDA_PRESTAMOSEG(NRIESGO);
			logger.debug("--------- prestamo:" + m);
			// this.tratarRETURNyMENSAJES(request, m);
			if (!isEmpty(m.get("PPRESTAMO"))) {
				if (((BigDecimal) m.get("RETURN")).intValue() != 0)
					this.tratarRETURNyMENSAJES(request, m);
				formdata.put("TOTAL", this.recalcularTotal((ArrayList) m.get("PPRESTAMO")));

				logger.debug("grabando prestamo");
				request.getSession().setAttribute("lstsaldodeutors", m.get("PPRESTAMO"));
				logger.debug("grabando prestamo 2");

				Map dat = pac_iax_produccion.ejecutaPAC_IAX_PRODUCCION__F_GET_DETPOLIZA();
				logger.debug(dat);
				Map detpoliza = (Map) this.tratarRETURNyMENSAJES(request, dat);
				logger.debug(detpoliza.get("ICAPMAXPOL"));
				formdata.put("ICAPMAXPOL", detpoliza.get("ICAPMAXPOL"));
			}
			m_guardar(request, thisAction);

			if (!isEmpty(m.get("PPRESTAMO"))) {
				request.setAttribute(Constantes.FORWARDACTION,
						AxisCodeWizard.findForward(request, direccion, whoami(this), null));

			} else {
				return new BigDecimal(1);
			}
			return new BigDecimal(0);
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr091Service - m�todo m_validar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
			return new BigDecimal(1);
		} finally {

			this.configForm(request, whoami(this));
			cargarListas(request, thisAction);
		}
	}

	public void m_validar(HttpServletRequest request, Axisctr091Action thisAction) {
		logger.debug("Axisctr091Service m_validar 2 params");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {
			reformatearImporte(request);
			m_guardar(request, thisAction);

			PAC_IAX_VALIDACIONES pac_iax_validaciones = new PAC_IAX_VALIDACIONES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			PAC_IAX_PRODUCCION pac_iax_produccion = new PAC_IAX_PRODUCCION(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			BigDecimal NRIESGO = this.getCampoNumerico(request, "NRIESGO");
			Map m = pac_iax_validaciones.ejecutaPAC_IAX_VALIDACIONES__F_VALIDA_PRESTAMOSEG(NRIESGO);
			this.tratarRETURNyMENSAJES(request, m);
			logger.debug("-----------validar2" + m);

			if (!isEmpty(m.get("PPRESTAMO"))) {
				formdata.put("TOTAL", this.recalcularTotal((ArrayList) m.get("PPRESTAMO")));
				request.getSession().setAttribute("lstsaldodeutors", m.get("PPRESTAMO"));

				Map dat = pac_iax_produccion.ejecutaPAC_IAX_PRODUCCION__F_GET_DETPOLIZA();
				logger.debug(dat);
				Map detpoliza = (Map) this.tratarRETURNyMENSAJES(request, dat);
				logger.debug(detpoliza.get("ICAPMAXPOL"));
				formdata.put("ICAPMAXPOL", detpoliza.get("ICAPMAXPOL"));
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr091Service - m�todo m_validar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {

			this.configForm(request, whoami(this));
			cargarListas(request, thisAction);
		}
	}

	public void m_ctrhost(HttpServletRequest request, Axisctr091Action thisAction) {
		logger.debug("Axisctr091Service m_ctrhost");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {
			reformatearImporte(request);
			m_guardar(request, thisAction);

			PAC_IAX_PERSONA pac_iax_persona = new PAC_IAX_PERSONA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			PAC_IAX_PRODUCCION pac_iax_produccion = new PAC_IAX_PRODUCCION(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			BigDecimal NRIESGO = this.getCampoNumerico(request, "NRIESGO");
			logger.debug(AbstractDispatchAction.topPila(request));
			Map m =
					// pac_iax_persona.ejecutaPAC_IAX_PERSONA__F_GET_CTRSALDO_HOST(NRIESGO);

					pac_iax_persona.ejecutaPAC_IAX_PERSONA__F_GET_CONTRATOS_HOST(
							(String) AbstractDispatchAction.topPila(request, "CMODO"));
			logger.debug(m);
			if (((BigDecimal) this.tratarRETURNyMENSAJES(request, m)).intValue() == 0) {
				formdata.put("TOTAL", this.recalcularTotal((ArrayList) m.get("PT_PRESTAMO")));
				request.getSession().setAttribute("lstsaldodeutors", m.get("PT_PRESTAMO"));

				Map dat = pac_iax_produccion.ejecutaPAC_IAX_PRODUCCION__F_GET_DETPOLIZA();
				logger.debug(dat);
				Map detpoliza = (Map) this.tratarRETURNyMENSAJES(request, dat);
				logger.debug(detpoliza.get("ICAPMAXPOL"));
				formdata.put("ICAPMAXPOL", detpoliza.get("ICAPMAXPOL"));
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr091Service - m�todo m_ctrhost", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {

			this.configForm(request, whoami(this));
			cargarListas(request, thisAction);
		}
	}

	/**
	 * Guarda la pantalla, realiza su validaci�n y determina la pantalla anterior a
	 * ejecutar.
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_anterior(HttpServletRequest request, Axisctr091Action thisAction) {
		logger.debug("Axisctr091Service m_anterior");

		try {
			m_guardar(request, thisAction);
			m_validar(request, thisAction, Constantes.ANTERIOR);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr091Service - m�todo m_validar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}

	}

	/**
	 * Guarda la pantalla
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_guardar(HttpServletRequest request, Axisctr091Action thisAction) {
		logger.debug("Axisctr091Service m_guardar");

		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {
			reformatearImporte(request);
			PAC_IAX_PRODUCCION pac_iax_produccion = new PAC_IAX_PRODUCCION(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			BigDecimal NRIESGO = getCampoNumerico(request, "NRIESGO");
			BigDecimal ICAPMAXPOL = getCampoNumerico(request, "ICAPMAXPOL");
			formdata.put("ICAPMAXPOL", ICAPMAXPOL);
			logger.debug("------ icapmaxpol:" + ICAPMAXPOL);
			ArrayList<HashMap> saldo = (ArrayList<HashMap>) request.getSession().getAttribute("lstsaldodeutors");
			BigDecimal ICAPITALSIMUL = this.getCampoNumerico(request, "ICAPITAL_SIMUL");
			formdata.put("ICAPITALSIMUL", ICAPITALSIMUL);

			BigDecimal TOTAL = this.getCampoNumerico(request, "TOTAL");
			formdata.put("TOTAL", TOTAL);
			logger.debug("------- saldo:" + saldo);
			if (!isEmpty(saldo) && saldo.size() > 0 && isEmpty(ICAPITALSIMUL)
					&& isEmpty(this.getCampoNumerico(request, "isSimul"))) {
				for (HashMap s : saldo) {
					HashMap m = (HashMap) s.get("OB_IAX_PRESTAMOSEG");
					logger.debug(m);
					if (!isEmpty(m.get("IDCUENTA"))) {
						BigDecimal SELSALDO = isEmpty(m.get("SELSALDO")) ? new BigDecimal(0)
								: new BigDecimal(String.valueOf(m.get("SELSALDO")));
						logger.debug("SELSALDO-" + SELSALDO);

						String IDCUENTA = isEmpty(m.get("IDCUENTA")) ? null : String.valueOf(m.get("IDCUENTA"));
						logger.debug("IDCUENTA-" + IDCUENTA);

						BigDecimal CTIPCUENTA = isEmpty(m.get("CTIPCUENTA")) ? null
								: new BigDecimal(String.valueOf(m.get("CTIPCUENTA")));
						logger.debug("CTIPCUENTA-" + CTIPCUENTA);

						BigDecimal CTIPBAN = isEmpty(m.get("CTIPBAN")) ? null
								: new BigDecimal(String.valueOf(m.get("CTIPBAN")));
						logger.debug("CTIPBAN-" + CTIPBAN);

						BigDecimal CTIPIMP = isEmpty(m.get("CTIPIMP")) ? null
								: new BigDecimal(String.valueOf(m.get("CTIPIMP")));
						logger.debug("CTIPIMP-" + CTIPIMP);

						BigDecimal ISALDO = isEmpty(m.get("ISALDO")) ? null
								: new BigDecimal(String.valueOf(m.get("ISALDO")));
						logger.debug("ISALDO-" + ISALDO);

						BigDecimal PORCEN = isEmpty(m.get("PORCEN")) ? null
								: new BigDecimal(String.valueOf(m.get("PORCEN")));
						logger.debug("PORCEN-" + PORCEN);

						BigDecimal ILIMITE = isEmpty(m.get("ILIMITE")) ? null
								: new BigDecimal(String.valueOf(m.get("ILIMITE")));
						logger.debug("ILIMITE-" + ILIMITE);

						BigDecimal ICAPMAX = isEmpty(m.get("ICAPMAX")) ? null
								: new BigDecimal(String.valueOf(m.get("ICAPMAX")));
						logger.debug("ICAPMAX-" + ICAPMAX);
						String CMONEDA = isEmpty(m.get("CMONEDA")) ? null : String.valueOf(m.get("CMONEDA"));
						logger.debug("CMONEDA-" + CMONEDA);
						BigDecimal ICAPASE = isEmpty(m.get("ICAPASEG")) ? null
								: new BigDecimal(String.valueOf(m.get("ICAPASEG")));
						logger.debug("ICAPASEG-" + ICAPASE);
						String DESCRIPCION = isEmpty(m.get("DESCRIPCION")) ? null
								: String.valueOf(m.get("DESCRIPCION"));
						Date FINIPREST = AxisBaseService.stringToSqlDate(getHiddenCampoTextual(request, "FINIPREST"));
						Date FFINPREST = AxisBaseService.stringToSqlDate(getHiddenCampoTextual(request, "FFINPREST"));
						Map map = pac_iax_produccion.ejecutaPAC_IAX_PRODUCCION__F_SET_PRESTAMOSEG(NRIESGO, SELSALDO,
								IDCUENTA, CTIPCUENTA, CTIPBAN, CTIPIMP, ISALDO, PORCEN, ILIMITE, ICAPMAX, CMONEDA,
								ICAPMAXPOL, ICAPASE, DESCRIPCION, FINIPREST, FFINPREST);

						logger.debug(map);
						logger.debug("------- resultado guardar:" + map);
						if (((BigDecimal) this.tratarRETURNyMENSAJES(request, map)).intValue() != 0)
							break;
					}

				}
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr091Service - m�todo m_validar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {

			this.configForm(request, whoami(this));
			cargarListas(request, thisAction);
		}

	}

	private void reformatearImporte(HttpServletRequest request) {
		logger.debug("Axisctr091Service reformatearImporte");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		BigDecimal TOTAL = this.getCampoNumerico(request, "TOTAL");
		formdata.put("TOTAL", TOTAL);
		BigDecimal ICAPMAXPOL = getCampoNumerico(request, "ICAPMAXPOL");
		formdata.put("ICAPMAXPOL", ICAPMAXPOL);
		BigDecimal ILIMITE = getCampoNumerico(request, "ILIMITE");
		formdata.put("ILIMITE", ILIMITE);
		BigDecimal ICAPITAL_SIMUL = getCampoNumerico(request, "ICAPITAL_SIMUL");
		formdata.put("ICAPITAL_SIMUL", ICAPITAL_SIMUL);

	}

}
