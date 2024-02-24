package axis.service.modal;

import java.math.BigDecimal;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_ADM;
import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.jdbc.PAC_IAX_OPERATIVA_FINV;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

/**
 * Axisadm105Service.java 20/08/2008
 * 
 * @author <a href="lcalvo@csi-ti.com">Luz Calvo</a>
 * @since Java 5.0
 */
public class Axisadm105Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());
	SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE INICIALIZACION
	 *******************************************/
	/*********************************************************************************************************************/

	/**
	 * 
	 * @param request
	 */
	public void m_form(HttpServletRequest request) {
		logger.debug("Axisadm105Service m_form");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		this.formattingNumericValues(request);
		try {

			PAC_IAX_ADM pac_iax_adm = new PAC_IAX_ADM((java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			Map mapa = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(8002024));
			logger.debug(mapa);
			List listaEstErp = (List) tratarRETURNyMENSAJES(request, mapa, false);

			request.setAttribute("listaEstErp", listaEstErp);

			BigDecimal nnumord = getCampoNumerico(request, "NNUMORD");

			mapa = pac_iax_adm.ejecutaPAC_IAX_ADM__F_GET_INFO_PAGOS_OUT(null, nnumord);

			logger.debug(mapa);

			List<Map> l2 = (List<Map>) tratarRETURNyMENSAJES(request, mapa);

			formdata.putAll(l2.get(0));

		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm105Service - m�todo m_form", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));

	}

	/**
	 * 
	 * @param request
	 */
	public void m_nou(HttpServletRequest request) {
		logger.debug("Axisadm105Service m_nou");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		this.formattingNumericValues(request);
		try {

			PAC_IAX_OPERATIVA_FINV pac_axis_operativa = new PAC_IAX_OPERATIVA_FINV(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			// Map mapa = pac_axis_operativa.ejecutaPAC_IAX_OPERATIVA_FINV__F_MONEDAS();
			// logger.debug(mapa);
			// Se cambia el fmonedas para que traiga todas las monedas por RSA
			Map mapa = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES__F_GET_MONEDAS_COND("FILTRO_MONEDAS");
			List listaMonedas = (List) tratarRETURNyMENSAJES(request, mapa, false);

			request.setAttribute("listaMon", listaMonedas);

			String PCMONORI = getCampoTextual(request, "PAR_MONORIG");
			String PCMONDES = getCampoTextual(request, "PAR_MONDEST");

			if (!isEmpty(PCMONORI) && !isEmpty(PCMONDES)) {
				mapa = pac_axis_operativa.ejecutaPAC_IAX_OPERATIVA_FINV__F_NEWCOTIZACION(PCMONORI, PCMONDES);
				logger.debug(mapa);

				List<Map> l2 = (List<Map>) tratarRETURNyMENSAJES(request, mapa);

				formdata.putAll(l2.get(0));
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm105Service - m�todo m_nou", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));

	}

	/**
	 * 
	 * @param request
	 */
	public void m_aceptar(HttpServletRequest request) {
		logger.debug("Axisadm105Service m_aceptar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		this.formattingNumericValues(request);
		try {

			BigDecimal nnumord = getHiddenCampoNumerico(request, "NNUMORD");
			BigDecimal cesterp = getHiddenCampoNumerico(request, "CESTERP");
			BigDecimal nprcerp = getHiddenCampoNumerico(request, "NPRCERP");
			Date ffecpagerp = stringToSqlDate(getHiddenCampoTextual(request, "FFECPAGERP"));
			BigDecimal ivalpagerp = getHiddenCampoNumerico(request, "IVALPAGERP");

			PAC_IAX_ADM pac_iax_adm = new PAC_IAX_ADM((java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			Map mapa = pac_iax_adm.ejecutaPAC_IAX_ADM__F_SET_INFO_PAGO_OUT(nnumord, cesterp, nprcerp, ffecpagerp,
					ivalpagerp);
			logger.debug(mapa);

			BigDecimal ret = (BigDecimal) tratarRETURNyMENSAJES(request, mapa, false);
			logger.debug(ret);

			request.setAttribute("guardado", ret);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm105Service - m�todo m_aceptar", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));

	}
}
