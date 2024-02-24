package axis.service.axis;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_LISTADOS_WM;
import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.model.UsuarioBean;
import axis.util.Constantes;

/**
 * Axisctr500Service.java 15/06/2010
 * 
 * @author <a href="jdelrio@csi-ti.com">Javi del Rio</a>
 * @since Java 5.0
 */
public class Axisctr500Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE INICIALIZACION
	 *******************************************/
	/*********************************************************************************************************************/

	/**
	 * 
	 * @param request
	 */
	@SuppressWarnings("all")
	public void m_form(HttpServletRequest request) {
		logger.debug("Axisctr500Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {

			Map map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTMESES();
			List listaMeses = (List) tratarRETURNyMENSAJES(request, map);
			request.getSession().setAttribute("listaMeses", listaMeses != null ? listaMeses : new ArrayList());
			listaMeses = null;

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr500Service - m�todo m_form", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}

	@SuppressWarnings("all")
	public void m_consultar(HttpServletRequest request) {
		logger.debug("Axisctr500Service m_buscar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {
			Calendar cal = Calendar.getInstance();
			Calendar cal2 = Calendar.getInstance();
			logger.debug("1####" + formdata.get("PANY"));
			// cal.set((int)formdata.get("PANY"),(int)formdata.get("PMES"),1,0,0,0);
			cal.set(Calendar.YEAR, Integer.parseInt(formdata.get("PANY").toString()));
			logger.debug("2####" + formdata.get("PMES"));
			cal.set(Calendar.MONTH, (Integer.parseInt(formdata.get("PMES").toString())) - 1);
			logger.debug("3####TODO BIEN");
			cal.set(Calendar.DAY_OF_MONTH, 1);
			cal2.set(Calendar.YEAR, Integer.parseInt(formdata.get("PANY").toString()));
			cal2.set(Calendar.MONTH, (Integer.parseInt(formdata.get("PMES").toString())) - 1);
			logger.debug("4####TODO BIEN");
			cal2.set(Calendar.DAY_OF_MONTH, cal2.getActualMaximum(Calendar.DAY_OF_MONTH));
			logger.debug("5####TODO BIEN");
			// java.sql.Date FDESDE = isEmpty(this.getCampoTextual(request,"FDESDE") ) ?
			// isEmpty(formdata.get("FDESDE") ) ? null :
			// this.stringToSqlDate(String.valueOf(formdata.get("FDESDE"))) :
			// this.stringToSqlDate(this.getCampoTextual(request,"FDESDE"));
			java.sql.Date FDESDE = new java.sql.Date((cal.getTime()).getTime());
			logger.debug("############ejecuta consultar INICIO" + FDESDE);
			// java.sql.Date FHASTA = isEmpty(this.getCampoTextual(request,"FHASTA") ) ?
			// isEmpty(formdata.get("FHASTA") ) ? null :
			// this.stringToSqlDate(String.valueOf(formdata.get("FHASTA"))) :
			// this.stringToSqlDate(this.getCampoTextual(request,"FHASTA"));
			java.sql.Date FHASTA = new java.sql.Date((cal2.getTime()).getTime());
			// java.sql.Date FHASTA = (Date)cal2.getTime();
			logger.debug("############ejecuta consultar " + FHASTA);
			BigDecimal CDELEGA = isEmpty(this.getCampoNumerico(request, "CDELEGA"))
					? isEmpty(formdata.get("CDELEGA")) ? null : new BigDecimal(String.valueOf(formdata.get("CDELEGA")))
					: this.getCampoNumerico(request, "CDELEGA");
			logger.debug("############ejecuta consultar " + CDELEGA);

			Object MENSAJES = null;

			PAC_IAX_LISTADOS_WM pac_iax_listados_wm = new PAC_IAX_LISTADOS_WM(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map map = pac_iax_listados_wm.ejecutaPAC_IAX_LISTADOS_WM__F_LISTADO_CARTERA(FDESDE, FHASTA, CDELEGA);
			logger.debug(map);

			List LSTCARTERA = (List<Map>) tratarRETURNyMENSAJES(request, map, false);
			if (isEmpty(LSTCARTERA)) {
				// No se han encontrado datos
				AbstractDispatchAction.guardarMensaje(request, "120135", null, Constantes.MENSAJE_INFO);
				request.getSession().setAttribute("abremodal", null);
			} else {
				request.getSession().setAttribute("abremodal", "1");
			}

			request.getSession().setAttribute("REC_LSTCARTERA", LSTCARTERA);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr500Service - m�todo m_consultar", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}

}
