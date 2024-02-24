package axis.service.modal;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_LISTADO_CARTERA;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

public class AxisexporterService extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	public void m_axisctr162export(HttpServletRequest request) {
		this.formattingNumericValues(request);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {
			logger.debug("AxisexporterService m_axisctr162export");

			java.sql.Date FDESDE = AxisBaseService.stringToSqlDate(this.getCampoTextual(request, "FDESDE"));
			java.sql.Date FHASTA = AxisBaseService.stringToSqlDate(this.getCampoTextual(request, "FHASTA"));

			/*
			 * Calendar cal = Calendar.getInstance(); Calendar cal2 =
			 * Calendar.getInstance(); cal.set(Calendar.YEAR,
			 * Integer.parseInt(getCampoNumerico(request, "PANY").toString()));
			 * cal.set(Calendar.MONTH,
			 * (Integer.parseInt(getCampoNumerico(request,"PMES").toString()))-1);
			 * cal.set(Calendar.DAY_OF_MONTH, 1); cal2.set(Calendar.YEAR,
			 * Integer.parseInt(getCampoNumerico(request,"PANY").toString()));
			 * cal2.set(Calendar.MONTH,
			 * (Integer.parseInt(getCampoNumerico(request,"PMES").toString()))-1);
			 * cal2.set(Calendar.DAY_OF_MONTH,
			 * cal2.getActualMaximum(Calendar.DAY_OF_MONTH)); java.sql.Date FDESDE = new
			 * java.sql.Date((cal.getTime()).getTime()); java.sql.Date FHASTA = new
			 * java.sql.Date((cal2.getTime()).getTime());
			 */

			Object MENSAJES = null;
			BigDecimal compania = null;
			BigDecimal CLISTADO = getCampoNumerico(request, "CLISTADO");
			BigDecimal sproduc = null;

			if (!isEmpty(getCampoNumerico(request, "COMPANIA"))) {
				compania = new BigDecimal(getCampoNumerico(request, "COMPANIA").toString());
			}
			if (!isEmpty(getCampoNumerico(request, "SPRODUC"))) {
				sproduc = new BigDecimal(getCampoNumerico(request, "SPRODUC").toString());
			}
			logger.debug("############compania + sproduc" + compania + " + " + sproduc);

			if (request.getParameter("paginar") == null) {
				PAC_IAX_LISTADO_CARTERA pac_iax_listado_cartera = new PAC_IAX_LISTADO_CARTERA(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
				Map map = null;

				if (CLISTADO.intValue() == 1) {
					map = pac_iax_listado_cartera.ejecutaPAC_IAX_LISTADO_CARTERA__F_LISTADO_COMPARA_CARTERAS(compania,
							sproduc, FDESDE, FHASTA);
				} else if (CLISTADO.intValue() == 2) {
					map = pac_iax_listado_cartera.ejecutaPAC_IAX_LISTADO_CARTERA__F_LISTADO_POLIZAS_SINCARTERA(compania,
							sproduc, FDESDE, FHASTA);
				}
				logger.debug("map listado_compara_carteras" + map);

				List LSTCARTERA = (List<Map>) tratarRETURNyMENSAJES(request, map, false);
				if (isEmpty(LSTCARTERA)) {
					// No se han encontrado datos
					AbstractDispatchAction.guardarMensaje(request, "120135", null, Constantes.MENSAJE_INFO);
				}

				// formdata.put("REC_LSTCARTERA", LSTCARTERA) ;
				// Podemos dejar el fromdata poniendo el paginar a null en la JSP, se mantiene
				// la session ya que en caso de muchos registros baja mucho el rendimiento al
				// exportar.
				request.getSession().setAttribute("REC_LSTCARTERA", LSTCARTERA);
			}

		} catch (Exception e) {
			logger.error("Error en el servicio AxisctrexporterService - m�todo m_axisctr162export", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		} finally {

			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}

	}

	public void m_axisctr500export(HttpServletRequest request) {
		logger.debug("AxisexporterService m_axisctr500export");
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	public void m_axisctr501export(HttpServletRequest request) {
		logger.debug("AxisexporterService m_axisctr501export");
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	public void m_axisctr502export(HttpServletRequest request) {
		logger.debug("AxisexporterService m_axisctr502export");
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

}
