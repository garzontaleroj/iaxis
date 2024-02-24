//Revision:# cRsmq2vmbtKaCN1O4ioKkA== #
package axis.service.modal;

import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_LISTVALORES_SIN;
import axis.mvc.control.modal.Axissin067Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

public class Axissin067Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());
	SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");

	/**
	 * Método que carga los datos de administración del producto
	 * 
	 * @param request
	 * @param thisAction
	 * @throws Exception
	 */
	private void cargarListas(HttpServletRequest request, Axissin067Action thisAction) throws Exception {
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		// BigDecimal CEMPRES = new
		// BigDecimal(request.getSession().getAttribute("CEMPRES").toString());
		PAC_IAX_LISTVALORES_SIN pac_axis_listValores_SIN = new PAC_IAX_LISTVALORES_SIN(
				(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
		try {
			BigDecimal CEMPRES = getCampoNumerico(request, "CEMPRES");

			List getCunitraIni = this.dbGetCunitraIni(request, usuario, CEMPRES);
			formdata.put("lstcunitra", (List) getCunitraIni);

			BigDecimal SPRODUC = getCampoNumerico(request, "SPRODUC");
			BigDecimal SSEGURO = getCampoNumerico(request, "SSEGURO");
			BigDecimal CCAUSIN = getCampoNumerico(request, "CCAUSIN");
			BigDecimal CMOTSIN = getCampoNumerico(request, "CMOTSIN");
			BigDecimal CACTIVI = getCampoNumerico(request, "CACTIVI");
			BigDecimal CTRAMTE = getCampoNumerico(request, "CTRAMTE");
			BigDecimal CESTSIN = getCampoNumerico(request, "CESTSIN");

			Map map = pac_axis_listValores_SIN.ejecutaPAC_IAX_LISTVALORES_SIN__F_GET_TIPTRAMI(SSEGURO, CACTIVI, CCAUSIN,
					CMOTSIN, SPRODUC, "CONS", CTRAMTE, CESTSIN, new java.math.BigDecimal(0));// OGQ Adicionar para
																								// sesgar lista.

			formdata.put("tipo_tramitacion", (List) tratarRETURNyMENSAJES(request, map));
		} catch (Exception e) {
			logger.error("Error en el método Axissin067 cargarCombos", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {

			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));

		}

	}

	/**
	 * Método que se llama al inicio de este flujo. Realiza la carga inicial de los
	 * datos de los combos.
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_form(HttpServletRequest request, Axissin067Action thisAction) {
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		PAC_IAX_LISTVALORES_SIN pac_axis_listvalores_sin = new PAC_IAX_LISTVALORES_SIN(
				(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

		try {

			String CUNITRA = getCampoTextual(request, "CUNITRA");

			this.cargarListas(request, thisAction);

			if (CUNITRA != null) {

				Map result = pac_axis_listvalores_sin.ejecutaPAC_IAX_LISTVALORES_SIN__F_GET_PROCESOS_TRAMITADOR(CUNITRA,
						new BigDecimal(1), null);
				List listaProcesos = (List) tratarRETURNyMENSAJES(request, result);
				formdata.put("procesosTramita", !isEmpty(listaProcesos) ? listaProcesos : new ArrayList());
			}

			// INI IAXIS 4961 AABG: Ajuste para total de registros
			String SUMPROCESOS = getCampoTextual(request, "SUMPROCESOS");
			if (SUMPROCESOS == null || SUMPROCESOS.equals("")) {
				formdata.put("SUMPROCESOS", "0");
			}
			// FIN IAXIS 4961 AABG: Ajuste para total de registros

		} catch (Exception e) {
			logger.error("Error en el servicio Axissin067Service - método m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	public void m_cargar(HttpServletRequest request, Axissin067Action thisAction) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		Map result;
		PAC_IAX_LISTVALORES_SIN pac_axis_listvalores_sin = new PAC_IAX_LISTVALORES_SIN(
				(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

		String CUNITRA = getCampoTextual(request, "CTRAMITAD_SEL") == null ? getCampoTextual(request, "CUNITRA")
				: getCampoTextual(request, "CTRAMITAD_SEL");
		String CTRAMIT = getCampoTextual(request, "CTRAMIT");
		/* IAXIS-2171 AABC se realizan cambios para visualizar las ciudades */
		try {
			/*
			 * if(CTRAMIT.equals("0")) result =pac_axis_listvalores_sin.
			 * ejecutaPAC_IAX_LISTVALORES_SIN__F_GET_PROCESOS_TRAMITADOR(CUNITRA, new
			 * BigDecimal(3), CTRAMIT); else
			 */
			// INI IAXIS 4961 AABG: Ajuste para total de registros
			int total = 0;
			if (CTRAMIT != null && Integer.parseInt(CTRAMIT) >= 0) {

				result = pac_axis_listvalores_sin.ejecutaPAC_IAX_LISTVALORES_SIN__F_GET_PROCESOS_TRAMITADOR(CUNITRA,
						new BigDecimal(2), CTRAMIT);

				List listaProcesos = (List) tratarRETURNyMENSAJES(request, result);

				if (listaProcesos != null) {
					for (int i = 0; i < listaProcesos.size(); i++) {
						Map data = new HashMap();
						data = (Map) listaProcesos.get(i);
						total = total
								+ (data.get("PROCESOS") != null ? Integer.parseInt(data.get("PROCESOS").toString())
										: 0);
					}
				}

				formdata.put("procesosTramitaCiu", !isEmpty(listaProcesos) ? listaProcesos : new ArrayList());
			} else {
				total = 0;
				formdata.put("procesosTramitaCiu", new ArrayList());
			}
			formdata.put("SUMPROCESOS", Integer.toString(total));
			// FIN IAXIS 4961 AABG: Ajuste para total de registros
			formdata.put("CTRAMITAD_S", CUNITRA);

			// INI IAXIS 4961 AABG: Ajuste para precargar combo
			formdata.put("CTRAMIT_S", CTRAMIT);
			// FIN IAXIS 4961 AABG: Ajuste para precargar combo

		} catch (Exception e) {
			logger.error("Error en el servicio Axissin067Service - método m_cargar", e);
			thisAction.guardarMensaje(request, "1000052", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);

		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	public void m_init(HttpServletRequest request, Axissin067Action thisAction) {
		try {

		} catch (Exception e) {
			logger.error("Error en el servicio Axissin068Service - método m_init", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	/**
	 * Método que llama a la función pl correspondiente para cargar las unidades de
	 * tramitacion.
	 * 
	 * @param request
	 * @param usuario
	 * @return
	 * @throws Exception
	 */
	private List dbGetCunitraIni(HttpServletRequest request, UsuarioBean usuario, BigDecimal CCEMPRES)
			throws Exception {
		Map m = new PAC_IAX_LISTVALORES_SIN((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_LISTVALORES_SIN__F_GET_CUNITRA(CCEMPRES);
		return (List) tratarRETURNyMENSAJES(request, m);

	}
}
