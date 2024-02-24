package axis.service.modal;

import java.math.BigDecimal;
import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.jdbc.PAC_IAX_PERSONA;
import axis.jdbc.PAC_IAX_PRODUCCION;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.control.modal.Axisctr103Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

public class Axisctr103Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	public void m_init(HttpServletRequest request, Axisctr103Action thisAction) {
		logger.debug("Axisctr103Service m_init");
		try {
			m_form(request, thisAction);
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr103Service - m�todo m_init", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

	public void m_form(HttpServletRequest request, Axisctr103Action thisAction) {
		logger.debug("Axisctr103Service m_form");
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

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr103Service - m�todo m_form", e);
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

	private void cargarListas(HttpServletRequest request, Axisctr103Action thisAction) {
		logger.debug("Axisctr103Service cargarLista");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {
			PAC_IAX_LISTVALORES pac_iax_listvalores = new PAC_IAX_LISTVALORES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			HashMap listvalores = new HashMap();
			Map m = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(402));
			logger.debug(m);
			listvalores.put("lsttipimp", (List) this.tratarRETURNyMENSAJES(request, m));

			m = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(401));
			logger.debug(m);
			listvalores.put("lsttipcon", (List) this.tratarRETURNyMENSAJES(request, m));

			formdata.put("listvalores", listvalores);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr103Service - m�todo m_validar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

	/**
	 * Guarda la pantalla
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_guardar(HttpServletRequest request, Axisctr103Action thisAction) {
		logger.debug("Axisctr103Service m_guardar");

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

			String IDCUENTA = this.getCampoTextual(request, "IDCUENTA");
			logger.debug("IDCUENTA-" + IDCUENTA);
			if (!isEmpty(IDCUENTA)) {
				this.actualizarPrestamos(request);

				BigDecimal CTIPCUENTA = getCampoNumerico(request, "CTIPCUENTA");
				logger.debug("CTIPCUENTA-" + CTIPCUENTA);

				BigDecimal CTIPBAN = getCampoNumerico(request, "CTIPBAN");
				logger.debug("CTIPBAN-" + CTIPBAN);

				BigDecimal CTIPIMP = getCampoNumerico(request, "CTIPIMP");
				logger.debug("CTIPIMP-" + CTIPIMP);

				BigDecimal ISALDO = getCampoNumerico(request, "ISALDO");
				logger.debug("ISALDO-" + ISALDO);

				BigDecimal PORCEN = getCampoNumerico(request, "PORCEN");
				logger.debug("PORCEN-" + PORCEN);

				BigDecimal ILIMITE = getCampoNumerico(request, "ILIMITE");
				logger.debug("ILIMITE-" + ILIMITE);

				BigDecimal ICAPMAX = getCampoNumerico(request, "ICAPMAX");
				logger.debug("ICAPMAX-" + ICAPMAX);
				String CMONEDA = this.getCampoTextual(request, "CMONEDA");
				logger.debug("CMONEDA-" + CMONEDA);
				BigDecimal ICAPASE = getCampoNumerico(request, "ICAPASE");
				logger.debug("ICAPASEG-" + ICAPASE);
				String DESCRIPCION = this.getCampoTextual(request, "DESCRIPCION");
				logger.debug("DESCRIPCION-" + DESCRIPCION);
				Date FINIPREST = AxisBaseService.stringToSqlDate(getHiddenCampoTextual(request, "FINIPREST"));
				Date FFINPREST = AxisBaseService.stringToSqlDate(getHiddenCampoTextual(request, "FFINPREST"));

				Map map = // seleccionar
						pac_iax_produccion.ejecutaPAC_IAX_PRODUCCION__F_SET_PRESTAMOSEG(NRIESGO, new BigDecimal(1),
								IDCUENTA, CTIPCUENTA, CTIPBAN, CTIPIMP, ISALDO, PORCEN, ILIMITE, ICAPMAX, CMONEDA,
								ICAPMAXPOL, ICAPASE, DESCRIPCION, FINIPREST, FFINPREST);
				logger.debug(map);
				formdata.put("OK", "1");
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr103Service - m�todo m_guardar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {

			this.configForm(request, whoami(this));
			cargarListas(request, thisAction);
		}

	}

	private void actualizarPrestamos(HttpServletRequest request) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {
			PAC_IAX_PRODUCCION pac_iax_produccion = new PAC_IAX_PRODUCCION(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			BigDecimal NRIESGO = getCampoNumerico(request, "NRIESGO");
			BigDecimal ICAPMAXPOL = getCampoNumerico(request, "ICAPMAXPOL");
			formdata.put("ICAPMAXPOL", ICAPMAXPOL);
			logger.debug("------ icapmaxpol:" + ICAPMAXPOL);
			ArrayList<HashMap> saldo = (ArrayList<HashMap>) request.getSession().getAttribute("prestamos");
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
					String DESCRIPCION = this.getCampoTextual(request, "DESCRIPCION");
					logger.debug("DESCRIPCION-" + DESCRIPCION);
					Date FINIPREST = AxisBaseService.stringToSqlDate(getHiddenCampoTextual(request, "FINIPREST"));
					Date FFINPREST = AxisBaseService.stringToSqlDate(getHiddenCampoTextual(request, "FFINPREST"));
					Map map = pac_iax_produccion.ejecutaPAC_IAX_PRODUCCION__F_SET_PRESTAMOSEG(NRIESGO,
							new BigDecimal(0), IDCUENTA, CTIPCUENTA, CTIPBAN, CTIPIMP, ISALDO, PORCEN, ILIMITE, ICAPMAX,
							CMONEDA, ICAPMAXPOL, ICAPASE, DESCRIPCION, FINIPREST, FFINPREST);

					logger.debug(map);
					logger.debug("------- resultado guardar:" + map);
					this.tratarRETURNyMENSAJES(request, map);

				}

			}
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr004Service - m�todo m_actualiza", e);

		}

	}

	private void reformatearImporte(HttpServletRequest request) {
		logger.debug("Axisctr103Service reformatearImporte");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		BigDecimal ISALDO = getCampoNumerico(request, "ISALDO");
		formdata.put("ISALDO", ISALDO);

	}

}
