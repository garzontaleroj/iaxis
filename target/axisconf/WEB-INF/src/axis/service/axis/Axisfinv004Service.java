package axis.service.axis;

import java.math.BigDecimal;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.jdbc.PAC_IAX_OPERATIVA_FINV;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.model.UsuarioBean;
import axis.util.Constantes;

/**
 * Axisfinv004Service.java 20/08/2008
 * 
 * @author <a href="lcalvo@csi-ti.com">Luz Calvo</a>
 * @since Java 5.0
 */
public class Axisfinv004Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());
	SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE INICIALIZACION
	 *******************************************/
	/*********************************************************************************************************************/

	/**
	 * M�todo que carga los datos de administraci�n del producto
	 * 
	 * @param request
	 * @param thisAction
	 * @throws Exception
	 */
	private void cargarListas(HttpServletRequest request) throws Exception {
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map listValores = new HashMap();

		// Carga de las PAC_IAX PL/SQL
		PAC_IAX_LISTVALORES pac_axis_listValores = new PAC_IAX_LISTVALORES(
				(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

		// Tipo empresa
		Map map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTEMPRESAS();
		listValores.put("tipo_empresa", (List) tratarRETURNyMENSAJES(request, map));

		request.setAttribute("listValores", listValores);

	}

	/**
	 * 
	 * @param request
	 */
	public void m_form(HttpServletRequest request) {
		logger.debug("Axisfinv004Service m_form");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		try {

			this.cargarListas(request);

			String FECHA = getCampoTextual(request, "FVALOR");
			BigDecimal CEMPRES = getCampoNumerico(request, "CEMPRES");
			if (FECHA == null) { // S�lo si inicializamos si la fecha recogida en pantalla es igual a null
				formdata.put("FVALOR", fcGetFechaActual());
			}
			formdata.put("CEMPRES", CEMPRES);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisfinv004Service - m�todo m_form", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	/*********************************************************************************************************************/
	/************************************************
	 * M�TODOS DE ACTUALIZACI�N
	 *******************************************/
	/*********************************************************************************************************************/

	/**
	 * 
	 * @param request
	 */
	public

			void m_busqueda(HttpServletRequest request) {
		logger.debug("Axisfinv004Service m_form");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {

			BigDecimal CEMPRES = getCampoNumerico(request, "CEMPRES");
			Date FVALOR = stringToSqlDate(getCampoTextual(request, "FVALOR"));
			request.setAttribute("CONSULTA", "YES"); // Hemos hecho una consulta

			if (CEMPRES.intValue() == -1) {
				CEMPRES = null;
			}

			PAC_IAX_OPERATIVA_FINV pac_axis_operativa = new PAC_IAX_OPERATIVA_FINV(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			// Map mapa =
			// pac_axis_operativa.ejecutaPAC_IAX_OPERATIVA_FINV__F_GETENTRADASSALIDASFINV(CEMPRES,FVALOR);
			Map mapa = pac_axis_operativa.ejecutaPAC_IAX_OPERATIVA_FINV__F_GETENTSAL_AMPLIADO(CEMPRES, FVALOR);

			List listaFondosES = (List) tratarRETURNyMENSAJES(request, mapa);

			request.setAttribute("listaFondosES", listaFondosES);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisfinv004Service - m�todo m_busqueda", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	/**
	 * 
	 * @param request
	 */
	public void m_ejecutar(HttpServletRequest request) {
		logger.debug("Axisfinv004Service m_form");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {
			request.setAttribute("CONSULTA", "YES");
			BigDecimal CEMPRES = getCampoNumerico(request, "CEMPRES");

			if (CEMPRES.intValue() == -1) {
				CEMPRES = null;
			}

			Date FVALOR = stringToSqlDate(getCampoTextual(request, "FVALOR"));
			Map axisimprimir_f = new HashMap();

			PAC_IAX_OPERATIVA_FINV pac_axis_operativa = new PAC_IAX_OPERATIVA_FINV(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map mapa = pac_axis_operativa.ejecutaPAC_IAX_OPERATIVA_FINV__F_EXECFILEENTRADASSALIDASFINV(CEMPRES, FVALOR);

			BigDecimal resultado = (BigDecimal) tratarRETURNyMENSAJES(request, mapa);

			if (resultado.intValue() == 0) {

				String nombreArchivoES = (String) mapa.get("PFICHERO_OUT");
				formdata.put("FILE", nombreArchivoES);
				request.setAttribute("OK", "OK");

			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisfinv004Service - m�todo m_busqueda", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	private Date fcGetFechaActual() throws Exception {

		java.util.Date today = new java.util.Date();
		java.sql.Date FECHA_ACTUAL = new java.sql.Date(today.getTime());
		return FECHA_ACTUAL;
	}
}
