package axis.service.modal;

import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_LIQUIDACOR;
import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.mvc.control.modal.Axisctr165Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AjaxContainerService;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

/**
 * AxisXXXModalplantillaAction.java 04/06/2008
 * 
 * @author <a href="rkirchner@csi-ti.com">Roger Kirchner</a>
 * @since Java 5.0
 */
public class Axisctr165Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE INICIALIZACION
	 *******************************************/
	/*********************************************************************************************************************/

	/**
	 * M�todo que se llama al inicio de este flujo. Puede servirnos para inicializar
	 * variables.
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_init(HttpServletRequest request, Axisctr165Action thisAction) {

		try {
			this.formattingNumericValues(request);

		} catch (Exception e) {
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}

	}

	/**
	 * 
	 * @param request
	 */
	@SuppressWarnings("all")
	public void m_form(HttpServletRequest request, Axisctr165Action thisAction) {
		try {
			this.formattingNumericValues(request);
			Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
			Map POB_LIQUIDA = null;
			UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
			BigDecimal SPROCES = getCampoNumerico(request, "SPROCES");
			if (!this.isEmpty(SPROCES)) {
				PAC_IAX_LIQUIDACOR pac_iax_liquidacor = new PAC_IAX_LIQUIDACOR(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
				Map map = pac_iax_liquidacor.ejecutaPAC_IAX_LIQUIDACOR__F_GET_LIQUIDA_OB(SPROCES);
				logger.debug("ejecutaPAC_IAX_LIQUIDACOR__F_GET_LIQUIDA_OB devuelve: " + map);
				if (((BigDecimal) tratarRETURNyMENSAJES(request, map, false)).intValue() == 0) {
					if (!this.isEmpty(map.get("POB_LIQUIDA"))) {
						POB_LIQUIDA = (HashMap) (map.get("POB_LIQUIDA"));
					}
				}
				formdata.put("POB_LIQUIDA", isEmpty(POB_LIQUIDA) ? new HashMap() : POB_LIQUIDA);
			}

			// Recuperem els mesos
			Map mapMesos = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTMESES();
			logger.debug("PAC_IAX_LISTVALORES__F_GET_LSTMESES devuelve: " + mapMesos);
			formdata.put("LSTMESESCARTERA2", tratarRETURNyMENSAJES(request, mapMesos, false));

			// Recuperem el mes i l'any
			GregorianCalendar calendar = new GregorianCalendar();
			int mes = calendar.get(Calendar.MONTH) + 1;
			if (mes == 13) {
				mes = 1;
			}
			formdata.put("NMES", mes);
			formdata.put("NANO", calendar.get(Calendar.YEAR));
			Map cias = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES__F_GET_CIAPRODUCTOS();
			logger.debug("ejecutaPAC_IAX_LISTVALORES__F_GET_CIAPRODUCTOS: devuelve" + cias);
			List listacias = (List) tratarRETURNyMENSAJES(request, cias, false);
			formdata.put("CIAS", listacias);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr165Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	/**
	 * 
	 * @param request
	 */
	@SuppressWarnings("all")
	public void m_nuevo(HttpServletRequest request, Axisctr165Action thisAction) {
		try {
			this.formattingNumericValues(request);
			Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
			UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
			// Recuperem els parametres
			BigDecimal pP_MES = getCampoNumerico(request, "NMES");
			BigDecimal pP_ANYO = getCampoNumerico(request, "NANO");
			String pP_OBSERV = getCampoTextual(request, "OBSERV");
			BigDecimal CCOMPANI = this.getCampoNumerico(request, "CCOMPANI");
			BigDecimal IMPORTE = this.getCampoNumerico(request, "IMPORTE");
			java.sql.Date FINILIQ = AxisBaseService.stringToSqlDate(this.getCampoTextual(request, "FINILIQ"));
			java.sql.Date FFINLIQ = AxisBaseService.stringToSqlDate(this.getCampoTextual(request, "FFINLIQ"));
			PAC_IAX_LIQUIDACOR pac_iax_liquidacor = new PAC_IAX_LIQUIDACOR(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			Map map = pac_iax_liquidacor.ejecutaPAC_IAX_LIQUIDACOR__F_INICIALIZA_LIQUIDACION(pP_MES, pP_ANYO, CCOMPANI,
					FINILIQ, FFINLIQ, IMPORTE, pP_OBSERV);
			logger.debug("ejecutaPAC_IAX_LIQUIDACOR__F_INICIALIZA_LIQUIDACION devuelve: " + map);
			formdata.put("ERROR", tratarRETURNyMENSAJES(request, map, false));
			// Recuperem el mes i l'any
			GregorianCalendar calendar = new GregorianCalendar();
			int mes = calendar.get(Calendar.MONTH) + 1;
			if (mes == 13) {
				mes = 1;
			}
			formdata.put("NMES", mes);
			formdata.put("NANO", calendar.get(Calendar.YEAR));
			formdata.put("SPROLIQ_SEL", map.get("P_SPROCES"));

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr165Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	/**
	 * 
	 * @param request
	 */
	@SuppressWarnings("all")
	public void m_modificar(HttpServletRequest request, Axisctr165Action thisAction) {
		try {
			this.formattingNumericValues(request);
			Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
			UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
			// Recuperem els parametres
			BigDecimal pP_MES = getCampoNumerico(request, "NMES");
			BigDecimal pP_ANYO = getCampoNumerico(request, "NANO");
			String pP_OBSERV = getCampoTextual(request, "OBSERV");
			BigDecimal CCOMPANI = this.getCampoNumerico(request, "CCOMPANI");
			BigDecimal IMPORTE = this.getCampoNumerico(request, "IMPORTE");
			java.sql.Date FINILIQ = AxisBaseService.stringToSqlDate(this.getCampoTextual(request, "FINILIQ"));
			java.sql.Date FFINLIQ = AxisBaseService.stringToSqlDate(this.getCampoTextual(request, "FFINLIQ"));
			BigDecimal pP_SPROCES = getCampoNumerico(request, "SPROCES");
			PAC_IAX_LIQUIDACOR pac_iax_liquidacor = new PAC_IAX_LIQUIDACOR(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			Map map = pac_iax_liquidacor.ejecutaPAC_IAX_LIQUIDACOR__F_MODIFICA_LIQUIDACION(pP_MES, pP_ANYO, CCOMPANI,
					FINILIQ, FFINLIQ, IMPORTE, pP_OBSERV, pP_SPROCES);
			logger.debug("ejecutaPAC_IAX_LIQUIDACOR__F_MODIFICA_LIQUIDACION devuelve: " + map);
			formdata.put("ERROR", tratarRETURNyMENSAJES(request, map, false));
			formdata.put("SPROLIQ_SEL", pP_SPROCES);
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr165Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	public void m_ajax_get_fecha(HttpServletRequest request) {
		logger.debug("Axisctr165Service AJAX m_ajax_get_fecha");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService(request);
		Map tomador = null;

		try {
			BigDecimal CCOMPANI = this.getCampoNumerico(request, "CCOMPANI");
			BigDecimal NMES = this.getCampoNumerico(request, "NMES");
			BigDecimal NANYO = this.getCampoNumerico(request, "NANYO");

			PAC_IAX_LIQUIDACOR pac_iax_liquidacor = new PAC_IAX_LIQUIDACOR(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map map = pac_iax_liquidacor.ejecutaPAC_IAX_LIQUIDACOR__F_PROPUESTA_FECHAINICIO(CCOMPANI, NMES, NANYO);
			logger.debug(map);

			// Guardamos lo que sea que haya devuelto al contenedor Ajax.
			Object[] resultadoAjax = (Object[]) ajax.rellenarPlAContenedorAjax(map, new String[] { "P_FINILIQ" });
			logger.debug(resultadoAjax[0]);
			if (resultadoAjax[0].equals(new BigDecimal(0))) {
				Map P_FINILIQ = new HashMap();

				// logger.debug(new java.sql.Date( new
				// SimpleDateFormat("dd/MM/yyy").parse(String.valueOf(resultadoAjax[1])).getTime()));

				SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
				P_FINILIQ.put("FINILIQ", sdf.format((java.sql.Date) resultadoAjax[1]));
				List RESULTADO = new ArrayList();
				RESULTADO.add(P_FINILIQ);

				ajax.guardarContenidoFinalAContenedorAjax(RESULTADO);

			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr165Service - m�todo m_ajax_get_fecha", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {

			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());

		}
	}

}
